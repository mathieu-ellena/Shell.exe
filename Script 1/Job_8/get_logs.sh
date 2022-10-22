Date=$(date +%d-%m-%y-%H:%M)
file=number_connection-$Date

last kaiden | wc -l >> $file
tar -czvf /home/kaiden/Github/Shell.exe/Job_8/$file.tar.gz $file
mv $file.tar.gz Backup
rm $file
