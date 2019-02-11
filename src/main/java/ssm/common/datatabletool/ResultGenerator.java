package ssm.common.datatabletool;

import ssm.common.datatabletool.PageInfo;
import ssm.common.datatabletool.Result;
import ssm.common.datatabletool.ResultCode;

import java.util.List;

public class ResultGenerator {

    private static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";

    public static Result genSuccessResult() {
        return new Result()
                .setCode(ResultCode.SUCCESS)
                .setMessage(DEFAULT_SUCCESS_MESSAGE);
    }

    public static Result genSuccessResult(Object data) {
        return new Result()
                .setCode(ResultCode.SUCCESS)
                .setMessage(DEFAULT_SUCCESS_MESSAGE)
                .setData(data);
    }

    public static Result genFailResult(String message) {
        return new Result()
                .setCode(ResultCode.FAIL)
                .setMessage(message);
    }

    public static PageInfo genResultPage(List<?> list, int total, int draw){
        return new PageInfo().setRecordsTotal(total)
                .setData(list)
                .setRecordsFiltered(list.size())
                .setDraw(draw);
    }
}
