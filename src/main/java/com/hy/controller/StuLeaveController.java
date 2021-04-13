package com.hy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hy.entity.StuLeave;
import com.hy.service.StuLeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/stuLeave")
public class StuLeaveController {

    @Autowired
    private StuLeaveService stuLeaveService;

    //页面通用跳转方法
    @RequestMapping("{page}")
    public String toPage(@PathVariable()String page){
        return page;
    }

    //全查
   /* @RequestMapping("/stuLeaveAll")
    public String selectAll(Model model, @RequestParam(defaultValue = "1") Integer page){
        PageHelper.startPage(page,10);
        List<StuLeave> sl = stuLeaveService.selectAll();
        PageInfo<StuLeave> info = new PageInfo<>(sl);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("sl",sl);
        model.addAttribute("page",info);
        model.addAttribute("list",list);
        return "leave_table";
    }*/

    //添加
    @RequestMapping("/addLeave")
    public String addLeave(StuLeave stuLeave){
        return stuLeaveService.addLeave(stuLeave) > 0 ? "redirect:/stuLeave/selectStuId":"qingjia";
    }

    //按老师id查，2021.3.30写
	/*@RequestMapping("/selectTeaId")
	public ModelAndView selectTeaId(Integer teaId, HttpSession session){
        teaId = (Integer) session.getAttribute("teaId");//2021.3.30写，通过登录了的teaId查询
        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        List<StuLeave> teaIds = stuLeaveService.selectTeaId(teaId);//做查询工作
        mv.addObject("teaIds", teaIds); //把查询出来的结果存入ModelAndView对象中
        session.setAttribute("list",teaIds.size());//2021.3.31写
		mv.setViewName("leave_table"); //跳转main页面 本质是/WEB-INF/jsp/.jsp
		return mv;
	}*/

    //按老师id查，2021.4.1写分页
    @RequestMapping("/selectTeaId")
    public String selectTeaId(Integer teaId, Model model, @RequestParam(defaultValue = "1") Integer page, HttpSession session){
        PageHelper.startPage(page,10);
        teaId = (Integer) session.getAttribute("teaId");//2021.3.30写，通过登录了的teaId查询
        List<StuLeave> teaIds = stuLeaveService.selectTeaId(teaId);//做查询工作
        PageInfo<StuLeave> info = new PageInfo<>(teaIds);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("teaIds", teaIds);
        model.addAttribute("page",info);
        model.addAttribute("list2",list);
        session.setAttribute("list",teaIds.size());//2021.3.31写
        return "leave_table";
    }

    //按学生id查，2021.3.30写
  /*  @RequestMapping("/selectStuId")
    public ModelAndView selectStuId(Integer stuId, HttpSession session){
        stuId = (Integer) session.getAttribute("stuId");//2021.3.30写，通过登录了的stuId查询
        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        List<StuLeave> stuIds = stuLeaveService.selectStuId(stuId);//做查询工作
        mv.addObject("stuIds", stuIds); //把查询出来的结果存入ModelAndView对象中
        session.setAttribute("list",stuIds.size());//2021.3.31写
        mv.setViewName("leave_success"); //跳转main页面 本质是/WEB-INF/jsp/.jsp
        return mv;
    }*/

    //按学生id查，2021.4.1写分页
    @RequestMapping("/selectStuId")
    public String selectStuId(Integer stuId, Model model, @RequestParam(defaultValue = "1") Integer page, HttpSession session){
        PageHelper.startPage(page,10);
        stuId = (Integer) session.getAttribute("stuId");//2021.3.30写，通过登录了的stuId查询
        List<StuLeave> stuIds = stuLeaveService.selectStuId(stuId);//做查询工作
        PageInfo<StuLeave> info = new PageInfo<>(stuIds);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("stuIds",stuIds);
        model.addAttribute("page",info);
        model.addAttribute("list2",list);
        session.setAttribute("list",stuIds.size());//2021.3.31写
        return "leave_success";
    }

