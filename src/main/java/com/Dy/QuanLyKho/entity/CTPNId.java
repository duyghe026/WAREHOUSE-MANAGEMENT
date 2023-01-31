package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Getter
@Setter
@Embeddable
public class CTPNId implements Serializable {
    @Column(name = "mapn")
    private int maPN;

    @Column(name = "mahanghoa")
    private int maHangHoa;

    public CTPNId(int maPN, int maHangHoa) {
        this.maPN = maPN;
        this.maHangHoa = maHangHoa;
    }

    public CTPNId() {
    }
}
