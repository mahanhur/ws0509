package com.kbstar.markerdesc;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    MarkerDescService service;

    @Test
    void contextLoads() throws Exception {
        MarkerDesc obj = new MarkerDesc(108,"물만두",5000,"yang5.jpg");
        try {
            service.register(obj);
            log.info("등록 정상");
        } catch (Exception e) {
            log.info("등록에러..");
            e.printStackTrace();
        }
    }
}
