package com.controller;

import java.io.File;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.Interceptor.studentInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.upload.UploadFile;
import com.model.Notice;
import com.model.homeworkDescribtion;
import com.model.homeworkRecord;
import com.model.user;

@Before(studentInterceptor.class)
public class studentController extends Controller{
	private String saveHomeworkDir;
	

	public void studentHome() {
		render("/student/studentHome.jsp");
	}
	
	
	public void studentInfo() {
		user u = getSessionAttr("username");
		setAttr("user", u);
		render("/student/studentInfo.jsp");
	}
	
	public void modifyInfo() {
		user u = getSessionAttr("username");
		String password1 = getPara("password");
		String password2 = getPara("password1");
		if (!password1.equals(password2)) {
			renderHtml("<h1>两次密码输出不一致</h1>");
		}
		else {
			u.set("passwords", password1);
			u.set("email", getPara("email"));
			u.update();
			render("/student/studentHome.jsp");
		}
	}
	
	public void downloadview() {
		render("/student/download.jsp");
	}
	
	public void lookNotice() {
		List<Notice> noticeList = Notice.me.find("select * from notice;");
		Collections.reverse(noticeList);
		setAttr("Noticelist", noticeList);
		render("/student/lookNotice.jsp");
	}
	
	public void noticeDetail() {
		int id = getParaToInt();
		Notice notice = Notice.me.findFirst("select * from notice where id = " + id);
		setAttr("notice", notice);
		render("/student/noticeDetail.jsp");
	}
	
	public void lookHomework() {
		List<homeworkDescribtion> hList = homeworkDescribtion.me.find("select * from homework");
		Collections.reverse(hList);
		setAttr("homeworklist", hList);
		render("/student/lookHomework.jsp");
	}
	
	public void homeworkDetail() {
		homeworkDescribtion hDescribtion = homeworkDescribtion.me.findById(getParaToInt());
		setAttr("homework", hDescribtion);
		setSessionAttr("homeworkUpload",hDescribtion);
		render("/student/homeworkDetail.jsp");
	}
	
	public void uploadHomework() {
//		homeworkDescribtion hDescribtion = getSessionAttr("homeworkUpload");
//		System.out.println("" + hDescribtion.get("id"));
		PropKit.use("a_little_config.txt");
		saveHomeworkDir = PropKit.get("homeworkURL") + getParaToInt() + "/";
		File file = new File(saveHomeworkDir);
		if (!file.exists()) {
			System.out.println("文件夹不存在");
			file.mkdirs();
		}
		user u = getSessionAttr("username");
		homeworkRecord hRecord = new homeworkRecord();
		hRecord.set("submittime", new Date());
		hRecord.set("homeworkid", getParaToInt());
		hRecord.set("savedir", saveHomeworkDir);
		hRecord.set("sno", u.get("sno"));
		UploadFile uploadFile = getFile("file", saveHomeworkDir);
		hRecord.set("filename", uploadFile.getFileName());
		hRecord.set("id", hRecord.hashCode());
		hRecord.save();
		renderHtml("<h1>Upload Homework success</h1>");
	}
}
