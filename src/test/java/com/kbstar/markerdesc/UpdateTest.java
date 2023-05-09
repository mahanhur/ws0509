package com.kbstar.markerdesc;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerDescService service;

    @Test
    void contextLoads() throws Exception {
        MarkerDesc obj = new MarkerDesc(13,	106, "양꼬치", 20000,"yang2.jpg");

        try {
            service.modify(obj);
            log.info("수정 정상");
        } catch (Exception e) {
            log.info("수정 에러");
            e.printStackTrace();
        }
    }
}

