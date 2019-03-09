package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.CommodityMapper;
import pojo.Ad;
import pojo.Commodity;
import pojo.Purchase;
import service.CommodityService;
@Service("CommodityService")
public class CommodityServiceImpl implements CommodityService{

	@Autowired
	CommodityMapper commodityMapper;
	@Override
	public void add(Commodity c) {
		commodityMapper.add(c);
	}

	
	@Override
	public List<Commodity> selectAll() {
		return commodityMapper.selectAll();
	}


	@Override
	public List<Commodity> selectByUid(String uid) {
		return commodityMapper.selectByUid(uid);
		
	}
	public List<Commodity> selectByType(int type){
		return commodityMapper.selectByType(type);
	}
	public List<Commodity> selectByLikeCname(String part,int first){
		Map<String,Object> map = new HashMap<>();
		map.put("part", part);
		map.put("first", first);
		return commodityMapper.selectByLikeCname(map);
	}
	public List<Commodity> selectByCid(int cid){
		return commodityMapper.selectByCid(cid);
	}

	@Override
	public List<Commodity> selectByYeShu(int type, int first) {
		Map<String,Integer> map = new HashMap<>();
		map.put("type", type);
		map.put("first", first);
		return commodityMapper.selectByYeShu(map);
	}
	@Override
	public void delete(int cid) {
		commodityMapper.delete(cid);
	}


	@Override
	public void updateCs(int cs, int cid) {
		Map<String,Integer> map = new HashMap<>();
        map.put("cs", cs);
        map.put("cid", cid);
		commodityMapper.updateCs(map);
	}
	
}
