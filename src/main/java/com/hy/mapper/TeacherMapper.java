package com.hy.mapper;

import com.hy.entity.Student;
import com.hy.entity.Teacher;

import java.util.List;

public interface TeacherMapper {

    //登录
    public Teacher loginCheck(Teacher teacher);

    //所有的教师Id
    public List<Teacher> TeacherAll();
}
