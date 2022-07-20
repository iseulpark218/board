package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.VO.BoardVO;
import kr.co.VO.Criteria;

@Service
public class BoardService {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "kr.co.boardMapper";

	// 목록 전부 조회
//	public List<BoardVO> selectBoard() throws Exception {
//		return sqlSession.selectList(namespace + ".list");
//	}

	public List<BoardVO> list(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listPage", cri);
	}

	public int listCount() throws Exception {
		return sqlSession.selectOne(namespace + ".listCount");
	}

}
