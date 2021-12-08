<%@page import="model.vnpay.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.nhom2.model.*" %>
<%@page import="com.nhom2.data.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>VNPAY RESPONSE</title>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="jumbotron-narrow.css" rel="stylesheet">
    <script src="jquery-1.11.3.min.js"></script>
</head>
<body>
<%
    //Begin process return from VNPAY
    Map fields = new HashMap();
    for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
        String fieldName = (String) params.nextElement();
        String fieldValue = request.getParameter(fieldName);
        if ((fieldValue != null) && (fieldValue.length() > 0)) {
            fields.put(fieldName, fieldValue);
        }
    }

    System.out.print("Cusname: "+session.getAttribute("cusname").toString());
    System.out.print("Cusaddress: "+session.getAttribute("cusaddress").toString());
    System.out.print("Cusphone: "+session.getAttribute("cusphone").toString());
    System.out.print("Cusmail: "+session.getAttribute("cusmail").toString());
    
    System.out.print("Total: "+session.getAttribute("final").toString());
    
    Bill bil = new Bill();
    bil.setCusname(session.getAttribute("cusname").toString());
    bil.setAddress(session.getAttribute("cusaddress").toString());
    bil.setPhone(session.getAttribute("cusphone").toString());
    bil.setEmail(session.getAttribute("cusmail").toString());
    bil.setTotal( (int) session.getAttribute("final") );
    int discount =0;
    try {
    	discount = (int) session.getAttribute("total") - (int) session.getAttribute("final");
    }
    catch (Exception a){
    	discount =0;
    }
    bil.setdiscount(discount);
    bil.setStatus("On delivery");
    bil.setMethod("VNPay");
    
    BillDAO conBil = new BillDAO();
    conBil.addBill(bil);
    
    Mail mail= new Mail();
    //  mail.Send(bil.getAddress().toString(), "Your purchase bill", "Thank you, "+bil.getCusname()+". Your purchase was successful, your total money is: "+bil.getTotal()+", your product will be devileried as soon as possible. Hope you have a greatful time when choosing your products!");
    
    String vnp_SecureHash = request.getParameter("vnp_SecureHash");
    if (fields.containsKey("vnp_SecureHashType")) {
        fields.remove("vnp_SecureHashType");
    }
    if (fields.containsKey("vnp_SecureHash")) {
        fields.remove("vnp_SecureHash");
    }
    String signValue = Config.hashAllFields(fields);
    
    
    

%>
<!--Begin display -->
<div class="container">
    <div class="header clearfix">
        <h3 class="text-muted">VNPAY RESPONSE</h3>
    </div>
    <div class="table-responsive">
        <div class="form-group">
            <label >Mã đơn hàng:</label>
            <label><%=request.getParameter("vnp_TxnRef")%></label>
        </div>
        <div class="form-group">
            <label >Số tiền:</label>
            <label><%=(Integer.parseInt(request.getParameter("vnp_Amount")))/100%></label>
        </div>
        <div class="form-group">
            <label >Nội dung thanh toán:</label>
            <label><%=request.getParameter("vnp_OrderInfo")%></label>
        </div>
        <div class="form-group">
            <label >Mã phản hồi (vnp_ResponseCode):</label>
            <label><%=request.getParameter("vnp_ResponseCode")%></label>
        </div>
        <div class="form-group">
            <label >Mã GD Tại VNPAY:</label>
            <label><%=request.getParameter("vnp_TransactionNo")%></label>
        </div>
        <div class="form-group">
            <label >Mã Ngân hàng:</label>
            <label><%=request.getParameter("vnp_BankCode")%></label>
        </div>
        <div class="form-group">
            <label >Thời gian thanh toán:</label>
            <label><%=request.getParameter("vnp_PayDate")%></label>
        </div>
        <!--
        <div class="form-group">
            <label >Kết quả:</label>
            <label>
                <%
                    /*if (signValue.equals(vnp_SecureHash)) {
                        if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                            out.print("GD Thanh cong");
                        } else {
                            out.print("GD Khong thanh cong");
                        }

                    } else {
                        out.print("Chu ky khong hop le");
                    }*/
                %></label>
        </div>
        -->
    </div>
    <p>
        &nbsp;
    </p>
    <footer class="footer">
        <p>&copy; VNPAY 2021</p>
    </footer>
</div>
</body>
</html>
