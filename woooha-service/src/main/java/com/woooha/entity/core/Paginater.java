package com.woooha.entity.core;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-3
 * Time: 下午5:27
 * To change this template use File | Settings | File Templates.
 */
public class Paginater<T> implements Serializable {

    private List<T> results = new ArrayList<T>();

    private long totalCount;

    private int pageNumber = 1;

    private int objectsPerPage = 10;

    private String sortField;

    private boolean sortAsc = true;

    private int maxPageNumbers = 7;

    public Paginater() {
    }

    public Paginater(int objectsPerPage) {
        this.objectsPerPage = objectsPerPage;
    }

    public int getFirstResult() {
        int pageIndex = getPageNumber() - 1;
        if (pageIndex < 0) {
            pageIndex = 0;
        }
        return pageIndex * getMaxResults();
    }

    public int getMaxResults() {
        return objectsPerPage;
    }

    public int getTotalPages() {
        if (totalCount < 0)
            return -1;

        int count = (int) (totalCount / objectsPerPage);
        if (totalCount % objectsPerPage > 0) {
            count++;
        }
        return count;
    }

    public boolean isHasNext() {
        return pageNumber + 1 <= getTotalPages();
    }

    public boolean isHasPrev() {
        return pageNumber - 1 >= 1;
    }

    public int getNextPage() {
        if (isHasNext()) {
            return pageNumber + 1;
        }
        return pageNumber;
    }

    public int getPrevPage() {
        if (isHasPrev()) {
            return pageNumber - 1;
        }
        return pageNumber;
    }

    public void setMaxResults(int maxResults) {
        this.objectsPerPage = maxResults;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public List<Integer> getPageNumbers() {
        List<Integer> pageNumbers = new ArrayList<Integer>(maxPageNumbers);
        int totalPages = getTotalPages();
        if (totalPages > 0) {
            int prevMax = maxPageNumbers / 2;
            int start = pageNumber - prevMax > 0 ? pageNumber - prevMax : 1;
            int end = pageNumber + maxPageNumbers - prevMax - 1;
            end = end <= totalPages ? end : totalPages;
            if (end - start + 1 < maxPageNumbers) {
                int balance = maxPageNumbers - (end - start + 1);
                if (start > 1) {
                    start = start - balance > 0 ? start - balance : 1;
                }
                if (end < totalPages) {
                    end = end + balance <= totalPages ? end + balance : totalPages;
                }
            }
            for (int i = start; i <= end; i++) {
                pageNumbers.add(i);
            }
            if (!pageNumbers.contains(1)) {
                pageNumbers.add(0, 1);
                pageNumbers.add(1, null);
            }
            if (!pageNumbers.contains(totalPages)) {
                pageNumbers.add(null);
                pageNumbers.add(totalPages);
            }
        }
        return pageNumbers;
    }

    public List<T> getResults() {
        return results;
    }

    public void setResults(List<T> results) {
        this.results = results;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public String getSortField() {
        return sortField;
    }

    public void setSortField(String sortField) {
        this.sortField = sortField;
    }

    public boolean isSortAsc() {
        return sortAsc;
    }

    public void setSortAsc(boolean sortAsc) {
        this.sortAsc = sortAsc;
    }

    public String getSortType() {
        return isSortAsc() ? "ASC" : "DESC";
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber > 0 ? pageNumber : 1;
    }

    public void setMaxPageNumbers(int maxPageNumbers) {
        this.maxPageNumbers = maxPageNumbers;
    }

}
