package com.extr.service;

import java.util.List;
import java.util.Map;

import com.extr.domain.user.Customer;
import com.extr.domain.user.User;
import com.extr.util.Page;

/**
 * @author Ocelot
 * @date 2014年6月8日 下午5:52:55
 */
public interface CustService {
	
	public void updateCustomer(Customer cust);
	
	public List<Customer> getCustListByDept(String department,Page<Customer> page);

	public List<Customer> getBlankCustListByDept(String department, Page<Customer> page);

	public List<Customer> getCustListByUsername(String currentUsername, Page<Customer> page);
	
}
