package com.trashbox.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.trashbox.controller.support.PaginationUtil;
import com.trashbox.service.BoardService;
import com.trashbox.service.FileService;
import com.trashbox.vo.Article;
import com.trashbox.vo.AttachFile;
import com.trashbox.vo.AttachFileForm;
import com.trashbox.vo.BoardType;
import com.trashbox.vo.PaginationInfo;
import com.trashbox.vo.Photo;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger LOG = LogManager.getLogger(BoardController.class);
	@Autowired BoardService boardService;
	@Autowired FileService fileService;
	/* /board/notice/1
	   /board/detail/1
	   /board/write
	   /board/edit/1  */

	
	/* LIST */
	@RequestMapping(value="/{boardTypeName}/{page}", method=RequestMethod.GET)
	public String list(@PathVariable String boardTypeName, 
			@PathVariable int page, Model model) throws Exception {
		
		LOG.debug(page);
		
		boolean noResults = false;
		
		BoardType boardType = boardService.getBoardType(boardTypeName);
		int total = boardService.getTotalCount(boardType);
		
		if(total > 0) {
			
			PaginationInfo paginationInfo = PaginationUtil.buildPaginationInfo(page, total, PaginationUtil.ARTICLE_LIMIT);
			List<Article> boardList = boardService.getArticleList(boardType, paginationInfo.getPage());
			
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("boardList", boardList);
		
		} else {
			noResults = true;
		}
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("noResults", noResults);
		
		
		return "board/list/" + boardType.getKoName() + "/" + boardType.getName();	
	}
	
	/* SEARCH */
	@RequestMapping(value="/search" , method=RequestMethod.POST)
	public String search(String boardTypeName, int page, 
			   String searchTarget, String searchQuery, Model model) throws Exception {
		
		boolean noResults = false;
		
		BoardType boardType = boardService.getBoardType(boardTypeName);
		int total = boardService.getTotalCount(boardType, searchTarget, searchQuery);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("searchTarget", searchTarget);
		model.addAttribute("searchQuery", searchQuery);
		
		if(total > 0) {
			
			PaginationInfo paginationInfo = PaginationUtil.buildPaginationInfo(page, total, PaginationUtil.ARTICLE_LIMIT);
			List<Article> boardList = boardService.getArticleList(boardType, paginationInfo.getPage(), total, searchTarget, searchQuery);
			
			model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("boardList", boardList);
			
			
			LOG.debug(boardType);
		
		} else {
			noResults = true;
		}
		
		model.addAttribute("noResults", noResults);
		
		
		LOG.debug("boardTypeName :: " +  boardTypeName);
		LOG.debug("searchTarget :: " +  searchTarget);
		LOG.debug("searchQuery :: " +  searchQuery);
		LOG.debug("total :: " +  total);
		
		return "board/search/" + boardType.getKoName() + "/" + boardType.getName();	
	}
	
	/* DETAIL */ // hit count (duplicate check)
	@RequestMapping(value="/detail/{articleNo}", method=RequestMethod.GET)
	public String detail(@PathVariable int articleNo, Model model) throws Exception {
		
		boardService.updateHitCount(articleNo);
		Article article = boardService.getArticle(articleNo);
		BoardType boardType = boardService.getBoardType(article.getBoardNo());
		List<Article> prevAndNextArticleList = boardService.getPrevAndNextArticleList(boardType, articleNo);
		
		List<AttachFile> attachFiles = fileService.getFileList(articleNo);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("article", article);
		model.addAttribute("list", prevAndNextArticleList);
		model.addAttribute("listSize", prevAndNextArticleList.size());
		
		model.addAttribute("attachFiles", attachFiles);
		
		return "board/detail/" + boardType.getKoName() + "/Detail";
	}

	/* WRITE */
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(@RequestParam(required=false)int categoryNo, Model model) throws Exception {
		
		List<BoardType> boardTypeList = boardService.getBoardTypeList();
		model.addAttribute("boardTypeList", boardTypeList);
		model.addAttribute("defaultCategory", categoryNo);

		
		return "board/write/글쓰기/Write";
	}
	
	@RequestMapping(value="/write/do", method=RequestMethod.POST)
	public String doWrite(String boardTypeName, Article article, 
			@RequestParam(value="file-name[]", required=false) String fileName[],
			@RequestParam(value="file-saveName[]", required=false) String fileSaveName[],
			@RequestParam(value="file-size[]", required=false) long fileSize[],
			@RequestParam(value="file-type[]", required=false) String fileType[]) throws Exception {
	
	    LOG.debug(article);
    
		boardService.getBoardTypeAndCheckAuth(article.getBoardNo()); // throws AccessDeniedException		
		int count = boardService.add(article);
		
		LOG.debug("generatedKey :: " + article.getNo());
		
		//첨부파일 정보 넣기 
		if(fileName != null && fileSaveName != null && fileSize != null && fileType != null) {
			
			for(int i=0; i < fileName.length; i++) {
				fileService.add(article.getNo(), fileName[i], fileSaveName[i], fileSize[i], fileType[i]);
			}
			
		}
		
		boolean hasFile = fileService.hasFile(article.getNo());
		article.setHasFile(hasFile);
		
	    boardService.edit(article);
		
	    
		return "redirect:/board/" + boardTypeName + "/1";
	    
	}
	
