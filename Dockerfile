#FROM openjdk:11-jdk-alpine
#RUN apk --no-cache add curl
#VOLUME /tmp
#ARG REGION_ARG=ap-south-1
#ARG ACCESS_ARG
#ARG SECRET_ARG
#ENV AWS_REGION=$REGION_ARG
#ENV AWS_ACCESS_KEY=$ACCESS_ARG
#ENV AWS_SECRET_KEY=$SECRET_ARG
#ARG JAR_FILE=target/ArchDevOps-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
RUN pwd
RUN ls
RUN cd opt
RUN ls
USER spring:spring
ENV JAR_FILE=ArchDevOps-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
