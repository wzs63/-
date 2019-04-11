package service.impl;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.UserMapper;
import pojo.User;
import service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	@Override
	public void add(User user) {
		Random random = new SecureRandom();
		System.out.println();
		String salt=new BigInteger(130, random).toString(32);
		userMapper.add(user);
	}

	@Override
	public void delete(String uid) {
		userMapper.delete(uid);
	}

	@Override
	public void updateUp(String up,String uid) {
		Map<String,Object> map=new HashMap<>();
		map.put("up", up);
		map.put("uid", uid);
		userMapper.updateUp(map);	
	}

	@Override
	public boolean isCanLogin(User user) {
		return (userMapper.selectByUidAndUp(user).size())==0?false:true;
	}
	@Override
	public boolean isStore(User user) {
		if(isCanLogin(user)) {
			return (userMapper.selectByUidAndUp(user).get(0).getCors()==0)?false:true;
		}
		return false;
	}
	@Override
	public void changetximg(User user) {
		userMapper.updateByUidAndTximg(user);
	}

	@Override
	public User selectByUid(String uid) {
		return userMapper.selectByUid(uid).get(0);
	}

	@Override
	public void updateByUarAndUpn(User user) {
		
		userMapper.updateByUarAndUpn(user);
	}

	@Override
	public List<User> select() {
		
		return userMapper.select();
	}

	@Override
	public String getSaltByUid(String uid) {
		
		return userMapper.selectSaltByUid(uid);
	}


}
