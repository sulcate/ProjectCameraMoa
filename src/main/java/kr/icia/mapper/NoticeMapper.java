package kr.icia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.NoticeVO;

public interface NoticeMapper {

	// @Select("select * from tbl_board where bno > 0")
	public List<NoticeVO> getList();

	public void insert(NoticeVO notice);

	public void insertSelectKey(NoticeVO notice);

	public NoticeVO read(Long nbno);

	public int delete(Long nbno);

	public int update(NoticeVO notice);
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long nbno, @Param("amount") int amount);
}
