# J


```bash
# create default folder for configs
mkdir ~/config
cd ~/config

# create default folder for local only changes
mkdir local
touch local/local.sh

# create local temp
mkdir j/temp

# Create a PAT (Personal Access Token) https://github.com/settings/personal-access-tokens
# Metadata is selected by default
# Check Contents -> read and write

# Clone repo
git clone https://github.com/jotafeldmann/j

# Install
code ~/.bashrc
# or
nano ~/.zshrc

# go to last line and add
# Check parameters at j.sh
source ~/config/j/j.sh ~/config/j ~/.bashrc ~/config/local/local.sh ~/config/local

# back to terminal run
source ~/.bashrc
# or
source ~/.zshrc
```

