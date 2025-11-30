# py empty

Empty Python Project Structure

## Credits

Thanks to Arjan Codes! For lots of Great content and as a starting place for many of the ideas here.

- [GitHub](https://github.com/ArjanCodes)
- [Site](https://www.arjancodes.com/)

> If it is right, he gets the credit, if it is wrong, that's on me.

This is modified to suit my team's quirks and preferences.

Hope it helps.

## Setting up for python

1. [Install VS Code](https://code.visualstudio.com/)
2. Verify Code is installed correctly:

```powershell
code --version
```

```text
1.106.1
cb1933bbc38d329b3595673a600fab5c7368f0a7
x64
# 1. Version, 2. Checksum, 3. Processor Target
```

3. [Install Python](https://www.python.org/downloads/)
   a. We always agree on the "pinned" version of python to use
   b. That version is specified in the `.python-version` file in the root of this template as `{major}.{minor}` we encourage the latest patch version

4. Check to python (and pip versions):

```powershell
python --version ; pip --version
```

```text
Python 3.14.0
pip 25.2
```

5. Install UV, Black, etc.

```powershell
.\scripts\install-tools.ps1
```

## For your project

1. Make your code folder and populate it from the repo
   a. For our projects its always `c:\code` on Windows or `~/code` on Linux.
   b. Pull your repo down (note: we always create a repo in GitHub 1st, or use an existing sandbox)
   c. Switch to it

2. Copy guts of this project into it as a template

3. Install Python Extensions required by our team (`scripts\install-python-extensions.ps1`) plus any others we like as individuals

4. Create our virtual environment with `scripts\new-venv.ps1` which scrubs away old versions and installs and activates a clean one (see previous comment)
