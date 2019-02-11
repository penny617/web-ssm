package ssm.common.datatabletool;

import java.util.List;

public class PageInfo {
        private List<?> data;
        private int recordsFiltered;//显示条数
        private int recordsTotal;//数据总条数
        private int draw;
        public List<?> getData() {
            return data;
        }
        public PageInfo setData(List<?> data) {
            this.data = data;
            return this;
        }
        public int getRecordsFiltered() {
            return recordsFiltered;
        }
        public PageInfo setRecordsFiltered(int recordsFiltered) {
            this.recordsFiltered = recordsFiltered;
            return this;
        }
        public int getRecordsTotal() {
            return recordsTotal;
        }
        public PageInfo setRecordsTotal(int recordsTotal) {
            this.recordsTotal = recordsTotal;
            return this;
        }
        public int getDraw() {
            return draw;
        }
        public PageInfo setDraw(int draw) {
            this.draw = draw;
            return this;
        }
}
