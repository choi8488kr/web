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


@WebServlet("/glist.do")
public class GuestListController extends HttpServlet {
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
		out.println("<h2>GuestListController.java</h2>");
		
		GuestDTO dto = new GuestDTO();
		GuestSQL gs = new GuestSQL();	
		
		String pnum;
		int pageNUM, pagecount;
		int start, end;
		int startpage, endpage;
		int tmp;
		
		String sqry=" ";
		String skey="", sval="";
		String returnpage="";
		
	
		
		skey = request.getParameter("keyfield");
    sval = request.getParameter("keyword");
    if(skey=="" || skey==null || sval=="" || sval==null) {
        skey="name"; 
   	 sval="";
    }
		
    returnpage="&keyfield="+skey+"&keyword="+sval;
    
		pnum = request.getParameter("pageNum");//14
		if(pnum==null||pnum=="") { pnum="1";}
		
		pageNUM=Integer.parseInt(pnum);
		start = (pageNUM-1)*10+1;//131
		end = pageNUM*10;//140
		
		tmp=(pageNUM-1)%10;
		startpage=pageNUM-tmp;//11
		endpage=startpage+9;//20
		
		int Gtotal = gs.guestAllTotalSearch(skey, sval); 
    int Atotal = gs.guestAllTotal( );  
		
		if(Gtotal%10==0) {pagecount=Gtotal/10;}
		else {pagecount = (Gtotal/10)+1;}
		
		if(endpage>pagecount) {endpage=pagecount;}
			
		
		//ArrayList<GuestDTO> LG = gs.dbSelect();
		ArrayList<GuestDTO> LG = gs.dbSelect(start,end,skey,sval);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("LG", LG);
		request.setAttribute("Gtotal", Gtotal);
		request.setAttribute("Atotal", Atotal);
		request.setAttribute("pageNUM", pageNUM);
		
		request.setAttribute("returnpage", returnpage);
    request.setAttribute("skey", skey);
    request.setAttribute("sval", sval);
    
		
//		RequestDispatcher는 데이터 자원을 보낼문서를 명명		
		RequestDispatcher dis = request.getRequestDispatcher("guestList.jsp");
		dis.forward(request, response);
		
		
	}

}
