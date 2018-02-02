insert_line_test() {
	str_test=`grep 'ft_printf' < $1 | cut -c 22- | sed 's/);//g' | tr -d '"'`
	str_test=\"$str_test\"

	sed -i '' "1,/ft_connect_stdout/ s/ft_connect_stdout/ft_write_test_name($str_test);\\
	ft_connect_stdout/" \
	$1
	echo "ft_write_debug($str_test); in $1"
}

insert_line_rslt() {
	sed -i '' "1,/ft_strdel/ s/ft_strdel/ft_write_rslt(data, ret);\\
	ft_strdel/" \
	$1
	echo "ft_write_rslt(data, ret); in $1"
}

delete_line() {
	line=`grep "ft_write_debug" $1`
	sed -i '' "/$line/d" $1
	echo "line removed from $1"
}

modify_line() {
	sed -i '' "s/ft_write_debug/ft_write_test_name/" $1
	echo "line corrected in $1"
}

count_debug() {
	count=`grep ft_write_debug < $1 | wc -l`
	if [ $count -gt 1 ]
	then
		echo $1
	fi
}

files=`find . -type d \( -name "conv_*" -o -name "basics" -o -name "percent" -o -name "mixed" \) \
	-exec find {} -name "*.c" \;`

for i in $files; do
	#delete_line $i
	#insert_line_rslt $i
	#insert_line_test $i
	#modify_line $i
done

### Add '\"' but sed -i  doesn't work after the grep
#grep 'write_debug' < conv_s/a14_all_02.c | cut -d '"' -f 2 | cut -d ',' -f 1 | sed -i '' 's/^/\\\"/;s/$/\\\"/'
