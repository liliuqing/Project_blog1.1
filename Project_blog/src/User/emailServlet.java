package User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet("/emailServlet")
public class emailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");

        email sendEmail=new email();

        //设置要发送的邮箱


        sendEmail.setReceiveMailAccount(email);//这里是邮件发送的邮箱地址，我们可以改成一个变量传入

        //创建9位发验证码

        Random random=new Random();

        String str="";

        for(int i=0;i<9;i++) {

            int n=random.nextInt(10);

            str+=n;

        }

        sendEmail.setInfo(str);

        try {

            sendEmail.Send();
            request.getSession().setAttribute("str",str);

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}
