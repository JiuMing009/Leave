package com.hy.mapper;

import com.hy.entity.StuLeave;

import java.util.List;

public interface StuLeaveMapper {

    //全查
    public List<StuLeave> selectAll();

    //添加
    public int addLeave(StuLeave stuLeave);

    //老师ID查询
    public List<StuLeave> selectTeaId(Integer teaId);

    //学生ID查询
    public List<StuLeave> selectStuId(Integer stuId);

    //删除
    public int cancel(Integer id);


    //编辑,单击修改status,同意审批
    public int Agree(StuLeave stuLeave);

    //编辑,单击修改status,不同意审批
    public int Disagree(StuLeave stuLeave);


    //学生ID查询，已同意的
    public List<StuLeave> AgreeStuId(Integer stuId);

    //学生ID查询，已拒绝的
    public List<StuLeave> DisagreeStuId(Integer stuId);

    //删除,被拒绝的
    public int delete(Integer id);

    //销假
    public int over(Integer id);


    //老师ID查询,已同意的
    public List<StuLeave> AgreeTeaId(Integer teaId);

    //老师ID查询，已拒绝的
    public List<StuLeave> DisagreeTeaId(Integer teaId);



}
