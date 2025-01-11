#!/bin/bash
# Log file for debugging
LOGFILE="/tmp/uci-defaults-log.txt"
echo "Starting 99-custom.sh at $(date)" >> $LOGFILE
echo "编译固件大小为: $PROFILE MB"
echo "Include Docker: $INCLUDE_DOCKER"

echo "Create pppoe-settings"
mkdir -p  /home/build/immortalwrt/files/etc/config

# 创建pppoe配置文件 yml传入环境变量ENABLE_PPPOE等 写入配置文件 供99-custom.sh读取
cat << EOF > /home/build/immortalwrt/files/etc/config/pppoe-settings
enable_pppoe=${ENABLE_PPPOE}
pppoe_account=${PPPOE_ACCOUNT}
pppoe_password=${PPPOE_PASSWORD}
EOF

echo "cat pppoe-settings"
cat /home/build/immortalwrt/files/etc/config/pppoe-settings
# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始编译..."



# 定义所需安装的包列表 下列插件你都可以自行删减
PACKAGES=""
PACKAGES="$PACKAGES curl"
PACKAGES="$PACKAGES luci-i18n-diskman-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-filebrowser-zh-cn"
PACKAGES="$PACKAGES luci-app-argon-config"
PACKAGES="$PACKAGES luci-i18n-argon-config-zh-cn"
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn"
PACKAGES="$PACKAGES luci-i18n-ttyd-zh-cn"
PACKAGES="$PACKAGES luci-i18n-passwall-zh-cn"
PACKAGES="$PACKAGES luci-app-openclash"
PACKAGES="$PACKAGES luci-i18n-homeproxy-zh-cn"
PACKAGES="$PACKAGES openssh-sftp-server"
PACKAGES="$PACKAGES luci-app-accesscontrol-plus" 
PACKAGES="$PACKAGES luci-app-acme" 
PACKAGES="$PACKAGES luci-app-adbyby-plus" 
PACKAGES="$PACKAGES luci-app-adguardhome" 
PACKAGES="$PACKAGES luci-app-alist" 
PACKAGES="$PACKAGES luci-app-aliyundrive-webdav"
PACKAGES="$PACKAGES luci-app-ap-modem" 
PACKAGES="$PACKAGES luci-app-aria2" 
PACKAGES="$PACKAGES luci-app-arpbind" 
PACKAGES="$PACKAGES luci-app-autotimese" 
PACKAGES="$PACKAGES luci-app-broadbandacc" 
PACKAGES="$PACKAGES luci-app-openai" 
PACKAGES="$PACKAGES luci-app-cifs-mount" 
PACKAGES="$PACKAGES luci-app-clouddrive2" 
PACKAGES="$PACKAGES luci-app-cpulimit"
PACKAGES="$PACKAGES luci-app-cloudreve"
PACKAGES="$PACKAGES luci-app-ddns"
PACKAGES="$PACKAGES luci-app-ddns-go"
PACKAGES="$PACKAGES luci-app-ddnsto"
PACKAGES="$PACKAGES luci-app-diskman"
PACKAGES="$PACKAGES luci-app-dufs"
PACKAGES="$PACKAGES luci-app-easymesh"
PACKAGES="$PACKAGES luci-app-eqosplus"
PACKAGES="$PACKAGES luci-app-filebrowser-go"
PACKAGES="$PACKAGES luci-app-frpc"
PACKAGES="$PACKAGES luci-app-frps"
PACKAGES="$PACKAGES luci-app-hd-idle"
PACKAGES="$PACKAGES luci-app-homeassistant" 
PACKAGES="$PACKAGES luci-app-homebox"
PACKAGES="$PACKAGES luci-app-ipsec-server
PACKAGES="$PACKAGES luci-app-iptvhelper"
PACKAGES="$PACKAGES luci-app-jd-dailybonus"
PACKAGES="$PACKAGES luci-app-kodexplorer"
PACKAGES="$PACKAGES luci-app-ksmbd"
PACKAGES="$PACKAGES luci-app-linkease"
PACKAGES="$PACKAGES luci-app-minidlna"
PACKAGES="$PACKAGES luci-app-mosdns"
PACKAGES="$PACKAGES luci-app-msd_lite"
PACKAGES="$PACKAGES luci-app-mwan3"
PACKAGES="$PACKAGES luci-app-my-dnshelper"
PACKAGES="$PACKAGES luci-app-natmap"
PACKAGES="$PACKAGES luci-app-npc"
PACKAGES="$PACKAGES luci-app-netdata"
PACKAGES="$PACKAGES luci-app-netspeedtest"
PACKAGES="$PACKAGES luci-app-nlbwmon"
PACKAGES="$PACKAGES luci-app-oaf"
PACKAGES="$PACKAGES luci-app-openvpn-server
PACKAGES="$PACKAGES luci-app-p910nd"
PACKAGES="$PACKAGES luci-app-parentcontrol"
PACKAGES="$PACKAGES luci-app-partexp"
PACKAGES="$PACKAGES luci-app-qbittorrent"
PACKAGES="$PACKAGES luci-app-qosmate"
PACKAGES="$PACKAGES luci-app-ramfree"
PACKAGES="$PACKAGES luci-app-rclone"
PACKAGES="$PACKAGES luci-app-samba4" 
PACKAGES="$PACKAGES luci-app-wechatpush"
PACKAGES="$PACKAGES luci-app-smartdns"
PACKAGES="$PACKAGES luci-app-snmpd"
PACKAGES="$PACKAGES luci-app-softethervpn"
PACKAGES="$PACKAGES luci-app-speedtest-web LibreSpeed"
PACKAGES="$PACKAGES luci-app-sqm Qos"
PACKAGES="$PACKAGES luci-app-statistics collectd"
PACKAGES="$PACKAGES luci-app-store"
PACKAGES="$PACKAGES luci-app-syncdial"
PACKAGES="$PACKAGES luci-app-tailscale"
PACKAGES="$PACKAGES luci-app-thunder"
PACKAGES="$PACKAGES luci-app-timedreboot"
PACKAGES="$PACKAGES luci-app-transmission"
PACKAGES="$PACKAGES luci-app-ttyd"
PACKAGES="$PACKAGES luci-app-turboacc"
PACKAGES="$PACKAGES luci-app-unblockmusic"
PACKAGES="$PACKAGES luci-app-unishare" 
PACKAGES="$PACKAGES luci-app-uugamebooster" 
PACKAGES="$PACKAGES luci-app-vlmcsd" 
PACKAGES="$PACKAGES luci-app-vsftpd"
PACKAGES="$PACKAGES luci-app-watchcat"
PACKAGES="$PACKAGES luci-app-apfree-wifidog"
PACKAGES="$PACKAGES luci-app-wifischedule"
PACKAGES="$PACKAGES luci-app-wireguard"
PACKAGES="$PACKAGES luci-app-timewol"
PACKAGES="$PACKAGES luci-app-wrtbwmon"
PACKAGES="$PACKAGES luci-app-xlnetacc"
PACKAGES="$PACKAGES luci-app-zerotier"
PACKAGES="$PACKAGES luci-theme-alpha"
PACKAGES="$PACKAGES luci-theme-bootstrap"
PACKAGES="$PACKAGES luci-theme-design"
PACKAGES="$PACKAGES luci-theme-edge"
PACKAGES="$PACKAGES luci-theme-material"
PACKAGES="$PACKAGES luci-theme-openwrt-2020"
PACKAGES="$PACKAGES automount"
PACKAGES="$PACKAGES btop"
PACKAGES="$PACKAGES naiveproxy"
PACKAGES="$PACKAGES open-vm-tools"
PACKAGES="$PACKAGES qemu-ga"
PACKAGES="$PACKAGES tvhelper"


# 增加几个必备组件 方便用户安装iStore
PACKAGES="$PACKAGES fdisk"
PACKAGES="$PACKAGES script-utils"
PACKAGES="$PACKAGES luci-i18n-samba4-zh-cn"

# 判断是否需要编译 Docker 插件
if [ "$INCLUDE_DOCKER" = "yes" ]; then
    PACKAGES="$PACKAGES luci-i18n-dockerman-zh-cn"
    echo "Adding package: luci-i18n-dockerman-zh-cn"
fi

# 构建镜像
echo "$(date '+%Y-%m-%d %H:%M:%S') - Building image with the following packages:"
echo "$PACKAGES"

make image PROFILE="generic" PACKAGES="$PACKAGES" FILES="/home/build/immortalwrt/files" ROOTFS_PARTSIZE=$PROFILE

if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully."
