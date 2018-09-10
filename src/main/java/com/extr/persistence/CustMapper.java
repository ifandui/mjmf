package com.extr.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.extr.domain.user.Customer;
import com.extr.util.Page;

public interface CustMapper {


	/**
	 * 按部门获取客户列表
	 * 
	 * @return
	 */
	public List<Customer> getCustListByDept(@Param("department") String department,@Param("page") Page<Customer> page);

	public List<Customer> getBlankCustListByDept(@Param("department") String department,@Param("page") Page<Customer> page);

	public List<Customer> getCustListByUsername(@Param("currentUsername") String currentUsername,@Param("page") Page<Customer> page);

	
}
