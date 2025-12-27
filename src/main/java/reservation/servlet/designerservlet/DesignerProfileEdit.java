package reservation.servlet.designerservlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import reservation.dto.DesignerDTO;
import reservation.service.DesignerService;
import reservation.service.DesignerServiceImpl;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/designer/profile/edit")
public class DesignerProfileEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DesignerService designerService = new DesignerServiceImpl();
	
    public DesignerProfileEdit() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		DesignerDTO designerDto = designerService.getDesigner(id);
		request.setAttribute("designer", designerDto);
		request.getRequestDispatcher("/mypage_designer/profile_edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birthStr = request.getParameter("birth");
		java.sql.Date birth = java.sql.Date.valueOf(birthStr);
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String shopName = request.getParameter("shopName");
		String bizNum = request.getParameter("bizNum");
		String gender = request.getParameter("gender");
		String nation = request.getParameter("nation");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String addrDetail = request.getParameter("addrDetail");		
		
		DesignerDTO designerDto = DesignerDTO.builder()
				.id(id)
				.password(pw)
				.full_name(name)
				.birth(birth)
				.email(email)
				.phonenumber(phone)
				.shop_name(shopName)
				.biz_num(bizNum)
				.gender(gender)
				.nationality(nation)
				.city(city)
				.district(district)
				.addr_detail(addrDetail)			
				.build();
		
		int result = designerService.mypageupdate(designerDto);
		String root = request.getContextPath();
		response.sendRedirect(root + "/designer/profile");
	}

}
