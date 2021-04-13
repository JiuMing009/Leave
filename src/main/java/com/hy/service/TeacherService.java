package com.hy.service;

import com.hy.entity.Teacher;

import java.util.List;

public interface TeacherService {

    //登录
    public Teacher loginCheck(Teacher teacher);

    //所有的教师Id
    public List<Teacher> TeacherAll();
}
