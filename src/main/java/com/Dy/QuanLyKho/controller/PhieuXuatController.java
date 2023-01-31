package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.*;
import com.Dy.QuanLyKho.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/xuat/")
public class PhieuXuatController {
    @Autowired
    NhanVienDao nhanVienDao;

    @Autowired
    DaiLyDao daiLyDao;

    @Autowired
    HangHoaDao hangHoaDao;

    @Autowired
    DonDatHangDao donDatHangDao;

    @ModelAttribute("dsNhanVien")
    public List<NhanVien> getDSNhanVien() {
        return nhanVienDao.findAll();
    }

    @ModelAttribute("dsDaiLy")
    public List<DaiLy> getDSDaiLy() {
        return daiLyDao.findAll();
    }

    @ModelAttribute("dsHangHoa")
    public List<HangHoa> getDSHangHoa() {
        return hangHoaDao.findAll();
    }

    @ModelAttribute("dsDonDatHang")
    public List<DonDatHang> getDSDonDatHang() {
        return donDatHangDao.findAllByTinhTrangBetween(1,2);
    }

    @RequestMapping("index")
    public String index(Model model) {
        return "admin/xuat/index";
    }

    @RequestMapping(value = "detail/{maPX}")
    public String detail(ModelMap model, @PathVariable("maPX") int maPX) {
        return "admin/xuat/detail";
    }

    @RequestMapping(value = "insert/{maDDH}")
    public String insert(ModelMap model, @PathVariable("maDDH") int maDDH, HttpSession session) {
        DonDatHang donDatHang = donDatHangDao.findById(maDDH);
        donDatHang.setTinhTrang(2);
        donDatHangDao.save(donDatHang);
        return "redirect:/admin/xuat/index";
    }
}
