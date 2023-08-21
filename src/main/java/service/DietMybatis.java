package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DietInfo;
import mybatis.DietAnno;

@Repository
public class DietMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertDiet(DietInfo dietinfo) {
		return sqlSession.getMapper(DietAnno.class).insertDiet(dietinfo);
	}
	
	public List<DietInfo> dietInfoList() {
		return sqlSession.getMapper(DietAnno.class).dietInfoList();
	}
	
	public List<DietInfo> dietInfoList(String id) {
		return sqlSession.getMapper(DietAnno.class).dietInfoList1(id);
	}
	
	public List<DietInfo> dietInfoList(String id, String mealdate) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("mealdate", mealdate);
		return sqlSession.getMapper(DietAnno.class).dietInfoList2(map);

	}
	
	public int dietDelete(int num) {
		return sqlSession.getMapper(DietAnno.class).dietDelete(num);
	}
	
	public List<DietInfo> foodinfo(String foodname) {
		return sqlSession.getMapper(DietAnno.class).foodinfo(foodname);
	}
}
