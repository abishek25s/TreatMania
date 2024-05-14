'use strict';

document.addEventListener('DOMContentLoaded', function () {
  const addEventOnElements = function (elem, type, callback) {
    for (let i = 0, len = elem.length; i < len; i++) {
      elem[i].addEventListener(type, callback);
    }
  };

  const loadingElement = document.querySelector("[data-loading-container]");
  if (loadingElement) {
    window.addEventListener("load", function () {
      loadingElement.classList.add("loaded");
      document.body.classList.add("loaded");
    });
  }

  const navbar = document.querySelector("[data-navbar]");
  const navTogglers = document.querySelectorAll("[data-nav-toggler]");
  const navbarLinks = document.querySelectorAll("[data-nav-link]");
  const overlay = document.querySelector("[data-overlay]");

  const toggleNavbar = function () {
    navbar.classList.toggle("active");
    overlay.classList.toggle("active");
    document.body.classList.toggle("active");
  };
  addEventOnElements(navTogglers, "click", toggleNavbar);

  const closeNavbar = function () {
    navbar.classList.remove("active");
    overlay.classList.remove("active");
    document.body.classList.remove("active");
  };
  addEventOnElements(navbarLinks, "click", closeNavbar);

  const header = document.querySelector("[data-header]");
  const headerActive = function () {
    window.scrollY > 200 ? header.classList.add("active")
      : header.classList.remove("active");
  };
  window.addEventListener("scroll", headerActive);

  const revealElements = document.querySelectorAll("[data-reveal]");
  const scrollReveal = function () {
    for (let i = 0, len = revealElements.length; i < len; i++) {
      if (revealElements[i].getBoundingClientRect().top < window.innerHeight / 1.2) {
        revealElements[i].classList.add("revealed");
      }
    }
  };
  window.addEventListener("scroll", scrollReveal);
  window.addEventListener("load", scrollReveal);

  const settingsButton = document.querySelector('.header-action .cart-btn:last-of-type');
  const settingsMenu = document.getElementById('settingsMenu');

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
  // Function to prevent caching of specific pages in browser history
    function preventPageCaching() {
      // Add an event listener for page navigation
      window.addEventListener('pageshow', function(event) {
        // Check if the page is the main.html page and if the session storage is cleared (indicating logout)
        if (event.persisted && window.location.pathname.includes('main.jsp') && !sessionStorage.getItem('loggedIn')) {
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

        // Redirect the user to the login page
        window.location.href = 'index.jsp';
      }
    }

    // Function to disable browser back button
    function disableBackButton() {
      window.history.pushState(null, '', window.location.href);
      window.onpopstate = function () {
        window.history.pushState(null, '', window.location.href);
      };
    }

    // Attach click event listener to the logout button
    document.querySelector('#settingsMenu a[href="#logout"]').addEventListener('click', function(event) {
      event.preventDefault(); // Prevent the default link behavior
      logout(); // Call the logout function
    });

    // Disable browser back button after logout
    window.onload = function() {
      disableBackButton();
      preventPageCaching();
    };

});
