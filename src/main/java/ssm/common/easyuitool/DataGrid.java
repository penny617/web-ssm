package ssm.common.easyuitool;

import java.util.ArrayList;
import java.util.List;

public class DataGrid {
    private int total = 0;
    private List rows = new ArrayList();

    public List getFooter() {
        return footer;
    }

    public void setFooter(List footer) {
        this.footer = footer;
    }

    private List footer=new ArrayList();
    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

}
