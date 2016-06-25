package edu.nju.desserthouse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.dao.OrderDao;
import edu.nju.desserthouse.model.Order;
import edu.nju.desserthouse.service.OrderService;

public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public void cancelOrder(int id) {
		orderDao.cancleOrder(id);
	}

	@Override
	public Order getOrder(int oid) {
		return orderDao.find(oid);
	}

}
