package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.pojo.Student;
import cn.sshpro.manager.service.StudentService;
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
 * 学生信息控制器类
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService studentService;
    private Logger logger = LoggerFactory.getLogger(StudentController.class);

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
        @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            PageInfo<Student> pageInfo = studentService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            logger.error("查询学生信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> edit(Student student){
        try {
            if(student.getId()!=null){
                studentService.updateSelective(student);
            }else{
                studentService.save(student);
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            logger.error("编辑学生信息失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public String view(@PathVariable("id")Long id,Model model){
        try {
            if(id!=0){
                Student stu = studentService.queryById(id);
                model.addAttribute("student",stu);
            }
            return "student/edit";

        } catch (Exception e) {
            logger.error("查询编辑学生信息失败",e);
        }
        return "layout/error";
    }

    /*@RequestMapping(value="test",method= RequestMethod.GET)
    public void testAdd(){
        for(int i=0; i!=40; i++){
            Student student = new Student();
            student.setName("lx"+i);
            student.setStuId(11L);
            student.setAcademy("xxxy");
            student.setClassId(240402L);
            student.setGrade("2013");
            student.setMajor("txgc");
            student.setCreated(new Date());
            student.setUpdated(new Date());
            studentService.save(student);
        }
    }*/



}
