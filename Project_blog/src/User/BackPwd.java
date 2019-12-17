package User;

import Dao.UserDao;
import Dao.UserDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/backpwd")
public class BackPwd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //邮箱验证码验证 验证通过之后 修改密码
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String againpwd=request.getParameter("againpwd");
        UserDao dao=new UserDaoImp();
        boolean canContinue=dao.Judge("email",email);
        if(!canContinue){
        if(password.equals(againpwd)){
            dao.ChangePwd(email,password);
        request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        else {
            request.setAttribute("errMsg","密码输入不一致");
            request.getRequestDispatcher("/backPwd.jsp").forward(request,response);
        }
        }
        else {
            request.setAttribute("errMsg","邮箱不存在");
            request.getRequestDispatcher("/backPwd.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
