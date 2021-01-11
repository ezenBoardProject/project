package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.domain.MemberDAO;
import kr.co.ezen.MemberDTO;
import kr.co.util.CommandAction;

public class UpdateUICommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			return new CommandAction(true, "loginui.do");
		}
		
		
		String id = request.getParameter("id");
		
		MemberDTO dto = new MemberDAO().updateui(id);
		request.setAttribute("dto", dto);
		
		return new CommandAction(false, "update.jsp");
	}

}
