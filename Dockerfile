# Use an official OpenJDK runtime as the base image
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container
COPY target/SpringBootApp-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 9090

# Define the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]

