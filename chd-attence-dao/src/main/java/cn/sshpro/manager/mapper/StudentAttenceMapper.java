package cn.sshpro.manager.mapper;

import cn.sshpro.manager.pojo.StudentAttence;
import cn.sshpro.manager.pojo.StudentAttenceVO;
import com.github.abel533.mapper.Mapper;

import java.util.List;

/**
 * Created by liaoxin on 2017/4/6
 */
public interface StudentAttenceMapper extends Mapper<StudentAttence> {

    List<StudentAttenceVO> listHistory(Long studentId);
}
