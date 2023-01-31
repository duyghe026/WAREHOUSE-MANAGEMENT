package com.Dy.QuanLyKho.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Getter
@Setter
@Embeddable
public class CTDDHId implements Serializable {
    @Column(name = "maddh")
    private int maDDH;

    @Column(name = "mahanghoa")
    private int maHangHoa;

    public CTDDHId(int maDDH, int maHangHoa) {
        this.maDDH = maDDH;
        this.maHangHoa = maHangHoa;
    }

    public CTDDHId() {
    }
}
