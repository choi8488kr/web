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
	
	//����¡ �˻�, ���, 
	SimpleDateFormat sdf;
	Date dt;
	String pnum;//������ ��ȣ�� ���ڷ� �о����
	int pageNUM, pagecount; // ���ڷ� ��ȯ, �������� �� 
	int start, end;
	int startpage, endpage;
	int tmp; 
	
	String sqry="";//��������
	String skey="", sval="";// �˻��ʵ� , �˻�Ű����
	String returnpage="";//
	int Rrn, Rnum, Rsabun;
	String Rwriter, Rcontent;
	int Rcnt;
	
}
