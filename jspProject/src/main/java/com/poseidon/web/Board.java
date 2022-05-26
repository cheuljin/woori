package com.poseidon.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.BoardDAO;
import com.poseidon.dto.BoardDTO;

@WebServlet("/board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Board() {
        super();

    }
//2022-05-12
//서버 프로그램 구현
//서버 프로그램 구현하기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DAO에게 일 시키기
		//List에 담아줘라.  DTO 여러개를...
		//전체 글수 = totalcount
		//시작페이지 번호 = pageNo
		int pageNo = 1;
		if(request.getParameter("pageNo") != null) {//jsp에서 페이지를 보내주네
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
			
		}
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> boardList = dao.boardList(pageNo * 10 - 10);
		
		RequestDispatcher rd = request.getRequestDispatcher("./board.jsp");
		request.setAttribute("list", boardList); // ${list } 실제 데이터
		request.setAttribute("totalcount", boardList.get(0).getTotalcount());// 전체글수 뽑아줘라
		request.setAttribute("pageNo", pageNo); // LIMIT 0, 10;
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
