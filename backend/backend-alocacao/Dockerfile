FROM maven:3.9.11-amazoncorretto-21-debian-trixie AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM amazoncorretto:21-alpine
WORKDIR /app
RUN apk add --no-cache curl
COPY --from=build /app/target/backend-alocacao.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","app.jar"]