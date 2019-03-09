package util;

import java.util.List;

public class Page<T> {

    int first;      // 开始数据
 

	int count;      // 每一页的数量
    int total;      // 总共的数据量
    private List<T> list;//当前页的数据
    public Page() {
    	
    }
    public Page(int first, int count) {
 		super();
 		this.first = first;
 		this.count = count;
 	}
    public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

    public boolean isHasPreviouse(){
        if(first==0)
            return false;
        return true;

    }
    public boolean isHasNext(){
        if(first==getLast())
            return false;
        return true;
    }

    public int getTotalPage(){
        int totalPage;
        // 假设总数是50，是能够被5整除的，那么就有10页
        if (0 == total % count)
            totalPage = total /count;
            // 假设总数是51，不能够被5整除的，那么就有11页
        else
            totalPage = total / count + 1;

        if(0==totalPage)
            totalPage = 1;
        return totalPage;

    }

    public int getLast(){
        int last;
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是40
        if (0 == total % count)
            last = total - count;
            // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else
            last = total - total % count;

        last = last<0?0:last;
        return last;
    }

	public int getfirst() {
		return first;
	}

	public void setfirst(int first) {
		this.first = first;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

    // 各种 setter 和 getter
}