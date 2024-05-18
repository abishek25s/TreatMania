<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon"  href="./assets/images/logo.svg" type="image/svg+xml">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{
            overflow-x: hidden;
            font-family: robota;
            font-size: 20px;
        }
        .box { 
            padding-top: 10px;
            padding-left:25px; 
            border: 2px solid black;
            border-radius: 20px;
            display: flex;
            align-items: center;
            width: 22%; 
            margin: 20px auto;
        }
        .box p{
            margin-top: 5px;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        .box:hover{
            background-color: hsl(39, 96%,48%);
        }
        #payButton {
            display: none;
            margin:20px auto;
        }
        .hi{
            display: none;
        }
        .notification-box {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #dff0d8;
            border: 2px solid hsl(39, 96%,48%);
            padding: 60px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            z-index: 9999;
            display: flex;
            flex-direction: column;
            gap: 10%;
        }

        .notification-box p {
            margin-bottom: 20px;
        }

        .close-btn {
            position: absolute;
            top: 5px;
            right: 10px;
            cursor: pointer;
            font-size: 20px;
            color: #333;
            border:2px solid red;
            padding:5px;
            background-color: red;
            color: white;
        }
        .close-btn:hover{
            background-color: black;
        }
        .notification-box .btn{
            background-color: hsl(39, 96%,48%);
        }
        @keyframes clockwise {
          0% {
            transform: rotate(0deg);
          }

          100% {
            transform: rotate(360deg);
          }
        }

        @keyframes counter-clockwise {
          0% {
            transform: rotate(0deg);
          }

          100% {
            transform: rotate(-360deg);
          }
        }

        .gearbox {
          background: #111;
          height: 150px;
          width: 200px;
          position: relative;
          border: none;
          overflow: hidden;
          border-radius: 6px;
          box-shadow: 0px 0px 0px 1px rgba(255, 255, 255, 0.1);
        }

        .gearbox .overlay {
          border-radius: 6px;
          content: "";
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          z-index: 10;
          box-shadow: inset 0px 0px 20px black;
          transition: background 0.2s;
        }

        .gearbox .overlay {
          background: transparent;
        }

        .gear {
          position: absolute;
          height: 60px;
          width: 60px;
          box-shadow: 0px -1px 0px 0px #888888, 0px 1px 0px 0px black;
          border-radius: 30px;
        }

        .gear.large {
          height: 120px;
          width: 120px;
          border-radius: 60px;
        }

        .gear.large:after {
          height: 96px;
          width: 96px;
          border-radius: 48px;
          margin-left: -48px;
          margin-top: -48px;
        }

        .gear.one {
          top: 12px;
          left: 10px;
        }

        .gear.two {
          top: 61px;
          left: 60px;
        }

        .gear.three {
          top: 110px;
          left: 10px;
        }

        .gear.four {
          top: 13px;
          left: 128px;
        }

        .gear:after {
          content: "";
          position: absolute;
          height: 36px;
          width: 36px;
          border-radius: 36px;
          background: #111;
          top: 50%;
          left: 50%;
          margin-left: -18px;
          margin-top: -18px;
          z-index: 3;
          box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.1), inset 0px 0px 10px rgba(0, 0, 0, 0.1), inset 0px 2px 0px 0px #090909, inset 0px -1px 0px 0px #888888;
        }

        .gear-inner {
          position: relative;
          height: 100%;
          width: 100%;
          background: #555;
          border-radius: 30px;
          border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .large .gear-inner {
          border-radius: 60px;
        }

        .gear.one .gear-inner {
          animation: counter-clockwise 3s infinite linear;
        }

        .gear.two .gear-inner {
          animation: clockwise 3s infinite linear;
        }

        .gear.three .gear-inner {
          animation: counter-clockwise 3s infinite linear;
        }

        .gear.four .gear-inner {
          animation: counter-clockwise 6s infinite linear;
        }

        .gear-inner .bar {
          background: #555;
          height: 16px;
          width: 76px;
          position: absolute;
          left: 50%;
          margin-left: -38px;
          top: 50%;
          margin-top: -8px;
          border-radius: 2px;
          border-left: 1px solid rgba(255, 255, 255, 0.1);
          border-right: 1px solid rgba(255, 255, 255, 0.1);
        }

        .large .gear-inner .bar {
          margin-left: -68px;
          width: 136px;
        }

        .gear-inner .bar:nth-child(2) {
          transform: rotate(60deg);
        }

        .gear-inner .bar:nth-child(3) {
          transform: rotate(120deg);
        }

        .gear-inner .bar:nth-child(4) {
          transform: rotate(90deg);
        }

        .gear-inner .bar:nth-child(5) {
          transform: rotate(30deg);
        }

        .gear-inner .bar:nth-child(6) {
          transform: rotate(150deg);
        }   
        .loading-container {
            margin-bottom: 20px; /* Adjust this value to your preference */
        }
        .info{
            border:2px solid black; 
            padding:20px; 
            width:30%;
            margin:40px auto;
            display: flex; 
            flex-direction: column;
            align-items: center;
        }
        .box p{
            padding-right: 20px;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <h1>Checkout</h1>
        <div class="box" onclick="selectCashPayment()">
            <p>Pay ₹${total} by Cash</p>
        <label for ="cashRadio">
            <input type="radio" name="paymentMethod" id="cashRadio" onchange="showPayButton(event)">
        </label>
        </div>
        <button id="payButton" class="btn btn-success mt-3" onclick="placeOrder()">Pay by Cash</button>
        <div class="hi">
            <p>hi</p>
        </div>
    </div>
    <div class="convieniance"></div>
    <div class="info">
        <div class="loading-container">
            <div class="gearbox">
            <div class="overlay"></div>
              <div class="gear one">
                <div class="gear-inner">
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                </div>
              </div>
              <div class="gear two">
                <div class="gear-inner">
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                </div>
              </div>
              <div class="gear three">
                <div class="gear-inner">
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                </div>
              </div>
              <div class="gear four large">
                <div class="gear-inner">
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                </div>
              </div>
            </div>
        </div>
        <div class="text-container">
            <p>Online Payments are to be integrated soon...Stay Tuned.</p>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function selectCashPayment() {
            document.getElementById("cashRadio").checked = true;
            showPayButton(event);
        }
        function showPayButton(event) {
            event.stopPropagation();
            document.getElementById("payButton").style.display = "block";
        }
        function placeOrder() {
            // Disable scrolling
            document.body.style.overflow = 'hidden';

            // Here you can perform any necessary actions before placing the order
            var notification = `
                <div class="notification-box">
                    <span class="close-btn" onclick="closeNotification()">&times;</span>
                    <p>Congratulations! Your order is placed!</p>
                    <button class="btn btn-primary" onclick="main.jsp">Back to Home</button>
                </div>
            `;
            document.querySelector('body').insertAdjacentHTML('beforeend', notification);
        }
        function closeNotification() {
            document.body.style.overflow = 'auto';
            var notificationBox = document.querySelector('.notification-box');
            if (notificationBox) {
                notificationBox.remove();
            }
        }
    </script>
    <%@include file="footer.jsp" %>
</body>
</html>
