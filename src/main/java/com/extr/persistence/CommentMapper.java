package com.extr.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.extr.domain.question.Comment;
import com.extr.util.Page;

/**
 * @author Ocelot
 * @date 2014年6月8日 下午8:32:33
 */
public interface CommentMapper {

	List<Comment> getCommentByQuestionId(@Param("questionId") int questionId,@Param("indexId") int indexId,
			@Param("page") Page<Comment> page);
	
	/**
	 * 添加评论
	 * @param comment
	 */
	public void addComment(Comment comment);
	
	public Integer getMaxCommentIndexByQuestionId(@Param("questionId") int questionId);
}
