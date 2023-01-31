package com.Dy.QuanLyKho.bean;

import com.Dy.QuanLyKho.entity.HangHoa;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HangHoaLN {
    private HangHoa hangHoa;
    private long tongTienNhap;
    private Integer soLuongNhap;
    private long tongTienBan;
    private Integer soLuongBan;

    public HangHoaLN() {
        this.hangHoa = new HangHoa();
        this.tongTienNhap = 0;
        this.soLuongNhap = 0;
        this.tongTienBan = 0;
        this.soLuongBan = 0;
    }

    public HangHoaLN(long tongTienNhap, Integer soLuongNhap, long tongTienBan, Integer soLuongBan) {
        this.hangHoa = new HangHoa();
        this.tongTienNhap = tongTienNhap;
        this.soLuongNhap = soLuongNhap;
        this.tongTienBan = tongTienBan;
        this.soLuongBan = soLuongBan;
    }
}
