package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.TestStudent;
import cn.sshpro.manager.service.TestStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * Created by liaoxin on 2017/4/6.
 */
@Controller
@RequestMapping("teststudent")
public class TestStudentController {
    @Autowired
    private TestStudentService testStudentService;

    @RequestMapping("/list")
//    @ResponseBody
    public String list(Model model){
        /*for(int i=0; i!=10; i++){
            System.out.println(i);
        }*/
        List<TestStudent> testStudents = testStudentService.queryAll();
        model.addAttribute("list",testStudents);
        model.addAttribute("date",new Date());
        return "test";
    }

}
