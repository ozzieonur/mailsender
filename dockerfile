#
# Build stage
#
FROM openjdk:17 AS build
COPY . .
RUN mvn -DskipTests=true clean package

#
# Package stage
#
FROM openjdk:17
COPY --from=build /target/mailsender-0.0.1-SNAPSHOT.jar mailsender.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","mailsender.jar"]