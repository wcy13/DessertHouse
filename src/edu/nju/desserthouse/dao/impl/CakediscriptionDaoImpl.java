package edu.nju.desserthouse.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.dao.BaseDao;
import edu.nju.desserthouse.dao.CakediscriptionDao;
import edu.nju.desserthouse.model.Cakediscription;

public class CakediscriptionDaoImpl implements CakediscriptionDao{

	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public Cakediscription find(int id) {
		Cakediscription cd = (Cakediscription)baseDao.load(Cakediscription.class, id);
		return cd;
	}

}
