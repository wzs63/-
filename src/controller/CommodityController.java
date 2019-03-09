package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pojo.Commodity;
import pojo.Purchase;
import service.CommodityService;
import util.Page;

@Controller
public class CommodityController {
	@Autowired
	CommodityService commodityService;
	@RequestMapping("sc")
	public ModelAndView sc() {
		ModelAndView mav = new ModelAndView("sc");
		return mav;
	}
	@RequestMapping("scwc")
	public ModelAndView scwc(Commodity c,HttpSession session) {
		System.out.println(c.getCname());
		ModelAndView mav = new ModelAndView("welcome");
		c.setUid(session.getAttribute("uid").toString());
		commodityService.add(c);
		return mav;
	}
	@RequestMapping("listAll")
	public ModelAndView listAll() {
		ModelAndView mav = new ModelAndView("listsc");
		mav.addObject("listsc", commodityService.selectAll());//List<Commodity>
		return mav;
	}
	@RequestMapping("listsc")
	public ModelAndView listsc(HttpSession session) {
		ModelAndView mav = new ModelAndView("mysc");
		mav.addObject("listsc", commodityService.selectByUid(session.getAttribute("uid").toString()));//List<Commodity>
		return mav;
	}
	@RequestMapping("sportslist.do")
	public ModelAndView sportslist(int first) {
		
		ModelAndView mav = new ModelAndView("listsc");
		Page<Commodity> page = new Page<Commodity>(first,10);
		
		List<Commodity> list = commodityService.selectByYeShu(1,first);
		page.setList(list);
		mav.addObject("page",page);//List<Commodity>
		return mav;
	}
//	@RequestMapping("sportslistFenYe.do")
//	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
//	public Map<String,Object> sportslistFenYe(int first,int type) {
//		Map<String,Object> resultMap = new HashMap<>();
//		Page<Commodity> page = new Page<Commodity>(1,10);
//		List<Commodity> list = commodityService.selectByYeShu(type,first);
//		page.setList(list);
//		resultMap.put("page", page);
//		return resultMap;
//	}

	@RequestMapping("zspslist.do")
	public ModelAndView zspslist(int first) {
		ModelAndView mav = new ModelAndView("listsc");
		Page<Commodity> page = new Page<Commodity>(first,10);
		List<Commodity> list = commodityService.selectByYeShu(2,first);
		page.setList(list);
		mav.addObject("page",page);
		return mav;
	}
	@RequestMapping("bookslist.do")
	public ModelAndView bookslist(int first) {
		ModelAndView mav = new ModelAndView("listsc");
		Page<Commodity> page = new Page<Commodity>(first,10);
		List<Commodity> list = commodityService.selectByYeShu(3,first);
		page.setList(list);
		mav.addObject("page",page);
		return mav;
	}
	@RequestMapping("search.do")
	public ModelAndView search(String part,int first,HttpSession session) {
		
		System.out.println(part);
		if(part==null) {
			part=(String) session.getAttribute("part");
		}else {
			session.setAttribute("part", part);
		}
		Page<Commodity> page = new Page<Commodity>(-100,10);
		List<Commodity> list = commodityService.selectByLikeCname(part,first);
		ModelAndView mav = new ModelAndView("listsc");
		page.setList(list);
		mav.addObject("page",page);
		return mav;
	}
	
	
}	
