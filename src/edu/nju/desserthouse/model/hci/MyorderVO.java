package edu.nju.desserthouse.model.hci;

import java.util.HashMap;
import java.util.List;

import edu.nju.desserthouse.model.Order;
import edu.nju.desserthouse.model.OrderDetail;

public class MyorderVO {
	public List<Order> orderList;
	public HashMap<Integer,List<OrderDetailVO>> oodMap;//keyΪoid
	
	public MyorderVO(){}

	public MyorderVO(List<Order> orderList, HashMap<Integer, List<OrderDetailVO>> oodMap) {
		super();
		this.orderList = orderList;
		this.oodMap = oodMap;
	}
	
	
	
}
