package edu.nju.desserthouse.action.hci;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.service.DessertService;

public class TestAction extends BaseAction{
	@Override
	public String execute() throws Exception {
		
		return "test";
	}
	
}
