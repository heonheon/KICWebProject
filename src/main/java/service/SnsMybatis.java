package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Heart;
import model.SnsComment;
import model.SnsContent;
import mybatis.SnsAnno;

@Repository
public class SnsMybatis {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertContent(SnsContent snsContent) {
		return sqlSession.getMapper(SnsAnno.class).insertContent(snsContent);
	}
	
	public List<SnsContent> contentInfo() {
		return sqlSession.getMapper(SnsAnno.class).contentInfo();
	}
	
	public List<SnsContent> contentInfo(String id) {
		return sqlSession.getMapper(SnsAnno.class).contentInfo1(id);
	}
	
	public List<SnsContent> contentInfo(String id, String snsDate) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("contentdate", snsDate);
		return sqlSession.getMapper(SnsAnno.class).contentInfo2(map);
	}
	
	public int snsDelete(int num) {
		return sqlSession.getMapper(SnsAnno.class).snsDelete(num);
	}
	
	public int insertComment(String comment, int num, String id) {
		Map map = new HashMap();
		map.put("content", comment);
		map.put("num", num);
		map.put("id", id);
		return sqlSession.getMapper(SnsAnno.class).insertComment(map);
	}
	
	public List<SnsComment> commentList(int num) {
		return sqlSession.getMapper(SnsAnno.class).commentList(num);
	}
	
	public int commentDelete(int ser) {
		return sqlSession.getMapper(SnsAnno.class).commentDelete(ser);
	}
	
	public List<SnsContent> checkHeart(String userId, String heartId) {
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("heartId", heartId);
		return sqlSession.getMapper(SnsAnno.class).checkHeart(map);
	}
	
	public List<SnsContent> checkHeart(String userId, String heartId, String snsDate) {
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("heartId", heartId);
		map.put("contentdate", snsDate);
		return sqlSession.getMapper(SnsAnno.class).checkHeart2(map);
	}
}
