package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pojo.Ad;
import pojo.Commodity;
import pojo.Purchase;
import service.AdService;
import service.CommodityService;
import service.PurchaseService;

@Controller
public class PurchaseController {

	@Autowired
	PurchaseService purchaseService;

	@RequestMapping("gwc.do")
	public ModelAndView gwc(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String uid = session.getAttribute("uid").toString();

		System.out.println(uid);
		List<Purchase> purchaseList = purchaseService.selectByUid(uid);
	
		mav.addObject("purchaseList",purchaseList );
		mav.setViewName("gwc");
		return mav;
	}
	@Autowired
	CommodityService commodityService;
	@RequestMapping("addpurchase.do")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
	public Map<String,Object> addpurchase(int cid,String cname,int cp,HttpSession session){
		System.out.println(cid+"");
		Map<String,Object> resultMap = new HashMap<String, Object>();

		Purchase p = new Purchase();
		p.setCid(cid);p.setCname(cname);p.setJiage(cp);p.setUid(session.getAttribute("uid").toString());p.setPsum(1);
		if(purchaseService.selectByUidAndCid(p).size()>0) {
			p.setPsum((purchaseService.selectByUidAndCid(p).get(0).getPsum()+1));
			System.out.println("size>0le");
			purchaseService.updatePsum(p);
					
		}
		else {
			purchaseService.add(p);
		}
		resultMap.put("result", "操作成功");
		return resultMap;
	}
	@RequestMapping("buy.do")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
	public Map<String,Object> buy(@RequestParam(value="cids[]")Integer[] cids,@RequestParam(value="jiages[]")Integer[] jiages,@RequestParam(value="psums[]")Integer[] psums,
			@RequestParam(value="really")int really, HttpSession session){
		System.out.println(cids[0]+" "+jiages[0]+" "+ psums[0]);
		//List<Commodity> commoditys = commodityService.selectByCid(cid);
		int price=0;
		for(int i=0;i<=cids.length-1;i++) {
			price+=jiages[i]*psums[i];
		}
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", price);
		if(really==1) {//真的是要买哦
			String result="";
			for(int i=0;i<=cids.length-1;i++) {
				List<Commodity> list = commodityService.selectByCid(cids[i]);
				if(list.size()==0) {
					result+="第"+i+"个没了T^T\n";
				}else if(psums[i]>list.get(0).getCs()) {//不够了
					result+="第"+i+"个不够了，只有"+list.get(0).getCs()+"个了T^T\n";
				}else {//这个可以买
					Purchase p=new Purchase();p.setCid(cids[i]);
					String uid = session.getAttribute("uid").toString();
					p.setUid(uid);
					purchaseService.delete(p);
					commodityService.updateCs(list.get(0).getCs()-psums[i], cids[i]);   
				}
			}
			if(result.length()==0) {
				result+="全部购买成功";
			}
			resultMap.put("result", result);
		}
		return resultMap;
//		ModelAndView mav = new ModelAndView();
//		System.out.println(jiage);
//		if(commodityService.selectByCid(cid).size()==0) {
//			mav.addObject("message","没了" );
//			mav.setViewName("baochuo"); 
//			return mav;
//		}
//		Purchase p=new Purchase();p.setCid(cid);
//		String uid = session.getAttribute("uid").toString();
//		p.setUid(uid);
//		purchaseService.delete(p);
//		commodityService.delete(cid);
//		mav.addObject("message","购买成功" );
//		mav.setViewName("baochuo");
//		return mav;
	}

}
