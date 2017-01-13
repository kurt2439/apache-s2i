FROM openshift/base-centos7
USER root
RUN yum -y install httpd && yum clean all
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
#RUN echo test > /var/www/html/index.html
RUN chmod -R a+rwx /run/httpd /etc/httpd/logs
RUN chmod a+rwx /var/www/html
USER nobody
EXPOSE 8080
COPY ./s2i/ $STI_SCRIPTS_PATH
#CMD /usr/sbin/httpd -DFOREGROUND


#USER 1001
#CMD $STI_SCRIPTS_PATH/assemble
#CMD $STI_SCRIPTS_PATH/run
