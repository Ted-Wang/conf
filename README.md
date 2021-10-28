conf/cheatsheets/                                                                                   000755  000765  000024  00000000000 14133765512 014733  5                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         conf/cheatsheets/idea_tips.md                                                                       000644  000765  000024  00000006030 14133765512 017215  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         # IDEA tips

[TOC]

## Resource

https://github.com/judasn/IntelliJ-IDEA-Tutorial/blob/master/keymap-introduce.md
IntelliJ IDEA 简体中文专题教程：https://github.com/judasn/IntelliJ-IDEA-Tutorial
Debug 介绍：https://github.com/judasn/IntelliJ-IDEA-Tutorial/blob/master/debug-introduce.md
IntelliJ IDEA 2017.1 的新功能 , JetBrains 中文官网：http://www.jetbrains.com.cn/idea-whatsnew.html

IntelliJ Idea 常用快捷键 列表(实战终极总结！！！！) https://my.oschina.net/dyyweb/blog/494504
> 这篇常用的的确常用，但是不全



## Shortcut Keys

### Frequently Used Shortcut Keys

| Key | Comments |
| :--- | :--- |
|*ESC/F12|jump between last tool window and editor window|
|ctrl+shift+m|括号跳转|
|Ctrl+Alt+V|提取变量？尝试使用|
|Alt+Up/Down|Previous/Next Function （在XML，HTML文件中，非常好用）|
|fori/sout/psvm/iter/itar|用 Ctrl+J 查看所有模板|
|Ctrl+`|切换 color theme/Keymap/Look and Feel|
|Alt+Shift+Insert| 切换列编辑模式，切换以后，可以 shift 选择列编辑 |
|Ctrl+Alt+Insert|create new file, in current directory|
|Ctrl+E/Ctrl+Shift+E|打开最近【打开过/编辑过】的文件|
||另外，Intellij IDEA 13中加入了后缀自动补全功能(Postfix Completion)，比模板生成更加灵活和强大。例如要输入for(User user : users)只需输入user.for+Tab。再比如，要输入Date birthday = user.getBirthday();只需输入user.getBirthday().var+Tab即可。|
|Alt+F7|find usages，查找【类/方法】在哪里被使用， list result in bottom window|
|Ctrl+F7|find usages in current file|
|Ctrl+Shift+F7|highlight usages in current file|
|Ctrl+Alt+F7|find usages， show result in popup|
|Ctrl+Alt+Shift+F7|find usages settings|
|运行：Alt+Shift+F10运行程序，Shift+F9启动调试，Ctrl+F2停止。
|Shift+F10|run/debug|
|Ctrl+Shift+F10|run Ant target，run script|
|Alt+Shift+10|会弹出选择 Main 函数的context|
|Ctrl+H|open class hierarchy|
|Ctrl+Alt+H|open method call hierarchy (focus on a method, apply, see how many calls to this method)|
|Ctrl+Shift+H|open method impl hierarchy (focus on a method, apply, see how many implementations)|
|Ctrl+Alt+up|在查找模式下，跳到上个查找的文件|
|Ctrl+Alt+down|在查找模式下，跳到下个查找的文件|
|Shift+F4|对当前打开的文件，使用新Windows窗口打开，旧窗口保留|
|Alt+Left/Right|这个的真正用途是，在debug等窗口中切换子视图|
|Ctrl+Alt+Y|同步/刷新，是做什么用的？？|



### Less Used Shortcut Keys

<table>
    <thead>
        <tr>
            <th>Layer 1</th>
            <th>Layer 2</th>
            <th>Layer 3</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=4>L1 Name</td>
            <td rowspan=2>L2 Name A</td>
            <td>L3 Name A</td>
        </tr>
        <tr>
            <td>L3 Name B</td>
        </tr>
        <tr>
            <td rowspan=2>L2 Name B</td>
            <td>L3 Name C</td>
        </tr>
        <tr>
            <td>L3 Name D</td>
        </tr>
    </tbody>
</table>


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        conf/cheatsheets/linux.txt                                                                          000644  000765  000024  00000011114 14133765512 016631  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         ### 源 source
* SJTUG 上海交大软件源镜像服务 https://mirrors.sjtug.sjtu.edu.cn/#/
    * raspberrypi，/etc/apt/sources.list.d/raspi.list
        > http://archive.raspberrypi.org/debian/  ->  https://mirrors.sjtug.sjtu.edu.cn/raspberrypi/debian/
    * Ubuntu，配置文件：/etc/apt/sources.list
        > http://cn.archive.ubuntu.com/ubuntu  ->  https://mirrors.sjtug.sjtu.edu.cn/ubuntu
    * Manjaro，配置文件在：/etc/pacman.d/mirrorlist，尽量不要直接修改这个文件，备份一下，用下面命令选择源
		> sudo pacman-mirrors -i -c China -m rank 	    //更新镜像排名，选择中国源
        > sudo pacman -Syy
    * LinuxMint，配置文件在：/etc/apt/sources.list.d/official-package-repositories.list
        > 注意，完成后请不要再使用 mintsources（自带的图形化软件源设置工具）进行任何操作，因为在操作后，无论是否有按“确定”，mintsources 均会复写
        > 对于 LinuxMint 上海交大和清华都提供了源，但是没有提供帮助。只有中科大源提供了帮助文本。
        > https://mirrors.ustc.edu.cn/help/linuxmint.html

* 清华源 https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/

* USTC Mirror 中科大源 https://mirrors.ustc.edu.cn/help/manjaro.html

### vBox add user to group vboxsf
sudo usermod -aG vboxsf $(whoami)		# whoami 执行结果是当前用户名，注意别忘了 -a，否则移除了其他组
sudo gpasswd -a $USER vboxsf		    # $USER 也是当前用户名

### 自动启动
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart        # 程序自动启动，这个对 Ubuntu 和 Manjaro 都适用

### editor, gvim
#- 卸载默认vim，然后安装gvim(vim-gtk)
sudo apt purge vim
sudo apt install vim-gtk

#- set vim as default editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
sudo update-alternatives --config editor

### 通过 gsettings 修改默认 terminal
gsettings set org.gnome.desktop.default-applications.terminal exec guake
sudo update-alternatives --config x-terminal-emulator	# 这个配置优先级很高，会覆盖 dconf 和 系统默认应用中的配置

### 字体 font
字体 fallback 问题，sudo vim /etc/fonts/conf.avail/64-language-selector-prefer.conf，把 SC 提前，JP放后面
fc-cache -fv

### Dekstop hung
ctrl+alt+F1~F6, switch to other tty, then kill the XOrg tty to restart Desktop.
ps -t tty7
kill PID

systemctl start/stop lightdm/gdm/kdm/mdm                                # 启动 停止 GUI/Xorg
systemctl get-default/set-default multi-user.target/graphical.target    # 默认启动到 CLI/GUI

### hostname 解析问题
/etc/hosts, /etc/hostname

sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf           # 解决 hostname 不能解析，只能 ping hostname.local 问题。改成这个 symlink 之后，查看 /etc/resolv.con 内容，地址应该是路由器，而不是本机了。

### 黑屏问题
Lubuntu安装完后启动黑屏，是登录界面启动太早，在其他tty登录，然后 sudo vi /etc/lightdm/lightdm.conf
	[LightDM]
	logind-check-graphical=true

### apt-get
update是更新软件列表，upgrade是更新软件。
apt = apt-get、apt-cache 和 apt-config 中最常用命令选项的集合。
apt 命令由于有交互式功能(进度条，Y/N确认等等)，所以只适合在 CLI 人机交互界面中使用。而 apt-get 才是为了脚本设计的

sudo apt search fcitx		# 搜索仓库
sudo apt show fcitx		    # 显示包详细信息
dpkg -l | grep -i fcitx		# 显示已安装包

sudo apt-get -y install package     # install without confirm
sudo apt install ./<file>.deb		# 安装本地.deb包

### pacman
pacman --help
pacman -S --help

pacman -S package		# 安装package。注意，-S是同步的意思
pacman -R package_name	# 删除单个软件包，保留其全部已经安装的依赖关系
pacman -Rs package_name	# 删除指定软件包，及其所有没有被其他已安装软件包使用的依赖关系：

pacman -Qs regex		# 查询本地已安装的包，参数s表示search，如果使用正则，要加双引号
pacman -Ss regex		# 在远程包数据库里查询软件包。通常就用这个查找包。

pacman -Ss php
pacman -Qs java

pacman -Qi 		# 可以查询已安装的包的信息，很详细。不带参数，需要配合grep使用。如果要指定包名，必须准确。
pacman -Si		# 同上，查询远程包信息。这两个(带i查询)都不支持正则

pacman -Syu		# 升级整个系统。【小心】！ 
pacman -Syy		# -Sy, download fresh package databases from the server (-Syy to force a refresh even if up to date)


[//]: # ( vim: set syntax=markdown: )

//vim: set syntax=markdown:
                                                                                                                                                                                                                                                                                                                                                                                                                                                    conf/cheatsheets/VSCode.txt                                                                         000644  000765  000024  00000000742 14133765512 016622  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         Ctrl + M    Toggle Use of Tab Key for Setting Focus 

Please note that in order to switch to a tab that is in a different editor group, you must first switch to the desired editor group.
----什么是 edit group？

ctrl+shift+[/]   fold/unfold

switch between tabs
ctrl+tab，ctrl+shift+tab
alt+1/2/3...
shfit + mouse wheel


Emmet
table>thead>th{head}*2^tbody>tr*10>td{row}*2
table>thead>th*2^tbody>tr*10>td*2

VSCode Multi-cursor edit
Alt+left click
Alt+shift+up/down/left/right
                              conf/cheatsheets/youtube-dl.txt                                                                     000644  000765  000024  00000001755 14133765512 017575  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
### youtube-dl
官网: https://yt-dl.org/
Github: https://github.com/ytdl-org/youtube-dl

#### 使用
youtube-dl -U
youtube-dl --proxy 127.0.0.1:2080 -U
youtube-dl --version

youtube-dl url
youtube-dl --proxy 127.0.0.1:2080 -F <url>      # list all formats
youtube-dl -f 137+140 url                       # 下载指定格式，【视频+音频】
youtube-dl url -o "path\%(title)s.%(ext)s"      # 指定下载文件路径

#### Linux 安装
To install it right away for all UNIX users (Linux, OS X, etc.), type:
	sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
	sudo chmod a+rx /usr/local/bin/youtube-dl

If you do not have curl, you can alternatively use a recent wget:
	sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
	sudo chmod a+rx /usr/local/bin/youtube-dl

#### windows安装
下载，安装 python，FFmpeg，youtube-dl.exe，并都加入path
python --version，ffmpeg -version，youtube-dl --help 分别检查安装

                   conf/cheatsheets/git_cheatsheet.txt                                                                 000644  000765  000024  00000035017 14133765512 020462  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         [git][git frequently used commands][git/cheatsheet][git cheatsheet]

# From the docs of git diff, --staged is a synonym of --cached

git init
git init prjDir                             # 指定初始仓库的名字，并创建对应目录
git init --bare prjDir.git                  # 创建一个初始仓库（中心仓库），这个仓储不会有工作目录，通常用于在服务器上创建一个裸仓库。

git status
git add *                                   # 不包括删除的文件，也不包括.开头的文件
git add -u	                                # stage the modified and deleted files (exclude untracked/new files)
git add .                                   # stages new files and modifications, without deletions
git add -A                                  # states all changes。如果pwd在子目录，则 parents 目录的修改也包括在内，并且也包括所有新增、删除的文件。
git commit -m "message"
git commit -am "message"                    # 以上2步合成一步，但是注意，这样只提交“修改过的文件，包括删除的”，新添加的文件，没有被tracked，必须用 git add
git commit -a                               # 使用-a可以查看有哪些文件会被提交，不填message即可取消提交，相当于dry run
git commit --amend							# 合并修改，并且弹出 message 编辑器，可以修改上次的 message
git commit --amend -m "Fixes bug #43"		# 合并修改，并且添加 message
git commit --amend --no-edit				# 合并修改，但是不修改 message
合并修改最后一个commit，相当于把index区域的内容和最后一个commit合并，并修改message。
注意：要先 git add *，否则工作区的内容是不会被提交的。
git checkout <tag_name>/<branch>
git checkout tags/<tag> -b sit              # checkout tag to new brach
git show                                    # show diff of last commit。show 可以指定各种对象，显示内容大不相同。
git show <tag>
删库：1）删除.git目录，2）删除整个 project 目录(就是包含.git目录的那个目录)
	rm -rf .git
	cd .. && rm -rf projectDir

git mv <old_name> <new_name>                # rename，重命名，不同于直接 mv，这是能在 git status 里追踪到的
git rm <file_name>                          # 从 stage 区域删除文件（同时删除工作区中的文件）。
                                                # 如果是用 rm 删除了文件，可以选择：1）执行 git rm 或者 git add <file>，把删除操作推送到stage区，然后再commit。2）git commit -am "message"
git rm -r mydir                             # 删除目录
git rm -r --cached mydir                    # 仅仅从 stage area 删除文件（工作区保留）

git restore --staged <file>                 # 撤销 git rm 的删除
git checkout -- <file>                      # 撤销 rm 删除的文件(刷先从工作获取文件，没有则从版本库更新文件，会丢失没有提交的修改)
git reset HEAD -- <file>                    # 从版本库获取文件，覆盖 index 区，工作区保留。--hard，同时覆盖工作区。
git reset HEAD~1                            # undo 最后一次 commit
git reset HEAD                              # undo git add *，相当于 git reset？
git reset HEAD --hard                       # undo，并且同时修改当前工作区
git checkout -- <filename>                  # 回滚一个文件

git reflog                                  # 显示 HEAD 的变化历史，可以找到上一次 HEAD 指向的 commit，再次使用 reset 命令恢复

git blame myClass.java                      #  https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-blame

git log --oneline origin/master
git log -p master..origin/master
git log -3
git log origin/master                       # git fetch 以后，可以看到 master 和 origin/master 之间差了多少个 commits。
git log --oneline --decorate                # #oneline 只显示 hash 和 message，decorate 会同时显示所有 references (e.g., branches, tags, etc)
git log --stat                              # 显示每个 commit 增加了多少行，删除了多少行(修改一行会被显示 增加1行+删除1行)
git log -p                                  # 显示每个 commit 具体的修改内容
git log --author="<pattern>"                # 搜索指定作者的commit. <pattern>可以是正则表达式.
git log -S"Hello, World!"                   # display commits by content
git log -- <file1 file2>                    # 只显示指定文件的 commits.
git shortlog -n                             # 按 author name 分组统计显示每个 user 的 commits。 默认按 author name 排序，-n 是按 commits 数量排序
git log --no-merges                         # 过滤掉所有 merge log。
git log --merges                            # #This returns all commits that have at least two parents.
git log --author="\(Adam\)\|\(Jon\)"
git log --author="username" --pretty=format:"%h - %an, %ar : %s"
git log --author='^(?!Adam|Jon).*$' --perl-regexp
git log --author="ted" | grep BUG-1916 -C5
git log | grep LYKC-11519 -B5/-C5/-A5       # print NUM of lines (B)fore/(A)fter/both context. 显示匹配行的 前/后/前后 5 行.

git log --oneline --graph --decorate --all  # show graphical commit history
gitk                                        # pop up a window showing commit graph. The command needs to be installed separately.
gitk --all                                  # 参数可以替换成 branch name. Git-bash 自带了这个图形化工具。 

git tag
git tag -l 'v1.4.2.*'
git tag -a v1.4 -m 'my version 1.4'
git show v1.4
git show <commit> --name-only --pretty=""   # 显示改动的文件列表，--pretty="" 表示 empty format，效果是去除了 commitId，comments 等内容，只显示被修改的文件列表
git tag `date "+%Y-%m-%d_%H-%M-%S"`
git tag -d <tagname>                        # 删除一个tag
git fetch --all --tags --prune              # fetch all tags
git tag -l '*11.1.6.2590'                   # list tag with wildcard match
git checkout tags/build-tags/ci/build-2019.3.6.90 -b sit    # checkout a tag to a new local branch
git fetch origin tag 2.3.18 --no-tags       # fetch specific tag

git branch
git branch -vv                              # 查看当前分支以及上游分支
git branch -r	                            # show all remote branch
git branch -r --list '*19*'	                # show remote branch with matched pattern(s).
git branch --list '*19*'                    # show local branch with matched pattern(s).
git branch dev                              # 创建分支
git checkout -b dev                         # 创建并切换到dev分支
git checkout -b dev origin/dev              # 创建并同步远程分支到本地
git checkout master
git switch -c dev                           # 新版本的Git提供了新的git switch命令来切换分支
git merge dev
git merge origin/master
git merge --squash <branch>
git merge --abort/--continue
git cherry-pick <commit>
git cherry-pick --abort/--continue
git branch -d dev test                      # 删除本地分支dev、test（没有merged的分支无法删除）
git branch -d -r origin/todo origin/html origin/man     # 删除远程分支todo、html、man
git branch -D dev                           # 强行删除分支（包括没有merged的分支），Shortcut for --delete --force.
git push -d origin <branch_name>            # 删除远程仓库中的分支. TODO 这个命令只删除了远程仓库的，别忘了在删除本地分支

git stash
git stash pop/apply/drop/list/clear
git stash pop/apply/drop 1
git stash -u	                            # including untracked files(new files)
git stash -a	                            # stash all files, including "ignored files"
git stash show -p 0                         # diff against a stash
git stash push -m "message" path/to/file.ext
git stash push src/		                    # stash changes in the src/ directory

git remote -v/-vv
git remote set-url origin <url>
git remote set-url --add origin <2nd_url>   # 给 origin 添加多个 url，这样就可以同时 push 到多个仓库
git remote add <name> <url>
git remote rm <name>
git remote rename <old-name> <new-name>

git fetch origin master
git fetch                                   # 从远程获取最新版本到本地，但不会自动merge。
git fetch --dry-run                         # 查看有多少更新
git pull                                    # 可以认为是git fetch和git merge两个步骤的结合。
git pull --rebase                           # 这样做的 commit history 更好看，而且，还可以避免一个 merge commit
git pull --no-rebase                        # 新版本 git 默认 rebase，这个命令可以强制 merge
git fetch <远程主机名> <分支名>
	git fetch origin master	                # 如果是裸仓库，没有origin，可以先 git remote add origin <url>
git pull <远程主机名> <远程分支名>:<本地分支名>
	git pull origin master		            # 通常本都是省略本地分支名，表示合并同名分支
* 如果 git pull 发生冲突(conflicts)，解决冲突之后要 git add conflict_file，然后 commit

### 如果本地有修改但是没有 commit，则 git pull 会退化成 git fetch，并提示让用户 merge，相当于执行了
	git fetch origin master
### 这时候，可以具体查看一下修改，然后先 stash 本地修改，在 git pull 一次，或者直接 merge origin/master 到本地的 master
    git log -p master..origin/master
    git stash
    git merge origin/master
    git stash pop

git push <远程主机名> <本地分支名>:<远程分支名>
    git push --dry-run                      # 查看结果，不做真实推送。
    git push origin master
    git push origin --tags                  # git默认不会push tags
git push --set-upstream <remote-name> <local-branch-name>
git push -u origin your_branch

### git 多个远程仓库操作
git remote add/rm <name> <url>              # 添加/删除一个远程仓库
git log mint/master                         # 查看指定仓库历史
git remote set-url origin <url>             # 更新远程仓库地址
git remote set-url --add origin <2nd_url>   # 给 origin 添加多个 url，这样就可以同时 push 到多个仓库
git remote rename <old-name> <new-name>     # 修改远程仓库名字
git pull mint master                        # 从指定远程分支拉取
git push mint                               # push 到指定远程分支

git config --global/system/local -l
git config --global -e
git config --global core.editor <editor>
git config --global core.editor "vim"
git config --global user.name <name>
git config --global user.email <email>

git config --global http.proxy http://proxyuser:proxypwd@proxy.server.com:8080  # proxy
git config --local http.proxy socks5://server.com:1080
git config --local https.proxy socks5://127.0.0.1:2080                          # socks5 proxy for HTTPS

git update-index --skip-worktree <file-list>                                    # ignore some files locally
git update-index --no-skip-worktree <file-list>                                 # Reverse locally ignore

system config file: <git-root>/mingw64/etc/gitconfig
	$(prefix)/etc/gitconfig	    # Linux
global config file: %homepath%/.gitconfig
local config file: <repo>/.git/config

git config命令		--system，--global，--local(默认写入)和--file <filename>
https://www.yiibai.com/git/git_config.html
读取时，默认情况下从系统，全局和存储库本地配置文件读取这些值，而选项--system，--global，--local和--file <filename>可用于告知命令从只有那个位置设置和读取。
写入时，默认情况下将新值写入存储库本地配置文件，并且可以使用选项--system，--global，--file <filename>来告诉命令写入该位置(可以指定为 --local，但这是默认值)。

git diff                                                # 此命令比较的是工作目录(Working tree)和暂存区域快照(index)之间的差异，也就是修改之后还没有 staging 起来的变化内容。
git diff --stat                                         # 显示两个版本差异的统计信息
git diff --cached   	                                # 比较索引和最后一次 commit 之间的变化; 查看已经 add ，但没有 commit 的改动。
git diff HEAD       	                                # 自上次提交以来工作树中的更改；包括工作区和已经staged的修改。如果运行“git commit -a”，查看将会提交什么(不填message会取消提交)。
git show <commit> -s/-p                                 #  -p表示 generate patch，就是显示 diff 内容，-s 表示 no-patch
git diff-tree -p <COMMIT>                               # 显示 commit 相对于其 parent commit 的修改。与 git show 不同的是，这个不显示comments，而且结果不用 d/u 滚动，直接打印全部的 diff 内容。
git diff HEAD^^ HEAD^                                   # git diff 的意思是，显示从前一个 commit 到后一个 commit 的变化，所以应该把 parent commit 放在前面，否则显示的修改是反过来的。
git diff 15dc8^!                                        # 比较 commit 和其 parent commit
git config --global diff.tool winmerge/vimdiff		    # 配置 diff.tool，保证 winmerge/diff 的可执行文件在path中。主要的几种diff工具，git会自动配置。“mingw64\libexec\git-core\mergetools”
git config --global difftool.prompt false				# 取消 difftool 的确认提示
配置好之后，使用 git difftool 命令代替 git diff 即可

git merge-base branch1 branch2                          # 查找2个 branch 的 公共 base point

一文告诉你如何导出 Git 变更文件 https://zhuanlan.zhihu.com/p/74796130
方法1，使用 git 自带命令 git archive, 语法如下。
	git archive -o c:/Users/yourusername/Desktop/export.zip NewCommitId $(git diff --name-only OldCommitId NewCommitId)
	git archive -o c:/Users/yourusername/Desktop/export.zip 479d554cf570edcc28c20ce264c6f216f8223bf3 $(git diff --name-only a838d0512e84e5eb42569cce3ef305d3ac1c44d0 479d554cf570edcc28c20ce264c6f216f8223bf3)
方法2，下载 TortoiseGit Git 客户端软件，使用方法和 svn 的 export 功能类似。


Pro Git book https://git-scm.com/book/zh/v2
Reference https://git-scm.com/docs

【易百教程】Git教程 https://www.yiibai.com/git
【廖雪峰】Git教程 https://www.liaoxuefeng.com/wiki/896043488029600
atlassian 的 git tutorials https://www.atlassian.com/git/tutorials
[译]Atlassian Git系列教程 https://www.cnblogs.com/irocker/p/atlassian-git-tutorials.html


[//]: # ( vim: set syntax=sh: )

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 conf/cheatsheets/shell.txt                                                                          000644  000765  000024  00000021640 14133765512 016606  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
ctrl+x ctrl+e then ZZ   # send command to vim for editing, then ZZ exit vim, the command will be execute directly.
#- 如果你有输了个命令行，但是你改变注意了，但你又不想删除它，因为你要在历史命令中找到它，但你也不想执行它。
    #- 那么，你可以按下 Alt-#(alt+shift+3) ，于是这个命令关就被加了一个#字符，于是就被注释掉了。

#* 如何在远程服务器运行一个本地脚本
	#- 无参数
		ssh user@server 'bash -s' < local.script.sh
	#- 有参数
		ssh user@server ARG1="arg1" ARG2="arg2" 'bash -s' < local_script.sh

cp file{,.bak}          # a shorten typing to backup a file
touch file_{a..z}.txt   # create a bunch of files
echo {10..20..2}        # generate a number list
#- combine several commands' output together
{ echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls; } > PNGs.txt

#- redirect script's output to a file combined with a timestamp. useful in crontab job.
myscript.sh 2> >( while read line; do echo "$(date): ${line}"; done > error.log ) 1>&2

alias wol='bash /d/ws/sync/conf/script/wol.sh'
alias wol='bash ~/prj/conf/script/wol.sh'

nohup command > executing.log 2>&1 &
alias simu='java -jar system-monitor.jar | tee -a sys-mon.log >/dev/null 2>&1 &'    # tee -a means append

echo "abc" | tee f1 f2      # 将前一个命令的输出，（在输出到 stdout 的）同时输出到 f1 和 f2 中。

watch -n 1 "df -m && du -h --max-depth=0 .m2"

curl -x 172.17.1.110:10809 google.com
curl -x socks5://172.17.1.110:10808 google.com
curl -LO url
curl -L -o fileName url

alt+.       # means the last argument of previous command, repeat to get other one before previous
!^/!*       # both stand for all arguments of previous command

ls | grep -v file.txt | xargs rm        # rm other files except file.txt in current folder

curl -X GET "http://192.168.50.101:10000/?pf=zn&contract=2012&value=8000"
curl -LO <url>

scp user@server:/path/to/remotefile.zip /Local/Target/Destination

echo `date +%H:%M:%S`,`my_script.sh` >> ~/cputemp/`date +%Y-%m-%d`.csv
sudo blkid | column -t

sed -E 's/regex/replacement/g' inputFile > outputFile   # search and replace based on lines, then output to a new file.
sed -i 's/abc/def/g' fileName   # use -i to modify origin file, than means outputFile is same as inputFile.
sed -i.bak 's/abc/def/g' file   # modify file, and backup file.
sed -i 's/word/d' fileName      # delete lines which contains 'word'

tail -f -n -1000 jboss.log      # -f, follow append data; -n line number; -1000, lines to be print.
cat -n jobss.log                # print file with line number
grep -n "" jboss.log            # same as above
dpkg -l | grep fcitx | wc -l    # count "fcitx" related packages

echo -n > file  # empty a file
ls -i file      # show inode
ls -d ~/*/      # list only directories
ls -l | grep "^d"   # same as upper
ls -p | grep -v /   # list only files
find * -maxdepth 0 -type f          # same as upper one
du -h --max-depth=0 ~/myfolder      # show size of myfolder
du -h --max-depth=0 --exclude=.git ~/ws     # show size of repo 'conf', without meta data.

### compress, decopress/uncompress
	tar -xvf jdk-8u5-linux-x64.tar.gz
	tar -cvf test.tar.gz file1 file2 folder/*
	tar -I zstd -xvf archive.tar.zst
	tar --zstd xvf archive.tar.zst
	unzip package.zip -d dest_folder		# must use -d specify the dest folder
	unzip -l file.zip						# list files

grep -irn "regex" ~/folder  # search all files in ~/folder for "regex". i, ignore case; r, recursive; n, line number & content.
grep -irl "regex" ~/folder ~/other/file # l, show file names with matches content; L, show file name without matches. 
grep -irl --include=ted.*rc "font" ~/   # search all my personal rc files, with font related conf, only show file name.

find common_conf/ linux_conf/ -name *ted*
find conf/ | grep -i ted
find ~/ -iname 'ted'        # find file whose name is exactly 'ted', but match the letters case-insensitively.
find ~/ -name 'ted' -type f # do not display directories, sockets, or other non-regular file types. 
find ~/ -name 'ws' --maxdepth 3 -type d # find directories named ws, limit subdirectory traversal to 2 levels beneath the specified directory.
find ~/ -group dev          # list files in ~/ whose owning group is 'dev'
find . -name \*log\* -cmin -30 -exec grep -nH 'OrderSattus in StateMachine is not correct' {} ';'

find ./ -name "*.log" -type f -mmin -30 -delete	# use -delete, delete files modified in 30 days
find /path/to/files* -mtime +30 -exec rm {} \;	# Delete files older than 30 days
find /tmp -mindepth 1 -mtime +14 | xargs rm     # us xargs

### CLI tips
#- move
- alt+f/b move foward/backward a word
- ctrl+a/e move to the start/end of line
- ctrl+left/right, home/end  works for some terminal

#- cut and paste
- ctrl+shift+- undo, ----其实是ctrl+_  ，没找到redo
- ctrl+k/u cut from cursor to the end/start of line
- alt+d/BS cut from cursor to the end/start of word
- ctrl+w cut from cursor to previous whitespace
- ctrl+y paste the last cut text
- alt+y loop through and paste previously cut text (must use it after ctrl+y)
- CTRL+t Swap the last two characters before the cursor.
- ESC+t Swap the last two words before the cursor.

#- OP on history
- ctrl+r then type term, to search over history, repeat ctrl+r to loop through matched results
- ctrl+r twice, search the last remembered search term
- ctrl+j end the search and keep the current matching histroy entry. ESC will be OK as well, but will got a beep
- ctrl+g cancel the search and restore original line
- Up/Down arrow keys，go through the history

### String Operation in shell script
str="a sample string"
echo ${#str}
echo ${str:2:9}
echo ${str:0-13:9}
echo ${str#*sam}        # get string right of "sam"
echo ${str##*\ }        # get string right of last " "
echo ${str%am*}         # get string left of "am"
echo ${str%%\ *}        # get string left of last " "

str5="${name}Script: ${url}index.html"  # concatenate strings

### add proxy for shell
export http_proxy=http://127.0.0.1:8118
export https_proxy=http://127.0.0.1:8118

### SSH
issh-keygen -t rsa -b 4096 -C "teddddddd@gmail.com" -f ~/.ssh/id_rsa
ssh-keygen -l -f ~/.ssh/id_rsa
ssh-keygen -p [-P old_passphrase] [-N new_passphrase] [-f keyfile]	# 修改 passphrase
ssh-keygen -p [-f keyfile]		        # 修改 passphrase
ssh-keygen -y [-f input_keyfile]		# 通过私钥查看公钥

SSH agent 程序能够将已解密的私钥缓存起来，在需要的时候提供给您的 SSH 客户端。这样，就只需要将私钥加入 SSH agent 缓存的时候输入一次密码短语（passphrase）就可以了。
eval `ssh-agent -s`		                # start the ssh-agent in the background
ssh-add ~/.ssh/id_rsa	                # Add your SSH private key to the ssh-agent.
ssh-add -l		                        # 列出所有的 key，这命令可以用来显示当前 key agent 里缓存了多少密钥
ssh-add -L	                            # 列出所有 key，并显示完整的公钥，这个命令可以来导出公钥，所以，公钥也可以删了。
* ssh-add -l 是从ssh-agent里 check 已经添加的私钥。如果是直接对 key file 操作，使用上面的 ssh-keygen -lf key_file

~/.ssh/config, known_hosts, authorized_keys             # ssh 相关配置文件
/etc/ssh/ssh_config, sshd_config

ssh -i <key-file> -p <port> -o StrictHostKeyChecking=no -o TCPKeepAlive=yes -o ServerAliveInterval=30 user@host
ssh-copy-id user@host
ssh-copy-id -f -i ~/.ssh/id_rsa.pub -p 22 user@host	    # -f 不校验 key 强制 copy，用于当私钥已经被删除的场景

ssh -T git@github.com			                        # 测试连接
ssh -T -p 443 git@ssh.github.com		                # 测试在 HTTPS 端口使用 SSH

scp -r user@host:~/path/to/file ./
scp -J jumpServer host:~/path/to/file ./local/file
rsync
time sudo rsync -r user@host:~/path/file.zip /mnt/d/temp/rd/ >> ~/rsync.log         # 同步远程文件到本地，写入日志. time 计时。
rsync -azv -e "ssh -A -J jumpServer" host:~/path/to/file ./                         # 通过 ssh 跳板，同步文件
time sudo rsync -r --exclude 'lost+found' /sftp/wd4t-3/* /sftp/wdg1/ >> rsync.log   # 使用 rsync 备份本地文件。
注意：
1. 只要目的端的文件内容和源端不一样，就会触发数据同步，rsync会确保两边的文件内容一样。
2. 但rsync不会同步文件的“modify time”，凡是有数据同步的文件，目的端的文件的“modify time”总是会被修改为最新时刻的时间。
3. rsync不会太关注目的端文件的rwx权限，如果目的端没有此文件，那么权限会保持与源端一致；如果目的端有此文件，则权限不会随着源端变更。
4. 只要rsync有对源文件的读权限，且对目标路径有写权限，rsync就能确保目的端文件同步到和源端一致。
5. rsync只能以登陆目的端的账号来创建文件，它没有能力保持目的端文件的输主和属组和源端一致。（除非你使用root权限，才有资格要求属主一致、属组一致）


[//]: # ( vim: set syntax=sh: )
                                                                                                conf/cheatsheets/IDEA.txt                                                                           000644  000765  000024  00000014523 14133765512 016203  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         ### IDEA custmization
#### 快捷键配置
ctrl+alt+s, open settings, then open keymap
    * on search input box, you can search by action
    * or click "find Actions by Shortcut" on top right corner.
- search "ctrl+space", then add keyboard shortcut "alt+shift+enter"
- search "delete line", set the shortcut to "shift+D"


### 整理一个 IDEA 快捷键列表，分级
* L1, survival, 各种 open，search，iter/itar/psvm，
* L2, Normal work
* L3, Special keys
* L4, Deeper skills

* 以某一按键为中心来记，比如，F7相关的都是 find usages， F10都跟 run 相关
* 使用Ctrl+Shift+A 关键词来看有什么相关的快捷键，比如，搜 usage，就可以找到跟 F7 相关的所有 find usages 一组快捷键
* 一些操作技巧，比如，Atl+1，ESC，shift+ESC配合使用的效果

快捷键
https://github.com/judasn/IntelliJ-IDEA-Tutorial/blob/master/keymap-introduce.md
IntelliJ IDEA 简体中文专题教程
https://github.com/judasn/IntelliJ-IDEA-Tutorial
Debug 介绍
https://github.com/judasn/IntelliJ-IDEA-Tutorial/blob/master/debug-introduce.md
IntelliJ IDEA 2017.1 的新功能 , JetBrains 中文官网
http://www.jetbrains.com.cn/idea-whatsnew.html

IntelliJ Idea 常用快捷键 列表(实战终极总结！！！！)
https://my.oschina.net/dyyweb/blog/494504
【这篇常用的的确常用，但是不全】

IDEA notes:
Alt+Up/Down         Previous/Next Function （在XML，HTML文件中，非常好用）

用Ctrl+W，选中需要的块，然后用左右方向键，快速定位到首/尾位置
Ctrl+Shift+[        选中从光标所在位置到它的顶部中括号位置 （必备）
Ctrl+Shift+]        选中从光标所在位置到它的底部中括号位置 （必备）
Ctrl+Shift+Left     在代码文件上，光标跳转到当前单词 / 中文句的左侧开头位置，同时选中该单词 / 中文句 （必备）
Ctrl+Shift+Right    在代码文件上，光标跳转到当前单词 / 中文句的右侧开头位置，同时选中该单词 / 中文句 （必备）

Ctrl+Shift+F7       高亮显示所有该选中文本，按Esc高亮消失 （必备）

Ctrl+Shift+Left     光标放在方法名上，将方法移动到上一个方法前面，调整方法排序 （必备）
Ctrl+Shift+Right    光标放在方法名上，将方法移动到下一个方法前面，调整方法排序 （必备）
-----------------------------------------------------------------------------------------------------

Shift+左键单击      关闭当前打开的文件
Shift+滚轮          在当前文件横向滚动

Alt+ESC
Alt+1，切换到 project 窗口， ESC可以使 focus 回到编辑器，在用 Alt+ESC， 可以影藏刚才打开的窗口

Ctrl+[/]/m          移动到括号的 开始/结束/切换
Ctrl+shift+m        在括号的开始/结束之间切换

Ctrl+Shift+Alt+T	打开 Refactor 菜单
Ctrl+Alt+T          打开 Surrounding with 菜单
Ctrl+P              查看方法参数

Alt+·               显示版本控制常用操作菜单弹出层【必备】
Alt +Q              快捷显示当前行在哪个方法里(如果方法体太长，一屏显示不下这个很有用）.

不选中，直接 Ctrl+C 复制当前行
Ctrl+Shift+V        高级粘贴

ALT+F7              搜索所有引用到当前选中 Symbol 的地方
CTRL+ALT+F7         浮窗打开 搜索所有引用到当前选中 Symbol 的地方

ALT+7/Ctrl+F12      靠左窗口/浮动 显示当前文件的结构 


ALT+SHIFT+C         查找最近修改过的文件
F4                  跳转到变量定义


F2/Shift+F2         高亮错误或警告快速定位

Ctrl+B              跳转到 Class/Interface
CTRL+ALT+B          跳转到实现类
CTRL+SHIFT+B        跳过变量定义，直接打开实现类



Ctrl+Alt+V          提取变量 
----------------------------------------------------------------------------------------------------------

Ctrl+Alt+Y          同步/刷新，是做什么用的？？
Ctrl+Alt+V          提取变量？尝试使用
Alt+F3              尝试使用，这个跟 Ctrl+F3 不一样，这个会直接高亮所有，但是需要先选中

Ctrl+H              open class hierarchy
Ctrl+Alt+H          open method call hierarchy (focus on a method, apply, see how many calls to this method)
Ctrl+Shift+H        open method impl hierarchy (focus on a method, apply, see how many implementations)

Ctrl+Alt+up         在查找模式下，跳到上个查找的文件
Ctrl+Alt+down       在查找模式下，跳到下个查找的文件

fori/sout/psvm/iter/itar, 用Ctrl+J查看所有模板
Ctrl+`              切换 color theme/Keymap/Look and Feel

