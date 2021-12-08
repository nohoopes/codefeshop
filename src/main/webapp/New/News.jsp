<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="new.css">
<link rel="stylesheet" href="New/new.css">
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
            
            <c:forEach var="item" items="${cart.items}">
                <div class="item">  
                <img class="item-img" src="${pageContext.request.contextPath}/Product_img/${item.product.code}.png">
                <div class="item-info">
                    <div class="item-name"><c:out value='${item.product.name}'/></div>
                    <div class="item-price">${item.product.price} vnd</div>
                </div>
                Amount:
                <form id ="updateform_${item.product.id}" action="${pageContext.request.contextPath}/CartController" method="post">
                 <input type="hidden" name="viewid" value="New/News.jsp">
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
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<body>
    <script src="script.js"></script>
    <div class="hero-section" style="background-image: url('${pageContext.request.contextPath}/Hinh_anh/new_cut.jpg');">
        <div class="hero-content" >
            <div class="hero-heading">
                Always for your choices.
            </div>
            <div class="hero-subheading">
                Check out our new information about coupons and products.
            </div>
          
        </div>
    </div>
        <div class="main-section">
            <div class="container-new">
                <div class="section-heading">
                    <div class="section-title">Feature Post</div>
                    <div class="med-divider"></div>
                </div>
                <div class="collection-list-wrap">
                    <div class="collection-list-1">
                        <div class="featuredthumbnail">
                            <a class="featured-wrapper" href="${pageContext.request.contextPath}/annouce/annouce1/annouce.jsp">
                                <div class="div-block">
                                    <div class="category-tag-2" style="background-color:#1d7874">
                                        Promotion
                                    </div>
                                    <div class="featured-image" style="background-image: url('${pageContext.request.contextPath}/Hinh_anh/annouce/annouce1/voucher.png');">
                                    </div>
                                </div>
                                <div class="featured-text">
                                    <div class="featured-title">
                                        Grand Opening Promotion 
                                    </div>
                                    <div class="featured-description">
                                        Welcome to our shop
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="featuredthumbnail">
                            <a class="featured-wrapper" href="${pageContext.request.contextPath}/annouce/annouce3/annouce.jsp">
                                <div class="div-block">
                                    <div class="category-tag-2" style="background-color:#843b62">
                                        COMBO
                                    </div>
                                    <div class="featured-image" style="background-image: url('${pageContext.request.contextPath}/Hinh_anh/annouce/annouce3/paperbag.jpg');" >
                                    </div>
                                </div>
                                <div class="featured-text">
                                    <div class="featured-title">
                                        Beautiful Breakfast
                                    </div>
                                    <div class="featured-description">
                                        NEW COMBO
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-new">
                <div class="section-heading">
                    <div class="section-title">Most Recent</div>
                    <div class="med-divider"></div>
                </div>
                <div class="collection-list-wrap">
                    <div class="collection-list">
                        <div class="blog-thumbnail">
                            <a class="thumbnail-wrapper" href="${pageContext.request.contextPath}/annouce/annouce1/annouce.jsp">
                                <div class="image-wrapper">
                                    <img class="thumbnail-image" style="background-image: url('${pageContext.request.contextPath}/Hinh_anh/annouce/annouce1/voucher.png');">
                                    </img>
                                    <div class="category-tag">
                                        PROMOTION
                                    </div>
                                </div>
                                <div class="thumbnail-text">
                                    <div class="bog-title">
                                        Grand Opening Promotion 
                                    </div>
                                    <div class="preview-text"> Welcome to our new coffee shop, ...</div>

                                </div>
                            </a>
                        </div>
                        <div class="blog-thumbnail">
                            <a class="thumbnail-wrapper" href="${pageContext.request.contextPath}/annouce/annouce4/annouce.jsp">
                                <div class="image-wrapper">
                                    <img class="thumbnail-image" style="background-image: url('${pageContext.request.contextPath}/Hinh_anh/annouce/annouce4/bb1.jpg');">
                                    </img>
                                    <div class="category-tag">
                                        Sale off
                                    </div>
                                </div>
                                <div class="thumbnail-text">
                                    <div class="bog-title">
                                        ROASTED COFFEE
                                    </div>
                                    <div class="preview-text">Try our new coffe.</div>
                                </div>
                            </a>
                        </div>
                        <div class="blog-thumbnail">
                            <a class="thumbnail-wrapper" href="${pageContext.request.contextPath}/annouce/annouce3/annouce.jsp">
                                <div class="image-wrapper">
                                    <img class="thumbnail-image" style="background-image: url('${pageContext.request.contextPath}/Hinh_anh/annouce/annouce3/paperbag.jpg');">
                                    </img>
                                    <div class="category-tag" style="background-color:#C06C84;">
                                        COMBO
                                    </div>
                                </div>
                                <div class="thumbnail-text">
                                    <div class="bog-title">
                                        Beautiful Breakfast
                                    </div>
                                    <div class="preview-text">Begin your day</div>
                                </div>
                            </a>
                        </div>
                        <div class="blog-thumbnail">
                            <a class="thumbnail-wrapper" href="${pageContext.request.contextPath}/annouce/annouce2/annouce.jsp">
                                <div class="image-wrapper">
                                    <img class="thumbnail-image" style="background-image: url('${pageContext.request.contextPath}/Hinh_anh/annouce/annouce2/membercard.jpg');">
                                    </img>
                                    <div class="category-tag" style="background-color:#C06C84;">
                                        HOT
                                    </div>
                                </div>
                                <div class="thumbnail-text">
                                    <div class="bog-title">
                                        New Member
                                    </div>
                                    <div class="preview-text">Join our member now</div>
                                </div>
                            </a>
                        </div>
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