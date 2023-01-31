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
@Table(name = "phieunhap")
public class PhieuNhap implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mapn")
    private int maPN;

    @Column(name ="ngaynhap")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ngayNhap;

    @Column(name ="tinhtrang")
    private boolean tinhTrang;

    @ManyToOne
    @JoinColumn(name = "manv")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name="mancc")
    private NhaCungCap nhaCungCap;

    @OneToMany(mappedBy = "phieuNhap",fetch = FetchType.EAGER)
    private Collection<CTPN> dsCTPhieuNhap;

    public long getTongTien() {
        long tongTien = 0;
        for (CTPN u : dsCTPhieuNhap) {
            tongTien += u.getGia() * u.getSoLuong();
        }
        return tongTien;
    }
}
