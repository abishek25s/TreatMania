<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TreatMania - Home</title>
  <meta name="title" content="TreatMania - Where Taste Knows No Limits">
  <link rel="shortcut icon"  href="./assets/images/logo.svg" type="image/svg+xml">
  <link rel="stylesheet" href="./assets/css/style.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
  <div class="loading-container" data-loading-container>
    <div class="loading-circle"></div>
  </div>
  <header class="header" data-header>
    <div class="container">
      <a href="main.jsp" class="logo">
        <img src="./assets/images/logo.svg" width="190" height="88" alt="TreatMania home" style = "margin-left:25px;">
      </a>
      <nav class="navbar" data-navbar>
        <button class="nav-close-btn" aria-label="close menu" data-nav-toggler>
          <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
        </button>
        <a href="main.jsp" class="logo">
          <img src="./assets/images/logo.svg" width="148" height="38" alt="TreatMania home">
        </a>
        <ul class="navbar-list">
          <li class="navbar-item">
            <a href="main.jsp" class="navbar-link" data-nav-link>Home</a>
          </li>
          <li class="navbar-item">
            <a href="#about" class="navbar-link" data-nav-link>About Us</a>
          </li>
          <li class="navbar-item">
            <a href="#rest" class="navbar-link" data-nav-link>Restaurants</a>
          </li>
          <li class="navbar-item">
            <a href="#foot" class="navbar-link" data-nav-link>Contact Us</a>
          </li>
        </ul>
      </nav>
      <div class="header-action" style="margin-top: -30px;">
        <a href="restaurantList" class="btn btn-primary has-after" >Order Now</a>
        <button class="cart-btn" aria-label="cart">
          <ion-icon name="bag" aria-hidden="true"></ion-icon>
        </button>
        <button class="cart-btn" aria-label="settings">
          <ion-icon name="settings" aria-hidden="true"></ion-icon>
        </button>
        <div class="settings-menu" id="settingsMenu">
            <ul>
              <li><a href="#">Profile</a></li>
              <li><a href="#">Settings</a></li>
              <li><a href="#logout">Logout</a></li>
            </ul>
        </div>
      </div>
      <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
        <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
      </button>
      <div class="overlay" data-overlay data-nav-toggler></div>
    </div>
  </header>
  <main>
    <article>
      <section class="section hero has-bg-image" aria-label="home"
        style="background-image: url('./assets/images/hero-bg.png')">
        <div class="container">
          <div class="hero-content" data-reveal="left">
            <h1 class="h1 hero-title">Where Taste Knows No Limits!</h1>
            <p class="hero-text">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.
            </p>
            <a href="restaurantList" class="btn btn-secondary has-after">Order Now</a>
          </div>
          <figure class="hero-banner" data-reveal>
            <img src="./assets/images/hero-banner.png" width="680" height="720" alt="hero banner" class="w-100">
