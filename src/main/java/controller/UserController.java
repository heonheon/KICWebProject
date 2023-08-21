package controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

import model.BodyInfo;
import model.DietInfo;
import model.UserInfo;
import model.WorkoutInfo;
import service.BodyMybatis;
import service.DietMybatis;
import service.SnsMybatis;
import service.UserMybatis;
import service.WorkoutMybatis;



@Controller
@RequestMapping("/project/")
public class UserController {
	
	@Autowired
	UserMybatis userDao;
	
	@Autowired
	WorkoutMybatis workoutDao;
	
	@Autowired
	DietMybatis dietDao;
	
	@Autowired
	SnsMybatis sndDao;
	
	@Autowired
	BodyMybatis bodyDao;
	
	Model model;
	
	HttpSession session;
	
	HttpServletRequest request;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model model) {
		this.request = request;
		this.model = model;
		session = request.getSession();
	}
	
	@RequestMapping("home")
	public String home() {
		return "project/home";
	}
	
	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "project/signUpForm";
	}
	
	@RequestMapping("signUpPro") 
	public String signUpPro(UserInfo userInfo) {
		List<UserInfo> idinfo = userDao.idInfo();
		List idCheck = new ArrayList();
		for (int i = 0; i < idinfo.size(); i++) {
			idCheck.add(idinfo.get(i).getId());
		}
		int num = userDao.insertMember(userInfo);
		String msg = "";
		String url = "";
		if(num > 0) {
			msg = userInfo.getName() + "님 가입 축하드립니다.";
			url = "project/home";
		} else {
			if(idCheck.contains(request.getParameter("id"))) {
				msg = "다른 아이디를 사용해 주세요.";
				url = "project/signUpForm";
			} else {
				msg = "회원 가입 실패했습니다.";
				url = "project/signUpForm";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("loginPro") 
	public String loginPro(@RequestParam(value = "id", required = false) String loginId,
			@RequestParam("password") String pass) {
		UserInfo id = userDao.oneId(loginId);
		String msg = "";
		String url = "";
		if(id == null) {
			msg = "아이디를 확인하세요";
			url = "project/home";
		} else {
			if(pass.equals(id.getPassword())) {
				request.getSession().setAttribute("id", loginId);
				msg = id.getName() + "님이 로그인 하셨습니다.";
				url = "project/profile";
			} else {
				msg = "비밀번호를 확인하세요";
				url = "project/home";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("logoutPro") 
	public String logoutPro() {
	 	session.invalidate();
	 	String msg = "로그아웃 완료.";
		String url = "project/home";
	 	model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("profile")
	public String profile(@SessionAttribute(value = "id", required = false) String userId,
			@RequestParam(value = "id", required = false) String searchUserId) {
		LocalDate nowDay = LocalDate.now();
		LocalDate minusDay = nowDay.minusDays(1);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = nowDay.format(formatter);
        String yesterday = minusDay.format(formatter);
		UserInfo info = null;
		List<WorkoutInfo> woListToday = null;
		List<WorkoutInfo> woListYesterday = null;
		List<DietInfo> dListToday = null;
		double cartot = 0;
		double protot = 0;
		double fattot = 0;
		double caltot = 0;
		if(userId == null ) {
			info = userDao.oneId(searchUserId);
			woListToday = workoutDao.workoutInfoList(searchUserId, today);
			woListYesterday = workoutDao.workoutInfoList(searchUserId, yesterday);
			dListToday = dietDao.dietInfoList(searchUserId, today);
			for (int i = 0; i < dListToday.size(); i++) {
				cartot += dListToday.get(i).getCarbo();
				protot += dListToday.get(i).getProtine();
				fattot += dListToday.get(i).getFat();
				caltot += dListToday.get(i).getCalorie();
			}
		} else if (userId != null && searchUserId != null ) {
			info = userDao.oneId(searchUserId);
			woListToday = workoutDao.workoutInfoList(searchUserId, today);
			woListYesterday = workoutDao.workoutInfoList(searchUserId, yesterday);
			dListToday = dietDao.dietInfoList(searchUserId, today);
			for (int i = 0; i < dListToday.size(); i++) {
				cartot += dListToday.get(i).getCarbo();
				protot += dListToday.get(i).getProtine();
				fattot += dListToday.get(i).getFat();
				caltot += dListToday.get(i).getCalorie();
			}
		} else if (userId != null && searchUserId == null) {
			info = userDao.oneId(userId);
			woListToday = workoutDao.workoutInfoList(userId, today);
			woListYesterday = workoutDao.workoutInfoList(userId, yesterday);
			dListToday = dietDao.dietInfoList(userId, today);
			for (int i = 0; i < dListToday.size(); i++) {
				cartot += dListToday.get(i).getCarbo();
				protot += dListToday.get(i).getProtine();
				fattot += dListToday.get(i).getFat();
				caltot += dListToday.get(i).getCalorie();
			}
		} 
		model.addAttribute("searchUserId", searchUserId);
		model.addAttribute("cartot", cartot);
		model.addAttribute("protot", protot);
		model.addAttribute("fattot", fattot);
		model.addAttribute("caltot", caltot);
		model.addAttribute("todayD", dListToday);
		model.addAttribute("today", woListToday);
		model.addAttribute("yesterday", woListYesterday);
		model.addAttribute("info", info);
		return "project/profile";
	}
	
	@RequestMapping("profileUpdate")
	public String profileUpdate(@SessionAttribute("id") String userId) {
		UserInfo id = userDao.oneId(userId);
		model.addAttribute("id", id);
		return "project/profileUpdate";
	}
	
	@RequestMapping("profileUpdatePro")
	public String profileUpdatePro(@SessionAttribute("id") String userId, UserInfo idUpdate, BodyInfo bodyInfo,
			@RequestParam("email") String email, @RequestParam("name") String name,
			@RequestParam("password") String pass, @RequestParam("gender") String gender,
			@RequestParam("bodyheight") String bodyheight, @RequestParam("bodyweight") String bodyweight,
			@RequestParam("bodyfat") String bodyfat, @RequestParam("muscul") String muscul,
			@RequestParam("picture") String picture) {
		String msg = "로그인이 필요합니다.";
		String url = "project/home";
		double bmi = (Double.parseDouble(bodyweight)) / ((Double.parseDouble(bodyheight)) * (Double.parseDouble(bodyheight)) / 10000);
		idUpdate.setId(userId);
		idUpdate.setEmail(email);
		idUpdate.setName(name);
		idUpdate.setPassword(pass);
		idUpdate.setGender(Integer.parseInt(gender));
		idUpdate.setBodyheight(bodyheight);
		idUpdate.setBodyweight(bodyweight);
		idUpdate.setBodyfat(bodyfat);
		idUpdate.setMuscul(muscul);
		idUpdate.setPicture(picture);
		idUpdate.setBmi(String.format("%.2f", bodyInfo.getBmi()));
		bodyInfo.setId(userId);
		bodyInfo.setBodyheight(Double.parseDouble(bodyheight));
		bodyInfo.setBodyweight(Double.parseDouble(bodyweight));
		bodyInfo.setBodyfat(Double.parseDouble(bodyfat));
		bodyInfo.setMuscul(Double.parseDouble(muscul));
		bodyInfo.setBmi(bmi);
		bodyDao.insertBodyInfo(bodyInfo);
		UserInfo dbId = userDao.oneId(userId);
		if(dbId != null) {
			if(dbId.getPassword().equals(idUpdate.getPassword())) {
				int num = userDao.updateMember(idUpdate);
				if(num > 0) {
					msg = idUpdate.getName() + "님의 정보 수정됐습니다.";
					url="project/profile";
				} else {
					msg = "수정 실패했습니다.";
					url = "project/profileUpdate";
				}
			} else {
				msg = "비밀번호가 틀렸습니다.";
				url = "project/profileUpdate";
			}
		} 
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("pictureimgForm")
	public String pictureimgForm() {
		return "project/pictureimgForm";
	}
	
	@RequestMapping("picturePro")
	public String picturePro(@RequestParam("picture") MultipartFile multipartFile) {
		String path = request.getServletContext().getRealPath("/")+"WEB-INF/view/project/imgs/";
		String filename = null;
		if(!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("filename", filename);
		model.addAttribute("path", path);
		return "project/picturePro";
	}
	
	@RequestMapping("passChangeForm")
	public String passChangeForm() {
		return "project/passChangeForm";
	}
	
	@RequestMapping("passChangePro")
	public String passChangePro(@SessionAttribute("id") String userId, 
			@RequestParam("pass") String pass, @RequestParam("changepass1") String changePass) {
		String msg = "로그인이 필요합니다.";
		String url = "project/home";
		UserInfo idDB = userDao.oneId(userId);
		if(idDB != null) { 
			if(idDB.getPassword().equals(pass)) {
				int num = userDao.changePass(userId, changePass);
				if(num > 0) {
					msg = idDB.getName() + "님 비밀번호 수정 완료됐습니다..";
					url="project/profileUpdate";
				} else {
					msg = "비밀번호 수정 실패했습니다.";
					url = "project/passChangeForm";
				}
			} else {
				msg = "비밀번호가 틀렸습니다.";
				url = "project/passChangeForm";
			}
		} 		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("deleteUser")
	public String deleteUser() {
		return "project/deleteUser";
	}
	
	@RequestMapping("deleteUserPro")
	public String deleteUserPro(@SessionAttribute("id") String userId) {
		String msg = "로그인이 필요합니다.";
		String url = "project/home";
		if(userId != null && !userId.equals("")) {
			UserInfo idDb = userDao.oneId(userId); 
			String pass = request.getParameter("password");
			if(idDb != null) {
				if(idDb.getPassword().equals(pass)) {
					int num = userDao.deleteMember(userId);
					if(num > 0) {
						msg = idDb.getName() + "님 탈퇴 완료됐습니다.";
						session.invalidate();
						url="project/home";
					} else {
						msg = "탈퇴 실패했습니다.";
						url = "project/deleteUser";
					}
				} else {
					msg = "비밀번호가 틀렸습니다.";
					url = "project/deleteUser";
				}
			} 
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("diet")
	public String diet() {
		return "diet/diet";
	}
	
	@RequestMapping("alert")
	public String alert(String id) {
		if(id.equals("admin")) {
			model.addAttribute("msg", "접근불가입니다.");
		} else {
			model.addAttribute("msg", "로그인이 필요합니다.");
		}
		model.addAttribute("url", "/project/home");
		return "alert";
	}
}
