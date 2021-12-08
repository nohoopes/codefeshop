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
            <div class="item">
                <img class="item-img" src="../Hinh_anh/greentea.png">
                <div class="item-info">
                    <div class="item-name">aiybcgajfbcadb</div>
                    <div class="item-price">30.000 vnd</div>
                </div>
                Amount:
                <input class="amount" type="number" name="cart">
            </div>
            
            <c:forEach var="item" items="${cart.items}">
                <div class="item">  
                <img class="item-img" src="./Product_img/${item.product.id}.png">
                <div class="item-info">
                    <div class="item-name"><c:out value='${item.product.name}'/></div>
                    <div class="item-price">${item.product.price} </div>
                </div>
                Amount:
                
                <input class="amount" type="number" name="quantity" min="0" value = "<c:out value='${item.quantity}'/>" onchange ="update_quality(${item.product.id},this.value)"  >  
                 </div>            
            </c:forEach>
            <script>
               function update_quality(id,quatity){
            	   window.open("${pageContext.request.contextPath}/CartController?productId="+id+"&quantity="+quatity+"&check_cart=" +document.getElementById("check").value,"_self");
               }
            </script>


            <div class = "Total">Total: ${total}</div>
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
                    <input type="radio" value="price" name="moreidea">
                    <span>Price</span><br>
                    <input type="radio" value="popular" name="moreidea">
                    <span>Popular</span>
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
                    <img class="img-result" src="./Product_img/${item.id}.png">
                    <div class="name-result"> ${item.name}</div>
                    <div class="card-content">
                        <h5>${item.price}</h5>
                        <h4>${item.description}</h4>
                    </div>
                          <form action="${pageContext.request.contextPath}/CartController" method="post">
            			<input type="hidden" name="productId" value="${item.id}">
                		<input class="order" type="submit" value="Add To Cart">
            	        </form>
                </div>
                	
                       
    			</c:forEach>
                
            </div>
        </div>

    </div>

</body>
<footer>
</footer>
