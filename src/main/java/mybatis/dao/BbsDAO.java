package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.BbsVO;

@Component
public class BbsDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	//목록 기능
	public BbsVO[] getList(int begin, int end, String bname) {
		BbsVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("bname", bname);
		
		List<BbsVO> list = ss.selectList("bbs.list", map);
		if(list != null && !list.isEmpty()) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//총 게시물 수를 반환하는 기능
	public int getTotalCount(String bname) {
		
		return ss.selectOne("bbs.total_count", bname);
		
	}
	
	//원글 저장하는 기능
	public int add(BbsVO vo) {
		return ss.insert("bbs.add", vo);
	}
	
	//원글 보기
	public BbsVO getBbs(String b_idx) {
		return ss.selectOne("bbs.view", b_idx);
		
	}
	
	//원글 수정
	public int editBbs(BbsVO vo) {
		return ss.update("bbs.edit", vo);
	}
	
	// 조회수 증가
	public boolean updateHit(String b_idx) {
		boolean value = false;
		int cnt = ss.update("bbs.hit", b_idx);
		
		if(cnt > 0)
			value = true;
		
		return value;
	}
	
	//원글 수정
	public int delBbs(String b_idx) {
		return ss.update("bbs.del", b_idx);
	}
	
	//게시물 상위 몇개 가져오기
	public BbsVO[] topList(String bname, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bname", bname);
		map.put("limit", limit);
		
		BbsVO[] ar = null;
		List<BbsVO> list = ss.selectList("bbs.top_list", map);
		if(list != null && !list.isEmpty()) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
}
