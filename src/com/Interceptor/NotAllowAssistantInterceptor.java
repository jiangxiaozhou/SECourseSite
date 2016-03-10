package com.Interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.model.user;

public class NotAllowAssistantInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		// TODO Auto-generated method stub
		Controller controller = inv.getController();
		user u = controller.getSessionAttr("username");
		if (u == null) {
			controller.renderHtml("<h1>Please login first!</h1>");
		}
		else if ((int)(u.get("rank")) != 3) {
			controller.renderHtml("<h1>Access denied!</h1>");
		}
		inv.invoke();
	}

}
