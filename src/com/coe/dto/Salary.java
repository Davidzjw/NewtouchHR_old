package com.coe.dto;

/**
 * Salary entity. @author MyEclipse Persistence Tools
 */

public class Salary {

	// Fields

	private Integer sid;
	private Information information;
	private Integer bwage;
	private Integer housefund;
	private Integer pension;
	private Integer health;
	private Integer unemployment;
	private Integer reimbursement;
	private Integer paword;
	private String time;


	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	public Integer getBwage() {
		return this.bwage;
	}

	public void setBwage(Integer bwage) {
		this.bwage = bwage;
	}

	public Integer getHousefund() {
		return this.housefund;
	}

	public void setHousefund(Integer housefund) {
		this.housefund = housefund;
	}

	public Integer getPension() {
		return this.pension;
	}

	public void setPension(Integer pension) {
		this.pension = pension;
	}

	public Integer getHealth() {
		return this.health;
	}

	public void setHealth(Integer health) {
		this.health = health;
	}

	public Integer getUnemployment() {
		return this.unemployment;
	}

	public void setUnemployment(Integer unemployment) {
		this.unemployment = unemployment;
	}

	public Integer getReimbursement() {
		return this.reimbursement;
	}

	public void setReimbursement(Integer reimbursement) {
		this.reimbursement = reimbursement;
	}

	public Integer getPaword() {
		return this.paword;
	}

	public void setPaword(Integer paword) {
		this.paword = paword;
	}

}