Alt+Shift+Insert    切换列编辑模式，切换以后，可以 shift 选择列编辑

Alt+Insert          Focus在editor上的时候，是插入getter/setter等等，focus在Navigator上的时候，是 new file

Ctrl+Alt+Insert     create new file, in current directory
Ctrl+Shift+Insert/Ctrl+Shift+V	paste from history


另外，Intellij IDEA 13中加入了后缀自动补全功能(Postfix Completion)，比模板生成更加灵活和强大。例如要输入for(User user : users)只需输入user.for+Tab。再比如，要输入Date birthday = user.getBirthday();只需输入user.getBirthday().var+Tab即可。

Alt+F7              find usages，查找【类/方法】在哪里被使用， list result in bottom window
Ctrl+F7             find usages in current file
Ctrl+Shift+F7       highlight usages in current file
Ctrl+Alt+F7         find usages， show result in popup
Ctrl+Alt+Shift+F7   find usages settings

Ctrl+E/Ctrl+Shift+E 打开最近【打开过/编辑过】的文件

【需要研究一下】
运行：              Alt+Shift+F10运行程序，Shift+F9启动调试，Ctrl+F2停止。 
Shift+F10           run/debug
Ctrl+Shift+F10      run Ant target，run script
Alt+Shift+10        会弹出选择 Main 函数的context

