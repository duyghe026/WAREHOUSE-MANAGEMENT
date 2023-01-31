package com.Dy.QuanLyKho.bean;

import com.Dy.QuanLyKho.entity.HangHoa;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HangHoaCount {
    private HangHoa hangHoa;
    private Integer soLuong;

    public HangHoaCount() {
    }

    public HangHoaCount(String name, Integer soLuong) {
        this.hangHoa = new HangHoa();
        this.hangHoa.setTen(name);
        this.soLuong = soLuong;
    }
}
