package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.NhaCungCapDao;
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
@RequestMapping("/admin/nhacungcap/")
public class NhaCungCapController {

    @Autowired
    NhaCungCapDao dao;

    @RequestMapping("index")
    public String index(Model model) {
        List<NhaCungCap> listNhaCungCap = dao.findAll();
        model.addAttribute("listNhaCungCap", listNhaCungCap);
        return "admin/nhacungcap/index";
    }

    @RequestMapping(value="insert",method= RequestMethod.GET)
    public String insert(ModelMap model)
    {
        model.addAttribute("nhaCungCap",new NhaCungCap());
        return "admin/nhacungcap/insert";
    }

    @RequestMapping(value="insert",method=RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("nhaCungCap")NhaCungCap nhaCungCap,BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (nhaCungCap.getMst() == 0) {
            errors.rejectValue("mst", "mst", "Vui Lòng Nhập Mã Số Thuế");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Mã Số Thuế. </p>";
        }
        if (nhaCungCap.getTenNCC().trim().length() == 0) {
            errors.rejectValue("tenNCC", "tenNCC", "Vui Lòng Nhập Tên Nhà Cung Cấp");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Nhà Cung Cấp. </p>";
        }
        if (nhaCungCap.getDiaChi().trim().length() == 0) {
            errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Địa Chỉ. </p> ";
        }
        if (nhaCungCap.getSdt().trim().length() == 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập Số Điện Thoại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Số Điện Thoại. </p> ";
        }
        if (nhaCungCap.getSdt().trim().length() != 10 && nhaCungCap.getSdt().trim().length() != 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT Gồm 10 Số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT Gồm 10 Số. </p>";
        }
        List<NhaCungCap> list = dao.findAllByMst(nhaCungCap.getMst());
        if(list.size() != 0){
            errors.rejectValue("mst", "mst", "Đã Tồn Tại Mã Số Thuế");
            string += "<p style=\"color:red;\">Đã Tồn Tại Mã Số Thuế. </p> ";
        }
        List<NhaCungCap> list1 = dao.findAllByTenNCC(nhaCungCap.getTenNCC());
        if(list1.size() != 0){
            errors.rejectValue("tenNCC", "tenNCC", "Đã Tồn Tại Tên Nhà Cung Cấp");
            string += "<p style=\"color:red;\">Đã Tồn Tại Tên Nhà Cung Cấp. </p> ";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
        } else {
            try {
                dao.save(nhaCungCap);
                redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
                return "redirect:/admin/nhacungcap/insert";
            } catch (Exception e) {
                model.addAttribute("message", "Thêm Mới Thất Bại!");
            }
        }
        return "admin/nhacungcap/insert";
    }

    @RequestMapping(value="update/{maNCC}",method=RequestMethod.GET)
    public String update(ModelMap model,@PathVariable("maNCC")int maNCC)
    {
        NhaCungCap nhaCungCap = (NhaCungCap) dao.findById(maNCC);
        model.addAttribute("nhaCungCap",nhaCungCap);
        return "admin/nhacungcap/update";
    }

    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ModelMap model, @ModelAttribute("nhaCungCap")NhaCungCap nhaCungCap, BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (nhaCungCap.getMst() == 0) {
            errors.rejectValue("mst", "mst", "Vui Lòng Nhập Mã Số Thuế");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Mã Số Thuế. </p>";
        }
        if (nhaCungCap.getTenNCC().trim().length() == 0) {
            errors.rejectValue("tenNCC", "tenNCC", "Vui Lòng Nhập Tên Nhà Cung Cấp");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Nhà Cung Cấp. </p>";
        }
        if (nhaCungCap.getDiaChi().trim().length() == 0) {
            errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Địa Chỉ. </p> ";
        }
        if (nhaCungCap.getSdt().trim().length() == 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập Số Điện Thoại");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Số Điện Thoại. </p> ";
        }
        if (nhaCungCap.getSdt().trim().length() != 10 && nhaCungCap.getSdt().trim().length() != 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT Gồm 10 Số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT Gồm 10 Số. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
            return "admin/nhacungcap/update";
        } else {
            try {
                dao.save(nhaCungCap);
                redirectAttributes.addFlashAttribute("message","Cập Nhật Thành Công!");
            }
            catch (Exception e) {
                model.addAttribute("message","Cập Nhật Thất Bại!");
                return "admin/nhacungcap/update";
            }
        }
        return "redirect:/admin/nhacungcap/index";
    }

    @RequestMapping(value="delete/{maNCC}",method=RequestMethod.GET)
    public String delete(ModelMap model,@PathVariable("maNCC")int maNCC,RedirectAttributes redirectAttributes)
    {
        try {
            NhaCungCap nhaCungCap = (NhaCungCap) dao.findById(maNCC);
            dao.delete(nhaCungCap);
            redirectAttributes.addFlashAttribute("message","Xóa Thành Công!");
        }
        catch (Exception e) {
            redirectAttributes.addFlashAttribute("message","Xóa Thất Bại! Đã Nhập Hàng Ở Nhà Cung Cấp Này");
        }
        return "redirect:/admin/nhacungcap/index";
    }
}
