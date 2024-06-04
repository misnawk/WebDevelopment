package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;

	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	public BoardDAO(){
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	

	
	
	//전체 게시물 조회
	//id : board_list
	//쿼리문은 ref를 내림차순으로, step을 오름차순으로 조회해주세요
	  public List<BoardVO> selectList() {
	        SqlSession sqlSession = factory.openSession();
	        List<BoardVO> list = sqlSession.selectList("b.board_list");
	        sqlSession.close();
	        return list;
	        		
	    }
	  
}
