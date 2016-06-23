package edu.nju.desserthouse.action.hci;

import edu.nju.desserthouse.action.BaseAction;

public class ShopCartManageAction extends BaseAction{
	private String type;
	private int did;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	@Override
	public String execute() throws Exception {
		
		return "shopCartManage";
	}
	
}
