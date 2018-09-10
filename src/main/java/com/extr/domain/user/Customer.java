package com.extr.domain.user;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Customer implements Serializable {


	private static final long serialVersionUID = -8486787548462631717L;
	private int data_id;
	private String data_dt;
	private String oa_num;
	private String oa_nm;
	private String open_org_id;
	private String org_name;
	private String cust_no;
	private String cust_name;
	private String cert_num;
	private float tot_y_acm;
	private float tot_y_acm_cmp;
	public int getData_id() {
		return data_id;
	}
	public void setData_id(int data_id) {
		this.data_id = data_id;
	}
	public String getData_dt() {
		return data_dt;
	}
	public void setData_dt(String data_dt) {
		this.data_dt = data_dt;
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
	public String getOpen_org_id() {
		return open_org_id;
	}
	public void setOpen_org_id(String open_org_id) {
		this.open_org_id = open_org_id;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getCust_no() {
		return cust_no;
	}
	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCert_num() {
		return cert_num;
	}
	public void setCert_num(String cert_num) {
		this.cert_num = cert_num;
	}
	public float getTot_y_acm() {
		return tot_y_acm;
	}
	public void setTot_y_acm(float tot_y_acm) {
		this.tot_y_acm = tot_y_acm;
	}
	public float getTot_y_acm_cmp() {
		return tot_y_acm_cmp;
	}
	public void setTot_y_acm_cmp(float tot_y_acm_cmp) {
		this.tot_y_acm_cmp = tot_y_acm_cmp;
	}
	public float getTot_amt_now() {
		return tot_amt_now;
	}
	public void setTot_amt_now(float tot_amt_now) {
		this.tot_amt_now = tot_amt_now;
	}
	public float getYr_bg_cmp() {
		return yr_bg_cmp;
	}
	public void setYr_bg_cmp(float yr_bg_cmp) {
		this.yr_bg_cmp = yr_bg_cmp;
	}
	public float getMh_ed_cmp() {
		return mh_ed_cmp;
	}
	public void setMh_ed_cmp(float mh_ed_cmp) {
		this.mh_ed_cmp = mh_ed_cmp;
	}
	public float getIt_dy_cmp() {
		return it_dy_cmp;
	}
	public void setIt_dy_cmp(float it_dy_cmp) {
		this.it_dy_cmp = it_dy_cmp;
	}
	public String getOpen_dt() {
		return open_dt;
	}
	public void setOpen_dt(String open_dt) {
		this.open_dt = open_dt;
	}
	private float tot_amt_now;
	private float yr_bg_cmp;
	private float mh_ed_cmp;
	private float it_dy_cmp;
	private String open_dt;
	
	
}
