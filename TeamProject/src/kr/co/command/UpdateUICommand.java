package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.util.LoginDTO;
import kr.co.dao.MemberDAO;
import kr.co.dao.MemberDTO;


public class UpdateUICommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session == null) {
			return new CommandAction(true, "loginui.do");
		}

		LoginDTO login = (LoginDTO) session.getAttribute("login");

		if (login == null) {
			return new CommandAction(true, "loginui.do");
		}

		String id = request.getParameter("id");

		if (!id.equals(login.getId())) {
			return new CommandAction(true, "loginui.do");
		}

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.updateui(id);

		request.setAttribute("dto", dto);

		return new CommandAction(false, "update.jsp");
	}

}
