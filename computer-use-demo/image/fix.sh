#!/bin/bash

# 接受两个参数，Arg1: 替换的url，Arg2: 替换的url
# 1. 将 /home/computeruse/static_content/index.html 中  http://127.0.0.1:6080 替换 Arg1
# 2. 将 /home/computeruse/static_content/index.html 中  http://localhost:8501 替换 Arg2
# 3. cd /home/computeruse && nohup python http_server.py > /tmp/http_server_logs.txt 2>&1 &

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <replace_url1> <replace_url2>"
    exit 1
fi

# Assign arguments to variables
replace_url1="$1"
replace_url2="$2"

# File to be modified
file_path="/home/computeruse/static_content/index.html"

# 1. Replace http://127.0.0.1:6080 with the first argument
sed -i "s|http://127.0.0.1:6080|$replace_url1|g" "$file_path"

# 2. Replace http://localhost:8501 with the second argument
sed -i "s|http://localhost:8501|$replace_url2|g" "$file_path"

# 3. Change directory and run the Python script in the background
cd /home/computeruse && nohup python http_server.py > /tmp/http_server_logs.txt 2>&1 &

echo "Replacements completed and http_server.py started in the background."

