package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    CustService service;
    @Test
    void contextLoads() {
        Cust obj = new Cust("id06","pwd06","james06");
        try {
            service.register(obj);
            log.info("register OK--------------------------------");
        } catch (Exception e) {
            log.info("register error-----------------------------");
            if(e instanceof DuplicateKeyException) {
                log.info("ID가 중복되었습니다.----------------------");
            } else {
                log.info("시스템 장애--------------------------------");
            }
        }
    }

}
