package com.board.packboardDB;

import java.sql.Timestamp;

public class packnoboardDTO {
	private int nono, count;
	private String nocate, notitle, nocontent;
	private Timestamp date;

	public packnoboardDTO(int nono, int count, String nocate, String notitle, String nocontent, Timestamp date) {
		this.nono = nono;
		this.count = count;
		this.nocate = nocate;
		this.notitle = notitle;
		this.nocontent = nocontent;
		this.date = date;
	}

	public packnoboardDTO() {}
	
	public int getNono() {
		return nono;
	}
	public void setNono(int nono) {
		this.nono = nono;
	}
	public String getNocate() {
		return nocate;
	}
	public void setNocate(String nocate) {
		this.nocate = nocate;
	}
	public String getNotitle() {
		return notitle;
	}
	public void setNotitle(String notitle) {
		this.notitle = notitle;
	}
	public String getNocontent() {
		return nocontent;
	}
	public void setNocontent(String nocontent) {
		this.nocontent = nocontent;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
