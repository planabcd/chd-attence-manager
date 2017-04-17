package cn.sshpro.manager.mapper;

import cn.sshpro.manager.pojo.Course;
import com.github.abel533.mapper.Mapper;

import java.util.List;

/**
 * Created by liaoxin on 2017/4/6.
 */
public interface CourseMapper extends Mapper<Course> {

    List<Course> queryByClassId(Long classId);
}
