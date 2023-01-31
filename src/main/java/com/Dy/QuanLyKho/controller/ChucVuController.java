package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.ChucVuDao;
import com.Dy.QuanLyKho.entity.ChucVu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/chucvu/")
public class ChucVuController {
    @Autowired
    ChucVuDao dao;

    @Autowired
    HttpSession session;

    @RequestMapping("index")
    public String index(Model model) {
        List<ChucVu> listChucVu = dao.findAll();
        model.addAttribute("listChucVu", listChucVu);
        return "admin/chucvu/index";
    }

    @RequestMapping(value="insert",method= RequestMethod.GET)
    public String insert(ModelMap model)
    {
        model.addAttribute("chucVu",new ChucVu());
        return "admin/chucvu/insert";
    }

    @RequestMapping(value="insert",method=RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("chucVu")ChucVu chucVu, BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (chucVu.getTenCV().trim().length() == 0) {
            errors.rejectValue("tenCV", "tenCV", "Vui Lòng Nhập Tên Loại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Loại. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
        } else {
            try {
                dao.save(chucVu);
                redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
                return "redirect:/admin/chucvu/insert";
            } catch (Exception e) {
                model.addAttribute("message", "Thêm Mới Thất Bại!");
            }
        }
        return "admin/chucvu/insert";
    }

    @RequestMapping(value="update/{maCV}",method=RequestMethod.GET)
    public String update(ModelMap model,@PathVariable("maCV")int maCV)
    {
        ChucVu chucVu = (ChucVu) dao.findById(maCV);
        model.addAttribute("chucVu",chucVu);
        return "admin/chucvu/update";
    }

    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ModelMap model,@ModelAttribute("chucVu")ChucVu chucVu,BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (chucVu.getTenCV().trim().length() == 0) {
            errors.rejectValue("tenCV", "tenCV", "Vui Lòng Nhập Tên Loại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Chức Vụ. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
            return "admin/chucvu/update";
        } else {
            try {
                dao.save(chucVu);
                redirectAttributes.addFlashAttribute("message","Cập Nhật Thành Công!");
            }
            catch (Exception e) {
                model.addAttribute("message","Cập Nhật Thất Bại!");
                return "admin/chucvu/update";
            }
        }
        return "redirect:/admin/chucvu/index";
    }
}
