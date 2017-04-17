package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.pojo.StudentAttence;
import cn.sshpro.manager.pojo.TeacherAttence;
import cn.sshpro.manager.service.StudentAttenceService;
import cn.sshpro.manager.service.TeacherAttenceService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by think on 2017/4/10.
 */
@Controller
@RequestMapping("sattence")
public class StudentAttenceController {
    @Resource
    private StudentAttenceService studentAttenceService;

    @Resource
    private TeacherAttenceService teacherAttenceService;

    private Logger logger = LoggerFactory.getLogger(StudentAttenceController.class);

    @RequestMapping(value="/list/{studentId}",method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@PathVariable("studentId")Long studentId,@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            StudentAttence record = null;
            if(studentId!=0){
                record = new StudentAttence();
                record.setStudentId(studentId);
            }
            PageInfo<StudentAttence> pageInfo = studentAttenceService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            logger.error("查询学生考勤信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(value="/detail/{studentId}",method= RequestMethod.GET)
    public String detail(@PathVariable("studentId")Long studentId,Model model){
        model.addAttribute("studentId",studentId);
        return "sattence/list";
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> edit(StudentAttence studentAttence){
        try {
            if(studentAttence.getId()!=null){
                studentAttenceService.updateSelective(studentAttence);
            }else{
                studentAttenceService.save(studentAttence);
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            logger.error("编辑学生考勤信息失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public String view(@PathVariable("id")Long id, Model model){
        try {
            if(id!=0){
                StudentAttence studentAttence = studentAttenceService.queryById(id);
                model.addAttribute("studentAttence",studentAttence);
            }
            return "sattence/edit";

        } catch (Exception e) {
            logger.error("查询编辑学生考勤信息失败",e);
        }
        return "layout/error";
    }

    @RequestMapping(value="/call")
    @ResponseBody
    public List<TeacherAttence> call(@RequestParam("courseId")Long courseId, @RequestParam("classId")Long classId,
        @RequestParam("teacherId")Long teacherId,@RequestParam("state")Long state){
        TeacherAttence record = new TeacherAttence();
        record.setClassId(classId);
        record.setTeacherId(teacherId);
        record.setCourseId(courseId);
        record.setState(state);

        return teacherAttenceService.getCall(courseId, classId, teacherId,state);
    }

    @RequestMapping(value="/doCall")
    @ResponseBody
    public StudentAttence doCall(@RequestParam("teacherAttenceId")Long teacherAttenceId,@RequestParam("studentId")Long studentId){
        StudentAttence record = new StudentAttence();
        record.setStudentId(studentId);
        record.setTeacherAttenceId(teacherAttenceId);
        List<StudentAttence> studentAttences = studentAttenceService.queryListByWhere(record);
        if(CollectionUtils.isNotEmpty(studentAttences)){
            StudentAttence studentAttence = studentAttences.get(0);
            studentAttence.setState(2L);
            studentAttenceService.updateSelective(studentAttence);
            return studentAttence;
        }
        return null;
    }
}
