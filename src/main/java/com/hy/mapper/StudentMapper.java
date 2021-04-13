package com.hy.mapper;

import com.hy.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {

    //全查
    public List<Student> selectAll();

    //添加
    public int addStudent(Student student);

    //删除
    public int deleteStudent(Integer id);

    //批量删除
    public int deleteById(Integer[] array);

    //登录
    public Student loginCheck(Student student,@Param("stuId") String stuId, @Param("password") String password);

    //学号查回显
    public Student byStuId(Integer stuId);



}
