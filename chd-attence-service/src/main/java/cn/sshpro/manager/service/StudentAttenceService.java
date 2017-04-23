package cn.sshpro.manager.service;

import cn.sshpro.manager.mapper.StudentAttenceMapper;
import cn.sshpro.manager.mapper.TeacherAttenceMapper;
import cn.sshpro.manager.pojo.StudentAttence;
import cn.sshpro.manager.pojo.TeacherAttence;
import com.github.abel533.entity.Example;
import org.apache.commons.collections.CollectionUtils;
import org.aspectj.weaver.patterns.ExactTypePattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by liaoxin on 2017/4/6.
 */
@Service
public class StudentAttenceService extends BaseService<StudentAttence>{
 
    @Autowired
    private StudentAttenceMapper studentAttenceMapper;

    @Autowired
    private TeacherAttenceMapper teacherAttenceMapper;
    
    public TeacherAttence getByStudentId(Long studentId){
        Example example = new Example(StudentAttence.class);
        example.createCriteria().andEqualTo("studentId",studentId);
        example.createCriteria().andEqualTo("state",1L);
        example.setOrderByClause("created desc");
        List<StudentAttence> studentAttences = studentAttenceMapper.selectByExample(example);
        if(CollectionUtils.isNotEmpty(studentAttences)){
            Long teacherAttenceId = studentAttences.get(0).getTeacherAttenceId();
            TeacherAttence record = new TeacherAttence();
            record.setId(teacherAttenceId);
            TeacherAttence teacherAttence = teacherAttenceMapper.selectOne(record);
            return teacherAttence;
        }
        return null;
    }
}
