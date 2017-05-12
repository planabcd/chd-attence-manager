package cn.sshpro.manager.service;

import cn.sshpro.manager.mapper.StudentAttenceMapper;
import cn.sshpro.manager.mapper.TeacherAttenceMapper;
import cn.sshpro.manager.pojo.*;
import com.github.abel533.entity.Example;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
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

    @Autowired
    private TeacherService teacherService;
    

    public List<StudentAttenceVO> listHistory(Long studentId) {
        return studentAttenceMapper.listHistory(studentId);
    }

    /**
     * 查看是否需要考勤,如果考勤状态为缺勤,则不用获取教师端考勤信息
     * @return
     */
    public StudentAttence checkAttence(Long studentId, Long courseId){
        Example example = new Example(StudentAttence.class);
        example.createCriteria().andEqualTo("studentId",studentId).andEqualTo("courseId",courseId);
        example.setOrderByClause("created desc");
        List<StudentAttence> studentAttences = studentAttenceMapper.selectByExample(example);
        if(CollectionUtils.isNotEmpty(studentAttences)){
            StudentAttence studentAttence = studentAttences.get(0);
            return studentAttence;
        }
        return null;
    }

    public TeacherAttenceVO getByStudentIdAndCourseId(Long studentId, Long courseId) {
        Example example = new Example(StudentAttence.class);
        example.createCriteria().andEqualTo("studentId",studentId).andEqualTo("courseId",courseId)
        .andEqualTo("state",1L);
        example.setOrderByClause("created desc");
        List<StudentAttence> studentAttences = studentAttenceMapper.selectByExample(example);
        if(CollectionUtils.isNotEmpty(studentAttences)){
            Long teacherAttenceId = studentAttences.get(0).getTeacherAttenceId();
            TeacherAttence record = new TeacherAttence();
            record.setId(teacherAttenceId);
            TeacherAttence teacherAttence = teacherAttenceMapper.selectOne(record);
            if(teacherAttence==null){
                return null;
            }
            TeacherAttenceVO teacherAttenceVO = new TeacherAttenceVO();
            BeanUtils.copyProperties(teacherAttence,teacherAttenceVO);
            Long teacherId = teacherAttence.getTeacherId();
            Teacher record2 = new Teacher();
            record2.setTeacherId(teacherId);
            Teacher teacher = teacherService.queryOne(record2);
            if(teacher!=null){
                teacherAttenceVO.setMacAddress(teacher.getMacAddress());
            }
            return teacherAttenceVO;
        }
        return null;
    }

    public List<StudentAttence> listOrderByStudentId(Long teacherAttenceId) {
        Example example = new Example(StudentAttence.class);
        example.createCriteria().andEqualTo("teacherAttenceId",teacherAttenceId);
        example.setOrderByClause("studentId asc");
        List<StudentAttence> studentAttences = studentAttenceMapper.selectByExample(example);
        return studentAttences;
    }
}
