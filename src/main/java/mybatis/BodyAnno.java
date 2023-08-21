package mybatis;

import org.apache.ibatis.annotations.Insert;

import model.BodyInfo;


public interface BodyAnno {
	
	@Insert("insert into bodyinfo values (bodyseq.nextval, #{id}, #{bmi}, #{bodyheight}, #{bodyweight}, #{bodyfat}, #{muscul}, sysdate)")
	public int insertBodyInfo(BodyInfo bodyInfo);
}
