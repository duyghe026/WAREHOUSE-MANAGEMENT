package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Getter
@Setter
@Table(name = "nhacungcap")
public class NhaCungCap implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maNCC;

    @Column(name = "mst")
    private int mst;

    @Column(name = "tenncc")
    private String tenNCC;

    @Column(name = "diachi")
    private String diaChi;

    @Column(name = "sdt")
    private String sdt;

    @OneToMany(mappedBy = "nhaCungCap",fetch = FetchType.EAGER)
    private Collection<PhieuNhap> dsPhieuNhap;
}
