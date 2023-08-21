package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String bodyinfo() {
		return "body/bodyinfo";
	}
}
