package com.subway.Controller;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;


import com.subway.dao.SubwayDao;
import com.subway.dao.SubwayDaoImpl;
import com.subway.model.AddBean;
import com.subway.model.BillBean;
import com.subway.model.CartBean;
import com.subway.model.OrderBean;



import com.subway.Controller.SubwayLogger;





  
@Controller  
public class HomePageController {  
  
	SubwayDaoImpl sd;

	/*@Qualifier("SubwayDaoImpl")*/
	
 @RequestMapping(value="/add", method = RequestMethod.POST)  

 public ModelAndView add(@ModelAttribute AddBean ab, HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {  
	 ModelAndView mv= new ModelAndView();
	        sd = new SubwayDaoImpl(); 
			if(sd.insertValues(ab)) {
				System.out.println("success");
			}
			RequestDispatcher rd=request.getRequestDispatcher("Menu.jsp");  
			//servlet2 is the url-pattern of the second servlet  
			  
			rd.forward(request,response);//method may be include or forward  

				  return mv;
 
}
 @RequestMapping(value="/order", method = RequestMethod.POST)  


 public ModelAndView add(@ModelAttribute OrderBean ob, HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {  
	 ModelAndView mv= new ModelAndView();
	     String cname=request.getParameter("cname");
	     String item=request.getParameter("name");
	     String type=request.getParameter("type");
	     String top=request.getParameter("top");
	     String cheese=request.getParameter("cheese");
	     ob.setCname(cname);
	     ob.setIname(item);
	     ob.setType(type);
	     ob.setTopping(top);
	     ob.setExtracheese(cheese);
	        sd = new SubwayDaoImpl(); 
			if(sd.order(ob)) {
				SubwayLogger.FILE_LOGGER.debug("order added successfully"); 
			
				long x=sd.generatedkey;
				SubwayLogger.FILE_LOGGER.debug("id is:"+sd.generatedkey); 
				
			/*	response.sendRedirect("summary.jsp?id="+x);*/
				/*RequestDispatcher rd=request.getRequestDispatcher("summary.jsp?id="+x);	  
				rd.forward(request,response);
				*/
				RequestDispatcher rd=request.getRequestDispatcher("order.jsp");	  
				rd.forward(request,response);
				
			}
			return mv;
			
				  
}
	
@RequestMapping(value="/delete", method = RequestMethod.POST)  

public ModelAndView delete(@ModelAttribute OrderBean ob, HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {  
	 ModelAndView mv= new ModelAndView();
	        sd = new SubwayDaoImpl(); 
	        SubwayLogger.FILE_LOGGER.debug("delete this id:"+sd.generatedkey); 
	        
	        
			SubwayDaoImpl.deleteItem(sd.generatedkey);
			SubwayLogger.FILE_LOGGER.debug("Deleted successfully"); 
				
			
			    
			RequestDispatcher rd=request.getRequestDispatcher("Menu.jsp");  
			//servlet2 is the url-pattern of the second servlet  
			  
			rd.forward(request,response);//method may be include or forward  

				  return mv;

}
@RequestMapping("/bill")  

public ModelAndView bill(@ModelAttribute BillBean ob, HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {  
	 ModelAndView mv= new ModelAndView();
	
	 
	        sd = new SubwayDaoImpl(); 
			if(sd.bill(ob)) {
				SubwayLogger.FILE_LOGGER.debug(" bill Inserted successfully");
			
		
			}
			

			RequestDispatcher rd=request.getRequestDispatcher("Bill.jsp");	  
			rd.forward(request,response);
				  return mv;
}
@RequestMapping(value="/checkout", method = RequestMethod.POST)  


public ModelAndView checkout(@ModelAttribute CartBean ob, HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {  
	 ModelAndView mv= new ModelAndView();

	        sd = new SubwayDaoImpl(); 
			if(sd.list(ob)) {
				SubwayLogger.FILE_LOGGER.debug("list added successfully"); 
			
				long x=sd.generatedkey;
				SubwayLogger.FILE_LOGGER.debug("id is:"+sd.generatedkey); 
			
				RequestDispatcher rd=request.getRequestDispatcher("summary.jsp");	  
				rd.forward(request,response);
				
			}
			return mv;
			
				  
}
@RequestMapping(value="/complete", method = RequestMethod.POST)  


public ModelAndView complete(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, ServletException {  
	 ModelAndView mv= new ModelAndView();
	 Cookie[] cookies = request.getCookies();
 	if(cookies != null){
 	for(Cookie cookie : cookies){
 		if(cookie.getName().equals("JSESSIONID")){
 			cookie.setMaxAge(0);
 			break;
 		}
 	}
 	}
 	/*request.getSession().invalidate();*/
   HttpSession session=request.getSession(false);
     
      if(session!=null) {
    	 System.out.println("session not expired");
    	 session.invalidate(); 
    	 RequestDispatcher rd=request.getRequestDispatcher("Menu.jsp");	  
    		rd.forward(request,response);
     } 
     if(session == null) {
    	 System.out.println("session is expired");
    	 RequestDispatcher rd=request.getRequestDispatcher("index.jsp");	  
    		rd.forward(request,response);
    	 
     }


		
	return mv;
			
				  
}
}