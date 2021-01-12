package kr.co.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.command.CommandAction;
import kr.co.command.InsertCommand;
import kr.co.command.InsertUICommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html;charset=utf-8");

	      String uri = request.getRequestURI();
	      String cPath = request.getContextPath();
	      String sp = uri.substring(cPath.length());

	      Command com = null;

	      if (sp.equalsIgnoreCase("/insertui.do")) {
	         com = new InsertUICommand();
	      } else if (sp.equalsIgnoreCase("/insert.do")) {
	         com = new InsertCommand();
	      } 
	      
	      
	      if (com != null) {

	         CommandAction action = com.execute(request, response);

	         if (action.isRedirect()) {
	            response.sendRedirect(action.getWhere());
	         } else {
	            RequestDispatcher dis = request.getRequestDispatcher(action.getWhere());
	            dis.forward(request, response);
	         }

	      } 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
