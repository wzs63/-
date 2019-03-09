package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pojo.Ad;
import pojo.Commodity;
import pojo.User;
import service.AdService;
import service.UserService;
import util.Page;


// 告诉spring mvc这是一个控制器类
@Controller
public class AdController {
	@Autowired
	AdService adService;
	@Autowired
	UserService userService;
	@RequestMapping("adlogin.do")
	public ModelAndView adlogin(){

		ModelAndView mav = new ModelAndView();
		mav.addObject("islogincg", 1);
		mav.setViewName("adlogin");
		
		return mav;
	}
	@RequestMapping("adloginwc.do")
	public ModelAndView adloginwc(@RequestParam(value="uid")String aname,@RequestParam(value="up")String ap,HttpSession session){

		ModelAndView mav = new ModelAndView();
		System.out.println(aname);
		System.out.println(ap);
	   if( adService.select(aname, ap).size()!=0) {
		   System.out.println("登录成功");
		   
			List<User> list = userService.select();
			session.setAttribute("list",list);	
		   
		mav.setViewName("adwelcome");
		return mav;
		
	   }
	   else {
		   //登录失败
		   mav.addObject("islogincg", 0);
		   System.out.println("登录失败");
		   mav.setViewName("adlogin");
		   return mav;
	   }
	}

	@RequestMapping("deleteuser.do")
	public ModelAndView deleteuser(String uid,HttpSession session){

		ModelAndView mav = new ModelAndView();
		System.out.println("shcu");
		userService.delete(uid);
		List<User> list = userService.select();
		session.setAttribute("list",list);	
		mav.setViewName("adwelcome");
	   return mav;
	}
	
}
