# Quiz Application Documentation

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Technologies Used](#technologies-used)
4. [Prerequisites](#prerequisites)
5. [Installation](#installation)
6. [Database Setup](#database-setup)
8. [Running the Application](#running-the-application)
9. [Usage](#usage)
10. [Testing](#testing)
13. [Contact](#contact)

## Overview
The Quiz Application is an interactive platform designed to enhance knowledge through quizzes on various topics, including PHP, Sports, Science & Technology, Arts, and Politics. Users can answer multiple-choice questions and receive feedback on their performance, making learning engaging and fun.

## Features
- **Multiple Choice Questions:** Users can select answers from multiple options.
- **Topic Selection:** Users can choose from various topics to take quizzes.
- **Performance Feedback:** After completing a quiz, users receive feedback on their performance, including the number of correct answers.
- **User-Friendly Interface:** The application is designed for easy navigation and interaction.

## Technologies Used
- **Frontend:** 
  - HTML: For structuring the web pages.
  - CSS: For styling the application.
  - JavaScript: For client-side interactivity.
- **Backend:** 
  - PHP: For server-side logic and handling requests.
- **Database:** 
  - MySQL: For storing questions, answers and topics.
- **Server Environment:** 
  - XAMPP: A local server environment for running PHP applications.

## Prerequisites
Before you begin, ensure you have the following installed:
- A SQL database (MySQL)
- A server environment (e.g., XAMPP)

## Installation

### 1. Clone the Repository
To get a local copy of the project, run the following commands in your terminal:
```bash
git clone https://github.com/Sourabh-s-m/quiz_app.git
cd quiz_app
```

### 2. Set Up the Database
- Open your MySQL client (e.g., phpMyAdmin) and create a new database named `quiz_app`.
- Import the `schema.sql` file located in the `database` folder into your `quiz_app` database. This file contains the necessary tables and initial data.

### 3. Configure Database Connection
- Open the `config.php` file in the root directory of the project.
- Update the database connection settings to match your MySQL credentials:
  ```php
  $host = 'localhost';
  $db   = 'quiz_app';
  $user = 'your_username';
  $pass = 'your_password';
  ```

## Running the Application

### 1. Start the PHP Server
To run the application locally, start a PHP server by executing the following command in your terminal:
```bash
php -S localhost:8080
```

### 2. Access the Application
Open your web browser and navigate to `http://localhost:8080/client/index.html` to access the application.

## Usage
- Upon accessing the application, you will see a list of available topics.
- Select a topic to start the quiz.
- Answer the questions by selecting the appropriate options.
- After completing the quiz, review your performance feedback, which includes the number of correct answers.

## Testing
To ensure the application functions correctly:
- Verify that all questions and answers are displayed properly.
- Test the scoring system to confirm it accurately counts correct answers.
- Check the database connection and data retrieval by attempting to load quizzes.

## Contact
For any inquiries or feedback, please contact:
- **Name:** Sourabh
- **Email:** [sourabmadiwal55@gmailcom](mailto:sourabmadiwal55@gmailcom)