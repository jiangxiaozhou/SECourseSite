package com.controller;

import javax.servlet.http.HttpSession;

import org.eclipse.jetty.server.Request;

import com.jfinal.core.Controller;
import com.model.user;

public class loginController extends Controller {
	
	public void index() {
//		String aString = getAttr("msg");
//		System.out.println(aString);
//		if (aString != null)
//			setAttr("msg", aString);
		render("login.jsp");
	}
	
	public void logout() {
		setSessionAttr("usermessage", null);
		render("index.jsp");
	}

	public void comfirm() {
		java.util.List<user> result = user.me.find("select * from user where username = \"" + getPara("userName") + "\""
				+ " and " + " passwords = \"" + getPara("password") + "\";");
		if (result.size() > 0) {
			setAttr("usermessage", result.get(0));
			setAttr("msg", "success");
			setSessionAttr("username", result.get(0));
			if ((int)(result.get(0).get("rank")) == 1) {
				render("/student/studentHome.jsp");
			}
			else if ((int)(result.get(0).get("rank")) == 3) {
				render("/teacher/teacherHome.jsp");
			}
			else {
				render("/assistant/assistantHome.jsp");
			}
		}
		else {
			setAttr("msg", "用户名或密码错误");
//			setAttr("msg", "error");
//			render("login.jsp");
//			renderHtml("<h1>Login Failed</h1>");
			render("login.jsp");
//			redirect("/login");
		}
	}
}
