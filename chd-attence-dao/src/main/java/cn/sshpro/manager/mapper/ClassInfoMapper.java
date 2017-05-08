package cn.sshpro.manager.mapper;

import cn.sshpro.manager.pojo.ClassInfo;
import com.github.abel533.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by liaoxin on 2017/4/6
 */
public interface ClassInfoMapper extends Mapper<ClassInfo> {

    List<ClassInfo> queryByTeacherId(Long teacherId);

    List<ClassInfo> queryByCourseId(Long courseId);

    List<ClassInfo> queryByCourseIdAndClassId(@Param("courseId") String courseId, @Param("classId")String classId);

    void bindCourseIdAndClassId(@Param("courseId") String courseId, @Param("classId")String classId);
}
