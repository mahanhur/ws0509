package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
import com.kbstar.utility.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    ItemService itemService;

    String dir = "item";
    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir+"/add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item) throws Exception {
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename();
        item.setImgname(imgname);
        itemService.register(item);

        FileUploadUtil.saveFile(mf,imgdir);

        return "redirect:/item/all";
    }
    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> list = null;
        try {
            list = itemService.getall();
        } catch (Exception e) {
            throw new Exception("itemall 시스템 오류................");
        }
        model.addAttribute("ilist",list);
        model.addAttribute("center", dir+"/all");
        return "index";
    }
    @RequestMapping("/detail")
    public String all(Model model,int id) throws Exception {
        Item item = null;
        item = itemService.get(id);

        model.addAttribute("gitem",item);
        model.addAttribute("center", dir+"/detail");
        return "index";
    }

    @RequestMapping("/detailimpl")
    public String detailimpl(Model model, Item item) throws Exception {
        MultipartFile mf = item.getImg();
        String imgname = mf.getOriginalFilename();
        log.info("-------------------------------------------------------------");
        log.info(imgname);
        log.info(item.getImgname());
        log.info("-------------------------------------------------------------");

//        if(imgname.equals("") || imgname == null) {
//            item.setImgname(imgname);
//            itemService.modify(item);
//        } else {
//            item.setImgname(imgname);
//            FileUploadUtil.saveFile(mf,imgdir);
//            itemService.modify(item);
//        }

        if(imgname.equals("") || imgname == null) {
            itemService.modify(item);
        } else {
            item.setImgname(imgname);
            itemService.modify(item);
            FileUploadUtil.saveFile(mf,imgdir);
        }


        return "redirect:/item/all";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, int id) {
        try {
            itemService.remove(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir+"/all");
        return "redirect:/item/all";
    }

    @RequestMapping("/search")
    public String search(Model model, ItemSearch ms) throws Exception {
        log.info("----------------------------------------------------------");
        log.info(ms.getStartdate());
        log.info(ms.getEnddate());
        log.info("----------------------------------------------------------");

        List<Item> list = null;
        list = itemService.search(ms);

        model.addAttribute("ms", ms);
        model.addAttribute("clist", list);
        model.addAttribute("center", dir+"all");

        return "index";
    }


}


