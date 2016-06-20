package edu.nju.desserthouse.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import edu.nju.desserthouse.dao.BaseDao;
import edu.nju.desserthouse.dao.UserDao;
import edu.nju.desserthouse.model.ShopClerk;
import edu.nju.desserthouse.model.User;
import edu.nju.desserthouse.model.stavo.DisProductStaVO;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public void save(User user) {
		try {
			baseDao.save(user);

		}catch (Exception e) {			
			e.printStackTrace();
		}
	}

	@Override
	public User find(int id) {
		User user = (User)baseDao.load(User.class, id);
		return user;
	}

	@Override
	public void updateByUserid(User user) {
		baseDao.update(user);
	}

	@Override
	public List<User> getAllUerList() {
		@SuppressWarnings("unchecked")
		List<User> list = baseDao.getAllList(User.class);
		return list;
	}

	@Override
	public void delete(int id) {
		baseDao.delete(User.class, id);
	}

	@Override
	public int validateUser(String tel, String pwd) {
		String sql = "SELECT count(id) FROM desserthouse.user where custel='"
				+ tel
				+ "' and pwd='"
				+ pwd
				+ "';";
		int result=  Integer.parseInt(baseDao.querySQL(sql).get(0).toString());
		//int result = (int) objects.get(0)[0];//count(id)的个数
		if(result>0){
			//通过验证，返回其id
			sql = "SELECT id FROM desserthouse.user where custel='"
					+ tel
					+ "' and pwd='"
					+ pwd
					+ "';";
			//objects = baseDao.querySQL(sql);
			int cid = (int) baseDao.querySQL(sql).get(0);
			return cid;
			
		}
		return 0;
	}

}
