<head>
    <style>
        header {
            overflow-x: hidden; 
            font-family: roboto;
            font-size: 18px;
            padding: 0px;
        }
        .custom-header{
            background-color: #363636;
        }
        .custom-container{
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
        .custom-navbar-list{
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 7%;
            padding-left: 0%;
        }
        .custom-navbar-item{
            list-style-type: none;
            margin-right: 20px;
        }
        .custom-navbar-link{
            font-weight: bold;
            color:white;
        }
        .custom-navbar-link:hover{
            color: hsl(39, 96%, 48%);
        }
        .custom-settings-menu {
            position: fixed;
            top: 120px; /* Adjust as needed */
            right: 20px; /* Adjust as needed */
            background-color: #363636;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 10px;
            z-index: 1000; /* Ensure it's above other content */
            display: none;
        }

        .custom-settings-menu.active {
          display: block; /* Show the menu when active */
        }

        .custom-settings-menu ul {
          list-style: none;
          padding: 0;
          margin: 0;
        }

        .custom-settings-menu ul li {
          margin-bottom: 10px;
        }

        .custom-settings-menu ul li a {
          color: white;
          text-decoration: none;
          display: block;
          padding: 5px 10px;
        }

        .custom-settings-menu ul li a:hover {
          background-color: #f5f5f5;
        }
        .custom-header-action {
            display: flex; /* Change display property to flex */
            align-items: center; /* Align items vertically centered */
        }

        .custom-cart-btn {
            height: 40px; /* Adjust the height as needed */
            width: 40px; /* Adjust the width as needed */
            background-color: hsl(39, 96%, 48%); /* Change the background color */
            border: none; /* Remove default border */
            border-radius: 50%; /* Make it round */
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            margin-right: 15px; /* Add margin to separate buttons */
        }

        .custom-cart-btn ion-icon,
        .custom-settings-btn ion-icon {
            font-size: 20px; /* Adjust the icon size as needed */
            color: white; /* Set icon color */
        }
        .custom-cart-btn:hover ion-icon{
            color: hsl(39, 96%, 48%);
        }
        .custom-cart-btn:hover{
            color: hsl(39, 96%, 48%);
            background-color: white;
        }
    </style>
</head>
<header class="custom-header" data-header>
    <div class="custom-container">
        <a href="#" class="custom-logo">
          <img src="./assets/images/flogo.svg" width="150" height="150" alt="TreatMania home">
        </a>
        <nav class="custom-navbar" data-navbar>
            <ul class="custom-navbar-list">
                <li class="custom-navbar-item">
                  <a href="main.jsp" class="custom-navbar-link" data-nav-link>Home</a>
                </li>
                <li class="custom-navbar-item">
                  <a href="#" class="custom-navbar-link" data-nav-link>About Us</a>
                </li>
                <li class="custom-navbar-item">
                  <a href="#" class="custom-navbar-link" data-nav-link>Restaurants</a>
                </li>
                <li class="custom-navbar-item">
                  <a href="#" class="custom-navbar-link" data-nav-link>Contact Us</a>
                </li>
            </ul>
        </nav>
        <div class="custom-header-action">
            <button class="custom-cart-btn" aria-label="cart">
              <ion-icon name="bag" aria-hidden="true"></ion-icon>
            </button>
            <button class="custom-cart-btn" aria-label="settings">
              <ion-icon name="settings" aria-hidden="true"></ion-icon>
            </button>
            <div class="custom-settings-menu" id="customSettingsMenu">
                <ul>
                  <li><a href="#">Profile</a></li>
                  <li><a href="#">Settings</a></li>
                  <li><a href="#logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const settingsButton = document.querySelector('.custom-header-action .custom-cart-btn:last-of-type');
            const settingsMenu = document.getElementById('customSettingsMenu');

            if (settingsButton && settingsMenu) {
              settingsButton.addEventListener('click', function (event) {
                event.stopPropagation(); // Prevents the click event from bubbling up and triggering the body click event
                settingsMenu.classList.toggle('active');
              });

              document.body.addEventListener('click', function (event) {
                if (!settingsMenu.contains(event.target) && !settingsButton.contains(event.target)) {
                  // Close the menu if the click target is outside of both the menu and the settings button
                  settingsMenu.classList.remove('active');
                }
              });
            }
        });
        function preventPageCaching() {
            // Add an event listener for page navigation
            window.addEventListener('pageshow', function(event) {
              // Check if the session storage indicates the user is not logged in
              if (!sessionStorage.getItem('loggedIn') && window.location.pathname !== 'index.jsp') {
                // Redirect the user to the login page
                window.location.href = 'index.jsp';
              }
            });
          }

          // Function to handle logout
          function logout() {
            // Show a confirmation dialog
            var confirmation = confirm("Are you sure you want to logout?");

            // If the user confirms, proceed with logout
            if (confirmation) {
              // Clear session storage
              sessionStorage.clear();

              // Set the logged-in flag to false
              sessionStorage.setItem('loggedIn', false);

              // Redirect the user to the login page
              window.location.href = 'index.jsp';
            }
          }

          // Attach click event listener to the logout button
          document.querySelector('#customSettingsMenu a[href="#logout"]').addEventListener('click', function(event) {
            event.preventDefault(); // Prevent the default link behavior
            logout(); // Call the logout function
          });

          // Disable browser back button after logout and prevent page caching
          window.onload = function() {
            preventPageCaching();
          };

    </script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
