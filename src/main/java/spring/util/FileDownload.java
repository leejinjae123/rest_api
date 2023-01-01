package spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 값들 받기
		String dir = request.getParameter("dir"); //bbs_upload
		String filename = request.getParameter("fname"); //다운로드할 파일명
		
		//파일들이 저장된폴더를 절대경로화 시킨다.
		String realPath = getServletContext().getRealPath("/resources/"+dir+"/"+filename);
		
		File f = new File(realPath);
		if(f.isFile() && f.exists()){
			//생성된 파일이 파일이면서, 실제로 존재할 경우
			
			 byte[] buf = new byte[2048];
			 
			 //전송할 데이터가 스트림 처리될 떄 문자셋 지정
			 response.setContentType("application/octet-stream; charset=8859_1");
			 //다운로드 대화상자 처리
			 response.setHeader("Content-Disposition", "attachment;filename="+
					 new String(filename.getBytes(), "8859_1"));
			 //전송타입이 이진테이터(binary)
			 response.setHeader("Content-Transfer-Encoding", "binary");
			 //다운로드를 위한 스트림 준비
			 BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			 //요청한 곳으로 보내기 위해 스트림을 응답객체로부터 얻어낸다.
			 BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			 
			 int size = -1;
			 try {
				//bis로부터 읽기를 하자마자 bos로 보낸다.
				 while((size = bis.read(buf)) != -1) {
					 //읽은 자원은 buf라는 배열에 저장된 상태이고, buf라는 배열에 있는 내용을 쓰게 한다.
					 bos.write(buf, 0, size);
					 bos.flush();
				 }
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(bos != null)
					bos.close();
					
				if(bis != null)
					bis.close();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
