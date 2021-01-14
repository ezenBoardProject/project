package kr.co.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board.bd_InsertCommand;
import kr.co.board.bd_InsertUICommand;
import kr.co.board.bd_ListCommand;
import kr.co.board.bd_ReadCommand;
import kr.co.board.bd_UpdateCommand;
import kr.co.board.bd_UpdateUICommand;
import kr.co.domain.CommandAction;
import kr.co.member.Command;
import kr.co.member.DeleteCommand;
import kr.co.member.FindIdCommand;
import kr.co.member.FindPWCommand;
import kr.co.member.FindUICommand;
import kr.co.member.InsertCommand;
import kr.co.member.InsertUICommand;
import kr.co.member.ListCommand;
import kr.co.member.LoginCommand;
import kr.co.member.LoginUICommand;
import kr.co.member.LogoutCommand;
import kr.co.member.ReadCommand;
import kr.co.member.UpdateCommand;
import kr.co.member.UpdateUICommand;

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
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String sp = uri.substring(cPath.length());
		Command com = null;
		
		if(sp.equalsIgnoreCase("/insertui.do")) {
			com = new InsertUICommand();
		}else if(sp.equalsIgnoreCase("/insert.do")) {
			com = new InsertCommand();
		}else if(sp.equalsIgnoreCase("/list.do")) {
			com = new ListCommand();
		}else if(sp.equalsIgnoreCase("/read.do")) {
			com = new ReadCommand();
		}else if(sp.equalsIgnoreCase("/updateui.do")) {
			com = new UpdateUICommand();
		}else if(sp.equalsIgnoreCase("/update.do")) {
			com = new UpdateCommand();
		}else if(sp.equalsIgnoreCase("/delete.do")) {
			com = new DeleteCommand();
		}else if (sp.equalsIgnoreCase("/findui.do")) {
			com = new FindUICommand();
		}else if (sp.equalsIgnoreCase("/findid.do")) {
			com = new FindIdCommand();
		}else if (sp.equalsIgnoreCase("/findpw.do")) {
			com = new FindPWCommand();
		}else if (sp.equalsIgnoreCase("/loginui.do")) {
			com = new LoginUICommand();
		}else if (sp.equalsIgnoreCase("/login.do")) {
			com = new LoginCommand();
		}else if (sp.equalsIgnoreCase("/logout.do")) {
			com = new LogoutCommand();
		}else if (sp.equalsIgnoreCase("/bd_read.do")) {
			com = new bd_ReadCommand();
		}else if (sp.equalsIgnoreCase("/bd_updateui.do")) {
			com = new bd_UpdateUICommand();
		}else if (sp.equalsIgnoreCase("/bd_update.do")) {
			com = new bd_UpdateCommand();
		}else if (sp.equalsIgnoreCase("/bd_list.do")) {
			com = new bd_ListCommand();
		}else if (sp.equalsIgnoreCase("/bd_mylist.do")) {
			com = new bd_ListCommand();
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
