package mapper;

import java.util.List;
import java.util.Map;

import pojo.User;

public interface UserMapper {
	void add(User user);
	void delete(String uid);
	void updateUp(Map<String,Object> map);
	List<User> selectByUidAndUp(User user);
	void updateByUidAndTximg(User user);
	List<User> selectByUid(String uid);
	void updateByUarAndUpn(User user);
	List<User> select();
}
