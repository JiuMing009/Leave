package com.hy.service;

import com.hy.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentService {

    //全查
    public List<Student> selectAll();

    //添加
    public int addStudent(Student student);

    //删除
    public int deleteStudent(Integer id);

    //批量删除
    public int deleteById(Integer[] array);

    //登录
    public Student loginCheck(Student student, String stuId,String password);

    //学号查
    public Student byStuId(Integer stuId);

}
