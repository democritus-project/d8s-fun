#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_fun/ tests/

black democritus_fun/ tests/

mypy democritus_fun/ tests/

pylint --fail-under 9 democritus_fun/*.py

flake8 democritus_fun/ tests/

bandit -r democritus_fun/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_fun/ tests/
