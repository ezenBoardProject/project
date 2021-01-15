package kr.co.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.domain.CommandAction;

public interface bd_Command {
	
	CommandAction execute(HttpServletRequest request,
			HttpServletResponse response)
			throws IOException, ServletException;

}
