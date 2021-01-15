package kr.co.boardcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.command.Command;
import kr.co.domain.BoardDAO;
import kr.co.domain.MemberDAO;
import kr.co.ezen.BoardDTO;
import kr.co.ezen.LoginDTO;
import kr.co.util.CommandAction;

public class BoardDeleteCommand implements Command {

   @Override
   public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
      
      BoardDTO dto = new BoardDTO();
      
      int num = 0;
      
      try {
         num = Integer.parseInt(request.getParameter("num"));
      } catch (NumberFormatException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      new BoardDAO().delete(num);

      return new CommandAction(true, "bd_list.do");
   }
}