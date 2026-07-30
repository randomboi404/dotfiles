use std::env;
use std::error::Error;
use std::io::{Error as IOError, ErrorKind};
use std::process::Command;
use brightness::{blocking::brightness_devices, blocking::Brightness};
use volumecontrol::AudioDevice;

const BRIGHTNESS_OFFSET: i32 = 10;
const AUDIO_OFFSET: i32 = 5;
const MISSING_VALUE_ERR: &str = "Missing value to set in %";

fn set_bluetooth(powered: bool) -> Result<(), Box<dyn Error>> {
    let state = if powered { "on" } else { "off" };
    let status = Command::new("bluetoothctl")
        .args(["power", state])
        .status()?;

    if !status.success() {
        return Err("Failed to change Bluetooth state via bluetoothctl".into());
    }
    Ok(())
}

fn toggle_bluetooth() -> Result<(), Box<dyn Error>> {
    let output = Command::new("bluetoothctl")
        .args(["show"])
        .output()?;

    let stdout = String::from_utf8_lossy(&output.stdout);
    let is_powered = stdout.contains("Powered: yes");

    set_bluetooth(!is_powered)
}

fn handle_bluetooth(args: &[String]) -> Result<(), Box<dyn Error>> {
    if args.is_empty() {
        return toggle_bluetooth();
    }

    match args[0].as_str() {
        "on" => set_bluetooth(true)?,
        "off" => set_bluetooth(false)?,
        "toggle" => toggle_bluetooth()?,
        _ => display_correct_usage()?
    }

    Ok(())
}

fn set_brightness(brightness_value: u32) -> Result<(), brightness::Error> {
    for device in brightness_devices() {
        let dev = device?;
        dev.set(brightness_value)?;
    }

    Ok(())
}

fn change_brightness(brightness_value: i32) -> Result<(), brightness::Error> {
    for device in brightness_devices() {
        let dev = device?;

        let current_brightness = dev.get()? as i32;
        let new_brightness = (current_brightness + brightness_value).clamp(0, 100) as u32;

        dev.set(new_brightness)?;
    }

    Ok(())
}

fn handle_brightness(args: &[String]) -> Result<(), Box<dyn Error>> {
    if args.is_empty() {
        return display_correct_usage();
    }

    match args[0].as_str() {
        "inc" => change_brightness(BRIGHTNESS_OFFSET)?,
        "dec" => change_brightness(-BRIGHTNESS_OFFSET)?,
        "set" => set_brightness(args.get(1).expect(MISSING_VALUE_ERR).parse::<u32>()?)?,
        _ => display_correct_usage()?
    }

    Ok(())
}

fn change_audio(audio_value: i32) -> Result<(), volumecontrol::AudioError> {
    let device = AudioDevice::from_default()?;

    let current_audio_value = device.get_vol()? as i32;
    let new_audio_value = (current_audio_value + audio_value).clamp(0, 100) as u8;

    device.set_vol(new_audio_value)
}

fn set_audio(audio_value: u8) -> Result<(), volumecontrol::AudioError> {
    let device = AudioDevice::from_default()?;
    device.set_vol(audio_value)
}

fn toggle_audio_mute() -> Result<(), volumecontrol::AudioError> {
    let device = AudioDevice::from_default()?;
    let is_muted = device.is_mute()?;
    device.set_mute(!is_muted)
}

fn handle_audio(args: &[String]) -> Result<(), Box<dyn Error>> {
    if args.is_empty() {
        return display_correct_usage();
    }

    match args[0].as_str() {
        "inc" => change_audio(AUDIO_OFFSET)?,
        "dec" => change_audio(-AUDIO_OFFSET)?,
        "mute-tg" => toggle_audio_mute()?,
        "set" => set_audio(args.get(1).expect(MISSING_VALUE_ERR).parse::<u8>()?)?,
        _ => display_correct_usage()?
    }

    Ok(())
}

fn display_correct_usage() -> Result<(), Box<dyn Error>> {
    let Some(program_name) = env::args().next() else {
        return Err(Box::new(IOError::new(
                ErrorKind::InvalidInput,
                "Cannot get the name of executable."
        )));
    };

    eprintln!(
r#"Example usage:
{program_name} bt on/off            # Turns bluetooth on / off
{program_name} bt (toggle)          # Toggles bluetooth on / off
{program_name} bright inc/dec       # Increases / Decreases brightness
{program_name} bright set 10        # Sets brightness to 10%
{program_name} audio mute-tg        # Toggles audio mute
{program_name} audio inc/dec        # Increases / Decreases audio
{program_name} audio set 10         # Sets audio to 10%

Note: (*) parentheses indicate that the said keyword is optional"#
    );
    Ok(())
}

fn main() -> Result<(), Box<dyn Error>> {
    let args: Vec<String> = env::args().collect();

    match args.len() {
        1 | 5.. => display_correct_usage()?,
        _ => {
            match args[1].to_lowercase().as_str() {
                "bright" => handle_brightness(&args[2..])?,
                "audio" => handle_audio(&args[2..])?,
                "bt" => handle_bluetooth(&args[2..])?,
                _ => display_correct_usage()?
            }
        }
    }

    Ok(())
}
