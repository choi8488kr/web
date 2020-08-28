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

import net.tis.sql.GuestDTO;
import net.tis.sql.GuestSQL;


@WebServlet("/gdelete.do")
public class GuestDeleteController extends HttpServlet {
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
		out.println("<h2>GuestDetailController.java</h2>");
		
		
		String Gdata = request.getParameter("idx");
		GuestSQL gs = new GuestSQL();	
		gs.dbDelete(Gdata);
		
		response.sendRedirect("glist.do");
		//request.setAttribute("dto", dto);

		
//		RequestDispatcher는 데이터 자원을 보낼문서를 명명		
//		RequestDispatcher dis = request.getRequestDispatcher("guestDetail.jsp");
//		dis.forward(request, response);
		
		
	}

}
