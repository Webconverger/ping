awk '{print $2}'  20*.txt | grep -F "." | grep -v "-" | sort -V | uniq > header.txt
echo "["$(cat header.txt | tr '\n' ',' | sed -e 's/,$//')",\"Total\"]" > header.json
