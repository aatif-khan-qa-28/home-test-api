# Stage 1: Build the project using Maven with JDK
FROM maven:3.8.6-openjdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and other necessary files
COPY pom.xml ./

# Download dependencies (this avoids downloading them in every build)
RUN mvn dependency:go-offline

# Copy the whole project into the container
COPY . .

# Compile and package the project (skip tests during the build stage)
RUN mvn clean package -DskipTests

# Stage 2: Run the tests using Maven with JDK
FROM maven:3.8.6-openjdk-11-slim

# Set the working directory
WORKDIR /app

# Install curl and wait-for-it.sh
RUN apt-get update && apt-get install -y \
    curl \
    && curl -Lo /app/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
    && chmod +x /app/wait-for-it.sh

# Copy the built files from the previous stage
COPY --from=build /app /app

# Ensure Maven and JDK are available in the container
RUN java -version && mvn --version

# Set the default command to run tests and wait for the demo-app service
CMD ["/app/wait-for-it.sh", "demo-app:3100", "--", "mvn", "test"]
