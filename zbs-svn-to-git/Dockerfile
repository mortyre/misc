FROM centos:centos7
RUN yum install -y git-svn
RUN echo "cd /builds/ZBS/server-fetching/" > /fetch-rebase.sh
RUN echo "git svn fetch" >> /fetch-rebase.sh
RUN echo "git svn rebase" >> /fetch-rebase.sh
RUN chmod +x /fetch-rebase.sh
ENTRYPOINT ["/bin/bash", "/fetch-rebase.sh"]
