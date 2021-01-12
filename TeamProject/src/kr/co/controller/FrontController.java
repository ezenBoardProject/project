package kr.co.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.command.FindIdCommand;
import kr.co.command.FindUICommand;
import kr.co.domain.CommandAction;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
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
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String sp = uri.substring(cPath.length());
		Command com = null;
		
		if(sp.equalsIgnoreCase("/insertui.do")) {
			
		}else if(sp.equalsIgnoreCase("/insert.do")) {
			
		}else if(sp.equalsIgnoreCase("/list.do")) {
			
		}else if(sp.equalsIgnoreCase("/read.do")) {
			
		}else if(sp.equalsIgnoreCase("/updateui.do")) {
			
		}else if(sp.equalsIgnoreCase("/update.do")) {
			
		}else if(sp.equalsIgnoreCase("/delete.do")) {
			
		}else if(sp.equalsIgnoreCase("/search.do")) {
			
		}else if(sp.equalsIgnoreCase("/replyui.do")) {
			
		}else if(sp.equalsIgnoreCase("/reply.do")) {
			
		}else if (sp.equalsIgnoreCase("/findui.do")) {
			com = new FindUICommand();
		}else if (sp.equalsIgnoreCase("/find_id.do")) {
			com = new FindIdCommand();
		}
		
		if(com != null) {
			CommandAction action = com.execute(request, response);
			
			if(action.isRedirect()) {
				response.sendRedirect(action.getWhere());
			}else {
				request.getRequestDispatcher(action.getWhere())
				.forward(request, response);
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
