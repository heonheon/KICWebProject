package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.BodyInfo;
import service.BodyMybatis;
import service.UserMybatis;


@Controller
@RequestMapping("/body/")
public class BodyController {

	@Autowired
	UserMybatis userDao;
	
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
	
	@RequestMapping("bodyinfo")
	public String bodyinfo(@SessionAttribute("id") String userId) {
		List<BodyInfo> list = bodyDao.bodyInfoList(userId);
		model.addAttribute("list", list);
		return "body/bodyinfo";
	}
}
