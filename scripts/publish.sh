#! /bin/bash

read -p "Have you updated the version number in pyproject.toml? (yes/no): " version_updated

if [[ "$version_updated" != "yes" ]]; then
    echo "Please update the version number in pyproject.toml before running this script."
    exit 1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPT_DIR/.."

source ./venv/bin/activate
rm  dist/*
python -m build
python -m twine upload dist/*
