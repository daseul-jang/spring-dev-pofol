package com.jds.web.portfolio.domain;

public class StackDTO {

	private int s_no;
	private String s_name;
	private String s_category;
	private String s_img;
	
	public StackDTO() {}

	public StackDTO(int s_no, String s_name, String s_category, String s_img) {
		super();
		this.s_no = s_no;
		this.s_name = s_name;
		this.s_category = s_category;
		this.s_img = s_img;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getS_img() {
		return s_img;
	}

	public void setS_img(String s_img) {
		this.s_img = s_img;
	}

	@Override
	public String toString() {
		return "StackDTO [s_no=" + s_no + ", s_name=" + s_name + ", s_category=" + s_category + ", s_img=" + s_img
				+ "]";
	}

}
