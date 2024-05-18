<head>
    <style>
        footer{
            overflow-x: hidden;
            font-family: roboto;
            font-size: 20px;
        }
        a{
            color: whitesmoke;
        }
        a:hover{
            color: hsl(39, 96%,hsl 48%);
        }
        .mysection{
            display: flex;
            justify-content: space-between;
            margin:10px;
            padding: 0px 20px;
        }
        .myfooter{
            padding: 0px;
            background-color: #363636;
            color: white;
        }
        .myfooter-brand{
            max-width: 33%;
        }
        .myfooter-list{
            max-width:33%;
            display:flex;
            flex-direction: column;
            justify-content: center;
            margin-top: 10%;
        }
        .mycontainer{
            display:flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding:0px;
        }
        .myfooter-list li {
            margin-bottom: 10px;
            list-style-type: none; 
        }
        .myfooter-list li:not(:first-child) {
            margin-top: 10px; 
            list-style-type: disc; /* Apply bullet styling */
        }
        .mylogo{
            width:200;
            height:200;
        }
        .myfooter-brand{
            padding-top: 0px;
            padding-bottom: 40px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .myfooter-brand img {
            width: 200px; 
            height: auto; 
        }
        .myfooter-list-2 {
            max-width: 33%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-top: 10%;
            padding-left: 5px;
        }
        .myfooter-list-2 li {
            margin-bottom: 10px;
            /* Remove list-style-type to remove bullet points */
            list-style-type: none;
        }
        .mysocial-list{
            display: flex;
            gap:10%;
            padding-left: 4px;
            margin-left: 0px;
        }

        .myfooter-list-2 .mysocial-link ion-icon {
            font-size: 25px;
            display: inline-block;
            border: 2px solid white; /* Define border properties */
            border-radius: 50%; /* Create a circle */
            padding: 8px;
        }
        .mysocial-list{
            margin-top: 10px;
        }
        .myaddress{
            white-space: nowrap;
        }
        myh2{
            white-space: nowrap;
        }
        .myfooter-top {
            border-bottom: 2px grey dashed;
        }
        .myfooter-bottom{
            margin-top: 8px;
        }
        .myfooter-list-2 .myfooter-link ion-icon {
    font-size: 15px;
    vertical-align: middle; /* Align icon vertically */
    margin-right: 5px; /* Add a small margin to separate icon from text */
}
    </style>
</head>
<footer class="myfooter">
    <div class="mycontainer">
        <div class="mysection myfooter-top mygrid-list">
            <div class="myfooter-brand">
                <a href="#" class="mylogo">
                    <img src="./assets/images/flogo.svg" width="148" height="38" alt="TreatMania home">
                </a>
                <h2 class="myh2 mysection-title" style= "padding-bottom: 10px; font-size: 30px; font-weight: bold; color: gray;">Where Taste Knows No Limits!</h2>
                <p class="mysection-text">
                    Vitae congue mauris rhoncus aenean. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere.
                    Tempus egestas sed sed risus pretium quam.
                </p>
            </div>
            <ul class="myfooter-list">
                <li>
                    <p id = "change" class="myfooter-list-title myh5" style="color: gray;">Menu</p>
                </li>
                <li>
                    <a href="#" class="myfooter-link">
                        <span class="myspan">Home</span>
                        <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                    </a>
                </li>
                <li>
                    <a href="#" class="myfooter-link">
                        <span class="myspan">About Us</span>
                        <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                    </a>
                </li>
                <li>
                    <a href="#" class="myfooter-link">
                        <span class="myspan">Restaurants</span>
                        <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                    </a>
                </li>
                <li>
                    <a href="#" class="myfooter-link">
                        <span class="myspan">Contact Us</span>
                        <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                    </a>
                </li>
            </ul>
            <ul class="myfooter-list-2">
                <li>
                    <p class="myfooter-list-title myh5" style="color: gray;">STAY IN TOUCH !</p>
                </li>
                <li>
                    <address class="myaddress">
                        <ion-icon name="location" aria-hidden="true"></ion-icon>
                        <span class="myspan">1717 Harrison St, Chennai, Tamil Nadu, India</span>
                    </address>
                </li>
                <li>
                    <a href="mailto:contacttm@mail.net" class="myfooter-link">
                        <ion-icon name="mail" aria-hidden="true"></ion-icon>
                        <span class="myspan">contacttm@mail.net</span>
                    </a>
                </li>
                <li>
                    <a href="tel:+12344567890" class="myfooter-link">
                        <ion-icon name="call" aria-hidden="true"></ion-icon>
                        <span class="myspan">+1 234 456 78 90</span>
                    </a>
                </li>
                <li>
                    <ul class="mysocial-list">
                        <li>
                            <a href="#" class="mysocial-link">
                                <ion-icon name="logo-facebook"></ion-icon>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="mysocial-link">
                                <ion-icon name="logo-instagram"></ion-icon>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="mysocial-link">
                                <ion-icon name="logo-twitter"></ion-icon>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="myfooter-bottom">
            <p class="mycopyright">
                Copyright &copy; <a href = main.jsp style="color:hsl(39, 96%, 48%);">TreatMania</a>. All rights reserved.
            </p>
        </div>
    </div>
</footer>
<script src="./assets/js/script.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
