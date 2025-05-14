# J


```bash
# create default folder for configs
mkdir ~/config

# create default folder for local only changes
mkdir ~/config/local
touch ~/config/local/local.sh

# create local temp
mkdir ~/config/temp

# create a workspace
mkdir ~/workspace

# Create a PAT (Personal Access Token) https://github.com/settings/personal-access-tokens
# Metadata is selected by default
# Check Contents -> read and write

# Clone repo
cd ~/config
git clone https://USER_HERE:PAT_HERE@github.com/jotafeldmann/j.git

#Example
git clone https://jotafeldmann:github_pat_123456@github.com/jotafeldmann/j.git


# Install
code ~/.bashrc
# or
nano ~/.zshrc
```

Go to the last line and the parameters at [j.sh](./j.sh), then:

```bash
# back to terminal run
source ~/.bashrc
# or
source ~/.zshrc

# init
j init

```
