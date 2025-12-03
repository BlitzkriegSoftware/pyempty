# py empty

Empty Python Project Structure + Tools for a Quick Consistant Start

- [py empty](#py-empty)
  - [Motivations](#motivations)
  - [Credits](#credits)
  - [Setting up for python](#setting-up-for-python)
  - [For your project](#for-your-project)
  - [Sidebar: Generating a pip compatible requirements files](#sidebar-generating-a-pip-compatible-requirements-files)
- [Contributing and Issues](#contributing-and-issues)

## Motivations

- We got tired when jumping for project to project, language to language, etc. in stuggling to remember things

- We wanted a based of standards the whole team could agree on and have be enforced, especially code/folder structure

- We wanted a set of scripts to help out, even for stuff we "should" remember, in order to cut down on "oogling" time

- `pip` is ok, but `uv` is so much better, so this is centric around that

- Best practices enforced by tools is table stakes for us, so want to ensure everyone has and uses tools (See: `pre-commit-config.yaml`)

- We encourge and for our shop enforce [SOLID](https://en.wikipedia.org/wiki/SOLID), and [12-Factor](https://12factor.net/) so a mix of required tools added as `--dev` and standard libraries such as `dotenv` to enforce getting configuration from environment variables.

## Credits

Thanks to Arjan Codes! For lots of Great content and as a starting place for many of the ideas here.

- [GitHub](https://github.com/ArjanCodes)
- [Site](https://www.arjancodes.com/)

> If it is right, he gets the credit, if it is wrong, that's on us (well mostly me...).

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
```

- Lines: 1. Version, 2. Checksum, 3. Processor Target
- We try to keep this updated weekly!

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

6. Install Python Extensions for VS CODE required by our team (`scripts\install-python-extensions.ps1`) plus any others we like as individuals

## For your project

> Note: If you copy the files from this repo into a new project to `seed` it, `cd {my project}`, then run `uv sync` it will handle many of these details for you.

1. Make your code folder and populate it from the repo
   a. For our projects its always `c:\code` on Windows or `~/code` on Linux.
   b. Pull your repo down (note: we always create a repo in GitHub 1st, or use an existing sandbox)
   c. Switch to it

2. Copy guts of this project into it as a template

3. Create our virtual environment with `scripts\new-venv.ps1` which scrubs away old versions and installs and activates a clean one (see previous comment)

4. make basic `uv.lock` file using `scripts\add-uvstds.ps1` with tools configured

5. remember to `uv sync` at intervals or when pulling fresh from source control

## Sidebar: Generating a pip compatible requirements files

Sometimes a tool needs a pip `requirements.txt` file, this script generates one

```powershell
scripts\convert-uvlock2pip.ps1
```

# Contributing and Issues

Please do make an issue, or send us a Pull-Request if you have suggestions or want to report a bug.
