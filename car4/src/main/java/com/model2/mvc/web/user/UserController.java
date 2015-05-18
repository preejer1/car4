package com.model2.mvc.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


@Controller
public class UserController {

	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	public User user;


	public UserController(){
		System.out.println(this.getClass());
	}

	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�

	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;


	@RequestMapping("/addUserView.do")
	public String addUserView() throws Exception {

		System.out.println("/addUserView.do");

		return "redirect:/user/addUserView.jsp";
	}

	@RequestMapping("/addUser.do")
	public String addUser( @ModelAttribute("user") User user, HttpSession session ) throws Exception {

		System.out.println("/addUser.do");
		//Business Logic
		user.setPhone(user.getPhone1()+user.getPhone2()+user.getPhone3());
		userService.addUser(user);
		session.setAttribute("user", user);

		return "redirect:user/welcome.jsp";
	}

	@RequestMapping("/findUser.do")
	public String findUser(User user, Model model) throws Exception{

		System.out.println("/*****findId.do" + user);
		//Business Logic
		User dbUser = userService.findUserId(user);
		userService.findUserId(user);
		System.out.println("조합"+user);
		System.out.println("dbUser"+dbUser);

		model.addAttribute("findUser", dbUser);

		return "forward:/index.jsp";
	}

	@RequestMapping("/getUser.do")
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {

		System.out.println("/getUser.do");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);

		return "forward:/user/getUser.jsp";
	}


	//내정보 수정페이지 넘어가기.
	@RequestMapping("/updateUserView.do")
	public String updateUserView(Model model, HttpSession session) throws Exception{
		session.getAttribute("user");
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	//내정보 업데이트하기.
	@RequestMapping("/updateUser.do")
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/updateUser.do");
		//Business Logic
		userService.updateUser(user);

		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){ //프로그램상 세션이 꼬여버렸을 경우(?)
			session.setAttribute("user", user);
		}

		return "redirect:/getUser.do?userId="+user.getUserId();
		//return "redirect:/getUser.do?userId="+user.getUserId();
	}


	@RequestMapping("/loginView.do")
	public String loginView() throws Exception{

		System.out.println("/loginView.do");

		return "redirect:/user/loginView.jsp";
	}

	@RequestMapping("/login.do")
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{

		System.out.println("/login.do");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		System.out.println("userName?:"+dbUser.getUserName());
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}

		return "redirect:/index.jsp";
	}


	@RequestMapping("/logout.do")
	public String logout(HttpSession session ) throws Exception{

		System.out.println("logout.do");

		session.invalidate();

		return "redirect:/index.jsp";
	}

	@RequestMapping("/checkDuplication.do")
	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/checkDuplication.do");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model �� View ����
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplication.jsp";
	}

	@RequestMapping("/listUser.do")
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{

		System.out.println("/listUser.do");

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);


		Map<String , Object> map=userService.getUserList(search);

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println(search);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/listUser.jsp";
	}
}