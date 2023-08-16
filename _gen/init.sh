#!/usr/bin/bash

PROJECT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
SRC_DIR="${PROJECT_DIR}/src"

# Colors
RESET='\033[0m' # Reset color
# BLACK='\033[0;30m' # Black
# RED='\033[0;31m' # Red
# GREEN='\033[0;32m' # Green
# YELLOW='\033[0;33m' # Yellow
# GRAY='\033[0;37m' # Gray
# BLUE='\033[0;34m' # Blue
# PURPLE='\033[0;35m' # Purple
CYAN='\033[0;36m' # Cyan
# WHITE='\033[0;37m' # White

########################################
#                  go                  #
########################################
GOLANG_DIR="${PROJECT_DIR}/go"
# go/go.mod
go_mod_path="${GOLANG_DIR}/go.mod"
go_mod_contents="module github.com/joe733/rubric

go 1.21"
echo $go_mod_contents >$go_mod_path
# go.work
go_work_path="${PROJECT_DIR}/go.work"
go_work_contents="go 1.21

use (
	./go
)"
echo $go_work_contents >$go_work_path
if [[ $? -eq 0 ]]; then
    echo -e "\n${CYAN}🗸${RESET} Intitalized golang files."
fi

########################################
#                 rust                 #
########################################
# src/main.rs
main_rs_path="${SRC_DIR}/main.rs"
main_rs_contents="#[path = \"../rust/search_linear.rs\"] // this is a bad idea!
mod rust;

fn main() {
    rust::main();
}"
mkdir -p $SRC_DIR
echo $main_rs_contents >$main_rs_path
# cargo.toml
cargo_toml_path="${PROJECT_DIR}/Cargo.toml"
cargo_toml_contents="[package]
name = \"rubric\"
version = \"0.1.0\"
edition = \"2021\"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]"
echo $cargo_toml_contents >$cargo_toml_path
if [[ $? -eq 0 ]]; then
    echo -e "${CYAN}🗸${RESET} Initialized rust files."
fi

########################################
#                python                #
########################################
# pyproject.toml
pyproject_toml_path="${PROJECT_DIR}/pyproject.toml"
pyproject_toml_contents="[project]
name = \"rubric\"
version = \"0.1.0\"
description = \"Coders' Creed\"
authors = [{ name = \"Jovial Joe Jayarson\", email = \"jovial7joe@hotmail.com\" }]
dependencies = []
requires-python = \">=3.11\"
readme = \"README.md\"
license = { text = \"MIT\" }

[project.optional-dependencies]
tooling = [\"black>=23.7.0\", \"ruff>=0.0.282\", \"pyright>=1.1.320\"]
[build-system]
requires = [\"setuptools>=61\"]
build-backend = \"setuptools.build_meta\""
echo $pyproject_toml_contents >$pyproject_toml_path
if [[ $? -eq 0 ]]; then
    echo -e "${CYAN}🗸${RESET} Initialized python files."
fi

########################################
#                  etc                 #
########################################
# .pdm-python
_pdm_python_path="${PROJECT_DIR}/.pdm-python"
_pdm_python_contents="./.venv/bin/python.exe"
echo $_pdm_python_contents >$_pdm_python_path
# .tool-versions
_toll_versions_path="${PROJECT_DIR}/.tool-versions"
_toll_versions_contents="golang 1.21.0
kotlin 1.9.0
nim 2.0.0
python 3.11.4
rust 1.71.1"
echo $_toll_versions_contents >$_toll_versions_path
if [[ $? -eq 0 ]]; then
    echo -e "${CYAN}🗸${RESET} Initialized misc files.${RESET}\n"
fi
