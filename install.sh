#!/bin/bash

echo "Installing my-scripts..."

cd "$HOME"


# check if folder is empty
if [ "$(ls -A $HOME/bin)" ]; then
    echo "Repository already exists!"
    git pull
else
    echo "Cloning repository..."
    git clone https://github.com/cophilot/MyScripts.git
    # rename folder to bin
    mv MyScripts bin
fi

echo "Adding to Path..."
# check if 
export PATH="$HOME/bin:$PATH"
echo $PATH

# add support for zsh
if [ -f ~/.zshrc ]; then
    if grep -q "my-scripts update q" ~/.zshrc; then
        echo "Startup script already exists!"
    else
        echo "Adding startup script..."
        # add line break
        echo "" >> ~/.zshrc
        echo "my-scripts update q" >> ~/.zshrc
        echo "" >> ~/.zshrc
        echo "PATH=\"$HOME/bin:\$PATH\"" >> ~/.zshrc
    fi
fi
if [ -f ~/.bashrc ]; then
    if grep -q "my-scripts update q" ~/.bashrc; then
        echo "Startup script already exists!"
    else
        echo "Adding startup script..."
        echo "" >> ~/.bashrc
        echo "my-scripts update q" >> ~/.bashrc
        echo "" >> ~/.bashrc
        echo "PATH=\"$HOME/bin:\$PATH\"" >> ~/.bashrc
    fi
fi

# check if my-scripts is a command now
if [ -z "$(command -v my-scripts)" ]; then
    echo "Something went wrong ❌"
    exit 1
fi
echo "Done ✅"
