package com.coe.dto;

public class Trainingapproval {

	private Integer taid;
	private Trainingplan trainingplan;
	private Information information;
	private Integer trmark;
	private String eval;
	private String fb;

	public String getEval() {
		return eval;
	}

	public void setEval(String eval) {
		this.eval = eval;
	}

	public Integer getTaid() {
		return this.taid;
	}

	public void setTaid(Integer taid) {
		this.taid = taid;
	}

	public Trainingplan getTrainingplan() {
		return this.trainingplan;
	}

	public void setTrainingplan(Trainingplan trainingplan) {
		this.trainingplan = trainingplan;
	}

	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	public Integer getTrmark() {
		return this.trmark;
	}

	public void setTrmark(Integer trmark) {
		this.trmark = trmark;
	}

	public String getFb() {
		return fb;
	}

	public void setFb(String fb) {
		this.fb = fb;
	}

}