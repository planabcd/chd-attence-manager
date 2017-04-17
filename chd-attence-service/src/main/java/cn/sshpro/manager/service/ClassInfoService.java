package cn.sshpro.manager.service;

import cn.sshpro.manager.mapper.ClassInfoMapper;
import cn.sshpro.manager.mapper.CourseMapper;
import cn.sshpro.manager.pojo.ClassInfo;
import cn.sshpro.manager.pojo.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by liaoxin on 2017/4/6.
 */
@Service
public class ClassInfoService extends BaseService<ClassInfo>{

    @Autowired
    private ClassInfoMapper classInfoMapper;


    public List<ClassInfo> queryByTeacherId(Long teacherId) {
        return classInfoMapper.queryByTeacherId(teacherId);
    }
}
