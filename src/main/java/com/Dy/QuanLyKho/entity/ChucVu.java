package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Getter
@Setter
@Table(name = "chucvu")
public class ChucVu implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maCV;

    @Column(name = "tencv")
    private String tenCV;

    @OneToMany(mappedBy = "chucVu",fetch = FetchType.EAGER)
    private Collection<NhanVien> dsNhanVien;
}
