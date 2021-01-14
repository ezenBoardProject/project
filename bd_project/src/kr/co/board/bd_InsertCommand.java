package kr.co.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.dao.BoardDAO;
import kr.co.domain.BoardDTO;
import kr.co.domain.CommandAction;
import kr.co.member.Command;

public class bd_InsertCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		BoardDTO dto = new BoardDTO(id, -1, title, content, null, 0, 0, 0, 0);
		
		BoardDAO dao = new BoardDAO();
		dao.insert(dto);
		
		return new CommandAction(true, "bd_list.do");
	}

}
