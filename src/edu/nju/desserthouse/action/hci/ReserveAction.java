package edu.nju.desserthouse.action.hci;

import java.util.Enumeration;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Member;
import edu.nju.desserthouse.model.OrderDetail;
import edu.nju.desserthouse.model.hci.DessertItem;
import edu.nju.desserthouse.model.hci.ShopItem;
import edu.nju.desserthouse.model.hci.ShoppingCart;
import edu.nju.desserthouse.service.MemberService;
import edu.nju.desserthouse.service.OrderService;

public class ReserveAction extends BaseAction {
	@Autowired
	private MemberService memberService;
	private OrderService orderService;
	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@Override
	public String execute() throws Exception {
		System.out.println("reserve begin");
		Enumeration<String> es = request.getParameterNames();
		String s;
		while(es.hasMoreElements()){
			 s = es.nextElement();
			System.out.println(s+":"+request.getAttribute(s));
		}
		HttpSession session = request.getSession(true);
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		cart.remove();
		session.setAttribute("cart", cart);
		return "index";

	}
}
