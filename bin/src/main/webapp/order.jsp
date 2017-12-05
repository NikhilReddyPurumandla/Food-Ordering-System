
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  
<style>
.form-group{
width:250px;
}
 body {
 align: center;

.form_bg {
    background-color:white;
    border-style: inset;
    color:grey;
    padding-left:40px;
    border-radius:50px;
 
    border:5px solid inset;
    width: 380px;
    height: 700px;
    
}


}
	  footer {
        background-color: #555;
      color: white;
      padding-top: 10px;
      padding-bottom: 0px; 
      position:fixed; 
      bottom:0;
	  width:100%;
    }
    select {
  padding: 6px;
  height: 32px;
  width: 6.6cm;
  color:black;
  border-radius: 10px;
  
}
textarea{
  padding: 6px;
  height: 90px;
  width: 6.6cm;
  color:black;
  border-radius: 10px;
  
}
    .nav.navbar-nav li a {
   color: #fff;
 }

.nav.navbar-nav a:hover {
 color: grey;
}
 .form-group.required.control-label:after{
   color: red;
   content: "*";
   position: absolute;
   margin-left: 5px;
} 

</style>
<script language="javascript">
        	   		function deleteRecord(id){ 
        	   		 var doIt=confirm('Do you want to cancel the item?');
        	   if(doIt){
        	   		  var f=document.form;
        	   	f.method="post";
        	   	f.action='DeleteController?id='+id;
        	    f.submit();
        	    } 
        	   		
        	    else{
        	   	
        	   }
        	   		}
        	   	</script>

	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand "href="Home.jsp">Customer Support</a>
    </div>
    <ul class="nav navbar-nav">
       <li ><a href="index.jsp">Home</a></li>
      <li><a href="Menu.jsp">Menu</a></li>
    </ul>
  </div>
</nav>



 </head>
<body>
 <center><h3>Order Generation</h3></center>
  	<form action="order" method="post" class='form_bg'>
  	 <% HttpSession session1=request.getSession(false);
 %>
 
   <% String name=request.getParameter("name");
          String cid=request.getParameter("cid");
          String jid=request.getParameter("jid");
          %> 
<%--           <%Cookie[] cookies = request.getCookies();
          
          System.out.println("cookie values"+cookies);
          if (cookies != null) {

            boolean cookieJSESSIONIDFound = false;

            for (Cookie cookie : cookies) {

              if (cookie.getName().equals("JSESSIONID")) {

                cookieJSESSIONIDFound = true;

               System.out.print("Cookie with name JSESSIONID found!");
                String jid=cookie.getValue();
                System.out.println("JSESSIONID=" +jid);
 %> --%>
  	       <center>
           <div class="container">
          
  	 <div class="col-xs-6 col-md-6">
      <label class="form-group required control-label">Transaction Id</label>
      <input type="text" class="form-control" name="cname"  value='<%=jid%>' readonly>
       
    <%--   <%
              }

            }
          } %> --%>
</div>
</div>
 </center>

 <div class="container">

 
  <center>
   
    <div class="col-xs-6 col-md-6">
      <label class="form-group required control-label">Item Name</label>
      <input type="text" class="form-control" name="name" value="<%=name%>" readonly>
</div>
 <div class="col-xs-6 col-md-6">
      <label class="form-group">Cost</label>
  <input type=  "text" class='form-control'  name='cost' value="<%=cid%>" readonly>
</div>

<div class="col-xs-6 col-md-6"><br><br>
<label><b>Type</b></label><br><br>
    <select class="form-group" name=type  required>
			
	<option value=regular>Regular Pizza</option>
		<option value=panpizza>Pan Pizza</option>	
		<option value=small>Small Pizza</option>
		<option value=extralrge>Extra Large</option>
			</select>
</div><br><br>
<div class="col-xs-6 col-md-6"><br><br>
       <label><b>Topping</b></label><br>
     	<br><select class="form-group" name=top  required>
			
	<option value=Bacon>Bacon</option>
		<option value=Olives>Olives</option>	
		<option value=Black Olives>Black Olives</option>
		<option value=Pepperoni>Pepperoni</option>
		<option value=Black Olives>Black Olives</option>
		<option value=Mushrooms>Mushrooms</option>
			</select>
