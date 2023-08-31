#!/usr/bin/pwsh

# Get the directory of the current script
$PROJECT_DIR = Join-Path $PSScriptRoot ".."
$SRC_DIR = Join-Path $PROJECT_DIR "src"

########################################
#                  go                  #
########################################
$GOLANG_DIR = Join-Path $PROJECT_DIR "go"
# go/go.mod
$go_mod_path = Join-Path $GOLANG_DIR "go.mod"
$go_mod_contents = "module github.com/joe733/rubric

go 1.21"
$go_mod_contents | Set-Content -Path $go_mod_path
# go.work
$go_work_path = Join-Path $PROJECT_DIR "go.work"
$go_work_contents = @" 
go 1.21

use (
    ./go
)
"@
$go_work_contents | Set-Content -Path $go_work_path
if ($?) {
    Write-Host -ForegroundColor Cyan "`n🗸 Initialized golang files."
}

########################################
#                 rust                 #
########################################
# src/main.rs
$main_rs_path = Join-Path $SRC_DIR "main.rs"
$main_rs_contents = @"
#[path = "../rust/search_linear.rs"] // this is a bad idea!
mod rust;

fn main() {
    rust::main();
}
"@
New-Item -Path $SRC_DIR -ItemType Directory -Force | Out-Null
$main_rs_contents | Set-Content -Path $main_rs_path
# cargo.toml
$cargo_toml_path = Join-Path $PROJECT_DIR "Cargo.toml"
$cargo_toml_contents = @"
[package]
name = "rubric"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
"@
$cargo_toml_contents | Set-Content -Path $cargo_toml_path
if ($?) {
    Write-Host -ForegroundColor Cyan "🗸 Initialized rust files."
}

########################################
#                python                #
########################################
# pyproject.toml
$pyproject_toml_path = Join-Path $PROJECT_DIR "pyproject.toml"
$pyproject_toml_contents = @"
[project]
name = "rubric"
version = "0.1.0"
description = "Coders' Creed"
authors = [{ name = "Jovial Joe Jayarson", email = "jovial7joe@hotmail.com" }]
dependencies = []
requires-python = ">=3.11"
readme = "README.md"
license = { text = "MIT" }

[project.optional-dependencies]
tooling = ["black>=23.7.0", "ruff>=0.0.282", "pyright>=1.1.320"]
[build-system]
requires = ["setuptools>=61"]
build-backend = "setuptools.build_meta"
"@
$pyproject_toml_contents | Set-Content -Path $pyproject_toml_path
if ($?) {
    Write-Host -ForegroundColor Cyan "🗸 Initialized python files."
}

########################################
#                  etc                 #
########################################
# .pdm-python
$_pdm_python_path = Join-Path $PROJECT_DIR ".pdm-python"
$_pdm_python_contents = "./.venv/bin/python.exe"
$_pdm_python_contents | Set-Content -Path $_pdm_python_path
# .tool-versions
$_toll_versions_path = Join-Path $PROJECT_DIR ".tool-versions"
$_toll_versions_contents = @"
golang latest
kotlin latest
nim latest
python latest
rust latest
"@
$_toll_versions_contents | Set-Content -Path $_toll_versions_path
if ($?) {
    Write-Host -ForegroundColor Cyan "🗸 Initialized misc files`n"
}
