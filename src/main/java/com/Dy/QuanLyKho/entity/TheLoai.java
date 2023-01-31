package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Getter
@Setter
@Table(name = "theloai")
public class TheLoai implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maloai")
    private int maLoai;

    @Column(name = "tenloai")
    private String tenLoai;

    @OneToMany(mappedBy = "theLoai",fetch = FetchType.EAGER)
    private Collection<HangHoa> dsHangHoa;
}