//	@RequestMapping(value="/write/do", method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> doWrite(String boardTypeName, Article article) {
//	
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("boardTypeName", boardTypeName);
//		
//		try {
//			boardService.getBoardTypeAndCheckAuth(article.getBoardNo()); // throws AccessDeniedException
//			int count = boardService.add(article);
//			
//			jsonResult.put("result", true);
//			
//
//		} catch (Exception e) {
//			jsonResult.put("result", false);
//		}
		

	 	
		
//		//첨부파일 정보 넣기 
//	    for(int i=0; i < files.length; i++) {
//	    	  LOG.debug(files[i]);
//	    	  
//	    	  Map<String, Object> fileInfo = new HashMap<String, Object>();
//	    	  
//	    	  fileInfo.put("no", article.getNo());
//	    	  fileInfo.put("name", files[0].getName());
//	  
//	    	  fileService.add(fileInfo);
//	    }
	    
	    
//		return jsonResult;
//	    
//	}
	
	/* EDIT */
	@RequestMapping("/edit/{articleNo}")
	public String edit(@PathVariable int articleNo, Model model) throws Exception {
		
		Article article = boardService.getArticleAndCheckAuth(articleNo);
		List<BoardType> boardTypeList = boardService.getBoardTypeList();
		List<AttachFile> attachFiles = fileService.getFileList(articleNo);
		
		model.addAttribute("boardTypeList", boardTypeList);
		model.addAttribute("article", article);
		model.addAttribute("attachFiles", attachFiles);
		
		return "board/edit/글 수정/Edit";

	}
	
	@RequestMapping(value="/edit/do" , method=RequestMethod.POST)
	public String doEdit(Article article, 
			@RequestParam(value="file-name[]", required=false) String fileName[],
			@RequestParam(value="file-saveName[]", required=false) String fileSaveName[],
			@RequestParam(value="file-size[]", required=false) long fileSize[],
			@RequestParam(value="file-type[]", required=false) String fileType[], Model model) throws Exception {
		
	    LOG.debug(article);
	    
	    boardService.getBoardTypeAndCheckAuth(article.getBoardNo()); // throws AccessDeniedException
	    boardService.getArticleAndCheckAuth(article.getNo()); // throws AccessDeniedException
	    
		//첨부파일 정보 넣기 
//	    if(attachFileForm != null) {
//	    	
//	    	List<AttachFile> attachFiles = attachFileForm.getAttachFiles();
//	    	
//	    	// 첨부파일 정보 넣기
//	    	for(int i=0; i < attachFiles.size(); i++) {
//	    		LOG.debug(attachFiles.get(i));
//	    		
//	    		String originName = attachFiles.get(i).getOriginName();
//	    		String saveName = attachFiles.get(i).getSaveName();
//	    		long size = Integer.parseInt(attachFiles.get(i).getSize());
//	    		String type = attachFiles.get(i).getType();
//	    		
//	    		fileService.add(article.getNo(), originName, saveName, size, type);
//	    	}
//	    }
	    
        if(fileName != null && fileSaveName != null && fileSize != null && fileType != null) {
			
			for(int i=0; i < fileName.length; i++) {
				fileService.add(article.getNo(), fileName[i], fileSaveName[i], fileSize[i], fileType[i]);
			}
			
		}
	    
	    boolean hasFile = fileService.hasFile(article.getNo());
	    article.setHasFile(hasFile);
	    
	    LOG.debug("hasFile :: " + hasFile);
	    
	    boardService.edit(article);   
	     
		
		return "redirect:/board/detail/" + article.getNo();
	}
	
	@RequestMapping("/remove/{articleNo}")
	public String remove(@PathVariable int articleNo) throws Exception {
		
		Article article = boardService.getArticle(articleNo);	
		BoardType boardType = boardService.getBoardType(article.getBoardNo());
		boardService.remove(article);
		
		
		return "redirect:/board/" + boardType.getName() + "/1";
	}

