package com.hy.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hy.entity.Student;
import com.hy.entity.Teacher;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {
		// TODO Auto-generated method stub

		String uri = req.getRequestURI();
		StringBuffer url = req.getRequestURL();

		/*System.out.println(uri);
		System.out.println(url);*/

		if(uri.contains("sLogin")||uri.contains("tLogin")||uri.contains("student/loginCheck")||uri.contains("teacher/loginCheck")){
			return true;
		}

		Student student =(Student)req.getSession().getAttribute("stu");
		Teacher teacher =(Teacher)req.getSession().getAttribute("teacher");
		
		if(student!=null || teacher!=null){
			
			return true;
		}
		else{
			req.getRequestDispatcher("/WEB-INF/jsp/sLogin.jsp").forward(req, resp);
		}
		
		return false;
	}
	
}