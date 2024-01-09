#!/bin/bash

echo "Installing my-scripts..."

cd "$HOME"


# check if folder is empty
if [ "$(ls -A $HOME/bin)" ]; then
    echo "Repository already exists!"
    git pull
else
    echo "Cloning repository..."
    git clone https://github.com/phil1436/MyScripts.git
    # rename folder to bin
    mv MyScripts bin
fi

echo "Adding to Path..."
# check if 
export PATH="$HOME/bin:$PATH"
echo $PATH

# check if the command is already in the file
if grep -q "my-scripts update q" ~/.bashrc; then
    echo "Startup script already exists!"
else
    echo "Adding startup script..."
    echo "my-scripts update q" >> ~/.bashrc
fi

# check if my-scripts is a command now
if [ -z "$(command -v my-scripts)" ]; then
    echo "Something went wrong ❌"
    exit 1
fi
echo "Done ✅"
