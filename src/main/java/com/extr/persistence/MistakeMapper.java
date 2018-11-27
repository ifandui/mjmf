package com.extr.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.extr.domain.user.Mistake;
import com.extr.util.Page;

public interface MistakeMapper {


	/**
	 * 按部门获取差错列表
	 * 
	 * @return
	 */
	public List<Mistake> getMistakeListByDept(@Param("department") String department,@Param("page") Page<Mistake> page);

	public void addMistake(Mistake mistake);
	
	public void delMistake(Mistake mistake);
	
	public void updateMistake(Mistake mistake);

	public void updateTotalCountList(List<Mistake> list);
	public void updateMistakeList(List<Mistake> list);
	
}