------------------不太常用的-------------------
Alt+Home            定位到当前文件的 Navigation Bar
Ctrl+Alt+Home       弹出跟当前文件有关的文件弹出层，【相当强大，Ctroller上用，能找到Spring配置文件，jsp上用，能找到一坨js，css文件】
Alt+Left/Right      这个的真正用途是，在debug等窗口中切换子视图

Shift+F4            对当前打开的文件，使用新Windows窗口打开，旧窗口保留

Shift + F9          等效于点击工具栏的 Debug 按钮
Shift + F10         等效于点击工具栏的 Run 按钮












                                                                                                                                                                             conf/cheatsheets/IDEA_Eclipse_shortcut_compare.txt                                                  000644  000765  000024  00000016162 14133765512 023311  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
IntelliJ-IDEA-Tutorial/keymap-introduce.md     ----a pretty good project ^_^
https://github.com/judasn/IntelliJ-IDEA-Tutorial/blob/master/keymap-introduce.md
https://github.com/judasn/IntelliJ-IDEA-Tutorial
- GitBook 在线阅读地址：https://youmeek.gitbooks.io/intellij-idea-tutorial/content/

*Alt+up/down			move between methods (ctrl+shift+up/down)
Alt+Enter  -> item 2, Copy String concatenation text to the clipboard
Ctrl+Delete			Delete to word end
Ctrl+Backspace		Delete to word start
shift+delete        delete a line
*ESC/F12		        jump between last tool window and editor window

---------debug--------
https://github.com/judasn/IntelliJ-IDEA-Tutorial/blob/master/debug-introduce.md

alt+shift+F9/F10        open debug/run popup window, to select/edit debug/run configurations

Debug
Eclipse  							IntelliJ IDEA 
Step into F5 						Step into F7
- - 								Smart step into Shift+F7
Step over F6 						Step over F8
Step out F7 						Step out Shift+F8
Resume F8 							Resume F9
Toggle breakpoint Ctrl+Shift+B 	    Toggle breakpoint Ctrl+F8
- - 								Evaluate expression Alt+F8

alt+F8                  (ctrl+shift+I) evaluate expression
ctrl+alt+F8             或者 alt+Mouse_left_click，quick evaluate expression
ctrl+shift+F8           View all breakpoionts
alt+F9                  Run to Cursor

---------Bookmark/Navigate operation---------
Ctrl+1..9				Go to Bookmark
Ctrl+Shift+1..9			Toggle Bookmark
F11						Toggle Bookmark
Ctrl+F11				Toggle Bookmark with Mnemonic
Shift+F11				Show Bookmark Dialog

*Alt+Up/Down				Previous/Next Function （在XML，HTML文件中，非常好用）


Ctrl+F12				File Structure (Ctrl+O in eclipse)
Ctrl+Alt+F12			File Path
---------------------------------------------------

Ctrl+F/R				find, find & replace (Ctrl+F, find/replace)
Ctrl+N					Navigate to class
Ctrl+Shift+N			Navigate to file     **【Can open .xml files locate inside a jar, good!  add "/" as suffix can open folder!】**
Ctrl+Alt+S				Open settings
Ctrl+Alt+Shift+S		Open Project Structure
*Ctrl+E					recent files (support filter)
Ctrl+Shift+E			opened files
*Ctrl+Shif+I			Quick definition (try to use this function)
*Shift*2				find everything
*Ctrl+Shift+A			find action     (ctrl+3 in eclipse 4 or upper version)
*Ctrl+F9				Make Project
*Ctrl+Q					popup documentation
*Ctrl+Alt+B				go to implementation of a method. ctrl+alt+mouse_left_click has the same effect.
    ctrl+U                  go to super method
Ctrl+shift+F			search     (ctrl+H)
Ctrl+Alt+L				Reformat code (ctrl+shift+F)
    Ctrl+Alt+I				auto-indent lines (Ctrl+I)
Ctrl+Alt+O				Optimize imports (Ctrl+Shift+O)
Ctrl+G					goto line (ctrl+L in eclipse)
Ctrl+B					(F3 in eclipse)
Ctrl+F12				file structure (Ctrl+O in eclipse)
*Alt+Shift+Up/Down		(Alt+Up/Down)
Ctrl+Y					(Ctrl+D)
*Alt+Enter				quick fix (Ctrl+1)
Ctrl+H					(Ctrl+T) open type hierachy
ctrl+alt+H              (ctrl+alt+H) open call hierachy. list callers.
Ctrl+Shift+Backspace	Last edit location (Ctrl+Q)
Ctrl+/					comments/uncomments lines (Ctrl+Shift+C)
Ctrl/+Shift+/			block/unblock comments
Ctrl/+Shift+W			Select word at caret (alt+shift+up/down, Structured selection)
F3/ctrl+L				find next(Ctrl+K)
Ctrl+Alt+Left/Right		back/forward (alt+Left/Right in eclipse)
Alt+Left/Right			select left/right tab
ctrl+alt+up/down	    在 call/type hierachy 上下移动（recursively）
*Alt+F1					Select in (Alt+Shift+W, show in. Eclipse can use this key shortcut to open explorer)
Ctrl+D					(Ctrl+Alt+Up/Down, duplicate a line)
*(ctrl+)Alt+F7			(Ctrl+Shift+G) Find usage, Ctrl+alt+F7 Show usage in a popup window, ctrl+Shift+alt+F7 Find usage settings 
    Ctrl+F7                 Find usage in file 
    Ctrl+Shift+F7			Highlight usages in file (Ctrl+Shift+U, occurrences in file)

Alt+1/3/6/8/F12		    switch tool bar, hide/unhide them

*F4                     Edit Source/View Source
*F4                     jump to definition, same as ctrl+mouse_left_click

Basic/Smart/Statement completion     Ctrl+Space/Ctrl+Shift+Space/Ctrl+Shift+Enter

Alt+Insert				insert/generate code(getter/setter, equals/hashCode...). (Alt+Shift+S, source action)
                            1. In IDEA, this short key also apply package, used to create class, files, etc.
							2. In eclipse, this short key open a menu with more items.
Shift+F6				Rename     (alt+shift+R)
Ctrl+Shift+Alt+T		Refactor this (alt+shift+T, show refactor quick menu)
Ctrl+J					insert a live template
ctrl+o	                insert a @Override method
Ctrl+Alt+J				surround with a live template
Ctrl+Alt+T				Surround with… (Alt+Shift+Z, if..else, try..catch, for,  synchronized, etc.)
Ctrl+Shift+F12			Maximize view or editor (Ctrl+M)
Ctrl+Shift+BS			Back to last edit place(Ctrl+Q)
*ctrl+P					parameter info (in a popup window)
*ctrl+shift+I           method definition (in a popup window)
Ctrl+num+/num-			folding/unfold
Ctrl+Shift+U			toggle case (Ctrl+Shift+X/Y, to upper/lower case)

eclipse 有个Strl+Shift+M，说明是add imports， 猜测只会添加imports， 而不会像Ctrl+Shift+O那样删除其他未引用的
----已测试，确实如此

google idea multiple projects
IntelliJ: Working on multiple projects http://stackoverflow.com/questions/8774024/intellij-working-on-multiple-projects

general guidelines https://www.jetbrains.com/help/idea/2016.1/general-guidelines.html

Question:
what's the difference between Ctrl+Alt+Left/Right and Alt+Left/Right
Alt+Right     select next tab, it is MUCH better than (Ctrl+F6) in eclipse

.ifn     postfix templates

IntelliJ IDEA and Eclipse Shortcuts
https://www.catalysts.cc/en/wissenswertes/intellij-idea-and-eclipse-shortcuts/

Eclipse									IDEA						Comments
“semi” set in window-> preferences 	    ctrl+shift+enter 			if I want to add the semi-colon at the end of a statement
ctrl+1 or ctrl+shift+l			        ctrl+alt+v					introduce local variable
ctrl+alt+h							    ctrl+alt+h					(same!) show call hierarchy
ctrl+shift+i						    alt+f8						evaluate expression (in debugger)


Compilation
The way IntelliJ IDEA compiles projects is different from Eclipse in a number of ways.

Auto-compilation
By default, IntelliJ IDEA doesn't automatically compile projects on saving because normally we don't invoke the save action explicitly in IntelliJ IDEA.

If you want to mimic the Eclipse behavior, you can invoke the Make Project action (Ctrl+F9) - it will save the changed files and compile them. For your convenience, you can even reassign the Ctrl+S shortcut to the Make Project action.


Template 							Eclipse 		IntelliJ IDEA
Define a main method 				main 			psvm
Iterate over an array 				for 			itar
Iterate over a collection 			for 			itco
Iterate over a list 				for 			itli
Iterate over an iterable			foreach 		iter
	using foreach syntax 			
Print to System.out 				sysout 			sout
Print to System.err 				syserr 			serr
Define a static field 				static_final 	psf


Refactorings. The following table maps the shortcuts for the most common refactorings in Eclipse with those in IntelliJ IDEA:
Eclipse  								IntelliJ IDEA 
Extract local variable Ctrl+Alt+L 	    Extract variable Ctrl+Alt+V
Assign to field Ctrl+2 				    Extract field Ctrl+Alt+F
Show refactor quick menu Ctrl+Alt+T 	Rafactor this Ctrl+Shift+Alt+T
Rename Ctrl+Alt+R 						Rename Shift+F6

                                                                                                                                                                                                                                                                                                                                                                                                              conf/cheatsheets/Eclipse.txt                                                                        000644  000765  000024  00000011245 14133765512 017063  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
eclipse 调试的10个技巧：http://www.oschina.net/question/82993_69439

快捷键：http://pengjiaheng.iteye.com/blog/566843

How to manage keyboard shortcuts in Eclipse and why you should http://www.eclipseonetips.com/2010/02/03/how-to-manage-keyboard-shortcuts-in-eclipse/

ctrl+shift+L  提示快捷键，show key assist。重复2次(不能太快)，可以打开 key 设置
ctrl+鼠标滚动，上下滚动
shift+鼠标滚动，左右滚动
alt+shift+R  重命名变量
----------------------------------------------------------------
    所谓“工欲善其事必先利其器”，程序写多了，对于快捷键总有些特别的偏爱。在众多编辑器中，Eclipse算是用的比较多，也是最熟的。
最常用（也是最爱的：））
    Ctrl+’ :  自动完成提示。这个快捷键是我自己设的。Eclipse默认是Ctrl+Sapce，跟输入法冲突了。这个东东很强大，除了提示方法外，也支持自动完成的提示。比如：输入一个for后输入快捷键，能提示for方法的几种形式，以便自动完成。sysout也是平时用的比较多的。想不起来东西的时候输入这个即可。
    Alt+←（→）：前（后）一个编辑的页面
    Alt+X：运行上次运行的程序。也是自己设的，Eclipse默认是Ctrl+F11，这个用起来太别扭，要两只手，还容易按错，所以设了这个。调试程序时的最爱。
    Ctrl+Alt+H : 对着某个方法使用，显示方法的调用树，在“Call Hierarchy”视图中显示。有两种视图，一种是现实有哪些方法调用了当前方法；一直是当前方法调用了哪些其他方法。前者用的最多。在查询程序方法的调用关系时非常方便。
    F3 ：查看某个对象的定义。与按住Ctrl点击点击对象一样。
    Ctrl+O : 显示当前类的方法列表。可以根据输入过滤。
    Ctrl+Q : 跳转到最后编辑的位置。这个也是个好东东。
    Ctrl+K : 参照选中的单词查找下一个。
    Ctrl+Shift+K : 参照选中的单词查找上一个。
    Ctrl+D : 删除当前行。
    Ctrl+Alt+↓（↑）：复制当前行到下（上）一行
    Ctrl+L : 直接定位到某行
    Ctrl+E : 显示已经打开的文件列表，可以根据输入过滤。
    Ctrl+Shift+O（M）: 自动进行包导入。M导入对单个缺失的包，O导入当前类所有缺失的包。
    Ctrl+/  ：增加/取消注释。
    Ctrl+1 ：错误修复建议，会给出当前问题的一些解决方法。
    Ctrl+Shift+F ：程序代码自动排版。使用前需要选中一个代码块，最简单的使用就是Ctrl+A后在使用这个。
    Alt+Shift+R ：重命名。是很强大的那种，可以对类、变量等使用，除了重命名当前对象外，也会把对当前对象引用的地方进行相应的重命名。
    Alt+Shift+J ：增加注释。根据位置不同（类、方法）会自动产生不同的注释模板。
一般常用的 
    Ctrl+T ：显示当前类的继承结构，很有用滴~特别查找接口的实现类的时候：）
    Ctrl+J ：正向增量查找。
    Ctrl+Shift+P ：定位到对于的匹配符。比如().{}等的匹配。
    Alt+Shift+↑ ：选择封装元素。在某单词的任何位置上使用，即可选中这个单词。
    Alt+↓（↑）：上下行互换。
    Ctrl+Shift+X（Y）：把当前选中的文本全部变味大（小）写
    Ctrl+（Shift）+W ： 关闭当前（所有）编辑窗口
    Ctrl+M : 最大化编辑窗口。
    Ctrl+F6 ：可以弹出菜单,上面列出可以切换的编辑窗口。类似Ctrl+E。不过是直接定位编辑窗口
    Ctrl+F7 ： 一般视图切换。
    Ctrl+F8 ： 主要视图切换。
    Ctrl+Shift+G：搜索工作区中的引用。
    Ctrl+H ：打开搜索框。
    F4 ：打开类型层次结构
    以前是我主要用到的一些，大家如果有什么心得话欢迎交流~ 重构方面的快捷键个人用到的比较少。在这就没写了    ------------------------------------------------------------------

The fastest ways to navigate views in Eclipse using the keyboard http://www.eclipseonetips.com/2010/02/15/the-fastest-ways-to-navigate-views-in-eclipse-using-the-keyboard/
	Alt+Shift+Q, P	Package Explorer
	Alt+Shift+Q, C	Console
	Alt+Shift+Q, O	Outline View
	Alt+Shift+Q, X	Problems View
	Alt+Shift+Q, S	Search View
	Alt+Shift+Q, T	Type Hierarchy
	Alt+Shift+Q, Y	Synchronise View
