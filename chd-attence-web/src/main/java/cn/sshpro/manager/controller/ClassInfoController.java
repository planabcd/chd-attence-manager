package cn.sshpro.manager.controller;

import cn.sshpro.manager.pojo.ClassInfo;
import cn.sshpro.manager.pojo.EasyUIResult;
import cn.sshpro.manager.service.ClassInfoService;
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
@RequestMapping("classInfo")
public class ClassInfoController {
    @Resource
    private ClassInfoService classInfoService;
    private Logger logger = LoggerFactory.getLogger(ClassInfoController.class);

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<EasyUIResult> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                             @RequestParam(value = "rows", defaultValue = "10") Integer row){
        try {
            PageInfo<ClassInfo> pageInfo = classInfoService.queryPageListByWhere(page, row, null);
            EasyUIResult easyUIResult = new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            logger.error("查询班级信息列表失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Void> edit(ClassInfo classInfo){
        try {
            classInfoService.saveOrupdate(classInfo);
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            logger.error("编辑班级信息失败",e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public String view(@PathVariable("id")Long id, Model model){
        try {
            if(id!=0){
                ClassInfo classInfo = classInfoService.queryById(id);
                model.addAttribute("classInfo",classInfo);
            }
            return "classInfo/edit";

        } catch (Exception e) {
            logger.error("查询编辑班级信息失败",e);
        }
        return "layout/error";
    }



    @RequestMapping("/queryByTeacherId")
    @ResponseBody
    public List<ClassInfo> queryByTeacherId(@RequestParam("teacherId")Long teacherId){
        List<ClassInfo> classInfos = classInfoService.queryByTeacherId(teacherId);
        return classInfos;
    }
}
