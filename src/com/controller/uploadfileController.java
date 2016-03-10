package com.controller;

import java.io.File;

import java.util.Calendar;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.upload.UploadFile;
import com.model.file;

public class uploadfileController extends Controller {

	public void index() {
//		List<file> filelist = file.me.find("select * from files;");
		render("/teacher/upload.jsp");
		
	}
	
	public void upload() {
		UploadFile uFile = getFile("file");
		file f = new file();
		f.set("filename", uFile.getFileName());
		f.set("uploadtime", Calendar.getInstance().getTime());
		f.save();
	}
	
	public void download() {
		PropKit.use("a_little_config.txt");
		renderFile(new File(PropKit.get("uploadURL") + getPara("filename")));
		System.out.println("hahsdh");
	}

}
