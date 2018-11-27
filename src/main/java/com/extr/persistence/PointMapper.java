package com.extr.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.extr.domain.user.Org;
import com.extr.domain.user.Point;

public interface PointMapper {

	public List<Point> getPointListByType(@Param("type") String type);	
	
	public List<Point> getBasePointList(String username);

	public List<Point> getAllPointList();
	
	public void deleteUserPointById(int user_point_id);
}
