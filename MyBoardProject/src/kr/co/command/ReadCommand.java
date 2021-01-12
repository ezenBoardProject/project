package kr.co.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.domain.MemberDAO;
import kr.co.ezen.MemberDTO;
import kr.co.util.CommandAction;

public class ReadCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String id = request.getParameter("id");
		
		MemberDTO dto = new MemberDAO().read(id);
		
		request.setAttribute("dto", dto);
		
		
		return new CommandAction(false, "read.jsp");
	}

}
