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
            background-color: #f8f9fa; 
            color: #343a40; 
            overflow-x: hidden;
        }

        .menu-item {
            margin-bottom: 50px; 
            border-radius: 10px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
            overflow: hidden; 
            height: 500px; 
        }

        .menu-item .image-container {
            position: relative; 
            height: 60%;
        }

        .menu-item .image-container img {
            width: 100%; 
            height: 100%; 
            object-fit: cover; 
        }

        .menu-item .image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4); 
            opacity: 0; 
            transition: opacity 0.3s ease; 
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .menu-item:hover .image-overlay {
            opacity: 1; 
        }

        .menu-item .image-overlay span {
            background-color: #007bff; 
            border: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease; 
        }

        .menu-item .image-overlay span:hover {
            background-color: #0056b3; 
        }

        .menu-content {
            height: 40%; 
            padding: 20px; 
            overflow: hidden;
        }

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
                            <p>&#x20B9;${menuItem.price}</p> 
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

        function addToCart(itemId, itemName, itemImageUrl, itemPrice) {
            fetch('addToCart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    itemId: itemId,
                    itemName: itemName,
                    itemImageUrl: itemImageUrl,
                    itemPrice: itemPrice,
                    quantity: 1,
                }),
            })
            .then(response => response.text())
            .then(data => {
                showToast(data); 
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }

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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
