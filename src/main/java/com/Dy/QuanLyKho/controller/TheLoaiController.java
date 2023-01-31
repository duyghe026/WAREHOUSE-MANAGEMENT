package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.TheLoaiDao;
import com.Dy.QuanLyKho.entity.TheLoai;
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

import java.util.List;

@Controller
@RequestMapping("/admin/theloai/")
public class TheLoaiController {
    @Autowired
    TheLoaiDao dao;

    @RequestMapping("index")
    public String index(Model model) {
        List<TheLoai> listTheLoai = dao.findAll();
        model.addAttribute("listTheLoai", listTheLoai);
        return "admin/theloai/index";
    }

    @RequestMapping(value="insert",method= RequestMethod.GET)
    public String insert(ModelMap model)
    {
        model.addAttribute("theLoai",new TheLoai());
        return "admin/theloai/insert";
    }

    @RequestMapping(value="insert",method=RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("theLoai")TheLoai theLoai, BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (theLoai.getTenLoai().trim().length() == 0) {
            errors.rejectValue("tenLoai", "tenLoai", "Vui Lòng Nhập Tên Loại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Loại. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string);
        } else {
            try {
                dao.save(theLoai);
                redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
                return "redirect:/admin/theloai/insert";
            } catch (Exception e) {
                model.addAttribute("message", "Thêm Mới Thất Bại!");
            }
        }
        return "admin/theloai/insert";
    }

    @RequestMapping(value="update/{maLoai}",method=RequestMethod.GET)
    public String update(ModelMap model,@PathVariable("maLoai")int maLoai)
    {
        TheLoai theLoai = (TheLoai) dao.findById(maLoai);
        model.addAttribute("theLoai",theLoai);
        return "admin/theloai/update";
    }

    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ModelMap model,@ModelAttribute("theLoai")TheLoai theLoai,BindingResult errors,RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (theLoai.getTenLoai().trim().length() == 0) {
            errors.rejectValue("tenLoai", "tenLoai", "Vui Lòng Nhập Tên Loại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Loại. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
            return "admin/theloai/update";
        } else {
            try {
                dao.save(theLoai);
                redirectAttributes.addFlashAttribute("message","Cập Nhật Thành Công!");
            }
            catch (Exception e) {
                model.addAttribute("message","Cập Nhật Thất Bại!");
                return "admin/theloai/update";
            }
        }
        return "redirect:/admin/theloai/index";
    }

    @RequestMapping(value="delete/{maLoai}",method=RequestMethod.GET)
    public String delete(ModelMap model, @PathVariable("maLoai")int maLoai, RedirectAttributes redirectAttributes)
    {
        try {
            TheLoai theLoai = (TheLoai) dao.findById(maLoai);
            dao.delete(theLoai);
            redirectAttributes.addFlashAttribute("message","Xóa Thành Công!");
        }
        catch (Exception e) {
            redirectAttributes.addFlashAttribute("message","Xóa Thất Bại! Đã Có Hàng Hóa Thuộc Loại Sản Phẩm Này");
        }
        return "redirect:/admin/theloai/index";
    }
}
