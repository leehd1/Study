package com.administer.DB;

public class sellerAdminDTO {
	
	private String sellerid, sellername, selleremail, sellerphonenum, sellertravel_agency_consulting_time, sellerfaxnum;
	private int sellertravel_agency_no;
	
	public sellerAdminDTO(String sellerid, String sellername, String selleremail, String sellerphonenum,
			String sellertravel_agency_consulting_time, String sellerfaxnum, int sellertravel_agency_no) {
		this.sellerid = sellerid;
		this.sellername = sellername;
		this.selleremail = selleremail;
		this.sellerphonenum = sellerphonenum;
		this.sellertravel_agency_consulting_time = sellertravel_agency_consulting_time;
		this.sellerfaxnum = sellerfaxnum;
		this.sellertravel_agency_no = sellertravel_agency_no;
	}
	
	public sellerAdminDTO() {}

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public String getSellername() {
		return sellername;
	}

	public void setSellername(String sellername) {
		this.sellername = sellername;
	}

	public String getSelleremail() {
		return selleremail;
	}

	public void setSelleremail(String selleremail) {
		this.selleremail = selleremail;
	}

	public String getSellerphonenum() {
		return sellerphonenum;
	}

	public void setSellerphonenum(String sellerphonenum) {
		this.sellerphonenum = sellerphonenum;
	}

	public String getSellertravel_agency_consulting_time() {
		return sellertravel_agency_consulting_time;
	}

	public void setSellertravel_agency_consulting_time(String sellertravel_agency_consulting_time) {
		this.sellertravel_agency_consulting_time = sellertravel_agency_consulting_time;
	}

	public String getSellerfaxnum() {
		return sellerfaxnum;
	}

	public void setSellerfaxnum(String sellerfaxnum) {
		this.sellerfaxnum = sellerfaxnum;
	}

	public int getSellertravel_agency_no() {
		return sellertravel_agency_no;
	}

	public void setSellertravel_agency_no(int sellertravel_agency_no) {
		this.sellertravel_agency_no = sellertravel_agency_no;
	}
	
	

}
