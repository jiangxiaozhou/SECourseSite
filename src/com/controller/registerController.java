package com.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.model.beinguser;
import com.model.user;

public class registerController extends Controller{
	public void index() {
//		setAttr("username", getPara("userName"));
//		setAttr("password", getPara("password"));
		render("register.jsp");
	}
	
	public void add() {
//		setAttr("username", getPara("userName"));
//		setAttr("password", getPara("password"));
		beinguser temp = new beinguser();
		temp.set("username", getPara("userName"));
		temp.set("passwords", getPara("password"));
		temp.set("email", getPara("email"));
		temp.set("rank", 1);
		temp.set("sno", getPara("sno"));
		List<user> userlist = user.me.find("select * from user where username = \"" + getPara("userName") + "\""
				+ " or " + " sno = \"" + getPara("sno") + "\";");
		if (userlist.size() > 0) {
			setAttr("msg", "Your username or studentNo have already used!");
			render("register.jsp");
		}
		else {
			temp.save();
//			setAttr("msg", "");
			render("index.jsp");
		}
	}
}