</div><br>
<div class="col-xs-6 col-md-6"><br>
     <label><b>Extra cheese</b></label><br>
       <input type="radio" name="cheese" value="Yes">Yes 
  <input type="radio" name="cheese" value="No" checked>No
</div>

 <div class="col-xs-6 col-md-6">
      <label class="form-group required control-label">Quantity</label>
      	<br><select class="form-group" name="quantity"  required>
			
	<option value=1>1</option>
		<option value=2>2</option>	
		<option value=3>3</option>
		<option value=4>4</option>
		<option value=5>5</option>
		
			</select>
</div>
<div class="col-xs-6 col-md-6"><br>
<button class="btn btn-success" type="submit">Add to Order</button>
</div>
<div class="col-xs-6 col-md-6"><br>
<a href="index.jsp?jid=<%=jid%>" class="btn btn-default">Add More Items</a>
</div>

</div>
<center>
</center>
</center>
</form>
<center>
<br><br><br><br>
<div class="col-xs-12 col-md-12">
<a href="#demo" class="btn btn-info" data-toggle="collapse">View Order</a>
  <div id="demo" class="collapse">
   <form method="post"  name="form" action='checkout' >

<%@ page import="com.subway.dao.SubwayDaoImpl" %>

<%@ page import="com.subway.Controller.SubwayLogger" %>
<%@ page import="com.subway.model.AddBean" %>
<%@ page import="com.subway.model.OrderBean" %>
<%@ page import="com.subway.Controller.HomePageController" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
 
<%



 Connection con = com.subway.util.DbConnection.getConnection();

 	java.sql.PreparedStatement ps = con.prepareStatement("select * from cart where Cname=(select Cname from cart where CartId = (select MAX(CartId) from cart))  and Cname not in (select Cname from Bill)"); 
 
 	ResultSet rs = ps.executeQuery();%>
    


<h3>Order Booking</h3>


 <table id='example' class='table table-hover table-bordered '>
      
       <thead><tr class='active'>
        		<th>Cart Id</th>
        		<th>Customer Name</th>
        		<th>Item Name</th>
        		<th>cost</th>
        		<th>type</th>
        		<th>Topping</th>
        		<th>Extracheese</th>
        		<th>quantity</th>
        	
        		<th>Item Total cost</th>
        		<th>Delete Order</th>
        		</thead>
        <tbody>
   
     <%while(rs.next()){ %>
           
            <tr>
           <td><%=rs.getLong("CartId") %></td>
            
            <td><%=rs.getString("Cname") %></td>
         
           <td><%=rs.getString("ItemName") %></td>
         
           <td><%=rs.getLong("Cost") %></td>
           
           <td><%=rs.getString("Type") %></td>   
    
           <td><%=rs.getString("Topping") %></td>  
        
           <td><%=rs.getString("ExtraCheese") %></td>  
       
         
          <td><%=rs.getLong("Quantity") %></td> 
       
         <td><%=rs.getLong("Total") %></td> 
           
          
    
          <td> <button type="button" onclick='deleteRecord("<%=rs.getLong("CartId") %>")'style='color:#ff0000 ;'><i class='material-icons'>delete</i></button></td>
         </tr>
        
        <%} %>
        
         </tbody>
         </table>
       
      		
      		  <%



       		 Connection con1 = com.subway.util.DbConnection.getConnection();
      		Statement st=con1.createStatement();
      		String strQuery = "select sum(Total) from cart where Cname=(select Cname from cart where CartId = (select MAX(CartId) from cart))  and Cname not in (select Cname from Bill)";
      		ResultSet rs1 = st.executeQuery(strQuery);  %>
 
    <%while(rs1.next()){ %>
      		   <table class='table table-hover table-bordered '>  <th>Grand Total</th><td><%=rs1.getString(1) %></td> </table>
<%} %>
<center>
<button class="btn btn-success" type="submit">Place Order</button>
</center>
</form>
 </div></div></center>

</body>
<br>

</html>