//	@RequestMapping(value="/photoUpload" , method=RequestMethod.POST)
//	public String photoUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="upload") MultipartFile file, Model model) {
//		
//		try {
//		
//		//파일 기본경로
//        String defaultPath = request.getSession().getServletContext().getRealPath("/");
//        //파일 기본경로 _ 상세경로
//		String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;  
//		//file originName
//		String filename = file.getOriginalFilename();
//		//file extension
//		String filenameExt = filename.substring(filename.lastIndexOf(".") + 1);
//		filenameExt.toLowerCase();
//		
//		String fileType = file.getContentType();
//		
//		LOG.debug(fileType);
//		
//		String saveName = null;
//        
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//        String today = formatter.format(new Date());
//        saveName = today + UUID.randomUUID().toString() + '.' + filenameExt;
//       
//		
//		File sfile = new File(path);
//		
//		//디렉토리 존재하지 않을경우 디렉토리 생성
//        if(!sfile.exists()) {
//            sfile.mkdirs();
//        }
//        
//        InputStream is = file.getInputStream();
//        OutputStream os = new FileOutputStream(path + saveName);
//		
//        // 서버에 파일 쓰기
//        byte b[] = new byte[(int) file.getSize()];
//        int read;
//        
//        while((read = is.read(b, 0, b.length)) != -1) {
//        	os.write(b, 0, read);
//        }
//        
//        if(is != null) {
//        	is.close();
//        }
//        
//        os.flush();
//        os.close();
//        
//        String callback = request.getParameter("CKEditorFuncNum");
//        
//        PrintWriter pw = response.getWriter();
//        String fileUrl = "/resources/photo_upload/" + saveName; //url경로
//
////        pw.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
////                + callback
////                + ",'"
////                + fileUrl
////                + "','이미지를 업로드 하였습니다.'"
////                + ")</script>");
////        pw.flush();
////        
////        if(pw != null) {
////        	pw.close();
////        }
//        
//        model.addAttribute("uploaded", callback);
//        model.addAttribute("url", fileUrl);
//        
//        LOG.debug("uploaded :: " + callback);
//        LOG.debug("url :: " + fileUrl);
//        
//        return "callback.jsp?uploaded=1&fileName=" + saveName + "&url=" + fileUrl;
////		return "callback";
//
//		} catch(Exception e) {
//			
//			e.printStackTrace();
//		}
//		
//		
//		return "";
//		
//		
//	}

	
	
	/* PHOTO UPLOAD */
	//단일파일업로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, Photo photo, Model model){
		String callback = photo.getCallback();
		String callback_func = photo.getCallback_func();
		String file_result = "";
		
		int imageWidth = photo.getImageWidth();
		LOG.debug("imageWidth : " + imageWidth);
		
		try {
			if(photo.getFiledata() != null && photo.getFiledata().getOriginalFilename() != null && !photo.getFiledata().getOriginalFilename().equals("")){
		            //파일이 존재하면
		            String original_name = photo.getFiledata().getOriginalFilename();
		            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
		            //파일 기본경로
		            String defaultPath = request.getSession().getServletContext().getRealPath("/");
		            //파일 기본경로 _ 상세경로
		            String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;              
		            File file = new File(path);
		            System.out.println("path:"+path);
		            //디렉토리 존재하지 않을경우 디렉토리 생성
		            if(!file.exists()) {
		                file.mkdirs();
		            }
		            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
		            String realname = UUID.randomUUID().toString() + "." + ext;
		        
		            ///////////////// 서버에 파일쓰기 ///////////////// 
		            photo.getFiledata().transferTo(new File(path + realname));
//		            file_result += "&bNewLine=true"
//		            		     + "&sFileName=" + original_name
//		            		     + "&sFileURL=/resources/photo_upload/" + realname 
//		            		     + "&oOriginImgWidth=" + imageWidth ;
		            
		            model.addAttribute("bNewLine", "true");
		            model.addAttribute("sFileName", original_name);
		            model.addAttribute("sFileURL", "/resources/photo_upload/" + realname);
		            model.addAttribute("oOriginImgWidth", imageWidth);
		            
		        } else {
//		            file_result += "&errstr=error";
		            
		            model.addAttribute("errstr", "error");
		            
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		   
//		return "redirect:" + callback + "?callback_func="+ callback_func + file_result;
// ?callback_func="+ callback_func + file_result
		
		model.addAttribute("callback_func", callback_func);
//		model.addAttribute("file_result", file_result);
		
		return "callback";
		
	}
	
	@RequestMapping("/photo_uploader")
	public String photoUploader() throws Exception {
		return "photo_uploader";
	}
	
	
//		//다중파일업로드 (Spring Security를 사용함으로써 inputStream이 제대로 안받아짐 )
//		@RequestMapping("/multiplePhotoUpload")
//		public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
//			
//			try {
//		         //파일정보
//		         String sFileInfo = "";
//		         //파일명을 받는다 - 일반 원본파일명
//		         String filename = request.getHeader("file-name");
//		         //파일 확장자
//		         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
//		         //확장자를소문자로 변경
//		         filename_ext = filename_ext.toLowerCase();
//		         //파일 기본경로
//		         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
//		         //파일 기본경로 _ 상세경로
//		         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
//		         File file = new File(filePath);
//		         
//		         
//		         if(!file.exists()) {
//		            file.mkdirs();
//		         }
//		         String realFileNm = "";
//		         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//		         String today= formatter.format(new java.util.Date());
//		         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
//		         String rlFileNm = filePath + realFileNm;
//		         
//		         ///////////////// 서버에 파일쓰기 /////////////////   
//		        
//		         LOG.debug("원본 파일명" + filename);
//		         LOG.debug("파일 확장자" + filename_ext);
//		         
//		         InputStream is = request.getInputStream();
//		         OutputStream os = new FileOutputStream(rlFileNm);
//		         int numRead;
//		         // 파일쓰기
//		         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
//		         
//		         LOG.debug("Byte :: " + b.hashCode());
//		         
//		         LOG.debug("is.available :: " + is.available());
//		         LOG.debug("is.read :: " + is.read(b, 0, b.length));
//		         
//	           /* inputStream 제대로 안받아짐 */
//		         while((numRead = is.read(b,0,b.length)) != -1){
//		        	 LOG.debug("while :: ");
//		        	 LOG.debug("numRead :: " + numRead);
//		             os.write(b,0,numRead);
//		         }
//		         if(is != null) {
//		             is.close();
//		         }
//		         os.flush();
//		         os.close();
//		         ///////////////// 서버에 파일쓰기 /////////////////
//		         
//		         // 정보 출력
//		         sFileInfo += "&bNewLine=true";
//		         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
//		         sFileInfo += "&sFileName="+ filename;;
//		         sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
//		         
//		         LOG.debug("파일 정보" + sFileInfo);
//		         
//		         PrintWriter print = response.getWriter();
//		         print.print(sFileInfo);
//		         print.flush();
//		         print.close();
//		         
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		    }
//			
//			
//		}
		

		
//		@MessageMapping("/getTotalRecommendNum")
//		@SendToUser("/queue/totalRecommendNum")
//		public Object getTotalRecommendNum(int articleNo) throws Exception {
//			Thread.sleep(3000);
//			return boardService.getTotalRecommendNum(articleNo);
//		}
	
	
	

}
