package com.yc.dao;

import com.yc.pojo.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Repository
public interface GoodDao {

    List<Goods> selectAll();

    int updateOne(Goods goods);

    int deleteOne(@Param("id")Integer id);

    int addOne(Goods goods);
}
