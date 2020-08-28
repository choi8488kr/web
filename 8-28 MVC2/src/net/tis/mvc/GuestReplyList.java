package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.guest.sql.ReplyDTO;
import net.guest.sql.ReplySQL;



@WebServlet("/greplyList.do")
public class GuestReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
		
	}
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h2>GuestReplyList.java</h2>");
		
		ReplyDTO rdto = new ReplyDTO();
		ReplySQL rgs = new ReplySQL();

		int rsabun = Integer.parseInt(request.getParameter("idx"));
		int Rtotal = rgs.dbReplyCount(rsabun);
		ArrayList<ReplyDTO> rLG = rgs.dbReplySelect(rsabun);
		request.setAttribute("rLG", rLG);
		request.setAttribute("rsabun", rsabun);
		request.setAttribute("Rtotal", Rtotal);
		//GuestSQL gs = new GuestSQL();	
		
		
		//response.sendRedirect("glist.do");
		//request.setAttribute("dto", dto);

		
//		RequestDispatcher는 데이터 자원을 보낼문서를 명명		
		RequestDispatcher dis = request.getRequestDispatcher("guestDetail.jsp");
		dis.forward(request, response);
		
		
	}

}
