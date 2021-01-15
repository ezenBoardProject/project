package kr.co.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.dao.MemberDAO;
import kr.co.domain.CommandAction;
import kr.co.domain.MemberDTO;

public class InsertCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String sTel = request.getParameter("tel");
		int tel = 0;
		try {
			tel = Integer.parseInt(sTel);
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
		}

		MemberDTO dto = new MemberDTO(id, name, email, pw, birth, tel);

		MemberDAO dao  = new MemberDAO();
		dao.insert(dto);





		return new CommandAction(true, "login.jsp");
	}

}
