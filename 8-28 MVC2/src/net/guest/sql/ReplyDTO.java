package net.guest.sql;

public class ReplyDTO{ //리플=Data Transfer Object
	private int num ;
	private String writer;
	private String content;
	private int sabun; //guest테이블사번필드연결
	private int rrn; //댓글의 글번호 
	
	public int getRrn() { return rrn;	}
	public void setRrn(int rrn) {	this.rrn = rrn;	}
	//오.버=>source=>Generate Getter and Setter...
	
	public int getNum() {	return num;	}
	public void setNum(int num) {	this.num = num;	}
	public String getWriter() {	return writer;	}
	public void setWriter(String writer) {	this.writer = writer;	}
	public String getContent() {return content;	}
	public void setContent(String content) {	this.content = content;	}
	public int getSabun() {	return sabun;	}
	public void setSabun(int sabun) {	this.sabun = sabun;	}
}//ReplyDTO class END
