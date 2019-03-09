package service.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.AdMapper;
import pojo.Ad;
import service.AdService;

@Service("AdService")
public class AdServiceImpl implements AdService {
	@Autowired
	public AdMapper adMapper;
	AdServiceImpl(){
		
	}
	
	@Override
	public void addByAnameAndAp(Ad ad) {
			adMapper.addByAnameAndAp(ad);
	}

	@Override
	public List<Ad> select(String aname, String ap) {
			Map<String,String> map = new HashMap<>();
	        map.put("aname", aname);
	        map.put("ap", ap);
			return adMapper.select(map);
	}

}
