package User;

import Dao.UserDao;
import Dao.UserDaoImp;
import entity.User;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String imageText = request.getParameter("image");
        String text = (String) request.getSession().getAttribute("text");
        String email=request.getParameter("email");
        String password = request.getParameter("password");
        if (!text.equalsIgnoreCase(imageText)) {
            request.setAttribute("errMsg", "验证码输入错误!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        else{
            // 获取用户名和密码

            UserDao dao= new UserDaoImp();
            User user=dao.Login(email,password);
            if(user==null) {
                // request.setAttribute("error", "用户名或密码错误!");
                request.setAttribute("errMsg","用户名或密码输入错误！");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
            else {
                //用户
                request.getSession().setAttribute("age",user.getAge());
                request.getSession().setAttribute("sex",user.getSex());
                request.getSession().setAttribute("userid",user.getId());
                request.getSession().setAttribute("username",user.getUsername());
                request.getSession().setAttribute("email",user.getEmail());
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
