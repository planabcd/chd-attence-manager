package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.Course;
import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.service.CourseService;
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
 * Created by think on 2017/4/10.
 */
@Controller
@RequestMapping("course")
public class CourseController {
    @Resource
    private CourseService courseService;
    private Logger logger = LoggerFactory.getLogger(CourseController.class);

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            PageInfo<Course> pageInfo = courseService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            logger.error("查询课程信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> edit(Course course){
        try {
            courseService.saveOrupdate(course);
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            logger.error("编辑课程信息失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public String view(@PathVariable("id")Long id, Model model){
        try {
            if(id!=0){
                Course course = courseService.queryById(id);
                model.addAttribute("course",course);
            }
            return "course/edit";

        } catch (Exception e) {
            logger.error("查询编辑课程信息失败",e);
        }
        return "layout/error";
    }


    @RequestMapping("/queryByClassId")
    @ResponseBody
    public List<Course> queryByClassId(@RequestParam("classId")Long classId){
        List<Course> courses = courseService.queryByClassId(classId);
        return courses;
    }

    @RequestMapping("/queryByTeacherId")
    @ResponseBody
    public List<Course> queryByTeacherId(@RequestParam("teacherId")Long teacherId){
        Course record = new Course();
        record.setTeacherId(teacherId);
        List<Course> courses = courseService.queryListByWhere(record);
        return courses;
    }
}
