package edu.nju.desserthouse.service.impl;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.dao.OrderDao;
import edu.nju.desserthouse.dao.OrderDetailDao;
import edu.nju.desserthouse.model.Order;
import edu.nju.desserthouse.model.OrderDetail;
import edu.nju.desserthouse.service.OrderService;

public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	private OrderDetailDao orderDetailDao;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}


	public OrderDetailDao getOrderDetailDao() {
		return orderDetailDao;
	}

	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}

	@Override
	public void cancelOrder(int id) {
		orderDao.cancleOrder(id);
	}

	@Override
	public Order getOrder(int oid) {
		return orderDao.find(oid);
	}

	@Override
	public int saveOnlineOrder(int sid, double total, double realTotal, int cid, String dm,String seat) {
		int oid = orderDao.getMaxOid()+1;
		Order o = new Order();
		o.setOid(oid);
		o.setSid(sid);
		o.setScid(0);
		Timestamp salesTime = new Timestamp(System.currentTimeMillis());
		o.setOrderTime(salesTime);
		o.setTotal(total);
		o.setRealTotal(realTotal);
		o.setIsOnline(1);
		java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
		o.setTakeDate(currentDate);
		o.setTakeTime("Á¢¿Ì");
		o.setIsValid(1);
		o.setCid(cid);
		o.setDiscountMessage(dm);
		o.setSeat(seat);
		o.setVerification(0);
		orderDao.save(o);
		return oid;
	}

	@Override
	public void save(OrderDetail od) {
		orderDetailDao.save(od);
	}

}
