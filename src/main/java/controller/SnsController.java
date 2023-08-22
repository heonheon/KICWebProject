package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import model.Heart;
import model.SnsComment;
import model.SnsContent;
import service.HeartMybatis;
import service.SnsMybatis;
import service.UserMybatis;

@Controller
@RequestMapping("/sns/")
public class SnsController {

	@Autowired
	UserMybatis UserDao;
	
	@Autowired
	SnsMybatis snsDao;
	
	@Autowired
	HeartMybatis heartDao;
	
	Model model;
	
	HttpSession session;
	
	HttpServletRequest request;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model model) {
		this.request = request;
		this.model = model;
		session = request.getSession();
	}

	@RequestMapping("snsContent")
	public String snsContent(@SessionAttribute(value = "id", required = false) String userId, 
			@RequestParam(value = "id", required = false) String searchUserId,
			@RequestParam(value = "snsDate", required = false) String date) {
		List<SnsContent> sns = null;
		if(date == null || date == " ") {
			sns = snsDao.contentInfo(userId);
		} else {
			sns = snsDao.contentInfo(userId, date);
		}
		List<SnsContent> UserSns = snsDao.contentInfo(searchUserId);
		List<Heart> heart = snsDao.checkHeart(userId);
		for (int i = 0; i < heart.size(); i++) {
			System.out.println(heart.get(i));
		}
		model.addAttribute("heart", heart);
		model.addAttribute("searchUserId", searchUserId);
		model.addAttribute("UserSns", UserSns);
		model.addAttribute("sns", sns);
		return "sns/snsContent";
	}
	
	@RequestMapping("snsContentPro")
	public String snsContentPro(@SessionAttribute("id") String userId, SnsContent snsContent,
	        @RequestParam("contentText") String contentText,
	        @RequestParam(value = "imageFile0", required = false) MultipartFile file1, 
	        @RequestParam(value = "imageFile1", required = false) MultipartFile file2, 
	        @RequestParam(value = "imageFile2", required = false) MultipartFile file3,
	        @RequestParam(value = "imageFile3", required = false) MultipartFile file4, 
	        @RequestParam(value = "imageFile4", required = false) MultipartFile file5) {
	    String msg = "게시물 등록 실패";
	    String url = "/sns/snsContent";
	    String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/sns/imgs/";
	    snsContent.setId(userId);
	    snsContent.setContent(contentText);

	    MultipartFile[] imageFiles = {file1, file2, file3, file4, file5};
	    for (int i = 0; i < imageFiles.length; i++) {
	        MultipartFile file = imageFiles[i];
	        String filename = null;
	        if (file != null && !file.isEmpty()) {
	            try {
	                File savedFile = new File(path, file.getOriginalFilename());
	                filename = file.getOriginalFilename();
	                file.transferTo(savedFile);
	                switch (i) {
	                    case 0:
	                        snsContent.setPhoto1(filename);
	                        break;
	                    case 1:
	                        snsContent.setPhoto2(filename);
	                        break;
	                    case 2:
	                        snsContent.setPhoto3(filename);
	                        break;
	                    case 3:
	                        snsContent.setPhoto4(filename);
	                        break;
	                    case 4:
	                        snsContent.setPhoto5(filename);
	                        break;
	                }
	            } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    int num = snsDao.insertContent(snsContent);
	    if (num > 0) {
	        msg = "게시물 등록 성공";
	        url = "/sns/snsContent";
	    }
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    return "alert";
	}

	
	@RequestMapping("snsDeletePro")
	public String snsDeletePro(@SessionAttribute("id") String userId, @RequestParam("num") int num) {
		String msg = "게시물 삭제 실패";
		String url = "/sns/snsContent";
		if(userId != null) {
			int delete = snsDao.snsDelete(num);
			if(delete > 0) {
				msg = "게시물 삭제 성공";
				url = "/sns/snsContent";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("snsCommentPro")
	public String snsCommentPro(SnsComment snsComment, @SessionAttribute("id") String userId, 
			@RequestParam("hiddenNum") int hiddenNum, @RequestParam("inputComment") String inputComment) {
		int num = snsDao.insertComment(inputComment, hiddenNum, userId);
		List<SnsComment> li = snsDao.commentList(hiddenNum);
		model.addAttribute("li", li);
		return "sns/snsComment";
	}
	
	@RequestMapping("snsComment")
	public String snsComment(@RequestParam("hiddenNum") int hiddenNum) {
		List<SnsComment> li = snsDao.commentList(hiddenNum);
		model.addAttribute("li", li);
		return "sns/snsComment";
	}
	
	@RequestMapping("commentDeletePro")
	public String commentDeletePro(@RequestParam("ser") int ser, @RequestParam("hiddenNum") int hiddenNum) {
		int count = snsDao.commentDelete(ser);
		if(count > 0) {
			List<SnsComment> li = snsDao.commentList(hiddenNum);
			model.addAttribute("li", li);
		} else {
			System.out.println("삭제 실패");
		}
		return "sns/snsComment";
	}
	
	@RequestMapping("searchSns")
	public String searchSns(@SessionAttribute(value = "id", required = false) String userId, 
			@RequestParam(value = "id", required = false) String searchUserId) {
		List<SnsContent> sns = snsDao.contentInfo(userId);
		List<SnsContent> UserSns = snsDao.contentInfo(searchUserId);
		model.addAttribute("searchUserId", searchUserId);
		model.addAttribute("UserSns", UserSns);
		model.addAttribute("sns", sns);
		return "sns/searchSns";
	}
	
	@RequestMapping("heart")
	public String heart(@SessionAttribute(value = "id", required = false) String userId, Heart heart,
			@RequestParam("hiddenNum") int hiddenNum) {
		Heart info = heartDao.heartInfo(hiddenNum, userId);
		if(info == null) {
			heart.setId(userId);
			heart.setNum(hiddenNum);
			heart.setHeart(1);
			heartDao.clickHeart(heart);
		} else if(info.getHeart() == 1){
			heartDao.heartDelete(hiddenNum, userId);
		}
		int count = heartDao.heartCount(hiddenNum);
		model.addAttribute("num", hiddenNum);
		model.addAttribute("count", count);
		return "sns/heartCount";
	}
}
