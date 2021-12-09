<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Contact/Contact.css">
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
				<li><a href="${pageContext.request.contextPath}/HomeController">HOME</a></li>
                <li><a href="${pageContext.request.contextPath}/Story/ourstory.jsp">STORY</a></li>
                <li><a href="${pageContext.request.contextPath}/MenuController">MENU</a></li>
                <li><a href="${pageContext.request.contextPath}/New/News.jsp">NEWS</a></li>
                <li><a href="${pageContext.request.contextPath}/Contact/Contact.jsp">CONTACT</a></li>
                <li><a href="${pageContext.request.contextPath}/CusLoginController" method="post">LOGIN</a></li>
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
                 <input type="hidden" name="viewid" value="Contact/Contact.jsp">
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
            <a href="${pageContext.request.contextPath}/CheckoutController">
                <button>Check out</button>
            </a>

        </ul>
    </div>

</header>

<body>
    <div class="container-contact">
        <div class="Contactto">
            Contact to
        </div>
        <div class="our-store">
            Our Store
        </div>
        <div class="line">

        </div>
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/ContactController" method="post">
                <p>Name</p>
                <input class="input-item" type="text" name="Name" ><br>
                <p>Phone</p>
                <input class="input-item" type="text" name="Phone" value=""><br>
                <p>Email</p>
                <input class="input-item" type="email" name="Email" value=""><br>
                <p>Message</p>
                <input class="input-item" type="text" name="Message" value="">
                </input><br>
                <input class="submit-button" name="button" type="submit" onclick="myFunction()" value="Send">
            </form>
            <script>
				function myFunction() {
				  alert("Thank you!");
				}
			</script>
        </div>
    </div>
</body>