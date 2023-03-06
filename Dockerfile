FROM springci/graalvm-ce:java17-0.12.x

ARG DEBIAN_FRONTEND=noninteractive

ENV M2_HOME=/opt/apache-maven-3.8.5
ENV PATH=$PATH:/opt/apache-maven-3.8.5/bin

RUN apt-get update
RUN apt-get -y install wget

RUN wget https://mirrors.estointernet.in/apache/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
RUN tar -xvf apache-maven-3.8.5-bin.tar.gz
RUN mv apache-maven-3.8.5 /opt/

WORKDIR /app

COPY ./src ./src
COPY pom.xml pom.xml

RUN mvn clean install -DskipTests

RUN echo "$PATH"

RUN cp ./target/gitpod-test-*.jar app.jar

EXPOSE 80

ENTRYPOINT ["java", "-jar", "app.jar"]