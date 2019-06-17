# どのイメージを基にするか
FROM arm32v6/alpine
#FROM test-image:latest
# 作成したユーザの情報
LABEL maintainer="jackfrostwillbekingfrost@gmail.com"
# RUN: docker buildするときに実行される
RUN apk update && apk add --no-cache git bash libffi-dev ncurses-dev openssl-dev readline-dev tk-dev xz-dev zlib-dev sqlite-dev bzip2-dev alpine-sdk
RUN git clone https://github.com/anyenv/anyenv ~/.anyenv && echo \
$'if [ -d $HOME/.anyenv ] \n\
 then \n\
    export PATH="$HOME/.anyenv/bin:$PATH"\n\
    export ANYENV_ROOT="$HOME/.anyenv"\n\
    eval "$(anyenv init -)"\n\
fi\n\
if [ -d $HOME/.anyenv/envs/pyenv ] \n\
 then \n\
    export PATH="$HOME/.anyenv/envs/pyenv/bin:$PATH"\n\
    export PYENV_ROOT="$HOME/.anyenv/envs/pyenv/"\n\
    eval "$(pyenv init -)"\n\
    eval "$(pyenv virtualenv-init -)"\n\
fi' >> /etc/profile
RUN source /etc/profile && \
yes|anyenv install --init 2>/dev/null && \
anyenv install pyenv && \
export PATH="$HOME/.anyenv/envs/pyenv/bin:$PATH" && \
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv/" && \
source /etc/profile && \
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv && \
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update && \
pyenv install 3.7.3

# CMD: docker runするときに実行される
CMD echo "now running..."
