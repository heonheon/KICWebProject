package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.SnsComment;
import model.SnsContent;


public interface SnsAnno {
	@Insert("insert into snscontent values (contentseq.nextval, #{id}, #{photo1}, #{photo2}, #{photo3}, #{photo4}, #{photo5}, #{content}, sysdate)")
	public int insertContent(SnsContent snsContent);
	
	@Select("select * from snscontent")
	public List<SnsContent> contentInfo();
	
	@Select("select * from snscontent where id = #{id} order by num desc")
	public List<SnsContent> contentInfo1(String id);
	
	@Select("select * from snscontent where id = #{id} and to_char(contentdate, 'yyyy-mm-dd') = #{contentdate} order by num desc")
	public List<SnsContent> contentInfo2(Map map);
	
	@Delete("delete from snscontent where num = #{num}")
	public int snsDelete(int num);
	
	@Insert("insert into snscomment values (commentseq.nextval, #{num}, #{id}, #{content}, sysdate)")
	public int insertComment(Map map);
	
	@Select("select * from snscomment")
	public List<SnsComment> commentList1();
	
	@Select("select * from snscomment where num = #{num} order by ser desc")
	public List<SnsComment> commentList2(int num);
	
	@Select("select a.*,  b.* from snscontent a, snscomment b where a.num = b.num order by b.num desc, b.ser desc")
	public List<SnsComment> commentList3();
	
	@Delete("delete from snscomment where ser = #{ser}")
	public int commentDelete(int ser);
}	