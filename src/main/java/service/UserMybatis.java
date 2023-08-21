package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.UserInfo;
import mybatis.UserAnno;

@Repository
public class UserMybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertMember(UserInfo id) {
		return sqlSession.getMapper(UserAnno.class).insertMember(id);
	}
	
	public UserInfo oneId(String id) {
		return sqlSession.getMapper(UserAnno.class).oneId(id);
	}
	
	public int updateMember(UserInfo id) {
		return sqlSession.getMapper(UserAnno.class).updateMember(id);
	}
	
	public List<UserInfo> idInfo() {
		return sqlSession.getMapper(UserAnno.class).idInfo();
	}
	
	public int changePass(String id, String newPass) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("password", newPass);
		return sqlSession.getMapper(UserAnno.class).changePass(map);
	}
	
	public int deleteMember(String id) {
		int count=0;
		count += sqlSession.getMapper(UserAnno.class).deleteMember1(id);
		count += sqlSession.getMapper(UserAnno.class).deleteMember2(id);
		count += sqlSession.getMapper(UserAnno.class).deleteMember3(id);
		count += sqlSession.getMapper(UserAnno.class).deleteMember4(id);
		count += sqlSession.getMapper(UserAnno.class).deleteMember5(id);
		count += sqlSession.getMapper(UserAnno.class).deleteMember6(id);
		return count;
	}
}
