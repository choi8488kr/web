package net.tis.sql;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.tis.common.DB;
import java.text.SimpleDateFormat;

public class GuestSQL {
	  Connection CN ;
	  Statement ST ;
	  PreparedStatement PST;
	  CallableStatement CST;
	  ResultSet RS ;
	 
	  int Gsabun,Gpay, Ghit ;
	  int GGtotal; //전체레코드갯수
	  int Gtotal ; //조회레코드갯수
	  int GStotal=0 ; //Gtotal대신 GStotal사용도 좋습니다조회갯수
	 
	  String Gname,Gtitle, Gemail ;
	  java.util.Date Gwdate;
	 
	  String msg;
	  String submsg;
	  String Gdata;
	 
	  //댓글관련전역변수
	  int Rrn, Rnum, Rsabun ;
	  String Rwriter, Rcontent ;
	  int Rcnt ; //댓글갯수표시
	
	 //////////////////////////////////////////////////////
   public GuestSQL() {
  	 CN = DB.getConnection(); //08-25-화요일 다시 주석풀고 코드화
	 /*
  	 try {
  		Context ct = new InitialContext();
  		DataSource ds = (DataSource)ct.lookup("java:comp/env/jdbc/snow");
  		CN=ds.getConnection();  
  		System.out.println("dbcp  connection pool 연결성공성공 10:38  10:41 ");
  	}catch (Exception e){System.out.println("dbcp connection pool 연결에러:"+ e); 	}
    */
   }//end--------------------------------------------------------------------
   
  
   public void dbDelete( String data ) {
     try {
    	 //guestDelete.jsp문서 
       msg="delete  from guest where sabun =  " + data ;
       ST=CN.createStatement();
       ST.executeUpdate(msg);
       System.out.println(data + " 데이터 삭제처리 성공했습니다");
  	 }catch(Exception ex) { System.out.println("에러:" + ex);} 
   }//end--------------------------------------------------------------------
   
    
   public void dbInsert(GuestDTO dto) { //함수의중복=OverLoading=오버로딩
  	 try {
   		msg="insert into guest values(?,?,?,sysdate,?,0,?)";
   		PST = CN.prepareStatement(msg);
   			PST.setInt(1,  dto.getSabun());
   			PST.setString(2, dto.getName());
   			PST.setString(3, dto.getTitle());
   			PST.setInt(4, dto.getPay());
   			PST.setString(5, dto.getEmail());
   		PST.executeUpdate(); //진짜저장
   		System.out.println("GuestSQL자바문서 dbInsert(dto)함수  저장성공\n");
   	 }catch(Exception ex) { System.out.println("저장에러:" + ex);}
   }//end--------------------------------------------------------------------
   
   public void dbInsert(int s,String n, String t, int p, String e) { //2020-07-31-금요일
  	 try {
  		msg="insert into guest values(?,?,?,sysdate,?,0,?)";
  		PST = CN.prepareStatement(msg);
  			PST.setInt(1,  s);
  			PST.setString(2, n);
  			PST.setString(3, t);
  			PST.setInt(4, p);
  			PST.setString(5, e);
  		PST.executeUpdate(); //진짜저장
  		System.out.println("GuestSQL자바문서 dbInsert함수(s,n,t,p,e)  저장성공\n");
  	 }catch(Exception ex) { System.out.println("저장에러:" + ex);}
   }//end--------------------------------------------------------------------
   
   
 	public ArrayList<GuestDTO> dbSelect(int start, int end){
 		ArrayList<GuestDTO> list = new ArrayList<GuestDTO>();
		try {
			//msg="select rownum rn, g.* from guest  g";
			msg="select * from (select rownum rn, g.* from guest g) where rn between "+start+" and "+end;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			while(RS.next()==true) {
				GuestDTO dto = new GuestDTO();
				 dto.setRn(RS.getInt("rn"));
				 dto.setSabun(RS.getInt("sabun")); 
				 dto.setName(RS.getString("name"));
				 dto.setTitle(RS.getString("title"));
				 dto.setWdate(RS.getDate("wdate")) ;
				 dto.setPay(RS.getInt("pay"));
				 dto.setHit(RS.getInt("hit"));
				 dto.setEmail(RS.getString("email"));
				 list.add(dto);
			}
		}catch(Exception ex){System.out.println("조회에러:" + ex); }
		return list;
	}//end--------------------------------------------------------------------
 	
