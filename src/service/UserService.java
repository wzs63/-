package service;

import java.util.List;

import pojo.User;

public interface UserService {
	void add(User user);
	void delete(String uid);
	void updateUp(String up,String uid);
	boolean isCanLogin(User user);
	boolean isStore(User user);
	void changetximg(User user);
	User selectByUid(String uid);
	void updateByUarAndUpn(User user);
	List<User> select();
	String getSaltByUid(String uid);
}