The next fastest way to navigate views is to press 【Alt+Shift+Q, Q】. This pops up a dialog with a list of all views Eclipse knows about.
Navigate views using Quick Access (Ctrl+3)
Cycle views (Ctrl+F7)
* To activate the editor from any view, press F12. This means that you don’t have to reach for the mouse to start editing.

                                                                                                                                                                                                                                                                                                                                                           conf/cheatsheets/dev_ops.txt                                                                        000644  000765  000024  00000002605 14133765512 017136  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
### Maven
mvn clean install -DskipTests -Dskip.npm -Dskip.yarn -Dassembly.skipAssembly=true –Pproduction
other argumets:
-Dbuild.environment=dev/tedwang.local
-T 4/-T 1.5C		# T 4, build with 4 thread; 1.5C, build with 1.5 thread per cpu core(count in hyper-threading)
-pl com.trafigura.lykos.inttest:lykos-inttest
-f app/path/pom.xml
mvn -f app/lykos-inttest/pom.xml clean test -pl com.trafigura.lykos.inttest:lykos-inttest

Start spring-boot with Debug mode
	mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"


### Java & IDE
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8888 -jar webapp/target/lykos-web-1.0.0-SNAPSHOT.war -config=dev/tedwang.local

Config Eclipse remote debug:
Run -> Debug Configurations -> Remote Java Application -> New -> 
	Project: lykos-framework
	Host: localhsot
	Port: 8888
In "Source" tab: select all projects in workspace


### ssh related
ssh tunnel command sample:
ssh -L <local_port>:<target_server_name_or_IP>:<target_server_port> user@<jump_server> -i <cert_file_name>
ssh -L 6260:server.name.amazonaws.com.cn:1521 ec2-dev@54.223.215.155 -i id_rsa

scp user@server:/path/to/remotefile.zip /Local/Target/Destination
scp vbox:~/prj/conf.prj /c/dev/prj/temp/

rsync -avzo --progress myserver:/opt/projectDep/my-project-webapp.war ./    # both direction is OK, like scp, up/download

                                                                                                                           conf/cheatsheets/vim_cheatsheet.txt                                                                 000644  000765  000024  00000043446 14133765512 020477  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         [vim/cheatsheet][vim][cheatsheet]

### tips

* evim 或者 vim -y 可以进入easy模式。但是，怎么退出呢？。。。。ctrl+L 进入命令模式，然后:q

* vim --version 可以看到 当前的feature list 还有 配置文件位置信息。
	在 ubuntu 或者 raspberry 原生的 vim 上运行这个命令可以发现，大部分feature都没有
* 在vim中使用:verison命令可以看到一样的结果

* 将命令行输出传给 vim 处理：ls -la | vim -

* Linux 经常会 ctrl+z挂起 vim，进入shell，之后在 fg 调回 vim。但是，这样做的话，在挂起后的 shell 里，无法获取vim中copy的内容，即使 set clipboard=unnamed 也不行！
* 要想从vim中copy命令到shell执行：https://stackoverflow.com/questions/2782752/how-can-i-open-a-shell-inside-a-vim-window
	vim8之后可以用:ter(minal) 在一个vim windows 中打开一个terminal，这个terminal里是可以ctrl+shift+v获取 clipboard 里的值的。	----注意要exit，:q，2个动作才能退出。

* 怎么能在命令模式的命令行copy/paste？
q: q/ 可以从命令历史、搜索历史中copy
paste 可以用 <C+r><C+w> 插入 copy 的内容(word)
<ctrl+r>"				//where " stands for default register.
How to copy yanked text to VI command prompt https://stackoverflow.com/questions/906535/how-to-copy-yanked-text-to-vi-command-prompt

* vim显示不可见特殊字符 https://blog.csdn.net/jichenchen1990/article/details/72652207
* 让vim显示空格,及tab字符 vim 多行注释（转）https://www.cnblogs.com/chenwenbiao/archive/2011/10/26/2225467.html
	:set list
	:set nolist
	:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<      # 设置显示哪些隐藏字符，以及如何显示

* vim 中 获取当前编辑文件名 https://blog.csdn.net/ustczwc/article/details/8845044
	:f[ile]/Ctrl+G

^w gf -- 在新的标签页里打开光标下路径指定的文件。

change fileformat to change the EOL, :set ff=dos/unix/mac, which will change the EOL to CR+LF/LF/CR
set syntax
set ft=xml

* search highlighting
:set hls(earch)!    # turn on highlighting search。后面加"!"可以切换开关。
:set nohls          # turn off hls. 加"!"同上，可以切换。
noh                 # clear the syntax highlighting one time

Ctrl+A 对光标下的数字+1
Ctrl+X 对光标下（或者光标右边第一个）数字减一

Vim 有什么奇技淫巧？https://www.zhihu.com/question/27478597/answer/136760781
正则排序，:sort r /regex/
	sort r /【.\+】/		//按照【】中的内容排序


### Regex 正则
/\(string1\|string2\)   # search multiple words in vi editor

\d: 表示十进制数
\s: 表示空格
\S: 非空字符
\a: 英文字母
\|: 表示 或
\.: 表示.
{m,n}: 表示m到n个字符。这要和 \s与\a等连用，如 \a\{m,n} 表示m 到n个英文字母。
{m,}: 表示m到无限多个字符。
**: 当前目录下的所有子目录。
:help pattern得到更多帮助。

http://vimregex.com/
Vim的正则比较特殊，很多字符都需要转译，比如\+表示匹配数量，不能直接用+，只有*能直接用，还有\{m,n}等等
见 4.7 Regexp Operator Precedence
Quantifier	Description
	* 		matches 0 or more of the preceding characters, ranges or metacharacters .* matches everything including empty line
	\+ 		matches 1 or more of the preceding characters...
	\= 		matches 0 or 1 more of the preceding characters...
	\{n,m} 	matches from n to m of the preceding characters...
	\{n} 	matches exactly n times of the preceding characters...
	\{,m} 	matches at most m (from 0 to m) of the preceding characters...
	\{n,} 	matches at least n of of the preceding characters...
上面是默认的贪心匹配，懒惰匹配在vim中在数量之前用-表示
Quantifier	Description
.-*			懒惰匹配（non-greedy match），已经测试过
\{-}		matches 0 or more of the preceding atom, as few as possible
\{-n,m}		matches 1 or more of the preceding characters...
\{-n,}		matches at lease or more of the preceding characters...
\{-,m}		matches 1 or more of the preceding characters...

4.5 Grouping and Backreferences
#	Meaning												#	Meaning
&	the whole matched pattern							\L	the following characters are made lowercase
\0	the whole matched pattern							\U	the following characters are made uppercase
\1	the matched pattern in the first pair of \(\)	\E	end of \U and \L
\2	the matched pattern in the second pair of \(\)	\e	end of \U and \L
...	...													\r	split line in two at this point
\9	the matched pattern in the ninth pair of \(\)	\l	next character made lowercase
~	the previous substitute string					\u	next character made uppercase
----\L\U可以进行大小写转换，\r可以分行，等等

4.7 Regexp Operator Precedence
分组的括号()，|(表示OR)的，也都要转译，\(\), \|


### Folding，折行

Vim 有什么奇技淫巧？https://www.zhihu.com/question/27478597/answer/805176447
zf 创建折行，f 表示 fold
zo 打开折行，o 表示 open
zc 关闭折行，c 表示 close
zd 删除折行，d 表示 delete

