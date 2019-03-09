package pojo;

import java.sql.Date;

public class Supply {
	Date sd;
	String stid;
	String cname;
	int sa;
	Supply(){
		
	}
	public Date getSd() {
		return sd;
	}
	public void setSd(Date sd) {
		this.sd = sd;
	}
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getSa() {
		return sa;
	}
	public void setSa(int sa) {
		this.sa = sa;
	}
	
}
