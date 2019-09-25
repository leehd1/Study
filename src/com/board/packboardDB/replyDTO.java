package com.board.packboardDB;

import java.sql.Timestamp;

public class replyDTO {
	
	private String recontent, reid;
	private int reno, resp;
	private Timestamp date;
	
	public replyDTO() {}
	
	public replyDTO(String recontent, String reid, int reno, int resp, Timestamp date) {
		this.recontent = recontent;
		this.reid = reid;
		this.reno = reno;
		this.resp = resp;
		this.date = date;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public String getReid() {
		return reid;
	}

	public void setReid(String reid) {
		this.reid = reid;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}


	public int getResp() {
		return resp;
	}


	public void setResp(int resp) {
		this.resp = resp;
	}
	
	
	
}
