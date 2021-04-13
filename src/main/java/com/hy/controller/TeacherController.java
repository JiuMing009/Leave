package com.hy.controller;

import com.hy.entity.Student;
import com.hy.entity.Teacher;
import com.hy.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    //页面通用跳转方法
    @RequestMapping("{page}")
    public String toPage(@PathVariable()String page){
        return page;
    }


    //登录
    @RequestMapping("/loginCheck")
    public ModelAndView loginCheck(Teacher teacher, HttpSession session){

        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        Teacher tea = teacherService.loginCheck(teacher);//调用service层登录方法
        if(tea!=null){
            session.setAttribute("teacher", tea); //把查询出来的user对象存入session中
            session.setAttribute("teaId",tea.getTeaId());
            session.setAttribute("tname",tea.getTname());
            mv.setViewName("teacher_main");
        }
        else{
            //登录失败停留在登录页面
            mv.setViewName("tLogin");
        }
        return mv;
    }

    //注销
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("teacher");
        return "tLogin";
    }
    //全查
    @RequestMapping("/TeacherAll")
    public ModelAndView TeacherAll(){
        ModelAndView mv = new ModelAndView();
        List<Teacher> t = teacherService.TeacherAll();
        mv.addObject("teacher",t);
        mv.setViewName("leave_success");
        return mv;

    }
}
