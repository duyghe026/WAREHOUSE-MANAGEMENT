package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.DonDatHang;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface DonDatHangDao extends JpaRepository<DonDatHang, Integer> {
    List<DonDatHang> findAll();

    DonDatHang findById(int id);

    List<DonDatHang> findAllByNgayBetween(Date form, Date to);

    List<DonDatHang> findAllByNgayBetweenAndTinhTrang(Date from, Date to,int tinhTrang);

    List<DonDatHang> findAllByTinhTrang(int tinhTrang);

    List<DonDatHang> findAllByTinhTrangBetween(int from,int to);
}
