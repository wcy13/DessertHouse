package edu.nju.desserthouse.dao;

import java.util.List;

import edu.nju.desserthouse.model.OrderDetail;
import edu.nju.desserthouse.model.hci.OrderDetailVO;

public interface OrderDetailDao {
	/*
	 * 像数据库中插入一条OrderDetail
	 */
	public void save(OrderDetail orderDetail);
	
	/*
	 * 根据id查找OrderDetail对象,如果找到则返回这个对象,否则返回null
	 */
	public OrderDetail find(int id);
	
	/*
	 * 获得所有元组
	 */
	public List<OrderDetail> getAllOrderDetailList();
	/*
	 * 获得oid对应元组列表
	 */
	public List<OrderDetailVO> getAllOrderDetailList(int oid);
	
}