    //删除，2021.3.30写，撤销审批
    @RequestMapping("/Cancel")
    public String deleteStuLeave(Integer id){
        return stuLeaveService.cancel(id) > 0 ? "redirect:/stuLeave/selectStuId":"qingjia";
    }

    //修改,同意,2021.3.30写
    @RequestMapping("/Agree")
    public String Agree(StuLeave stuLeave){
        return stuLeaveService.Agree(stuLeave) > 0?"redirect:/stuLeave/selectTeaId":"qingjia";
    }
    //修改,不同意，2021.3.30写
    @RequestMapping("/Disagree")
    public String Disagree(StuLeave stuLeave){
        return stuLeaveService.Disagree(stuLeave) > 0?"redirect:/stuLeave/selectTeaId":"qingjia";
    }

    //按学生id查，已同意的，2021.3.31写
    /*@RequestMapping("/AgreeStuId")
    public ModelAndView AgreeStuId(Integer stuId, HttpSession session){
        stuId = (Integer) session.getAttribute("stuId");
        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        List<StuLeave> as = stuLeaveService.AgreeStuId(stuId);
        mv.addObject("as", as); //把查询出来的结果存入ModelAndView对象中
        session.setAttribute("list",as.size());//2021.3.31写
        mv.setViewName("leave_student"); //跳转main页面 本质是/WEB-INF/jsp/.jsp
        return mv;
    }*/

    //按学生id查，已同意的，2021.4.1写分页
    @RequestMapping("/AgreeStuId")
    public String AgreeStuId(Integer stuId, Model model, @RequestParam(defaultValue = "1") Integer page, HttpSession session){
        PageHelper.startPage(page,10);
        stuId = (Integer) session.getAttribute("stuId");//2021.3.30写，通过登录了的stuId查询
        List<StuLeave> as = stuLeaveService.AgreeStuId(stuId);
        PageInfo<StuLeave> info = new PageInfo<>(as);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("as", as);
        model.addAttribute("page",info);
        model.addAttribute("list2",list);
        session.setAttribute("list",as.size());//2021.3.31写
        return "leave_studentAgree";
    }

    //按学生id查，不同意的，2021.3.31写
   /* @RequestMapping("/DisagreeStuId")
    public ModelAndView DisagreeStuId(Integer stuId, HttpSession session){
        stuId = (Integer) session.getAttribute("stuId");
        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        List<StuLeave> ds = stuLeaveService.DisagreeStuId(stuId);
        mv.addObject("ds", ds); //把查询出来的结果存入ModelAndView对象中
        session.setAttribute("list",ds.size());//2021.3.31写
        mv.setViewName("leave_student"); //跳转main页面 本质是/WEB-INF/jsp/.jsp
        return mv;
    }*/

    //按学生id查，不同意的，2021.4.1写分页
    @RequestMapping("/DisagreeStuId")
    public String DisagreeStuId(Integer stuId, Model model, @RequestParam(defaultValue = "1") Integer page, HttpSession session){
        PageHelper.startPage(page,10);
        stuId = (Integer) session.getAttribute("stuId");//2021.3.30写，通过登录了的stuId查询
        List<StuLeave> ds = stuLeaveService.DisagreeStuId(stuId);
        PageInfo<StuLeave> info = new PageInfo<>(ds);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("ds", ds);
        model.addAttribute("page",info);
        model.addAttribute("list2",list);
        session.setAttribute("list",ds.size());//2021.3.31写
        return "leave_studentDisagree";
    }

    //删除被拒绝的
    @RequestMapping("/delete")
    public String delete(Integer id){
        return stuLeaveService.delete(id) > 0 ? "redirect:/stuLeave/DisagreeStuId":"qingjia";
    }

    //销假
    @RequestMapping("/over")
    public String over(Integer id){
        return stuLeaveService.over(id) > 0 ? "redirect:/stuLeave/AgreeStuId":"qingjia";
    }

