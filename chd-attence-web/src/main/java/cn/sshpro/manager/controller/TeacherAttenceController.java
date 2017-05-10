package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.pojo.StudentAttence;
import cn.sshpro.manager.pojo.TeacherAttence;
import cn.sshpro.manager.pojo.TeacherAttenceVO;
import cn.sshpro.manager.service.StudentAttenceService;
import cn.sshpro.manager.service.TeacherAttenceService;
import com.github.pagehelper.PageInfo;
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
 * Created by think on 2017/4/10
 */
@Controller
@RequestMapping("tattence")
public class TeacherAttenceController {
    @Resource
    private TeacherAttenceService teacherAttenceService;
    @Resource
    private StudentAttenceService studentAttenceService;


    private Logger logger = LoggerFactory.getLogger(TeacherAttenceController.class);

    @RequestMapping(value="/list/{teacherId}",method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@PathVariable("teacherId")Long teacherId,@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            TeacherAttence record = null;
            if(teacherId!=0){
                record = new TeacherAttence();
                record.setTeacherId(teacherId);
            }
            PageInfo<TeacherAttence> pageInfo = teacherAttenceService.queryPageListByWhere(page, row, record);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            logger.error("查询教师考勤信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(value="/detail/{teacherId}",method= RequestMethod.GET)
    public String detail(@PathVariable("teacherId")Long teacherId,Model model){
        model.addAttribute("teacherId",teacherId);
        return "tattence/list";
    }


    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> edit(TeacherAttence teacherAttence){
        try {
            if(teacherAttence.getId()!=null){
                teacherAttenceService.updateSelective(teacherAttence);
            }else{
                teacherAttenceService.save(teacherAttence);
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            logger.error("编辑教师考勤信息失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public String view(@PathVariable("id")Long id, Model model){
        try {
            if(id!=0){
                TeacherAttence teacherAttence = teacherAttenceService.queryById(id);
                model.addAttribute("teacherAttence",teacherAttence);
            }
            return "tattence/edit";

        } catch (Exception e) {
            logger.error("查询编辑教师考勤信息失败",e);
        }
        return "layout/error";
    }

    /**
     * 教师端开启点名
     * @param courseId
     * @param classId
     * @param teacherId
     * @return
     */
    @RequestMapping(value="/call")
    @ResponseBody
    public TeacherAttence call(@RequestParam("courseId")Long courseId, @RequestParam("classId")Long classId, @RequestParam("teacherId")Long teacherId){
        return teacherAttenceService.saveCall(courseId,classId,teacherId);
    }

    /**
     * 教师端终止考勤
     * @param tacherAttenceId
     * @return
     */
    @RequestMapping(value="/cancelCall")
    @ResponseBody
    public TeacherAttence cancelCall(@RequestParam("tacherAttenceId")Long tacherAttenceId){
        return teacherAttenceService.cancelCall(tacherAttenceId);
    }

    /**
     * 为考勤失败的同学提供考勤
     * @return
     */
    @RequestMapping(value="/specialCall")
    @ResponseBody
    public StudentAttence specialCall(@RequestParam("studentAttenceId")Long studentAttenceId){
        StudentAttence studentAttence = studentAttenceService.queryById(studentAttenceId);
        if(studentAttence!=null){
            Long state = studentAttence.getState();
            if(state==3){
                StudentAttence record = new StudentAttence();
                record.setId(studentAttenceId);
                record.setState(2L);
                studentAttenceService.updateSelective(record);
                return studentAttence;
            }
            return null;
        }
        return null;
    }

    /**
     * 通过教师考勤明细Id查询最新的学生考勤即细腻系
     * @param teacherAttenceId
     * @return
     */
    @RequestMapping(value="/studentAttenceList")
    @ResponseBody
    public List<StudentAttence> listStudentAttence(@RequestParam("teacherAttenceId")Long teacherAttenceId){
        StudentAttence studentAttence = new StudentAttence();
        studentAttence.setTeacherAttenceId(teacherAttenceId);
        List<StudentAttence> studentAttences = studentAttenceService.queryListByWhere(studentAttence);
        return studentAttences;
    }

    /**
     * 通过教师考勤历史记录
     * @param teacherId
     * @return
     */
    @RequestMapping(value="/history")
    @ResponseBody
    public List<TeacherAttenceVO> listHistory(@RequestParam("teacherId")Long teacherId){
        return teacherAttenceService.listHistory(teacherId);
    }

}
