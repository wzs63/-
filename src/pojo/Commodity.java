package pojo;

import java.sql.Date;

/**
create table commodity #商品
( cid 	 int(11) auto_increment primary key,#商品号
  cname varchar(20) not null ,#商品名	主码
  cs    integer     not null,#库存量
  cp    integer     not null,#单价
  uid varchar(20) ,
  type int 
);  


 * @author wzs
 *
 */
public class Commodity {
	int cid;
	String cname;
	int cs;
	int cp;
	String uid;
	int type;
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Commodity(){
		
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
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCs() {
		return cs;
	}
	public void setCs(int cs) {
		this.cs = cs;
	}
	public int getCp() {
		return cp;
	}
	public void setCp(int cp) {
		this.cp = cp;
	}
	
}
