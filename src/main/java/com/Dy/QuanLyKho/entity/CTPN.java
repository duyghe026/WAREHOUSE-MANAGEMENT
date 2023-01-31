package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@Table(name = "ctpn")
public class CTPN implements Serializable {
    @EmbeddedId
    private CTPNId id;

    @Column(name = "soluong")
    private int soLuong;

    @Column(name = "gia")
    private long gia;

    @ManyToOne()
    @JoinColumn(name = "mahanghoa",insertable = false, updatable = false)
    private HangHoa hangHoa;

    @ManyToOne()
    @JoinColumn(name = "mapn",insertable = false, updatable = false)
    private PhieuNhap phieuNhap;
}
