<#
  Install Tools
#>

python.exe -m pip install --upgrade pip

# Download and install UV
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Force UV to be in path
$env:Path = "C:\Users\spook\.local\bin;$env:Path"

# Force update
uv self update

# Use UV to Install Tools
uv tool install black
uv tool install isort
uv tool install ruff
uv tool install pyright
uv tool install pytest

# This should be last
uv tool update-shell