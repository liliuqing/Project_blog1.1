package User;

import entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/user/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //判断session中是否有登录用户信息
        HttpServletRequest request = (HttpServletRequest)req;
        String username= (String) request.getSession().getAttribute("username");

        if(username == null){
            //没有登录，则跳到登录页面
            HttpServletResponse response = (HttpServletResponse)resp;
            response.sendRedirect("../login.jsp");


        }else{
            //有登录，则放行
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
