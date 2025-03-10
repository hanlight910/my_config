wget https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.4.3/spring-boot-cli-3.4.3-bin.tar.gz
tar -xzf spring-boot-cli-3.4.3-bin.tar.gz
sudo ln -s ./shell-completion/bash/spring /etc/bash_completion.d/spring
sudo ln -s ./shell-completion/zsh/_spring /usr/local/share/zsh/site-functions/_spring

sudo mv spring-3.4.3 /opt/

