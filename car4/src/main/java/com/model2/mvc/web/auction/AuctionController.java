package com.model2.mvc.web.auction;

import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.FileUpload;
import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Auction;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.auction.AuctionService;


@Controller
public class AuctionController {

	///Field
	@Autowired
	@Qualifier("auctionServiceImpl")
	private AuctionService auctionService;
	public Auction auction;

	//default Constructor
	public AuctionController(){
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	//=10;
	
	@RequestMapping("/addAuction.do")
	public String addauction( @ModelAttribute("auction") Auction auction, Model model, HttpSession session ) throws Exception {

		System.out.println("/addAuction.do");
		//Business Logic
		auctionService.addAuction(auction);
		session.setAttribute("auction", auction);
		return "redirect:/listAuction.do";
	}

	//리스트 뿌리기
	@RequestMapping("/listAuction.do")
//	public String listAuction( @ModelAttribute("search") Search search, Model model, @RequestParam("menu") String menu) throws Exception {
	public String listAuction( @ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("listAuction.do");
		
		if(search.getCurrentPage()==0 ) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		//목록들을 전달하기 위해
		Map<String, Object> map = auctionService.getAuctionList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
	//	model.addAttribute("menu", menu);
		
		return "forward:/listAuction.jsp";
	}
	

		@RequestMapping("/getAuctionView.do")
		public String listCar(@ModelAttribute("serach") Search search, Model model , 
													HttpServletRequest request, Auction auction)throws Exception{
			System.out.println("/getAuctionView.do");
			//**********Car 정보제공 
			System.out.println("auction.getAuctionNo() :::::::: "+ auction.getAuctionNo() );
			
			Auction dbAuction = auctionService.getAuction(auction.getAuctionNo()); //auctionNo 가져와서 쿼리
			
			System.out.println("dbAuction ::::" + dbAuction);
//			auctionService.getAuction();
//			carService.carView("가222");
//			carService.carViewOption(43001);
			
			
//			fileService.getFile(61001);
			
//			FileUpload file = fileService.getFile(61001);
			
//			System.out.println("Board"+file.getImgPath());
			
			model.addAttribute("auction", dbAuction); //모델 dbAuction 연결
//			model.addAttribute( "file", file);
			
//			**********Car 정보제공  끝---------------
			
			
			
			
//			//Page 나누기 부분 
//			if(search.getCurrentPage() ==0 ){
//				search.setCurrentPage(1);
//			}
//			search.setPageSize(pageSize);
//			
//			// Business logic ����
//			Map<String , Object> map=carService.getCarList(search);
//			
//			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//			System.out.println(resultPage);
//			
//			// Model �� View ����
//			model.addAttribute("list", map.get("list"));
//			model.addAttribute("resultPage", resultPage);
//			model.addAttribute("search", search);
//			
			return "forward:carView.jsp";
		}
		  
		@RequestMapping("/joinAuctionView.do")
		public String joinAuctionView(Model model , 
				HttpServletRequest request, Auction auction) throws Exception{
			
			System.out.println("/getAuctionView.do");

			System.out.println("auction.getAuctionNo() ::::::::: "+ auction.getAuctionNo() );
			
			Auction dbAuction = auctionService.getAuction(auction.getAuctionNo()); //auctionNo 가져와서 쿼리
			
			model.addAttribute("auction", dbAuction); //모델 dbAuction 연결

			return "forward:auctionInfo.jsp";
		}
}