package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.bean.HangHoaCount;
import com.Dy.QuanLyKho.bean.HangHoaLN;
import com.Dy.QuanLyKho.bean.PhieuNhapCount;
import com.Dy.QuanLyKho.dao.*;
import com.Dy.QuanLyKho.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class HomeController {

    @Autowired
    TaiKhoanDao dao;

    @Autowired
    HttpSession session;

    TaiKhoan getuser;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "admin/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model, @RequestParam("username") String username,
                        @RequestParam("password") String password) {

        TaiKhoan taiKhoan = dao.getById(username);
        getuser = taiKhoan;
        if (taiKhoan.getPassword().equals(password)) {
            if (taiKhoan.getNhanVien().getChucVu().getMaCV() == 1){
                session.setAttribute("current", getuser);
                System.out.println(session.getAttribute("current"));
                TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
                System.out.println(taiKhoan1.getUsername() + "A");
                System.out.println(taiKhoan1.getPassword() + "A");
            }
            if (taiKhoan.getNhanVien().getChucVu().getMaCV() == 2){
                session.setAttribute("current", getuser);
                System.out.println(session.getAttribute("current"));
                TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
                System.out.println(taiKhoan1.getUsername() + "A");
                System.out.println(taiKhoan1.getPassword() + "A");
            }
            if (taiKhoan.getNhanVien().getChucVu().getMaCV() == 4){
                session.setAttribute("current", getuser);
                System.out.println(session.getAttribute("current"));
                TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
                System.out.println(taiKhoan1.getUsername() + "A");
                System.out.println(taiKhoan1.getPassword() + "A");
            }
            if (taiKhoan.getNhanVien().getChucVu().getMaCV() == 5){
                session.setAttribute("current", getuser);
                System.out.println(session.getAttribute("current"));
                TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
                System.out.println(taiKhoan1.getUsername() + "A");
                System.out.println(taiKhoan1.getPassword() + "A");
            }
            return "admin/index";
        }
        model.addAttribute("message", "Đăng nhập thất bại!");
        return "admin/login";
    }

    @Autowired
    NhanVienDao nhanVienDao;

    @ModelAttribute("dsNhanVien")
    public List<NhanVien> getNhanVien() {
        List<NhanVien> dsNhanVien = nhanVienDao.findAll();
        return dsNhanVien;
    }

    @Autowired
    TaiKhoanDao taiKhoanDao;
    @RequestMapping(value = "dangki", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("taiKhoan", new TaiKhoan());
        return "admin/dangki";
    }

    @RequestMapping(value = "dangki", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("taiKhoan") TaiKhoan taiKhoan, BindingResult errors) {
        taiKhoan.setActive(true);
        if (taiKhoan.getUsername().trim().length() == 0) {
            errors.rejectValue("username", "username", "Vui Lòng Tên Tài Khoản");
        }
        if (taiKhoan.getPassword().trim().length() == 0) {
            errors.rejectValue("password", "password", "Vui Lòng Nhập Mật Khẩu");
        }
        if (errors.hasErrors()) {
            model.addAttribute("message", "Vui lòng sửa các lỗi sau");
        } else {
            model.addAttribute("message", "Chúc Mừng Bạn Đã Nhập Đúng");
            try {
                taiKhoanDao.save(taiKhoan);
                model.addAttribute("message", "Đăng Kí Thành Công!");
            } catch (Exception e) {
                model.addAttribute("message", "Đăng Kí Thất Bại!");
            }
        }
        return "admin/dangki";
    }

    @RequestMapping(value = "logout")
    public String logout(HttpSession session) {
        session.removeAttribute("current");
        getuser = null;
        return "redirect:/login";
    }

    @RequestMapping(value = "taikhoan", method = RequestMethod.GET)
    public String taikhoan(ModelMap model) {
        if (getuser == null) {
            return "redirect:/login";
        }
        TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
        if (taiKhoan1.getNhanVien().getChucVu().getMaCV() != 1){
            return "redirect:/login";
        }
        TaiKhoan taiKhoan = taiKhoanDao.getById(getuser.getUsername());
        model.addAttribute("taiKhoan", taiKhoan);
        return "admin/taikhoan";
    }

    @RequestMapping(value = "taikhoan/update", method = RequestMethod.POST)
    public String taikhoan(ModelMap model, @ModelAttribute("taiKhoan") TaiKhoan taiKhoan) {
        try {
            taiKhoanDao.save(taiKhoan);
            model.addAttribute("message", "Cập Nhật Thành Công!");
        } catch (Exception e) {
            model.addAttribute("message", "Cập Nhật Thất Bại!");
        }
        return taikhoan(model);
    }

    @Autowired
    DonDatHangDao donDatHangDao;

    @Autowired
    PhieuNhapDao phieuNhapDao;

    @Autowired
    HangHoaDao hangHoaDao;

    @RequestMapping(value = "admin/doanhso", method = RequestMethod.GET)
    public String doanhso(ModelMap model){
        if (getuser == null) {
            return "redirect:/login";
        }
        TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
        if (taiKhoan1.getNhanVien().getChucVu().getMaCV() != 1){
            return "redirect:/login";
        }
        return "admin/doanhso";
    }

    @RequestMapping(value = "admin/doanhso", method = RequestMethod.POST)
    public String doanhSo(ModelMap model, @RequestParam("from") String from, @RequestParam("to") String to) {
        try {
            Date from1 = new SimpleDateFormat("yyyy-MM-dd").parse(from);
            Date to1 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            model.addAttribute("from",from);
            model.addAttribute("to",to);
            List<DonDatHang> dsDonDatHang = donDatHangDao.findAllByNgayBetweenAndTinhTrang(from1, to1,3);
            model.addAttribute("dsDonDatHang", dsDonDatHang);
            List<PhieuNhap> dsPhieuNhap = phieuNhapDao.findAllByNgayNhapBetweenAndTinhTrang(from1, to1,true);
            model.addAttribute("dsPhieuNhap", dsPhieuNhap);
            long tong = 0;
            for(DonDatHang u : dsDonDatHang) {
                tong += u.getTongTien();
            }
            model.addAttribute("tongTien",tong);
            long tongNhap = 0;
            for(PhieuNhap u : dsPhieuNhap) {
                tongNhap += u.getTongTien();
            }
            model.addAttribute("tongTienNhap",tongNhap);


            return "admin/doanhso";
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "admin/doanhso";
    }

    List<PhieuNhap> dsPhieuNhap;

    @RequestMapping(value = "admin/doanhthu", method = RequestMethod.GET)
    public String doanhThu(ModelMap model){
        if (getuser == null) {
            return "redirect:/login";
        }
        TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
        if (taiKhoan1.getNhanVien().getChucVu().getMaCV() != 1){
            return "redirect:/login";
        }
        return "admin/doanhthu";
    }

    @RequestMapping(value = "admin/doanhthu", method = RequestMethod.POST)
    public String doanhThu(ModelMap model, @RequestParam("from") String from, @RequestParam("to") String to) {
        try {

            Date from1 = new SimpleDateFormat("yyyy-MM-dd").parse(from);
            Date to1 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            model.addAttribute("from",from);
            model.addAttribute("to",to);
            List<DonDatHang> dsDonDatHang = donDatHangDao.findAllByNgayBetweenAndTinhTrang(from1, to1,3);
            model.addAttribute("dsDonDatHang", dsDonDatHang);
            dsPhieuNhap = phieuNhapDao.findAllByNgayNhapBetweenAndTinhTrang(from1, to1,true);
            model.addAttribute("dsPhieuNhap", dsPhieuNhap);

            long tong = 0;
            long tongNhap = 0;

            List<HangHoa> list = hangHoaDao.findAll();
            List<HangHoaCount> list1 = new ArrayList<>();
            for (HangHoa u : list){
                HangHoaCount hangHoaCount = new HangHoaCount();
                hangHoaCount.setHangHoa(u);
                hangHoaCount.setSoLuong(0);
                for (DonDatHang donDatHang : dsDonDatHang){
                    for (CTDDH ctddh : donDatHang.getDsCTDonDatHang()){
                        if (ctddh.getHangHoa().getMaHangHoa() == u.getMaHangHoa()){
                            hangHoaCount.setSoLuong(hangHoaCount.getSoLuong() + ctddh.getSoLuong());
                        }
                    }
                }
                if(hangHoaCount.getSoLuong() != 0) {
                    list1.add(hangHoaCount);
                    tong+=hangHoaCount.getSoLuong();
                }
            }

            model.addAttribute("dshangHoa1", list1);
            List<HangHoaCount> list2 = new ArrayList<>();
            for (HangHoa u : list){
                HangHoaCount hangHoaCount = new HangHoaCount();
                hangHoaCount.setHangHoa(u);
                hangHoaCount.setSoLuong(0);
                for (PhieuNhap phieuNhap : dsPhieuNhap){
                    for (CTPN ctpn : phieuNhap.getDsCTPhieuNhap()){
                        if (ctpn.getHangHoa().getMaHangHoa() == u.getMaHangHoa()){
                            hangHoaCount.setSoLuong(hangHoaCount.getSoLuong() + ctpn.getSoLuong());
                        }
                    }
                }
                if(hangHoaCount.getSoLuong() != 0){
                    list2.add(hangHoaCount);
                    tongNhap+=hangHoaCount.getSoLuong();
                }
            }
            model.addAttribute("dshangHoa", list2);
            model.addAttribute("tongTien",tong);
            model.addAttribute("tongTienNhap",tongNhap);
            return "admin/doanhthu";
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "admin/doanhthu";
    }

    @RequestMapping(value = "admin/loinhuan", method = RequestMethod.GET)
    public String loiNhuan(ModelMap model){
        if (getuser == null) {
            return "redirect:/login";
        }
        TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
        if (taiKhoan1.getNhanVien().getChucVu().getMaCV() != 1){
            return "redirect:/login";
        }
        return "admin/loinhuan";
    }

    @RequestMapping(value = "admin/loinhuan", method = RequestMethod.POST)
    public String loiNhuan(ModelMap model, @RequestParam("from") String from, @RequestParam("to") String to) {
        try {

            Date from1 = new SimpleDateFormat("yyyy-MM-dd").parse(from);
            Date to1 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            model.addAttribute("from",from);
            model.addAttribute("to",to);
            List<DonDatHang> dsDonDatHang = donDatHangDao.findAllByNgayBetweenAndTinhTrang(from1, to1,3);
            model.addAttribute("dsDonDatHang", dsDonDatHang);
            dsPhieuNhap = phieuNhapDao.findAllByNgayNhapBetweenAndTinhTrang(from1, to1,true);
            model.addAttribute("dsPhieuNhap", dsPhieuNhap);


            List<HangHoa> list = hangHoaDao.findAll();
            List<HangHoaLN> list1 = new ArrayList<>();
            for (HangHoa u : list){
                HangHoaLN hangHoaLN = new HangHoaLN();
                hangHoaLN.setHangHoa(u);
                hangHoaLN.setSoLuongBan(0);
                for (DonDatHang donDatHang : dsDonDatHang){
                    for (CTDDH ctddh : donDatHang.getDsCTDonDatHang()){
                        if (ctddh.getHangHoa().getMaHangHoa() == u.getMaHangHoa()){
                            hangHoaLN.setSoLuongBan(hangHoaLN.getSoLuongBan() + ctddh.getSoLuong());
                            hangHoaLN.setTongTienBan(hangHoaLN.getTongTienBan() + ctddh.getGiaBan() * ctddh.getSoLuong());
                        }
                    }
                }
                for (PhieuNhap phieuNhap : dsPhieuNhap){
                    for (CTPN ctpn : phieuNhap.getDsCTPhieuNhap()){
                        if (ctpn.getHangHoa().getMaHangHoa() == u.getMaHangHoa()){
                            hangHoaLN.setSoLuongNhap(hangHoaLN.getSoLuongNhap() + ctpn.getSoLuong());
                            hangHoaLN.setTongTienNhap(hangHoaLN.getTongTienNhap() + ctpn.getGia() * ctpn.getSoLuong());
                        }
                    }
                }
                if (hangHoaLN.getSoLuongBan() != 0 && hangHoaLN.getSoLuongNhap() != 0){
                    list1.add(hangHoaLN);
                }
            }

            model.addAttribute("dshangHoa", list1);
            return "admin/loinhuan";
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "admin/loinhuan";
    }

    @RequestMapping(value = "admin/top10", method = RequestMethod.GET)
    public String top10(ModelMap model){
        if (getuser == null) {
            return "redirect:/login";
        }
        TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
        if (taiKhoan1.getNhanVien().getChucVu().getMaCV() != 1){
            return "redirect:/login";
        }
        return "admin/top10sp";
    }

    @RequestMapping(value = "admin/top10", method = RequestMethod.POST)
    public String top10(ModelMap model, @RequestParam("from") String from, @RequestParam("to") String to) {
        try {

            Date from1 = new SimpleDateFormat("yyyy-MM-dd").parse(from);
            Date to1 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            model.addAttribute("from",from);
            model.addAttribute("to",to);
            List<DonDatHang> dsDonDatHang = donDatHangDao.findAllByNgayBetweenAndTinhTrang(from1, to1,3);
            model.addAttribute("dsDonDatHang", dsDonDatHang);
            dsPhieuNhap = phieuNhapDao.findAllByNgayNhapBetweenAndTinhTrang(from1, to1,true);
            model.addAttribute("dsPhieuNhap", dsPhieuNhap);

            List<HangHoa> list = hangHoaDao.findAll();
            List<HangHoaCount> list1 = new ArrayList<>();
            for (HangHoa u : list){
                HangHoaCount hangHoaCount = new HangHoaCount();
                hangHoaCount.setHangHoa(u);
                hangHoaCount.setSoLuong(0);
                for (DonDatHang donDatHang : dsDonDatHang){
                    for (CTDDH ctddh : donDatHang.getDsCTDonDatHang()){
                        if (ctddh.getHangHoa().getMaHangHoa() == u.getMaHangHoa()){
                            hangHoaCount.setSoLuong(hangHoaCount.getSoLuong() + ctddh.getSoLuong());

                        }
                    }
                }
                if(hangHoaCount.getSoLuong() != 0) {
                    list1.add(hangHoaCount);
                }
            }
            Collections.sort(list1, new Comparator<HangHoaCount>() {
                @Override
                public int compare(HangHoaCount o1, HangHoaCount o2) {
                    return o1.getSoLuong().compareTo(o2.getSoLuong());
                }
            });
            Collections.reverse(list1);

            int i = 0;
            for (HangHoaCount hangHoaCount : list1) {
                model.addAttribute("hanghoa" + i,hangHoaCount);
                i++;
            }
            for (int j = i;j < 10; j ++){
                model.addAttribute("hanghoa" + j,new HangHoaCount("empty",0));
            }

            model.addAttribute("dshangHoa1", list1);
            return "admin/top10sp";
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "admin/top10sp";
    }

    @RequestMapping(value = "admin/doanhthu/detail/{maHangHoa}")
    public String detail(ModelMap model, @PathVariable("maHangHoa") int maHangHoa) {
        List<PhieuNhapCount> list = new ArrayList<>();
        int i = 1;
        for (PhieuNhap u : dsPhieuNhap){
            for (CTPN ctpn : u.getDsCTPhieuNhap()){
                if (ctpn.getHangHoa().getMaHangHoa() == maHangHoa){
                    PhieuNhapCount phieuNhapCount = new PhieuNhapCount();
                    phieuNhapCount.setStt(i++);
                    phieuNhapCount.setPhieuNhap(u);
                    phieuNhapCount.setSoLuong(ctpn.getSoLuong());
                    phieuNhapCount.setGia(ctpn.getGia());
                    list.add(phieuNhapCount);
                }
            }
        }
        model.addAttribute("hangHoa",hangHoaDao.findById(maHangHoa));
        model.addAttribute("dsPhieuNhap",list);
        return "admin/cthhnhap";
    }

//    @Autowired
//    public JavaMailSender emailSender;
//
//    @RequestMapping(value = "quenmatkhau", method = RequestMethod.GET)
//    public String quenmatkhau(ModelMap model){
//        return "admin/quenmatkhau";
//    }
//
//    @RequestMapping(value = "quenmatkhau", method = RequestMethod.POST)
//    public String sendSimpleEmail(ModelMap model, @RequestParam("email") String email) {
//
//        // Create a Simple MailMessage.
//        SimpleMailMessage message = new SimpleMailMessage();
//        try {
//            List<NhanVien> dsNhanVien = nhanVienDao.findAllByEmail(email);
//            TaiKhoan dsTaiKhoan = taiKhoanDao.findByUsername(dsNhanVien.get(0).getTaiKhoan().getUsername());
//            if (dsTaiKhoan != null){
//                message.setTo(email);
//                message.setSubject("Lấy Lại Mật khẩu");
//                message.setText("Tài khoản: "+ dsTaiKhoan.getUsername() + "\nMật Khẩu: " + dsTaiKhoan.getPassword());
//
//                // Send Message!
//                this.emailSender.send(message);
//            }
//            model.addAttribute("message", "Gửi Mail Thành Công!");
//        } catch (Exception e) {
//            model.addAttribute("message", "Gửi Mail Thất Bại!");
//        }
//        return "admin/quenmatkhau";
//    }
}
