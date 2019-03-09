package mapper;

import java.util.List;

import pojo.Purchase;

public interface PurchaseMapper {
		
	    public List<Purchase> selectByUid(String uid);
	    public void add(Purchase p);
	    public List<Purchase> selectByUidAndCid(Purchase p);
	    public void updatePsum(Purchase p);
	    public void delete(Purchase p);
}
