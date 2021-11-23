package service;

import java.util.List;

import vo.Member;

public interface MemberService {
	// 할 일

	// 가입
	void join(Member member);

	// 로그인
	boolean login(String id, String pwd);

	// 탈퇴
	void withdrawal(String id);

	// 정보수정
	void update(Member member);

	// id/pw찾기

	// 회원목록 조회
	List<Member> getMembers();

	Object findBy(String id);

}