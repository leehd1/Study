package com.board.model;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.questionDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class qandaAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("qandaAction실행");
		String dir = req.getSession().getServletContext().getRealPath("/img/");
		
		//String dir = "D:\\workspace_jsp\\teamproj\\webContent\\upload";
		int maxSize = 1024*1024*100;
		String encoding = "UTF-8";
		MultipartRequest multi = 
				new MultipartRequest(req,dir,maxSize,encoding,
						new DefaultFileRenamePolicy());
		questionDTO qdto = new questionDTO();
		
		qdto.setQid(multi.getParameter("qid"));
		qdto.setQtitle(multi.getParameter("qtitle"));
		qdto.setQcontent(multi.getParameter("qcontent"));
		qdto.setQcate(multi.getParameter("qcate"));
		
		qdto.setDate(new Timestamp(System.currentTimeMillis()));

		qdto.setQfilename(multi.getOriginalFileName("file"));
		qdto.setQfilerealname(multi.getFilesystemName("file"));
		
		new packnoboardDAO().questionupload(qdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main/index.jsp");
		
		
		return forward;
	}

}
