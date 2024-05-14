<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="shortcut icon"  href="./assets/images/logo.svg" type="image/svg+xml">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Restaurant List</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
        overflow-x: hidden;
        font-family: roboto;
        font-size:18px;
    }
    /* Custom CSS for styling */
    .btn {
      padding: 13px 25px;
      display: flex;
      align-items: center;
      gap: 5px;
      max-width: 230px;
      max-height: 80px;
      background-color: hsl(39, 96%, 48%);
      color: hsl(0, 0%, 100%);
      text-transform: uppercase;
      border-radius: 10px;
      border: 2px solid hsl(39, 96%, 48%);
      transition: 0.25s ease;
      overflow: hidden;
    }
    .btn::after {
      inset: -35px -20px;
      transform: skewY(25deg) translateY(-130px);
      transition: 0.25s ease;
      z-index: -1;
    }
    .btn:is(:hover, :focus-visible)::after {
      transform: skewY(25deg) translateY(0);
    }
    .btn-primary::after {
      background-color: hsl(0, 0%, 100%);
    }
    .btn-primary:is(:hover, :focus-visible) {
      color: hsl(39, 96%, 48%);
      border-color:hsl(39, 96%, 48%);
    }
    .has-after {
      position: relative;
      z-index: 1;
    }
    .has-after::after {
      position: absolute;
      content: "";
    }
    .restaurant {
      margin-bottom: 30px;
      opacity: 0; /* Initially hide the restaurants */
      transform: translateY(50px); /* Initially move the restaurants down */
      transition: opacity 0.5s, transform 0.5s; /* Smooth transition for opacity and transform */
    }
    .restaurant.loaded {
      opacity: 1; /* Show the restaurants */
      transform: translateY(0); /* Move the restaurants back to their original position */
    }
    .restaurant img {
      max-width: 100%;
      height: auto;
      /* Set fixed dimensions for consistent size */
      width: 300px; /* Adjust this value as needed */
      height: 200px; /* Adjust this value as needed */
      object-fit: cover; /* Ensures aspect ratio is maintained */
    }
    .restaurant h2 {
      font-size: 24px;
      margin-top: 10px;
    }
    .restaurant p {
      font-size: 16px;
    }
    
  </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container mt-5">
  <h1 class="text-center mb-4">Choose from Our Top Restaurants !</h1>

  <div class="row">
    <!-- Loop through each restaurant and display -->
    <% for (servlets.Restaurant restaurant : (java.util.List<servlets.Restaurant>)request.getAttribute("restaurantList")) { %>
    <div class="col-md-4">
      <div class="restaurant text-center">
        <img src="<%= restaurant.getImageUrl() %>" alt="<%= restaurant.getName() %>">
        <h2><%= restaurant.getName() %></h2>
        <p><%= restaurant.getCuisineType() %></p>
        <!-- Add more details or functionality as needed -->
        <div class="d-flex justify-content-center">
            <a href="menu?restaurantId=<%= restaurant.getId() %>" class="btn btn-primary has-after">Order Now</a>
        </div>
      </div>
    </div>
    <% } %>
  </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
  // Add loaded class to each restaurant after a slight delay to trigger the animation
  document.addEventListener('DOMContentLoaded', function() {
    var restaurants = document.querySelectorAll('.restaurant');
    restaurants.forEach(function(restaurant, index) {
      setTimeout(function() {
        restaurant.classList.add('loaded');
      }, index * 200); // Adjust delay as needed
    });
  });
</script>
<%@ include file="footer.jsp" %>
</body>
</html>
