package com.coe.dto;

import java.util.Date;

// default package

/**
 * AbstractContract entity provides the base persistence definition of the
 * Contract entity. @author MyEclipse Persistence Tools
 */

public class Contract {

	// Fields

	private Integer cid;
	private Information information;
	private String cname;
	private String cnature;
	private String cagreement;
	private Date ctime;
	private Integer cend;

	// Constructors

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public Integer getCend() {
		return cend;
	}

	public void setCend(Integer cend) {
		this.cend = cend;
	}

	/** default constructor */

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCnature() {
		return this.cnature;
	}

	public void setCnature(String cnature) {
		this.cnature = cnature;
	}

	public String getCagreement() {
		return this.cagreement;
	}

	public void setCagreement(String cagreement) {
		this.cagreement = cagreement;
	}

}