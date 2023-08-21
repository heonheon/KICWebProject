package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.WorkoutInfo;
import model.WorkoutMenu;
import mybatis.WorkoutAnno;

@Repository
public class WorkoutMybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<WorkoutMenu> readMenu(String aero) {
		return sqlSession.getMapper(WorkoutAnno.class).readMenu(aero);
	}
	
	public int insertWorkout(WorkoutInfo workoutInfo) {
		return sqlSession.getMapper(WorkoutAnno.class).insertWorkout(workoutInfo);
	}
	
	public List<WorkoutInfo> workoutInfoList(String id) {
		return sqlSession.getMapper(WorkoutAnno.class).workoutInfoList1(id);
	}
	
	public List<WorkoutInfo> workoutInfoList(String id, String woDate) {
		Map map = new HashMap();
		map.put("wodate", woDate);
		map.put("id", id);
		return sqlSession.getMapper(WorkoutAnno.class).workoutInfoList2(map);
	}
	
	public int workoutDelete(int num) {
		return sqlSession.getMapper(WorkoutAnno.class).workoutDelete(num);
	}
}
