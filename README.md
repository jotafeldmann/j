# J

Personal common utils for me, everywhere.

⚠️ Remember: this is a public repo, do not commit sensitive data.

## How to install

```bash
# Create default folder for configs
mkdir ~/config

# Create default folder for local only changes
mkdir ~/config/local
touch ~/config/local/local.sh

# Create local temp
mkdir ~/config/temp

# Create a workspace
mkdir ~/workspace

# Clone repo

## Read only
git clone https://github.com/jotafeldmann/j.git

## Read and write
# Create a PAT (Personal Access Token) https://github.com/settings/personal-access-tokens
# Option "Metadata" -> selected by default
# Option "Contents" -> read and write
cd ~/config
git clone https://USER_HERE:PAT_HERE@github.com/jotafeldmann/j.git

# Example
git clone https://jotafeldmann:github_pat_123456@github.com/jotafeldmann/j.git


# Install
code ~/.bashrc
# or
nano ~/.zshrc
```

Go to the last line and add the parameters at [j.sh](./j.sh), then:

```bash
# Back to terminal and run
source ~/.bashrc
# or
source ~/.zshrc

# Init
j init

```
