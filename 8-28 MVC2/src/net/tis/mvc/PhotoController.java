package net.tis.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tis.common.DB;
import net.tis.sql.GuestDTO;
import net.tis.sql.GuestSQL;

/**
 * Servlet implementation class PhotoController
 */
//@WebServlet("/PhotoController")
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhotoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet(1,2)");
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	//<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
		doUser(request,response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost(1,2)");
		doUser(request, response);
	}
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doUser(1,2)");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>PhotoController.java ¹®¼­ 11:45 </h1>");
		out.println("<img src = 'images/aaa.gif'>");
		out.println("<img src = 'images/aaa.gif'>");
		out.println("<img src = 'images/aaa.gif'>");
		out.println("<img src = 'images/aaa.gif'>");
		out.println("<img src = 'images/aaa.gif'>");
		
		String msg = "select count(*) as cnt from login where userid = ? and pwd = ?";
		GuestSQL gs = new GuestSQL();
		//ArrayList<GuestDTO> LG = gs.dbSelect();
		int Gtotal = gs.dbGtotal();
		//request.setAttribute("LG", LG);
		request.setAttribute("Gtotal", Gtotal);
		
		
		HttpSession hs = request.getSession();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
