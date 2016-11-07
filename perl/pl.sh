
file_name=$1".pl"
file_path="./"$file_name

touch $file_name

echo "#! /usr/bin/perl" >> $file_path
echo "use utf8;" >> $file_path
echo "use warnings;" >> $file_path
echo "use strict;" >> $file_path
chmod +x $file_name
vim $file_name
