package edu.nju.desserthouse.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.desserthouse.dao.BaseDao;
import edu.nju.desserthouse.dao.OrderDetailDao;
import edu.nju.desserthouse.model.OrderDetail;
import edu.nju.desserthouse.model.hci.OrderDetailVO;
@Repository
public class OrderDetailDaoImpl implements OrderDetailDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void save(OrderDetail orderDetail) {
		try {
			baseDao.save(orderDetail);
		}catch (Exception e) {			
			e.printStackTrace();
		}
	}

	@Override
	public OrderDetail find(int id) {
		OrderDetail orderDetail = (OrderDetail)baseDao.load(OrderDetail.class, id);
		return orderDetail;
	}

	@Override
	public List<OrderDetail> getAllOrderDetailList() {
		@SuppressWarnings("unchecked")
		List<OrderDetail> list = baseDao.getAllList(OrderDetail.class);
		return list;
	}

	@Override
	public List<OrderDetailVO> getAllOrderDetailList(int oid) {
		String sql = "SELECT od.odid,od.oid,od.did,od.price,od.amount,od.discription,d.name,d.image FROM desserthouse.orderdetail od join dessert d on od.did=d.did where od.oid="+oid;

		List<Object[]> objects = baseDao.querySQL(sql);
		List<OrderDetailVO> list = new ArrayList<OrderDetailVO>();
		for (Object[] obj : objects) {
			OrderDetailVO od = new OrderDetailVO();
			od.setOdid((int) obj[0]);
			od.setOid((int)obj[1]);
			od.setDid((int) obj[2]);
			od.setPrice((double) obj[3]);
			od.setAmount((int) obj[4]);
			od.setDiscription((String) obj[5]);
			od.setDname((String) obj[6]);
			od.setImage((String) obj[7]);
			list.add(od);
		}
		return list;
	}
}
