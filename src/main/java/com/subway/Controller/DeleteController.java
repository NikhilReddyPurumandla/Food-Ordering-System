package com.subway.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subway.dao.SubwayDaoImpl;



/**
 * Servlet implementation class DeleteController
 */
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		/* response.setHeader("Cache-Control","no-cache");
	        response.setHeader("Cache-Control","no-store");
	        response.setHeader("Pragma","no-cache");
	        response.setDateHeader ("Expires", 0);*/
		 String id2=request.getParameter("id");
		 long id1 = Long.parseLong(id2);
	     
			try {
				SubwayDaoImpl.deleteItem(id1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 SubwayLogger.FILE_LOGGER.debug("deleted id "+id1);
			 response.sendRedirect("order.jsp");  
				//servlet2 is the url-pattern of the second servlet  
				  
				

		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
