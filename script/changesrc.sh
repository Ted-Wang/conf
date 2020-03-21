
function changesrc(){
    if [ -f /etc/os-release ]; then
        os=$(sed -E "s@^ID=(.*)\$@\1@" "/etc/os-release" | grep -v "=")
    fi
#    os=ubuntu
#    os=raspbian
    
    src_file_ubuntu="/etc/apt/sources.list"
    src_file_raspbian="/etc/apt/sources.list"
    src_file_raspi="/etc/apt/sources.list.d/raspi.list"
    src_file_manjaro="/etc/pacman.d/mirrorlist"

    read -p "please choose a source [1-sjtug/2-ustc/3-tsinghua]" src_name_seq
    case $src_name_seq in
        '1')
            src_name='sjtug'
            ;;
        '2')
            src_name='ustc'
            ;;
        '3')
            src_name='tsinghua'
            ;;
        *)
            echo "Wrong source number selected, source not changed."
            exit 0
            ;;
    esac

    echo "OS: $os, selected source: $src_name"
    if [[ "$os" == "ubuntu" ]]; then
        src_url_sjtug='https://mirrors.sjtug.sjtu.edu.cn/'
        src_url_ustc='https://mirrors.ustc.edu.cn/'
        src_url_tsinghua='https://mirrors.tuna.tsinghua.edu.cn/'
        src_url="src_url_$src_name"
        src_url=${!src_url}
        echo "Source url is: $src_url"
        echo "Update source in config file: ${src_file_ubuntu}"
        sudo \cp ${src_file_ubuntu}{,.bak.$(date "+%Y-%m-%d_%H-%M-%S")}
        sudo sed -i "s|http://.*archive.ubuntu.com/|${src_url}|g" ${src_file_ubuntu}
        sudo sed -i "s|http://security.ubuntu.com/|${src_url}|g" ${src_file_ubuntu}
        sudo sed -i "s|https*://.*.edu.cn/|${src_url}|g" ${src_file_ubuntu}
    fi
    if [[ "$os" == "raspbian" ]]; then
        src_url_sjtug='https://mirrors.sjtug.sjtu.edu.cn/raspbian/'
        src_url_sjtug_raspi='https://mirrors.sjtug.sjtu.edu.cn/raspberrypi/'
        src_url_ustc='https://mirrors.ustc.edu.cn/raspbian/'
        src_url_ustc_raspi='https://mirrors.ustc.edu.cn/archive.raspberrypi.org/'
        src_url_tsinghua='https://mirrors.tuna.tsinghua.edu.cn/raspbian/'
        src_url_tsinghua_raspi='https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/'
        src_url="src_url_$src_name"
        src_url=${!src_url}
        src_url_raspi="src_url_${src_name}_raspi"
        src_url_raspi=${!src_url_raspi}
        echo "Source url for raspbian is: $src_url"
        echo "Source url for raspi is: $src_url_raspi"
        echo "Update source in config file: ${src_file_raspbian} and ${src_file_raspi}"
        sudo \cp ${src_file_raspbian}{,.bak.$(date "+%Y-%m-%d_%H-%M-%S")}
        sudo \cp ${src_file_raspi}{,.bak.$(date "+%Y-%m-%d_%H-%M-%S")}
        sudo sed -i "s|http://raspbian.raspberrypi.org/|${src_url}|g" ${src_file_raspbian}
        sudo sed -i "s|https*://.*.edu.cn/raspbian/|${src_url}|g" ${src_file_raspbian}
        sudo sed -i "s|http://archive.raspberrypi.org/|${src_url_raspi}|g" ${src_file_raspi}
        sudo sed -i "s|https*://.*.edu.cn/.*raspberrypi.*/|${src_url_raspi}|g" ${src_file_raspi}
    fi
    if [[ "$os" == "manjaro" ]]; then
        src_url_sjtug='https://mirrors.sjtug.sjtu.edu.cn/manjaro/stable/$repo/$arch'
        src_url_ustc='https://mirrors.ustc.edu.cn/manjaro/stable/$repo/$arch'
        src_url_tsinghua='https://mirrors.tuna.tsinghua.edu.cn/manjaro/stable/$repo/$arch'
        src_url="src_url_$src_name"
        src_url=${!src_url}
        echo TBD
    fi
    echo done.
}

changesrc

