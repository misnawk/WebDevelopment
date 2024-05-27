package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.MemberVO;

// DAO(Data Access Object)
// DB의 데이터에 접근하기 위한 객체
// DB에 접근하기 위한 로직을 분리하기 위해 사용한다.
// 직접 DB에 접근하여 data를 삽입, 삭제, 조회등을 조작할 수 있는 기능을 수행한다.
public class MemberDAO {

    // single-ton pattern:
    // 객체1개만생성해서 지속적으로 서비스하자
    static MemberDAO single = null;

    public static MemberDAO getInstance() {
        // 생성되지 않았으면 생성
        if (single == null)
            single = new MemberDAO();
        // 생성된 객체정보를 반환
        return single;
    }

    public List<MemberVO> selectList() {
        List<MemberVO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from member order by idx desc";

        try {
            // 1. connection 객체를 얻어온다.
            conn = DBService.getInstance().getConnection();
            // 2. 명령 처리 객체 정보를 얻어오기
            pstmt = conn.prepareStatement(sql);
            // 3. 결과 행 처리 객체 얻어오기
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberVO vo = new MemberVO();

                // 하나의 행을 vo에 객체에 저장
                vo.setIdx(rs.getInt("idx"));
                vo.setName(rs.getString("name"));
                vo.setId(rs.getString("id"));
                vo.setPwd(rs.getString("pwd"));
                vo.setEmail(rs.getString("email"));

                list.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public int insert(MemberVO vo) {
        int res = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "insert into member (idx, name, id, pwd, email) values (seq_member_idx.nextVal, ?, ?, ?, ?)";

        try {
            // 1. Connection 획득
            conn = DBService.getInstance().getConnection();
            // 2. 명령 처리 객체 획득
            pstmt = conn.prepareStatement(sql);

            // 3. pstmt parameter 채우기
            pstmt.setString(1, vo.getName());
            pstmt.setString(2, vo.getId());
            pstmt.setString(3, vo.getPwd());
            pstmt.setString(4, vo.getEmail());
            // 4. DB로 전송(res:처리된 행 수)
            res = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    public int delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from member where idx=?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, idx);
			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}
    	
}
