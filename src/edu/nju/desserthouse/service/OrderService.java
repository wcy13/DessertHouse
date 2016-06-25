package edu.nju.desserthouse.service;

import edu.nju.desserthouse.model.Order;

public interface OrderService {
	public void cancelOrder(int id) ;
	public Order getOrder(int oid);
}
