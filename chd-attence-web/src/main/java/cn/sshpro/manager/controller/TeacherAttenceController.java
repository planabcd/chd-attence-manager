package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.pojo.TeacherAttence;
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

/**
 * Created by think on 2017/4/10
 */
@Controller
@RequestMapping("tattence")
public class TeacherAttenceController {
    @Resource
    private TeacherAttenceService teacherAttenceService;



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
    public String detail(@PathVariable("teacherId")Long studentId,Model model){
        model.addAttribute("teacherId",studentId);
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






}
