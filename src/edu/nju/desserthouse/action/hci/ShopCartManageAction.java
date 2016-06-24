package edu.nju.desserthouse.action.hci;

import javax.servlet.http.HttpSession;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.hci.DessertItem;
import edu.nju.desserthouse.model.hci.ShoppingCart;

public class ShopCartManageAction extends BaseAction{
	private String did;
	private String name;
	private String image;
	private String price;
	private int count;
	private String type;
	
	
	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String execute() throws Exception {
		if(type.equals("addItem")){
			System.out.println("excute开始：id: "+did + " name: "+ name + " count: " + count +" price:"+price+" img:"+image);
			DessertItem d = new DessertItem();
			d.setDid(Integer.parseInt(did));
			d.setName(name);
			d.setImage(image);
			d.setPrice(Double.parseDouble(price));
			//DessertItem d = new DessertItem(Integer.parseInt(did), name, image, Integer.parseInt(pcid), Double.parseDouble(price), discription);
			System.out.println("d 创建");
			HttpSession session = request.getSession(true);
			System.out.println("session 获取");
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
			System.out.println("cart = " + cart);
			if(cart == null)
			{
				cart = new ShoppingCart();
			}
			cart.add(d , Integer.valueOf(count));
			session.setAttribute("cart", cart);
			String s = cart.show();
			System.out.println(s);
			return "bread";
		}
		else if(type.indexOf("addItem") > -1)
		{
			
			String arr[] = type.split("-");
			int m = Integer.parseInt(arr[1]);
			String j = arr[2];
			System.out.println("addItemCake excute开始：id: "+did + " name: "+ name + " count: " + count +" price:"+price+" img:"+image + " m: "+m + " j: "+j);
			DessertItem d = new DessertItem();
			price += 100 *(m - 1);
			d.setDid(Integer.parseInt(did));
			d.setName(name);
			d.setImage(image);
			d.setPrice(Double.parseDouble(price));
			d.setMount(m);
			d.setJ(j);
			d.setCake(true);
			
			HttpSession session = request.getSession(true);
			System.out.println("session 获取");
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
			System.out.println("cart = " + cart);
			if(cart == null)
			{
				cart = new ShoppingCart();
			}
			cart.add(d , Integer.valueOf(count));
			session.setAttribute("cart", cart);
			String s = cart.show();
			System.out.println(s);
			return "bread";
		}
		return "bread";
	}
}
