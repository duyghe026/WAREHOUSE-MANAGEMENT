package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

@Entity
@Getter
@Setter
@Table(name = "DonDatHang")
public class DonDatHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name ="maddh")
    private int maDDH;

    @Column(name ="ngay")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ngay;

    @ManyToOne
    @JoinColumn(name = "manv")
    private NhanVien nhanVien;

    @Column(name ="tinhtrang")
    private int tinhTrang;

    @Column(name ="tongtien")
    private long tongTien;

    @ManyToOne
    @JoinColumn(name="madl")
    private DaiLy daiLy;

    @OneToMany(mappedBy = "donDatHang",fetch = FetchType.EAGER)
    private Collection<CTDDH> dsCTDonDatHang;

    public String getTinhTrangString() {
        if (tinhTrang == 1){
            return "Đã duyệt (chưa xuất hàng)";
        } else if (tinhTrang == 2){
            return "Đang giao(đã xuất hàng)";
        } else if (tinhTrang == 3){
            return "Đã giao";
        } else if (tinhTrang == 4){
            return "Hủy";
        } else {
            return "Lỗi";
        }
    }

    public long getTongTienTemp() {
        long tongTien = 0;
        for (CTDDH u : dsCTDonDatHang) {
            tongTien += u.getGiaBan() * u.getSoLuong();
        }
        return tongTien;
    }
}
