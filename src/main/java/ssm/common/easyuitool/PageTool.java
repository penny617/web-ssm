package ssm.common.easyuitool;

import java.io.Serializable;

public class PageTool implements Serializable {

    private static final long serialVersionUID = 2360278913378031622L;

    private int pageNow;
    private int pageSize;
    private int totalCount;
    private int totalPageCount;

    @SuppressWarnings("unused")
    private int startPos;
    @SuppressWarnings("unused")
    private boolean hasFirst;
    @SuppressWarnings("unused")
    private boolean hasPre;
    @SuppressWarnings("unused")
    private boolean hasNext;
    @SuppressWarnings("unused")
    private boolean hasLast;
    private int row;
    private int endPos;
    private String news;

    public PageTool(int row, int pageNow, String news) {
        this.row=row;
        this.pageNow = pageNow;
        this.news=news;
    }

    public PageTool(int row, int pageNow) {
        this.row=row;
        this.pageNow = pageNow;

    }

    public String getNews() {
        return news;
    }

    public void setNews(String news) {
        this.news = news;
    }

    public int getPageNow() {
        return pageNow;
    }
    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }
    public int getRow() {
        return row;
    }
    public void setRow(int row) {
        this.row = row;
    }
    public int getStartPos() {
        return (pageNow - 1) * row;
    }
    public void setStartPos(int startPos) {
        this.startPos = startPos;
    }


    public int getEndPos() {
        return pageNow*row;
    }
    public void setEndPos(int endPos) {
        this.endPos = endPos;
    }
    @Override
    public String toString() {
        return "PageTool [pageNow=" + pageNow + ", startPos=" + startPos
                + ", row=" + row + ", endPos=" + endPos + "]";
    }
}
