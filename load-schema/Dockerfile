FROM redhat/ubi9:latest
COPY  mongo.repo /etc/yum.repos.d/mongo.repo
RUN dnf install mysql -y  && \
    dnf install mongodb-mongosh -y
RUN dnf install git -y
COPY run.sh /run.sh
CMD ["bash","/run.sh"]
