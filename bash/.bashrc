
# Ted Wang's .bashrc, v0.01, 2019-09-17

# Linux 没有 start 命令，所以这里alias了一个 run 代替。来自 StackOverlow 的答案。
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter/42466441#42466441
# 主要是由于Bash的alias参数必须放在最后，这就导致了需要通过特别的技巧来实现。
alias run='bash -c '\''nohup "$@" >&/dev/null &'\'' _'

