<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
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
body {
 align: center;
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
      <a class="navbar-brand "href="#">SUBWAY</a>
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
        	   		 var doIt=confirm('Do you want to remove this item from menu?');
        	   if(doIt){
        	   		  var f=document.form;
        	   	f.method="get";
        	   	f.action='deleteItem';
        	   		
        	    f.submit();
        	    } 
        	   		
        	    else{
        	   	
        	   }
        	   		}
        	   	</script>
</head>
<body>
  <button class="btn btn-primary"  onclick="document.getElementById('id05').style.display='block'" style="float: right;width:auto;">Add Items</button> 
  	<form method='post' name='form'>



<%@ page import="com.subway.dao.SubwayDaoImpl" %>
<%@ page import="com.subway.model.AddBean" %>
<%@ page import="com.subway.Controller.HomePageController" %>
<%@page import="java.sql.ResultSet" %>

 <%


AddBean ab=new AddBean();
SubwayDaoImpl ud = new SubwayDaoImpl();
ResultSet rs = ud.seeMenu(ab); %>


<center><h1><b>MENU</b></h1></center>
 <table id='examples' class='table table-hover table-bordered '>
      
      <thead><tr class='active'>
        		
        		<th>Item Name</th>
        		<th>cost</th>
        		
        	
        	
        		
        		</thead>
        <tbody>
   
        
       
         <%while(rs.next()){ %>
            <tr>
           <td><%=rs.getString("ItemName") %></td>
         
           <td><%=rs.getLong("Cost") %></td>
               
        
    </tr> 
    <%} %> 
         
         </tbody>
         </table>
       
      		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>   	
      		<script type='text/javascript' charset='utf8' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      		<script type='text/javascript' charset='utf8' src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'>
      		</script><script type='text/javascript' charset='utf8' src='https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js'></script>
      		<script>
      		 $(function(){
      	     $("#examples").dataTable(); 
      		  })
      		  </script>
      		  
  </form> 
  










 <div id="id05" class="modal">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


  <form class="modal-content animate" action="add" method="post">
    <div class="container">
    <div class="col-xs-6 col-md-6">   
 <h3><b>Adding Items To Menu</b></h3><br>
     <br> <label class="form-group ">Item Name</label><br>
      <input type="text" class="form-control" name="name" placeholder="Item Name"/>  
<br>
 <label class="form-group ">Cost</label><br>
      <input type="text" class="form-control" name="cost" placeholder="Cost"/>

<br>
    
      <div class="clearfix">
        <button type="button" class="btn btn-danger" onclick="document.getElementById('id05').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="Submit" class="btn btn-success" >Add Item</button>
    
 </div></div> </div></form>
    </div>

</body>
</html>