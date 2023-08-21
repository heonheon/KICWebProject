package controller;

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

import model.DietInfo;
import model.UserInfo;
import service.DietMybatis;
import service.UserMybatis;

@Controller
@RequestMapping("/diet/")
public class DietController {
	
	@Autowired
	UserMybatis userDao;
	
	@Autowired
	DietMybatis dietDao;
	
	Model model;
	
	HttpSession session;
	
	HttpServletRequest request;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model model) {
		this.request = request;
		this.model = model;
		session = request.getSession();
	}
	
	@RequestMapping("diet")
	public String diet(@SessionAttribute("id") String userId, @RequestParam(value = "mealDate", required = false) String date,
			@RequestParam(value = "foodname", required = false) String keyword) {
		UserInfo info = userDao.oneId(userId);
		List<DietInfo> foodInfo = dietDao.foodinfo(keyword);
		List<DietInfo> foodList = dietDao.dietInfoList();
		List<DietInfo> dList = dietDao.dietInfoList(userId);
		List<DietInfo> dListDate = dietDao.dietInfoList(userId, date);
		double cartot = 0;
		double protot = 0;
		double fattot = 0;
		double caltot = 0;
		for (int i = 0; i < dListDate.size(); i++) {
			cartot += dListDate.get(i).getCarbo();
			protot += dListDate.get(i).getProtine();
			fattot += dListDate.get(i).getFat();
			caltot += dListDate.get(i).getCalorie();
		}
		model.addAttribute("info", info);
		model.addAttribute("foodInfo", foodInfo);
		model.addAttribute("cartot", cartot);
		model.addAttribute("protot", protot);
		model.addAttribute("fattot", fattot);
		model.addAttribute("caltot", caltot);
		model.addAttribute("date", date);
		model.addAttribute("foodList", foodList);
		model.addAttribute("dList", dList);
		model.addAttribute("dListDate", dListDate);
		return "diet/diet";
	}
	
	@RequestMapping("dietPro")
	public String dietPro(@SessionAttribute("id") String userId, DietInfo dietInfo) {
		String msg = "";
		String url = "";
		dietInfo.setId(userId);
		int num = dietDao.insertDiet(dietInfo);
		if(num > 0) {
			msg = "등록 성공";
			url = "/diet/diet";
		} else {
			msg = "등록 실패";
			url = "/diet/diet";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("dietInfo")
	public String dietInfo(@SessionAttribute("id") String userId) {
		List<DietInfo> dList = dietDao.dietInfoList(userId);
		model.addAttribute("dList", dList);
		return "diet/dietInfo";
	}
	
	@RequestMapping("dietDeletePro")
	public String dietDeletePro(@RequestParam("num") int num) {
		int count = dietDao.dietDelete(num);
		model.addAttribute("count", count);
		return "diet/dietajax";
	}
	
	@RequestMapping("foodName")
	public String foodName(@RequestParam("foodname") String keyword) {
		List<DietInfo> foodList = dietDao.dietInfoList();
		String line = "";
		for (DietInfo di : foodList) {
			if (di.getFoodName().contains(keyword)) {	
			line += "<a class='btn btn-dark mt-3' onclick=\"putPara('"+di.getFoodName()+"')\">" + di.getFoodName() + "</a>";
			break;
			}
		}
		model.addAttribute("line", line);
		return "diet/foodName";
	}
	
	@RequestMapping("foodName2")
	public String foodName2(@RequestParam("foodname") String keyword) {
		List<DietInfo> foodList = dietDao.dietInfoList();
		String test = "";
		for (DietInfo di : foodList) {
			if (di.getFoodName().contains(keyword)) {	
			test += di.getFoodName()+ "," + di.getFoodWeight()+","+di.getCarbo() + "," + di.getProtine() + "," + di.getFat() + "," + di.getCalorie();
			break;
			}
		}
		model.addAttribute("test", test);
		return "diet/foodName";
	}
}
	