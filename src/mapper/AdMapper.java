package mapper;
 
import java.util.List;
import java.util.Map;

import pojo.Ad;

public interface AdMapper {
	
    public List<Ad> select(Map<String,String> map);
    public void addByAnameAndAp(Ad ad);
    
}