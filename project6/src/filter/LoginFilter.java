package filter; /**
 * Created by XPS 13 9350 on 2017/8/27.
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import regexr.Regexr;


public class LoginFilter implements Filter {
    public static final String login_page = "/pro_login.jsp";
    public static final String logout_page = "/pro_login.jsp?error=unLogin";

    public void destroy() {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String currentURL = request.getRequestURI();
        String ctxPath = request.getContextPath();
        //除掉项目名称时访问页面当前路径
        String targetURL = currentURL.substring(ctxPath.length());
        HttpSession session = request.getSession(false);

        //生成正则表达式对象
        Regexr re =new Regexr();

        //对当前页面进行判断，如果当前页面不为登录页面
        if (!(re.compare_reg("/pro_login.jsp",targetURL) || "/lay_login.jsp".equals(targetURL) || "/lay_loginout.jsp".equals(targetURL)
        ||"/lay_signup.jsp".equals(targetURL) ||"/pro_verify.jsp".equals(targetURL) ||"/lay_regist.jsp".equals(targetURL)
        )) {
            if (session == null || session.getAttribute("user_now") == null) {
                response.sendRedirect(logout_page);
                return;
            } else {
                filterChain.doFilter(request, response);
                return;
            }
        } else {
            filterChain.doFilter(request, response);
            return;
        }

    }

    public void init(FilterConfig filterConfig) throws ServletException {

    }
}

