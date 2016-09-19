package com.trashbox.dao;

import com.trashbox.vo.RecommendLog;

public interface RecommendLogDao {
  int insert(RecommendLog recommendLog);
  boolean checkRecommend(RecommendLog recommendLog);
  
}
