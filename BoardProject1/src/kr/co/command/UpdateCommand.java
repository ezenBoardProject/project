package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.dao.MemberDAO;
import kr.co.domain.CommandAction;
import kr.co.domain.MemberDTO;

public class UpdateCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, 
								HttpServletResponse response)
								throws IOException, ServletException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String date = request.getParameter("date");
		String sTel = request.getParameter("tel");
		int tel = Integer.parseInt(sTel);
		
		MemberDTO dto = new MemberDTO(id, name, email, pw, date, tel);
		
		MemberDAO dao = new MemberDAO();
		dao.update(dto);
		
		return new CommandAction(true, "read.do?id="+id);
	}

}
