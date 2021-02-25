package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.vo.BoardVO;

@Mapper
public interface BoardMapper {
	// 게시글 불러오기
	@Select("SELECT bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent FROM mvc_board ORDER BY bGroup DESC, bStep ASC")
	public List<BoardVO> getList();

	// 페이징을 적용한 게시글 불러오기
	@Select("SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM mvc_board ORDER BY bGroup DESC, bStep ASC ) A WHERE ROWNUM <= #{pageNum} * #{amount}) WHERE RNUM > (#{pageNum}-1) * #{amount}")
	public List<BoardVO> getListWithPaging(Criteria criteria);

	// 페이징이 적용되는 게시글 수 단위
	@Select("SELECT COUNT(*) FROM mvc_board")
	public int getTotalCount(Criteria criteria);

	// 글 작성하기
	@Insert("INSERT INTO mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) VALUES (mvc_board_seq.nextval, #{bName}, #{bTitle}, #{bContent}, 0, mvc_board_seq.currval, 0, 0)")
	public void insert(BoardVO boardVO);

	// 작성글 불러오기
	@Select("SELECT * FROM mvc_board WHERE bId = #{bno}")
	public BoardVO read(int bno);

	// 조회수 증가
	@Update("UPDATE mvc_board SET bHit = bHit+1 WHERE bId = #{bId}")
	public void upHit(int bno);

	// 작성글 삭제하기
	@Delete("DELETE FROM mvc_board WHERE bId = #{bId}")
	public void delete(BoardVO boardVO);

	// AJAX용 작성글 삭제하기
	@Delete("DELETE FROM mvc_board WHERE bId = #{bId}")
	public int ajaxDelete(int bId);

	// 작성글 수정하기
	@Update("UPDATE mvc_board SET bName = #{bName}, bTitle = #{bTitle}, bContent = #{bContent} where bId = #{bId}")
	public void modify(BoardVO boardVO);

	// 답변글 작성페이지 이동
	@Select("SELECT * FROM mvc_board WHERE bId = #{bno}")
	public BoardVO readReply(int bno);

	// 답변글 작성하기
	@Insert("INSERT INTO mvc_board (bId, bName, bTitle, bContent, bGroup, bStep, bIndent) VALUES (mvc_board_seq.nextval, #{bName}, #{bTitle}, #{bContent}, #{bGroup}, #{bStep}+1, #{bIndent}+1)")
	public void reply(BoardVO boardVO);

	// 답변글 형태 업데이트하기
	@Update("UPDATE mvc_board SET bStep = bStep + 1 WHERE bGroup = #{bGroup}")
	public void replyShape(BoardVO boardVO);
}