zf 最变态的功能就是可以与 text-object 配合工作。比如：
zfa{折叠成对大括号之间的内容，包括大括号所在行，一般用于折叠函数定义、 循环、只有一个分支的条件判断。
zfi{ 折叠成对大括号之间的内容，不包括大括号所在行，一般用于折叠条件判断的多个分支、try-cache 的各部分内容。
不管代码有多长，一个 zfo{或者zfi{ 立马折叠。


### file，window，文件操作，窗口
:qa!					//强制退出所有正在编辑的文件
:e(dit)					//<path/to/file>	打开/新建一个文件

:e(dit) newfile.txt  	//open/create a new file
:saveas newName.txt	//save as a new file
:file rename.txt		//rename current file
:sp						//垂直分割窗口，并打开当前buffer，窗口位置在下方
:vs						//水平分割窗口，并打开当前buffer，窗口位置在右边

:w !sudo tee %			//通过 sudo 写入没有权限的文件
:.w(rite) otherfile	//将当前行写入另一个文件
:.w(rite) >> otherfile	//将当前行追加到另一个文件末尾


#### 分屏
:sp
:vs
vimdiff f1 f2
vim -d f1 f2		//这里也可以用 -o -O 参数
:diffs[plit] fileName
:vert diffsplit fileName
[c                  // 跳转到前一个不同点
]c
vim -o file1 file2:水平分割窗口，同时打开file1和file2
vim -O file1 file2:垂直分割窗口，同时打开file1和file2
Ctrl+w  +h/j/k/l/w/p，w next，p last。注意这两个是不同的，并非是互逆的操作。重复
Ctrl+w  +H/J/K/L 把当前窗口放到左/下/上/右边
Ctrl+w c/:bd/:q  都能关闭当前窗口


### Buffer 缓冲区

How can I edit multiple files in VIM? https://unix.stackexchange.com/questions/27586/how-can-i-edit-multiple-files-in-vim
【Vim命令大全】史上最全的Vim命令	----9.3 缓冲区 https://www.cnblogs.com/qlqwjy/p/8361368.html
:ls/:buffers/:files	# 列出所有缓冲区
Ctrl+^/:b#				# Switch between last/current buffer.
:bn/bp					# Go to next/previous buffer.
:b(n)或(n)b				# switch to buffer n
:bf/bl					# Go to first/last buffer.
:bd(elete) 3/文件名	# 删除当前/第n个缓冲区		----建议用这个关闭 buffer
:bd 1 2 3				# close buffer 1, 2, 3
:5,7bd					# close buffer 5, 6, 7
Ctrl+G/:file/:f		# Show filename
:ba(ll)					# 把所有的缓冲区在当前页中打开，每个缓冲区占一个窗口。
:badd file				# 增加一个缓冲区，文件是必须的。		----这个跟 :e file 的区别，感觉就是只是增加，但是不会切换到新的buffer。
:bunload 				# 卸载缓冲区				----这个跟 bd 有何区别？
:(n)bw					# Clear the current/n buffer, including all marks, options settings etc.	----建议一般不要用这个
:help buffer
:args	opened file list, [] around current
* 所有跟在后面的缓冲区编号，都可以换成文件名

* 另外注意【bufdo】。Run a command in multiple buffers https://vim.fandom.com/wiki/Run_a_command_in_multiple_buffers


### 标签 tab
Vim 多文件编辑：标签页
https://harttle.land/2015/11/12/vim-tabpage.html
tab打开关闭：
	:tabe[dit] {file}   edit specified file in a new tab
	:tabf[ind] {file}   open a new tab with filename given, searching the 'path' to find it
	:tabc[lose]         close current tab
	:tabc[lose] {i}     close i-th tab
	:tabo[nly]          close all other tabs (show only the current tab)
tab移动：
	:tabs         list all tabs including their displayed window
	:tabm 0       move current tab to first
	:tabm         move current tab to last
	:tabm {i}     move current tab to position i+1
tab跳转：
	:tabn         go to next tab
	:tabp         go to previous tab
	:tabfirst     go to first tab
	:tablast      go to last tab
在normal模式下，
	gt            go to next tab
	gT            go to previous tab
	{i}gt         go to tab in position i
	Ctrl+Alt+PageUp/Ctrl+Alt+PageDown	go to previous/next tab


### Move jump, 跳转

h j k l		//一般h和l很少用，使用 w b e 代替。
w e b		//要注意的是e b w会把标点也当做单词分隔符，如对don't连续使用dw，会把这当做三个单word (don,',t) 分3次来删除，而大写的E B W则不会，一次删光。
0 ^ $		//行首/第一个非空字符/行尾
* # %		//% 各种括号对匹配跳转，不仅能移动到匹配的(),{}或[]上，而且能在#if，#else， #endif之间跳跃。
			//* 只匹配出现的单词，对于中文没有断字。如果查找当前词的所有字串，可以使用g*。(https://harttle.land/2015/12/03/little-known-vim-skills.html)
(){}		//句首/句尾/段首/段尾
g$/g^/gj/gk		//超长行折行时使用，以折叠之后的行为单位移动

gg/G/20G/:20/50%/20|	//光标移动到指定位置
C+d/u, C+f/b, C+e/y	//屏幕移动，半屏/整屏/单行
H/M/L		//移动光标到 顶行/中间行/底行
zt/zz/zb	//移动屏幕，将当前行至于 顶部/中间/底部

``			last location，上次编辑的位置
`.			last edit location，上次修改的位置. '. 上次修改的行
`"			上次离开的位置
`0			open last file
Ctrl+o/i    Retrace your movements in file in backwards/forwards. 最多保存100条跳转记录
C+o/C+i		跟其他编辑器的 alt+left/right 类似。详见  :help jump-motions
ctrl+^		在最近两个缓冲区(buffer)间切换。

gd			go to definition of current word

help jumplist
ju          print the jump list
cle         clear the jump list

### Edit

正常模式(normal-mode) 
命令模式(command-mode)
插入模式(insert-mode)
可视模式(visual-mode) 

ddkP	向上移动一行，vim没有这个命令，只能用 ddkP
"+dd	剪贴到系统剪贴板，*也是
"+p		从系统剪贴板粘贴
:put+	同上

增： a, i, o
	A是移动到行尾进入insert模式，类似的，I是行首插入，o在下面增加一行并进入insert模式，O则是在上面增加一行进入insert模式
删：(基于字符、单词、行、段落、括号之间的删除，了解 text object)主要命令是 x, d
	X删除光标之前的字符，D当前位置删除到行尾，相当于d$
	:11,22d 删除第 11 行到第 22 行
改： 基于字符和单词的修改 r, c，s；
	r 单个字符替换；R 会进入"Replace mode"，连续替换；
	c cw，删除到单词末尾，并进入insert模式；ciw，caw，c$，c0，cc类似。C等同于c$
	s 删除当前字符，并进入insert模式(等于c+space，或者x+i)；S删除当前行，进入insert模式（等同于cc）
查1：f/F+c 向右/向左 搜索字符。;/, 继续向右/向左搜索。如果是F，则反过来，;/, 继续向左/向右搜索
	 t/T+c 和f一样，只是不包括c，大写的F和T一样，反方向且不包括c。
查2："/" 和 "?" 搜索(之后会单开一期讲搜索，单文件、多文件、模糊搜索等，涉及到一些插件)。
	n/N		继续同向/反向搜索。
	q:		打开命令行历史缓冲区， 可以像编辑文件一样编辑命令。
	q/q?	可以打开查找历史记录。同样可以编辑。
查3：*/# 向后/向前查找当前单词
查4：% 在各种括号((),[],{})间对称移动
合并： J 合并行，3JJ 合并2行
选择模式：v，V，Ctrl+v，v进入visual 模式，移动选择；Ctrl+v，进入 visual block模式，矩形选择； V 进入 visual line 模式，整行选择

u/C+r		//undo/redo
<</>>		//缩进，indent

#### auto-complete，自动补全
在编辑模式下
	Ctrl+N，ctrl+P，自动完成 next/previous keyword. 
	C+X C+F auto complete file name。

copy & paste
y/p, Y=yy, 
p在光标之后复制，P在光标之前复制。如果是行操作，就是复制到当前行之后/之前

* v,d,y,c 这些命令，可以和“位移”指令一起使用，实现非常灵活的功能：
	d3fa	一直删到第3个字符a（包括a）。
	vit		选中整个标签内的内容
	d/hh<Enter> 从当前位置，一直删除到hh所在位置(不包括hh)
* v,d,y,c 还可以跟文本对象(text object)一起使用
	da<		剪切<>之间的内容，包含<>。
	va{		选中整个{}的内容，也包括{}自身
	viw		选中一个word，不包括空格
	yit		复制整个标签(tag)内的内容
* v,d,y,c 还可以和“bookmark”结合，比如：	
	y'a		从当前位置，复制到书签a所在的行行首
	y`a		复制到书签a所在位置

gu //to Lower Case
gU //to Upper Case
gUw //当前word to Upper Case
g~ //swap case
g~i[ //[]内所有大小写反向
guu, gUU, g~~ //作用与当前行

16进制编辑
:%!xxd			//将当前文件内容全部转为16进制显示（可以编辑）
:%!xxd -r		//还原(编辑之后)

### Command

:%normal I#			//用#注释掉整个文件(%代表整个文件)
:1,4normal I#		//用#注释掉1-4行
:3,6y				//复制3-6行的内容
:'<,'>normal .		//对“选中部分”执行上一条命令(.)
:,+3d				//删除当前行(,)到+3行，即从当前行开始，删除4行，相当于4dd
:1,+2d				//对“从第1行开始，到当前行+2的行”，执行删除(d)
	这里可以用";"代替","做分割分隔符，区别是","的后面是相对于当前行定位，而;的后面是相当于前面一个位置定位。比如：
:1;+2d				//删除从1行开始，到之后的+2的行，即从第一行开始，删除3行
:1s/pattern/something/g		//在第一行匹配并且替换全部(g)的匹配
:2,/pattern/d		//从第二行开始，一直到当前行之后第一个匹配的pattern，之间的内容，全部删除。----注意这里的/pattern/是作为“范围”的end来使用的。
:%j					//Joins all the lines together.
:%p					//Prints the buffer to the console output.


* normal 命令，是在指定范围的每一行上运行一些“普通命令(normal commands)”，比如d, i, x, . 等等。
	----就是在命令模式中(:)，执行normal模式的命令
:%normal i// 		用//注释掉整个文件(%)

* global 命令形式
	:[range]global/{pattern}/{command}
/^/匹配文件的所有行（这是查找的一个常用技巧，如果用/./则是匹配非空行，/^$/匹配空行）	----这个好像不能用于s命令
s命令和g命令，有类似之处，区别在于：
	1） s是匹配之后替换，g是匹配之后执行命令
	2） s默认范围是当前行，g默认是整个文档
	3） s是对匹配的【内容进行操作】，g是对匹配的【行操作】
global命令可以接"s"命令，例如：
	:g/.*/s/pattern/replacement

* substitute 命令
* global,vglobal的意思是：在1）指定范围内的(没有指定则默认整个文档)，2）所有(匹配/非匹配)行上，3）执行命令(Ex command)
	:[range]global/{pattern}/{command}，例如:
	:,/^$/g/foo/d	----从当前行(,)，到下一个空行(/^$/正则匹配)，查找包含foo(g/foo)的行，执行删除命令(/d)
* substitute 命令的意思是，在1）指定范围内的(没有指定则默认当前行)，2）所有匹配内容，3）替换(第一个出现的匹配，或者用/g指定替换全部匹配)
	:[range]s/search/replace/[flags][count]
	在默认情况下，s命令仅将本行中第一个出现的字符替换。如果想要将所有出现的字符都替换，可以在命令后使用g(global)标记：
		:%s/from/to/g	在全文范围(%)内，搜索from，并全部替换(/g)成to
* global的“{command}”，可以是一个substitute命令
	比如，g/.*/s/pattern/replacement

substitute 命令中的 Arguments：
g	Replace all occurrences in the line. Without this, Vim replaces only the first occurrences in each line.
i	Ignore case for the search pattern.
I	Don't ignore case.
c	Confirm each substitution.

global 中常用的 Ex command ：
	d 删除
	m 移动
	t 拷贝
	s 替换

### bookmarks 标记、书签
* mark a-z
	ma，set a mark
	'a，move to the beginning of line containing the 'a' mark
	`a，move to the exact location of the 'a' mark

`{0-9}：回到上[2-10]次关闭vim时最后离开的位置。
	`0 打开上一次最后关闭的文件
``: 移动到上次编辑的位置。''也可以，不过``精确到列，而''精确到行 。如果想跳转到更老的位置，可以按C-o，跳转到更新的位置用C-i。详见  :help jump-motions
`": 移动到上次离开的地方。
`.: 移动到最后改动的地方。

:marks 显示所有标记。
:delmarks a b -- 删除标记a和b。
:delmarks a-c -- 删除标记a、b和c。
:delmarks a c-f -- 删除标记a、c、d、e、f。
:delmarks! -- 删除当前缓冲区的所有标记。


### Registers 寄存器

使用 Vim 寄存器
https://harttle.land/2016/07/25/vim-registers.html
* Vim提供了10类共48个寄存器，除了a-z26个命名寄存器，Vim还提供了很多特殊寄存器。
* "ayy可以拷贝当前行到寄存器a中，而"ap则可以粘贴寄存器a中的内容
* "+p可以粘贴剪切板的内容，
* ":p可以粘贴上一个Vim命令（比如你刚刚费力拼写的正则表达式），
* "/p可以粘贴上一次搜索关键词（你猜的没错，正是normal模式下的/foo搜索命令）。
* ".：上次insert模式中插入的字符串。还记得吗？.命令可以重复上次操作，而".存储了上次插入。
* "%：当前文件名，不是全路径，也不是纯文件名，而是从当前Vim的工作目录到该文件的路径。
* ":：上次命令模式下键入的命令。正如@a可以执行"a寄存器中的宏一样，@:可以执行上次命令。




[//]: # ( vim: set syntax=markdown: )

                                                                                                                                                                                                                          conf/cheatsheets/MySQL.txt                                                                          000644  000765  000024  00000010725 14133765512 016446  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         

MySql中的事件
http://my.oschina.net/tsl0922/blog/67711

Mysql常见命令.
http://my.oschina.net/chengjiansunboy/blog/55595

MySQL 5.5 和 5.6 默认参数值的差异	----不错！
http://www.oschina.net/question/12_90733

安装完 MySQL 后必须调整的 10 项配置 
http://www.oschina.net/translate/10-mysql-settings-to-tune-after-installation


关于DBeaver连接MySQL数据库遇到的版本问题解决 https://my.oschina.net/u/3880151/blog/1825764
* 注意，在此时我们需要下载对应本地MySQL版本的驱动包。笔者的MySQL版本为5.7，所以下载5.1.22版本以上的驱动包，笔者选择对应版本为5.1.46（8.0.X版本测试会报错）。

How To Install MySQL on Ubuntu 18.04 https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
	sudo apt update
	sudo apt install mysql-server
	sudo mysql_secure_installation
Step 3 — (Optional) Adjusting User Authentication and Privileges
In order to use a password to connect to MySQL as root, you will need to switch its authentication method from auth_socket to mysql_native_password. To do this, open up the MySQL prompt from your terminal:
	sudo mysql
Next, check which authentication method each of your MySQL user accounts use with the following command:
	mysql>SELECT user,authentication_string,plugin,host FROM mysql.user;
	mysql>ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
	mysql>FLUSH PRIVILEGES;
for create a user:
	sudo mysql
	mysql>CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
	mysql>GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
Step 4 — Testing MySQL
	systemctl status mysql.service
For an additional check, you can try connecting to the database using the mysqladmin tool, which is a client that lets you run administrative commands.
	sudo mysqladmin -p -u root version


	show databases;
	SHOW TABLES;
	SHOW COLUMNS FROM tableName;	--查看表结构
	describe tableName;
	use databaseName;

Ubuntu 18.04 安装 MySQL 5.7【解决普通用户登录、密码修改、远程访问等问题】https://blog.csdn.net/gulang03/article/details/82790821
局域网访问的关键几点：
1. 必须建立对应host字段为%的用户，如果需要root用户远程登录，也一样
2. mysql配置文件中的bind-address 要修改成0.0.0.0，默认的是127.0.0.1
	sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
3. 如果是某些云服务主机，可能会设置防火墙，需要配置3306端口通过。注意：ufw是debian/ubuntu系统默认的防火墙，centOS不适用。
	sudo ufw enable/disable
	sudo ufw allow 3306/tcp
	sudo ufw status
	ufw --help

### MySQL 用户管理

How to create a superuser in MySQL?
https://tableplus.io/blog/2018/10/how-to-create-a-superuser-in-mysql.html

6.2.8 Adding Accounts, Assigning Privileges, and Dropping Accounts	----MySQL 手册还是更详细一些
https://dev.mysql.com/doc/refman/8.0/en/creating-accounts.html


使用root连接MySQL，创建2个用户并授权（grant all privileges）
% mysql -u root -p
	CREATE USER 'ted'@'localhost' IDENTIFIED BY 'password';
	GRANT ALL PRIVILEGES ON *.* TO 'ted'@'localhost' WITH GRANT OPTION;
	CREATE USER 'ted'@'%' IDENTIFIED BY 'password';
	GRANT ALL PRIVILEGES ON *.* TO 'ted'@'%' WITH GRANT OPTION;
	
	FLUSH PRIVILEGES;

Both 'ted'@'localhost' and 'username'@'%' are superuser accounts with full privileges to do anything.
The 'ted'@‘localhost' account can be used only when connecting from the local host. The 'ted'@'%' account uses the '%' wildcard for the host part, so it can be used to connect from any host.

To double check the privileges given to the new user, run SHOW GRANTS command:
	SHOW GRANTS FOR username;
To revoke account privileges, use the REVOKE statement. 
	REVOKE ALL ON wordpress.* FROM 'wp'@'localhost';


mysql批量执行sql文件
https://www.cnblogs.com/aaron-shu/p/5928965.html
在mysql下执行source batch.sql; batch.sql 文件里可以嵌套执行其他 *.sql 文件


### DML, DDL

create DATABASE `test`
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON `test`.* TO "ted"@"%";
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON `test`.* TO "ted"@"%" IDENTIFIED BY "wp_pass_132";
FLUSH PRIVILEGES;

https://dev.mysql.com/doc/refman/8.0/en/creating-tables.html
CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
       species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

DESCRIBE pet;


                                           conf/common_conf/                                                                                   000755  000765  000024  00000000000 14133765512 014730  5                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         conf/common_conf/.ted.bashrc                                                                        000644  000765  000024  00000006051 14133765512 016750  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
# Ted Wang's .bashrc, v0.01, 2019-01-19

# DO NOT change this file since it will be overrided everytime while calling init script env_init.sh.
# If you want to do some custimization to your shell, please update ~/.bashrc or related files.

currentEnv()
{
    unameOut="$(uname -s)"
    case $unameOut in
        Linux*) runIn=Linux;;
        MINGW*) runIn=Win/git-bash;;
        Darwin*) runIn=Mac;;
        CYGWIN*) runIn=Win/Cygwin;;
    esac
    echo $runIn
    return 0
}

#export -f currentEnv

# Linux bash 中的 alias 命令，可以存在参数，但是参数必须放在最后，这极大的限制了 alias 的使用。这里有个包装参数到中间的方式，参考自 StackOverlow 的答案：
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter/42466441#42466441

# 1. Linux 下模拟 windows 的 start。主要对 nohup firefox >&/dev/null & 命令的包装
# 方法一，通过一个临时函数过度：    ----此方法在传递字符 &(后台运行) 上有问题，会被解释为一个字符串，当作文件名，再想想办法。
#	alias run='f(){ nohup $@ >/dev/null 2>&1 '\''&'\'' ;  unset -f f; }; f'
# 方法二，通过调用一个 sub shell 来过度，注意最后的参数 _ 是必须的。
    alias run='bash -c '\''nohup "$@" >/dev/null 2>&1 &'\'' _'

# 在 Bash 命令中，默认只有 first word 会 check alias。但是，如果一个 alias 的 value 的最后一个字符是空白字符(space or tab)，那么 next word 也会 check alias。
# add this alias for running an alias with sudo. see more info: https://coderwall.com/p/9cviza/use-your-aliases-with-sudo
alias sudo='sudo '
alias ls='ls -F --color=auto'
alias l='ls -lF --color=auto'
alias ll='ls -AlF --color=auto'
alias la='ls -AF'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --colro=auto'

alias du0='du -h --max-depth=0'
alias du1='du -h --max-depth=1'

if [[ $(currentEnv) == "Win/git-bash" ]]; then
    alias ping='/bin/winpty ping'
fi

# LinuxMint 使用了 termbin.com，发现挺不错的。
NETCAT=nc
if [[ $(currentEnv) == "Win/git-bash" ]];then
    NETCAT=ncat
fi
alias tb="$NETCAT termbin.com 9999"
unset NETCAT
# 生成一个paste：echo text | tb；获取内容可以使用：curl http://termbin.com/xftf

gsettings --version >/dev/null 2>&1
if [[ $? == 0 ]]; then
    function setzoom() {
        if [[ "$1" == "" ]];then
            gsettings get org.gnome.desktop.interface text-scaling-factor;
        else
            gsettings set org.gnome.desktop.interface text-scaling-factor "$@";
        fi
    }
fi

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# Ubuntu and Raspi does not read EDITOR variable by default, force to use it.
apt-get --help >/dev/null 2>&1
if [[ $? == 0 ]]; then
    alias visudo="EDITOR=$EDITOR visudo"
fi

# add alias for Manjaro
pacman --help > /dev/null 2>&1
if [[ $? == 0 ]] && [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
    alias sudo='sudo -E'
fi

# this is for displaying Chinese character correctly when SSH to Ubuntu Server by a terminal.
export LANG=en_US.UTF-8

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       conf/common_conf/.ted.vimrc                                                                         000644  000765  000024  00000014412 14133765512 016626  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
" Ted Wang's .vimrc, v0.03, 2019-09-17

" -----------------Ted Wang base settings-------------------
set fencs=utf-8,gbk,gb2312,gb18030,ucs-bom,cp936,latin1
set nu
set showcmd
set hls incsearch
set ts=4 sts=4 sw=4 et
set shiftwidth=4
set clipboard=unnamed
syntax on
"set nowrap
set hidden                          " Allow buffer switching without saving
set splitbelow                      " Let new horizontal split window(sp, new) below current window
set splitright                      " Let new vertical split window(vs, vne) right of current window
"set mouse=a                         " Enable switching between windows by mouse clicking.
set virtualedit=onemore             " Allow for cursor beyond last character
set nospell                         " Spell checking off, because it's impact Chinese characters a lot
set history=1000                    " default is 50 or 200 or etc...
set whichwrap=b,s,<,>,[,]           " 默认值是b,s 在行首按←或者在行尾按→是不能将光标移动至上一行或下一行的。
set modeline
set backspace=indent,eol,start      " 解决有些时候，backspace 键不能删除的问题。see :help 'backspace' for more description.

set viewoptions=folds,options,cursor,unix,slash   " Better Unix / Windows compatibility	----这行到底做了什么，得找机会试试

set noundofile                      " So is persistent undo ... enable this option will create a lots of temp files in ~/.vimundo/
let mapleader = ','
set autochdir                       " Always switch to the current file directory

silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! MINGW()
    return has('unix') && !has('macunix') && has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

" the following piece if copied from spf13/.vimrc
if has('clipboard')
    if has('unnamedplus')           " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else                            " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" font settings
if has('gui_running')
    set guioptions-=T               " Remove the toolbar
    if LINUX()
        set guifont=Ubuntu\ Mono\ Regular\ 12,Monospace\ Regular\ 10,Noto\ Mono\ Regular\ 10,Noto\ Sans\ Mono\ Regular\ 10,Noto\ Sans\ Mono\ CJK\ SC\ Regular\ 10

    elseif OSX()
        set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
    elseif WINDOWS()
        set guifont=Consolas:h10,Courier_New:h10,Courier\ New\ Regular\ 10
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256                " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi          " Make arrow and other keys work

    " 下面这个配置是为了让 git-bash 在 Conemu 里正常工作，具体原因见：https://conemu.github.io/en/VimXterm.html#Vim-scrolling-using-mouse-Wheel
    " 最好想办法检测当前是否运行在 Conemu 中
    if !WINDOWS()
        set term=xterm
    endif
endif

" colorscheme and cursor settings
if has('gui_running')
    if(&lines < 50)
        set lines=50
    endif
    if(&columns < 120)
        set columns=120
    endif
    set cursorline                  " Highlight current line
    colorscheme desert              " 使用经典的 desert 配色，综合来看，在 win/gvim，Linux/gvim，git-bash 里，效果都还不错。
elseif MINGW()                      " for vim in git-bash
    if(&lines < 50)
        set lines=50
    endif
    if(&columns < 120)
        set columns=120
    endif
    set cursorline                  " Highlight current line
    colorscheme default             " git-bash 里也使用 default，使用 git-bash 自带的 flat-ui 主题的效果更好
elseif LINUX()
    colorscheme default
     " do nonthing                  " Linux/Shell 里还是留空使用 terminal 的 theme 。
elseif WINDOWS()
    if(&lines < 50)
        set lines=50
    endif
    if(&columns < 120)
        set columns=120
    endif
    set cursorline                  " Highlight current line
    colorscheme default             " windows cmd 使用 default，desert 在 powershell 下面高亮有问题，某些字符看不清。
endif

set ruler                                           " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " A ruler on steroids
" set format statusline. This option override the ruler?
set laststatus=2
set statusline=%<%f\%w%h%m%r\ [%{&ff}/%Y]\ [%{getcwd()}]%=%-14.(%=\:b%n%y%m%r%w\ %l,%c%V%)\ %p%%

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap W!! w !sudo tee > /dev/null %
" -----------------Ted Wang base settings end-------------------

" -----------------Ted Wang Optional settings-------------------
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif    " Always switch to the current file directory

" nmap <silent> <leader>/ :set invhlsearch<CR>
" nnoremap Y y$
" map <S-H> gT
" map <S-L> gt

" set list		" switch to show special characters/letters
" set listchars=tab:?\ ,trail:?,extends:#,nbsp:. " Highlight problematic whitespace

" Some helpers to edit mode http://vimcasts.org/e/14
" 这里把 %% 映射成展开当前目录，然后分别map了几种方式打开当前目录下的文件，同窗口多buffer，水平分割多窗口，垂直分割多窗口，多tab打开。
" ----但是这里:vsp 的行为有点奇怪，直接分割成横向3个，纵向2层的6个窗口，而且没要我回车确认
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" map <leader>ew :e %%
" map <leader>es :sp %%
" map <leader>ev :vsp %%
" map <leader>et :tabe %%

" 终于找到 spf13 的color配置了，可惜是调用bundle的。。。。。遗憾
" if !exists('g:override_spf13_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"     let g:solarized_termcolors=256
"     let g:solarized_termtrans=1
"     let g:solarized_contrast="normal"
"     let g:solarized_visibility="normal"
"     color solarized             " Load a colorscheme
" endif
" -----------------Ted Wang Optional settings end-------------------

                                                                                                                                                                                                                                                      conf/common_conf/git.gitconfig                                                                      000644  000765  000024  00000000370 14133765512 017406  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         [user]
	name = Ted Wang
	email = ted.wang2012@gmail.com
[core]
	autocrlf = false
[https]
    #proxy = socks5://raspi:10808
[http]
    #proxy = socks5://raspi:10808
[credential]
    helper = manager
[diff]
	tool = vimdiff
[difftool]
	prompt = false
                                                                                                                                                                                                                                                                        conf/common_conf/vps_extra.bashrc                                                                   000644  000765  000024  00000004274 14133765512 020136  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
# Linux bash 中的 alias 命令，可以存在参数，但是参数必须放在最后，这极大的限制了 alias 的使用。这里有个包装参数到中间的方式，参考自 StackOverlow 的答案：
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter/42466441#42466441

# 1. Linux 下模拟 windows 的 start。主要对 nohup firefox >&/dev/null & 命令的包装
# 方法一，通过一个临时函数过度：    ----此方法在传递字符 &(后台运行) 上有问题，会被解释为一个字符串，当作文件名，再想想办法。
#	alias run='f(){ nohup $@ >/dev/null 2>&1 '\''&'\'' ;  unset -f f; }; f'
# 方法二，通过调用一个 sub shell 来过度，注意最后的参数 _ 是必须的。
#    alias run='bash -c '\''nohup "$@" >/dev/null 2>&1 &'\'' _'

# 2. 远程快速安装SS、开启BBR
# 原始命令 git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i ss_pass ss_port && sudo ss-fly/ss-fly.sh -bbr -Y
# 2.1 root 用户
	alias fastss0='f(){ ssh -o "StrictHostKeyChecking=no" -t root@"$3" '\''git clone -b master https://github.com/Ted-Wang/ss-fly && ss-fly/ss-fly.sh -i '\''$1'\'' '\''$2'\'' && ss-fly/ss-fly.sh -bbr -Y'\'';  unset -f f; }; f'
# 2.2 普通用户
	alias fastss1='f(){ ssh -o "StrictHostKeyChecking=no" -t ted@"$3" '\''git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i '\''$1'\'' '\''$2'\'' && sudo ss-fly/ss-fly.sh -bbr -Y'\'';  unset -f f; }; f'
# 调用格式：fastss1 ss_pass port ip，比如：fastss vpn_pass 8388 67.68.69.70

# 3. 远程添加用户，原始命令 ssh -o 'StrictHostKeyChecking=no' -t root@host_ip 'useradd $1 -G sudo -s /bin/bash -m -p $(echo $2 | openssl passwd -1 -stdin)'
# 3.1 普通用户
	alias fastuser1='f(){ ssh -o "StrictHostKeyChecking=no" -t ted@"$3" '\''sudo useradd '\''$1'\'' -G sudo -s /bin/bash -m -p $(echo '\''$2'\'' | openssl passwd -1 -stdin)'\'';  unset -f f; }; f'
# 3.2 root 用户
	alias fastuser0='f(){ ssh -o "StrictHostKeyChecking=no" -t root@"$3" '\''useradd '\''$1'\'' -G sudo -s /bin/bash -m -p $(echo '\''$2'\'' | openssl passwd -1 -stdin)'\'';  unset -f f; }; f'
#调用格式：fastuser0 ted44 password 192.168.1.101

                                                                                                                                                                                                                                                                                                                                    conf/common_conf/m.sh                                                                               000644  000765  000024  00000006060 14133765512 015522  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
# 代码来自【韦易笑】的文章：[十行代码实现路径书签功能](https://zhuanlan.zhihu.com/p/57659856)
# 代码实现思路就是，定义$MARKPATH 指向 ~/.local/share/marks目录，作为书签的保存地址。
#   - 添加书签就是在 $MARKPATH 下面做一个软连接，指向当前目录即可。
#   - 删除书签就是删除软连接，还会用 rm 命令的 -i 参数问下你是否真的要删除。
#   - 跳转书签就是利用cd命令的-P参数跳转到实际路径：cd -P "$MARKPATH/$1"
#   - 其他的搜索书签就是 find 命令，列出书签就是 ls 命令格式化一下。

# 功能
#   - m         # 列出当前所有书签
#   - m foo     # 跳转到名为 foo 的标签
#   - m +foo    # 将当前路径添加成书签 foo
#   - m -foo    # 删除名为 foo 书签
#   - m /foo    # 搜索名称里包含 foo 的书签

# 使用方法：source 此代码，或者把下面代码直接 append 到 .bashrc 里

# function for marks management
MARKPATH=$HOME/.local/share/marks
function m() {
    MARKPATH="${MARKPATH:-$HOME/.local/share/marks}"
    [ -d "$MARKPATH" ] || mkdir -p -m 700 "$MARKPATH" 2> /dev/null
    case "$1" in
        +*)            # m +foo  - add new bookmark for $PWD
            ln -snf "$(pwd)" "$MARKPATH/${1:1}" 
            ;;
        -*)            # m -foo  - delete a bookmark named "foo"
            rm -i "$MARKPATH/${1:1}" 
            ;;
        /*)            # m /bar  - search bookmarks matching "bar"
            find "$MARKPATH" -type l -name "*${1:1}*" | \
                awk -F "/" '{print $NF}' | MARKPATH="$MARKPATH" xargs -I'{}'\
                sh -c 'echo "{} ->" $(readlink "$MARKPATH/{}")'
            ;;
        "")            # m       - list all bookmarks
            command ls -1 "$MARKPATH/" | MARKPATH="$MARKPATH" xargs -I'{}' \
                sh -c 'echo "{} ->" $(readlink "$MARKPATH/{}")'
            ;;
        *)             # m foo   - cd to the bookmark directory
            local dest="$(readlink "$MARKPATH/$1" 2> /dev/null)"
            [ -d "$dest" ] && cd "$dest" || echo "No such mark: $1"
            ;;
    esac
}

# auto completion for m.sh
if [ -n "$BASH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKPATH="${MARKPATH:-$HOME/.local/share/marks}"
        local curword="${COMP_WORDS[COMP_CWORD]}"
        if [[ "$curword" == "-"* ]]; then
            COMPREPLY=($(find "$MARKPATH" -type l -name "${curword:1}*" \
                2> /dev/null | awk -F "/" '{print "-"$NF}'))
        else
            COMPREPLY=($(find "$MARKPATH" -type l -name "${curword}*" \
                2> /dev/null | awk -F "/" '{print $NF}'))
        fi
    }
    complete -F _cdmark_complete m
elif [ -n "$ZSH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKPATH="${MARKPATH:-$HOME/.local/share/marks}"
        if [[ "${1}${2}" == "-"* ]]; then
            reply=($(command ls -1 "$MARKPATH" 2> /dev/null | \
                awk '{print "-"$0}'))
        else
            reply=($(command ls -1 "$MARKPATH" 2> /dev/null))
        fi
    }
    compctl -K _cdmark_complete m
fi

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                conf/common_conf/vps_fast.sh                                                                        000644  000765  000024  00000002403 14133765512 017110  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/usr/bin/env bash

# 2. 远程快速安装SS、开启BBR
# 原始命令 git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i ss_pass ss_port && sudo ss-fly/ss-fly.sh -bbr -Y
# 2.1 root 用户
function fastss0() {
	ssh -o "StrictHostKeyChecking=no" -t root@"$3" "git clone -b master https://github.com/Ted-Wang/ss-fly && ss-fly/ss-fly.sh -i $1 $2 && ss-fly/ss-fly.sh -bbr -Y"
}
# 2.2 普通用户
function fastss1() {
    ssh -o "StrictHostKeyChecking=no" -t ted@"$3" "git clone -b master https://github.com/Ted-Wang/ss-fly && sudo ss-fly/ss-fly.sh -i $1 $2 && sudo ss-fly/ss-fly.sh -bbr -Y"
}
# 调用格式：fastss1 ss_pass port ip，比如：fastss vpn_pass 8388 67.68.69.70

# 3. 远程添加用户，原始命令 ssh -o 'StrictHostKeyChecking=no' -t root@host_ip 'useradd $1 -G sudo -s /bin/bash -m -p $(echo $2 | openssl passwd -1 -stdin)'
# 3.1 root 用户
function fastuser0() {
    ssh -o "StrictHostKeyChecking=no" -t root@"$3" "useradd $1 -G sudo -s /bin/bash -m -p $(echo $2 | openssl passwd -1 -stdin)"
}
# 3.2 普通用户
function fastuser1() {
    ssh -o "StrictHostKeyChecking=no" -t ted@"$3" "sudo useradd $1 -G sudo -s /bin/bash -m -p $(echo $2 | openssl passwd -1 -stdin)"
}
#调用格式：fastuser0 ted44 password 192.168.1.101

                                                                                                                                                                                                                                                             conf/common_conf/ssh_client_config                                                                  000644  000765  000024  00000000770 14133765512 020337  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         TCPKeepAlive=yes
ServerAliveInterval 60

Host raspi
    HostName raspi
    User pi

Host pi
    HostName raspi
    User pi

Host mint
    HostName d-mint
    User ted

Host mint
    HostName 172.17.1.111
    User ted

#Host dev1
#   	HostName dev1.domain.com

#Host dev2
#	HostName dev2.domain.com

#Host dev*
#	User dev
#	Port 22
#	IdentityFile ~/.ssh/id_rsa
#	ServerAliveInterval 60
#	TCPKeepAlive=yes

#Host test
#	HostName test.domain.com
#	User test

#Host *
#	Port 22

# ( vim: set ft=sshconfig: )
        conf/common_conf/ted_extra.bashrc                                                                   000644  000765  000024  00000000044 14133765512 020071  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         alias wol='bash ~/my_script/wol.sh'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            conf/common_conf/m2.sh                                                                              000644  000765  000024  00000006255 14133765512 015612  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

# 代码设计思路来自【韦易笑】的文章：[十行代码实现路径书签功能](https://zhuanlan.zhihu.com/p/57659856)
# 原文的实现思路是通过 symblol link 来实现，但是 symbol link 在 win/git-bash 下无法工作。ln命令会直接 copy 整个目录。
# 此脚本的实现思路是通过 .ini 文件来保存 bookmarks，相当于把 ini 文件当成一个 key-value 数据库来用。通过 grep 和 sed 来读取和修改文件。

# 功能
#   - m         # 列出当前所有书签
#   - m foo     # 跳转到名为 foo 的标签
#   - m +foo    # 将当前路径添加成书签 foo
#   - m -foo    # 删除名为 foo 书签
#   - m /foo    # 搜索名称里包含 foo 的书签

# 使用方法：source 此代码，或者把下面代码直接 append 到 .bashrc 里

# function for marks management
MARKFILE=$HOME/.local/share/marks.ini
function m() {
    MARKFILE="${MARKFILE:-$HOME/.local/share/marks.ini}"
    # echo "store file: $MARKFILE"
    if [ ! -f "$MARKFILE" ]; then
        mkdir -p -m 700 "${MARKFILE%/*}" 2> /dev/null
        touch "$MARKFILE" && sudo chmod 700 "$MARKFILE"
    fi
    case "$1" in
        +*)            # m +foo  - add new bookmark for $PWD
            if grep -Eq "^${1:1}=" "$MARKFILE"; then
                sed -Ei "s@${1:1}=.*\$@${1:1}=$(pwd)@" "$MARKFILE"
            else
                echo "${1:1}=$(pwd)" >> "$MARKFILE"
            fi
            ;;
        -*)            # m -foo  - delete a bookmark named "foo"
            sed -Ei "/^${1:1}=/d" "$MARKFILE"
            ;;
        /*)            # m /bar  - search bookmarks matching "bar"
            grep -E "^.*?${1:1}.*?=" "$MARKFILE" | sed "s/=/\ ->\ /g"
            ;;
        "")            # m       - list all bookmarks
            cat "$MARKFILE" | sed "s/=/\ ->\ /g"
            ;;
        *)             # m foo   - cd to the bookmark directory
            if grep -Eq "^${1}=" "$MARKFILE"; then
                cd $(sed -E "s@^${1}=(.*)\$@\1@" "$MARKFILE" | grep -v "=")
            else
                echo "No such mark: $1"
            fi
            ;;
    esac
}

# auto completion for m.sh
if [ -n "$BASH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKFILE="${MARKFILE:-$HOME/.local/share/marks.ini}"
        local curword="${COMP_WORDS[COMP_CWORD]}"
        if [[ "$curword" =~ [-+/].* ]]; then
        #if echo "$curword" | grep -Eq "[-+/].*" ; then
            COMPREPLY=($(sed -r "s@^(${curword:1}.*?)=(.*$)@${curword:0:1}\1@" "$MARKFILE" | grep -v "="))
        else
            COMPREPLY=($(sed -r "s@^(${curword}.*?)=(.*$)@\1@" "$MARKFILE" | grep -v "="))
        fi
    }
    complete -F _cdmark_complete m
elif [ -n "$ZSH_VERSION" ]; then
    function _cdmark_complete() {
        local MARKFILE="${MARKFILE:-$HOME/.local/share/marks.ini}"
        local cur cword words
        read -cn cword
        read -Ac words
        curword="$words[$cword]"
        if [[ "$curword" =~ [-+/].* ]]; then
            reply=($(sed -r "s@^(${curword:1}.*?)=(.*$)@${curword:0:1}\1@" "$MARKFILE" | grep -v "="))
        else
            reply=($(sed -r "s@^(${curword}.*?)=(.*$)@\1@" "$MARKFILE" | grep -v "="))
        fi
    }
    compctl -K _cdmark_complete m
fi
                                                                                                                                                                                                                                                                                                                                                   conf/common_conf/shell_prompt.sh                                                                    000755  000765  000024  00000003717 14133765512 020007  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
function generateShellPromptWithGit() {
    local IMPORT_PROMPT_FILE=0
    # import __git_ps1() function for Manjaro
    pacman --help > /dev/null 2>&1
    if [ $? == 0 ] && [ -f /usr/share/git/completion/git-prompt.sh ]; then
        echo source /usr/share/git/completion/git-prompt.sh
        IMPORT_PROMPT_FILE=1
    fi

    # import __git_ps1() function for CentOS, RHEL, Redhat
    yum --help > /dev/null 2>&1
    if [ $? == 0 ] && [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
        echo source /usr/share/git-core/contrib/completion/git-prompt.sh
        IMPORT_PROMPT_FILE=1
    fi

    unameOut="$(uname -s)"
    case $unameOut in
        Linux*) runIn=Linux-shell;;
        MINGW*) runIn=Win/git-bash;;
        Darwin*) runIn=Mac;;
    esac

    git --version > /dev/null 2>&1
    if [ $? == 0 ]; then 
        if [ "$runIn" == "Linux-shell" ]; then
            # shell prompt with git branch. color pink for path(\w)
            #export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[01;36m\]\$(__git_ps1 '(%s)')\[\033[0m\]\$ "
            # color blue for path(\w). this blue[38;5;26] is performed better then [01;34m] while in a server terminal.
            if [[ $IMPORT_PROMPT_FILE == 1 ]]; then
                echo " && "
            fi 
            echo export PS1='"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;26m\]\w\[\033[01;36m\]\$(__git_ps1 '\''(%s)'\'')\[\033[0m\]\$ "'
        fi
            # keep git-bash in Windows unchanged.
            echo ""
    else
        # shell prompt without git
        #export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[0m\]\$ "
        # blue color for path
        if [[ $IMPORT_PROMPT_FILE == 1 ]]; then
            echo " && "
        fi 
        echo export PS1='"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;26m\]\w\[\033[0m\]\$ "'
    fi
}
                                                 conf/env_init.sh                                                                                    000755  000765  000024  00000020156 14133765512 014611  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

#basefolder=${0%/*}
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SHELL_PROMPT=shell_prompt.sh
SSH_CONFIG="$HOME/.ssh/config"
MY_SCRIPT_FOLDER="$HOME/my_script"
TED_BASH_RC=.ted.bashrc
TED_VIM_RC=.ted.vimrc
TED_BASH_RC_OLD=ted.bashrc
TED_VIM_RC_OLD=ted.vimrc

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    MSYS*) runIn=Win/msys2;;
    Darwin*) runIn=Mac;;
    CYGWIN*) runIn=Win/Cygwin;;
esac
if [ "$runIn" == "Win/git-bash" ] || [ "$runIn" == "Win/Cygwin" ] || [ "$runIn" == "Win/msys2" ]; then
    SUDO=""
elif [ "$runIn" == "Linux-shell" ]; then
    if [ "$(whoami)" == "root" ]; then
        SUDO=""
    else
        SUDO=sudo
    fi
else
    SUDO=sudo
fi

function clear_old_rc_file(){
    if grep -Eq "^\s*so(urce){0,1}\s+~/${TED_VIM_RC_OLD}$" ~/.vimrc; then
        sed -i 's/ted\.vimrc/\.ted\.vimrc/g' ~/.vimrc
        \rm ~/${TED_VIM_RC_OLD}
    fi
    if grep -Eq "^\s*source\s+~/${TED_BASH_RC_OLD}$" ~/.bashrc; then
        sed -i 's/ted\.bashrc/\.ted\.bashrc/g' ~/.bashrc
        \rm ~/${TED_BASH_RC_OLD}
    fi
    echo clear old ted.***rc file done
}

function conf_vimrc(){
    echo setting up vimrc
    \cp $BASE_DIR/common_conf/${TED_VIM_RC} ~/
    $SUDO chmod 644 ~/${TED_VIM_RC}
    if [ ! -f ~/.vimrc ]; then
        touch ~/.vimrc
        $SUDO chmod 644 ~/.vimrc
    fi
    if grep -Eq "^\s*so(urce){0,1}\s+~/\.ted\.vimrc$" ~/.vimrc; then 
        : # do nothing
    else
        cat << EOF >> ~/.vimrc
if(filereadable(expand("~/${TED_VIM_RC}")))
    so ~/${TED_VIM_RC}
endif
EOF
    fi
    echo done.
}

function conf_bashrc(){
    echo setting up bashrc
    \cp $BASE_DIR/common_conf/${TED_BASH_RC} ~/
    $SUDO chmod 644 ~/${TED_BASH_RC}
    if [ ! -f ~/.bashrc ]; then
        touch ~/.bashrc
        $SUDO chmod 644 ~/.bashrc
    fi
    if grep -Eq "^\s*source\s+~/${TED_BASH_RC}$" ~/.bashrc; then
        : # do nothing
    else 
        cat << EOF >> ~/.bashrc
if [ -f ~/${TED_BASH_RC} ]; then
    source ~/${TED_BASH_RC}
fi
EOF
    fi
    # plan to move these aliases to a scirpt file and exposed as functions
    #echo appending vps_extra.bashrc to .ted.bashrc
    #patch_extra_bashrc $BASE_DIR/common_conf/vps_extra.bashrc
    echo done.
}

function patch_extra_bashrc(){
    local arg; for arg in $@; do
        if [ -f $arg ]; then
            cat $arg >> ~/${TED_BASH_RC}
        fi
    done
}

function conf_shell_theme_for_win(){
    if [[ "$runIn" == "Win/git-bash" ]] || [[ "$runIn" == "Win/msys2" ]]; then
        echo setting up shell theme for win/git-bash MSYS2
        myThemeFile=flat-ui
        if [ -f $BASE_DIR/common_conf/ted-conf ]; then
            \cp $BASE_DIR/common_conf/ted-conf /usr/share/mintty/themes/ 
            myThemeFile=ted-conf
        fi
        if ! grep -Eq "^ThemeFile.*$" ~/.minttyrc; then 
            echo "ThemeFile=$myThemeFile" >> ~/.minttyrc
        fi
    fi
}

function conf_ssh(){
    echo setting up ssh conf
    # ssh keep alive
    if [ -f "$SSH_CONFIG" ] && grep -Eq "TCPKeepAlive" "$SSH_CONFIG" || grep -Eq "TCPKeepAlive" /etc/ssh/ssh_config; then
        : # do nothing
    else
        if [ ! -d ~/.ssh ]; then
            mkdir ~/.ssh
        fi
        cat $BASE_DIR/common_conf/ssh_client_config >> "$SSH_CONFIG"
        #$SUDO chmod 644 $SSH_CONFIG
    fi
}

function conf_shell_prompt_inc_git(){
    # shell prompt
    # as file "~/.ted.bashrc" will be copied everytime, no need to check file content here.
    source $BASE_DIR/common_conf/$SHELL_PROMPT
    echo $(generateShellPromptWithGit) >> ~/${TED_BASH_RC}
    echo "" >> ~/${TED_BASH_RC}
    # another apporach is to copy this file and source it in ~/.ted.bashrc
    #\cp $BASE_DIR/common_conf/$SHELL_PROMPT ~/
    #echo "source ~/$SHELL_PROMPT" >> ~/${TED_BASH_RC}
}

function conf_git(){
    echo setting up git conf
    # git config
    GIT_CONF=$BASE_DIR/common_conf/git.gitconfig
    if [ "$runIn" == "Linux-shell" ]; then
        \cp $GIT_CONF $BASE_DIR/common_conf/git.gitconfig.linux
        GIT_CONF=$BASE_DIR/common_conf/git.gitconfig.linux
        # set credential store to cache in Linux
        sed -i 's/helper\ =\ manager/helper\ =\ cache --timeout=3600/g' $GIT_CONF
    fi
    # check if .gitconfig is updated, backup it before override.
    if [ -f ~/.gitconfig ];then
        sum1=$(md5sum ~/.gitconfig)
        sum2=$(md5sum $GIT_CONF)
        sum1=${sum1:0:32}
        sum2=${sum2:0:32}
        if [ "$sum1" != "$sum2" ]; then
            \cp ~/.gitconfig ~/gitconfig.bak.`date "+%Y-%m-%d_%H-%M-%S"`
            \cp $GIT_CONF ~/.gitconfig
            echo ~/.gitconfig updated. The old .gitconfig file is renamed as a backup file.
        else
            echo no need to update ~/.gitconfig
        fi
    else
        \cp $GIT_CONF ~/.gitconfig
        echo create ~/.gitconfig
    fi
    # clear temp file
    if [ "${GIT_CONF:0-5:5}" == "linux" ];then
       \rm $GIT_CONF
    fi 
}

function conf_lanuage_CN(){
    # setup Chinese language support env
    # TBD
    : # do nothting right now.
}

function __check_my_script_folder() {
    if [ ! -d "$MY_SCRIPT_FOLDER" ]; then
        mkdir -p "$MY_SCRIPT_FOLDER"
        echo create folder: $MY_SCRIPT_FOLDER
    fi
}

function copy_script_to_my_script_folder() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [ -f $arg ]; then
            \cp $arg $MY_SCRIPT_FOLDER/
        fi
    done
}

function copy_script_and_make_symlink() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [ -f $arg ]; then
            \cp $arg $MY_SCRIPT_FOLDER/
            script_name=$MY_SCRIPT_FOLDER/${arg##*/}
            echo copy file: $arg to $script_name
            link_name=${arg##*/}
            link_name=${link_name:0:-3}
            link_name=~/.local/bin/$link_name
            sudo ln -sf $script_name $link_name
            echo create symlink $link_name
        fi
    done
}

function copy_script_and_source_it() {
    __check_my_script_folder
    local arg; for arg in $@; do 
        if [ -f $arg ]; then
            \cp $arg "$MY_SCRIPT_FOLDER"/
            script_name=$MY_SCRIPT_FOLDER/${arg##*/}
            echo copy file: $arg to $script_name
            cat << EOF >> ~/${TED_BASH_RC}
if [ -f "$script_name" ]; then
    source "$script_name"
fi
EOF
        fi
    done
}

function conf_my_script() {
    if [ -d "$MY_SCRIPT_FOLDER" ]; then
        \rm "$MY_SCRIPT_FOLDER"/*
    fi
    copy_script_and_source_it $BASE_DIR/common_conf/m2.sh

    #copy_script_to_my_script_folder $BASE_DIR/script/dockertags.sh
    #copy_script_and_make_symlink $BASE_DIR/script/dockertags.sh
    copy_script_and_source_it $BASE_DIR/script/dockertags.sh

    
    if [[ "${1:-'all'}" != "work" ]]; then
        copy_script_and_source_it $BASE_DIR/common_conf/vps_fast.sh

        echo patching ted_extra.bashrc to ${TED_BASH_RC}
        copy_script_to_my_script_folder $BASE_DIR/script/wol.sh
        patch_extra_bashrc $BASE_DIR/common_conf/ted_extra.bashrc
    fi
}

function conf_m2_script(){
    # 1. add m2.sh(a very simple bookmark for shell) to ~/.ted.bashrc
    #echo -n '#--------a short bookmark function start--------' >> ~/${TED_BASH_RC}
    #if [ -f $BASE_DIR/common_conf/m2.sh ];then
        #cat $BASE_DIR/common_conf/m2.sh >> ~/${TED_BASH_RC}
    #fi
    #echo '#--------a short bookmark function end--------' >> ~/${TED_BASH_RC}

    # 2. another approach is to copy m2.sh and source it in ~/.ted.bashrc
    # move to upper function
    : # do nonthing
}


function apply_conf_all() {
    clear_old_rc_file
    conf_vimrc
    conf_bashrc
    conf_ssh
    #conf_lanuage_CN
    conf_shell_prompt_inc_git
    conf_git
    #conf_m2_script
    conf_my_script
    conf_shell_theme_for_win
}

function apply_conf_work() {
    clear_old_rc_file
    conf_vimrc
    conf_bashrc
    #conf_ssh
    #conf_lanuage_CN
    conf_shell_prompt_inc_git
    #conf_git
    #conf_m2_script
    conf_my_script $1
    conf_shell_theme_for_win
}

function apply_conf() {
    ENV=${1:-"home"}
    if [[ "${ENV}" == "work" ]]; then
        apply_conf_work ${ENV}
        echo "applying conf for work done."
    else 
        apply_conf_all ${ENV}
        echo "applying conf for all done."
    fi
}

apply_conf $1
source ~/${TED_BASH_RC}

                                                                                                                                                                                                                                                                                                                                                                                                                  conf/font_init.sh                                                                                   000755  000765  000024  00000002751 14133765512 014770  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -f /etc/os-release ]; then
    OS=$(sed -E "s@^ID=(.*)\$@\1@" "/etc/os-release" | grep -v "=")
fi

# When Linux OS installed with English as default language, the Chinese character may be displayed incorrect due to the wrong font fallback priority.
echo correct font fall back
if [ -f /etc/fonts/conf.avail/64-language-selector-prefer.conf ]; then
    sudo \cp /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.avail/64-language-selector-prefer.conf.bak
fi
sudo sh -c "sudo cat $BASE_DIR/linux_conf/64-language-selector-prefer.conf > /etc/fonts/conf.avail/64-language-selector-prefer.conf"

# install font and create symlink for Manjaro
#pacman --help > /dev/null 2>&1
#if [ $? == 0 ]; then
if [[ "$OS" == "manjaro" ]]; then
    # create symbol link for Manjaro
    sudo pacman -S --noconfirm noto-fonts-cjk
    sudo ln -s /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.d/64-language-selector-prefer.conf
fi

# install font and create symlink for Linux Mint
if [[ "$OS" == "linuxmint" ]]; then
    # create symbol link for Manjaro
    sudo apt-get -y fonts-noto-cjk fonts-noto-mono
    sudo ln -s /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.d/64-language-selector-prefer.conf
fi

# update font cache, may not take effect, reboot if noeffect.
sudo fc-cache -fv

# use following command to check font setting
# fc-match -s | grep 'Noto Sans CJK'

                       conf/linux_conf/                                                                                    000755  000765  000024  00000000000 14133765512 014577  5                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         conf/linux_conf/fcitx_env                                                                           000644  000765  000024  00000000252 14133765512 016506  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
# add the following 3 lines into ~/.xinitrc or ~/.xprofile. if no sure, add in both.
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

                                                                                                                                                                                                                                                                                                                                                      conf/linux_conf/64-language-selector-prefer.conf                                                    000644  000765  000024  00000001517 14133765512 022563  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         <?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
	<alias>
		<family>sans-serif</family>
		<prefer>
			<family>Noto Sans CJK SC</family>
			<family>Noto Sans CJK TC</family>
			<family>Noto Sans CJK HK</family>
			<family>Noto Sans CJK JP</family>
			<family>Noto Sans CJK KR</family>
		</prefer>
	</alias>
	<alias>
		<family>serif</family>
		<prefer>
			<family>Noto Serif CJK SC</family>
			<family>Noto Serif CJK TC</family>
			<family>Noto Serif CJK JP</family>
			<family>Noto Serif CJK KR</family>
		</prefer>
	</alias>
	<alias>
		<family>monospace</family>
		<prefer>
			<family>Noto Sans Mono CJK SC</family>
			<family>Noto Sans Mono CJK TC</family>
			<family>Noto Sans Mono CJK HK</family>
			<family>Noto Sans Mono CJK JP</family>
			<family>Noto Sans Mono CJK KR</family>
		</prefer>
	</alias>
</fontconfig>
                                                                                                                                                                                 conf/linux_conf/enable_Chinese_lang_in_GUI                                                          000644  000765  000024  00000000247 14133765512 021604  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
# add the following 3 lines into ~/.xinitrc or ~/.xprofile. if no sure, add in both.
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export LC_CTYPE=en_US.UTF-8

                                                                                                                                                                                                                                                                                                                                                         conf/script/                                                                                        000755  000765  000024  00000000000 14133765512 013737  5                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         conf/script/add_sftp_user.sh                                                                        000644  000765  000024  00000000661 14133765512 017120  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

# Add a user to group "sftp", create a folder in /sftp, which is accessed merely by this user.
# Usage: add_sftp_user user
sftp_user=${1:-'sted'}
sftp_group=sftp
sudo useradd $sftp_user -M -N -d /sftp -g $sftp_group -s /usr/sbin/nologin -p $(echo $sftp_user | openssl passwd -1 -stdin)
sudo mkdir -p /sftp/$sftp_user
sudo chown $sftp_user:sftp /sftp/$sftp_user
sudo chmod 700 /sftp/$sftp_user
unset sftp_user sftp_group
                                                                               conf/script/wol.sh                                                                                  000755  000765  000024  00000003066 14133765512 015104  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/usr/bin/env bash

# Usage: bash wol.sh mac_address broadcast_ip
# use bash wol.sh "" 192.168.1.255 to specify the broadcast address without changing MAC by default.

broadcast=${2:-255.255.255.255}
#broadcast=${2:-172.17.1.255}
port=7

unameOut="$(uname -s)"
case $unameOut in
    Linux*) runIn=Linux-shell;;
    MINGW*) runIn=Win/git-bash;;
    Darwin*) runIn=Mac;;
esac
if [ "$runIn" == "Win/git-bash" ]; then
    NC='ncat'                         # ncat on windows is provided by nmap.org, it can send to broadcast address without specifying any argument.
    broadcast=${2:-172.17.1.255}     # but ncat can send only to broadcast addr like 192.168.1.255, not able to send to 255.255.255.255.
else
    NC='nc -b'		                # -b broadcast, without this argument, nc may not send UDP broadcast.
fi

#mac=${1:-B8-97-5A-85-DD-A2}     # D-Mint
mac=${1:-58-41-20-28-33-BC}     # D-Mint-2.5G
#mac=${1:-00-17-A4-DE-F6-C4}    # NX6325
#mac=${1:-08:00:27:f5:90:07}    # VM-Mint
mac_address=$(echo $mac | sed 's/://g; s/-//g')		# Strip colons from the MAC address

magic_packet=$(
  	printf 'f%.0s' {1..12}
  	printf "$mac_address%.0s" {1..16}
)
# need to be hex-escaped
magic_packet_hex=$(
  	echo $magic_packet | sed -e 's/../\\x&/g'
)

#echo $magic_packet_hex
echo waking up machine[$mac], sending wol magic packet to $broadcast:$port
echo -e $magic_packet_hex | $NC -w1 -4u $broadcast $port

# another aproach is to use xxd to transfer string to hex
#echo -n $magic_packet | xxd -r -p | $NC -w1 -4u $broadcast $port

unset mac mac_address broadcast port magic_packet magic_packet_hex
                                                                                                                                                                                                                                                                                                                                                                                                                                                                          conf/script/show_win_key.vbs                                                                        000644  000765  000024  00000004672 14133765512 017171  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         ' 如何查看Windows7、8、10的序列号 http://www.oldding.net/vbs.html

Option Explicit 

Dim objshell,path,DigitalID, Result 
Set objshell = CreateObject("WScript.Shell")
'Set registry key path
Path = "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\"
'Registry key value
DigitalID = objshell.RegRead(Path & "DigitalProductId")
Dim ProductName,ProductID,ProductKey,ProductData
'Get ProductName, ProductID, ProductKey
ProductName = "Product Name: " & objshell.RegRead(Path & "ProductName")
ProductID = "Product ID: " & objshell.RegRead(Path & "ProductID")
ProductKey = "Installed Key: " & ConvertToKey(DigitalID) 
ProductData = ProductName  & vbNewLine & ProductID  & vbNewLine & ProductKey
'Show messbox if save to a file 
If vbYes = MsgBox(ProductData  & vblf & vblf & "Save to a file?", vbYesNo + vbQuestion, "BackUp Windows Key Information") then
   Save ProductData 
End If



'Convert binary to chars
Function ConvertToKey(Key)
    Const KeyOffset = 52
    Dim isWin8, Maps, i, j, Current, KeyOutput, Last, keypart1, insert
    'Check if OS is Windows 8
    isWin8 = (Key(66) \ 6) And 1
    Key(66) = (Key(66) And &HF7) Or ((isWin8 And 2) * 4)
    i = 24
    Maps = "BCDFGHJKMPQRTVWXY2346789"
    Do
       	Current= 0
        j = 14
        Do
           Current = Current* 256
           Current = Key(j + KeyOffset) + Current
           Key(j + KeyOffset) = (Current \ 24)
           Current=Current Mod 24
            j = j -1
        Loop While j >= 0
        i = i -1
        KeyOutput = Mid(Maps,Current+ 1, 1) & KeyOutput
        Last = Current
    Loop While i >= 0 
    keypart1 = Mid(KeyOutput, 2, Last)
    insert = "N"
    KeyOutput = Replace(KeyOutput, keypart1, keypart1 & insert, 2, 1, 0)
    If Last = 0 Then KeyOutput = insert & KeyOutput
    ConvertToKey = Mid(KeyOutput, 1, 5) & "-" & Mid(KeyOutput, 6, 5) & "-" & Mid(KeyOutput, 11, 5) & "-" & Mid(KeyOutput, 16, 5) & "-" & Mid(KeyOutput, 21, 5)
   
    
End Function
'Save data to a file
Function Save(Data)
    Dim fso, fName, txt,objshell,UserName
    Set objshell = CreateObject("wscript.shell")
    'Get current user name 
    UserName = objshell.ExpandEnvironmentStrings("%UserName%") 
    'Create a text file on desktop 
    fName = "C:\Users\" & UserName & "\Desktop\WindowsKeyInfo.txt"
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set txt = fso.CreateTextFile(fName)
    txt.Writeline Data
    txt.Close
End Function                                                                      conf/script/frp.sh                                                                                  000755  000765  000024  00000001167 14133765512 015072  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/usr/bin/env bash

function frprestart(){
    frpc_pid="$(ps -ef | grep frpc | grep -v grep | head -n1 | awk '{print $2}')"
    echo "killing frpc(PID=$frpc_pid)"
    kill ${frpc_pid}
    echo "restarting frpc"
    frpc
    ps -ef | grep frpc | grep -v grep 
    echo "done"
}

alias frps='nohup ~/frp/frp_0.33.0_linux_amd64/frps -c ~/frp/frp_0.33.0_linux_amd64/frps.ini >> ~/frp/frp_0.33.0_lin    ux_amd64/frps.log 2>&1 &'
alias frpc='nohup ~/frp/frp_0.33.0_linux_arm/frpc -c ~/frp/frp_0.33.0_linux_arm/frpc.ini >> ~/frp/frp_0.33.0_linux_arm/frpc.log 2>&1 &'
alias frprestart='bash -i ~/frp/frp_0.33.0_linux_arm/frprestart.sh'

                                                                                                                                                                                                                                                                                                                                                                                                         conf/script/mpback.bat                                                                              000644  000765  000024  00000002111 14133765512 015657  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         @echo off

rem Usage: mpback, mpback full, mpback all
rem if argument like "full" or "all" not provided, will not back the "backup" folder, which size is quite big.

cd /d %~dp0
set WINRAR="C:\Program Files\WinRAR\WinRAR.exe"
set S-ZIP="C:\Program Files\7-Zip\7z.exe"
set ZIP=%S-ZIP%


rem set minipad2_path=D:\Program\daily_notes
set minipad2_path=D:\A_notes\minipad2_2016-07-07
set target_path=D:\Backup\Back_Notes\minipad2


set TIM=%time: =0%
set DATE_SUFFIX="%DATE:~0,4%_%DATE:~5,2%_%DATE:~8,2%_%TIM:~0,2%_%TIM:~3,2%_%TIM:~6,2%"

rem echo %DATE_SUFFIX%
set "arg1=%1"
rem if %arg1%==storage goto sub_full_back
set ARG_EXCLUDE="-xr!backup"
if "%arg1%"=="full" (
	set "ARG_EXCLUDE="
) else if "%arg1%"=="all" (
	set "ARG_EXCLUDE="
) else (
	set ARG_EXCLUDE="-xr!backup"
)

rem set back_file=dailyNotes_%today_str%.rar
rem %WINRAR% a %back_file% %minipad2_path%
set back_file=DailyNotes_%DATE_SUFFIX%.zip
rem echo %back_file%

%ZIP% a %ARG_EXCLUDE% %back_file% %minipad2_path%
xcopy %back_file% %target_path%\ /Y
del %back_file% /q
REM echo %~f0
rem @pause                                                                                                                                                                                                                                                                                                                                                                                                                                                       conf/script/clear_src_bak.sh                                                                        000755  000765  000024  00000001313 14133765512 017046  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
echo "the following files will be cleared:"
find /etc/apt/* -maxdepth 0 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}'
find /etc/apt/sources.list.d/ -maxdepth 1 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}'
read -p "confirm deleting the above files? [y/n]" confirm
if [ "$confirm" == "y" ] || [ "$confirm" == "yes" ]; then
    find /etc/apt/* -maxdepth 0 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}' | xargs sudo rm
    find /etc/apt/sources.list.d/ -maxdepth 1 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}' | xargs sudo rm
    echo done.
fi
                                                                                                                                                                                                                                                                                                                     conf/script/changesrc.sh                                                                            000755  000765  000024  00000006324 14133765512 016240  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
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

                                                                                                                                                                                                                                                                                                            conf/script/wol.py                                                                                  000644  000765  000024  00000002454 14133765512 015117  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/usr/bin/env python
# -*- coding: utf-8 -*-
# Description:   Ref: https://github.com/bentasker/Wake-On-Lan-Python

import socket
import struct
import time

MAC = "B8-97-5A-85-DD-A2"      # D-Server
#MAC = "00-17-A4-DE-F6-C4"      # NX6325
#MAC = "08-00-27-f5-90-07"      # VM-Mint

 
BROADCAST = "172.17.1.255"
PORT = 7

def main():
    if len(MAC) != 17:
        raise ValueError("MAC address should be set as form 'XX-XX-XX-XX-XX-XX'")
    mac_address = MAC.replace("-", '').replace(':', '')
    data = ''.join(['FFFFFFFFFFFF', mac_address * 16])
    send_data = b''

    # Split up the hex values and pack.
    for i in range(0, len(data), 2):
        send_data = b''.join([send_data, struct.pack('B', int(data[i: i + 2], 16))])
    #print(send_data)

    # Broadcast
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        print("waking up machine[" + MAC + "], sending wol magic packet to " + BROADCAST + ":" + str(PORT))
        sock.sendto(send_data, (BROADCAST, PORT))
        #time.sleep(1)
        #sock.sendto(send_data, (BROADCAST, PORT))
        #time.sleep(1)
        #sock.sendto(send_data, (BROADCAST, PORT))
        print("Done")
    except Exception as e:
        print(e)

if __name__ == '__main__':
    main()
                                                                                                                                                                                                                    conf/script/setup-sftp_server.sh                                                                    000644  000765  000024  00000002436 14133765512 020000  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

sftp_user=sftp
sftp_group=sftp
sftp_home=/sftp
sftp_share_folder=$sftp_home/share
sudo mkdir -p $sftp_share_folder
sudo chown root:root $sftp_home
sudo chmod 755 $sftp_home
sudo groupadd $sftp_group
sudo useradd sftp -M -N -d $sftp_home -g $sftp_group -s /usr/sbin/nologin -p $(echo $sftp_user | openssl passwd -1 -stdin)
sudo chown sftp:sftp $sftp_share_folder
sudo chmod ug+rwX $sftp_share_folder

# disable original sftp-server, enable interal-sftp server
echo disabling sftp-server
sudo sed -i 's/^Subsystem\s*sftp\s*\/usr\/lib\/openssh\/sftp-server/#\0/' /etc/ssh/sshd_config
echo enabling internal-sftp server
if ! grep -Eq "^Subsystem\s*sftp\s*internal-sftp" /etc/ssh/sshd_config; then
    sudo sed -i '/^#Subsystem\s*sftp\s*\/usr\/lib\/openssh\/sftp-server/a \
Subsystem sftp internal-sftp' /etc/ssh/sshd_config
fi

# limit the access directory
echo patching /etc/ssh/sshd_config
if ! grep -Eq "Match Group $sftp_group" /etc/ssh/sshd_config; then
    sudo sh -c "cat << 'EOF' >> /etc/ssh/sshd_config
Match Group $sftp_group
    ChrootDirectory %h
    ForceCommand internal-sftp -u 0000
    AllowTCPForwarding no
    X11Forwarding no
    PermitTTY no
EOF"
fi

echo sftp set up. user name: $sftp_user, share folder: $sftp_share_folder

unset sftp_user sftp_group sftp_home sftp_share_folder
                                                                                                                                                                                                                                  conf/script/dockertags.sh                                                                           000755  000765  000024  00000001311 14133765512 016420  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

# source: https://stackoverflow.com/questions/28320134/how-can-i-list-all-tags-for-a-docker-image-on-a-remote-registry

function dockertags() {
    if [ $# -lt 1 ]; then
    cat << HELP

dockertags  --  list all tags for a Docker image on a remote registry.

EXAMPLE: 
    - list all tags for ubuntu:
       dockertags ubuntu

    - list all php tags containing apache:
       dockertags php apache

HELP
    fi

    image="$1"
    tags=`wget -q https://registry.hub.docker.com/v1/repositories/${image}/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'`

    if [ -n "$2" ]
    then
        tags=` echo "${tags}" | grep "$2" `
    fi

    echo "${tags}"
}
                                                                                                                                                                                                                                                                                                                       conf/script/env.sh                                                                                  000644  000765  000024  00000000756 14133765512 015073  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

# this script file is to be create a "common env" for my other scripts.
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

currentOS()
{
    if [ -f /etc/os-release ]; then
        os=$(sed -E "s@^ID=(.*)\$@\1@" "/etc/os-release" | grep -v "=")
    fi
    echo $os
    unset os
}
                  conf/script/setup-git_server.sh                                                                     000644  000765  000024  00000002051 14133765512 017600  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

# after setup git repo, you can use any user with sudo right to init a repo like:
#   sudo -u git git init --bare new_repo.git 

GIT_SHELL=$(which git-shell)
GIT_USER=git
GIT_REPO=/repo
git --version >/dev/null 2>&1
if [ $?==0 ] && [ -f $GIT_SHELL ] && ! grep -Eq "$GIT_SHELL" /etc/shells; then
    echo adding $GIT_SHELL to /etc/shells
    sudo sh -c "echo $GIT_SHELL >> /etc/shells"
fi

sudo useradd $GIT_USER -s $GIT_SHELL -d $GIT_REPO -m -p $(echo $GIT_USER| openssl passwd -1 -stdin)
#sudo useradd $GIT_USER -s $GIT_SHELL -m -p $(echo $GIT_USER| openssl passwd -1 -stdin)
sudo mkdir -p $GIT_REPO/.ssh
sudo chmod 700 $GIT_REPO/.ssh
sudo touch $GIT_REPO/.ssh/authorized_keys
sudo chmod 600 $GIT_REPO/.ssh/authorized_keys
sudo chown $GIT_USER:$GIT_USER $GIT_REPO/.ssh $GIT_REPO/.ssh/authorized_keys

if ! grep -Eq "Match Group $GIT_USER" /etc/ssh/sshd_config; then
    echo patching /etc/ssh/sshd_config
    sudo sh -c "cat << 'EOF' >> /etc/ssh/sshd_config
Match User $GIT_USER
    AllowTCPForwarding no
    X11Forwarding no
    PermitTTY no
EOF"
fi
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       conf/script/cron/                                                                                   000755  000765  000024  00000000000 14133765512 014700  5                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         conf/script/cron/cron.sample                                                                        000644  000765  000024  00000000725 14133765512 017050  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

*/1 * * * * ~/cputemp/cpu_monitor.sh 2> >( while read line; do echo "$(date): ${line}"; done  >> ~/cputemp/cpu_monitor.log ) 1>&2
#*/1 * * * * ~/cputemp/cpu_test.sh 2> >( while read line; do echo "$(date): ${line}"; done >> ~/cputemp/cpu_test.log ) 1>&2
# house keeping at 1:30 on every first day of month
30 1 1 * * ~/cputemp/cpu_mon_housekeeping.sh >> ~/cputemp/cpu_monitor.log 2>&1
                                           conf/script/cron/cputemp/                                                                           000755  000765  000024  00000000000 14133765512 016355  5                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         conf/script/cron/server_power/                                                                      000755  000765  000024  00000000000 14133765512 017422  5                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         conf/script/cron/install_cron_jobs.sh                                                               000644  000765  000024  00000003462 14133765512 020745  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

USER=$(whoami)
# [TODO] find out CRON path in different Linux distro.
if [ -f /etc/os-release ]; then
    OS=$(sed -E "s@^ID=(.*)\$@\1@" "/etc/os-release" | grep -v "=")
fi
case $OS in
ubuntu|raspbian|linuxmint )
    CRON_PATH=/var/spool/cron/crontabs
    ;;
manjaro|centos/fedora/rhel )
    CRON_PATH=/var/spool/cron
    ;;
* )
    CRON_PATH=/var/spool/crontabs
    ;;
esac

CRON_FILE=$CRON_PATH/$USER
echo host OS:$OS, current user:$USER, the cron job file location: $CRON_FILE
#echo this script is not complete, please DO NOT use.
#exit 1

if ! sudo grep -Eq "SHELL=/bin/bash" $CRON_FILE; then
    echo setup shell path environment for cron job.
    sudo bash -c "echo '' >> $CRON_FILE"
    sudo bash -c "echo 'SHELL=/bin/bash' >> $CRON_FILE"
    sudo bash -c "echo 'PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin' >> $CRON_FILE"
    sudo bash -c "echo '' >> $CRON_FILE"
fi

if ! sudo grep -Eq "cputemp" $CRON_FILE; then
    echo setting up \"cputem\" job.
    sudo bash -c "cat << 'EOF' >> $CRON_FILE
# check cpu temperature every minute
*/1 * * * * ~/cron/cputemp/cpu_monitor.sh 2> >( while read line; do echo \"\$(date): \${line}\"; done  >> ~/cron/cputemp/cpu_monitor.log ) 1>&2
# clear cpu temperature output data files monthly
30 1 1 * * ~/cron/cputemp/cpu_mon_housekeeping.sh >> ~/cron/cputemp/cpu_monitor.log 2>&1
EOF"
else
    echo cron job \"cputemp\" is already exist.
fi

if ! sudo grep -Eq "server_power_check.sh" $CRON_FILE; then
    echo setting up \"server_power_check\" job.
    sudo bash -c "cat << 'EOF' >> $CRON_FILE

# check server power on/off
*/10 * * * * ~/cron/server_power/server_power_check.sh 2> >( while read line; do echo \"\$(date): \${line}\"; done  >> ~/cron/server_power/server_power_check.log ) 1>&2
EOF"
else
    echo cron job \"server_power_check\" is already exist.
fi
                                                                                                                                                                                                              conf/script/cron/cron_test.sh                                                                       000755  000765  000024  00000000175 14133765512 017242  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         source ~/.bashrc
#echo "\$HOME="$HOME
echo `alias`
echo `date +%H:%M:%S`,`cputemp`
cat /sys/class/thermal/thermal_zone0/temp
                                                                                                                                                                                                                                                                                                                                                                                                   conf/script/cron/server_power/server_power_check.sh                                                 000755  000765  000024  00000005066 14133765512 023647  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SERVER_NAME=D-Mint
SERVER_MAC=""           # leave empyt to use default in wol.sh, or explicity specify it here.
CLIENT_LIST="aw17"      # space separated host list
LOG_FILE=$BASE_DIR/server_power_check.log

if [ -f ~/prj/conf/script/wol.sh ]; then
    WoL_script=~/prj/conf/script/wol.sh
elif [ -f ~/ws/conf/script/wol.sh ]; then
    WoL_script=~/ws/conf/script/wol.sh
elif [ -f ~/conf/script/wol.sh ]; then
    WoL_script=~/conf/script/wol.sh
else
    echo wol.sh not find, please check.
    exit 1
fi

machine_is_online(){
    ping -c1 -W1 -q $1 >/dev/null 2>&1
    echo $? == 0 || 0
}

poweron_server() {
    bash $WoL_script $SERVER_MAC > >( while read line; do echo "$(date) [INFO] $line"; done >> $LOG_FILE) 2>&1
}

server_poweroff() {
    sudo poweroff > >( while read line; do echo "$(date) [INFO] $line"; done >> $LOG_FILE) 2>&1
}

if [ $(hostname) == "$SERVER_NAME" ]; then
    mode=ServerSide
else
    mode=ClientSide
fi

#echo $(hostname)
#echo $mode

if [ $mode == "ServerSide" ]; then
    # check all monitored clients offlined, then do self poweroff
    echo "$(date) [INFO] server power checking start in Server side." >> $LOG_FILE 2>&1
    #echo "$(date) [INFO] server power checking start in Server side."
    all_client_offline=1
    for client in $CLIENT_LIST; do
        #echo checking host: $client
        if [ $(machine_is_online $client) ]; then
            all_client_offline=0
            break
        fi
    done
    #echo $all_client_offline
    if [ $all_client_offline -eq 1 ]; then
        echo "$(date) [INFO] all clients[$CLIENT_LIST] are offline, shutdown server now." >> $LOG_FILE 2>&1
        #echo "$(date) [INFO] all clients[$CLIENT_LIST] are offline, shutdown server now."
        server_poweroff
    fi
fi

if [ $mode == "ClientSide" ]; then
    # check if server is offlined, if yes, then check clients, if any clients online, poweron server.
    echo "$(date) [INFO] server power checking start in Client side." >> $LOG_FILE 2>&1
    #echo "$(date) [INFO] server power checking start in Client side."
    if [ ! $(machine_is_online $SERVER_NAME) ]; then
        for client in $CLIENT_LIST; do
            #echo checking host: $client
            if [ $(machine_is_online $client) ]; then
                echo "$(date) [INFO] find client[$client] is online, wake up server now." >> $LOG_FILE 2>&1
                #echo "$(date) [INFO] find client[$client] is online, wake up server now."
                poweron_server
                break
            fi
        done
    fi
fi

                                                                                                                                                                                                                                                                                                                                                                                                                                                                          conf/script/cron/cputemp/cpu_mon_housekeeping.sh                                                    000755  000765  000024  00000000347 14133765512 023126  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         
echo "$(date) [INFO] do house keeping work start."
f_list=$(find ~/cputemp/data/ -mtime +30 -type f)
echo "$(date) [INFO] deleting the following files:"
echo "$f_list" | sort
echo $f_list | xargs rm -f
echo "$(date) [INFO] done."
                                                                                                                                                                                                                                                                                         conf/script/cron/cputemp/cpu_monitor.sh                                                             000755  000765  000024  00000000772 14133765512 021260  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         #!/bin/bash
source ~/.bashrc

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ ! -d $BASE_DIR/data ]; then
    mkdir -p $BASE_DIR/data
fi

#echo "\$HOME="$HOME
#echo $(alias)
echo [$(date +%H:%M:%S)],$(cat /sys/class/thermal/thermal_zone0/temp) >> $BASE_DIR/data/$(date +%Y-%m-%d).csv
#echo [$(date +%H:%M:%S)],$(cat /sys/class/thermal/thermal_zone0/temp) >> ~/cputemp/data/$(date +%Y-%m-%d).csv
#echo [$(date +%H:%M:%S)],$(cputemp) >> ~/cputemp/data/$(date +%Y-%m-%d).csv
      conf/test.sh                                                                                        000755  000765  000024  00000002470 14133765512 013754  0                                                                                                    ustar 00huaiwa                          staff                           000000  000000                                                                                                                                                                         echo -e "$_"
echo "\$HOME="$HOME
echo -e ${0%/*}
echo  $0
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "BASE_DIR="$BASE_DIR

currentEnv()
{
    unameOut="$(uname -s)"
    case $unameOut in
        Linux*) runningIn=Linux;;
        MINGW*) runningIn=git-bash;;
        Darwin*) runningIn=Mac;;
    esac
    echo $runningIn
    #unset unameOut
    #unset runningIn
    return 0
}
r=$(currentEnv)
echo r=$r
echo unameout=$unameOut
echo runningIn=$runningIn
#unameOut="$(uname -s)"
#case $unameOut in
#    Linux*) runIn=Linux-shell;;
#    MINGW*) runIn=Win/git-bash;;
#    Darwin*) runIn=Mac;;
#esac
#if [ "$runIn" == "Win/git-bash" ]; then
#    SUDO="";
#elif [ "$runin" == "Linux-shell" ]; then
#    SUDO=sudo;
#else
#    SUDO=sudo;
#fi
#echo $SUDO
#
#echo -n > $BASE_DIR/test.out
#
#echo -e "\n#1:" >> $BASE_DIR/test.out
#if ! grep -Eq "^\s*so(urce){0,1}\s+~/ted\.vimrc$" ~/.vimrc
#then 
#    echo file "ted.vimrc" exist.
#else
#    $SUDO cat << EOF >> $BASE_DIR/test.out
#if(filereadable(expand(~/ted.vimrc)))
#    so ~/ted.vimrc
#endif
#EOF
#fi
#
#echo -e "\n#2:" >> $BASE_DIR/test.out
#if ! grep -Eq "^\s*source\s+~/ted.bashrc$" ~/.bashrc
#then
#    : # do nothing
#    echo bb
#else 
#    $SUDO cat << EOF >> $BASE_DIR/test.out
#if [ -f ~/ted.bashrc ]; then
#    source ~/ted.bashrc
#fi
#EOF
#fi
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        