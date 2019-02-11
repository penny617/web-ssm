package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ssm.common.easyuitool.DataGrid;
import ssm.common.easyuitool.PageTool;
import ssm.pojo.User;
import ssm.service.UserServiceI;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/userController")
public class UserController {

    private static final String SUCCESS = "showUser";
    private static final String ERROR = "MyJsp";

    @Autowired
    private UserServiceI userServiceI;


    @RequestMapping("/showUser.do")
    public String showUser(String cardNo, Map<String, Object> map) {
        System.out.println(cardNo + "11111");
        User user = this.userServiceI.getUserById(cardNo);
        if (user != null) {
            map.put("user", user);
            return SUCCESS;
        }
        return ERROR;
    }

    @RequestMapping("/showAllUser.do")
    @ResponseBody
    public DataGrid showAllUser(int page,int rows) {

        List<User> list1 = this.userServiceI.getAll();
        int recordCount=list1.size();
        PageTool aPageTool=new PageTool(rows, page);
        System.out.println(aPageTool+"aaaaaaaaaaaaaaaaa");
        List<User> list = this.userServiceI.getAllPage(aPageTool);

        DataGrid dataGrid=new DataGrid();
        dataGrid.setRows(list);
        dataGrid.setTotal(recordCount);
        return dataGrid;
    }

    @RequestMapping("/addUser.do")
    public String addUser(User user) {
        User user1 = userServiceI.addUser(user);
        return SUCCESS;
    }

    @RequestMapping("/updateUser.do")
    public String updateUser(User user,HttpServletRequest request,String name,String address,String cardNo) {
        if (cardNo!=null) {

            User user1 = this.userServiceI.getUserById(cardNo);
            request.getSession().setAttribute("user1", user1);
            return "update";
        }
        user.setName(name);
        user.setAddress(address);
        user.setCardNo(cardNo);

        int num = this.userServiceI.updateUser(user);
        return SUCCESS;
    }

    @RequestMapping("/deletUser.do")
    public String deletUser(String cardNo) {
        int num = this.userServiceI.deletUser(cardNo);
        return SUCCESS;
    }

    @RequestMapping("/likeSelect.do")
    @ResponseBody
    public DataGrid likeSelect(String news,int page,int rows) {
        List<User> list1 = this.userServiceI.likeSelect1(news);
        int recordCount=list1.size();
        PageTool aPageTool=new PageTool(rows, page,news);
        List<User> num = this.userServiceI.likeSelect(aPageTool);
        DataGrid dataGrid=new DataGrid();
        dataGrid.setRows(num);
        dataGrid.setTotal(recordCount);
        return dataGrid;
    }



  }
