package oa.employee.user.dao;

import oa.employee.user.entity.UserTestEntity;

public interface UserTestEntityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserTestEntity record);

    int insertSelective(UserTestEntity record);

    UserTestEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserTestEntity record);

    int updateByPrimaryKey(UserTestEntity record);
}