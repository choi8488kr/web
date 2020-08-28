package net.guest.sql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import net.tis.common.DB;

public class ReplySQL {
	Connection CN ;
  Statement ST ;
  PreparedStatement PST;
  CallableStatement CST;
  ResultSet RS ;
  String msg;
  public ReplySQL() {
  	CN=DB.getConnection();
  }
  public int dbReplyCount(int Rdata) {
  	int count=0;
  	try {
  		msg="select count(*) as rcnt from guestreply where sabun="+Rdata;
  		ST=CN.createStatement();
  		RS=ST.executeQuery(msg);
  		if(RS.next()==true) { count=RS.getInt("rcnt");}
  		
  	}catch(Exception e) {System.out.println(e);}
  	return count;
  }
  public ArrayList<ReplyDTO> dbReplySelect(int Rdata){
  	ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
  	try {
  		StringBuffer sb = new StringBuffer();
  		sb.append("select rownum rn, g.sabun, r.num, r.writer,r.content from guest g ");
  		sb.append("inner join guestreply r ");
  		sb.append("on g.sabun = r.sabun ");
  		sb.append("and r.sabun = "+Rdata);
  		ST=CN.createStatement();
  		RS=ST.executeQuery(sb.toString());
  		while(RS.next()) {
  			ReplyDTO rdto = new ReplyDTO();
  				rdto.setRrn(RS.getInt("rn"));
  				rdto.setNum(RS.getInt("num"));
  				rdto.setWriter(RS.getString("writer"));
  				rdto.setContent(RS.getString("content"));
  				rdto.setSabun(RS.getInt("sabun"));
  				list.add(rdto);
  		}
  	}catch(Exception e) {System.out.println("dbreplyselect 오류"+e);}
  	return list;
  }
  public void dbReplyInsert(String writer, String content, int sabun) {
  	try {
  	msg= "insert into guestreply values(guestreply_seq.nextval,?,?,?)";
		PST=CN.prepareStatement(msg);
  	PST.setString(1, writer);
  	PST.setString(2, content);
  	PST.setInt(3, sabun);
    PST.executeUpdate();
  	}catch(Exception e) {System.out.println("replyinsert 에러"+e);}
  }
  public void dbReplyUpdate(int num, String writer, String content, int sabun) {
  	try {
  		msg="update guestreply set writer=?,content=? where num="+num;
  		PST=CN.prepareStatement(msg);
    	PST.setString(1, writer);
    	PST.setString(2, content);
    	PST.executeUpdate();
  	}catch(Exception e) {System.out.println("dbreplyupdate 에러"+e);}
  }
  
}//class END
