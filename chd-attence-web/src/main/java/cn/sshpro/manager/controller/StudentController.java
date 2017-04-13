package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.pojo.Student;
import cn.sshpro.manager.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by think on 2017/4/10
 * 学生信息控制器类
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    private Logger looger = LoggerFactory.getLogger(StudentController.class);

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            PageInfo<Student> pageInfo = studentService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            looger.error("查询学生信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> edit(Student student){
        try {
            if(student.getId()!=null){
                studentService.update(student);
            }else{
                studentService.save(student);
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            looger.error("编辑学生信息失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public String view(@PathVariable("id")Long id,Model model){
        try {
            if(id==0){
                return "student/add";
            }else{
                Student stu = studentService.queryById(id);
                model.addAttribute("student",stu);
                return "student/edit";
            }

        } catch (Exception e) {
            looger.error("查询编辑学生信息失败",e);
        }
        return "layout/error";
    }



}
