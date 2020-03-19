package cn.togeek.domain.driving;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * @author wangb
 * @description: 条件查询
 * @create: 2019-10-21 15:47
 */
@Data
public class QueryICVMonth {

    private LocalDate month;

    private String icv;

    public QueryICVMonth(LocalDate month) {
        this.month = month;
    }
}