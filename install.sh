# List of files to be symlinked
FILES="vimrc zshrc tmux.conf"
# Location of the backup directory
BACKUPDIR=~/dotfiles_backup/
# Install script(this) directory
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Scripts directory
SCRIPTSDIR=~/scripts

# Create backup folder if it doesn't exist
if [ ! -d $BACKUPDIR ]; then
    echo "Creating backup directory at $BACKUPDIR"
    mkdir -p $BACKUPDIR
fi

# Install dotfiles
for file in $FILES; do
    # If the current file doesn't exist
    if [ ! -f ./$file ]; then
        echo "File $file not found"
        continue
    fi

    # If the file exists in ~/, move it to the backup folder
    if [ -f ~/.$file ]; then
        echo "Found ~/.$file, backing up to $BACKUPDIR"
        mv ~/.$file $BACKUPDIR
    fi

    # Symlink the file into ~/
    echo "Symlinking $BASEDIR/$file to ~/.$file"
    ln -s $BASEDIR/$file ~/.$file
done

# Install scripts folder
if [ ! -d $SCRIPTSDIR ]; then
    echo "Symlinking scripts folder to $SCRIPTSDIR"
    ln -s $BASEDIR/scripts $SCRIPTSDIR
else
    echo "Scripts folder already exists, please move it"
fi
