package com.board.packboardDB;

public class ofquestDTO {
	
	String ofcontent, ofcate1, ofcate2, oftitle;

	public ofquestDTO(String ofcontent, String ofcate1, String ofcate2, String oftitle) {
		this.ofcontent = ofcontent;
		this.ofcate1 = ofcate1;
		this.ofcate2 = ofcate2;
		this.oftitle = oftitle;
	}

	public ofquestDTO() {}

	public String getOfcontent() {
		return ofcontent;
	}

	public void setOfcontent(String ofcontent) {
		this.ofcontent = ofcontent;
	}

	public String getOftitle() {
		return oftitle;
	}

	public void setOftitle(String oftitle) {
		this.oftitle = oftitle;
	}

	public String getOfcate1() {
		return ofcate1;
	}

	public void setOfcate1(String ofcate1) {
		this.ofcate1 = ofcate1;
	}

	public String getOfcate2() {
		return ofcate2;
	}

	public void setOfcate2(String ofcate2) {
		this.ofcate2 = ofcate2;
	}
	
	
	
	
}
