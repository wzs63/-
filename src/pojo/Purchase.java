package pojo;

import java.sql.Date;

public class Purchase {
	int psum;
	String uid;
	int cid;
	int jiage;
	public int getJiage() {
		return jiage;
	}
	public void setJiage(int jiage) {
		this.jiage = jiage;
	}
	public int getPsum() {
		return psum;
	}
	public void setPsum(int psum) {
		this.psum = psum;
	}
	String cname;
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Purchase(){
		
	}

	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
}
