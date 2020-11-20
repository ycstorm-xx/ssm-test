package com.yc.service;

import com.yc.pojo.Goods;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface GoodService {

    List<Goods> selectAll();

    int updateOne(Goods goods, MultipartFile file);

    int deleteOne(Integer id);

    int addOne(Goods goods,MultipartFile file);
}
