# Quiz Application

## Overview
This is a quiz application that allows users to answer questions across various topics such as PHP, Sports, Science & Technology, Arts, and Politics. The application is built using a SQL database to store questions, answers, and topics.

## Prerequisites
- A SQL database (MySQL)
- A server environment (e.g., XAMPP)

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Sourabh-s-m/quiz_app.git
cd quiz_app
```

### 2. Set Up the Database
- Open MySQL and create a database named `quiz_app`.
- Import the `schema.sql` file, which can be found in the `database` folder, into your `quiz_app` database.

### 3. Configure Database Connection
- Update the database connection settings in your application code (`config.php`) to match your database credentials.

### 4. Start the PHP Server
Run the following command to start a local PHP server:
```bash
php -S localhost:8080
```

### 5. Access the Application
1. Open your web browser and navigate to `http://localhost:8080/client/index.html`.
2. Note: Ensure you use the 8080 port as the base URL, since Google Authentication has been integrated and the fallback might be affected if a different port is used.

## Usage
- Follow the on-screen instructions to select a topic and start answering questions.
- After completing the quiz, you will receive feedback on your performance, including the number of correct answers.