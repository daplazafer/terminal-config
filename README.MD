# macOS Terminal Setup Script

This script automates the setup of your macOS development environment. It uses a `bash` script to install and configure essential tools and applications.

## Features

- Checks for and installs Homebrew if not already installed.
- Installs Zsh if it's not the default shell.
- Installs Warp terminal.
- Installs Starship prompt.
- Installs fonts from a specified directory.
- Copies Starship configuration to the appropriate location.
- Installs LSD.
- Appends Zsh configuration to the existing `~/.zshrc`.
- Sets Zsh as the default shell.

## Prerequisites

- macOS
- Command-line tools (such as `curl` and `git`)

## Usage

1. **Clone the repository** or navigate to the directory containing the `setup.sh` script.

2. **Run the script using `bash`**:

    ```bash
    ./setup.sh
    ```

   This will execute all the steps in the script.

## File Structure

- `setup.sh`: Contains all the commands to set up the environment.
- `fonts/`: Directory containing font files to be installed.
- `starship/starship.toml`: Starship configuration file.
- `zshrc`: Zsh configuration file to be appended to `~/.zshrc`.

## Notes

- Ensure you have administrative privileges as some commands may require `sudo`.
- Customize the `setup.sh` according to your preferences before running it.

## Warp Interface Configuration

For advanced configurations in Warp, follow these steps using the provided images for reference:

1. **Open Warp**:
   - Launch the Warp terminal from your Applications folder or Dock.

2. **Change the Theme**:
   - Go to `Settings` > `Appearance`.
   - Click on the theme selection area:
     ![Click to change theme](https://i.imgur.com/Az5exOm.png)
   - In the sidebar, select the desired theme (I recommend "Iterm", but you can also choose "Outrun" or "Warp"):
     ![Select Theme](https://imgur.com/yQYdzVF.png)

3. **Configure the Prompt**:
   - Scroll down to the `Prompt` section.
   - Click on it and select `PS1`:
     ![Prompt Configuration](https://imgur.com/5uWbzmy.png)

4. **Set the Font**:
   - Scroll down to the `Text` section.
   - Click on `View all available system fonts`.
   - Select `Hack Nerd Font` from the list:
     ![Select Hack Nerd Font](https://imgur.com/GkSypAS.png)

### Configure VSCode Terminal Settings

To configure Visual Studio Code to use Hack Nerd Font for the integrated terminal, set `zsh` as the default profile, and set `iTerm.app` as the external terminal, follow these steps:

1. **Open VSCode**:
   - Launch Visual Studio Code.

2. **Open the `settings.json` File**:
   - Go to `Code` > `Preferences` > `Settings` (or `File` > `Preferences` > `Settings`).
   - Click the `{}` icon in the top right corner to open the `settings.json` file directly.

3. **Add the Following Configurations**:
   - Add or modify the following lines in the `settings.json` file:

     ```json
     {
         "terminal.integrated.fontFamily": "Hack Nerd Font",
         "terminal.integrated.defaultProfile.osx": "zsh",
         "terminal.external.osxExec": "iTerm.app"
     }
     ```

   - Ensure that these lines are added within the existing JSON object and that the JSON syntax is correct.

4. **Save the `settings.json` File**:
   - Save the changes to the `settings.json` file.
   