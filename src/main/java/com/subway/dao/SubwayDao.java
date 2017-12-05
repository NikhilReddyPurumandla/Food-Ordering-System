package com.subway.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;

import com.subway.model.AddBean;
import com.subway.model.BillBean;
import com.subway.model.CartBean;
import com.subway.model.OrderBean;  
 
  
public interface SubwayDao {  
 public boolean insertValues(AddBean ab) throws SQLException;  
 public ResultSet seeMenu(AddBean ab) throws SQLException;
 public boolean order(OrderBean ob) throws SQLException, ServletException, IOException;
 public boolean bill(BillBean ab) throws SQLException;
 public ResultSet seeBill(BillBean ab) throws SQLException;
 public ResultSet viewBill(BillBean ab) throws SQLException;
 public boolean list(CartBean ob) throws SQLException, ServletException, IOException;
 
}
