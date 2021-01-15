package kr.co.boardcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.BoardDAO;
import kr.co.ezen.BoardDTO;
import kr.co.util.CommandAction;

public class BoardInsertCommand implements Command {

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
