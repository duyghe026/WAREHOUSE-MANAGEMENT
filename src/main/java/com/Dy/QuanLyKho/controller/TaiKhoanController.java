package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.NhanVienDao;
import com.Dy.QuanLyKho.dao.TaiKhoanDao;
import com.Dy.QuanLyKho.entity.ChucVu;
import com.Dy.QuanLyKho.entity.NhanVien;
import com.Dy.QuanLyKho.entity.TaiKhoan;
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
@RequestMapping("/admin/taikhoan/")
public class TaiKhoanController {
    @Autowired
    TaiKhoanDao dao;

    @Autowired
    NhanVienDao nhanVienDao;

    @ModelAttribute("dsNhanVien")
    public List<NhanVien> getNhanVien() {
        List<NhanVien> list = nhanVienDao.findAll();
        return list;
    }

    @RequestMapping("index")
    public String index(Model model) {
        List<TaiKhoan> listTaiKhoan = dao.findAll();
        model.addAttribute("listTaiKhoan", listTaiKhoan);
        return "admin/taikhoan/index";
    }

    @RequestMapping(value="insert",method= RequestMethod.GET)
    public String insert(ModelMap model)
    {
        model.addAttribute("taiKhoan",new TaiKhoan());
        return "admin/taikhoan/insert";
    }

    @RequestMapping(value="insert",method=RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("taiKhoan")TaiKhoan taiKhoan, BindingResult errors,RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (taiKhoan.getUsername().trim().length() == 0) {
            errors.rejectValue("username", "username", "Vui Lòng Nhập Username");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Username. </p>";
        }
        if (taiKhoan.getPassword().trim().length() == 0) {
            errors.rejectValue("password", "password", "Vui Lòng Nhập Password");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Password. </p>";
        }
        List<TaiKhoan> list = dao.findAllByUsername(taiKhoan.getUsername());
        if(list.size() != 0){
            errors.rejectValue("username", "username", "Đã Tồn Tại username");
            string += "<p style=\"color:red;\">Đã Tồn Tại Username. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
        } else {
            try {
                dao.save(taiKhoan);
                redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
                return "redirect:/admin/taikhoan/insert";
            }
            catch (Exception e) {
                redirectAttributes.addFlashAttribute("message","Thêm Mới Thất Bại!");
            }
        }
        return "admin/taikhoan/insert";
    }

    @RequestMapping(value="update/{username}",method=RequestMethod.GET)
    public String update(ModelMap model,@PathVariable("username") String username)
    {
        TaiKhoan taiKhoan = (TaiKhoan) dao.findByUsername(username);
        model.addAttribute("taiKhoan", taiKhoan);
        return "admin/taikhoan/update";
    }

    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ModelMap model,@ModelAttribute("taiKhoan")TaiKhoan taiKhoan,BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (taiKhoan.getUsername().trim().length() == 0) {
            errors.rejectValue("username", "username", "Vui Lòng Nhập Username");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Username. </p>";
        }
        if (taiKhoan.getPassword().trim().length() == 0) {
            errors.rejectValue("password", "password", "Vui Lòng Nhập Password");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Password. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
            return "admin/taikhoan/update";
        } else {
            try {
                dao.save(taiKhoan);
                redirectAttributes.addFlashAttribute("message", "Cập Nhật Thành Công!");
            } catch (Exception e) {
                model.addAttribute("message","Cập Nhật Thất Bại!");
                return "admin/taikhoan/update";
            }
        }
        return "redirect:/admin/taikhoan/index";
    }

    @RequestMapping(value="delete/{username}",method=RequestMethod.GET)
    public String delete(ModelMap model, @PathVariable("username")String username, RedirectAttributes redirectAttributes)
    {
        try {
            TaiKhoan taiKhoan = (TaiKhoan) dao.findByUsername(username);
            dao.delete(taiKhoan);
            redirectAttributes.addFlashAttribute("message","Xóa Thành Công!");
        }
        catch (Exception e) {
            redirectAttributes.addFlashAttribute("message","Xóa Thất Bại!");
        }
        return "redirect:/admin/taikhoan/index";
    }
}
