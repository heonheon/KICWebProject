package controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

import model.UserInfo;
import model.WorkoutInfo;
import model.WorkoutMenu;
import service.UserMybatis;
import service.WorkoutMybatis;


@Controller
@RequestMapping("/workout/")
public class WorkoutController {
	
	@Autowired
	UserMybatis userDao;
	
	@Autowired
	WorkoutMybatis workoutDao;
	
	Model model;
	
	HttpSession session;
	
	HttpServletRequest request;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model model) {
		this.request = request;
		this.model = model;
		session = request.getSession();
	}
	
	@RequestMapping("workout")
	public String workout(@SessionAttribute(value = "id", required = false) String userId, 
			@RequestParam(value = "woDate", required = false) String date) {
		UserInfo info = userDao.oneId(userId);
		List<WorkoutInfo> woList;
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String currentDateStr = currentDate.format(formatter);
		if(date == null || date == " ") {
			woList = workoutDao.workoutInfoList(userId, currentDateStr);
		} else {
			woList = workoutDao.workoutInfoList(userId, date);
		}
		model.addAttribute("info", info);
		model.addAttribute("woList", woList);
		model.addAttribute("date", date);
		return "workout/workout";
	}
	
	@RequestMapping("workoutMenu")
	public String workoutMenu(@RequestParam("aero") String aero) {
		List<WorkoutMenu> WorkoutList = workoutDao.readMenu(aero);
		String line = "";
		for (WorkoutMenu wm  : WorkoutList) {
			line += "<option value='" + wm.getWoType() + "'>" + wm.getWoName() + "</option>";
		}
		model.addAttribute("line", line);
		model.addAttribute("aero", aero);
		return "workout/workoutMenu";
	}
	
	@RequestMapping("workoutPro")
	public String workoutPro(@SessionAttribute("id") String userId, WorkoutInfo workout,
			@RequestParam("woName") String name) {
		String msg = "등록 실패";
		String url = "/workout/workout";
		workout.setId(userId);
		workout.setWocode(name);
		int num = workoutDao.insertWorkout(workout);
		if(num > 0) {
			msg = "등록 성공";
			url = "/workout/workout";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("workoutInfo")
	public String workoutInfo(@SessionAttribute("id") String userId) {
		List<WorkoutInfo> woList = workoutDao.workoutInfoList(userId);
		model.addAttribute("woList", woList);
		return "/workout/workoutInfo";
	}
	
	@RequestMapping("workoutDeletePro")
	public String workoutDeletePro(@RequestParam("num") int num) {
		int count = workoutDao.workoutDelete(num);
		model.addAttribute("count", count);
		return "workout/workoutajax";
	}
}
