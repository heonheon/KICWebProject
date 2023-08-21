package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.DietInfo;


public interface DietAnno {
	
	@Insert("insert into dietinfo values (mealseq.nextval, #{meal}, #{foodName}, #{foodWeight}, #{carbo}, #{protine}, #{fat}, #{calorie}, #{id}, sysdate)")
	public int insertDiet(DietInfo dietinfo);
	
	@Select("select * from dietinfo")
	public List<DietInfo> dietInfoList();
	
	@Select("select * from dietinfo where id = #{id} order by mealdate desc")
	public List<DietInfo> dietInfoList1(String id);
	
	@Select("select * from dietinfo where id = #{id} and to_char(MEALDATE, 'yyyy-mm-dd') = #{mealdate} order by mealdate")
	public List<DietInfo> dietInfoList2(Map map);
	
	@Delete("delete from dietinfo where num = #{num}")
	public int dietDelete(int num);
	
	@Select("select * from dietinfo where foodname = #{foodname}")
	public List<DietInfo> foodinfo(String foodname);
}
