package kr.co.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.dao.BoardDAO;
import kr.co.dao.MemberDAO;
import kr.co.domain.BoardDTO;
import kr.co.domain.CommandAction;
import kr.co.domain.MemberDTO;
import kr.co.member.Command;

public class bd_ReadCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
				
			
		String sNum = request.getParameter("num");
		int num = 0;
		try {
			num = Integer.parseInt(sNum);
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
		}
		
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.bd_read(num);
		
		request.setAttribute("dto", dto);
				
		return new CommandAction(false, "bd_read.jsp");
	}

}