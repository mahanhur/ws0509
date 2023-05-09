package com.kbstar.item;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    ItemService service;
    @Test
    void contextLoads() {
        List<Item> list = null;

        try {
            service.modify(new Item(101,"name",252,"25.jpg",null));
            service.getall();


        } catch(Exception e) {
            log.info("시스템 장애입니다.");
            e.printStackTrace();    }

    }
        }


