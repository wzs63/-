package mapper;

import java.util.List;
import java.util.Map;

import pojo.Commodity;
import pojo.Purchase;

public interface CommodityMapper {
	void add(Commodity c);
	List<Commodity> selectAll();
	List<Commodity> selectByUid(String uid);
	List<Commodity> selectByType(int type);
	List<Commodity> selectByLikeCname(Map<String, Object> map);
	List<Commodity> selectByCid(int cid);
	List<Commodity> selectByYeShu(Map<String, Integer> map);
	void delete(int cid);
	void updateCs(Map<String,Integer> map);
}
