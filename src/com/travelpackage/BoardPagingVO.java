package com.travelpackage;

public class BoardPagingVO {

	private int totalRecord;
	private int recordPerPage;
	private int totalPage;
	private int pagePerBlock;
	private int totalBlock;
	private int startRecord;
	private int nowPage;
	private int startPage;
	private int endPage;
	private int nowBlock;
	private int prevBlock;
	private int nextBlock;
	private boolean prevBtnVisible;
	private boolean nextBtnVisible;
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getStartRecord() {
		return startRecord;
	}
	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getRecordPerPage() {
		return recordPerPage;
	}
	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	public int isPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int isNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public boolean isPrevBtnVisible() {
		return prevBtnVisible;
	}
	public void setPrevBtnVisible(boolean prevBtnVisible) {
		this.prevBtnVisible = prevBtnVisible;
	}
	public boolean isNextBtnVisible() {
		return nextBtnVisible;
	}
	public void setNextBtnVisible(boolean nextBtnVisible) {
		this.nextBtnVisible = nextBtnVisible;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	
	
}