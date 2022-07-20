package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.VO.BoardVO;
import kr.co.VO.Criteria;
import kr.co.VO.SearchCriteria;

@Service
public class BoardService {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "kr.co.boardMapper";

	// 목록 전부 조회
//	public List<BoardVO> selectBoard() throws Exception {
//		return sqlSession.selectList(namespace + ".list");
//	}

	// 목록 페이징 조회
//	public List<BoardVO> list(Criteria cri) throws Exception {
//		return sqlSession.selectList(namespace + ".listPage", cri);
//	}
//
//	public int listCount() throws Exception {
//		return sqlSession.selectOne(namespace + ".listCount");
//	}

	// 목록 페이징+검색 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList(namespace + ".listPage", scri);
	}
	
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne(namespace + ".listCount", scri);
	}

}
