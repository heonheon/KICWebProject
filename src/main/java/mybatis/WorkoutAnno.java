package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import model.WorkoutInfo;
import model.WorkoutMenu;


public interface WorkoutAnno {
	
	@Select("select * from workoutmenu where woType like '${aero}%'")
	public List<WorkoutMenu> readMenu(@Param("aero") String aero);
	
	@Insert("insert into workoutinfo values (workoutseq.nextval, #{id}, #{wocode}, sysdate, #{paraone}, #{paratwo}, #{parathr})")
	public int insertWorkout(WorkoutInfo workoutInfo);
	
	@Select("select  w.* , (select woname from workoutmenu where wotype = w.wocode )  woname from workoutinfo w where id = #{id} order by wodate desc")
	public List<WorkoutInfo> workoutInfoList1(String id);
	
	@Select("select  w.* , (select woname from workoutmenu where wotype = w.wocode )  woname from WORKOUTINFO w where to_char(WODATE, 'yyyy-mm-dd') = #{wodate} and id = #{id} order by num")
	public List<WorkoutInfo> workoutInfoList2(Map map);
	
	@Delete("delete from workoutinfo where num = #{num}")
	public int workoutDelete(int num);
}
