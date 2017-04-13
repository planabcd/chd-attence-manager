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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by think on 2017/4/10.
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    private Logger looger = LoggerFactory.getLogger(StudentController.class);

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(String strattime,@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        PageInfo<Student> pageInfo = null;
        try {
            pageInfo = studentService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            looger.error("查询学生信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(value="test",method= RequestMethod.GET)
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
    }



}
