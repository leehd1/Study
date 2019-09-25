package com.sellboard.DB;

import java.sql.Timestamp;


public class packagelistDTO {
	private String package_img_src, product_subject, product_simple_info,availability_start_date, availability_end_date,
	package_realimg_src, product_info, airplane_no,package_no;
	
	private int min_start_no, now_reservation_no, reservation_no, package_price_Adult ,package_price_child,
	package_price_baby,	travel_agency_no, travel_period, packageterm, package_total_no;
	
	Timestamp selldate;
	
	public packagelistDTO() {}

	public packagelistDTO(String package_img_src, String product_subject, String product_simple_info,
			String availability_start_date, String availability_end_date, String package_realimg_src,
			String product_info, String airplane_no, String package_no, int min_start_no, int now_reservation_no,
			int reservation_no, int package_price_Adult, int package_price_child, int package_price_baby,
			int travel_agency_no, int travel_period, int packageterm, int package_total_no, Timestamp selldate) {
		this.package_img_src = package_img_src;
		this.product_subject = product_subject;
		this.product_simple_info = product_simple_info;
		this.availability_start_date = availability_start_date;
		this.availability_end_date = availability_end_date;
		this.package_realimg_src = package_realimg_src;
		this.product_info = product_info;
		this.airplane_no = airplane_no;
		this.package_no = package_no;
		this.min_start_no = min_start_no;
		this.now_reservation_no = now_reservation_no;
		this.reservation_no = reservation_no;
		this.package_price_Adult = package_price_Adult;
		this.package_price_child = package_price_child;
		this.package_price_baby = package_price_baby;
		this.travel_agency_no = travel_agency_no;
		this.travel_period = travel_period;
		this.packageterm = packageterm;
		this.package_total_no = package_total_no;
		this.selldate = selldate;
	}

	public String getPackage_img_src() {
		return package_img_src;
	}

	public void setPackage_img_src(String package_img_src) {
		this.package_img_src = package_img_src;
	}

	public String getProduct_subject() {
		return product_subject;
	}

	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}

	public String getProduct_simple_info() {
		return product_simple_info;
	}

	public void setProduct_simple_info(String product_simple_info) {
		this.product_simple_info = product_simple_info;
	}

	public String getAvailability_start_date() {
		return availability_start_date;
	}

	public void setAvailability_start_date(String availability_start_date) {
		this.availability_start_date = availability_start_date;
	}

	public String getAvailability_end_date() {
		return availability_end_date;
	}

	public void setAvailability_end_date(String availability_end_date) {
		this.availability_end_date = availability_end_date;
	}

	public String getPackage_realimg_src() {
		return package_realimg_src;
	}

	public void setPackage_realimg_src(String package_realimg_src) {
		this.package_realimg_src = package_realimg_src;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public String getAirplane_no() {
		return airplane_no;
	}

	public void setAirplane_no(String airplane_no) {
		this.airplane_no = airplane_no;
	}

	public String getPackage_no() {
		return package_no;
	}

	public void setPackage_no(String package_no) {
		this.package_no = package_no;
	}

	public int getMin_start_no() {
		return min_start_no;
	}

	public void setMin_start_no(int min_start_no) {
		this.min_start_no = min_start_no;
	}

	public int getNow_reservation_no() {
		return now_reservation_no;
	}

	public void setNow_reservation_no(int now_reservation_no) {
		this.now_reservation_no = now_reservation_no;
	}

	public int getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}

	public int getPackage_price_Adult() {
		return package_price_Adult;
	}

	public void setPackage_price_Adult(int package_price_Adult) {
		this.package_price_Adult = package_price_Adult;
	}

	public int getPackage_price_child() {
		return package_price_child;
	}

	public void setPackage_price_child(int package_price_child) {
		this.package_price_child = package_price_child;
	}

	public int getPackage_price_baby() {
		return package_price_baby;
	}

	public void setPackage_price_baby(int package_price_baby) {
		this.package_price_baby = package_price_baby;
	}

	public int getTravel_agency_no() {
		return travel_agency_no;
	}

	public void setTravel_agency_no(int travel_agency_no) {
		this.travel_agency_no = travel_agency_no;
	}

	public int getTravel_period() {
		return travel_period;
	}

	public void setTravel_period(int travel_period) {
		this.travel_period = travel_period;
	}

	public int getPackageterm() {
		return packageterm;
	}

	public void setPackageterm(int packageterm) {
		this.packageterm = packageterm;
	}

	public int getPackage_total_no() {
		return package_total_no;
	}

	public void setPackage_total_no(int package_total_no) {
		this.package_total_no = package_total_no;
	}

	public Timestamp getSelldate() {
		return selldate;
	}

	public void setSelldate(Timestamp selldate) {
		this.selldate = selldate;
	}

	
	
}
