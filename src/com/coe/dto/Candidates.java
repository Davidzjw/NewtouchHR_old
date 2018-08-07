package com.coe.dto;

public class Candidates {

	private Integer caid;
	private String caname;
	private String department;
	private String position;
	private String cainfo;
	private String catel;
	private String camark;


	public String getCamark() {
		return camark;
	}

	public void setCamark(String camark) {
		this.camark = camark;
	}

	public Integer getCaid() {
		return this.caid;
	}

	public void setCaid(Integer caid) {
		this.caid = caid;
	}

	public String getCaname() {
		return this.caname;
	}

	public void setCaname(String caname) {
		this.caname = caname;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCainfo() {
		return this.cainfo;
	}

	public void setCainfo(String cainfo) {
		this.cainfo = cainfo;
	}

	public String getCatel() {
		return catel;
	}

	public void setCatel(String catel) {
		this.catel = catel;
	}


}