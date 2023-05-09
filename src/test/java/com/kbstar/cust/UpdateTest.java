package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    CustService service;
    @Test
    void contextLoads() {
        Cust obj = new Cust("id01","pwd01","홍길동");
        try {
            service.modify(obj);
            log.info("update OK--------------------------------");
            service.get("id01");
        } catch (Exception e) {
            log.info("register error-----------------------------");
        }
    }

}
