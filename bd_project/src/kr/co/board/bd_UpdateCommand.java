package kr.co.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.dao.BoardDAO;
import kr.co.domain.BoardDTO;
import kr.co.domain.CommandAction;
import kr.co.member.Command;

public class bd_UpdateCommand implements Command {

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

		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDTO dto = new BoardDTO(id, num, title, content, null, -1, -1, -1, -1);
		
		new BoardDAO().bd_update(dto);
		
		return new CommandAction(true, "bd_list.do");
	}

}
