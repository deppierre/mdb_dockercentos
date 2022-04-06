FROM centos

ENV datadir=/mongo/data/db
EXPOSE 27017

WORKDIR ${datadir}

COPY files/* ./

RUN cp mongodb-org-5.0.repo /etc/yum.repos.d/ &&\
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* &&\
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* &&\
    yum -y update &&\
    yum install -y mongodb-org &&\
    sed -i "s|dbPath_to_replace|${datadir}|" mongod.conf

# Execute the init script and shutdown
RUN mkdir logs &&\
    chmod +x start.sh

# #This is command issued when the container is created
CMD sh start.sh