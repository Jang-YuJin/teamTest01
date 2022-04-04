package projectDAO;

import java.sql.Connection;



import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import projectDTO.MemberDTO;
import projectDTO.ProductDTO;
import projectDTO.ReviewDTO;


public class ProjectImpl {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public ProjectImpl() {
		try {

			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public String checkID(String user_id) {
		String auth_id = "";
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " SELECT ID from tb_member1 ";
			query += " where ID = ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("아이디를 확인하고 있습니다. 입력된 id : " + user_id);
			while(rs.next()) {
				String id = rs.getString("id");
				if(id.equals(user_id)) {
					auth_id = "empty";
					System.out.println("중복된 아이디가 있습니다.");
				} else	{
					auth_id = id;
				}
			}
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return auth_id;
	}
	
	public void inputMember(MemberDTO memberDTO) {
		
		Date User_birth = Date.valueOf(memberDTO.getUser_birth());
		
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " INSERT INTO tb_member1 (id, password, name, tel, address, birth) values (?, ?, ?, ?, ?, ?) ";
			System.out.println("회원가입 입력 정보 DB에 삽입.");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberDTO.getUser_id());
			pstmt.setString(2, memberDTO.getUser_pw());
			pstmt.setString(3, memberDTO.getUser_name());
			pstmt.setString(4, memberDTO.getUser_tel());
			pstmt.setString(5, memberDTO.getUser_address());
			pstmt.setDate(6, User_birth);
			System.out.println("회원가입 완료");
			pstmt.executeUpdate();

			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ProductDTO> selectProducts(String p_code) {
		
		String order = "";
		String code = "";
		
		if(p_code.contains("q"))	{
			String[] tokens = p_code.split("q");
		
			code = tokens[0];
			order = tokens[1];
			
		} else	{
			code = p_code;
		}
		
		if(code.equals("all"))	{
			code = "%_";
		}
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " SELECT * from tb_product1 ";
			query += " where code like ? ";
			
			if(order.contains("asc")) {
			query += " order by price ";
			pstmt = con.prepareStatement(query);
			} else if(order.contains("desc"))	{
			query += " order by price desc";
			pstmt = con.prepareStatement(query);
			} else	{
			pstmt = con.prepareStatement(query);
			}
			
			pstmt.setString(1, code+"%");
			System.out.println(query + " = " + code);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("상품코드가 "+code+"인 상품 목록을 불러오고 있습니다.");
			while(rs.next()) {
				
				String pcode = rs.getString("code");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String representative = rs.getString("representative");
				String details = rs.getString("details");
				
				ProductDTO dto = new ProductDTO();
				
				dto.setP_code(pcode);
				dto.setP_name(name);
				dto.setP_price(price);
				dto.setP_representative(representative);
				dto.setP_details(details);
				list.add(dto);
			}
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ProductDTO extractProductInfo(String product_code) {

		ProductDTO dto = new ProductDTO();
		
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " SELECT * FROM tb_product1 ";
			query += " where code = ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product_code);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(product_code+"에 대한 상품 상세정보를 불러오고있습니다.");
			while(rs.next()) {
				
			String code = rs.getString("code");
			String name = rs.getString("name");
			int price = rs.getInt("price");
			String representative = rs.getString("representative");
			String details = rs.getString("details");
			
			dto.setP_code(code);
			dto.setP_name(name);
			dto.setP_price(price);
			dto.setP_representative(representative);
			dto.setP_details(details);
			
			}
			
			if(rs != null) {
			rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<ReviewDTO> extractReview(String product_code) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " SELECT * from tb_review1 ";
			query += " where code like ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product_code);
			System.out.println(query + " = "+ product_code);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(product_code+"에 대한 리뷰 목록을 불러오고 있습니다.");
			while(rs.next()) {
				
				String review_id = rs.getString("review_id");
				String id = rs.getString("id");
				String code = rs.getString("code");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date write_date = rs.getDate("write_date");
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_id(review_id);
				dto.setId(id);
				dto.setCode(code);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setWrite_date(write_date);
				list.add(dto);
			}
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int reviewNum(String product_code) {
		int review = 0;
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " select count (code) from tb_review1 ";
			query += " where code like ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product_code);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(product_code+ "에 대한 해당 상품의 리뷰 개수를 불러오고있습니다.");
			while(rs.next()) {
			review = rs.getInt("count(code)");
			}
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return review;
	}
	

public void inputReview(ReviewDTO rDTO) {
	
	String randomID = Integer.toString((int)(Math.random() * (720-360+1)+360));
	
	try {
		con = dataFactory.getConnection();
		String query = " ";
		query += " INSERT INTO tb_review1 (review_id, id , code, title, content, write_date) values (?, 'testID1', ?, ?, ?, sysdate) ";
		System.out.println("리뷰 입력 정보 DB에 삽입.");
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, randomID); // 로그인 구현 후 사용
		pstmt.setString(2, rDTO.getCode());
		pstmt.setString(3, rDTO.getTitle());
		pstmt.setString(4, rDTO.getContent());
		System.out.println(rDTO.getCode());
		System.out.println(rDTO.getTitle());
		System.out.println(rDTO.getContent());
		pstmt.executeUpdate();
		System.out.println("리뷰 등록 완료");

		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
}

}