	public ArrayList<GuestDTO> dbSelect(int start, int end, String skey, String sval){ 
 		ArrayList<GuestDTO> list = new ArrayList<GuestDTO>();
 		String a="", b="", y="", c="";
		try {
		  a="select * from ( ";
		  b=" select rownum rn, g.*, (select count(*) from guestreply r where r.sabun=g.sabun ) as rcnt   from guest  g  where  "+skey +" like '%"+sval+"%'";     
		  c=") where rn between " + start + " and  " + end;
			
			msg = a+b+c ;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			while(RS.next()==true) {
				GuestDTO dto = new GuestDTO();
				 dto.setRn(RS.getInt("rn"));
				 dto.setSabun(RS.getInt("sabun")); 
				 dto.setName(RS.getString("name"));
				 dto.setTitle(RS.getString("title"));
				 dto.setWdate(RS.getDate("wdate")) ;
				 dto.setPay(RS.getInt("pay"));
				 dto.setHit(RS.getInt("hit"));
				 dto.setEmail(RS.getString("email"));
				 dto.setRcnt(RS.getInt("rcnt")); //추가
				 list.add(dto);
			}
		}catch(Exception ex){System.out.println("조회에러:" + ex); }
		return list;
	}
	public int guestAllTotalSearch(String skey, String sval) {
		 int count=0;
		 try {
			 msg="select count(*) as cnt from guest  where "+ skey+ " like '%"+sval+"%'" ;    
			 ST=CN.createStatement();
			 RS=ST.executeQuery(msg);
			 if(RS.next()==true) { count=RS.getInt("cnt");}
		 }catch(Exception ex) { }
		 return count;
	  }//end
	  
	  public int guestAllTotal() { //전체갯수
		int count=0;
		try {
		 msg="select count(*) as cnt from guest ";
		 ST=CN.createStatement();
		 RS=ST.executeQuery(msg);
		 if(RS.next()==true) { count=RS.getInt("cnt"); }
		}catch(Exception ex) { }
		return count;
	  }//end
 	//////////////////////////////////////////////////////////////////////////
  public int dbGtotal() {
 	 try {
 		 msg="select count(*) as cnt from guest ";
 		 ST = CN.createStatement();
 		 RS = ST.executeQuery(msg);
 		 if(RS.next()==true) { Gtotal= RS.getInt("cnt"); }
 		 //System.out.println("총갯수=" + Gtotal);
 	 }catch(Exception ex) { System.out.println("에러:" + ex);}
 	 return Gtotal;
  }//end--------------------------------------------------------------------
  
  public void dbTest() {//07-31-금요일 4:41분 생성
 	 try {
 		 int code=2400;
 		 String name="스프링";
 		 double point = 3.14;
 		 boolean gender=true;
 		 char grade='F' ; 
 		 //서로다른타입의 5개 데이터를 guestTest.jsp문서로 넘겨서 출력
 	 }catch(Exception ex) { System.out.println("에러:" + ex);}
  }//end--------------------------------------------------------------------
  
  
  
  public  GuestDTO  dbDetail( String Gdata) { //guestDetail.jsp문서연결
  	GuestDTO dto = new GuestDTO();
	 	 try {
	 		 msg="select * from guest where sabun =  " + Gdata ;
	     ST=CN.createStatement();
	     RS=ST.executeQuery(msg); //조회한 한건 결과를 RS기억
	     if(RS.next()==true) {
	    	 //dto.setRn(RS.getInt("rn")); 
				 dto.setSabun(RS.getInt("sabun")); 
				 dto.setName(RS.getString("name"));
				 dto.setTitle(RS.getString("title"));
				 dto.setWdate(RS.getDate("wdate")) ;
				 dto.setPay(RS.getInt("pay"));
				 dto.setHit(RS.getInt("hit"));
				 dto.setEmail(RS.getString("email"));
	     }
	 	 }catch(Exception ex) { System.out.println("에러:" + ex);}
 	 return dto;
  }//end--------------------------------------------------------------------
  public void dbEdit(GuestDTO dto) {
 	 try {
  		msg=" update guest set  name=?, title=?, wdate=sysdate, pay=?, email=?  where  sabun = ? ";
  		PST = CN.prepareStatement(msg);
  			PST.setString(1, dto.getName());
  			PST.setString(2, dto.getTitle());
  			PST.setInt(3, dto.getPay());
  			PST.setString(4, dto.getEmail());
  			PST.setInt(5,  dto.getSabun());
  		PST.executeUpdate(); //진짜수정update
  		System.out.println("GuestSQL자바문서 dbEdit(dto)함수  저장성공  08-26-수요일 점심시간이후");
  	 }catch(Exception ex) { System.out.println("저장에러:" + ex);}
 }//end--------------------------------------------------------------------
  
  
   public void test() {
  	 try {
  		 //String a = " select * from  ( ";
  		 //String b = " select rownum rn, a.*, (select count(*) from guestreply r where r.sabun=a.sabun ) as rcnt from ";
  		 //String y = " ( select * from guest " + sqry + " order by sabun) a ";
  		 //String c = " ) where rn  between " + start + " and  " + end;
  	 }catch(Exception ex) { System.out.println("에러:" + ex);}
   }//end--------------------------------------------------------------------
}//GuestSQL class END

