clear

c=0

while test $c != 7
do

echo "1-> Create/Use  2-> View 3-> Insert 4-> Delete 5-> Modify 6->Search 7-> Exit"

read c

case "$c" in
"1")
echo "Enter the name for the address book:"
		read addrbk
                touch "$addrbk"
;;


"2")
echo "Following are the entries in Address Book"
cat "$addrbk"
;;

"3")
it=0
 echo "enter the no. of records"
                read n
        while [ $it -lt $n ]
        do
                echo "enter id:"
                read id1
                echo "enter name:"
                read nm
                pa="^[A-Za-z]"
       
        echo "enter address:"
        read add
        pa="^[A-Za-z0-9]"
        while [[ ! "$add" =~ $pa ]]   
        do
                echo "enter valid address:"
                read add
        done
        #echo $add

        echo "enter phone no.:"
        read ph
        pat="^[0-9]{10}$"
        while [[ ! $ph =~ $pat ]]
        do
                echo "please enter phone number as XXXXXXXXXX:"
                read ph
        done
        #echo $ph

        echo "enter email:"
        read em
        patem="^[a-z0-9._%-+]+@[a-z]+\.[a-z]{2,4}$"
        while [[ ! $em =~ $patem ]]
        do
                echo "please enter valid email address"
                read em
        done
        #echo $em

        echo "$id1,$nm,$add,$ph,$em" >> "$addrbk"

        it=`expr $it + 1`
        echo "$it record entered"
        done
        

;;

"4")
flag=0
while [ flag==0 ]
do
	echo "Enter the string to be deleted : "
	read deletestr
	grep "$deletestr" "$addrbk"
	echo "Do you want to delete these entries?(1=yes/0=no)"
	read flag
	if [ flag==1 ]
	then
		touch temp
		grep -v "$deletestr" "$addrbk" >temp.txt
		rm "$addrbk"
		touch "$addrbk"
		cat temp.txt>"$addrbk"
		rm temp.txt
		break
	fi
	done


;;
		
"5")
ch=0

while test $ch != 6
do

echo "1-> ID  2-> Name 3-> Address 4-> Phone No. 5-> Modify 6->Search 7-> Exit"

read c

case "$c" in
"1")

;;

"6")
echo "Enter the string to be searched : "
read searchstr
grep "$searchstr" "$addrbk"
;;

"7")
echo "Exit"
exit
;;

esac


done
exit

