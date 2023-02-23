FROM ghcr.io/graalvm/graalvm-ce:ol9-java17-22.3.1
EXPOSE 80
ARG JAR_PATH=target/gitpod-test-*.jar
ADD ${JAR_PATH} app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]