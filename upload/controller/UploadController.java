package ww.upload.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.*;

import jakarta.servlet.http.*;
import jakarta.persistence.*;
import ww.upload.model.*;
import ww.member.vo.*;
import ww.upload.vo.*;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;


@Controller
public class UploadController {
	@Autowired
	private JpaUploadRepository jpaUpload;
	@ResponseBody	
	@RequestMapping(value="/uploadListControl", method=RequestMethod.POST)
	
	public String uploadList(HttpServletRequest request) {
	
		String filename = request.getParameter("filename");
		System.out.println("UploadController.uploadlist.filname="+filename);
		String[] f_name = filename.split("/");
		String image = f_name[f_name.length-1];
		System.out.println("UploadController.uploadlist.image="+image);
		Upload upload = jpaUpload.getById(image);
		System.out.println("UploadController.uploadlist.upload="+upload);
		
		return upload.getI_text();
		
	}
	
	@ResponseBody	
	@RequestMapping(value="/uploadIdControl", method=RequestMethod.POST)
	
	public String uploadID(HttpServletRequest request) {
		
		String filename = request.getParameter("filename");
		System.out.println("UploadController.uploadlist.filname="+filename);
		String[] f_name = filename.split("/");
		String image = f_name[f_name.length-1];
		System.out.println("UploadController.uploadlist.image="+image);
		Upload upload = jpaUpload.getById(image);
		System.out.println("UploadController.uploadlist.upload="+upload);
		
		return upload.getId();
		
	}
	
	@ResponseBody	
	@RequestMapping(value="/uploadDayControl", method=RequestMethod.POST)
	
	public String uploadDate(HttpServletRequest request) {
		
		String filename = request.getParameter("filename");
		System.out.println("UploadController.uploadlist.filname="+filename);
		String[] f_name = filename.split("/");
		String image = f_name[f_name.length-1];
		System.out.println("UploadController.uploadlist.image="+image);
		Upload upload = jpaUpload.getById(image);
		System.out.println("UploadController.uploadlist.upload="+upload);
		
		return upload.getI_day();
		
	}
	
	@RequestMapping(value="/uploadControl", method=RequestMethod.POST)
	public ModelAndView upload(
			@RequestParam("product_image")MultipartFile multipartFile,Upload upload
			,HttpServletRequest request)throws Exception {
		System.out.println("multipartFile="+multipartFile);
		
		HttpSession session = request.getSession();
		Member login_member=(Member)session.getAttribute("login_member");
		String sid = login_member.getId();
		
		
		String file_real_path = request.getSession().getServletContext().getRealPath("/my_file");
		System.out.println("file_real_path="+file_real_path);
		
		
		String filename = multipartFile.getOriginalFilename();
		
		long Time = System.currentTimeMillis();
		System.out.println("Time="+Time);
		String file_id = Long.toString(Time);
		
		
		filename = file_id+"_"+filename;
		String copyLocation = file_real_path+"/"+filename;
		
		System.out.println("copyLocation="+copyLocation);
		System.out.println("multipartFile.getOriginalFilename()="+multipartFile.getOriginalFilename());
		
		//multipartFile.isEmpty() : 업로드 안했을때 true

		
		upload.setImage(filename);
		upload.setId(sid);
		
		System.out.println("upload="+upload);
		
		
		multipartFile.transferTo(new File(copyLocation));
		jpaUpload.save(upload);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.jsp");
		return mav;
		
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView uploadForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		return mav;
	}
	
	

}
