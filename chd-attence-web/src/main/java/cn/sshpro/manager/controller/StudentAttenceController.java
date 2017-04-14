package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.pojo.StudentAttence;
import cn.sshpro.manager.service.StudentAttenceService;
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
 * Created by think on 2017/4/10.
 */
@Controller
@RequestMapping("sattence")
public class StudentAttenceController {
    @Resource
    private StudentAttenceService studentAttenceService;
    private Logger logger = LoggerFactory.getLogger(StudentAttenceController.class);

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            PageInfo<StudentAttence> pageInfo = studentAttenceService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            logger.error("查询学生考勤信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
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
}
