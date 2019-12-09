#!/bin/bash

echo "Mac OS - Setup"

echo "Checking webassembly - Prerequisite"

if gcc --version > /dev/null; then
	echo "gcc is already installed."
	echo "Checking git"
	if git --version > /dev/null; then
		echo "git is already installed."
		echo "Checking cmake"
		if cmake --version > /dev/null; then
			echo "cmake is already installed."
			echo "Checking python"
			if python3 --version > /dev/null; then
				echo "python is already installed."
				echo "Prerequisite Setup is complete"

				echo "Starting to install webassembly"

				echo "Download webassembly repository"

				git clone https://github.com/emscripten-core/emsdk.git

				echo "Change into this directory"

				cd emsdk

				echo "Install latest build"

				python3 ./emsdk.py install latest

				echo "Activate latest build"

				python3 ./emsdk.py active latest

				echo "Set the PATH automatically"

				source ./emsdk_env.sh
			else
				echo "python is not installed"
				echo "Now we install python with Homebrew"

				brew install python

				echo "Now we install pip"

				curl -O http://python-distribute.org/distribute_setup.py
				python distribute_setup.py

				curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
				python get-pip.py
			fi
		else
			echo "cmake is not installed"
			echo "Please install 'cmake' from the website."
		fi
	else
		echo "git is not installed"
		echo "Now we install git with Homebrew"
		brew install git
	fi
else
	echo "Prerequisite Setup is not complete - Please check the missing options"
fi
