package com.trashbox.dao;

import java.util.List;

import com.trashbox.vo.Role;

public interface RoleDao {
	int addDefaultRole(int userNo) throws Exception;
	List<Role> getRoles(int userNo) throws Exception;

}
