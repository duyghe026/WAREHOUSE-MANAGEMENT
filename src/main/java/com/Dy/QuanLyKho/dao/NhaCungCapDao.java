package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.NhaCungCap;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface NhaCungCapDao extends JpaRepository<NhaCungCap, Integer> {
    List<NhaCungCap> findAll();

    NhaCungCap findById(int id);

    List<NhaCungCap> findAllByMst(int mst);

    List<NhaCungCap> findAllByTenNCC(String tenNCC);
}
