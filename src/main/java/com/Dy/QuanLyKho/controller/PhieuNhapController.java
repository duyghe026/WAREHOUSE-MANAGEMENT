package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.dao.*;
import com.Dy.QuanLyKho.entity.*;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.aspectj.bridge.IMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/nhap/")
public class PhieuNhapController {

    @Autowired
    PhieuNhapDao dao;

    @Autowired
    NhanVienDao nhanVienDao;

    @Autowired
    NhaCungCapDao nhaCungCapDao;

    @Autowired
    HangHoaDao hangHoaDao;

    @Autowired
    CTPhieuNhapDao ctPhieuNhapDao;

    @ModelAttribute("dsNhanVien")
    public List<NhanVien> getDSNhanVien(HttpSession session) {
        List<NhanVien> list = new ArrayList<>();
        TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
        if (taiKhoan1.getNhanVien().getChucVu().getMaCV() != 1) {
            list.add(taiKhoan1.getNhanVien());
            return list;
        }
        return nhanVienDao.findAll();
    }

    @ModelAttribute("dsNhaCungCap")
    public List<NhaCungCap> getDSNhaCungCap() {
        return nhaCungCapDao.findAll();
    }

    @ModelAttribute("dsHangHoa")
    public List<HangHoa> getDSHangHoa() {
        return hangHoaDao.findAll();
    }

    @RequestMapping("index")
    public String index(Model model) {
        List<PhieuNhap> dsPhieuNhap = dao.findByOrderByMaPNDesc();
        model.addAttribute("dsPhieuNhap", dsPhieuNhap);
        return "admin/nhap/index";
    }

    @RequestMapping(value = "detail/{maPN}")
    public String detail(ModelMap model, @PathVariable("maPN") int maPN) {
        PhieuNhap phieuNhap = dao.findById(maPN);
        if (phieuNhap.isTinhTrang() == false) {
            return "redirect:/admin/nhap/insertdetail/" + phieuNhap.getMaPN();
        } else {
            model.addAttribute("phieuNhap", phieuNhap);
            return "admin/nhap/detail";
        }
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("phieuNhap", new PhieuNhap());
        return "admin/nhap/insert";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("phieuNhap") PhieuNhap phieuNhap) {
        phieuNhap.setTinhTrang(false);
        phieuNhap.setNgayNhap(new Date());
        dao.save(phieuNhap);
        return "redirect:/admin/nhap/insertdetail/" + phieuNhap.getMaPN();
    }

    @RequestMapping(value = "xacnhan/{maPN}", method = RequestMethod.GET)
    public String xacNhan(ModelMap model, @PathVariable("maPN") int maPN) {
        PhieuNhap phieuNhap = dao.findById(maPN);
        phieuNhap.setNgayNhap(new Date());
        phieuNhap.setTinhTrang(true);
        for (CTPN u : phieuNhap.getDsCTPhieuNhap()) {
            HangHoa hangHoa = hangHoaDao.findById(u.getHangHoa().getMaHangHoa());
            if (u.getGia() > hangHoa.getGia()) {
                hangHoa.setGia(u.getGia() * 110 / 100);
            }
            int soLuong = hangHoa.getSoLuong() + u.getSoLuong();
            hangHoa.setSoLuong(soLuong);
            hangHoaDao.save(hangHoa);
        }
        dao.save(phieuNhap);
        return "redirect:/admin/nhap/index";
    }

    @RequestMapping(value = "huy/{maPN}", method = RequestMethod.GET)
    public String huy(ModelMap model, @PathVariable("maPN") int maPN) {
        PhieuNhap phieuNhap = dao.findById(maPN);
        if (phieuNhap.isTinhTrang() == false) {
            for (CTPN u : phieuNhap.getDsCTPhieuNhap()) {
                ctPhieuNhapDao.delete(u);
            }
            dao.delete(phieuNhap);
        }
        return "redirect:/admin/nhap/index";
    }

    @RequestMapping(value = "insertdetail/{maPN}", method = RequestMethod.GET)
    public String insertdetail(ModelMap model, @PathVariable("maPN") int maPN) {
        model.addAttribute("CTPN", new CTPN());
        model.addAttribute("maPN", maPN);
        model.addAttribute("phieuNhap", dao.findById(maPN));
        return "admin/nhap/insertdetail";
    }

    @RequestMapping(value = "insertdetail/{maPN}", method = RequestMethod.POST)
    public String insertdetail(ModelMap model, @ModelAttribute("CTPN") CTPN ctpn,
                               @PathVariable("maPN") int maPN, RedirectAttributes redirectAttributes) {
        PhieuNhap phieuNhap = dao.findById(maPN);
        for (CTPN u : phieuNhap.getDsCTPhieuNhap()) {
            if (u.getHangHoa().getMaHangHoa() == ctpn.getHangHoa().getMaHangHoa()) {

                CTPNId ctpnId = new CTPNId(maPN, ctpn.getHangHoa().getMaHangHoa());
                CTPN ctpn1 = ctPhieuNhapDao.findAllById(ctpnId).get(0);
                ctpn1.setSoLuong(ctpn.getSoLuong());
                ctpn1.setGia(ctpn.getGia());

                try {
                    ctPhieuNhapDao.save(ctpn1);
                    redirectAttributes.addFlashAttribute("message", "Cập Nhật Thành Công!");
                } catch (Exception e) {
                    redirectAttributes.addFlashAttribute("message", "Cập Nhật Thất Bại!");
                }
                return "redirect:/admin/nhap/insertdetail/{maPN}";
            }
        }
        ctpn.setPhieuNhap(phieuNhap);
        try {
            CTPNId ctpnId = new CTPNId(maPN, ctpn.getHangHoa().getMaHangHoa());
            ctpn.setId(ctpnId);
            ctPhieuNhapDao.save(ctpn);
            redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Thêm Mới Thất Bại!");
        }
        return "redirect:/admin/nhap/insertdetail/{maPN}";
    }

