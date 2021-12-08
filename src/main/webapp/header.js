$(document).ready(function() {
    $("#header").before(`
   
    <header>
    <link rel="stylesheet" href="header.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/codefe_login/image/codegelogo.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CodeFe SHOP</title>
    <input id="cart" hidden type="checkbox">
    <div class="nav-bar">
        <input id="check" hidden type="checkbox">

        <div class="branding">
            <h1><a href="/Home/Home.html">CODEFE COFFEE</a></h1>
        </div>
        <label for="cart" class="cart-img"> </label>
        <label for="check" class="menu-icon">
        </label>
        <div class="menu">
            <ul>
                <li><a href="/Home/Home.html">HOME</a></li>
                <li><a href="/Story/ourstory.html">STORY</a></li>
                <li><a href="/Menu/Menu.html">MENU</a></li>
                <li><a href="/New/News.html">NEWS</a></li>
                <li><a href="/Contact/Contact.html">CONTACT</a></li>
                <li><a href="/codefe_login/login.html">LOGIN</a></li>
            </ul>
        </div>

    </div>
    

          <c:forEach var="item" items="${listProduct}">
                      <h1>${item.price}</h1>
		  </c:forEach>

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

            <div class="item">
                <img class="item-img" src="../Hinh_anh/greentea.png">
                <div class="item-info">
                    <div class="item-name">aiybcgajfbcadb</div>
                    <div class="item-price">30.000 vnd</div>
                </div>
                Amount:
                <input class="amount" type="number" name="cart">
            </div>

            <div class="item">
                <img class="item-img" src="../Hinh_anh/greentea.png">
                <div class="item-info">
                    <div class="item-name">aiybcgajfbcadb</div>
                    <div class="item-price">30.000 vnd</div>
                </div>
                Amount:
                <input class="amount" type="number" name="cart">
            </div>

            <div class="item">
                <img class="item-img" src="../Hinh_anh/greentea.png">
                <div class="item-info">
                    <div class="item-name">aiybcgajfbcadb</div>
                    <div class="item-price">30.000 vnd</div>
                </div>
                Amount:
                <input class="amount" type="number" name="cart">
            </div>


            <div class = "Total">Total: 30.000vnd</div>
            <a href="../Cart/test_cart.html">
                <button>Check out</button>
            </a>

        </ul>
    </div>

</header>
    `
    )
})