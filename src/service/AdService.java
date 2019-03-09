package service;

import java.util.List;

import pojo.Ad;

public interface AdService {

	List<Ad> select(String aname, String ap);
	void addByAnameAndAp(Ad ad);
}
