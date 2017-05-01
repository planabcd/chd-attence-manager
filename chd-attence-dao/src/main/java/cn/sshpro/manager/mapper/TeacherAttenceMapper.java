package cn.sshpro.manager.mapper;

import cn.sshpro.manager.pojo.TeacherAttence;
import cn.sshpro.manager.pojo.TeacherAttenceVO;
import com.github.abel533.mapper.Mapper;

import java.util.List;

/**
 * Created by liaoxin on 2017/4/6.
 */
public interface TeacherAttenceMapper extends Mapper<TeacherAttence> {
    List<TeacherAttenceVO> listHistory(Long teacherId);
}
