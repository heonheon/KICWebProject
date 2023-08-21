package mybatis;


import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Heart;

public interface HeartAnno {
	@Insert("insert into heart values (#{num}, #{id}, #{heart})")
	public int clickHeart(Heart heart);
	
	@Delete("delete from heart where num = #{num} and id = #{id}")
	public int heartDelete(Map map);
	
	@Select("select * from heart where num = #{num} and id = #{id}")
	public Heart heartInfo(Map map);
	
	@Select("select count(id) from heart where num = #{num}")
	public int heartCount(int num);
}
