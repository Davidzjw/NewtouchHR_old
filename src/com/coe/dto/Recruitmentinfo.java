package com.coe.dto;


public class Recruitmentinfo {

	private Integer riid;
	private String rname;
	private String department;
	private String rest;
	private Integer rers;
	private String reut;
	private String rept;
	private String content;

	public Integer getRiid() {
		return this.riid;
	}

	public String getRest() {
		return rest;
	}

	public void setRest(String rest) {
		this.rest = rest;
	}

	public String getReut() {
		return reut;
	}

	public void setReut(String reut) {
		this.reut = reut;
	}

	public String getRept() {
		return rept;
	}

	public void setRept(String rept) {
		this.rept = rept;
	}

	public void setRiid(Integer riid) {
		this.riid = riid;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getRers() {
		return this.rers;
	}

	public void setRers(Integer rers) {
		this.rers = rers;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

}