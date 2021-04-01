package com.hou.video.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User:hou
 * Date:2021/1/4
 * Time:15:55
 */
@Controller
public class IndexController {

    @RequestMapping("/index")
    public String  index(){
        System.out.println("111111111111111111111111111111");
        return "index";
    }

}
