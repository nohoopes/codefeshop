<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="ourstory.css">
<link rel="stylesheet" href="Story/ourstory.css">
<header>
    <link rel="stylesheet" href="header.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/Hinh_anh/logo.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CodeFe SHOP</title>
    <input id="cart" hidden type="checkbox" <c:if test = "${check_cart=='checked'}"> checked </c:if>>
    <div class="nav-bar">
        <input id="check" hidden type="checkbox" value ="checked">

        <div class="branding">
            <h1><a href="/Home/Home.jsp">CODEFE COFFEE</a></h1>
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
                <img class="item-img" src="${pageContext.request.contextPath}/Product_img/${item.product.code}.png">
                <div class="item-info">
                    <div class="item-name"><c:out value='${item.product.name}'/></div>
                    <div class="item-price">${item.product.price} vnd</div>
                </div>
                Amount:
                <form id ="updateform_${item.product.id}" action="${pageContext.request.contextPath}/CartController" method="post">
                 <input type="hidden" name="viewid" value="/Story/ourstory.jsp">
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
            <a href="CheckoutController">
                <button>Check out</button>
            </a>

        </ul>
    </div>

</header>
<body>
    <div class="container-story">
        <div class="line"></div>
        <div class="foundation">
            OUR FOUNDATION
        </div>
        <div class="line" style="margin-top: 0px;"></div>
        <div class="info-1">
            <div class="info-1-content">
                The team started from small wishes during the covid epidemic, with 3 people on the main team and an
                outsourced designer.
                <br>
                The initial name of the group was chosen to show the connection between code and coffee at the
                suggestion of Minh Nhut.
                <br>
                "This is our brand name!" This is an affirmation from CEO Minh Nhut. Actually, with this name we decided
                on our concept with background color, main design and interior design ideas.
            </div>
            <div class="info-1-img">
                <div class="Circle-img">
                    <div class="Circle-ground">
                        <div class="Circle-border">
                        </div>
                        <h2>Our Shop</h2>
                    </div>
                </div>
            </div>
        </div>


        <div class="info-2">
            <div class="info-2-img">
                <div class="rec-img">
                    <div class="rec-ground">
                        <div class="word">
                            <div class="rect"></div>
                            <div class="rect"></div>
                            <div class="rect"></div>
                            <div class="rect"></div>

                        </div>
                        <h2>History</h2>
                    </div>
                </div>

            </div>
            <div class="info-2-content">
                Another highlight of the restaurant is that the restaurant has changed to both selling water and selling
                food at the same time.
                <br>
                <br>
                "What if people are hungry after drinking?" Co-Founder Khoa asked. We have realized the importance of
                food and drink.
                <br>
                <br>
                Since then, everything in the shop has been remodeled to bring the most comfortable dining and drinking
                space for users.
                <br>
                <br>
                The final improvement comes from Viet Anh, which is adapting during the epidemic season with the ideas
                of online sales and payment at home. And everything has been arranged so that we can sell both online
                and offline and still ensure the quality of each customer's coffee.
            </div>
        </div>

        <div class="info-3">
            <div class="info-3-img" src="../Hinh_anh/info-3.png">
                <div class="info-3-ground">
                    <div class="info-3-title">
                        Why "Codefe" ?
                        <br>
                        Why Coffee ?
                    </div>
                </div>
            </div>
            <div class="info-3-content">
                <br>
                Codefe - cherished dream from youth ages, start from the beginning of the Covid pandemic and coding projects make people feel that they need a cup of coffee. 
                <br>
                <br>
                At that time, a Ecommerce website led the trend and was loved by coffee shops. In 1 year, from making an application to manage the shop to making an enthusiasm website. We, step by step, getting closer to the most colorful dream of ours.
                <br>
                <br>
                <br>
                The influence of coffee
                <br>
                <br>
                Sedative effect. It has been proven that, if you go to bed within 15 minutes after drinking coffee, you will sleep more deeply, because the blood in the brain is better circulated.
                <br>
                <br>
                However if we continue to procrastinate, this effect will fade away, and then the caffeine begins to take effect, we will not be able to sleep anymore.
                <br>
                <br>
                Stimulates concentration and excitement. Should drink coffee several times a day, each time a small sip, instead of drinking a large cup in the morning. This way is especially suitable for those who have to work at night, they will find it easier to stay up late as well as maintain higher concentration
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