<!--            <img src="./assets/images/hero-shape-1.svg" width="338" height="138" alt="shape" class="shape shape-1">
            <img src="./assets/images/hero-shape-2.svg" width="237" height="80" alt="shape" class="shape shape-2"> -->
          </figure>
        </div>
      </section>
      <section class="section instruction" aria-labelledby="">
        <div class="container">
          <h2 class="h2 section-title" id="instruction-label" data-reveal>How It Works</h2>
          <p class="section-text" data-reveal>
            Magna sit amet purus gravida quis blandit turpis cursus. Venenatis tellus in
            metus vulputate eu scelerisque felis.
          </p>
          <ul class="grid-list">
            <li data-reveal="left">
              <div class="instruction-card">
                <figure class="card-banner">
                  <img src="./assets/images/instructuion-1.png" width="300" height="154" loading="lazy"
                    alt="Select Restaurant" class="w-100">
                </figure>
                <div class="card-content">
                  <h3 class="h5 card-title">
                    <span class="span">01</span>
                    Select Restaurant
                  </h3>
                  <p class="card-text">
                    Non enim praesent elementum facilisis leo vel fringilla. Lectus proin nibh nisl condimentum id. Quis
                    varius quam quisque id diam vel.
                  </p>
                </div>
              </div>
            </li>
            <li data-reveal>
              <div class="instruction-card">
                <figure class="card-banner">
                  <img src="./assets/images/instructuion-2.png" width="300" height="154" loading="lazy"
                    alt="Select menu" class="w-100">
                </figure>
                <div class="card-content">
                  <h3 class="h5 card-title">
                    <span class="span">02</span>
                    Select Items and CheckOut
                  </h3>
                  <p class="card-text">
                    Eu mi bibendum neque egestas congue quisque. Nulla facilisi morbi tempus iaculis urna id volutpat
                    lacus. Odio ut sem nulla pharetra diam sit amet.
                  </p>
                </div>
              </div>
            </li>
            <li data-reveal="right">
              <div class="instruction-card">
                <figure class="card-banner">
                  <img src="./assets/images/instructuion-3.png" width="300" height="154" loading="lazy"
                    alt="Wait for delivery" class="w-100">
                </figure>
                <div class="card-content">
                  <h3 class="h5 card-title">
                    <span class="span">03</span>
                    Wait for delivery
                  </h3>
                  <p class="card-text" id="rest">
                    Nunc lobortis mattis aliquam faucibus. Nibh ipsum consequat nisl vel pretium lectus quam id leo. A
                    scelerisque purus semper eget. Tincidunt arcu non.
                  </p>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </section>
      <section class="section top-restaurant" aria-labelledby="top-restaurent-label">
        <div class="container">
          <ul class="grid-list">
            <li data-reveal="left">
              <h2 class="h2 section-title" id="top-restaurent-label">
                The Best Restaurants in Your City
              </h2>
              <p class="section-text">
                Magna sit amet purus gravida quis blandit turpis cursus. Venenatis tellus in metus vulputate.
              </p>
            </li>
            <li data-reveal="right">
              <div class="restaurant-card">
                <div class="card-icon">
                  <img src="./assets/images/chineselogo.jpg" width="100" height="100" loading="lazy"
                    alt="Golden Chops" class="w-100">
                </div>
                <h3 class="h5 card-title">Golden Chops</h3>
                <div class="rating-wrapper">
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star-outline" aria-hidden="true"></ion-icon>
                </div>
                <div class="card-meta-wrapper">
                  <a href="#" class="card-meta">Chinese</a>
                  <a href="#" class="card-meta">Continental</a>
                </div>
                <p class="card-text">
                  Non enim praesent elementum facilisis leo vel fringilla. Lectus proin nibh nisl condimentum id. Quis
                  varius quam quisque id diam vel.
                </p>
              </div>
            </li>
            <li data-reveal="left">
              <div class="restaurant-card">
                <div class="card-icon">
                  <img src="./assets/images/biryanilogo.jpg" width="100" height="100" loading="lazy" alt="Royal Biryani"
                    class="w-100">
                </div>
                <h3 class="h5 card-title">Royal Biryani</h3>
                <div class="rating-wrapper">
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star-outline" aria-hidden="true"></ion-icon>
                </div>
                <div class="card-meta-wrapper">
                  <a href="#" class="card-meta">Indian</a>
                  <a href="#" class="card-meta">Biryani</a>
                </div>
                <p class="card-text">
                  Vulputate enim nulla aliquet porttitor lacus luctus. Suscipit adipiscing bibendum est ultricies
                  integer. Sed adipiscing diam donec adipiscing tristique.
                </p>
              </div>
            </li>
            <li data-reveal="right">
              <div class="restaurant-card">
                <div class="card-icon">
                  <img src="./assets/images/pattylogo.jpg" width="100" height="100" loading="lazy" alt="Patty Hub"
                    class="w-100">
                </div>
                <h3 class="h5 card-title">Patty Hub</h3>
                <div class="rating-wrapper">
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star-outline" aria-hidden="true"></ion-icon>
                </div>
                <div class="card-meta-wrapper">
                  <a href="#" class="card-meta">American</a>
                  <a href="#" class="card-meta">Fast Food</a>
                </div>
                <p class="card-text">
                  Tortor at risus viverra adipiscing at in tellus. Cras semper auctor neque vitae tempus. Dui accumsan
                  sit amet nulla facilisi. Sed adipiscing diam donec adipiscing tristique.
                </p>
              </div>
            </li>
          </ul>
          <a href="restaurantList" class="btn btn-secondary has-after">
            <span class="span">See All</span>
            <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
          </a>
        </div>
      </section>
      <section class="section cta has-bg-image" aria-labelledby="cta-label"
        style="background-image: url('./assets/images/hero-bg.png')">
        <div class="container">
          <figure class="cta-banner" data-reveal="left">
            <img src="./assets/images/cta-banner.png" width="680" height="704" loading="lazy" alt="cta banner"
              class="w-100">
          </figure>
          <div class="cta-content" data-reveal="right">
            <h2 class="h3 section-title" id="cta-label">
              From Screen to Plate, Enjoy your Delicious Fate!
            </h2>
            <p class="section-text">
              Pretium lectus quam id leo in vitae turpis massa sed. Lorem donec massa sapien faucibus et molestie. Vitae
              elementum curabitur vitae nunc.
            </p>
            <a id = "about" href="restaurantList" class="btn btn-primary has-after">Order Now</a>
          </div>
        </div>
      </section>
      <section class="stats" aria-label="statistics" data-reveal>
        <div class="container">
          <ul class="grid-list">
            <li>
                <h2 class="h3 section-title">Delights Delivered <br>Directly !!</h2>
            </li>
            <li class="stats-item">
              <span class="span">976</span>
              <p class="stats-text">
                Satisfied <br>
                Customer
              </p>
            </li>
            <li class="stats-item">
              <span class="span">12</span>
              <p class="stats-text">
                Best <br>
                Restaurants
              </p>
            </li>
            <li class="stats-item">
              <span class="span">1K+</span>
              <p class="stats-text">
                Food <br>
                Delivered
              </p>
            </li>
          </ul>
        </div>
      </section>
      <section class="section testi" aria-labelledby="testi-label">
        <div class="container">
          <div class="testi-content" data-reveal="left">
            <h2 class="h2 section-title" id="testi-label">What customers say about us</h2>
            <blockquote class="testi-text">
              "Dapibus ultrices in iaculis nunc sed augue lacus viverra vitae. Mauris a diam maecenas sed enim. Egestas
              diam in arcu cursus euismod quis. Quam quisque id diam vel".
            </blockquote>
            <div class="wrapper">
              <img src="./assets/images/testi-avatar.jpg" width="70" height="70" loading="lazy" alt="Thomas Adamson"
                class="author-img">
              <div>
                <p class="author-title">Thomas Adamson</p>
                <div class="rating-wrapper">
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                  <ion-icon name="star" aria-hidden="true"></ion-icon>
                </div>
              </div>
            </div>
          </div>
          <figure class="testi-banner" data-reveal="right">
            <img src="./assets/images/testimonial-banner.png" width="680" height="588" alt="testimonial banner"
              class="w-100">
          </figure>
        </div>
      </section>
      <section class="section partnership" aria-label="partnership">
        <div class="container">
          <h2 class="h2 section-title" data-reveal>Partner with us !</h2>
          <ul class="grid-list">
            <li data-reveal="left">
              <div class="partnership-card">
                <figure class="card-banner img-holder" style="--width: 640; --height: 402;">
                  <img src="./assets/images/partner-1.jpg" width="640" height="402" loading="lazy" alt="Become a Delivery Partner"
                    class="img-cover">
                </figure>
                <div class="card-content">
                  <h3 class="h5 card-title">Become a Delivery Partner</h3>
                  <a href="#" class="btn btn-primary has-after">
                    <span class="span">Learn More</span>
                    <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                  </a>
                </div>
              </div>
            </li>
            <li data-reveal="right">
              <div class="partnership-card">
                <figure class="card-banner img-holder" style="--width: 640; --height: 402;">
                  <img src="./assets/images/partner-2.jpg" width="640" height="402" loading="lazy" alt="Merchant Collaboration"
                    class="img-cover">
                </figure>
                <div class="card-content">
                  <h3 class="h5 card-title">Merchant Collaboration</h3>
                  <a href="#" class="btn btn-primary has-after">
                    <span class="span">Learn More</span>
                    <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                  </a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </section>
      <section class="section newsletter" aria-label="newsletter">
        <div class="container">
          <figure class="newsletter-banner" data-reveal="left">
            <img src="./assets/images/newsletter-banenr.png" width="680" height="405" loading="lazy" alt="Illustration"
              class="w-100">
          </figure>
          <div class="newsletter-content" data-reveal="right">
            <h2 class="h4 section-title" style = "font-size: 40px;">
              Subscribe for tasty updates, offers, and more!
            </h2>
            <div class="input-wrapper">
              <input type="email" name="email_address" placeholder="Enter email address" required class="input-field">
              <button type="submit" class="btn btn-primary has-after">
                <ion-icon name="notifications-outline" aria-hidden="true"></ion-icon>
                <span class="span">Subscribe</span>
              </button>
            </div>
          </div>
        </div>
      </section>
    </article>
  </main>
  <footer class="footer" id = "foot">
    <div class="container">
      <div class="section footer-top grid-list">
        <div class="footer-brand">
          <a href="#" class="logo">
            <img src="./assets/images/flogo.svg" width="148" height="38" alt="TreatMania home">
          </a>
          <h2 class="h2 section-title" style="margin-top: 0px">Where Taste Knows No Limits!</h2>
          <p class="section-text">
            Vitae congue mauris rhoncus aenean. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere.
            Tempus egestas sed sed risus pretium quam.
          </p>
        </div>
        <ul class="footer-list">
          <li>
            <p class="footer-list-title h5">Menu</p>
          </li>
          <li>
            <a href="#" class="footer-link">
              <span class="span">Home</span>
              <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
            </a>
          </li>
          <li>
            <a href="#" class="footer-link">
              <span class="span">About Us</span>
              <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
            </a>
          </li>
          <li>
            <a href="#" class="footer-link">
              <span class="span">Restaurants</span>
              <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
            </a>
          </li>
          <li>
            <a href="#" class="footer-link">
              <span class="span">Contact Us</span>
              <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
            </a>
          </li>
        </ul>
        <ul class="footer-list">
          <li>
            <p class="footer-list-title h5">Contact Us</p>
          </li>
          <li>
            <address class="address">
              <ion-icon name="location" aria-hidden="true"></ion-icon>
              <span class="span">1717 Harrison St, Chennai, Tamil Nadu, India</span>
            </address>
          </li>
          <li>
            <a href="mailto:contacttm@mail.net" class="footer-link">
              <ion-icon name="mail" aria-hidden="true"></ion-icon>
              <span class="span">contacttm@mail.net</span>
            </a>
          </li>
          <li>
            <a href="tel:+12344567890" class="footer-link">
              <ion-icon name="call" aria-hidden="true"></ion-icon>
              <span class="span">+1 234 456 78 90</span>
            </a>
          </li>
          <li>
            <ul class="social-list">
              <li>
                <a href="#" class="social-link">
                  <ion-icon name="logo-facebook"></ion-icon>
                </a>
              </li>
              <li>
                <a href="#" class="social-link">
                  <ion-icon name="logo-instagram"></ion-icon>
                </a>
              </li>
              <li>
                <a href="#" class="social-link">
                  <ion-icon name="logo-twitter"></ion-icon>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="footer-bottom">
        <p class="copyright">
            Copyright &copy; TreatMania. All rights reserved.
        </p>
      </div>
    </div>
  </footer>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var loggedInUser = '<%= request.getSession().getAttribute("loggedInUser") %>';
            if (loggedInUser) {
                sessionStorage.setItem('loggedIn', 'true');
                sessionStorage.setItem('loggedInUser', loggedInUser);
            } else {
                sessionStorage.setItem('loggedIn', 'false');
            }
        });
    </script>
  <script src="./assets/js/script.js"></script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>