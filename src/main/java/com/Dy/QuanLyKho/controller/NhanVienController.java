package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.ChucVuDao;
import com.Dy.QuanLyKho.dao.NhaCungCapDao;
import com.Dy.QuanLyKho.dao.NhanVienDao;
import com.Dy.QuanLyKho.dao.TheLoaiDao;
import com.Dy.QuanLyKho.entity.ChucVu;
import com.Dy.QuanLyKho.entity.NhaCungCap;
import com.Dy.QuanLyKho.entity.NhanVien;
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
@RequestMapping("/admin/nhanvien/")
public class NhanVienController {
    @Autowired
    NhanVienDao dao;

    @Autowired
    ChucVuDao chucVuDao;

    @ModelAttribute("dsChucVu")
    public List<ChucVu> getChucVu() {
        List<ChucVu> list = chucVuDao.findAll();
        return list;
    }

    @RequestMapping("index")
    public String index(Model model) {
        List<NhanVien> listNhanVien = dao.findAll();
        model.addAttribute("listNhanVien", listNhanVien);
        return "admin/nhanvien/index";
    }

    @RequestMapping(value="insert",method= RequestMethod.GET)
    public String insert(ModelMap model)
    {
        model.addAttribute("nhanVien",new NhanVien());
        return "admin/nhanvien/insert";
    }

    @RequestMapping(value="insert",method=RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("nhanVien")NhanVien nhanVien, BindingResult errors)
    {
        String string = "";
        if (nhanVien.getHo().trim().length() == 0) {
            errors.rejectValue("ho", "ho", "Vui Lòng Nhập Họ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Họ. </p>";
        }
        if (nhanVien.getTen().trim().length() == 0) {
            errors.rejectValue("ten", "ten", "Vui Lòng Nhập Tên");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên. </p>";
        }
        if (nhanVien.getDiaChi().trim().length() == 0) {
            errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Địa Chỉ. </p>";
        }
        if (nhanVien.getSdt().trim().length() == 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT. </p>";
        }
        if (nhanVien.getSdt().trim().length() != 10 && nhanVien.getSdt().trim().length() != 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT Gồm 10 Số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT Gồm 10 Số. </p>";
        }
        if (nhanVien.getCmnd().trim().length() == 0) {
            errors.rejectValue("cmnd", "cmnd", "Vui Lòng Nhập CMND");
            string += "<p style=\"color:red;\">Vui Lòng Nhập CMND. </p>";
        }
        if (nhanVien.getCmnd().trim().length() != 9 && nhanVien.getCmnd().trim().length() != 12 && nhanVien.getCmnd().trim().length() != 0) {
            errors.rejectValue("cmnd", "cmnd", "Vui Lòng Nhập CMND Gồm 9 hoặc 12 số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập CMND Gồm 9 hoặc 12 số. </p>";
        }
        List<NhanVien> list = dao.findAllByEmail(nhanVien.getEmail());
        if(list.size() != 0){
            errors.rejectValue("email", "email", "Đã Tồn Tại Email");
            string += "<p style=\"color:red;\">Đã Tồn Tại Email. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
        } else {
            try {
                dao.save(nhanVien);
                model.addAttribute("message","Thêm Mới Thành Công!");
            }
            catch (Exception e) {
                model.addAttribute("message","Thêm Mới Thất Bại!");
            }
        }
        return "admin/nhanvien/insert";
    }

    @RequestMapping(value="update/{maNV}",method=RequestMethod.GET)
    public String update(ModelMap model,@PathVariable("maNV") int maNV)
    {
        NhanVien nhanVien = (NhanVien) dao.findById(maNV);
        model.addAttribute("mANV", maNV);
        model.addAttribute("nhanVien", nhanVien);
        return "admin/nhanvien/update";
    }

    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ModelMap model,@ModelAttribute("nhanVien")NhanVien nhanVien,BindingResult errors, RedirectAttributes redirectAttributes)
    {
        String string = "";
        if (nhanVien.getHo().trim().length() == 0) {
            errors.rejectValue("ho", "ho", "Vui Lòng Nhập Họ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Họ. </p>";
        }
        if (nhanVien.getTen().trim().length() == 0) {
            errors.rejectValue("ten", "ten", "Vui Lòng Nhập Tên");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên. </p>";
        }
        if (nhanVien.getDiaChi().trim().length() == 0) {
            errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Địa Chỉ. </p>";
        }
        if (nhanVien.getSdt().trim().length() == 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT. </p>";
        }
        if (nhanVien.getSdt().trim().length() != 10 && nhanVien.getSdt().trim().length() != 0) {
            errors.rejectValue("sdt", "sdt", "Vui Lòng Nhập SDT Gồm 10 Số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập SDT Gồm 10 Số. </p>";
        }
        if (nhanVien.getCmnd().trim().length() == 0) {
            errors.rejectValue("cmnd", "cmnd", "Vui Lòng Nhập CMND");
            string += "<p style=\"color:red;\">Vui Lòng Nhập CMND. </p>";
        }
        if (nhanVien.getCmnd().trim().length() != 9 && nhanVien.getCmnd().trim().length() != 12 && nhanVien.getCmnd().trim().length() != 0) {
            errors.rejectValue("cmnd", "cmnd", "Vui Lòng Nhập CMND Gồm 9 hoặc 12 số");
            string += "<p style=\"color:red;\">Vui Lòng Nhập CMND Gồm 9 hoặc 12 số. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
            return "admin/nhanvien/update";
        } else {
            try {
                dao.save(nhanVien);
                redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
            } catch (Exception e) {
                model.addAttribute("message","Cập Nhật Thất Bại!");
                return "admin/nhanvien/update";
            }
        }
        return "redirect:/admin/nhanvien/index";
    }

//    @RequestMapping(value="delete/{maNV}",method=RequestMethod.GET)
//    public String delete(ModelMap model,@PathVariable("maNV")int maNV)
//    {
//        try {
//            NhanVien nhanVien = (NhanVien) dao.findById(maNV);
//            dao.delete(nhanVien);
//            model.addAttribute("message","Xóa Thành Công!");
//        }
//        catch (Exception e) {
//            model.addAttribute("message","Xóa Thất Bại!");
//        }
//        return "redirect:/admin/nhanvien/index";
//    }
}
