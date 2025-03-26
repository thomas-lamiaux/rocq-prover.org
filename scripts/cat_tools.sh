#!/bin/bash

# generate the database of packages for each kind of levels
python3 ../scripts/generate_tools.py gen_tools_base.html "base"
python3 ../scripts/generate_tools.py gen_tools_ide.html "ide"
python3 ../scripts/generate_tools.py gen_tools_full.html "full"
python3 ../scripts/generate_tools.py gen_tools_extended.html "extended"
python3 ../scripts/generate_tools.py gen_tools_optional.html "optional"
python3 ../scripts/generate_tools.py gen_tools_dependency.html "dependency"

# concatenate the to tools.yml
cat tools-header.yml gen_tools_base.yml gen_tools_ide.yml gen_tools_full.yml gen_tools_optional.yml gen_tools_extended.yml gen_tools_dependency.yml > tools.yml

# remove occurrences of [@@deriving] that do not parse
# -i '' ensures that the file is modified in place (works on macOS; for Linux, remove '')
sed -i '' 's/\[\@\@deriving\]//g' tools.yml