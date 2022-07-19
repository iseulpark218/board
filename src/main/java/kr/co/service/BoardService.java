package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.VO.BoardVO;

@Service
public class BoardService {
	private static final String namespace = "kr.co.boardMapper";
	@Inject
	private SqlSession sqlSession;

	public List<BoardVO> selectBoard() throws Exception {
		return sqlSession.selectList(namespace + ".list");
	}
}
