<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    <link rel="shortcut icon"  href="./assets/images/logo.svg" type="image/svg+xml">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TreatMania - Login</title>
    <style>
      /* Embedded CSS for Login Page */
        body {
          font-family: serif, sans-serif;
          margin: 0;
          padding: 0;
          background-image: url('./assets/images/demobg.jpg');
          background-size: cover;
          background-position: center;
          height: 100vh;
          display: flex;
          justify-content: center;
          align-items: center;
        }
        .form-wrapper {
            text-align: center; 
            background: linear-gradient(to bottom, #FFA500, #FF6347);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            padding: 20px;
            width: 300px; 
            animation: slide-up 0.5s ease forwards;
            opacity: 0;
            position: relative;
            top: 50px;
          }

        .form-title {
          text-align: center;
          margin-bottom: 20px;
          padding:10px;
          color: #fff;
        }
        .form-group {
          margin: 20px;

        }
        .form-group label {
          display: block;
          font-size: 16px;
          margin-bottom: 5px;
          color: #fff;
        }
        .form-group input {
            width: calc(100% - 20px); 
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
          }
        .btn-primary {
          display: flex;
          background-color: #4CAF50;
          color: white;
          padding:10px;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          font-size: 16px;
          margin: 20px;
          transition: background-color 2.0s ease;
          align-items: center;
        }
        .btn-primary:hover {
          background-color: #45a049;
        }
        @keyframes slide-up {
          to {
            opacity: 1;
            top: 0;
          }
        }
    </style>
    </head>
    <body>
        <div class="form-wrapper">
            <h2 class="form-title" style="font-size:27px;">Login to TreatMania</h2>
            <form action="LoginServlet" method="post">
                <div class="form-group">
                <input type="text" id="email" name="email" placeholder = "Email" required>
                </div>
                <div class="form-group">
                <input type="password" id="password" name="password" placeholder = "password" required>
                </div>
                <button type="submit" class="btn-primary">Login</button>
                <p style="color: white;">Don't have an account? <a href="signUp.html">SignUp</a></p>
            </form>
        </div>
    </body>
</html>
