package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    BCryptPasswordEncoder encoder;
    @Autowired
    CustService custService;

    String dir = "cust";
    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir+"/add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Cust cust, Errors errors) throws Exception{
        if(errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e:es) {
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "<h4>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.register(cust);
        model.addAttribute("center", dir+"/add");
        return "redirect:/cust/all";
    }
    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Cust> list = null;
        try {
            list = custService.getall();
        } catch (Exception e) {
            throw new Exception("custall 시스템오류.........................");
        }

        model.addAttribute("clist", list);
        model.addAttribute("center", dir+"/all");
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, String id) {
        Cust cust = null;
        try {
            cust = custService.get(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("cdetail", cust);
        model.addAttribute("center", dir+"/detail");
        return "index";
    }
    @RequestMapping("/detailimpl")
    public String detailimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
        if(errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e:es) {
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "<h4>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.modify(cust);
        model.addAttribute("center", dir+"/all");
        return "redirect:/cust/all";
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) {
        try {
            custService.remove(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir+"/all");
        return "redirect:/cust/all";
    }


    }


