# NVM Setup Script

Welcome to the NVM Setup Script repository! This script helps you set up Node Version Manager (nvm) and install the latest Long Term Support (LTS) version of Node.js easily.

## Features

- Automatically removes any existing `nvm` installation.
- Installs `nvm`.
- Updates `.bashrc` to load `nvm` and ensure it is ready to use.
- Optionally installs the latest LTS version of Node.js.
- Supports a "fast mode" for minimal output during the setup.

## Usage

### Cloning the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/Alex-724/nvm-setup-script.git
cd nvm-setup-script
```

### Running the Script

Make the `start.sh` script executable:

```bash
chmod +x start.sh
```

#### Normal Mode

Run the script in normal mode to see detailed log output:

```bash
./start.sh
```

#### Fast Mode

Run the script in fast mode to suppress log output until the final message:

```bash
./start.sh fast
```

## Script Details

The `start.sh` script performs the following actions:

1. **Removes any existing `nvm` installation**:
   ```bash
   rm -rf ~/.nvm
   ```

2. **Installs `nvm`**:
   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
   ```

3. **Updates `.bashrc` to load `nvm`**:
   ```bash
   sed -i '/NVM_DIR/d' ~/.bashrc
   echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
   echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
   echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
   ```

4. **Provides final instructions**:
   ```bash
   echo "Please restart your terminal session or run 'source ~/.bashrc' to load nvm."
   echo "You can then install the latest LTS version of Node.js with 'nvm install --lts'."
   ```

## Credits

Script by [Alex-724](https://github.com/Alex-724).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.