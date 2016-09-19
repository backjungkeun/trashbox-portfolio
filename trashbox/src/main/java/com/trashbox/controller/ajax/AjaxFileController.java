package com.trashbox.controller.ajax;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.trashbox.service.FileService;
import com.trashbox.vo.AttachFile;
import com.trashbox.vo.FileInfo;

@Controller
@RequestMapping("/file")
public class AjaxFileController {
	private static final Logger LOG = LogManager.getLogger(AjaxFileController.class);
	
	@Autowired FileService fileService;
	
	@RequestMapping("/upload")
	@ResponseBody
	public Map<String, Object> fileUpload(HttpServletRequest request, @RequestParam(name="files[]") MultipartFile files) throws Exception {
		
		//파일 기본경로
        String defaultPath = request.getSession().getServletContext().getRealPath("/");
        //파일 기본경로 _ 상세경로
		String path = defaultPath + "resources" + File.separator + "file_upload" + File.separator;  
		//file originName
		String filename = files.getOriginalFilename();
		//file extension
		String filenameExt = filename.substring(filename.lastIndexOf(".") + 1);
		filenameExt.toLowerCase();
		
		String fileType = files.getContentType();
		
		LOG.debug(fileType);
		
		String saveName = null;
        
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today = formatter.format(new Date());
        saveName = today + UUID.randomUUID().toString() + '.' + filenameExt;
       
		
		File file = new File(path);
		
		//디렉토리 존재하지 않을경우 디렉토리 생성
        if(!file.exists()) {
            file.mkdirs();
        }
        
        InputStream is = files.getInputStream();
        OutputStream os = new FileOutputStream(path + saveName);
		
        // 서버에 파일 쓰기
        byte b[] = new byte[(int) files.getSize()];
        int read;
        
        while((read = is.read(b, 0, b.length)) != -1) {
        	os.write(b, 0, read);
        }
        
        if(is != null) {
        	is.close();
        }
        
        os.flush();
        os.close();
       
        List<String> imageFileTypes = new ArrayList<String>();
        imageFileTypes.add("bmp");
        imageFileTypes.add("gif");
        imageFileTypes.add("jpg");
        imageFileTypes.add("jpeg");
        imageFileTypes.add("png");
        
        boolean checkExt = imageFileTypes.contains(filenameExt);
        
        //  FileInfo and jsonResult
		FileInfo fileInfo = new FileInfo();
		
		fileInfo.setDeleteType("DELETE");
		fileInfo.setDeleteUrl("/trashbox/file/remove");
		fileInfo.setName(filename);
		fileInfo.setSaveName(saveName);
		fileInfo.setSize(files.getSize());
		
		if(checkExt) {
			fileInfo.setThumbnailUrl("/trashbox/resources/file_upload/" + saveName);
		}
	
		fileInfo.setType(files.getContentType());
		fileInfo.setUrl("/trashbox/resources/file_upload/" + saveName);
		
		List<FileInfo> fileList = new ArrayList<FileInfo>();
		fileList.add(fileInfo);
		
		Gson gson = new Gson();
		gson.toJson(fileList);
		 
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("files", fileList);
		
		
		return jsonResult;
	}
	
	
	// board write remove 
	@RequestMapping(value="/remove" , method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> fileRemove(HttpServletRequest request, @RequestParam String saveName) throws Exception {
		
		//파일 기본경로
        String defaultPath = request.getSession().getServletContext().getRealPath("/");
        //파일 기본경로 _ 상세경로
		String path = defaultPath + "resources" + File.separator + "file_upload" + File.separator;  
		
		boolean fileDeleteResult = false;
		
		File file = new File(path + saveName);
		    
		    if(file.exists() == true) {
		       fileDeleteResult = file.delete();
		    }
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("fileRemoveResult", fileDeleteResult);
		    
		return jsonResult;
	}
	
	// board editor remove
	@RequestMapping(value="/remove" , method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE, headers="X-REMOVE-CALL=true")
	@ResponseBody
	public Map<String, Object> savedFileRemove(HttpServletRequest request, AttachFile attachFile) throws Exception {
		
		LOG.debug(attachFile);
		
		//파일 기본경로
        String defaultPath = request.getSession().getServletContext().getRealPath("/");
        //파일 기본경로 _ 상세경로
		String path = defaultPath + "resources" + File.separator + "file_upload" + File.separator;  
		
		boolean fileDeleteResult = true;
		
		File file = new File(path + attachFile.getSaveName());
		    
		    if(file.exists() == true) {
		       fileDeleteResult = file.delete();
		    }
		
		if (fileDeleteResult) {
			fileService.remove(attachFile);	
		}
		    
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("fileRemoveResult", fileDeleteResult);
		jsonResult.put("deleteFileInfo", attachFile);
		    
		return jsonResult;
	}	

}
