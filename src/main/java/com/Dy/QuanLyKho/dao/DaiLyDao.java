package com.Dy.QuanLyKho.dao;

import com.Dy.QuanLyKho.entity.DaiLy;
import com.Dy.QuanLyKho.entity.NhaCungCap;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface DaiLyDao extends JpaRepository<DaiLy, Integer> {
    List<DaiLy> findAll();

    DaiLy findById(int id);

    List<DaiLy> findAllByMst(int mst);

    List<DaiLy> findAllByTenDL(String tenDL);
}
