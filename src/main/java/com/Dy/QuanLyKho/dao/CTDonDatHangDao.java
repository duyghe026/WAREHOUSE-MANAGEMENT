package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.CTDDH;
import com.Dy.QuanLyKho.entity.CTDDHId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CTDonDatHangDao extends JpaRepository<CTDDH, CTDDHId> {
    List<CTDDH> findAll();

    List<CTDDH> findAllById(CTDDHId ctddhId);
}