    //按老师id查已同意的，2021.3.31写
    /*@RequestMapping("/AgreeTeaId")
    public ModelAndView AgreeTeaId(Integer teaId, HttpSession session){
        teaId = (Integer) session.getAttribute("teaId");//2021.3.30写，通过登录了的teaId查询
        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        List<StuLeave> at = stuLeaveService.AgreeTeaId(teaId);
        mv.addObject("at", at); //把查询出来的结果存入ModelAndView对象中
        session.setAttribute("list",at.size());//2021.3.31写
        mv.setViewName("leave_teacher"); //跳转main页面 本质是/WEB-INF/jsp/.jsp
        return mv;
    }*/

    //按老师id查已同意的，2021.4.1写分页
    @RequestMapping("/AgreeTeaId")
    public String AgreeTeaId(Integer teaId, Model model, @RequestParam(defaultValue = "1") Integer page, HttpSession session){
        PageHelper.startPage(page,10);
        teaId = (Integer) session.getAttribute("teaId");//2021.3.30写，通过登录了的teaId查询
        List<StuLeave> at = stuLeaveService.AgreeTeaId(teaId);
        PageInfo<StuLeave> info = new PageInfo<>(at);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("at", at);
        model.addAttribute("page",info);
        model.addAttribute("list2",list);
        session.setAttribute("list",at.size());//2021.3.31写
        return "leave_teacherAgree";
    }

    //按老师id查已拒绝的，2021.3.31写
    /*@RequestMapping("/DisagreeTeaId")
    public ModelAndView DisagreeTeaId(Integer teaId, HttpSession session){
        teaId = (Integer) session.getAttribute("teaId");//2021.3.30写，通过登录了的teaId查询
        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        List<StuLeave> dt = stuLeaveService.DisagreeTeaId(teaId);
        mv.addObject("dt", dt); //把查询出来的结果存入ModelAndView对象中
        session.setAttribute("list",dt.size());//2021.3.31写
        mv.setViewName("leave_teacher"); //跳转main页面 本质是/WEB-INF/jsp/.jsp
        return mv;
    }*/

    //按老师id查已拒绝的，2021.4.1写分页
    @RequestMapping("/DisagreeTeaId")
    public String DisagreeTeaId(Integer teaId, Model model, @RequestParam(defaultValue = "1") Integer page, HttpSession session){
        PageHelper.startPage(page,10);
        teaId = (Integer) session.getAttribute("teaId");//2021.3.30写，通过登录了的teaId查询
        List<StuLeave> dt = stuLeaveService.DisagreeTeaId(teaId);
        PageInfo<StuLeave> info = new PageInfo<>(dt);
        Integer pages = info.getPages();
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1;i<= pages;i++){
            list.add(i);
        }
        model.addAttribute("dt", dt);
        model.addAttribute("page",info);
        model.addAttribute("list2",list);
        session.setAttribute("list",dt.size());//2021.3.31写
        return "leave_teacherDisagree";
    }


    @RequestMapping("/AgTeaId")
    public ModelAndView AgTeaId(Integer teaId, HttpSession session){
        teaId = (Integer) session.getAttribute("teaId");//2021.3.30写，通过登录了的teaId查询
        ModelAndView mv = new ModelAndView();  //创建ModelAndView对象
        List<StuLeave> st = stuLeaveService.selectTeaId(teaId);
        List<StuLeave> at = stuLeaveService.AgreeTeaId(teaId);
        List<StuLeave> dt = stuLeaveService.DisagreeTeaId(teaId);
        session.setAttribute("st1",st.size());//2021.3.31写
        session.setAttribute("at1",at.size());//2021.3.31写
        session.setAttribute("dt1",dt.size());//2021.3.31写
        mv.setViewName("leave_data"); //跳转main页面 本质是/WEB-INF/jsp/.jsp
        return mv;
    }


}
