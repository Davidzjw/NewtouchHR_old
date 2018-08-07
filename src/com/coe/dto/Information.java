package com.coe.dto;

import java.util.HashSet;
import java.util.Set;

// default package

/**
 * AbstractInformation entity provides the base persistence definition of the
 * Information entity. @author MyEclipse Persistence Tools
 */

public class Information {

	// Fields

	private Integer userid;
	private String username;
	private String department;
	private String position;
	private String password;
	private Integer age;
	private String sex;
	private String tel;
	private String  level;
	private Set salaries = new HashSet();
	private Set attendances = new HashSet();
	private Set trainingapprovals = new HashSet();
	private Set notices = new HashSet();
	private Set persons = new HashSet();
	private Set contracts = new HashSet();
	private Set trainingplan = new HashSet();


	public Set getSalaries() {
		return salaries;
	}

	public void setSalaries(Set salaries) {
		this.salaries = salaries;
	}


	public Set getAttendances() {
		return attendances;
	}

	public void setAttendances(Set attendances) {
		this.attendances = attendances;
	}


	public Set getTrainingapprovals() {
		return trainingapprovals;
	}

	public void setTrainingapprovals(Set trainingapprovals) {
		this.trainingapprovals = trainingapprovals;
	}

	public Set getNotices() {
		return notices;
	}

	public void setNotices(Set notices) {
		this.notices = notices;
	}

	public Set getPersons() {
		return persons;
	}

	public void setPersons(Set persons) {
		this.persons = persons;
	}

	public Set getContracts() {
		return contracts;
	}

	public void setContracts(Set contracts) {
		this.contracts = contracts;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}



	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Set getTrainingplan() {
		return trainingplan;
	}

	public void setTrainingplan(Set trainingplan) {
		this.trainingplan = trainingplan;
	}



}