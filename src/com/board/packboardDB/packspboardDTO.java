package com.board.packboardDB;

import java.sql.Timestamp;

public class packspboardDTO {
	private String sptitle, spcontent, spcate, sppackage, spid, spsimple_content;
	private int star, spno, spcount;
	private Timestamp date;
	
	public packspboardDTO(String sptitle, String spcontent, String spcate, String sppackage, String spid,
			String spsimple_content, int star, int spno, int spcount, Timestamp date) {
		this.sptitle = sptitle;
		this.spcontent = spcontent;
		this.spcate = spcate;
		this.sppackage = sppackage;
		this.spid = spid;
		this.spsimple_content = spsimple_content;
		this.star = star;
		this.spno = spno;
		this.spcount = spcount;
		this.date = date;
	}

	public packspboardDTO() {}

	public String getSptitle() {
		return sptitle;
	}

	public void setSptitle(String sptitle) {
		this.sptitle = sptitle;
	}

	public String getSpcontent() {
		return spcontent;
	}

	public void setSpcontent(String spcontent) {
		this.spcontent = spcontent;
	}

	public String getSpcate() {
		return spcate;
	}

	public void setSpcate(String spcate) {
		this.spcate = spcate;
	}

	public String getSppackage() {
		return sppackage;
	}

	public void setSppackage(String sppackage) {
		this.sppackage = sppackage;
	}

	public String getSpid() {
		return spid;
	}

	public void setSpid(String spid) {
		this.spid = spid;
	}

	public String getSpsimple_content() {
		return spsimple_content;
	}

	public void setSpsimple_content(String spsimple_content) {
		this.spsimple_content = spsimple_content;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getSpno() {
		return spno;
	}

	public void setSpno(int spno) {
		this.spno = spno;
	}

	public int getSpcount() {
		return spcount;
	}

	public void setSpcount(int spcount) {
		this.spcount = spcount;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	
}
