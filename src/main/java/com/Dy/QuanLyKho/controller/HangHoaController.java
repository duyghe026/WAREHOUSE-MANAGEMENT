package com.Dy.QuanLyKho.controller;

import com.Dy.QuanLyKho.bean.HangHoaCount;
import com.Dy.QuanLyKho.dao.DonDatHangDao;
import com.Dy.QuanLyKho.dao.HangHoaDao;
import com.Dy.QuanLyKho.dao.TheLoaiDao;
import com.Dy.QuanLyKho.entity.CTDDH;
import com.Dy.QuanLyKho.entity.DonDatHang;
import com.Dy.QuanLyKho.entity.HangHoa;
import com.Dy.QuanLyKho.entity.TheLoai;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Transactional
@Controller
@RequestMapping("/admin/hanghoa/")
public class HangHoaController {

    @Autowired
    HangHoaDao hangHoaDao;

	@Autowired
	TheLoaiDao theLoaiDao;

    @Autowired
    ServletContext context;


    @ModelAttribute("dsLoai")
    public List<TheLoai> getLoai() {
        List<TheLoai> list = theLoaiDao.findAll();
        return list;
    }

	@RequestMapping("index")
	public String index(ModelMap model) {
		List<HangHoa> list = hangHoaDao.findAll();
		model.addAttribute("dshangHoa", list);
		return "admin/hanghoa/index";
	}

    @Autowired
    DonDatHangDao donDatHangDao;

    @RequestMapping("kho")
    public String kho(ModelMap model) {
        List<HangHoa> list = hangHoaDao.findAll();
        List<DonDatHang> dsDonDatHang = donDatHangDao.findAllByTinhTrang(1);
        List<HangHoaCount> list1 = new ArrayList<>();
        for (HangHoa u : list){
            HangHoaCount hangHoaCount = new HangHoaCount();
            hangHoaCount.setHangHoa(u);
            hangHoaCount.setSoLuong(u.getSoLuong());
            for (DonDatHang donDatHang : dsDonDatHang){
                for (CTDDH ctddh : donDatHang.getDsCTDonDatHang()){
                    if (ctddh.getHangHoa().getMaHangHoa() == u.getMaHangHoa()){
                        hangHoaCount.setSoLuong(hangHoaCount.getSoLuong() + ctddh.getSoLuong());
                    }
                }
            }
            list1.add(hangHoaCount);
        }
        model.addAttribute("theLoai",new TheLoai());
        model.addAttribute("dshangHoa", list1);
        return "admin/hanghoa/kho";
    }

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("hangHoa", new HangHoa());
        return "admin/hanghoa/insert";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("hangHoa") HangHoa hangHoa,
                         @RequestParam("photo") MultipartFile photo, BindingResult errors, RedirectAttributes re)
            throws IllegalStateException, IOException {
        String string = "";
        if (hangHoa.getTen().trim().length() == 0) {
            errors.rejectValue("ten", "ten", "Vui Lòng Nhập Tên Hàng Hóa");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Hàng Hóa. </p>";
        }
        if (hangHoa.getGiamGia() > 99) {
            errors.rejectValue("giamGia", "giamGia", "Vui Lòng Chọn Giảm Giá Nhỏ Hơn 100");
            string += "<p style=\"color:red;\">Vui Lòng Chọn Giảm Giá Nhỏ Hơn 100. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
        } else {
            if (photo.getOriginalFilename().isEmpty()) {
                hangHoa.setAnh("resources/images/default.png");
            } else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
                re.addFlashAttribute("message", "This file type is not supported !");
            } else {
                try {
                    String photoPath = context.getRealPath("/resources/images/" + photo.getOriginalFilename());
                    photo.transferTo(new File(photoPath));
                    hangHoa.setAnh("resources/images/" + photo.getOriginalFilename());
                } catch (Exception e) {
                    re.addFlashAttribute("message", "Save file error: " + e);
                    return "redirect:/admin/hanghoa/insert";
                }
            }

            try {
                hangHoaDao.save(hangHoa);
                re.addFlashAttribute("message", "Thêm Thành Công!");
            } catch (Exception e) {
                re.addFlashAttribute("message", "Thêm Thất Bại!" + e);
                return "redirect:/admin/hanghoa/insert";
            }
            return "redirect:/admin/hanghoa/insert";
        }
        return "admin/hanghoa/insert";
    }

    @RequestMapping(value = "update/{maHangHoa}", method = RequestMethod.GET)
    public String update(ModelMap model, @PathVariable("maHangHoa") Integer maHangHoa) {
        HangHoa hangHoa = (HangHoa) hangHoaDao.getById(maHangHoa);
        model.addAttribute("hangHoa", hangHoa);
        return "admin/hanghoa/update";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(ModelMap model, @ModelAttribute("hangHoa") HangHoa hangHoa,
                         @RequestParam("photo") MultipartFile photo, BindingResult errors, RedirectAttributes re)
            throws IllegalStateException, IOException {
        String string = "";
        if (hangHoa.getTen().trim().length() == 0) {
            errors.rejectValue("ten", "ten", "Vui Lòng Nhập Tên Hàng Hóa");
            string += "<p style=\"color:red;\">Vui Lòng Nhập Tên Hàng Hóa. </p>";
        }
        if (hangHoa.getGiamGia() > 99) {
            errors.rejectValue("giamGia", "giamGia", "Vui Lòng Chọn Giảm Giá Nhỏ Hơn 100");
            string += "<p style=\"color:red;\">Vui Lòng Chọn Giảm Giá Nhỏ Hơn 100. </p>";
        }
        if (errors.hasErrors()) {
            string += "<p>Vui Lòng Sửa Các Lỗi Trên! </p>";
            model.addAttribute("message", string );
            return "admin/hanghoa/update";

        } else {
            if (photo.getOriginalFilename().isEmpty()) {
                HangHoa temp = (HangHoa) hangHoaDao.findById(hangHoa.getMaHangHoa());
                hangHoa.setAnh(temp.getAnh());
                System.out.println(temp.getAnh());
            } else {
                String photoPath = "";
                photoPath = context.getRealPath("resources/images/" + photo.getOriginalFilename());
                photo.transferTo(new File(photoPath));
                hangHoa.setAnh("resources/images/" + photo.getOriginalFilename());
            }
            try {
                hangHoaDao.save(hangHoa);
                re.addFlashAttribute("message", "Cập Nhật Thành Công!");
            } catch (Exception e) {
                model.addAttribute("message", "Cập Nhật Thất Bại!");
                return "admin/hanghoa/update";
            }
            return "redirect:/admin/hanghoa/index";
        }
    }

//    @RequestMapping(value = "delete/{maHangHoa}", method = RequestMethod.GET)
//    public String delete(ModelMap model, @PathVariable("maHangHoa") Integer maHangHoa) {
//        try {
//            HangHoa hangHoa = (HangHoa) hangHoaDao.getById(maHangHoa);
//            hangHoaDao.delete(hangHoa);
//            model.addAttribute("message", "Xóa Thành Công!");
//        } catch (Exception e) {
//            model.addAttribute("message", "Xóa Thất Bại!");
//        }
//        return "redirect:/admin/hanghoa/index";
//    }
}
