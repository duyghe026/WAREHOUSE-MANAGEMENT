package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.CTPNId;
import com.Dy.QuanLyKho.entity.CTPN;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CTPhieuNhapDao extends JpaRepository<CTPN, CTPNId> {
    List<CTPN> findAll();

    List<CTPN> findAllById(CTPNId ctpnId);

}
