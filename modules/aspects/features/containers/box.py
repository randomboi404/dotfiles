import os
import sys
import hashlib
import subprocess
from shutil import which

# Get base container name
baseContainer = os.getenv("BASE_CONTAINER", "base-container")

# Get command line arguments
args = sys.argv

# Check if podman exists
if not which("podman"):
    print("podman is not installed. Exiting...")
    sys.exit(1)

# Check if distrobox exists
if not which("distrobox"):
    print("distrobox is not installed. Exiting...")
    sys.exit(1)


if len(args) == 1:
    # Check if base container exists
    result = subprocess.run(["podman", "container", "exists", baseContainer])
    if result.returncode:
        print(f"{baseContainer} container does not exist.")

        choice = input("Create it? [Y/n]: ")
        if choice.lower() == 'n':
            sys.exit(1)

        # Assemble the base container
        ini_path = os.path.expanduser("~/.config/distrobox/containers.ini")
        _ = subprocess.run([
            "distrobox", "assemble", "create", "--file", ini_path
        ])

    # Enter the container
    os.execvp("distrobox", ["distrobox", "enter", baseContainer])

if args[1] == '-c':
    print("Cleaning old isolated containers...")

    # Fetch list of containers
    proc = subprocess.run(
            ["podman", "ps", "-aq", "--filter", "name=^con-"],
            capture_output=True,
            text=True
    )
    containers = proc.stdout.split()

    if containers:
        rm_proc = subprocess.run(["podman", "rm", "-f"] + containers)
        sys.exit(rm_proc.returncode)
    else:
        print("No old containers found.")
        sys.exit(0)

if args[1] != '-h':
    print(f"""
          Invalid arguments passed.
          Usage:
          {args[0]}
          {args[0]} -h
          {args[0]} -c
    """)
    sys.exit(1)

# Get current directory path
curDir = os.getcwd()

# Exit if current directory cannot be found
if not curDir:
    print("$PWD not set. Exiting...")
    sys.exit(1)

# Hash current directory path
hash = hashlib.new("sha256")
hash.update(curDir.encode())
hashStr = hash.hexdigest()

# Only use the first 6 characters of the hash string
conName = "con-" + hashStr[:6]

# Create an isolated home directory
userHome = os.path.expanduser("~")
isolatedHome = os.path.join(
        userHome,
        ".local",
        "share",
        "containers_home",
        conName
)
os.makedirs(isolatedHome, exist_ok=True)

# Check if container already exists
result = subprocess.run(["podman", "container", "exists", conName])
if result.returncode:
    print(f"Creating new isolated container '{conName}'...")
    _ = subprocess.run([
        "distrobox", "create",
        "--name", conName,
        "--image", "archlinux:latest",
        "--unshare-all",
        "--home", isolatedHome,
        "--volume", f"{curDir}:{curDir}",
        "--no-entry"
    ])

# Enter the container
os.execvp("distrobox", ["distrobox", "enter", conName])
