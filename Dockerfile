FROM centos:centos7

LABEL maintainer=https://github.com/davidmssantos

ENV JAVA_VERSON 1.8.0
ENV MAVEN_VERSION 3.3.9

# instalando o java
RUN yum update -y && \
  yum install -y curl && \
  yum install -y java-$JAVA_VERSON-openjdk java-$JAVA_VERSON-openjdk-devel && \
  yum clean all

# instalando o maven
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV JAVA_HOME /usr/lib/jvm/java
ENV MAVEN_HOME /usr/share/maven

# instalando o node e npm
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum install -y nodejs


RUN node -v
RUN npm -v

# instalando perl e wget
RUN yum -y update && \
    yum -y install git perl wget which && \
    yum clean all
