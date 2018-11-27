package com.extr.domain.user;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Mistake implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2974124807977671885L;
	private int id;
	private String oa_num;
	private String oa_nm;
	private float miss_count;
	private String month;
	private float total_count;
	
	private float mis_rate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOa_num() {
		return oa_num;
	}
	public void setOa_num(String oa_num) {
		this.oa_num = oa_num;
	}
	public String getOa_nm() {
		return oa_nm;
	}
	public void setOa_nm(String oa_nm) {
		this.oa_nm = oa_nm;
	}
	public float getMiss_count() {
		return miss_count;
	}
	public void setMiss_count(float miss_count) {
		this.miss_count = miss_count;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public float getTotal_count() {
		return total_count;
	}
	public void setTotal_count(float total_count) {
		this.total_count = total_count;
	}
	public float getMis_rate() {
		return mis_rate;
	}
	public void setMis_rate(float mis_rate) {
		this.mis_rate = mis_rate;
	}
	
	
	
}
