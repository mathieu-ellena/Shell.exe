for line in `cat /home/kaiden/Github/Job_9/CSV/Shell_Userlist.csv`;
do
id=`echo ${line} | cut -d "," -f 1`
surname=`echo ${line} | cut -d "," -f 2`
name=`echo ${line} | cut -d "," -f 3`
pwd=`echo ${line} | cut -d "," -f 4`
role=`echo ${line} | cut -d "," -f 5`
cpwd=$(pearl -e 'print crypt($ARGV[0], "majinmath")', $pwd)
sudo useradd -m -p $cpwd $surname-$name
if [[ "$role" =~ .*Admin.* ]]
then 
sudo useradd $surname-$name sudo
sudo useradd $surname-$name adm
else
echo "xxx"
fi
done
exit 0

