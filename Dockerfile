
FROM centos:7

#RUN yum install -y java-1.7.0-openjdk-headless tar
RUN yum install java-1.8.0-openjdk-1.8.0.222.b10-1.el7_7 -y
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-1.el7_7.x86_64/jre
#RUN curl -fL https://download.elastic.co/kibana/kibana/kibana-4.1.2-linux-x64.tar.gz | tar xzf - -C /opt && \
RUN curl -O curl -O https://artifacts.elastic.co/downloads/kibana/kibana-7.1.0-linux-x86_64.tar.gz && tar -xzf kibana-7.1.0-linux-x86_64$
RUN mv kibana-7.1.0-linux-x86_64 /opt/kibana
#RUN kibana-7.1.0-linux-x86_64/bin/kibana
COPY entrypoint.sh /
RUN chmod a+x entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/kibana/bin

CMD ["kibana"]

EXPOSE 5601

COPY couchbase /usr/share/elasticsearch/couchbase
ENV CBES_HOME /usr/share/elasticsearch/couchbase/bin
RUN chmod +x /usr/share/elasticsearch/couchbase/bin/cbes
RUN chmod 777 /usr/share/elasticsearch/couchbase/bin/cbes
#ENTRYPOINT cd /usr/share/elasticsearch/couchbase/bin && ./cbes
CMD ["/usr/share/elasticsearch/couchbase/bin/cbes"]

