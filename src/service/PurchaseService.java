package service;

import java.util.List;

import pojo.Purchase;

public interface PurchaseService {
	
		List<Purchase> selectByUid(String uid);
		void add(Purchase p);
		List<Purchase> selectByUidAndCid(Purchase p);
		void updatePsum(Purchase p);
		public void delete(Purchase p);
}
