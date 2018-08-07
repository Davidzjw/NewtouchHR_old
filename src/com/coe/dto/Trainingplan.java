package com.coe.dto;

import java.util.HashSet;
import java.util.Set;

public class Trainingplan {

	private Integer trid;
	private String department;
	private String trf;
	private String trd;
	private String trn;
	private Information fzr;
	private String trst;
	private String trc;
	private Set trainingapprovals = new HashSet();

	public Set getTrainingapprovals() {
		return trainingapprovals;
	}

	public void setTrainingapprovals(Set trainingapprovals) {
		this.trainingapprovals = trainingapprovals;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getTrid() {
		return this.trid;
	}

	public Information getFzr() {
		return fzr;
	}

	public void setFzr(Information fzr) {
		this.fzr = fzr;
	}

	public void setTrid(Integer trid) {
		this.trid = trid;
	}

	public String getTrf() {
		return this.trf;
	}

	public void setTrf(String trf) {
		this.trf = trf;
	}

	public String getTrd() {
		return this.trd;
	}

	public void setTrd(String trd) {
		this.trd = trd;
	}

	public String getTrn() {
		return this.trn;
	}

	public void setTrn(String trn) {
		this.trn = trn;
	}

	public String getTrst() {
		return trst;
	}

	public void setTrst(String trst) {
		this.trst = trst;
	}

	public String getTrc() {
		return this.trc;
	}

	public void setTrc(String trc) {
		this.trc = trc;
	}

}