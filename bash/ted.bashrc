
# Ted Wang's .bashrc, v0.01, 2019-01-19


# Linux bash 中的 alias 命令，可以存在参数，但是参数必须放在最后，这极大的限制了 alias 的使用。这里有个包装参数到中间的方式，参考自 StackOverlow 的答案：
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter/42466441#42466441

# 1. Linux 下模拟 windows 的 start。主要对 nohup firefox >&/dev/null & 命令的包装
# 方法一，通过一个临时函数过度：
	alias run='f(){ nohup $@ >&/dev/null '\''&'\'' ;  unset -f f; }; f'
# 方法二，通过调用一个 sub shell 来过度，注意最后的参数是必须的。
# alias run='bash -c '\''nohup "$@" >&/dev/null &'\'' _'

# 2. 远程快速安装SS、开启BBR
# 原始命令 git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i ss_pass ss_port && sudo ss-fly/ss-fly.sh -bbr -Y
# 2.1 普通用户
	alias fastss='f(){ ssh -o "StrictHostKeyChecking=no" -t ted@"$3" '\''git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i '\''$1'\'' '\''$2'\'' && sudo ss-fly/ss-fly.sh -bbr -Y'\'';  unset -f f; }; f'
# 2.2 root 用户
	alias fastss='f(){ ssh -o "StrictHostKeyChecking=no" -t root@"$3" '\''git clone -b master https://github.com/Ted-Wang/ss-fly && ss-fly/ss-fly.sh -i '\''$1'\'' '\''$2'\'' && ss-fly/ss-fly.sh -bbr -Y'\'';  unset -f f; }; f'
# 调用：fastss ss_pass port ip，比如：fastss vpn_pass 8388 67.68.69.70

# 3. 远程添加用户，原始命令 ssh -o 'StrictHostKeyChecking=no' -t root@host_ip 'useradd $1 -G sudo -s /bin/bash -m && passwd $1'
# 3.1 普通用户
	alias fastuser='f(){ ssh -o "StrictHostKeyChecking=no" -t ted@"$2" '\''sudo useradd '\''$1'\'' -G sudo -s /bin/bash -m && sudo passwd '\''$1'\'''\'';  unset -f f; }; f'
# 3.2 root 用户
	alias fastuser='f(){ ssh -o "StrictHostKeyChecking=no" -t root@"$2" '\''useradd '\''$1'\'' -G -s /bin/bash -m && passwd '\''$1'\'''\'';  unset -f f; }; f'
#调用：fastuser ted44 192.168.1.101



currentEnv()
{
    unameOut="$(uname -s)"
    case $unameOut in
        Linux*) runningIn=Linux;;
        MINGW*) runningIn=git-bash;;
        Darwin*) runningIn=Mac;;
    esac
    echo $runningIn
    unset unameOut
    unset runningIn
    return 0
}

#export -f currentEnv

