package com.travelpackage;

public class BoardPaging {

	private BoardPagingVO vo;
	
	public BoardPaging(BoardPagingVO vo) {
		
		this.vo = vo;
		
	}
	
	private int getTotalPage(int totalRecord, int recordPerPage) {
		
		int totalPage = (int)Math.ceil(totalRecord / (double)recordPerPage);
		
		return totalPage;
	}
	
	private int getTotalBlock(int totalPage, int pagePerBlock) {
	    
		int totalBlock = (int)Math.ceil(totalPage / (double)pagePerBlock);
		
		return totalBlock;
	}
	
	private int getNowBlock(int nowPage, int pagePerBlock) {
		
		int nowBlock = (int)Math.ceil(nowPage / (double)pagePerBlock);
		
		if (nowBlock == 0) {
			nowBlock = 1;
		}
		
		return nowBlock;
		
	}
	
	private int getStartRecord(int nowPage, int recordPerPage) {
		
		int startRecord = 0;
		
		if (nowPage != 0) {
			startRecord = (nowPage - 1) * recordPerPage;
		}
		
		return startRecord;
		
	}

	private int getPrevBlock(int nowBlock, int nowPage, int pagePerBlock) {
		
		int prevBlock = 1;
		
		if (nowBlock > 1) {
			prevBlock = ((nowBlock - 2) * pagePerBlock) + 1;
		}
		
		return prevBlock;
	}
	
	private int getNextBlock(int totalBlock, int nowBlock, int nowPage, int pagePerBlock) {
		
		int nextBlock = 1;
		
		if (totalBlock > nowBlock) {
			nextBlock = (nowBlock * pagePerBlock) + 1;
		}
		
		return nextBlock;
	}

	private int getStartPage(int totalBlock, int nowBlock, int pagePerBlock) {
		
		int startPage = 1;
		
		if (nowBlock <= totalBlock) {
			startPage = ((nowBlock - 1) * pagePerBlock) + 1;
		} else {
			startPage = ((nowBlock - 1) * pagePerBlock) + 1;
		}
		
		return startPage;
	}
	
	private int getEndPage(int totalBlock, int nowBlock, int pagePerBlock, int totalPage) {
		
		int endPage = 0;
		
		if (totalBlock <= 1) {
			endPage = totalPage;
		} else if (nowBlock < totalBlock) {
			endPage = nowBlock * pagePerBlock;
		} else {
			endPage = ((nowBlock - 1) * pagePerBlock) + (totalPage % pagePerBlock);
		}
		
		return endPage;
	}
	
	private boolean prevBtnVisible(int totalBlock, int nowBlock) {
		
		boolean prevBtnVisible = false;
		
		if (totalBlock == 0 || totalBlock == 1 || nowBlock <= 1) {
			prevBtnVisible = false;
		} else {
			prevBtnVisible = true;
		}
		return prevBtnVisible;
	}
	
	private boolean nextBtnVisiable(int totalBlock, int nowBlock) {
		
		boolean nextBtnVisible = false;
		
		if (totalBlock == 0 || totalBlock == 1 || nowBlock >= totalBlock) {
			nextBtnVisible = false;
		} else {
			nextBtnVisible = true;
		}
		
		return nextBtnVisible;
	}
	
	public BoardPagingVO getPagingInfo() {
		
		// 기본 입력 값
		int totalRecord = vo.getTotalRecord();
		int pagePerBlock = vo.getPagePerBlock();
		int recordPerPage = vo.getRecordPerPage();
		int nowPage = vo.getNowPage();
		
		// 구해야 하는 값
		int totalPage = getTotalPage(totalRecord, recordPerPage);
		int totalBlock = getTotalBlock(totalPage, pagePerBlock);
		int nowBlock = getNowBlock(nowPage, pagePerBlock);
		int startRecord = getStartRecord(nowPage, recordPerPage);
		int startPage = getStartPage(totalBlock, nowBlock, pagePerBlock);
		int endPage = getEndPage(totalBlock, nowBlock, pagePerBlock, totalPage);
		int prevBlock = getPrevBlock(nowBlock, nowPage, pagePerBlock);
		int nextBlock = getNextBlock(totalBlock, nowBlock, nowPage, pagePerBlock);
		boolean prevBtnVisible = prevBtnVisible(totalBlock, nowBlock);
		boolean nextBtnVisible = nextBtnVisiable(totalBlock, nowBlock); 

		vo.setTotalPage(totalPage);
		vo.setTotalBlock(totalBlock);
		vo.setNowBlock(nowBlock);
		vo.setStartRecord(startRecord);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setPrevBlock(prevBlock);
		vo.setNextBlock(nextBlock);
		vo.setNextBtnVisible(nextBtnVisible);
		vo.setPrevBtnVisible(prevBtnVisible);
		
		return vo;
	}
}
