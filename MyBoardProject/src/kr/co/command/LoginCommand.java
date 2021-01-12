package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.domain.MemberDAO;
import kr.co.ezen.LoginDTO;
import kr.co.util.CommandAction;

public class LoginCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
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
