package com.coe.dto;

import java.util.Date;

// default package

/**
 * AbstractAttendance entity provides the base persistence definition of the
 * Attendance entity. @author MyEclipse Persistence Tools
 */

public  class Attendance {

	// Fields

	private Integer adid;
	private Information information;
	private Date late;
	private Date zt;
	private Integer absenteeism;
	private Integer attendance;

	// Constructors

	/** default constructor */

	/** full constructor */

	// Property accessors

	public Integer getAdid() {
		return this.adid;
	}

	public void setAdid(Integer adid) {
		this.adid = adid;
	}

	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	

	public Date getLate() {
		return late;
	}

	public void setLate(Date late) {
		this.late = late;
	}

	public Date getZt() {
		return zt;
	}

	public void setZt(Date zt) {
		this.zt = zt;
	}

	public Integer getAbsenteeism() {
		return this.absenteeism;
	}

	public void setAbsenteeism(Integer absenteeism) {
		this.absenteeism = absenteeism;
	}

	public Integer getAttendance() {
		return this.attendance;
	}

	public void setAttendance(Integer attendance) {
		this.attendance = attendance;
	}

}