package com.hy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hy.entity.Student;
import com.hy.service.StudentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    //页面通用跳转方法
    @RequestMapping("/{page}")
    public String toPage(@PathVariable()String page){
        return page;
    }

    //全查
    @RequestMapping("/stuAll")
    public String selectAll(Model model, @RequestParam(defaultValue = "1") Integer page){
        PageHelper.startPage(page,10);
        List<Student> stu = studentService.selectAll();
        PageInfo<Student> info = new PageInfo<>(stu);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("stu",stu);
        model.addAttribute("page",info);
        model.addAttribute("list",list);
        return "main";
    }

    //添加
    @RequestMapping("/addStu")
    public String addStudent(Student student){
        return studentService.addStudent(student) > 0? "redirect:/student/stuAll":"addStudent";
    }

    //删除
    @RequestMapping("/deleteStu")
    public String deleteStudent(Integer id){
        return studentService.deleteStudent(id) > 0? "redirect:/student/stuAll":"addStudent";
    }

    //批量删除
    @RequestMapping("/moreDelete")
    public String deleteById(Integer[] check){
       return studentService.deleteById(check) > 0? "redirect:student/stuAll":"data";
        }

    @RequestMapping ("/home")
    public String home(){
        return "main1";
    }


    //登录
    @RequestMapping("/loginCheck")
    @ResponseBody
    public ModelAndView loginCheck(Student student,@Param("stuId") String stuId, @Param("password") String password, HttpSession session){

        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        Student s = studentService.loginCheck(student,stuId,password);//调用service层登录方法
        if(s!=null){
            if(s.getPassword().equals(password)){//密码正确
                session.setAttribute("stu", s);
                session.setAttribute("stuId",s.getStuId());//学号
                session.setAttribute("name",s.getName()); //登录显示姓名
                session.setAttribute("phone",s.getPhone());//电话
                mv.setViewName("student_main");
            }
            else{
                mv.setViewName("sLogin");
            }
        }
        else{
            //登录失败停留在登录页面
            mv.setViewName("sLogin");
        }
        return mv;
    }

    //注销
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("stu");
        return "sLogin";

    }
}
