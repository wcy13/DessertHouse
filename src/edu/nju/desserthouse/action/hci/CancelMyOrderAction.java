package edu.nju.desserthouse.action.hci;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Member;
import edu.nju.desserthouse.model.Order;
import edu.nju.desserthouse.service.MemberService;
import edu.nju.desserthouse.service.OrderService;

public class CancelMyOrderAction extends BaseAction {
	@Autowired
	private MemberService memberService;
	private OrderService orderService;
	private String oid;



	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}


	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@Override
	public String execute() throws Exception {
		int oidInt = Integer.valueOf(oid);
		//取消订单 并获得该订单详细信息
		System.out.println("oidInt:"+oidInt);
		orderService.cancelOrder(oidInt);
		Order sr = orderService.getOrder(oidInt);
		//把会员对应的积分去掉 账户余额加上
		Member m = memberService.findMemberById(sr.getCid());
		m.setBalance(m.getBalance()+sr.getRealTotal());
		m.setCredit(m.getCredit()-sr.getRealTotal());
		memberService.updateMember(m);
		
		return "myorder";

	}
}
