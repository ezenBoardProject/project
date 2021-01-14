package kr.co.boardcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.command.Command;

import kr.co.domain.CommandAction;

public class Bd_DeleteCommnad implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sNum = request.getParameter("num");
		int num = Integer.parseInt(sNum);
		
		
		new BoardDAO().delete(num);
		
		
		return new CommandAction(true, "bd_list.do");
		
	}

}
