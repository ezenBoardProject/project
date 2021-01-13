package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.dao.MemberDAO;
import kr.co.domain.CommandAction;
import kr.co.domain.LoginDTO;

public class LoginCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setId(id);
		loginDTO.setPw(pw);
		
		MemberDAO dao = new MemberDAO();
		LoginDTO  login= dao.login(loginDTO);
		boolean check = dao.loginCheck(loginDTO);
		HttpSession session = request.getSession();
		
		if (check) {
			session.setAttribute("login", login);
		} else {
			return new CommandAction(true, "loginui.do");
		} 
		
		return new CommandAction(true, "list.do");
	}

}
