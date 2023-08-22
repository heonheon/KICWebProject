package service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BodyInfo;
import mybatis.BodyAnno;

@Repository
public class BodyMybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertBodyInfo(BodyInfo bodyInfo) {
		return sqlSession.getMapper(BodyAnno.class).insertBodyInfo(bodyInfo);
	}
	
	public List<BodyInfo> bodyInfoList(String id) {
		return sqlSession.getMapper(BodyAnno.class).bodyInfoList(id);
	}
}
