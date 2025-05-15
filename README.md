# J

Personal common utils for me, everywhere.

⚠️ Remember: this is a public repo, do not commit sensitive data.

## How to install
Optional: initialize basic folder structure with [utils/j_install.sh](./utils/j_install.sh)
```bash
# Copy script and run
. utils/j_install.sh
```

J installation:
```bash
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


# Add to shell
code ~/.bashrc
# or
nano ~/.zshrc
```

Go to the last line and add the parameters as described on [j.sh](./j.sh), then:

```bash
# Back to terminal and run
source ~/.bashrc
# or
source ~/.zshrc

# Check
j 
```

## Ideas
- **Sync common settings**
  - Sync vscode and other settings in some repo
  - Then sync across different hosts 
- **Check updates**
  - Maybe a light way to save some date
  - Then for each load check current date 
  - If current date is equal to the saved one, stop
  - If current date is after the saved one
  - Then execute some git operation to check
  - If there is a update, show a message
  - Update the saved date
- **Convert to Python**
  - Less dependent of shell flavor (bash x zsh) or OS
  - Show case a personal project with frequent updates
- **Update and sync local configs**
  - Using local private repo
  - Git add and commit local configurations and temp folders/files
  - In case of disaster recover using a common interface
