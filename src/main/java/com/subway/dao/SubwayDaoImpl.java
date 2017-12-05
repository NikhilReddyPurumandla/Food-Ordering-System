package com.subway.dao;

 
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.subway.Controller.HomePageController;
import com.subway.model.AddBean;
import com.subway.model.BillBean;
import com.subway.model.CartBean;
import com.subway.model.OrderBean;  
  

public class SubwayDaoImpl implements SubwayDao {  
	 static Boolean status = false; 
     static Connection con;
	public static PreparedStatement ps;
	ResultSet rs;
	public long generatedkey=0;
	
	public SubwayDaoImpl() throws SQLException, IOException
	{
		con = com.subway.util.DbConnection.getConnection();
	}

 
 public boolean insertValues(AddBean ab) throws SQLException{  
	
	 java.sql.PreparedStatement  ps = con.prepareStatement("insert into Menu values(?,?)");

	  ps.setString(1,ab.getName());
	  ps.setLong(2,ab.getCost());
	  
	  int a = ps.executeUpdate();
	  
	  if (a == 1)
	  {
	      status = true;
	  }	
	return status;			
        
 }  
  
 public ResultSet seeMenu(AddBean ab) throws SQLException
 {
 	con = com.subway.util.DbConnection.getConnection();
 	PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("select * from Menu");
 	rs = pstmt.executeQuery();
     return rs;    
 }
 public boolean order(OrderBean ob) throws SQLException, ServletException, IOException{  
		
	 java.sql.PreparedStatement  ps = con.prepareStatement("insert into cart values(?,?,?,?,?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);

	  ps.setLong(1,ob.getOrderid());
	  ps.setString(2, ob.getCname());
	  ps.setString(3,ob.getIname());
	  ps.setLong(4,ob.getCost());
	  int y=ob.getCost();
	  ps.setString(5,ob.getType());
	  ps.setString(6,ob.getTopping());
	  ps.setString(7,ob.getExtracheese());
	  ps.setLong(8,ob.getQuantity());

int x=ob.getQuantity();
int z=x*y;
	  ps.setLong(9,z);
	  int a = ps.executeUpdate();
	  
      ResultSet rs=ps.getGeneratedKeys();
      if (rs.next()) {
      generatedkey=rs.getLong(1);
      
      System.out.println(" generatedkey is:"+ generatedkey);
      

	  if (a == 1)
	  {
	      status = true;
		
	  }	
      }
      
	return status;			
        
 } 

 public static int deleteItem(long id) throws SQLException
 {

       con = com.subway.util.DbConnection.getConnection();
       java.sql.PreparedStatement  ps = con.prepareStatement("delete  from cart where CartId=?");
     
    
     ps.setLong(1,id);
     
     int status1 = ps.executeUpdate();
     System.out.println("deleted");
     
     return status1;
 }
 
 public boolean bill(BillBean ab) throws SQLException{  
	
	
	  
	String query="select OrderId,Cname,ItemName,Cost from FinalList where OrderId=(select max(OrderId) from FinalList) "; 
	 Statement stmt=(Statement) con.createStatement();  
    ResultSet rs = stmt.executeQuery(query);
    while (rs.next()) {
	 java.sql.PreparedStatement  ps = con.prepareStatement("insert into Bill values(?,?,?,?,?)");

	  ps.setLong(1,ab.getBillid());
	  ps.setLong(2,rs.getLong("OrderId"));
	  ps.setString(3,rs.getString("Cname"));
	  ps.setString(4,rs.getString("ItemName"));
	  ps.setLong(5,rs.getLong("Cost"));
	  int a = ps.executeUpdate();
    
	  if (a == 1)
	  {
	      status = true;
	  }	
    }
	return status;			
        
 }  
 public ResultSet seeBill(BillBean ab) throws SQLException
 {
 	con = com.subway.util.DbConnection.getConnection();
 	PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("select * from Bill where BillId=(select max(BillId) from Bill)");
 	rs = pstmt.executeQuery();
  
     return rs;    
 }
 public ResultSet viewBill(BillBean ab) throws SQLException
 {
 	con = com.subway.util.DbConnection.getConnection();
 	PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("select * from Bill");
 	rs = pstmt.executeQuery();
               
 
     return rs;    
 }
 public boolean list(CartBean ob) throws SQLException, ServletException, IOException{  
	 String query=" select GROUP_CONCAT(distinct((cname)) SEPARATOR ', '), GROUP_CONCAT((ItemName) SEPARATOR ', '), sum(Total) from cart where  Cname=(select Cname from cart where CartId = (select MAX(CartId) from cart));";

	 Statement stmt=(Statement) con.createStatement();  
    ResultSet rs = stmt.executeQuery(query);
 
	 java.sql.PreparedStatement  ps = con.prepareStatement("insert into FinalList values(?,?,?,?)");
		while(rs.next()) {
			 System.out.println("name is:"+rs.getString(1));
				System.out.println("item is:"+rs.getString(2));
				System.out.println("cost is:"+rs.getLong(3));
			 	
	  ps.setLong(1,ob.getOrderid());
	 
	  ps.setString(2, rs.getString(1));
	  ps.setString(3,rs.getString(2));
	 	
	  ps.setLong(4,rs.getLong(3));
	  
		}
	  int a = ps.executeUpdate();
	  
     
    
      

	  if (a == 1)
	  {
	      status = true;
		
	  }	
     
      
      
	return status;			
        
 } 
}