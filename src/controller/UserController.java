package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiPanelUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.serializer.FilterUtils;

import pojo.Ad;
import pojo.User;
import service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	
	@RequestMapping("login.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("islogincg", 1);
		mav.setViewName("login");
		
		return mav;
	}
	@RequestMapping("loginwc.do")
	public ModelAndView loginwc(User user,HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		System.out.println(user.getUid());
		System.out.println(user.getUp());
		if(userService.isCanLogin(user)) {
			req.getSession().setAttribute("uid", user.getUid());
			String tximg = userService.selectByUid(user.getUid()).getTximg();
			req.getSession().setAttribute("tximg", tximg);
			System.out.println(tximg);
			if(userService.isStore(user)) {
				req.getSession().setAttribute("isStore", 1);
			}else {
				req.getSession().setAttribute("isStore", 0);
			}
			req.getSession().setAttribute("tximg", "mrtx.png");
			mav.setViewName("welcome");
			
		}else {
			mav.addObject("islogincg", 0);
			System.out.println("登录失败");
			mav.setViewName("login");
		}
		return mav;
	}
	@RequestMapping("register.do")
	public ModelAndView register(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register");
		return mav;
	}
	@RequestMapping("registerwc.do")
	public ModelAndView registerwc(User user,HttpServletRequest res,HttpServletResponse resp){
		//user自动填写了已经
		ModelAndView mav = new ModelAndView();
		System.out.println(user.getUid());
		System.out.println(user.getUp());
		userService.add(user);
		mav.setViewName("login");
		return mav;
		
	}
	@RequestMapping("welcome.do")
	public ModelAndView welcome() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("welcome");
		return mav;
	}
	@RequestMapping("uploadImage.do")
    public ModelAndView upload(HttpServletRequest request,HttpSession session, MultipartFile file)
            throws IllegalStateException, IOException {
		System.out.println(file.getName());
		ModelAndView mav = new ModelAndView("welcome");
		if(!file.isEmpty()) {
        String name = System.currentTimeMillis()+"";
        String newFileName = name + ".jpg";
        File newFile = new File("F:\\apache-tomcat-9.0.14\\image", newFileName);
        //File newFile = new File("F:\\eclipse-workspace\\sjkdzy\\WebContent\\image", newFileName);
        newFile.getParentFile().mkdirs();
        file.transferTo(newFile);
       
        User user=new User();
        user.setUid(session.getAttribute("uid").toString());
        user.setTximg(newFileName);
        userService.changetximg(user);
        System.out.println(newFileName);
        request.getSession().setAttribute("tximg", newFileName);
		}
		
        return mav;
    }
	@RequestMapping("cwsj.do")
	public ModelAndView cwsj() {
		ModelAndView mav = new ModelAndView("cwsj"); 
		return mav;
	}
	@RequestMapping("cwsjwc.do")
	public ModelAndView cwsjwc(@RequestParam String uar,@RequestParam String upn,HttpSession session) {
		System.out.println(uar);
		System.out.println(upn);
		ModelAndView mav = new ModelAndView("welcome");
		User user = new User();
		user.setUid(session.getAttribute("uid").toString());
		user.setUar(uar);
		user.setUpn(upn);
		userService.updateByUarAndUpn(user);
		session.setAttribute("isStore", 1);
		return mav;
	}
	
	@RequestMapping("zhuye.do")
	public ModelAndView zhuye() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("welcome");
		return mav;
	}
	@RequestMapping("userxx.do")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
	public Map<String,Object> userxx(@RequestParam(value="uid")String uid){
		System.out.println(uid);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		String[] result = new String[3];
		result[0]=userService.selectByUid(uid).getUar();
		result[1]=userService.selectByUid(uid).getUpn();//upn是QQ，，梅星星建的数据库真的是恼火哦，，每次都得猜，猜不准又得打开数据库分析，
		//有时间数据库表名都改一下，，不过那事情就多了啊啊啊，
		resultMap.put("result", result);
		return resultMap;
	}

	@RequestMapping("zhsz.do")
	public ModelAndView zhsz() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("zhsz");
		return mav;
	}
	@RequestMapping("xgpassword.do")
	public ModelAndView xgpassword(@RequestParam(value="oldPassword")String oldPassword,@RequestParam(value="newPassword")String newPassword,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String uid = (String)session.getAttribute("uid");
		System.out.println(uid);
		System.out.println("oldPassword:"+oldPassword);
		System.out.println("really:"+userService.selectByUid(uid).getUp());
		if(userService.selectByUid(uid).getUp().equals(oldPassword)) {
			System.out.println("对了");
			userService.updateUp(newPassword, uid);
			mav.setViewName("welcome");
			
		}else {
			
			System.out.println("旧密码不对");
			mav.addObject("xgpwMassage","旧密码不对");
			mav.setViewName("zhsz");
		}
		return mav;
	}
	
	@RequestMapping("zhuxiao.do")
	public ModelAndView zhuxiao(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("uid");
		mav.setViewName("welcome");
		return mav;
	}
	
	
}
