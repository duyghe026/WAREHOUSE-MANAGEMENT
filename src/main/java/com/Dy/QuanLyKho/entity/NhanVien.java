package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Getter
@Setter
@Table(name="nhanvien")
public class NhanVien implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maNV;

    @Column(name = "ho")
    private String ho;

    @Column(name = "ten")
    private String ten;

    @Column(name = "diachi")
    private String diaChi;

    @Column(name = "cmnd")
    private String cmnd;

    @Column(name = "ngaysinh")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ngaySinh;

    @Column(name = "tinhtrang")
    private Boolean tinhTrang;

    @Column(name = "gioitinh")
    private Boolean gioiTinh;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

    @ManyToOne
    @JoinColumn(name="macv")
    private ChucVu chucVu;

    @OneToOne(mappedBy = "nhanVien", fetch = FetchType.EAGER)
    private TaiKhoan taiKhoan;

    public String getFullName() {
        return ho + " " + ten;
    }
}
