package kr.co.boardcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;
import kr.co.domain.BoardDAO;
import kr.co.ezen.BoardDTO;
import kr.co.util.CommandAction;

public class BoardUpdateUICommand implements Command {

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

 		BoardDTO dto = new BoardDAO().updateui(num);

 		request.setAttribute("dto", dto);

 		return new CommandAction(false, "bd_update.jsp");
	}

}
