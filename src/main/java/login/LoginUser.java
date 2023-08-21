package login;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginUser extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = (String)request.getSession().getAttribute("id");
		if(id == null) {
			response.sendRedirect(request.getContextPath() + "/project/alert?id=login");
			return false;
		} else {
			return true;
		}
	}
}
