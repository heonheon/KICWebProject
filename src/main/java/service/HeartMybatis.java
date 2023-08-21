package service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Heart;
import mybatis.HeartAnno;

@Repository
public class HeartMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int clickHeart(Heart heart) {
		return sqlSession.getMapper(HeartAnno.class).clickHeart(heart);
	}
	
	public int heartDelete(int num, String id) {
		Map map = new HashMap();
		map.put("num", num);
		map.put("id", id);
		return sqlSession.getMapper(HeartAnno.class).heartDelete(map);
	}
	
	public Heart heartInfo(int num, String id) {
		Map map = new HashMap();
		map.put("num", num);
		map.put("id", id);
		return sqlSession.getMapper(HeartAnno.class).heartInfo(map);
	}
	
	public int heartCount(int num) {
		return sqlSession.getMapper(HeartAnno.class).heartCount(num);
	}
}
