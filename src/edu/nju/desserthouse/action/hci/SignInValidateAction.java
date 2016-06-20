package edu.nju.desserthouse.action.hci;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Member;
import edu.nju.desserthouse.model.User;
import edu.nju.desserthouse.service.MemberService;
import edu.nju.desserthouse.service.UserService;

public class SignInValidateAction extends BaseAction{
	@Autowired
	private UserService userService;
	private MemberService memberService;
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute() throws Exception {
		//判断是否为空
		String tel = request.getParameter("tel");
		String password = request.getParameter("password");
		password = encryption(password);
		int cid = userService.validateUser(tel, password);
		System.out.println(cid);
		if(cid==0){
			//给request增加手机号和手机号列表
			request.setAttribute("tel", tel);
			List<User> userList = userService.getAllUerList();
			List<String> telList = new ArrayList<String>();
			for(User u:userList){
				if(!u.getCustel().equals("0")){
					telList.add(u.getCustel());
				}
			}
			request.setAttribute("telList", telList);
			return "wrongPassword";
		}else{
			Member m = memberService.findMemberById(cid);
			HttpSession session = request.getSession(true);
			session.setAttribute("memberInfo", m);
			return "index";
		}
	}
	
	/*
	 * 计算密码的md5值
	 */
	 private String encryption(String plainText) {
	        String re_md5 = new String();
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            md.update(plainText.getBytes());
	            byte b[] = md.digest();
	 
	            int i;
	 
	            StringBuffer buf = new StringBuffer("");
	            for (int offset = 0; offset < b.length; offset++) {
	                i = b[offset];
	                if (i < 0)
	                    i += 256;
	                if (i < 16)
	                    buf.append("0");
	                buf.append(Integer.toHexString(i));
	            }
	 
	            re_md5 = buf.toString();
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return re_md5;
	    }

	
}
