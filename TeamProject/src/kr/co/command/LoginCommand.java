package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.dao.MemberDAO;
import kr.co.util.LoginDTO;

public class LoginCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		LoginDTO loginDTO = new LoginDTO();

		loginDTO.setId(id);
		loginDTO.setPw(pw);

		MemberDAO dao = new MemberDAO();

		LoginDTO login = dao.login(loginDTO);

		HttpSession session = request.getSession();

		session.setAttribute("login", login);

		return new CommandAction(true, "read.do?id="+id);
	}

}
