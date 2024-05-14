<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon"  href="./assets/images/logo.svg" type="image/svg+xml">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Items</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Soft gray background */
            color: #343a40; /* Dark gray text color */
            overflow-x: hidden;
        }

        .menu-item {
            margin-bottom: 50px; /* Increased spacing between menu items */
            border-radius: 10px; /* Rounded corners for each menu item */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow effect */
            overflow: hidden; /* Ensure overflow is hidden for rounded corners */
            height: 500px; /* Fixed height for menu item container */
        }

        .menu-item .image-container {
            position: relative; /* Positioning context for overlay */
            height: 60%; /* 60% of menu item height for image */
        }

        .menu-item .image-container img {
            width: 100%; /* Ensure image fills container */
            height: 100%; /* Fill the container height */
            object-fit: cover; /* Cover to fit container */
        }

        .menu-item .image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent black overlay */
            opacity: 0; /* Initially transparent */
            transition: opacity 0.3s ease; /* Smooth transition */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .menu-item:hover .image-overlay {
            opacity: 1; /* Show overlay on hover */
        }

        .menu-item .image-overlay span {
            background-color: #007bff; /* Blue button background */
            border: none;
            color: #fff; /* White button text */
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Smooth transition */
        }

        .menu-item .image-overlay span:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .menu-content {
            height: 40%; /* 40% of menu item height for content */
            padding: 20px; /* Add padding to the content */
            overflow: hidden; /* Hide overflow for content */
        }

        /* Styling for toast notification */
        #toast-notification {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 10000;
        }
        .toast{
            background-color: hsl(39, 96%,48%) !important;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Menu Items</h1>

        <div class="row">
            <!-- Loop through menu items and display -->
            <c:forEach var="menuItem" items="${menuItems}">
                <div class="col-md-4">
                    <div class="menu-item">
                        <div class="image-container">
                            <img src="${menuItem.imageUrl}" alt="${menuItem.name}">
                            <div class="image-overlay">
                                <span class="btn-add-to-cart" data-item-id="${menuItem.id}" data-item-name="${menuItem.name}" data-item-image="${menuItem.imageUrl}" data-item-price="${menuItem.price}">Add to Cart</span>
                            </div>
                        </div>
                        <div class="menu-content">
                            <h2>${menuItem.name}</h2>
                            <p>&#x20B9;${menuItem.price}</p> <!-- Rupees symbol added here -->
                            <p>${menuItem.description}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <a href="cart" class="btn btn-success mt-3">Go to Cart</a>
        </div>
    </div>

    <!-- Toast notification container -->
    <div id="toast-notification" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true">
        <div class="toast-body">
            Item added to cart successfully!
        </div>
    </div>

    <%@include file="footer.jsp" %>
    <script>
        // Function to show toast notification
        function showToast(message) {
            var toastElement = document.getElementById('toast-notification');
            var toast = new bootstrap.Toast(toastElement);
            toastElement.querySelector('.toast-body').innerText = message;
            toast.show();
        }

        // Function to handle adding item to cart
        function addToCart(itemId, itemName, itemImageUrl, itemPrice) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "addToCart", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    showToast(xhr.responseText); // Show toast notification
                }
            };
            // Always set quantity to 1
            xhr.send("itemId=" + itemId + "&itemName=" + itemName + "&itemImageUrl=" + itemImageUrl + "&itemPrice=" + itemPrice + "&quantity=1");
        }

        // Add event listeners to "Add to Cart" buttons
        var addToCartButtons = document.querySelectorAll('.btn-add-to-cart');
        addToCartButtons.forEach(function(button) {
            button.addEventListener('click', function(event) {
                var itemId = event.target.dataset.itemId;
                var itemName = event.target.dataset.itemName;
                var itemImageUrl = event.target.dataset.itemImage;
                var itemPrice = event.target.dataset.itemPrice;
                addToCart(itemId, itemName, itemImageUrl, itemPrice);
            });
        });
    </script>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
