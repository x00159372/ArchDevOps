
FROM adoptopenjdk/openjdk11:alpine-jre  as build
RUN addgroup -S spring && adduser -S spring -G spring
RUN pwd
RUN ls
WORKDIR /user/src/app
RUN ls
USER spring:spring
ENV JAR_FILE=ArchDevOps-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
