#!/bin/bash
#
org=$1
host=$2
ip="120.26.107.78"

#cp

#declare -a orgList=("yt" "nx" "df" "mc")

declare -A userMap=(["yt"]="root" ["nx"]="nixi" ["df"]="dfit" ["mc"]="mcc")

user=${userMap[$org]}


##host
declare -A ytMap=( ["test"]="120.55.75.53" ["1"]="120.55.74.76" ["2"]="120.55.74.79" ["bos"]="114.55.54.131")
declare -A nxMap=( ["test"]="120.26.107.78" ["1"]="120.26.107.78")
declare -A dfMap=( ["test"]="121.43.172.15" ["1"]="121.43.172.15" )
declare -A mcMap=( ["test"]="116.62.31.138" ["1"]="116.62.42.111" )

#aa="${org}Map"
#echo $aa
#bb=eval ${aa["test"]}
#bb=${dtMap["test"]}
#echo $bb

ip=""
if [ "${org}" == "yt" ];then
ip=${ytMap[$host]}

elif [ "${org}" == "nx" ];then
ip=${nxMap[$host]}

elif [ "${org}" == "df" ];then
ip=${dfMap[$host]}

elif [ "${org}" == "mc" ];then
ip=${mcMap[$host]}

else
echo "useage ./login.sh org host"
exit 0
fi


echo "ssh ${user}@$ip"
ssh -o ServerAliveInterval=30 ${user}@$ip
