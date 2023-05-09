package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import com.kbstar.utility.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/marker")
public class MarkerController {

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    MarkerService markerService;
    String dir = "marker";
    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Marker> list = null;
        List<Marker> llist = null;
        try {
            list = markerService.getall();
            llist = markerService.locs();
        } catch (Exception e) {
            throw new Exception("getall 오류-------------------------");
        }

        model.addAttribute("mllist", llist);
        model.addAttribute("mlist", list);
        model.addAttribute("center", dir+"/all");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model, Marker marker) throws Exception {
        model.addAttribute("center", dir+"/add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Marker marker) throws Exception {

        MultipartFile mf = marker.getImgfile();
        String imgname = mf.getOriginalFilename();
        marker.setImg(imgname);
        markerService.register(marker);

        FileUploadUtil.saveFile(mf,imgdir);

        return "redirect:/marker/all";
    }
    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Marker marker = null;
        marker = markerService.get(id);

        model.addAttribute("mdetail", marker);
        model.addAttribute("center", dir+"/detail");
        return "index";
    }

    @RequestMapping("/detailimpl")
    public String detailimpl(Model model, Marker marker) throws Exception {
        MultipartFile mf = marker.getImgfile();
        String new_imgname = mf.getOriginalFilename();

        if(new_imgname.equals("") || new_imgname == null) {
            markerService.modify(marker);
        } else {
            marker.setImg(new_imgname);
            markerService.modify(marker);
            FileUploadUtil.saveFile(mf,imgdir);
        }


        return "redirect:/marker/all";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, int id) {
        try {
            markerService.remove(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir+"/all");
        return "redirect:/marker/all";
    }
    @RequestMapping("/search")
    public String search(Model model, MarkerSearch ms) throws Exception {
        List<Marker> list = markerService.search(ms);
        model.addAttribute("mlist",list);
        model.addAttribute("center",dir+"/all");
        return "index";
    }
}


