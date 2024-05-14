<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon"  href="./assets/images/logo.svg" type="image/svg+xml">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Soft gray background */
            color: #343a40; /* Dark gray text color */
            overflow-x: hidden;
        }

        .cart-item {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .cart-item img {
            max-width: 100px;
            max-height: 100px;
            border-radius: 5px;
            margin-right: 20px;
        }

        .delete-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .subtotal-section, .total-section {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }

        .proceed-to-checkout-btn {
            margin-top: 20px;
        }
        #items{
            display: flex;
            justify-content: space-around;
            align-content: center;
            margin-right: -10px;
        }
        .box {
            padding: 10px 0px; /* Adjust padding to fit the content */
            border: 2px solid black;
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center content horizontally */
            margin: 20px auto;
            align-items: center;
            width: 33%;/* Center the box horizontally and provide some space */
        }
        .container{
            padding:20px;
        }
        #button {
            background-color: hsl(39, 96%,48%);
            border-radius: 20px;
        }
        #button:hover{
            color:hsl(39, 96%,48%);
            background-color: white;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <h1 class="text-center mb-4">Food Cart</h1>
        <c:if test="${not empty cartItems}">
            <c:forEach var="item" items="${cartItems}">
                <div class="cart-item row">
                    <div class="col-md-2">
                        <img src="${item.imageUrl}" alt="${item.name}">
                    </div>
                    <div class="col-md-6" id="items">
                        <h4>${item.name}</h4>
                        <p>Total: &#x20B9;${item.price}</p>
                    </div>
                    <div class="col-md-4 text-right">
                        <button class="delete-btn" onclick="removeFromCart('${item.name}')">Delete</button>
                    </div>
                </div>
            </c:forEach>
            <div class="box">
                <div class="subtotal-section">Subtotal: &#x20B9;${subtotal}</div>
                <div class="total-section">Delivery Fee: &#x20B9;50</div>
                <div class="total-section">Total: &#x20B9;${total}</div>
                <a id="button" href="checkout?total=${total}" class="btn btn-success proceed-to-checkout-btn mt-3">Proceed to Checkout</a>
            </div>
        </c:if>
        <c:if test="${empty cartItems}">
            <p>Your cart is empty.</p>
        </c:if>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <%@include file="footer.jsp" %>
</body>
</html>
