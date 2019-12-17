package User;

import Dao.UserDao;
import Dao.UserDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/regist")
public class Regist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String password2=request.getParameter("password2");
        String username=request.getParameter("username");
        String age=request.getParameter("age");
        String sex=request.getParameter("sex");
        //String emailMsg=request.getParameter("emailMsg");
        UserDao dao = new UserDaoImp();
        boolean canContinue=false;
       // String str=(String) request.getSession().getAttribute("str");
        //if (!str.equals(emailMsg)) {
       //     request.setAttribute("errMsg", "验证码输入错误!");
       //     request.getRequestDispatcher("/regist.jsp").forward(request, response);
      //  }
        if(password.equals(password2)) {
            if(dao.Judge("email",email)&&dao.Judge("username",username))
            {
                dao.Regist(email,password,username,age,sex);
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
            else {
                //注册不成功
                request.setAttribute("errMsg","用户名或邮箱已存在");
                request.getRequestDispatcher("/regist.jsp").forward(request,response);
            }
        }
        else {
            request.setAttribute("errMsg","两次密码输入不一致");
            request.getRequestDispatcher("/regist.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