    @RequestMapping(value = "insertdetail/{maPN}/update/{maHangHoa}", method = RequestMethod.GET)
    public String updatedetail(ModelMap model, @PathVariable("maPN") int maPN, @PathVariable("maHangHoa") Integer maHangHoa) {
        CTPNId ctpnId = new CTPNId(maPN, maHangHoa);
        CTPN ctpn = ctPhieuNhapDao.findAllById(ctpnId).get(0);
        PhieuNhap phieuNhap = dao.findById(maPN);

        model.addAttribute("phieuNhap", phieuNhap);
        model.addAttribute("maPN", maPN);
        model.addAttribute("CTPN", ctpn);
        return "admin/nhap/insertdetail";
    }

    @RequestMapping(value = "insertdetail/{maPN}/delete/{maHangHoa}", method = RequestMethod.GET)
    public String deletedetail(ModelMap model, @PathVariable("maPN") Integer maPN, @PathVariable("maHangHoa") Integer maHangHoa) {
        try {
            CTPNId ctpnId = new CTPNId(maPN, maHangHoa);
            CTPN ctpn = ctPhieuNhapDao.findAllById(ctpnId).get(0);
            ctPhieuNhapDao.delete(ctpn);
            model.addAttribute("message", "Xóa Thành Công!");
        } catch (Exception e) {
            model.addAttribute("message", e.toString());
        }
        return "redirect:/admin/nhap/insertdetail/{maPN}";
    }

    @RequestMapping(value = "excel", method = RequestMethod.GET)
    public String insertExcel(ModelMap model) {
        return "admin/nhap/insertbyexcel";
    }

    @RequestMapping(value = "excel", method = RequestMethod.POST)
    public String excelReader(@RequestParam("file") MultipartFile excel,HttpSession session,RedirectAttributes re) {

        try {
            XSSFWorkbook workbook = new XSSFWorkbook(excel.getInputStream());
            XSSFSheet sheet = workbook.getSheetAt(0);

            XSSFRow row1 = sheet.getRow(0);
            List<NhaCungCap> nhaCungCap = nhaCungCapDao.findAllByMst(Integer.parseInt(row1.getCell(0).getRawValue()));
            if (nhaCungCap.size() == 0){
                re.addFlashAttribute("message","MST Của Nhà Cung Cấp Không Tồn Tại");
                return "redirect:/admin/nhap/index";
            };
            PhieuNhap phieuNhap = new PhieuNhap();
            TaiKhoan taiKhoan1 = (TaiKhoan) session.getAttribute("current");
            phieuNhap.setNhanVien(taiKhoan1.getNhanVien());
            phieuNhap.setNhaCungCap(nhaCungCap.get(0));
            phieuNhap.setTinhTrang(false);
            phieuNhap.setNgayNhap(new Date());
            dao.save(phieuNhap);

            String string = "";

            for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
                XSSFRow row = sheet.getRow(i);
                List<HangHoa> hangHoa = hangHoaDao.findAllByMaHangHoa(Integer.parseInt(row.getCell(0).getRawValue()));
                if (hangHoa.size() == 0){
                    string +="<p style=\"color:red;\">Mã Hàng Hóa " + row.getCell(0).getRawValue() + " Không Tồn Tại. </p>";
                    continue;
                };
                CTPN ctpn = new CTPN();
                ctpn.setPhieuNhap(phieuNhap);
                CTPNId ctpnId = new CTPNId(phieuNhap.getMaPN(),hangHoa.get(0).getMaHangHoa());
                ctpn.setId(ctpnId);
                ctpn.setHangHoa(hangHoa.get(0));
                List<CTPN> list = ctPhieuNhapDao.findAllById(ctpnId);
                if (list.size() != 0){
                    string += "<p style=\"color:red;\">Mã Hàng Hóa " + row.getCell(0).getRawValue() + " Bị Trùng. </p>";
                    continue;
                }
                ctpn.setSoLuong(Integer.parseInt(row.getCell(1).getRawValue()));
                ctpn.setGia(Integer.parseInt(row.getCell(2).getRawValue()));
                ctPhieuNhapDao.save(ctpn);
            }
            if (string != ""){
                re.addFlashAttribute("message", string);
            } else {
                re.addFlashAttribute("message","Thêm Thành Công!");
            }
            return "redirect:/admin/nhap/insertdetail/" + phieuNhap.getMaPN();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/nhap/index";
    }
}
