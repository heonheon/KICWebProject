package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.BodyInfo;


public interface BodyAnno {
	
	@Insert("insert into bodyinfo values (bodyseq.nextval, #{id}, #{bmi}, #{bodyheight}, #{bodyweight}, #{bodyfat}, #{muscul}, sysdate)")
	public int insertBodyInfo(BodyInfo bodyInfo);
	
	@Select("select * from bodyinfo where id = #{id}")
	public List<BodyInfo> bodyInfoList(String id);
}
