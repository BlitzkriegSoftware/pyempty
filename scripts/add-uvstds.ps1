<#
    Add-UV Standards
    creates uv.lock if it does not exist
#>

uv sync
uv add black --dev
uv add isort --dev
uv add ruff --dev
uv add pytest --dev
uv add pytest-cov --dev
uv add virtualenv --dev

# Force pre-commit install
uv tool install pre-commit --with pre-commit-uv --force-reinstall