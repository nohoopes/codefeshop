<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="Menu.css">

<meta name="viewport" content="width=device-width,initial-scale=1.0">

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
                <img class="item-img" src="./Product_img/${item.product.code}.png">
                <div class="item-info">
                    <div class="item-name"><c:out value='${item.product.name}'/></div>
                    <div class="item-price">${item.product.price} vnd</div>
                </div>
                Amount:
                <form id ="updateform_${item.product.id}" action="${pageContext.request.contextPath}/CartController" method="post">
                 <input type="hidden" name="viewid" value="/Menu/Menu.jsp">
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
   
  
    <div class="container-test">
        <form action="SearchController" method = "post">		
        <div class="filter">
            <div class="search-word">SEARCH</div>
            <div class="line"></div>
            <input class="search-place" type="text" placeholder="Looking for something?" name="search-info">
            <div class="filter-text"> FILTERS </div>
            <div class="line"></div>
            <br>
            <div class="filter-area">
                <div class="celebrations">
                    <label>YOUR SELECTION</label><br>
                    <input type="radio" value="drink" name="selection" <c:if test = "${check_filter=='drink'}"> checked </c:if> >
                    <span>Drink</span><br>
                    <input type="radio" value="food" name="selection" <c:if test = "${check_filter=='food'}"> checked </c:if>>
                    <span>Food</span><br>
                    <input type="radio" value="all" name="selection" <c:if test = "${check_filter=='all'}"> checked </c:if>>
                    <span>All</span>
                </div>
                <div class="more-idea">
                    <label>SORT BY</label><br>
                    <input type="radio" value="price" name="sortby" <c:if test = "${sort_by=='price'}"> checked </c:if>>
                    <span>Price</span><br>
                    <input type="radio" value="name" name="sortby" <c:if test = "${sort_by=='name'}"> checked </c:if>>
                    <span>Name</span><br>
                     <input type="radio" value="none" name="sortby" <c:if test = "${sort_by=='none'}"> checked </c:if>>
                    <span>None</span>
                </div>
            </div>
            
                <input class="find" type = "submit" value = "Search">
             
        </div>
        </form>
        <div class="filter-result">
            <div class="result-place">
                <!-- Card 1 -->
              
                <c:forEach var="item" items="${listProduct}">
    				 <div class="card">
                    <img class="img-result" src="${pageContext.request.contextPath}/Product_img/${item.code}.png">
                    <div class="name-result"> ${item.name}</div>
                    <div class="card-content">
                        <h5>${item.price}</h5>
                        <h4>${item.description}</h4>
                    </div>
                      <form action="${pageContext.request.contextPath}/CartController" method="post">
            			<input type="hidden" name="productId" value="${item.id}">
            			<input type="hidden" name="viewid" value="/Menu/Menu.jsp">
                		<input class="order" type="submit" value="ORDER">
            	       </form>
                </div>
                	
                       
    			</c:forEach>
                
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