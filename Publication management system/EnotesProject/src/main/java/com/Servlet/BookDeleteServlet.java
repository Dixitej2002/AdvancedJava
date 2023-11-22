package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.Db.DBConnect;
import com.User.BookDetails;


@WebServlet("/delete")
public class BookDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
	    	 int id= Integer.parseInt(req.getParameter("id"));
	    	 
	    	 BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConn());
	    	 boolean f=dao.deleteBooks(id);
	    	 
	    	 HttpSession session=req.getSession();
	    	 if(f) {
	    		 session.setAttribute("succMsg", "Book Delete Succesful");
	    		 resp.sendRedirect("admin/allbook.jsp");
	    	 }else {
	    		 session.setAttribute("failMsg", "Somethig wrong on server");
	    		 resp.sendRedirect("admin/allbook.jsp");
	    	 }

	     }catch(Exception e) {
	    	 e.printStackTrace();
	     }
	}


}
