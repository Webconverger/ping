tmp=$(mktemp)
for i in `ls 20*.txt | sort`
do
	month=\[\"$(basename $i .txt)\"
	s=""
	for v in `cat header.txt`
	do
		#n=$(awk "\$2 == $v { print \$1 }" $i)
		n=$(awk "\$2 ~ /^$v$/{print \$1}" $i)
		test "$n" || n="null"
		s="$s,$n"
	done
	echo ${month}${s}\] >> $tmp
done
echo -n "["
cat $tmp | tr '\n' ',' | sed -e 's/,$//'
echo "]"

rm -f $tmp
