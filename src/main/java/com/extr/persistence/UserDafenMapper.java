package com.extr.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.extr.domain.user.Dafen;
import com.extr.domain.user.Org;
import com.extr.domain.user.Point;
import com.extr.domain.user.UserDafen;

public interface UserDafenMapper {

	
	public List<UserDafen> getAllList();
	
	public void addDafen(List<Dafen> list);
}
