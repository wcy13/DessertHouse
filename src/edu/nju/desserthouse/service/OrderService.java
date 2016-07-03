package edu.nju.desserthouse.service;

import edu.nju.desserthouse.model.Order;
import edu.nju.desserthouse.model.OrderDetail;

public interface OrderService {
	public void cancelOrder(int id) ;
	public Order getOrder(int oid);
	public int saveOnlineOrder(int sid,double total,double realTotal,int cid,String dm,String seat);//·µ»Øoid
	public void save(OrderDetail od);
}
