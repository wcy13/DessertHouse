package edu.nju.desserthouse.dao;

import edu.nju.desserthouse.model.Cakediscription;

public interface CakediscriptionDao {
	/*
	 * 根据bcid查找Cakediscription对象,如果找到则返回这个对象,否则返回null
	 */
	public Cakediscription find(int id);
}
