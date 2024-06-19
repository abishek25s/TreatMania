<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login and Registration</title>
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            font-family: 'Montserrat';
            background-color: #f0f0f0;
            background: url('./assets/images/pattern3.jpg') no-repeat center center fixed;
            background-size: cover;
            overflow-x: hidden;
            overflow-y: hidden;
        }
        .container {
            width: 800px;
            height: 400px;
            display: flex;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .signin,
        .signup {
            width: 50%;
            padding: 40px;
            box-sizing: border-box;
        }

        .signin {
            background-color: hsl(39, 96%, 48%);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .signin h2 {
            margin: 0;
            font-size: 2em;
        }

        .signin p {
            margin: 20px 0;
            text-align: center;
        }

        .signin button {
            padding: 10px 20px;
            background-color: white;
            color: hsl(39, 96%, 48%);
            border: none;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .signin button:hover {
            background-color: hsl(39, 96%, 48%);
            color: white;
        }

        .signup {
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
        }

        .signup h2 {
            margin: 0;
            font-size: 2em;
        }

        .signup .social-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .signup .social-container a {
            margin: 0 5px;
            font-size: 1.5em;
            color: #333;
        }

        .signup form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .signup form input {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 20px;
        }

        .signup form button {
            margin-top: 25px;
            padding: 10px 20px;
            background-color: hsl(39, 96%, 48%);
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .signup form button:hover {
            background-color: white;
            color: hsl(39, 96%, 48%);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                width: 90%;
                height: auto;
            }

            .signin,
            .signup {
                width: 100%;
            }

            .signin button,
            .signup form button {
                width: 80%;
            }
        }

        .signin form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .signin form input {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 20px;
        }
        .fline{
            display: flex;
            gap: 15px;
            align-items: center;
            margin-left: 0px;
            padding-left: 0px;            
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="signin">
            <div class="fline">
                <img src="./assets/images/logo_prev_ui.png" alt="demo" width="50" height="50">
                <h2>Welcome Back!</h2>
            </div>
            <p>To keep connected with us please login with your personal info</p>
            <form action="LoginServlet" method="post">
                <input type="email" name ="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required style='margin-bottom: 30px;'>
                <button>SIGN IN</button>
            </form>
        </div>
        <div class="signup">
            <div class="fline">
                <img src="./assets/images/logo_prev_ui.png" alt="demo" width="50" height="50">
                <h2>Create Account</h2>
            </div>
            <form action="signUpServlet" method="post" class="signinForm">
                <input type="text" name="username" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">SIGN UP</button>
            </form>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>

</html>