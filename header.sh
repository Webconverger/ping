awk '{print $2}'  20*.txt | sort -V | uniq > header.txt
echo "["$(cat header.txt | tr '\n' ',' | sed -e 's/,$//')"]" > header.json
