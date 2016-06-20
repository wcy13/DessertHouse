package edu.nju.desserthouse.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.desserthouse.dao.BaseDao;
import edu.nju.desserthouse.dao.DessertDao;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.stavo.ProductSalesStaVO;

@Repository
public class DessertDaoImpl implements DessertDao{
	
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public void save(Dessert dessert) {
		try {
			baseDao.save(dessert);
		}catch (Exception e) {			
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		baseDao.delete(Dessert.class, id);
	}

	@Override
	public Dessert find(int id) {
		Dessert dessert = (Dessert)baseDao.load(Dessert.class, id);
		return dessert;
	}

	@Override
	public void updateByDessertId(Dessert dessert) {
		baseDao.update(dessert);
	}

	@Override
	public List<Dessert> getAllDessertList() {
		@SuppressWarnings("unchecked")
		List<Dessert> list = baseDao.getAllList(Dessert.class);
		return list;
	}

	@Override
	public List<Dessert> getCategoryRelatedDesserts(int pcid) {
		String sql = "SELECT * FROM dessert d where d.pcid= "+pcid+" ;";

		List<Object[]> objects = baseDao.querySQL(sql);
		List<Dessert> list = new ArrayList<Dessert>();
		for (Object[] obj : objects) {
			Dessert d = new Dessert();
			d.setDid((int) obj[0]);
			d.setName((String) obj[1]);
			d.setImage((String) obj[2]);
			d.setPcid((int) obj[3]);
			d.setPrice((double) obj[4]);
			list.add(d);
		}
		return list;
	}

	@Override
	public List<Dessert> getAllDessertListWithoutCake() {
		String sql = "select d.did,d.name,d.image,d.pcid,d.price "
				+ "from dessert d join productcategory pc on d.pcid=pc.pcid "
				+ "where pc.ppcid!=2";

		List<Object[]> objects = baseDao.querySQL(sql);
		List<Dessert> list = new ArrayList<Dessert>();
		for (Object[] obj : objects) {
			Dessert d = new Dessert();
			d.setDid((int) obj[0]);
			d.setName((String) obj[1]);
			d.setImage((String) obj[2]);
			d.setPcid((int) obj[3]);
			d.setPrice((double) obj[4]);
			list.add(d);
		}
		return list;
	}

}
