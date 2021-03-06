package cn.sshpro.manager.service;

import cn.sshpro.manager.mapper.CourseMapper;
import cn.sshpro.manager.pojo.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by liaoxin on 2017/4/6.
 */
@Service
public class CourseService extends BaseService<Course>{

    @Autowired
    private CourseMapper courseMapper;


    public List<Course> queryByClassId(Long classId)  {
        return courseMapper.queryByClassId(classId);
    }
}
