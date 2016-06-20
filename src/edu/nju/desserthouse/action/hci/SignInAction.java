package edu.nju.desserthouse.action.hci;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.User;
import edu.nju.desserthouse.service.UserService;

public class SignInAction extends BaseAction{
	@Autowired
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Override
	public String execute() throws Exception {
		List<User> userList = userService.getAllUerList();
		List<String> telList = new ArrayList<String>();
		for(User u:userList){
			if(!u.getCustel().equals("0")){
				telList.add(u.getCustel());
			}
		}
		request.setAttribute("telList", telList);
		return "signIn";//是否需要判断之前是哪个页面来返回？
	}
	
}
