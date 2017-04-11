package cn.sshpro.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by liaoxin on 2017/4/6.
 */
@Controller
public class IndexController {


    @RequestMapping("/index")
    public String index(Model model){
        model.addAttribute("systemName","chd-attence-manager");
        return "index";
    }

    @RequestMapping("/page/{view}")
    public String toPage(@PathVariable("view")String name){
        return name+"/list";
    }

}
