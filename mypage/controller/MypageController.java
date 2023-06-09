package ww.mypage.controller;

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
import java.util.List;
@Controller
public class MypageController {
	@Autowired
	private JpaUploadRepository jpaUpload;
	@RequestMapping(value = "/myPageControl", method = RequestMethod.GET)
	public ModelAndView myList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member login_member = (Member) session.getAttribute("login_member");
		String sid = login_member.getId();
		System.out.println(sid);
		List<Upload> list = jpaUpload.findByUserId(sid);
		System.out.println(list);
		List<String> i_list = new ArrayList<>();
		for (Upload upload : list) {
			String image = upload.getImage();
			i_list.add(image);
			System.out.println(i_list);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage.jsp");
		mav.addObject("image", i_list);
		System.out.println(i_list);
		return mav;
	}
	@RequestMapping(value = "/deleteMypageControl", method = RequestMethod.GET)
	public ModelAndView deleteBook(HttpServletRequest request) {
		String image = request.getParameter("filename");
		System.out.println("image =" + image);
		jpaUpload.deleteById(image);
		String file_real_path = request.getSession().getServletContext().getRealPath("/my_file");
		File fileToDelete = new File(file_real_path, image);
		if (fileToDelete.exists()) {
			if (fileToDelete.delete()) {
				System.out.println("파일이 성공적으로 삭제되었습니다.");
			} else {
				System.out.println("파일 삭제에 실패했습니다.");
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage.jsp");
		return mav;
	}
}