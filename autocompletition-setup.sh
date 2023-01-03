# macOS
brew install bash-completion
# CentOS/Red Hat
yum install bash-completion
# Debian/Ubuntu
apt-get install bash-completion

# Run the completition script
source <(kubectl completion bash)
# if you are using zsh replace bash with zsh 
# You can add the line to bashrc to be available on restart 
echo "source <(kubectl completion bash)" >> ${HOME}/.bashrc