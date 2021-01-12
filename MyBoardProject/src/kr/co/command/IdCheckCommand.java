package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.domain.MemberDAO;
import kr.co.ezen.MemberDTO;
import kr.co.util.CommandAction;

public class IdCheckCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String id = request.getParameter("id");
		String msg = null;
		MemberDTO dto = new MemberDAO().idCheck(id);
		
		if (dto == null) {
			msg = "사용할 수 있는 ID입니다.";
		} else {
			msg = "이미 존재하는 ID입니다.";
		}
		
		request.setAttribute("msg", msg);
		
		return new CommandAction(false, "result.jsp");
	}

}
