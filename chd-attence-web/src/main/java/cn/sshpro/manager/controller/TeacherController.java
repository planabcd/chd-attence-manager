package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.pojo.Teacher;
import cn.sshpro.manager.service.TeacherService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
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
@RequestMapping("teacher")
public class TeacherController {
    @Resource
    private TeacherService teacherService;
    private Logger logger = LoggerFactory.getLogger(TeacherController.class);

    @RequestMapping("/login")
    @ResponseBody
    public Teacher login(@RequestParam("teacherId")Long teacherId, @RequestParam("pwd")String pwd){
        Teacher record = new Teacher();
        record.setTeacherId(teacherId);
        record.setPassword(pwd);
        List<Teacher> students = teacherService.queryListByWhere(record);
        if(CollectionUtils.isNotEmpty(students)){
            return students.get(0);
        }
        return null;
    }


    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            PageInfo<Teacher> pageInfo = teacherService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            logger.error("查询教师信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> edit(Teacher teacher){
        try {
            if(teacher.getId()!=null){
                teacherService.updateSelective(teacher);
            }else{
                teacherService.save(teacher);
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            logger.error("编辑教师信息失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public String view(@PathVariable("id")Long id, Model model){
        try {
            if(id!=0){
                Teacher teacher = teacherService.queryById(id);
                model.addAttribute("teacher",teacher);
            }
            return "teacher/edit";

        } catch (Exception e) {
            logger.error("查询编辑教师信息失败",e);
        }
        return "layout/error";
    }


    /**
     * 绑定mac地址
     * @param teacherId
     * @param macAddress
     * @return
     */
    @RequestMapping("/bindMacAddress")
    @ResponseBody
    public Teacher bind(@RequestParam("teacherId")Long teacherId, @RequestParam("macAddress")String macAddress){
        if(StringUtils.isBlank(macAddress)){
            return null;
        }
        Teacher record = new Teacher();
        record.setTeacherId(teacherId);
        List<Teacher> teachers = teacherService.queryListByWhere(record);
        if(CollectionUtils.isNotEmpty(teachers)){
            Teacher teacher = teachers.get(0);
            teacher.setMacAddress(macAddress);
            teacherService.updateSelective(teacher);
            return teacher;
        }
        return null;
    }

    /**
     * 获取绑定的mac地址
     * @param teacherId
     * @return
     */
    @RequestMapping("/getMac")
    @ResponseBody
    public Teacher getMac(@RequestParam("teacherId")Long teacherId){
        Teacher record = new Teacher();
        record.setTeacherId(teacherId);
        List<Teacher> teachers = teacherService.queryListByWhere(record);
        if(CollectionUtils.isNotEmpty(teachers)){
            return teachers.get(0);
        }
        return null;
    }
}
