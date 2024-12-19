#!/bin/bash

python3 ../scripts/generate_tools.py gen_tools.html "full"
python3 ../scripts/generate_tools.py gen_tools_extended.html "extended"
python3 ../scripts/generate_tools.py gen_tools_optional.html "optional"
python3 ../scripts/generate_tools.py gen_tools_dependency.html "dependency"
cat tools-header.yml gen_tools.yml gen_tools_optional.yml gen_tools_extended.yml gen_tools_dependency.yml > tools.yml
