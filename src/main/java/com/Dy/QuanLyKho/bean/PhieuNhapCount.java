package com.Dy.QuanLyKho.bean;

import com.Dy.QuanLyKho.entity.PhieuNhap;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PhieuNhapCount {
    private Integer stt;
    private PhieuNhap phieuNhap;
    private long gia;
    private Integer soLuong;
}
