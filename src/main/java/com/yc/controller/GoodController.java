package com.yc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.pojo.Goods;
import com.yc.service.GoodService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/good")
public class GoodController {
    @Resource
    private GoodService goodService;

    @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public String findAll(Model model,Integer page){
        if(page==null){
            page=1;
        }
        PageHelper.startPage(page,5);
        List<Goods> goods = goodService.selectAll();
        PageInfo<Goods> pageInfo = new PageInfo<>(goods);
        model.addAttribute("pb",pageInfo);
        model.addAttribute("glist",goods);
        return "goodsList";
    }

    @RequestMapping(value = "/updateById",method = RequestMethod.POST)
    public String updateById(Goods goods, MultipartFile file){
        goodService.updateOne(goods,file);
        return "redirect:/good/findAll";
    }
    @RequestMapping("/deleteById")
    public String deleteById(@RequestParam("id")Integer id){
        goodService.deleteOne(id);
        return "redirect:/good/findAll";
    }
    @RequestMapping(value = "/addOne",method = RequestMethod.POST)
    public String addOne(Goods goods,MultipartFile file){
        goodService.addOne(goods,file);
        return "redirect:/good/findAll";
    }
}
