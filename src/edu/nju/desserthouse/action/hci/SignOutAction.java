package edu.nju.desserthouse.action.hci;

import javax.servlet.http.HttpSession;

import edu.nju.desserthouse.action.BaseAction;

public class SignOutAction extends BaseAction{
	@Override
	public String execute() throws Exception {
		HttpSession session = request.getSession(true);
		session.removeAttribute("memberInfo");
		session.removeAttribute("cart");
		session.removeAttribute("sid");
		session.removeAttribute("sname");
		session.removeAttribute("disname");
		return "index";
	}
	
}
