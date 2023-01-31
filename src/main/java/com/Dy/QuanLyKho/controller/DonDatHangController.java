package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.*;
import com.Dy.QuanLyKho.entity.*;
import com.itextpdf.html2pdf.HtmlConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/dondathang/")
public class DonDatHangController {

    @Autowired
    DonDatHangDao dao;

    @Autowired
    NhanVienDao nhanVienDao;

    @Autowired
    DaiLyDao daiLyDao;

    @Autowired
    HangHoaDao hangHoaDao;

    @Autowired
    CTDonDatHangDao ctDonDatHangDao;

    @ModelAttribute("dsNhanVien")
    public List<NhanVien> getDSNhanVien(HttpSession session) {
        List<NhanVien> list = new ArrayList<>();
        TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
        if(taiKhoan1.getNhanVien().getChucVu().getMaCV() != 1){
            list.add(taiKhoan1.getNhanVien());
            return list;
        }
        return nhanVienDao.findAll();
    }

    @ModelAttribute("dsDaiLy")
    public List<DaiLy> getDSDaiLy() {
        return daiLyDao.findAll();
    }

    @ModelAttribute("dsHangHoa")
    public List<HangHoa> getDSHangHoa() {
        return hangHoaDao.findAllByTinhTrang(true);
    }

    @RequestMapping("index")
    public String index(Model model) {
        List<DonDatHang> dsDonDatHang = dao.findAll();
        model.addAttribute("dsDonDatHang", dsDonDatHang);
        return "admin/dondathang/index";
    }

    @RequestMapping(value = "detail/{maDDH}")
    public String detail(ModelMap model, @PathVariable("maDDH") int maDDH) {
        DonDatHang donDatHang = dao.findById(maDDH);
        model.addAttribute("donDatHang", donDatHang);
        return "admin/dondathang/detail";
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("donDatHang", new DonDatHang());
        return "admin/dondathang/insert";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("donDatHang") DonDatHang donDatHang) {
        donDatHang.setTinhTrang(1);
        donDatHang.setNgay(new Date());
        dao.save(donDatHang);
        return "redirect:/admin/dondathang/insertdetail/" + donDatHang.getMaDDH();
    }

    @RequestMapping(value = "hoadon/{maDDH}", method = RequestMethod.GET)
    public String hoadon(ModelMap model, @PathVariable("maDDH") int maDDH) {
        model.addAttribute("donDatHang", dao.findById(maDDH));
        return "redirect:/pdf/generate/" + maDDH;
    }

    @RequestMapping(value = "xacnhan/{maDDH}", method = RequestMethod.GET)
    public String xacNhan(ModelMap model, @PathVariable("maDDH") int maDDH) {
        DonDatHang donDatHang = dao.findById(maDDH);
        donDatHang.setTinhTrang(3);
        dao.save(donDatHang);
        return "redirect:/admin/dondathang/index";
    }

    @RequestMapping(value = "huy/{maDDH}", method = RequestMethod.GET)
    public String huy(ModelMap model, @PathVariable("maDDH") int maDDH) {
        DonDatHang donDatHang = dao.findById(maDDH);
        donDatHang.setTinhTrang(4);
        for (CTDDH u : donDatHang.getDsCTDonDatHang()){
            HangHoa hangHoa = hangHoaDao.findById(u.getHangHoa().getMaHangHoa());
            int soLuong = hangHoa.getSoLuong() + u.getSoLuong();
            if (soLuong < -1){
                return "redirect:/admin/dondathang/index";
            }
            hangHoa.setSoLuong(soLuong);
            hangHoaDao.save(hangHoa);
        }
        dao.save(donDatHang);
        return "redirect:/admin/dondathang/index";
    }

    @RequestMapping(value = "insertdetail/{maDDH}", method = RequestMethod.GET)
    public String insertdetail(ModelMap model,@PathVariable("maDDH") int maDDH) {
        model.addAttribute("CTDDH", new CTDDH());
        model.addAttribute("maDDH", maDDH);
        model.addAttribute("donDatHang", dao.findById(maDDH));
        return "admin/dondathang/insertdetail";
    }

