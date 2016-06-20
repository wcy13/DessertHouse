package edu.nju.desserthouse.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.dao.OrderDao;
import edu.nju.desserthouse.dao.OrderDetailDao;
import edu.nju.desserthouse.model.Order;
import edu.nju.desserthouse.model.hci.MyorderVO;
import edu.nju.desserthouse.model.hci.OrderDetailVO;
import edu.nju.desserthouse.service.MyorderService;

public class MyorderServiceImpl implements MyorderService{
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
	public MyorderVO getMyorderVO(int cid) {
		List<Order> orderList = orderDao.getMyOrderList(cid);
		HashMap<Integer,List<OrderDetailVO>> oodMap = new HashMap<Integer,List<OrderDetailVO>>();
		for(Order o:orderList){
			int oid = o.getOid();
			oodMap.put(oid, orderDetailDao.getAllOrderDetailList(oid));
		}
		MyorderVO movo = new MyorderVO(orderList,oodMap);
		return movo;
	}

}
