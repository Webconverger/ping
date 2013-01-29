tmp=$(mktemp)
for i in `ls 20*.txt | sort`
do
	month=\[\"$(basename $i .txt)\"
	echo ${month}${s},$(awk '{ sum+=$1} END {print sum}' $i)\] >> $tmp
done
echo -n "["
cat $tmp | tr '\n' ',' | sed -e 's/,$//'
echo "]"

rm -f $tmp
