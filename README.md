# **Home Test API - End-to-End Testing Framework**

This repository contains an automated testing framework built with [Karate](https://github.com/karatelabs/karate) for testing the Demo API. The framework ensures the correctness of API endpoints by validating multiple scenarios using Behavior-Driven Development (BDD).

---

## **Key Features**

- **Reusable Framework**: Built with modular components to support dynamic test data.
- **Dockerized Setup**: Includes `docker-compose` for easy setup and containerization.
- **Comprehensive Scenarios**: Covers a variety of API tests, including positive, negative, and edge cases.
- **Dynamic Data**: Test data is maintained in JSON format, promoting flexibility and maintainability.
- 
---

## **Prerequisites**

- **Docker** 
- **Java** (version 8 or higher)
- **Maven** (version 3.6+)

---

## **Setup Instructions**

### **Step 1: Clone the Repository**
Clone the repository to your local machine:
```bash
git clone https://github.com/aatif-khan-qa-28/home-test-api.git
cd home-test-api
```

### **Step 2: Start the Containers**
Use Docker Compose to build and start the containers:
```bash
docker-compose up --build
```
This will:
1. Start the Demo API container on `http://localhost:3100`.
2. Execute the Karate tests in the `karate-tests` container.

### **Step 3: View Test Results**
The test execution logs will appear in the console. Upon successful completion, the logs will indicate whether all tests passed.

`target` folder will have karate summary report on the below path:
 `/target/karate-reports/karate-summary.html`


### **Step 4: Stop the Containers**
Once the tests are complete, stop the running containers:
```bash
docker-compose down
```
---
## **Project Structure**
```
home-test-api/
├── docker-compose.yml                   # Docker Compose configuration
├── Dockerfile                           # Dockerfile for Karate test container
├── pom.xml                              # Maven configuration
├── README.md                            # Documentation
├── karate-config.js                     # Config file to define baseUrl and other configurations
├── src
    └──  test
        └──  java
            └── com
                └── home
                    └── features/        # Directory for all the feature files
                    └── utils/           # Directory for JSON schmas and test data
                    └── TestRunner.java  # Runner class to execute all the test cases
```
---
## **How it Works**
**Dockerized Execution**

The `docker-compose.yml` file defines two services:

1. `demo-app`: Runs the demo API on http://localhost:3100.
2. `karate-tests`: Executes the Karate tests.
  
**Feature File**

The `src/test/java/com/home/features` directory defines all test scenarios using Karate's BDD syntax. Each scenario dynamically fetches data from the JSON file.

---
## **Running Locally (Without Docker)**
1. Start the API manually:
```
docker pull automaticbytes/demo-app
docker run -p 3100:3100 automaticbytes/demo-app
```
2. Run the tests:
```
mvn test
```

---

## **Test Results**

Sample karate-summary HTML reports:

<img width="954" alt="api-report-1" src="https://github.com/user-attachments/assets/710c37f7-787e-4b3e-95c8-6baa7aeffd9d" />

<img width="767" alt="api-report-2" src="https://github.com/user-attachments/assets/870e8fb8-f464-4d1f-ac16-b14949b6a666" />


---
## **Troubleshooting**
- **If the containers fail to start:**

- Ensure Docker and Docker Compose are installed and running.
- Check if port `3100` is already in use.


- **If tests fail:**

-  Verify the Demo API is running on `http://localhost:3100`.
-  Ensure the test data in `src/test/java/com/home/utils` matches the API's expected format.
---
## **Resource**
- **[Karate Documentation](https://github.com/karatelabs/karate)**
- **[Docker Documentation](https://docs.docker.com/get-started/)**
 ---
## **Author**
Created by **[Mohd Aatif Khan]()**.
---
## **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
