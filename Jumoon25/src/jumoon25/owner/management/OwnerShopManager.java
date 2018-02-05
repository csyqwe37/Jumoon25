package jumoon25.owner.management;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jumoon25.admin.notice.NoticeDTO;

@Controller
public class OwnerShopManager {
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	private ShopDataBean dto = null;

	@RequestMapping("/owner_management/owner_main.do")
	public String owner_main(Model model) {
		
		//등록된 글번호중 가장 큰수(가장 최근) 가져오기
		int max = (int)sqlMap.queryForObject("notice.selectLastNo2");
		int max1 = max - 1;
		int max2 = max - 2;
		
		//가장 최근 글의 쓰여진 글 제목을 불러오기
		String title = (String)sqlMap.queryForObject("notice.selectTitle", max);
		String title1 = (String)sqlMap.queryForObject("notice.selectTitle", max1);
		String title2 = (String)sqlMap.queryForObject("notice.selectTitle", max2);
		
		//가장 최근 글의 쓰여진 날짜를 불러오기
 		String date = (String)sqlMap.queryForObject("notice.selectDate", max);
 		String date1 = (String)sqlMap.queryForObject("notice.selectDate", max1);
 		String date2 = (String)sqlMap.queryForObject("notice.selectDate", max2);
 		
 		//날짜를 연-월-일만 추출
 		String dateResult = date.substring(0, 10);
 		String date1Result = date1.substring(0, 10);
 		String date2Result = date2.substring(0, 10);
 		
		model.addAttribute("max", max);
		model.addAttribute("title", title);
		model.addAttribute("title1", title1);
		model.addAttribute("title2", title2);
		model.addAttribute("dateResult", dateResult);
		model.addAttribute("date1Result", date1Result);
		model.addAttribute("date2Result", date2Result);
		
		return "/owner_management/owner_main";
	}

	@RequestMapping("/owner_management/owner_checkPermission.do")
	public String owner_checkPermission() {
		return "/owner_management/owner_checkPermission";
	}

	@RequestMapping("/owner_management/owner_shop_management.do")
	public ModelAndView owner_shop_management(HttpSession session, ModelAndView mav) {

		String table_name = (String) session.getAttribute("ownerId") + "_shop";
		List list = sqlMap.queryForList("shop.getAll", table_name);

		mav = new ModelAndView();
		mav.addObject("list", list); // 데이터를 저장

		/*
		 * int check =
		 * (Integer)sqlMap.queryForObject("owner.ownerCheckPermission",session.
		 * getAttribute("ownerId")); if(check==0) { view =
		 * "redirect:/owner_management/owner_checkPermission.do"; }
		 */
		return mav;
	}

	@RequestMapping("/owner_management/owner_addShopForm.do")
	public String owner_addShopForm(HttpSession session) {
		String view = "/owner_management/owner_addShopForm";
		/*
		 * int check =
		 * (Integer)sqlMap.queryForObject("owner.ownerCheckPermission",session.
		 * getAttribute("ownerId")); if(check==0) { view =
		 * "redirect:/owner_management/owner_checkPermission.do"; }
		 */
		return view;
	}

	@RequestMapping(value = "/owner_management/owner_addShopPro.do", method = RequestMethod.POST)
	public String owner_addShopPro(MultipartHttpServletRequest multi, Model model, ShopDataBean shop_dto,
			HttpSession session, HttpServletRequest request) throws Exception {
		String id = (String) session.getAttribute("ownerId");
		String table_name = id + "_shop";
		int check = (int) sqlMap.queryForObject("shop.shopTableCheck", table_name.toUpperCase());

		String img = shop_dto.getShop_crNum();
		MultipartFile mf = multi.getFile("img");
		String orgName = mf.getOriginalFilename();
		String ext = orgName.substring(orgName.lastIndexOf("."));
		img += ext;
		String savePath = request.getRealPath("owner_shop_image");
		File copy = new File(savePath + "//" + img);
		mf.transferTo(copy);

		shop_dto.setShop_image(img);
		shop_dto.setShop_owner_id(id);
		if (check == 0) {
			sqlMap.insert("shop.shopCreate", id);
			sqlMap.insert("shop.shopInsert", shop_dto);
		} else {
			sqlMap.insert("shop.shopInsert", shop_dto);
		}
		return "/owner_management/owner_addShopPro";
	}

