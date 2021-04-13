package com.hy.service;

import com.hy.entity.StuLeave;
import com.hy.mapper.StuLeaveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StuLeaveServiceImpl implements StuLeaveService{

    @Autowired
    private StuLeaveMapper stuLeaveMapper;

    @Override
    public List<StuLeave> selectAll() {
        List<StuLeave> sl = stuLeaveMapper.selectAll();
        return sl;
    }

    @Override
    public int addLeave(StuLeave stuLeave) {
        return stuLeaveMapper.addLeave(stuLeave);
    }

    @Override
    public List<StuLeave> selectTeaId(Integer teaId) {
        List<StuLeave> selectTid = stuLeaveMapper.selectTeaId(teaId);
        return selectTid;
    }


    //学生ID查询，未处理的
    @Override
    public List<StuLeave> selectStuId(Integer stuId) {
        List<StuLeave> selectSid = stuLeaveMapper.selectStuId(stuId);
        return selectSid;
    }

    //撤销
    @Override
    public int cancel(Integer id) {
        return stuLeaveMapper.cancel(id);
    }

    //同意
    @Override
    public int Agree(StuLeave stuLeave) {
        return stuLeaveMapper.Agree(stuLeave);
    }

    //不同意
    @Override
    public int Disagree(StuLeave stuLeave) {
        return stuLeaveMapper.Disagree(stuLeave);
    }

    //学生ID查询，已同意的
    @Override
    public List<StuLeave> AgreeStuId(Integer stuId) {
        List<StuLeave> as = stuLeaveMapper.AgreeStuId(stuId);
        return as;
    }
    //学生ID查询，已拒绝的
    @Override
    public List<StuLeave> DisagreeStuId(Integer stuId) {
        List<StuLeave> ds = stuLeaveMapper.DisagreeStuId(stuId);
        return ds;
    }

    //删除,被拒绝的
    @Override
    public int delete(Integer id) {
        return stuLeaveMapper.delete(id);
    }

    //销假
    @Override
    public int over(Integer id) {
        return stuLeaveMapper.over(id);
    }

    //老师ID查询，已同意的
    @Override
    public List<StuLeave> AgreeTeaId(Integer teaId) {
        List<StuLeave> at = stuLeaveMapper.AgreeTeaId(teaId);
        return at;
    }

    //老师ID查询，已拒绝的
    @Override
    public List<StuLeave> DisagreeTeaId(Integer teaId) {
        List<StuLeave> dt = stuLeaveMapper.DisagreeTeaId(teaId);
        return dt;
    }

}
