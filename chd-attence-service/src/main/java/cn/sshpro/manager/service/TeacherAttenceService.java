package cn.sshpro.manager.service;

import cn.sshpro.manager.mapper.TeacherAttenceMapper;
import cn.sshpro.manager.pojo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.abel533.entity.Example;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by liaoxin on 2017/4/6.
 */
@Service
public class TeacherAttenceService extends BaseService<TeacherAttence>{
    @Autowired
    private TeacherAttenceMapper teacherAttenceMapper;

    private ObjectMapper objectMapper = new ObjectMapper();

    @Resource
    private StudentAttenceService studentAttenceService;
    @Resource
    private StudentService studentService;
    @Resource
    private TeacherService teacherService;

    private Logger logger = LoggerFactory.getLogger(TeacherAttenceService.class);


    public List<TeacherAttence> getCall(Long courseId,Long classId,Long teacherId,Long state){
        Example example = new Example(TeacherAttence.class);
        example.createCriteria().andEqualTo("courseId",courseId);
        example.createCriteria().andEqualTo("classId",classId);
        example.createCriteria().andEqualTo("teacherId",teacherId);
        example.createCriteria().andEqualTo("state",state);
        example.setOrderByClause("created desc");
        return teacherAttenceMapper.selectByExample(example);
    }

    public TeacherAttence saveCall(Long courseId, Long classId, Long teacherId) {
        try {
            Teacher record1 = new Teacher();
            record1.setTeacherId(teacherId);
            Teacher teacher = teacherService.queryOne(record1);
            if(teacher==null){
                return null;
            }
            TeacherAttence record = new TeacherAttence();
            record.setTeacherName(teacher.getName());
            record.setClassId(classId);
            record.setTeacherId(teacherId);
            record.setCourseId(courseId);
            record.setState(1L);
            record.setStartTime(new Date());
            record.setWifiName(getWifiName());
            record.setWifiPwd(getWifiPwd());
            this.save(record);

            Student stu = new Student();
            stu.setClassId(classId);
            List<Student> students = studentService.queryListByWhere(stu);
            if(CollectionUtils.isNotEmpty(students)){
                for(Student s : students){
                    StudentAttence studentAttence = new StudentAttence();
                    studentAttence.setStudentId(s.getStuId());
                    studentAttence.setName(s.getName());
                    studentAttence.setState(1L);
                    studentAttence.setCourseId(courseId);
                    studentAttence.setTeacherAttenceId(record.getId());
                    studentAttenceService.save(studentAttence);
                }
            }

            String result = objectMapper.writeValueAsString(record);
            logger.info("生成teacherAttence成功,result={}",result);
            return record;
        } catch (Exception e) {
            logger.error("生成teacherAttence失败",e);
        }
        return null;
    }


    /**
     * 教师端结束考勤
     */
    public TeacherAttence cancelCall(Long teacherAttenceId) {
        try {
            TeacherAttence record = new TeacherAttence();
            record.setId(teacherAttenceId);
            record.setState(2L);
            record.setEndTime(new Date());
            this.updateSelective(record);
            StudentAttence record2 = new StudentAttence();
            record2.setTeacherAttenceId(teacherAttenceId);
            List<StudentAttence> studentAttences = studentAttenceService.queryListByWhere(record2);
            if (CollectionUtils.isNotEmpty(studentAttences)) {
                for (StudentAttence s : studentAttences) {
                    Long state = s.getState();
                    if (state == 1) {
                        //如果没有考勤视为缺勤
                        s.setState(3L);
                        studentAttenceService.updateSelective(s);
                    }
                }
            }
            String result = objectMapper.writeValueAsString(record);
            logger.info("结束teacherAttence成功,result={}", result);
            return record;
        } catch (Exception e) {
            logger.error("结束teacherAttence失败", e);
        }
        return null;
    }



    private String getWifiName(){
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for(int i=0; i!=4; i++){
            sb.append((char)('A'+random.nextInt(26)));
        }
        return sb.toString();
    }

    private String getWifiPwd(){
        StringBuilder sb = new StringBuilder(new Date().getTime() + "");
        return sb.reverse().toString().substring(0,8);
    }

    public List<TeacherAttenceVO> listHistory(Long teacherId) {
        return teacherAttenceMapper.listHistory(teacherId);
    }
}

