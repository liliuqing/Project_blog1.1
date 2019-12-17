package Dao;

import Util.JDBCUtil;
import Util.StringUtil;
import entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public interface UserDao {
    public User Login(String email, String password);
    public boolean Judge(String key,String values);
    public void Regist(String email,String password,String username,String age,String sex);
    public void ChageInfo(int id,String key,String values);
    public void ChangePwd(String email,String password);
}
