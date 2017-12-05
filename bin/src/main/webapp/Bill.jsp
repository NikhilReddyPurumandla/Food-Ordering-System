
  <html><head>
  
 

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="print.css" />
<link rel="stylesheet" type="text/css" href="Style.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Home.jsp">SubWay</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="Menu.jsp">Menu</a></li>
          <li><a href="summary.jsp">Cart</a></li>
        <li><a href="supply.jsp">View Bills</a></li>
    
    </ul>
  </div>
</nav>
<style>
.dropbtn {
    background-color:grey;
    color: white;
    padding: 16px;
    font-size: 16px;
}
footer {
      background-color: #555;
      color: white;
   padding-top: 10px;
    padding-bottom: 0px;
    position:fixed;
    bottom:0;
    width:100%;    }.nav.navbar-nav li a {
   color: #fff;
 }
.my-container img {
    position: fixed;
    left: 0;
    top: 7%;
    width: 100%;
    height: auto;
    opacity: 0.2;
}

.nav.navbar-nav a:hover {
 color: grey;
}.table {
    border-radius: 5px;
    width: 50%;
    margin: 0px auto;
    float: none;
}</style>
<script type="text/javascript">
/*--This JavaScript method for Print command--*/
    function PrintDoc() {
        var toPrint = document.getElementById('b');
        var popupWin = window.open('', '_blank', 'width=350,height=150,location=no,left=200px');
        popupWin.document.open();
        popupWin.document.write('<html><title>::Preview::</title><link rel="stylesheet" type="text/css" href="print.css" /></head><body onload="window.print()">')
        popupWin.document.write(toPrint.innerHTML);
        popupWin.document.write('</html>');
        popupWin.document.close();
    }
/*--This JavaScript method for Print Preview command--*/
    function PrintPreview() {
        var toPrint = document.getElementById('b');
        var popupWin = window.open('', '_blank', 'width=350,height=150,location=no,left=200px');
        popupWin.document.open();
        popupWin.document.write('<html><title>::Print Preview::</title><link rel="stylesheet" type="text/css" href="Print.css" media="screen"/></head><body">')
        popupWin.document.write(toPrint.innerHTML);
        popupWin.document.write('</html>');
        popupWin.document.close();
    }
</script>

 </head>
<body>
<form method="post" class="form_bg" role="form" action="complete">
 <%@ page import="com.subway.dao.SubwayDaoImpl" %>
<%@ page import="com.subway.model.BillBean" %>

<%@ page import="com.subway.Controller.HomePageController" %>
<%@page import="java.sql.ResultSet" %>
<% HttpSession session1=request.getSession(false);
  %>
<%

BillBean ab=new BillBean();
SubwayDaoImpl ud = new SubwayDaoImpl();
ResultSet rs = ud.seeBill(ab); %>
<div class="navbar" id='b'> 
<link rel="stylesheet" type="text/css" href="Style.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <table class='table table-hover table-bordered' id="a">
 <center><h1>Bill Reciept</h1></center>    
      <tr class='active'><%while(rs.next()){ %>
         
        		<tr><td>Bill Id</td> <td><%=rs.getLong("BillId")%></td></tr>
        		<tr><td>Order Id</td><td><%=rs.getLong("OrderId")%></td></tr>
     
        		<tr><td>Item Name</td><td><%=rs.getString("ItemName")%></td></tr>
        		<tr><td>Cost</td><td><%=rs.getLong("Cost") %></td></tr>

        <%} %> 
      		  </table>
      		  
      </div>

<div class="col-xs-6 col-md-6" style="width:800px; margin:0 auto;"><br>
<input type="button" value="Print" class="btn" onclick="PrintDoc()"/>
  <input type="button" value="Print Preview" class="btn" onclick="PrintPreview()"/>
<button class="btn btn-success" type="submit">Completed</button>
</div>

      		  </form>
           
  </body>
  </html>