#####################################################################
# cd /opt/rt-n56u/trunk 执行在这个目录下
#
# 修改默认参数（不同设备拷贝到相应 *.sh)          by: TurBoTse
#####################################################################
user_name="admin"                                   # 用户名
user_password="admin"                               # 登录密码
lan_ip="192.168.2"                          # LAN 地址
dhcp_beg="192.168.2.2"                        # LAN DHCP开始地址
dhcp_end="192.168.2.254"                       # LAN DHCP结束地址
default_path="./user/shared"                        # 默认配置路径
config="./configs/templates/MSG1500.config"     # 默认配置文件
default_file="./user/shared/defaults.h"             # 默认配置文件
version_time=$(date +%Y%m%d)                        # 更新时版本号时间: 20210101

#echo "修改用户名"
sed -i 's/SYS_USER_ROOT		"admin"/SYS_USER_ROOT		"'$user_name'"/g' $default_file

#echo "修改登陆密码"
sed -i 's/DEF_ROOT_PASSWORD	"admin"/DEF_ROOT_PASSWORD	"'$user_password'"/g' $default_file

#echo "修改 LAN IP 地址"
sed -i "s/192.168.2.1/$lan_ip/g" $default_path/defaults.h

#echo "修改 LAN DHCP 地址"
sed -i "s/192.168.2.2/$dhcp_beg/g" $default_path/defaults.h
sed -i "s/192.168.2.254/$dhcp_end/g" $default_path/defaults.h

#echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=.*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc

# 其他
echo "CONFIG_FIRMWARE_INCLUDE_ZEROTIER=y" >>.config   # zerotier ~1.3M
