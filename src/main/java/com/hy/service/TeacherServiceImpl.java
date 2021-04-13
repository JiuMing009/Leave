package com.hy.service;

import com.hy.entity.Teacher;
import com.hy.mapper.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService{

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public Teacher loginCheck(Teacher teacher) {
        return teacherMapper.loginCheck(teacher);
    }

    //所有的教师Id
    @Override
    public List<Teacher> TeacherAll() {
        List<Teacher> t = teacherMapper.TeacherAll();
        return t;
    }
}
