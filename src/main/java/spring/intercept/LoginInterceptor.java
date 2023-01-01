package spring.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 체크를 해서 만약! 로그인이 안된 상태라면 value에 false를 저장!
		// 그럼 먼저 HttpSession얻기!
		HttpSession session = request.getSession(true); // true의 의미는
		// 만약! session이 삭제된 상태라면 새로운 session을 생성해 준다.
		
		//로그인 시 저장했던 객체(mvo)를 얻어낸다.
		Object obj = session.getAttribute("mvo");
		if(obj == null) {
			//로그인을 하지 않은 경우를 의미함!
			response.sendRedirect("../login");
			return false;
		}
		
		//로그인이 된 상태인 경우.. 이때는 해야할 일들이 있으면 여기쯤에서 구현한다.
		return true;
	}

}
