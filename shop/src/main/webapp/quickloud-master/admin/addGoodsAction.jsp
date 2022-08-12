<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "service.GoodsService" %>
<%@ page import = "shop.vo.Goods"%>
<%@ page import = "shop.vo.GoodsImg"%>
<%
	
	//String dir = "c:\\upload"; // 동적으로 지정
	String dir =request.getServletContext().getRealPath("/upload");
	System.out.print(dir);
	
	int max = 10 * 1024 * 1024; 
	MultipartRequest mRequest = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
	String goodsName = mRequest.getParameter("goodsName");
	int  goodsPrice = Integer.parseInt(mRequest.getParameter("goodsPrice"));
	String contentType = mRequest.getContentType("goodsImg");
	String originalFilename = mRequest.getOriginalFileName("goodsImg");
	String systemFilename = mRequest.getFilesystemName("goodsImg");

	// 업로드된 파일이 이미지 파일이 아닐경우
	// if(!(contentType.equals("image/gif")&& !(contentType.equals("image/png"))|| !(contentType.equals("image/jpg")))){ 
	if( !(contentType.equals("image/gif")||contentType.equals("image/jpeg")||contentType.equals("image/png")||contentType.equals("image/jpg"))){
		// 이미 업로드된 파일을 삭제
		File f = new File(dir+"\\"+ systemFilename);
		if(f.exists()){
			f.delete();
		}
		
		response.sendRedirect(request.getContextPath()+"/admin/addGoodsForm.jsp?errorMsg="+URLEncoder.encode("이미지파일만 업로드가능", "utf-8"));
		
		return;
		
	} 
	
	
	System.out.println(contentType +" <-- 마임타입");
	System.out.println(originalFilename +" <-- 원본파일이름");
	System.out.println(systemFilename +" <-- 새로 만들어진 파일이름");
	
	GoodsImg goodsImg = new GoodsImg();
	goodsImg.setFilename(systemFilename);
	goodsImg.setOriginFileName(originalFilename);
	goodsImg.setContentType(contentType);
	
	Goods goods = new Goods();
	goods.setGoodsName(goodsName);
	goods.setGoodsPrice(goodsPrice);
	
	
	GoodsService goodsService = new GoodsService();
	goodsService.addGoods(goods, goodsImg);
	
	
	response.sendRedirect(request.getContextPath()+"/admin/adminGoodsList.jsp");
	
	
%>
