package com.kbstar.service;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.MarkerDescMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarkerDescService implements KBService<Integer, MarkerDesc> {
    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param markerDesc
     */

    @Autowired
    MarkerDescMapper mapper;
    @Override
    public void register(MarkerDesc markerDesc) throws Exception {
        mapper.insert(markerDesc);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(MarkerDesc markerDesc) throws Exception {
        mapper.update(markerDesc);
    }

    @Override
    public MarkerDesc get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<MarkerDesc> getall() throws Exception {
        return mapper.selectall();
    }

    public List<MarkerDesc> getMarkerDesc(Integer i) throws Exception {
        return mapper.getmarkerdesc(i);
    }
}
