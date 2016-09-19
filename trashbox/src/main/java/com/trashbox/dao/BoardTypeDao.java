package com.trashbox.dao;

import java.util.List;
import java.util.Map;

import com.trashbox.vo.BoardType;

public interface BoardTypeDao {
	BoardType selectBoardType(Map<String, Object> paramMap);
	List<BoardType> selectBoardTypeList();
	
}
