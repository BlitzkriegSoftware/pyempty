<#
  Install Tools
#>

python.exe -m pip install --upgrade pip
pip install uv

# Use UV to Install Tools
uv tool install black
uv tool install isort
uv tool install ruff