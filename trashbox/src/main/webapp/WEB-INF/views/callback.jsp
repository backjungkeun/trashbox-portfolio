<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<body>
 <h1>${callback_func}</h1>

 <script type="text/javascript">
    	// alert("callback");
		// document.domain 설정
		
	
		
// 		try { document.domain = "http://*.naver.com"; } catch(e) {}
		
//         // execute callback script
//         var sUrl = document.location.search.substr(1);
// 		if (sUrl != "blank") {
// 	        var oParameter = {}; // query array

// 	        sUrl.replace(/([^=]+)=([^&]*)(&|$)/g, function(){
// 	            oParameter[arguments[1]] = arguments[2];
// 	            return "";
// 	        });
	        
// 	        if ((oParameter.errstr || '').length) { // on error
// 	            (parent.jindo.FileUploader._oCallback[oParameter.callback_func+'_error'])(oParameter);
// 	        } else {
// 		        (parent.jindo.FileUploader._oCallback[oParameter.callback_func+'_success'])(oParameter);
// 		   }
// 		}

       var oParameter = {
    		   bNewLine        : '${bNewLine}' ,
	           sFileName       : '${sFileName}' ,
	           sFileURL        : '${sFileURL}' ,
	           oOriginImgWidth : '${oOriginImgWidth}'
       };

       if(('${errstr}' || '').length) { // on error
    	  console.log('error');
    	  (parent.jindo.FileUploader._oCallback['${callback_func}'+'_error'])(oParameter); 
       } else {
    	  console.log('success');
    	  (parent.jindo.FileUploader._oCallback['${callback_func}'+'_success'])(oParameter);
       }

    </script>
    
    </html>
