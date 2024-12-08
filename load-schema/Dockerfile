FROM redhat/ubi9:latest
COPY  mongo.repo /etc/yum.repos.d/mongo.repo
RUN dnf install mysql -y  && \
    dnf install mongodb-mongosh -y
COPY run.sh /run.sh
CMD ["bash","/run.sh"]
