
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<link rel="stylesheet" href="Home.css">
<link rel="stylesheet" href="Home/Home.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<meta name="viewport" content="width=device-width,initial-scale=1.0">


<header>
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="../header/header.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/codefe_login/image/codegelogo.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CodeFe SHOP</title>
    <input id="cart" hidden type="checkbox" <c:if test = "${check_cart=='checked'}"> checked </c:if>>
    <div class="nav-bar">
        <input id="check" hidden type="checkbox" value ="checked">

        <div class="branding">
            <h1><a href="/Home/Home.html">CODEFE COFFEE</a></h1>
        </div>
        <label for="cart" class="cart-img"> </label>
        <label for="check" class="menu-icon">
        </label>
        <div class="menu">
           <ul>
                <li><a href="${pageContext.request.contextPath}/Home/Home.jsp">HOME</a></li>
                <li><a href="${pageContext.request.contextPath}/Story/ourstory.jsp">STORY</a></li>
                <li><a href="${pageContext.request.contextPath}/HomeController">MENU</a></li>
                <li><a href="${pageContext.request.contextPath}/New/News.jsp">NEWS</a></li>
                <li><a href="${pageContext.request.contextPath}/Contact/Contact.jsp">CONTACT</a></li>
                <li><a href="${pageContext.request.contextPath}/Login/codefelogin.jsp">LOGIN</a></li>
            </ul>
        </div>

    </div>
    

    <div class="your-cart">          
        <ul>   
            
            <c:forEach var="item" items="${cart.items}">
                <div class="item">  
                <img class="item-img" src="${pageContext.request.contextPath}/Product_img/${item.product.id}.png">
                <div class="item-info">
                    <div class="item-name"><c:out value='${item.product.name}'/></div>
                    <div class="item-price">${item.product.price} vnd</div>
                </div>
                Amount:
                <form id ="updateform_${item.product.id}" action="${pageContext.request.contextPath}/CartController" method="post">
                 <input type="hidden" name="viewid" value="Home/Home.jsp">
                 <input type="hidden" name="productId" value="${item.product.id}">
                 <input class="amount" type="number" name="quantity" min="0" value = "<c:out value='${item.quantity}'/>" onchange ="update_quality(${item.product.id},this.value)"  >  
                </form>
                <script>
               		function update_quality(id,quatity){
            	   //window.open("${pageContext.request.contextPath}/CartController?productId="+id+"&quantity="+quatity+"&check_cart=" +document.getElementById("check").value,"_self");
            	   var form = document.getElementById("updateform_"+id);
            	   form.submit();
               }
            	</script>
                 </div>            
            </c:forEach>
             

          
            <div class = "Total">Total: ${total} vnd</div>
            <a href="checkout.jsp">
                <button>Check out</button>
            </a>

        </ul>
    </div>

</header>

<body>
    <div class="showcase">
        <div class="slider">
            <div class="slides">
                <input type="radio" name="radio-btn" id="radio1">
                <input type="radio" name="radio-btn" id="radio2">
                <input type="radio" name="radio-btn" id="radio3">
                <input type="radio" name="radio-btn" id="radio4">
                <div class="slide first">
                    <img src="${pageContext.request.contextPath}/Hinh_anh/Home/1.png" alt="">
                </div>
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/Hinh_anh/Home/2.png" alt="">
                </div>
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/Hinh_anh/Home/3.png" alt="">
                </div>
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/Hinh_anh/Home/4.png" alt="">
                </div>
                <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                    <div class="auto-btn3"></div>
                    <div class="auto-btn4"></div>
                </div>
                <div class="navigation-manual">
                    <label for="radio1" class="manual-btn"></label>
                    <label for="radio2" class="manual-btn"></label>
                    <label for="radio3" class="manual-btn"></label>
                    <label for="radio4" class="manual-btn"></label>
                </div>
            </div>
        </div>
        <script src="../javascrip/javascrip.js">
        </script>
    </div>
    <div class="container">
        <div class="info-1">
            <div class="info-1-img">
                <img src="${pageContext.request.contextPath}/Hinh_anh/Home/test.jpg">

            </div>
            <div class="info-1-content">
                <div class="info-header-1">
                    OUR TEA <br>
                    OUR LIFE
                    <h2>CODEFE</h2>
                </div>
                <div class="info-content-1">
                    Codefe make your life better, enhance your coding ability, make your project become more and more
                    visible.
                </div>
            </div>
        </div>

        <div class="info-2">
            <div class="info-2-img">
                <img src="${pageContext.request.contextPath}/Hinh_anh/Home/pic2.jpg">
            </div>
            <div class=info-2-content>
                <div class="info-header-2">
                    OUR TEA<br>
                    OUR COFFEE
                    <h2>INTRODUCTION</h2>
                </div>
                <div class="info-content-2">
                    Coffee from over the world for Vietnamese coder. We are all made from Vietnam agriculture, with all
                    the
                    soul of a Vietnamese people.
                    So, the mission are in our shoulders - Codefe bring an enhancement for coding, make a good mixture
                    from
                    agriculture with the modern
                    life at making programs.
                    <br>
                    <br>
                    We are happy to introduce you to our shop. With all things such as photo angles, inspirational
                    corners,
                    memories corners, we confidently
                    say that we can recreate the atmosphere as you wish and bring up good ideas for the coding sections.
                    <br>
                    <br>
                    Especially, along with the image we bring, the quality of our drinks and foods would also be
                    ensured. All
                    familiar types coffee or Vietnamese
                    traditional breakfast are ready to be served. Making good things with Codefe helps it even better.
                </div>
            </div>
        </div>

        <div class="info-3">
            <div class="info-3-img">
                <div class = "block">
                </div>
            </div>
            <div class="info-3-content">
                <div class="info-header-3">
                    DECORATING SECRETS
                    <h2>OUR LIFE <br>
                        OUR STYLE
                    </h2>
                </div>
                <div class="info-content-3">
                    This cafe design idea is for everyone, especially IT students and programmers who need a quiet place
                    to work, exchange and relax.<br>
                    The space of the cafe should usually be decorated simply with pleasant tones, omitted redundant
                    details and promoted a simple, elegant and polite design.
                </div>
            </div>

        </div>
    </div>

</body>

<footer>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/footer/footer.css">
 <div class="footer-end">
        <div class="Logo">

            <div class="Logo-image"></div>

            <h2> CODEFEE </h2>
            <h3> TEA & COFFEE </h3>
        </div>
        <div class="Copyright">
            <h1>&copy; CODEFE COFFEE & TEA. All rights reserved.
            </h1>

        </div>
        <div class="contact-info">
            <div class="Logos-all">
                <a href="#">
                    <div class="logo-fb"> </div>
                </a>
               <a href="#">
                <div class="logo-insta" "> </div>
               </a>
               
            </div>
        </div>

    </div>
</footer>
