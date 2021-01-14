package kr.co.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.dao.BoardDAO;
import kr.co.domain.BoardDTO;
import kr.co.domain.CommandAction;
import kr.co.member.Command;

public class bd_UpdateUICommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String sNum = request.getParameter("num");
		int num = -1;
		try {
			num = Integer.parseInt(sNum);
		} catch (NumberFormatException e) {
			
			e.printStackTrace();
		}
		
		BoardDTO dto = new BoardDAO().bd_updateui(num);
		
		request.setAttribute("dto", dto);
		
		return new CommandAction(false, "bd_update.jsp");
	}
}
