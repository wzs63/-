package service;

import java.util.List;

import pojo.Commodity;
import pojo.Purchase;

public interface CommodityService {
	void add(Commodity c);
	List<Commodity> selectAll();
	List<Commodity> selectByUid(String uid);
	List<Commodity> selectByType(int type);
	List<Commodity> selectByLikeCname(String part,int first);
	List<Commodity> selectByCid(int cid);
	List<Commodity> selectByYeShu(int type,int first);
	void delete(int cid);
	void updateCs(int cs,int cid);
}