    @RequestMapping(value = "insertdetail/{maDDH}", method = RequestMethod.POST)
    public String insertdetail(ModelMap model, @ModelAttribute("CTDDH") CTDDH ctddh,
                               @PathVariable("maDDH") int maDDH, RedirectAttributes redirectAttributes) {
        DonDatHang donDatHang = dao.findById(maDDH);
        HangHoa hangHoa = hangHoaDao.findById(ctddh.getHangHoa().getMaHangHoa());
        if (ctddh.getSoLuong() > hangHoa.getSoLuong()) {
            redirectAttributes.addFlashAttribute("message",hangHoa.getTen()+ " chỉ còn số lượng là: "+ hangHoa.getSoLuong());
            return "redirect:/admin/dondathang/insertdetail/{maDDH}";
        }
        for (CTDDH u : donDatHang.getDsCTDonDatHang()) {
            if (u.getHangHoa().getMaHangHoa() == ctddh.getHangHoa().getMaHangHoa()) {
                CTDDHId ctddhId = new CTDDHId(maDDH,ctddh.getHangHoa().getMaHangHoa());
                CTDDH ctddh1 = ctDonDatHangDao.findAllById(ctddhId).get(0);
                ctddh1.setSoLuong(ctddh.getSoLuong());
                ctddh.setGiaBan(hangHoa.getGiaThat());
                try {
                    ctDonDatHangDao.save(ctddh1);
                    redirectAttributes.addFlashAttribute("message", "Cập Nhật Thành Công!");
                } catch (Exception e) {
                    redirectAttributes.addFlashAttribute("message", "Cập Nhật Thất Bại!");
                }
                return "redirect:/admin/dondathang/insertdetail/{maDDH}";
            }
        }
        ctddh.setDonDatHang(donDatHang);
        try {
            CTDDHId ctddhId = new CTDDHId(maDDH,ctddh.getHangHoa().getMaHangHoa());
            ctddh.setId(ctddhId);
            ctddh.setGiaBan(hangHoa.getGiaThat());
            ctDonDatHangDao.save(ctddh);
            redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Thêm Mới Thất Bại!");
        }
        return "redirect:/admin/dondathang/insertdetail/{maDDH}";
    }

    @RequestMapping(value = "insertdetail/{maDDH}/update/{maHangHoa}", method = RequestMethod.GET)
    public String updatedetail(ModelMap model, @PathVariable("maDDH") int maDDH,@PathVariable("maHangHoa") Integer maHangHoa) {
        CTDDHId ctddhId = new CTDDHId(maDDH,maHangHoa);
        CTDDH ctddh = ctDonDatHangDao.findAllById(ctddhId).get(0);
        DonDatHang donDatHang = dao.findById(maDDH);

        model.addAttribute("donDatHang", donDatHang);
        model.addAttribute("maDDH", maDDH);
        model.addAttribute("CTDDH", ctddh);
        return "admin/dondathang/insertdetail";
    }

    @RequestMapping(value = "insertdetail/{maDDH}/delete/{maHangHoa}", method = RequestMethod.GET)
    public String deletedetail(ModelMap model, @PathVariable("maDDH") Integer maDDH,@PathVariable("maHangHoa") Integer maHangHoa) {
        try {
            CTDDHId ctddhId = new CTDDHId(maDDH,maHangHoa);
            CTDDH ctddh = ctDonDatHangDao.findAllById(ctddhId).get(0);
            ctDonDatHangDao.delete(ctddh);
            model.addAttribute("message", "Xóa Thành Công!");
        } catch (Exception e) {
            model.addAttribute("message", e.toString());
        }
        return "redirect:/admin/dondathang/insertdetail/{maDDH}";
    }

    @RequestMapping(value = "save/{maDDH}", method = RequestMethod.GET)
    public String save(ModelMap model,@PathVariable("maDDH") int maDDH) {
        DonDatHang donDatHang = dao.findById(maDDH);
        donDatHang.setTinhTrang(1);
        long tongTien = 0;
        for (CTDDH u : donDatHang.getDsCTDonDatHang()){
            tongTien += u.getSoLuong() * u.getGiaBan();
            HangHoa hangHoa = hangHoaDao.findById(u.getHangHoa().getMaHangHoa());
            int soLuong = hangHoa.getSoLuong() - u.getSoLuong();
            if (soLuong < -1){
                return "redirect:/admin/xuat/index";
            }
            hangHoa.setSoLuong(soLuong);
            hangHoaDao.save(hangHoa);
        }
        DaiLy daiLy = daiLyDao.findById(donDatHang.getDaiLy().getMaDL());
        tongTien = tongTien * (long) (100 - daiLy.getChiecKhau()) / 100;
        donDatHang.setTongTien(tongTien);
        dao.save(donDatHang);
        return "redirect:/admin/dondathang/index";
    }
}
