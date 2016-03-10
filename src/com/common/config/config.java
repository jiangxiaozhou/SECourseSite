package com.common.config;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.model.Notice;
import com.model.beinguser;
import com.model.file;
import com.model.homeworkDescribtion;
import com.model.homeworkRecord;
import com.model.user;
import com.controller.indexController;
import com.controller.loginController;
import com.controller.registerController;
import com.controller.studentController;
import com.controller.teacherController;
import com.controller.uploadfileController;

 
public class config extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		PropKit.use("a_little_config.txt");				// 加载少量必要配置，随后可用PropKit.get(...)获取值
		me.setDevMode(PropKit.getBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
		me.setUploadedFileSaveDirectory(PropKit.get("uploadURL"));
		me.setFileRenderPath(PropKit.get("uploadURL"));
	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		me.add("/", indexController.class);
		me.add("/login", loginController.class, "/");
		me.add("/register", registerController.class, "/");
		me.add("/upload", uploadfileController.class, "/teacher");
		me.add("/student", studentController.class, "/student");
		me.add("/teacher", teacherController.class, "/teacher");
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
		me.add(c3p0Plugin);
		
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		arp.addMapping("user", "sno", user.class);	
		arp.addMapping("files", "filename", file.class);
		arp.addMapping("beinguser", "sno", beinguser.class);
		arp.addMapping("notice", "id", Notice.class);
		arp.addMapping("homework", "id", homeworkDescribtion.class);
		arp.addMapping("homeworkRecord", "id", homeworkRecord.class);
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		
	}
	
	public static void main(String[] args) {
		JFinal.start("WebContent", 8080, "/", 5);
	}
}
