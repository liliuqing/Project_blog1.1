package User;

import Dao.UserDao;
import Dao.UserDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ChangeUserInfo")
public class ChangeUserInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String str=request.getParameter("str");
        String msg=request.getParameter(str);
        int id=(int)request.getSession().getAttribute("id");
        request.getSession().setAttribute(str,msg);
        UserDao dao=new UserDaoImp();
        dao.ChageInfo(id,str,msg);
        request.getRequestDispatcher("/user_info.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
