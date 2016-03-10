package com.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.Interceptor.NotAllowAssistantInterceptor;
import com.Interceptor.teacherInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.model.Notice;
import com.model.beinguser;
import com.model.homeworkDescribtion;
import com.model.homeworkRecord;
import com.model.user;

@Before(teacherInterceptor.class)
public class teacherController extends Controller {
	public void teacherHome() {
		render("/teacher/teacherHome.jsp");
	}
	
	
	public void manageStudent() {
		List<beinguser> userlist = beinguser.me.find("select * from beinguser;");
		setAttr("studentlist", userlist);
		render("/teacher/manageStudent.jsp");
	}

	public void passStudent() {
		beinguser uBeinguser = beinguser.me.findFirst("select * from beinguser " + "where sno = " + getPara());
		user u = new user();
		u.set("username", uBeinguser.get("username"));
		u.set("passwords", uBeinguser.get("passwords"));
		u.set("rank", uBeinguser.get("rank"));
		u.set("email", uBeinguser.get("email"));
		u.set("sno", uBeinguser.get("sno"));
		u.save();
		uBeinguser.delete();
		manageStudent();
	}

	public void denyStudent() {
		beinguser uBeinguser = beinguser.me.findFirst("select * from beinguser " + "where sno = " + getPara());
		uBeinguser.delete();
		manageStudent();
	}

	@Before(NotAllowAssistantInterceptor.class)
	public void addAssitantview() {
		render("/teacher/addAssitantview.jsp");
	}

	@Before(NotAllowAssistantInterceptor.class)
	public void addAssistant() {
		user temp = new user();
		temp.set("username", getPara("userName"));
		temp.set("passwords", getPara("password"));
		temp.set("email", getPara("email"));
		temp.set("rank", 2);
		temp.set("sno", getPara("sno"));
		temp.save();
		user u = getSessionAttr("username");
		if ((int) (u.get("rank")) == 2) {
			render("/assistant/assistantHome.jsp");
		} else if ((int) (u.get("rank")) == 3) {
			render("/teacher/teacherHome.jsp");
		}
	}

	public void addNoticeview() {
		render("/teacher/addNotice.jsp");
	}

	public void addNotice() {
		// java.text.DateFormat format1 = new
		// java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss a",Locale.ENGLISH);
		// String s = format1.format(Calendar.getInstance().getTime());
		// System.out.println(s);
		user u = getSessionAttr("username");
		Notice notice = new Notice();
		notice.set("title", getPara("title"));
		notice.set("content", getPara("content"));
		notice.set("time", Calendar.getInstance().getTime());
		notice.set("releaser", u.get("username"));
		notice.set("id", notice.hashCode());
		notice.save();
		if ((int) (u.get("rank")) == 2) {
			render("/assistant/assistantHome.jsp");
		} else if ((int) (u.get("rank")) == 3) {
			render("/teacher/teacherHome.jsp");
		}
	}

	public void addHomeworkview() {
		render("/teacher/addHomework.jsp");
	}

	public void addHomework() {
		user u = getSessionAttr("username");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			homeworkDescribtion hDescribtion = new homeworkDescribtion();
			hDescribtion.set("title", getPara("title"));
			hDescribtion.set("content", getPara("content"));
			hDescribtion.set("releaser", u.get("username"));
			String date = getPara("date");
			String time = getPara("time");
			Date date1 = sdf.parse(date + " " + time);
			hDescribtion.set("deadline", date1);
			hDescribtion.set("id", hDescribtion.hashCode());
			hDescribtion.save();

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if ((int) (u.get("rank")) == 2) {
			render("/assistant/assistantHome.jsp");
		} else if ((int) (u.get("rank")) == 3) {
			render("/teacher/teacherHome.jsp");
		}
	}
	
	public void lookHomeworkview() {
		List<homeworkDescribtion> hList = homeworkDescribtion.me.find("select * from homework");
		Collections.reverse(hList);
		setAttr("homeworklist", hList);
		render("/teacher/lookHomeworkview.jsp");
	}
	
	public void studentHomework() {
		homeworkDescribtion hdDescribtion = homeworkDescribtion.me.findFirst("select * from homework where id = "+ getParaToInt());
		Date date = hdDescribtion.get("deadline");
		System.out.println(date);
		String query = "UNIX_TIMESTAMP('"+ date + "')";
		List<homeworkRecord> hRecords1 = homeworkRecord.me.find("select * from homeworkRecord where homeworkid = " + getParaToInt()
		+" and submittime <" + query);
		List<homeworkRecord> hRecords2 = homeworkRecord.me.find("select * from homeworkRecord where homeworkid = " + getParaToInt()
		+" and submittime >" + query);
		System.out.println(hRecords1.size() + " " + hRecords2.size());
		setAttr("homeworkRlist1", hRecords1);
		setAttr("homeworkRlist2", hRecords2);
//		List<homeworkRecord> hRecords1 = homeworkRecord.me.find("select * from homeworkRecord where homeworkid = " + getParaToInt());
//		setAttr("homeworkRlist1", hRecords1);
		render("/teacher/downloadStudentHomework.jsp");
	}
	
	public void downloadHomework() {
		homeworkRecord hRecord = homeworkRecord.me.findById(getParaToInt());
		renderFile(new File((String)(hRecord.getStr("savedir")) + hRecord.getStr("filename")));
	}
}
