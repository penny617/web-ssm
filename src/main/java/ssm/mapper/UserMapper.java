package ssm.mapper;

import ssm.common.easyuitool.PageTool;
import ssm.pojo.User;

import java.util.List;


public interface UserMapper {

     public User getUserById(String cardNo);

     List<User> getAll();
     public User addUser(User user);//增加用户
     public int deletUser(String cardNo);//删除用户

     public int updateUser(User user);
     int select();
     public List<User> getAllPage(PageTool aPageTool);
     public List<User> likeSelect(PageTool aPageTool);
     public List<User> likeSelect1(String news);
}