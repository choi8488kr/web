package net.tis.sql;

public class GuestDTO {
   private int sabun;
   private String name;
   private String title;
   private java.util.Date wdate;
   private int pay, hit;
   private String email;
   
   //행번호,cnt    java/java연결,jsp/java연결, java/서블릿연결
   private int rn,cnt;
   private int rcnt;

	public int getSabun() {	return sabun;}
	public void setSabun(int sabun) {	this.sabun = sabun;	}

	public String getName() {	return name;	}
	public void setName(String name) {this.name = name;	}

	public String getTitle() {	return title;	}
	public void setTitle(String title) {this.title = title;	}

	public java.util.Date getWdate() {return wdate;	}
	public void setWdate(java.util.Date wdate) {this.wdate = wdate;}

	public int getPay() {	return pay;	}
	public void setPay(int pay) {	this.pay = pay;	}

	public int getHit() {	return hit;}
	public void setHit(int hit) {	this.hit = hit;	}

	public String getEmail() {	return email;	}
	public void setEmail(String email) {	this.email = email;	}

	public int getRn() {return rn;	}
	public void setRn(int rn) {	this.rn = rn;	}

	public int getCnt() {	return cnt;	}
	public void setCnt(int cnt) {	this.cnt = cnt;	}
   
	public int getRcnt() {return rcnt;}  //댓글갯수
	public void setRcnt(int rcnt) {this.rcnt = rcnt;} 
}//class END








