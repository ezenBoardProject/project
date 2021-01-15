package kr.co.boardcommand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.BoardDAO;
import kr.co.ezen.BoardDTO;
import kr.co.util.CommandAction;

public class BoardMyListCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String id = request.getParameter("id");
		
		List<BoardDTO> myList = new BoardDAO().listById(id);
		
		request.setAttribute("myList", myList);
		
		return new CommandAction(false, "bd_mylist.jsp");
	}

}
