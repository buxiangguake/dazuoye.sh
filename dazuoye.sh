#����ҵ����ҵ����ҵ
#����ҵʹ��ͷͺ
#���ߣ������̵Ĳ˼���
#!/bin/bash

for i in `seq -w 10 -1 1`  #�������� #��10��1����������ȿ����뵽i
  do
    echo -ne "\b\b$i";   #���
    sleep 1; #��ʱһ��
done 
#��һ����
echo "��ʾ������������(������Ҳ����O_o)��Enter��"

CMD=cowsay  #�����滻

$CMD "��ʦ��~"
#��û���ļ�������ʾ��װ����
if [ $? -ne 0 ];then
	echo "please enter following command to install"
	echo "sudo apt-get install $CMD"
	echo "or"
	echo "sudo aptitude install $CMD"
	exit
fi
#�ļ�·��
dir=/usr/share/cowsay
for filename in `ls $dir`     
do
	if [ $# -eq 0 ];then #��һ��ָ������
		read key
	fi
	if [ "$key" = "" ];then
		key="��ʦ��~"
	fi
	name=${filename%".cow"}	
	$CMD -f $name $key
done



#guess number game;
init()
{
echo " ################################### "
echo "                                     "
echo "        ���������������Ϸ��         "
echo "                                     "
echo " ################################### "
}
game()
{
number=$[$RANDOM%100]  #������0~99֮�������
#�Ƚϴ�С
while :
do
read -p "������Ҫ�²������: " n1 #ָ����ʾ���
n2=`echo $n1 | sed 's/[0-9]//g'` #n1��Ϊ���ߵ�����
if [ ! -z $n2 ] #���n2�ַ��������Ƿ�Ϊ��
    then
        echo "������Ĳ���һ������."
        continue
fi
if [ $n1 == $number ]
    then
        echo "��¶���."
        read -p "�㻹������һ��ô����yes/no��" an1
        while true
                do
                        case $an1 in
                        yes)
                        game
                        break
                        ;;
                        no)
                        break
                        ;;
                        *)
                        exit
                        esac
        done
        break
    elif [ $n1 -gt $number ] #�Ƚϴ�С
    then
        echo "�´���."
        continue
    else
        echo "��С��."
        continue
    fi
done
}
 
 
while true
do
init
echo "����һ���ܳ����Ĳ�����Ϸ"
echo "1: Start Game "
echo "0: exit       "
read -p " please input 0-1:" NUM
 
case $NUM in
1)
        game
        break
        ;;
0)
        break
        ;;
esac
 
done
#��һ��~
#������
{
    for ((i = 0 ; i <= 100 ; i+=20)); do #0~100���Ϊ20
        sleep 1
        echo $i
    done
} | whiptail --gauge "  ����С���������Ķ���  " 6 60 0

#�Ի���
whiptail --title "Linux����ҵ" --msgbox "�����ҵ�һ�α��qaq." 10 40

#�Ի���
whiptail --title "Linux����ҵ" --msgbox "����ҵʹ��ͷͺ����ǿ���һ��ڼ��" 15 60

#�Ի���
whiptail --title "Linux����ҵ" --msgbox "����������ܵģ��һ�Ŭ�������� O_o" 20 80

#����ʽ�Ի���
Q=$(whiptail --title "Linux����ҵ" --inputbox "��������ݴ���ҵ��OK��?" 10 60 OKOK 3>&1 1>&2 2>&3) 
#�ض���
#Set file descriptor 3 to a copy of file descriptor 1 (so writing to fd 3 also writes to stdout)
#Set file descriptor 1 to a copy of fd 2 (so writing to fd 1 now writes to stderr)
#Set file descriptor 2 to a copy of fd 3 (so writing to fd 2 now writes to what used to be stdout)
exitstatus=$?
if [ $exitstatus = 0 ]; then
     echo "��������:" $Q
    echo "However,лл��ʦ~ �һ�ú�ѧϰ�������ϵ�"
     whiptail --title "Linux����ҵ" --msgbox "However,лл��ʦ~ �һ�ú�ѧϰ�������ϵ�." 10 60
else
    echo "O__o"
fi

#
echo "�7�8   ��ʦ������   �7�8
�� �a�� �ģߡ� �ߩa��
�� �� ( �9�9�6�6�9�9 )�ߩa��
 �a�a �ܡ��������a�a
���� ��i�Щc ��
���� ��(��) ��
�������� ����"
