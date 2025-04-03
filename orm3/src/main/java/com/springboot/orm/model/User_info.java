package com.springboot.orm.model;

import java.util.Date;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class User_info {
	@Id
	private String user_id;
	private String user_pwd;
	private String name;
	private String addr;
	private String phone;
	private String gender;
	private Integer grade;
	private String email;
	
	@Temporal(TemporalType.DATE)
	private Date birth;
	private String job;
	
	@OneToMany
	private Set<Imagebbs_tbl> imagebbs;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthd() {
		return birth;
	}

	public void setBirthd(Date birthd) {
		this.birth = birthd;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Set<Imagebbs_tbl> getImagebbs() {
		return imagebbs;
	}

	public void setImagebbs(Set<Imagebbs_tbl> imagebbs) {
		this.imagebbs = imagebbs;
	}
	
}
