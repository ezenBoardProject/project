package kr.co.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.dao.MemberDAO;
import kr.co.dao.MemberDTO;

public class InsertCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String sTel = request.getParameter("tel");
		int tel = 0;
		try {
			tel = Integer.parseInt(sTel);
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
		}
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id, name, email, pw, birth, tel);
		
		dao.insert(dto);
		
		
		
		return new CommandAction(true, "list.do");
	}

}
