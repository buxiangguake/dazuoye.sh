#大作业大作业大作业
#大作业使人头秃
#作者：不会编程的菜鸡范
#!/bin/bash

for i in `seq -w 10 -1 1`  #生成数字 #将10到1的整数降序等宽输入到i
  do
    echo -ne "\b\b$i";   #输出
    sleep 1; #延时一秒
done 
#下一个啦
echo "提示：请输入文字(不输入也可以O_o)后按Enter键"

CMD=cowsay  #命令替换

$CMD "老师好~"
#若没有文件，则提示安装过程
if [ $? -ne 0 ];then
	echo "please enter following command to install"
	echo "sudo apt-get install $CMD"
	echo "or"
	echo "sudo aptitude install $CMD"
	exit
fi
#文件路径
dir=/usr/share/cowsay
for filename in `ls $dir`     
do
	if [ $# -eq 0 ];then #上一条指令正常
		read key
	fi
	if [ "$key" = "" ];then
		key="老师好~"
	fi
	name=${filename%".cow"}	
	$CMD -f $name $key
done



#guess number game;
init()
{
echo " ################################### "
echo "                                     "
echo "        让我们先玩儿个游戏吧         "
echo "                                     "
echo " ################################### "
}
game()
{
number=$[$RANDOM%100]  #随机输出0~99之间的整数
#比较大小
while :
do
read -p "输入你要猜测的数字: " n1 #指定提示语句
n2=`echo $n1 | sed 's/[0-9]//g'` #n1作为后者的输入
if [ ! -z $n2 ] #检查n2字符串长度是否为零
    then
        echo "你输入的不是一个数字."
        continue
fi
if [ $n1 == $number ]
    then
        echo "你猜对了."
        read -p "你还想再玩一次么？（yes/no）" an1
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
    elif [ $n1 -gt $number ] #比较大小
    then
        echo "猜大了."
        continue
    else
        echo "猜小了."
        continue
    fi
done
}
 
 
while true
do
init
echo "这是一个很常见的猜数游戏"
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
#下一个~
#进度条
{
    for ((i = 0 ; i <= 100 ; i+=20)); do #0~100间隔为20
        sleep 1
        echo $i
    done
} | whiptail --gauge "  来自小弱鸡的内心独白  " 6 60 0

#对话框
whiptail --title "Linux大作业" --msgbox "这是我第一次编程qaq." 10 40

#对话框
whiptail --title "Linux大作业" --msgbox "大作业使人头秃，顽强的我还在坚持" 15 60

#对话框
whiptail --title "Linux大作业" --msgbox "这个代码是攒的，我会努力看懂的 O_o" 20 80

#交流式对话框
Q=$(whiptail --title "Linux大作业" --inputbox "您觉得这份大作业还OK嘛?" 10 60 OKOK 3>&1 1>&2 2>&3) 
#重定向
#Set file descriptor 3 to a copy of file descriptor 1 (so writing to fd 3 also writes to stdout)
#Set file descriptor 1 to a copy of fd 2 (so writing to fd 1 now writes to stderr)
#Set file descriptor 2 to a copy of fd 3 (so writing to fd 2 now writes to what used to be stdout)
exitstatus=$?
if [ $exitstatus = 0 ]; then
     echo "您的评价:" $Q
    echo "However,谢谢老师~ 我会好好学习天天向上的"
     whiptail --title "Linux大作业" --msgbox "However,谢谢老师~ 我会好好学习天天向上的." 10 60
else
    echo "O__o"
fi

#
echo "♪   老师辛苦啦   ♪
ミ ゛ミ ∧＿∧ ミ゛ミ
ミ ミ ( ・∀・ )ミ゛ミ
 ゛゛ ＼　　　／゛゛
　　 　i⌒ヽ ｜
　　 　(＿) ノ
　　　　 　∪"
