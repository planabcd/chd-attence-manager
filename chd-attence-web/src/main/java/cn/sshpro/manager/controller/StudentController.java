package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.Student;
import cn.sshpro.manager.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by think on 2017/4/10.
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public List<Student> list(){
        List<Student> students = studentService.queryAll();
        return students;
    }
}
