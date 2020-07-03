#!/usr/bin/env bash

curl https://get.symfony.com/cli/installer -o - | bash
mv $HOME/.symfony/bin/symfony /usr/local/bin/symfony

apt-get update && apt-get upgrade

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    yes | sdk install java && \
    rm -rf $HOME/.sdkman/archives/* && \
    rm -rf $HOME/.sdkman/tmp/*
cp $HOME/.sdkman/candidates/java/current/bin/java /usr/local/bin/

JAVA_HOME="/usr/local/bin/java"
export JAVA_HOME
PATH="$JAVA_HOME/bin:$PATH"
export PATH

pecl install grpc && docker-php-ext-enable grpc