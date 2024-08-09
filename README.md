# Vim_Plugin Install
## 安装插件可以使vim功能更多 git显示更为直观

1 ### 切换到/Users/chiyingjie/.gitbash 目录修改git相关配置 (如果没有则新建文件)
cd ~/.gitbash/
~/.gitbash/git-completion.bash
~/.gitbash/git-prompt.sh


2 ### 用户跟目录修改.bashrc 和 .vimrc (如果没有则新建文件)
cd /Users/username
vim .bashrc
vim .vimrc


3 ### 执行命令安装插件
Plugin Install
vim +PluginInstall +qall
