package blog;

import Dao.BlogDao;
import Dao.BlogDaoImp;
import Util.FileUploadUtil;
import entity.Blog;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet("/AddBlog")
public class AddBlog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //  String accessPath = FileUploadUtil.uploadFile(request, "file");

        //获取前端的参数
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String content = request.getParameter("content");
        Timestamp time = new Timestamp(System.currentTimeMillis());//获取当前系统的时间
        //获取当前登录用户
        int userid=(int)request.getSession().getAttribute("userid");
        //调用DAO插入数据
        BlogDao dao = new BlogDaoImp();
        dao.add(title,type, content,time, userid);
      //  dao.add(title,type, content,time, user.getUsername(), accessPath);
        //跳转到列表页面(请求转发，重定向)
        request.getRequestDispatcher("/user/blog_info.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
