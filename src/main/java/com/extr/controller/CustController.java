package com.extr.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.extr.controller.domain.Message;
import com.extr.domain.question.Field;
import com.extr.domain.user.Customer;
import com.extr.domain.user.Org;
import com.extr.domain.user.User;
import com.extr.security.UserInfo;
import com.extr.service.CustService;
import com.extr.service.OrgService;
import com.extr.service.QuestionService;
import com.extr.service.UserService;
import com.extr.util.Page;
import com.extr.util.PagingUtil;
import com.extr.util.StandardPasswordEncoderForSha1;

@Controller
public class CustController {

	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";

	@Autowired
	private UserService userService;
	
	@Autowired
	private CustService custService;
	
	@Autowired
	private OrgService orgService;
	
	@Autowired
	private QuestionService questionService;
	
		
	/**
	 * 显示用户管理界面
	 * 
	 * @return
	 */
	@RequestMapping(value = { "customer/cust-list" }, method = RequestMethod.GET)
	public String showCustListPage(Model model, HttpServletRequest request) {
		System.out.println( SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		
		String currentUsername=userInfo.getUsername();
		int index = 1;
		if(request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<Customer> page = new Page<Customer>();
		page.setPageNo(index);
		page.setPageSize(20);
		
		List<Customer> custList = custService.getCustListByUsername(currentUsername,page);
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "customer/cust-list");
		model.addAttribute("custList", custList);
		model.addAttribute("pageStr", pageStr);
		model.addAttribute("totalRecord", page.getTotalRecord());
		
		return "customer/cust-list";
	}
	
	@RequestMapping(value = { "customer/cust-fullfill-list" }, method = RequestMethod.GET)
	public String showBlankCustListPage(Model model, HttpServletRequest request) {
		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		User user=userService.getUserById(userInfo.getUserid());
		System.out.println(user.getDepartment());
		
		int index = 1;
		if(request.getParameter("page") != null)
			index = Integer.parseInt(request.getParameter("page"));
		Page<Customer> page = new Page<Customer>();
		page.setPageNo(index);
		page.setPageSize(20);
		
		List<Customer> custList = custService.getBlankCustListByDept(user.getDepartment(),page);
		String pageStr = PagingUtil.getPagelink(index, page.getTotalPage(), "", "customer/cust-fullfill-list");
		model.addAttribute("custList", custList);
		model.addAttribute("pageStr", pageStr);
		return "customer/cust-fullfill-list";
	}
}
