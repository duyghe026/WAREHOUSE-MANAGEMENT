package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@Table(name = "ctddh")
public class CTDDH implements Serializable {
    @EmbeddedId
    private CTDDHId id;

    @Column(name = "soluong")
    private int soLuong;

    @Column(name = "giaban")
    private long giaBan;

    @ManyToOne()
    @JoinColumn(name = "mahanghoa",insertable = false, updatable = false)
    private HangHoa hangHoa;

    @ManyToOne()
    @JoinColumn(name = "maddh",insertable = false, updatable = false)
    private DonDatHang donDatHang;
}
