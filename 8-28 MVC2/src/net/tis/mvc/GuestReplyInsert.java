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
import net.tis.sql.GuestDTO;
import net.tis.sql.GuestSQL;


@WebServlet("/greplyInsert.do")
public class GuestReplyInsert extends HttpServlet {
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
		out.println("<h2>GuestReplyInsert.java</h2>");
		int sabun =Integer.parseInt(request.getParameter("sabun"));
		String writer=request.getParameter("writer");
		String content =request.getParameter("content");
		
		ReplySQL rgs=new ReplySQL();
		
		rgs.dbReplyInsert(writer, content, sabun);
		
		response.sendRedirect("gdetail.do?idx="+sabun);

		//request.setAttribute("dto", dto);

		
//		RequestDispatcher�� ������ �ڿ��� ���������� ����		
//		RequestDispatcher dis = request.getRequestDispatcher("guestDetail.jsp");
//		dis.forward(request, response);
		
		
	}

}