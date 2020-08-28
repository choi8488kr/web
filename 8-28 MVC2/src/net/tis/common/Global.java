package net.tis.common;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Global {
	Connection CN;
	Statement ST,ST1;
	PreparedStatement PST;
	CallableStatement CST;
	ResultSet RS,RS1;
	
	int Gsabun,Gpay,Gtotal, Ghit;
	int GGtotal =0;
	int RGtotal = 0;
	String Gname, Gtitle, Gemail;
	java.util.Date Gwdate;
	
	String msg;
	String submsg;
	String Gdata;
	
	//페이징 검색, 댓글, 
	SimpleDateFormat sdf;
	Date dt;
	String pnum;//페이지 번호를 문자로 읽어들임
	int pageNUM, pagecount; // 숫자로 변환, 총페이지 수 
	int start, end;
	int startpage, endpage;
	int tmp; 
	
	String sqry="";//서브쿼리
	String skey="", sval="";// 검색필드 , 검색키워드
	String returnpage="";//
	int Rrn, Rnum, Rsabun;
	String Rwriter, Rcontent;
	int Rcnt;
	
}