	@RequestMapping(value = "/owner_management/owner_shop_modify.do", method = RequestMethod.GET)
	public String owner_shop_modify(@RequestParam(value = "crNum") String crNum, ShopDataBean shop_dto,
			HttpSession session, Model model) throws Exception {
		shop_dto.setShop_crNum(crNum);
		shop_dto.setShop_owner_id((String) session.getAttribute("ownerId"));
		dto = (ShopDataBean) sqlMap.queryForObject("shop.getModify", shop_dto);
		model.addAttribute("dto", dto);
		return "/owner_management/owner_shop_modify";
	}

	@RequestMapping(value = "/owner_management/owner_shop_modifyPro.do", method = RequestMethod.POST)
	public String owner_shop_modifyPro(MultipartHttpServletRequest multi, ShopDataBean shop_dto, HttpSession session,
			HttpServletRequest request) throws Exception {
		String id = (String) session.getAttribute("ownerId");
		shop_dto.setShop_owner_id(id);
		String img = (String) shop_dto.getOrg_image();
		if (img.equals("1")) {
			MultipartFile mf = multi.getFile("img");
			img = shop_dto.getShop_crNum();
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			img += ext;
			String savePath = request.getRealPath("owner_shop_image");
			File copy = new File(savePath + "//" + img);
			mf.transferTo(copy);
		}
		shop_dto.setShop_image(img);

		sqlMap.update("shop.shopModify", shop_dto);
		return "/owner_management/owner_shop_modifyPro";
	}

	@RequestMapping(value = "/owner_management/owner_shop_pause.do", method = RequestMethod.GET)
	public String owner_shop_pause(@RequestParam(value = "crNum") String crNum, ShopDataBean shop_dto,
			HttpSession session, Model model) throws Exception {
		shop_dto.setShop_crNum(crNum);
		shop_dto.setShop_owner_id((String) session.getAttribute("ownerId"));
		int check = (int) sqlMap.queryForObject("shop.checkPause", shop_dto);
		if (check == 1) {
			sqlMap.update("shop.shopPause1", shop_dto);
			model.addAttribute("check", check);
		} else {
			sqlMap.update("shop.shopPause0", shop_dto);
			model.addAttribute("check", check);
		}
		return "/owner_management/owner_shop_pause";
	}

	@RequestMapping(value = "/owner_management/owner_shop_delete.do", method = RequestMethod.GET)
	public String owner_shop_delete(@RequestParam(value = "crNum") String crNum, ShopDataBean shop_dto,
			HttpSession session) throws Exception {
		shop_dto.setShop_crNum(crNum);
		shop_dto.setShop_owner_id((String) session.getAttribute("ownerId"));
		sqlMap.delete("shop.shopDelete", shop_dto);
		return "/owner_management/owner_shop_delete";
	}

	@RequestMapping(value = "/owner_management/owner_menu_management.do", method = RequestMethod.GET)
	public ModelAndView owner_menu_management(@RequestParam(value = "crNum") String crNum, HttpSession session,
			ModelAndView mav) {
		String id = (String) session.getAttribute("ownerId");
		String table_name = id + "_" + crNum;
		int check = (int) sqlMap.queryForObject("menu.menuTableCheck", table_name.toUpperCase());
		if (check == 0) {
			sqlMap.insert("menu.menuCreate", table_name);
		}

		mav = new ModelAndView();
		List list = sqlMap.queryForList("menu.getAll", table_name);
		mav.addObject("list", list);

		return mav;
	}

}
