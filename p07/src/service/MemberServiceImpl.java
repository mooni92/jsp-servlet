package service;

import java.util.List;

import dao.MemberDao;
import vo.Member;

public class MemberServiceImpl implements MemberService{
	private MemberDao dao = new MemberDao();
	
	public List<Member> getMembers(){
		return dao.getMembers();
		
	}

	@Override
	public boolean login(String id, String pwd) {
		// TODO Auto-generated method stub
		return dao.login(id, pwd);
	}

	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		dao.join(member);
	}
	
	@Override
	public Member findBy(String id) {
		// TODO Auto-generated method stub
		return dao.findBy(id);
	}

	@Override
	public void update(Member member) {
		// TODO Auto-generated method stub
		dao.update(member);
	}

	@Override
	public void withdrawal(String id) {
		dao.withdrawal(id);
	}
	
	
	
}
