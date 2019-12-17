package blog;

import Dao.BlogDao;
import Dao.BlogDaoImp;
import entity.Blog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ViewBlog")
public class ViewBlog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blogid=request.getParameter("blogid");
        BlogDao dao = new BlogDaoImp();
        Blog blog=dao.viewById(blogid);
        request.getSession().setAttribute("blog",blog);
        request.getRequestDispatcher("/user/viewblog.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
