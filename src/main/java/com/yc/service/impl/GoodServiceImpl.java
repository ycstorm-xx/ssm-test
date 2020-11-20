package com.yc.service.impl;

import com.yc.dao.GoodDao;
import com.yc.pojo.Goods;
import com.yc.service.GoodService;
import com.yc.utils.UploadUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
@Service("goodService")
public class GoodServiceImpl implements GoodService {
    @Resource
    private GoodDao goodDao;
    @Override
    public List<Goods> selectAll() {
        return goodDao.selectAll();
    }

    @Override
    public int updateOne(Goods goods, MultipartFile file) {
        UploadUtils uploadUtils = new UploadUtils();
        String pic="";
        try {
            if(file!=null){
                pic = uploadUtils.upload(file);
                goods.setPic(pic);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return goodDao.updateOne(goods);
    }

    @Override
    public int deleteOne(Integer id) {
        return goodDao.deleteOne(id);
    }

    @Override
    public int addOne(Goods goods, MultipartFile file) {
        UploadUtils uploadUtils = new UploadUtils();
        String pic="";
        try {
            pic = uploadUtils.upload(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        goods.setPic(pic);
        return goodDao.addOne(goods);
    }
}
