package com.hy.service;

import com.hy.entity.Student;
import com.hy.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService{

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> selectAll() {
        List<Student> stu = studentMapper.selectAll();
        return stu;
    }

    @Override
    public int addStudent(Student student) {
        return studentMapper.addStudent(student);
    }

    @Override
    public int deleteStudent(Integer id) {
        return studentMapper.deleteStudent(id);
    }

    @Override
    public int deleteById(Integer[] array) {
        if(array!=null&&array.length>0){
            studentMapper.deleteById(array);
        }
        else {
            return 0;
        }
        return 0;
    }


    //登录
    @Override
    public Student loginCheck(Student student, String stuId, String password) {
        return studentMapper.loginCheck(student,stuId,password);
    }

    @Override
    public Student byStuId(Integer stuId) {
        return studentMapper.byStuId(stuId);
    }


}
