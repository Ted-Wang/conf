# Tips

## apt
sudo apt search fcitx			# 搜索仓库
sudo apt show fcitx				# 显示包详细信息
dpkg -l | grep -i fcitx			# 显示已安装包

## Locale Related
```shell
locale -a	                # 查看当前系统所有可用locale
localectl list-locales		# localectl 这个命令很奇怪，跟 locale -a 结果未必一致

vim /etc/locale.gen		    # 把需要的语言注释去掉，我一般选择 en_US.	UTF-8, zh_CN.UTF-8, zh_CN.GBK 这3个。
locale-gen					# 使上面的修改生效，这样操作，应该是等同于执行了 dpkg-reconfigure locales
vim /etc/default/locale	# 指定默认的 locale
	LANG="en_US.UTF-8"		# 指定默认使用的locale值
	LANGUAGE="en_US:en"	    # 指定个人对语言的主次偏好，希望中文优先，可设为：zh_CN:en_US:en。这个值会被 LANG 和 LC_* 覆盖？
localectl set-locale LANG=en_US.UTF-8		# 这个命令应该是就是相当于修改了 /etc/default/locale 文件
```

## proxy
git config --global -e

alias curlx='curl -x socks5://proxy.org:20170'
alias curlx='curl -x proxy.org:20171'
wget -e "http_proxy=192.168.1.111:10809" url

alias aptp='apt -o Acquire::http::proxy="http://proxy-rn:20171"'	# 指定代理
alias aptp4='apt -o Acquire::ForceIPv4=true -o Acquire::http::proxy="http://proxy-rn:20171"'	# 指定代理+IPv4


## SMB
Linux GUI 访问 samba 目录，smb://ip
	smb://vm-ubuntu
	smb://192.168.1.123

sudo apt install cifs-utils
sudo mount -t cifs -o username=smb-user //192.168.1.111/share /home/ted/mount/point

## DNS
```shell
resolvectl
cat /etc/resov.conf
nslookup raspberrypi
nslookup 172.17.1.121
tracert www.baidu.com
dig baidu.com @114.114.114.114

sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf		# 修改 /etc/resolv.conf 的指向
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf	# 设置成默认
```

### Clear DNS Cache on Win
```bat
Clear-DnsClientCache	# powershell 管理员模式运行
ipconfig /flushdns		# cmd 管理员模式运行，清空dns缓存
nbtstat -R				# 清空 NetBIOS 名称解析缓存
```

### Clear DNS Cache on Linux
```shell
resolvectl flush-caches
resolvectl statistics
```

## BBR
```shell
sysctl net.ipv4.tcp_congestion_control      # 检测bbr
```


