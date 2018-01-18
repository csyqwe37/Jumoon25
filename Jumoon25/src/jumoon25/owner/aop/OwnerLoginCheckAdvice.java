package jumoon25.owner.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class OwnerLoginCheckAdvice {
	@Around("execution(public * jumoon.owner.management..*(..))")
	public Object around(ProceedingJoinPoint jp) throws Throwable {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		Object view = "";

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ownerId");
		if (id != null) {
			view = jp.proceed();
		} else {
			view = "/owner_login/owner_check";
		}

		return view;
	}
}
