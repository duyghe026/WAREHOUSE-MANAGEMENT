package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Getter
@Setter
@Table(name="hanghoa")
public class HangHoa implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mahanghoa")
    private int maHangHoa;

    @Column(name = "ten")
    private String ten;

    @Column(name = "gia")
    private long gia;

    @Column(name = "giamgia")
    private int giamGia;

    @Column(name = "anh")
    private String anh;

    @Column(name = "ghichu")
    private String ghiChu;

    @Column(name = "tinhtrang")
    private Boolean tinhTrang;

    @Column(name = "soluong")
    private int soLuong;

    @Column(name = "dvt")
    private String dvt;

    @ManyToOne
    @JoinColumn(name="maloai")
    private TheLoai theLoai;

    @OneToMany(mappedBy = "hangHoa")
    private Collection<CTPN> dsCTPhieuNhap;


    @OneToMany(mappedBy = "hangHoa")
    private Collection<CTDDH> dsCTDDH;

    public long getGiaThat() {
        long giaThat = gia;
        if(giamGia != 0) {
            giaThat -= gia * 0.01 * giamGia;
        }
        return giaThat;
    }
}
