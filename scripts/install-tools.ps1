<#
  Install Tools
#>

python.exe -m pip install --upgrade pip
pip install uv

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