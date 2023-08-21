package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.UserInfo;


public interface UserAnno {
	@Insert("insert into userinfo values (#{id}, #{email}, #{name}, #{password}, sysdate, #{gender}, #{bodyheight}, #{bodyweight}, #{bodyfat}, #{muscul}, #{bmi}, #{picture})")
	public int insertMember(UserInfo id);
	
	@Select("select * from userinfo where id = #{id}")
	public UserInfo oneId(String id);
	
	@Update("update userinfo set email = #{email}, name = #{name}, gender = #{gender}, bodyheight = #{bodyheight}, bodyweight = #{bodyweight}, bodyfat = #{bodyfat}, muscul = #{muscul}, bmi = #{bmi}, picture = #{picture} where id = #{id}")
	public int updateMember(UserInfo id);
	
	@Select("select * from userinfo")
	public List<UserInfo> idInfo();
	
	@Update("update userinfo set password = #{password} where id = #{id}")
	public int changePass(Map map);
	
	@Delete("delete from userinfo where id = #{id}")
	public int deleteMember1(String id);
	
	@Delete("delete from bodyinfo where id = #{id}")
	public int deleteMember2(String id);
	
	@Delete("delete from dietinfo where id = #{id}")
	public int deleteMember3(String id);
	
	@Delete("delete from workoutinfo where id = #{id}")
	public int deleteMember4(String id);
	
	@Delete("delete from snscontent where id = #{id}")
	public int deleteMember5(String id);
	
	@Delete("delete from snscomment where id = #{id}")
	public int deleteMember6(String id);
}
