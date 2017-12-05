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
.my-container img {
    position: fixed;
    left: 0;
    top: 7%;
    width: 100%;
    height: auto;
    opacity: 0.2;
}

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
        	   	f.action='CustomerDeleteServlet?id='+id;
        	    f.submit();
        	    } 
        	   		
        	    else{
        	   	
        	   }
        	   		}
        	   	</script>
        	   	<script language="javascript">
        	   	function setCookie(){ 
        	   	
        	   	
        	   	</script>

 </head>
<body >
<div class="my-container">
   
    <img src="https://s3.amazonaws.com/poly-screenshots.angel.co/enhanced_screenshots/278335-original.jpg">
    </div> 
    
<form method="post" class="form_bg" role="form" >

<%@ page import="com.subway.dao.SubwayDaoImpl" %>
<%@ page import="com.subway.model.AddBean" %>
<%@ page import="com.subway.model.OrderBean" %>
<%@ page import="com.subway.Controller.HomePageController" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="javax.servlet.http.*" %>

 <%


AddBean ab=new AddBean();
SubwayDaoImpl ud = new SubwayDaoImpl();
ResultSet rs = ud.seeMenu(ab); %>


<center><h3>Order Booking</h3></center>


 <table id='example' class='table table-hover table-bordered '>
      
      <thead><tr class='active'>
        		
        		<th>Item Name</th>
        		<th>cost</th>
        	
        	
        		<th>Customize Order</th>
        		
        		</thead>
        <tbody>
   
     <%while(rs.next()){ %>
           <tr>
            <td><%=rs.getString("ItemName") %></td>
         
           <td><%=rs.getLong("Cost") %></td>
                    <%
                    HttpSession sessions = request.getSession(true);
                    String id=request.getRequestedSessionId();
                    session.setAttribute("userId",id);
    				
					sessions.setMaxInactiveInterval(25*60);
					sessions.setAttribute("authenticated", true); 
					 Cookie userName = new Cookie("user", id);
						
						userName.setMaxAge(25*60);
						response.addCookie(userName);
 %>
        <%--  <td><button class="btn btn-warning" id="<%=rs.getString("ItemName") %>"onclick="document.getElementById('id02').style.display='block'" style="width:auto;">Custom Order</button>  </a></td> --%>
<td><a href='order.jsp?name=<%=rs.getString("ItemName") %>&cid=<%=rs.getLong("Cost") %> &jid=<%=id %>' style='color:#228B22;' >  <i class='material-icons'>add</i></a></td> </tr>
        <%} 
       %>
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

</body>
<br>
<footer><center>Designed by Nikhil Reddy &copy2017</center></footer>
</html>