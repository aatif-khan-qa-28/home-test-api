# Use Maven with JDK
FROM maven:3.8.5-openjdk-17 as builder

# Set working directory
WORKDIR /app

# Copy the project files
COPY pom.xml ./
RUN mvn dependency:go-offline

COPY src ./src
COPY target ./target

# Command to run tests
CMD ["mvn", "test"]
