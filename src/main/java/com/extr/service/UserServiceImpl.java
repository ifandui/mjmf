package com.extr.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.extr.domain.user.Dafen;
import com.extr.domain.user.Mistake;
import com.extr.domain.user.Point;
import com.extr.domain.user.User;
import com.extr.domain.user.UserDafen;
import com.extr.persistence.MistakeMapper;
import com.extr.persistence.PointMapper;
import com.extr.persistence.UserDafenMapper;
import com.extr.persistence.UserMapper;
import com.extr.util.Page;

/**
 * @author Ocelot
 * @date 2014年6月8日 下午8:21:31
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	public UserMapper userMapper;
	
	
	@Autowired
	public MistakeMapper mistakeMapper;
	
	@Autowired
	public PointMapper pointMapper;
	
	@Autowired
	public UserDafenMapper userDafenMapper;
	
	@Override
	@Transactional
	public int addUser(User user) {
		try {
			int userId = -1;
			userMapper.insertUser(user);
			userId = user.getId();
			if (user.getRoleListStack() == null)
				userMapper.grantUserRole(userId, 3);
			else
				userMapper.grantUserRole(user.getId(), user.getRoleListStack().get(0).getId());
			
			return userId;
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
	}
	
	@Override
	@Transactional
	public int addAdmin(User user) {
		try {
			int userId = -1;
			userMapper.insertUser(user);
			userId = user.getId();
			if (user.getRoleListStack() == null)
				userMapper.grantUserRole(userId, 1);
			else
				userMapper.grantUserRole(user.getId(), user.getRoleListStack().get(0).getId());
			
			return userId;
		} catch (Exception e) {
			if(e.getClass().getName().equals("org.springframework.dao.DuplicateKeyException"))
				throw new RuntimeException("duplicate-username");
			else 
				throw new RuntimeException(e.getMessage());
		}
	}

	@Override
	public List<User> getUserListByRoleId(int roleId,Page<User> page) {
		// TODO Auto-generated method stub
		List<User> userList = userMapper.getUserListByRoleId(roleId, page);
		return userList;
	}

	@Override
	public List<User> getUserListByRoleIdAndStatus(int roleId,int status,Page<User> page) {
		// TODO Auto-generated method stub
		List<User> userList = userMapper.getUserListByRoleIdAndStatus(roleId,status, page);
		return userList;
	}
	
	@Override
	public List<User> getUserListByIsall(String isall,Page<User> page) {
		// TODO Auto-generated method stub
		List<User> userList = userMapper.getUserListByIsall(isall, page);
		return userList;
	}
	
	@Override
	public List<User> getUserListByIsallAndIswin(String isall,String iswin){
		List<User> userList = userMapper.getUserListByIsallAndIswin(isall, iswin);
		return userList;
	}
	
	@Override
	public List<User> getUserListByIsallAndIswinAndWinlevel(String isall,String iswin,String winlevel){
		List<User> userList = userMapper.getUserListByIsallAndIswinAndWinlevel(isall, iswin,winlevel);
		return userList;
	}
	
	@Override
	public void updateUser(User user, String oldPassword) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user, oldPassword);
	}

	@Override
	public User getUserById(int user_id) {
		// TODO Auto-generated method stub
		return userMapper.getUserById(user_id);
	}

	@Override
	public void disableUser(int user_id) {
		// TODO Auto-generated method stub
	}

	public User getUserByName(String username){
		return userMapper.getUserByName(username);
	}

	public void updateStatus(User user){
		userMapper.updateStatus(user);
	}
	
	public void updateIsall(User user){
		userMapper.updateIsall(user);
	}
	
	public void updateIswin(User user){
		userMapper.updateIswin(user);
	}

	@Override
	public int countWinner(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.countWinner(map);
	}

	@Override
	public List<User> getUserListByDept(String department) {
		List<User> userList = userMapper.getUserListByDept(department);
		return userList;
	}

	@Override
	public List<Mistake> getMistakeListByDept(String department, Page<Mistake> page) {
		List<Mistake> mistakes=mistakeMapper.getMistakeListByDept(department, page);
		return mistakes;
	}

	@Override
	public void updateMistakeList(List<Mistake> list) {
		mistakeMapper.updateMistakeList(list);
	}

	@Override
	public void updateTotalCountList(List<Mistake> list) {
		mistakeMapper.updateTotalCountList(list);
	}

	@Override
	public List<Point> getBasePointList(String username) {
		return pointMapper.getBasePointList(username);
	}
	@Override
	public List<Point> getAllPointList() {
		return pointMapper.getAllPointList();
	}
	
	@Override
	public void deleteUserPointById(int user_point_id) {
		pointMapper.deleteUserPointById(user_point_id);
	}
	
	@Override
	public List<UserDafen> getAllList(){
		return userDafenMapper.getAllList();
	}

	@Override
	public void addDafen(List<Dafen> list) {
		userDafenMapper.addDafen(list);
		
	}
}
