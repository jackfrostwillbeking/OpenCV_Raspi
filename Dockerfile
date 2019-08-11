# どのイメージを基にするか
FROM raspbian/stretch
#FROM sample5_with_git
#FROM hogehoge2:latest
# 作成したユーザの情報
LABEL maintainer="jackfrostwillbekingfrost@gmail.com"
# RUN: docker buildするときに実行される

# CMD以下はdocker runするときに実行
CMD echo "now running..."; --privileged
EXPOSE 5000
