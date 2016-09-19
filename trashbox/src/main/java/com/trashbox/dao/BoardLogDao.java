package com.trashbox.dao;

import com.trashbox.vo.BoardLog;

public interface BoardLogDao {
  int insert(BoardLog boardLog) throws Exception;
}
