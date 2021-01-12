package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.dao.MemberDAO;
import kr.co.domain.CommandAction;
import kr.co.domain.MemberDTO;

public class FindIdCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = new MemberDAO().findId(name, email);
		System.out.println(id);
		if (id == null) {
			return new CommandAction(true, "find.jsp");
		}
		HttpSession session=request.getSession();
		session.setAttribute("id", id);
		
		return new CommandAction(false, "findid.jsp");
	}

}
