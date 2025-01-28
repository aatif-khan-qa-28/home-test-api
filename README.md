# **Home Test API - End-to-End Testing Framework**

This repository contains an automated testing framework built with [Karate](https://github.com/karatelabs/karate) for testing the Demo API. The framework ensures the correctness of API endpoints by validating multiple scenarios using Behavior-Driven Development (BDD).

---

## **Key Features**

- **Reusable Framework**: Built with modular components to support dynamic test data.
- **Dockerized Setup**: Includes `docker-compose` for easy setup and containerization.
- **Comprehensive Scenarios**: Covers a variety of API tests, including positive, negative, and edge cases.
- **Dynamic Data**: Test data is maintained in JSON format, promoting flexibility and maintainability.

---

## **Test Scenarios Covered**

1. **Get All Menu Items**
    - Validate that the response contains at least 9 items.
    - Ensure each item includes `id`, `name`, `price`, and `image`.

2. **Filter by ID**
    - Validate the response for `id=3` matches the expected item (`Baked Rolls x 8`).

3. **Add Item for Non-Existent ID**
    - Add a new menu item with ID `10`.
    - Validate response status code is `200`.

4. **Add Item for Existing ID**
    - Attempt to add a menu item with an existing ID (`10`).
    - Validate response status code is `400`.

5. **Add Item with Missing Information**
    - Try adding an item without all required fields.
    - Validate response status code is `400`.
    - Ensure the response contains the message: `"Not all requirements are met"`.

6. **Validate Recent Addition**
    - Confirm that the newly added item (`ID 10`) is present in the inventory.

---

## **Prerequisites**

- **Docker** (version 20.10+)
- **Docker Compose** (version 2.0+)
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

### **Step 4: Stop the Containers**
Once the tests are complete, stop the running containers:
```bash
docker-compose down
```
---
## **Project Structure**
```
home-test-api/
├── docker-compose.yml      # Docker Compose configuration
├── Dockerfile              # Dockerfile for Karate test container
├── pom.xml                 # Maven configuration
├── README.md               # Documentation
├── src
│   ├── test
│   │   ├── java
│   │   │   └── com
│   │   │       └── home
│   │   │           └── test
│   │   │               └── InventoryTestRunner.java  # Karate runner class
│   │   ├── resources
│   │   │   ├── features
│   │   │   │   └── inventory.feature  # Karate feature file with test scenarios
│   │   │   └── logback-test.xml       # Logging configuration

```
---
## **How it Works**
**Dockerized Execution**

The `docker-compose.yml` file defines two services:

1. `demo-app`: Runs the demo API on http://localhost:3100.
2. `karate-tests`: Executes the Karate tests.
  
**Feature File**

The `inventory.feature` file defines all test scenarios using Karate's BDD syntax. Each scenario dynamically fetches data from the JSON file.

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
## **Troubleshooting**
- **If the containers fail to start:**

- Ensure Docker and Docker Compose are installed and running.
- Check if port `3100` is already in use.


- **If tests fail:**

-  Verify the Demo API is running on `http://localhost:3100`.
-  Ensure the test data in `inventory.json` matches the API's expected format.
---
## **Resource**
- **[Karate Documentation](https://github.com/karatelabs/karate)**
- **[Docker Documentation](https://docs.docker.com/get-started/)**
 ---
## **Author**
Created by **[Mohd Aatif Khan]()**. For inquiries, please contact on my **[Email](khan.aatif2807@gmail.com)** / **[Linkedin](https://www.linkedin.com/in/mohdaatifkhan)**.

---
## **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
