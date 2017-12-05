<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>






  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>       		
  <link rel='stylesheet' href='https://www.w3schools.com/w3css/4/w3.css\'>
  <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
  <link rel='stylesheet' type='text/css' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.0/bootstrap-table.min.css'>
  <link rel='stylesheet' type='text/css' href='https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css'>

  

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
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto;
    border: 1px solid #888;
    width: 80%; 
}
​
</style>

	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand "href="Home.jsp">SUBWAY</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="index.jsp">Home</a></li>
      <li><a href="Menu.jsp">Menu</a></li>
        <li><a href="supply.jsp">View Bills</a></li>
  
    </ul>
  </div>
</nav>

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
<script language="javascript">
function getValues(val){

var numVal1=parseInt(document.getElementById("one").value);
var numVal2=parseInt(document.getElementById("two").value);


var change = numVal2- numVal1 ;

document.getElementById("main").value = change;
}
</script>

 </head>
<body>
 
  	
<form method="post"  name="form">

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
 <% HttpSession session1=request.getSession(false);
  %>

<% 
 Connection con = com.subway.util.DbConnection.getConnection();
Statement st=con.createStatement();
	String strQuery = "select * from FinalList where OrderId=(select(Max(OrderId)) from FinalList)";
	ResultSet rs = st.executeQuery(strQuery); 
%>
    


<h3>Order Booking</h3>


 <table id='example' class='table table-hover table-bordered '>
      
       <thead><tr class='active'>
        		<th>Order Id</th>
        		<th>Customer Name</th>
        		<th>Items Name</th>
        		<th>cost</th>        
        		</thead>
        <tbody>
   
     <%while(rs.next()){ %>
           
            <tr>
        
         
           <td><%=rs.getLong("OrderId") %></td>
           
           <td><%=rs.getString("Cname") %></td>   
    
           <td><%=rs.getString("ItemName") %></td>  
          
          <td><%=rs.getLong("Cost") %></td> 
       
  </tr>
        
        <%} %>
        
         </tbody>
         </table>
         </form> 
      		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>   	
      		<script type='text/javascript' charset='utf8' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      		<script type='text/javascript' charset='utf8' src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'>
      		</script><script type='text/javascript' charset='utf8' src='https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js'></script>
      		<script>
      		 $(function(){
      	     $("#example").dataTable(); 
      		  })
      		  </script>


<h3>Payment Mode</h3>

<center>
 <button class="btn btn-primary" onclick="document.getElementById('id03').style.display='block'" style="width:auto;">Cash Mode</button> 
 <button class="btn btn-primary" onclick="document.getElementById('id04').style.display='block'" style="width:auto;">Card Mode</button> 
 </center>
<%
Statement st1=con.createStatement();
String strQuery1 ="select Cost from FinalList where OrderId=select(Max(OrderId) from FinalList)";
ResultSet rs1 = st1.executeQuery(strQuery);
 	%>
    <div id="id03" class="modal">
  
  <form class="modal-content animate" action="bill" method="post">
    <div class="container">
      <div class="col-xs-4 col-md-4">
      <h3><b>Cash Payment</b></h3><br>
   <label class='form-group'>Amount to be paid </label><%while(rs1.next()){ %>
      <input type="text" class='form-control' name='total' id='one'  value='<%=rs1.getLong("Cost") %>' placeholder='total'onkeyup="getValues(1)" readonly>

  <br>
    
     <br> <label class="form-group required control-label">Amount Recieved</label>
      <input type="text" class='form-control' name='recieved'  id='two' placeholder='recieved' onkeyup="getValues(2)" required>
    
  

     <br> <label class='form-group '>Change to Return</label>
      <input type="text" class='form-control'      id='main' name='change' value=""  placeholder='change' readonly><br>
    <button type="button" class="btn btn-danger" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
       <button type="submit" id="button" class="btn btn-success">Complete Payment</button>
    <%} %>
 </div></div></form></div>

 <div id="id04" class="modal">
  
  <form class="modal-content animate" action="bill" method="post">
    <div class="container">
    <div class="col-xs-6 col-md-6">  
  <%
Statement st2=con.createStatement();
String strQuery2 ="select Cost from FinalList where OrderId=select(Max(OrderId) from FinalList))";
ResultSet rs2 = st1.executeQuery(strQuery);
 	%>
  <h3> <b >Card Payment</b><br></h3>
   <label class='form-group'>Amount to be paid </label><%while(rs2.next()){%>
      <input type="text" class='form-control' name='total' value='<%=rs2.getLong("Cost") %>' placeholder='total' readonly>
   
  <br>
      <br><label  class="form-group required control-label">Card Type</label>
     <br><select class="form-group" name='ctype' >
			
	<option value=debit>Debit</option>
		<option value=credit>Credit</option>	
		
			</select>
  <br>
    
     <br> <label  class="form-group required control-label">Card Number</label>
      <input type="text" class='form-control' type='text' name='cno' placeholder='card number' required>
   

     <br> <label class='form-group '>Amount Collected</label>
      <input type="text" class='form-control' type='text' name='amount' placeholder='amount' required><br>
    <button type="button" class="btn btn-danger" onclick="document.getElementById('id04').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="submit" class="btn btn-success" >Complete Payment</button>
    <%} %>
 </div></div> </form>
    </div>
​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​<style>

input[type=text], input[type=password] {
    width: 350px;
    padding: 6px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.container {
    padding: 10px;
}

.modal {
    display: none;
    position: right;
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
    padding-top: 60px;
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto;
    border: 1px solid #888;
    width: 32%; 
}

.close {
    position: absolute;
    right: 1px;
    top: 15px;
    color: red;
    font-size: 50px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: blue;
    cursor: pointer;
}



}
</style>
   
</div>

  </form>

 </center>
</body>
<br>
<footer><center>Designed by Nikhil Reddy &copy2017</center></footer>
</html>