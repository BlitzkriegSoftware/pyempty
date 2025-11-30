<#
    Add-UV Standards
    creates uv.lock if it does not exist
#>

uv sync
uv add black --dev
uv add isort --dev
uv add pre-commit --dev
uv add ruff --dev
uv add pytest --dev
uv add pytest-cov --dev