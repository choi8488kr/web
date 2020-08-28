package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter; //추가
import java.util.ArrayList;

import javax.servlet.RequestDispatcher; //추가
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.sql.GuestDTO; //추가
import net.tis.sql.GuestSQL; //추가


@WebServlet("/geditpre.do")
public class  GuestEditPreController  extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doUser(request,response);	 //필수
  }//end

  public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  doUser(request,response);	//필수
  }//end
  
  public  void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 response.setContentType("text/html; charset=UTF-8");
	 System.out.println("<h2>수정전 데이터출력 GuestEditPreController.java단독실행금지</h2>");     
   String Gdata = request.getParameter("idx");
   GuestSQL gs = new GuestSQL( );
   GuestDTO dto = gs.dbDetail(Gdata);
   
   request.setAttribute("dto", dto);
   
  RequestDispatcher dis = request.getRequestDispatcher("guestEdit.jsp");
  dis.forward(request, response);
  }//end
  
}//class END







