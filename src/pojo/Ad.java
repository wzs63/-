package pojo;
/**

 * @author wzs
 * 
 */
public class Ad {
	String aname;
	String ap;
	public Ad(){
		
	}
	
	public Ad(String aname, String ap) {
		super();
		this.aname = aname;
		this.ap = ap;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAp() {
		return ap;
	}
	public void setAp(String ap) {
		this.ap = ap;
	}
	
}
