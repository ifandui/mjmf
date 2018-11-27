package com.extr.domain.user;

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Dafen implements Serializable {

	
	private int id;
	private String username;
	private Date commit_time;
	private String target;
	private float zcsp;
	private float zdnl;
	private float fwtd;
	private float fwxl;
	private float fwzl;
	private int valid;
	private String sn;
	private String ip;
	
	
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getValid() {
		return valid;
	}
	public void setValid(int valid) {
		this.valid = valid;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sN) {
		sn = sN;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getCommit_time() {
		return commit_time;
	}
	public void setCommit_time(Date commit_time) {
		this.commit_time = commit_time;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public float getZcsp() {
		return zcsp;
	}
	public void setZcsp(float zcsp) {
		this.zcsp = zcsp;
	}
	public float getZdnl() {
		return zdnl;
	}
	public void setZdnl(float zdnl) {
		this.zdnl = zdnl;
	}
	public float getFwtd() {
		return fwtd;
	}
	public void setFwtd(float fwtd) {
		this.fwtd = fwtd;
	}
	public float getFwxl() {
		return fwxl;
	}
	public void setFwxl(float fwxl) {
		this.fwxl = fwxl;
	}
	public float getFwzl() {
		return fwzl;
	}
	public void setFwzl(float fwzl) {
		this.fwzl = fwzl;
	}
	
	
}
