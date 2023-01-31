package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.DaiLyDao;
import com.Dy.QuanLyKho.entity.DaiLy;
import com.Dy.QuanLyKho.entity.NhaCungCap;
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
@RequestMapping("/admin/daily/")
public class DaiLyController {
    @Autowired
    DaiLyDao dao;

    @RequestMapping("index")
    public String index(Model model) {
        List<DaiLy> listDaiLy = dao.findAll();
        model.addAttribute("listDaiLy", listDaiLy);
        return "admin/daily/index";
    }

    @RequestMapping(value="insert",method= RequestMethod.GET)
    public String insert(ModelMap model)
    {
        model.addAttribute("daiLy",new DaiLy());
        return "admin/daily/insert";
    }

    @RequestMapping(value="insert",method=RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("daiLy")DaiLy daiLy, BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (daiLy.getMst() == 0) {
            errors.rejectValue("mst", "mst", "Vui Lòng Nhập Mã Số Thuế");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Mã Số Thuế. </p>";
        }
        if (daiLy.getTenDL().trim().length() == 0) {
            errors.rejectValue("tenDL", "tenDL", "Vui Lòng Nhập Tên Đại Lý");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Đại Lý. </p>";
        }
        if (daiLy.getDiaChi().trim().length() == 0) {
            errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Địa Chỉ. </p>";
        }
        if (daiLy.getSdt().trim().length() == 0 ) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập Số Điện Thoại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Số Điện Thoại. </p>";
        }
        if (daiLy.getSdt().trim().length() != 10 && daiLy.getSdt().trim().length() != 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT Gồm 10 Số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT Gồm 10 Số. </p>";
        }
        List<DaiLy> list = dao.findAllByMst(daiLy.getMst());
        if(list.size() != 0){
            errors.rejectValue("mst", "mst", "Đã Tồn Tại Mã Số Thuế");
            string += "<p style=\"color:red;\">Đã Tồn Tại Mã Số Thuế. </p>";
        }
        List<DaiLy> list1 = dao.findAllByTenDL(daiLy.getTenDL());
        if(list1.size() != 0){
            errors.rejectValue("tenDL", "tenDL", "Đã Tồn Tại Tên Đại Lý");
            string += "<p style=\"color:red;\">Đã Tồn Tại Tên Đại Lý. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
        } else {
            try {
                dao.save(daiLy);
                redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
                return "redirect:/admin/daily/insert";
            } catch (Exception e) {
                model.addAttribute("message", "Thêm Mới Thất Bại!");
            }
        }
        return "admin/daily/insert";
    }

    @RequestMapping(value="update/{maDL}",method=RequestMethod.GET)
    public String update(ModelMap model,@PathVariable("maDL")int maDL)
    {
        DaiLy daiLy = (DaiLy) dao.findById(maDL);
        model.addAttribute("daiLy",daiLy);
        return "admin/daily/update";
    }

    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ModelMap model,@ModelAttribute("daiLy")DaiLy daiLy,BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (daiLy.getMst() == 0) {
            errors.rejectValue("mst", "mst", "Vui Lòng Nhập Mã Số Thuế");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Mã Số Thuế. </p>";
        }
        if (daiLy.getTenDL().trim().length() == 0) {
            errors.rejectValue("tenDL", "tenDL", "Vui Lòng Nhập Tên Đại Lý");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Đại Lý. </p>";
        }
        if (daiLy.getDiaChi().trim().length() == 0) {
            errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Địa Chỉ. </p>";
        }
        if (daiLy.getSdt().trim().length() == 0 ) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập Số Điện Thoại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Số Điện Thoại. </p>";
        }
        if (daiLy.getSdt().trim().length() != 10 && daiLy.getSdt().trim().length() != 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT Gồm 10 Số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT Gồm 10 Số. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
            return "admin/daily/update";
        } else {
            try {
                dao.save(daiLy);
                redirectAttributes.addFlashAttribute("message","Cập Nhật Thành Công!");
            }
            catch (Exception e) {
                model.addAttribute("message","Cập Nhật Thất Bại!");
                return "redirect:admin/daily/update";
            }
        }
        return "redirect:/admin/daily/index";
    }

    @RequestMapping(value="delete/{maDL}",method=RequestMethod.GET)
    public String delete(ModelMap model, @PathVariable("maDL")int maDL, RedirectAttributes redirectAttributes)
    {
        try {
            DaiLy daily = (DaiLy) dao.findById(maDL);
            dao.delete(daily);
            redirectAttributes.addFlashAttribute("message","Xóa Thành Công!");
        }
        catch (Exception e) {
            redirectAttributes.addFlashAttribute("message","Xóa Thất Bại! Đại Lý Đã Đặt Hàng");
        }
        return "redirect:/admin/daily/index";
    }
}
