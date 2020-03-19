package cn.togeek.domain.driving;

/**
 * @author wangb
 * @description: 时间粒度
 * @create: 2019-11-18 09:33
 */
@SuppressWarnings("ALL")
public enum TimeRange {

    YEAR("year"),
    MONTTH("month"),
    DAY("day");

    private final String range;


    private TimeRange(String range) {
        this.range = range;
    }


    public String getRange() {
        return range;
    }
}

