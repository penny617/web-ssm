package ssm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.common.easyuitool.PageTool;
import ssm.mapper.UserMapper;
import ssm.pojo.User;
import ssm.service.UserServiceI;

import java.util.List;

@Service
public class UserServiceImpl implements UserServiceI {

    @Autowired
    private UserMapper userMapper;

    public User getUserById(String cardNo) {
        User user=null;
        try {
            user = userMapper.getUserById(cardNo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }


    public List<User> getAll() {
        List<User> list = this.userMapper.getAll();
        return list;
    }


    public User addUser(User user) {

        user.setName(user.getName());
        user.setAddress(user.getAddress());
        user.setCardNo(user.getCardNo());
        User u = userMapper.addUser(user);
        return u;
    }


    public int deletUser(String cardNo) {
        int num = userMapper.deletUser(cardNo);
        return num;
    }


    public int updateUser(User user) {
        int num = this.userMapper.updateUser(user);
        return num;
    }

    public int select() {
        int num=this.userMapper.select();
        return num;
    }

    public List<User> getAllPage(PageTool aPageTool) {
        List<User> list = this.userMapper.getAllPage(aPageTool);
        return list;
    }

    public List<User>  likeSelect(PageTool aPageTool) {
        List<User> list=this.userMapper.likeSelect(aPageTool);
        return list;
    }
    public List<User>  likeSelect1(String news) {
        List<User> list=this.userMapper.likeSelect1(news);
        return list;
    }


}