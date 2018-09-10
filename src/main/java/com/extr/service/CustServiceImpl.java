package com.extr.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.extr.domain.user.Customer;
import com.extr.domain.user.User;
import com.extr.persistence.CustMapper;
import com.extr.persistence.UserMapper;
import com.extr.util.Page;

/**
 * @author Ocelot
 * @date 2014年6月8日 下午8:21:31
 */
@Service
public class CustServiceImpl implements CustService {

	@Autowired
	public CustMapper custMapper;

	
	
	@Override
	public List<Customer> getCustListByDept(String department,Page<Customer> page) {
		// TODO Auto-generated method stub
		List<Customer> custList = custMapper.getCustListByDept(department, page);
		return custList;
	}



	@Override
	public void updateCustomer(Customer cust) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public List<Customer> getBlankCustListByDept(String department, Page<Customer> page) {
		// TODO Auto-generated method stub
		List<Customer> custList = custMapper.getBlankCustListByDept(department, page);
		return custList;
	}



	@Override
	public List<Customer> getCustListByUsername(String currentUsername, Page<Customer> page) {
		// TODO Auto-generated method stub
		List<Customer> custList = custMapper.getCustListByUsername(currentUsername, page);
		return custList;
	}

}
