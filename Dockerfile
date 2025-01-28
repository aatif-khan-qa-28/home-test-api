# Stage 1: Build the project using Maven
FROM maven:3.8.6-openjdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and other necessary files
COPY pom.xml .

# Download dependencies (this avoids downloading them in every build)
RUN mvn dependency:go-offline

# Copy the whole project into the container
COPY . .

# Compile and package the project (skip tests during the build stage)
RUN mvn clean package -DskipTests


# Stage 2: Run the tests using Maven (Ensure Maven is available in this stage)
FROM maven:3.8.6-openjdk-11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built files (target directory, etc.) from the previous stage
COPY --from=build /app /app

# Ensure Maven is installed in the container (check for the "mvn" command)
RUN mvn --version



# Set the default command to run tests
CMD ["mvn", "test"]
