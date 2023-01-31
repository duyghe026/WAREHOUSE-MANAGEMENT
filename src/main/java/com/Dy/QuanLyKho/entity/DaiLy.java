package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Getter
@Setter
@Table(name = "daily")
public class DaiLy implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maDL;

    @Column(name = "mst")
    private int mst;

    @Column(name = "tendl")
    private String tenDL;

    @Column(name = "diachi")
    private String diaChi;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "chieckhau")
    private float ChiecKhau;

    @OneToMany(mappedBy = "daiLy")
    private Collection<DonDatHang> dsDonDatHang;
}
