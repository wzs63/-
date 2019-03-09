package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.PurchaseMapper;
import pojo.Purchase;
import service.PurchaseService;

@Service("PurchaseService")
public class PurchaseServiceImpl implements PurchaseService{

		@Autowired
		public  PurchaseMapper purchaseMapper;
		PurchaseServiceImpl(){
			
		}
		@Override
		public List<Purchase> selectByUid(String uid) {
			
			return purchaseMapper.selectByUid(uid);
		}
		@Override
		public void add(Purchase p) {
			purchaseMapper.add(p);
		}
		@Override
		public List<Purchase> selectByUidAndCid(Purchase p) {
			return purchaseMapper.selectByUidAndCid(p);
		}
		@Override
		public void updatePsum(Purchase p) {
			purchaseMapper.updatePsum(p);
		}
		@Override
		public void delete(Purchase p) {
			purchaseMapper.delete(p);
		}
		

	}
