package kr.co.boardcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.BoardDAO;
import kr.co.ezen.BoardDTO;
import kr.co.util.CommandAction;

public class BoardContentReadCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String id = request.getParameter("id");
		
		BoardDTO dto = new BoardDAO().read(id);
		
		request.setAttribute("dto", dto);
		
		return new CommandAction(false, "bd_read.jsp");
	}

}
