<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html lang="ko">
<head>
<!-- Standard Meta -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	
	<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
	<meta name="boardTypeName" content="${boardType.name}"/>
	<meta name="articleNo" content="${article.no}"/>
	<meta name="articleAuthorNo" content="${article.userNo}"/>
    
    <!-- Site Properties -->
    <title>PhotoUploader - TrashBox</title>  
    
    <link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
	<link rel="icon" href="<c:url value="/resources/favicon.ico"/>" type="image/x-icon">
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.min.js"/>"></script>
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.serialize-object.min.js"/>"></script> --%>
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/jquery.browser.min.js"/>"></script> --%>
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/jquery-dateFormat.min.js"/>"></script> --%>
    
    
<%--     <script type="text/javascript" src="<c:url value="/resources/vendors/migrate.js"/>"></script> --%>
      
    <!-- Semantic-UI Components -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/semantic-ui/semantic.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/semantic-ui/semantic.min.js"/>"></script>

	<!-- Animsition -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/animsition/animsition.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/animsition/animsition.min.js"/>"></script>

    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/sweetalert/sweetalert.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/vendors/sweetalert/sweetalert.min.js"/>"></script>
       
       
    <!-- User Custom -->
<%--     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheets/trashbox.css"/>"> --%>
    
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/SE2.8.2.O12056/sample/css/custom/trashbox-photo_upload.css"/>">

<title>사진 첨부하기 :: SmartEditor2</title>
<style type="text/css">
/* NHN Web Standard 1Team JJS 120106 */ 
/* Common */
body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0}
body,input,textarea,select,button,table{font-family:'ëì',Dotum,Helvetica,sans-serif;font-size:12px}
img,fieldset{border:0}
ul,ol{list-style:none}
em,address{font-style:normal}
a{text-decoration:none}
a:hover,a:active,a:focus{text-decoration:underline}

/* Contents */
.blind{visibility:hidden;position:absolute;line-height:0}
/* #pop_wrap{width:383px}  */
/* #pop_header{height:26px;padding:14px 0 0 20px;border-bottom:1px solid #ededeb;background:#f4f4f3} */
.pop_container{padding:11px 20px 0}
#pop_footer{margin:21px 20px 0;padding:10px 0 16px;border-top:1px solid #e5e5e5;text-align:center}
h1{color:#333;font-size:14px;letter-spacing:-1px}
.btn_area{word-spacing:2px}
.pop_container .drag_area{overflow:hidden;overflow-y:auto;position:relative;width:341px;height:129px;margin-top:4px;border:1px solid #eceff2}
.pop_container .drag_area .bg{display:block;position:absolute;top:0;left:0;width:341px;height:129px;background:#fdfdfd url(./img/bg_drag_image.png) 0 0 no-repeat}
.pop_container .nobg{background:none}
.pop_container .bar{color:#e0e0e0}
.pop_container .lst_type li{overflow:hidden;position:relative;padding:7px 0 6px 8px;border-bottom:1px solid #f4f4f4;vertical-align:top}
.pop_container :root .lst_type li{padding:6px 0 5px 8px}
.pop_container .lst_type li span{float:left;color:#222}
.pop_container .lst_type li em{float:right;margin-top:1px;padding-right:22px;color:#a1a1a1;font-size:11px}
.pop_container .lst_type li a{position:absolute;top:6px;right:5px}
.pop_container .dsc{margin-top:6px;color:#666;line-height:18px}
.pop_container .dsc_v1{margin-top:12px}
.pop_container .dsc em{color:#13b72a}
/* .pop_container2{padding:46px 60px 20px} */
.pop_container2 .dsc{margin-top:6px;color:#666;line-height:18px}
.pop_container2 .dsc strong{color:#13b72a}
/* .upload{margin:0 4px 0 0;_margin:0;padding:6px 0 4px 6px;border:solid 1px #d5d5d5;color:#a1a1a1;font-size:12px;border-right-color:#efefef;border-bottom-color:#efefef;length:300px;} */
/* :root  .upload{padding:6px 0 2px 6px;} */
</style>


<script type="text/javascript" charset="UTF-8">
$(document).ready(function() {
	
	(function($){
		
	 	/**
	 	 * 참조 - attach_photo.js
	 	 * 화면 목록에 적당하게 이름을 잘라서 표시.
	 	 * @param {Object} sName 파일명
	 	 * @param {Object} nMaxLng 최대 길이
	 	 */
	 	function cuttingNameByLength (sName, nMaxLng) {
	 		var sTemp, nIndex;
	 		
	 		if(sName.length > nMaxLng){
	 			nIndex = sName.indexOf(".");
	 			
	 			sTemp = sName.substring(0, 12) + " ... " + sName.substring((nIndex - 8), sName.length) ;
	 		} else {
	 			sTemp = sName;
	 		}
	 		return sTemp;
	 	}
		
	 	/**
	 	 * 이미지 첨부 하였을 때  미리보기 만들어 줌.
		 * @param {Object} file 파일
		 */ 
	 	 
		//var url = window.URL || window.webkitURL; // alternate use

		function readImage(file) {
		  
		    var reader = new FileReader();
		    var image  = new Image();
		  
		    reader.readAsDataURL(file);  
		    reader.onload = function(_file) {
		        image.src    = _file.target.result;              // url.createObjectURL(file);
		        image.onload = function() {
		            var w = this.width,
		                h = this.height,
		                t = file.type,                           // ext only: // file.type.split('/')[1],
		                n = cuttingNameByLength(file.name, 30),
		                s = ~~(file.size/1024) +'KB';
		            
		            $('#imageWidth').val(this.width);
		            
		            $('#uploadPreview')
		            .empty()
		            .append('<img src="'+ this.src +'" style="max-width:' + w + 'px;"><p class="dsc">' + n + '<br>' + w +' x ' + h + '<br>' + s + '<br>' + t + '<br></p><br>'); //'+n+' 
		        };
		        
		        //'<p class="dsc" id="info">' + w +' x ' + h + '<br>' + s + '<br>' + t + '<br></p>'
		        
		        image.onerror= function() {
		            alert('Invalid file type: '+ file.type);
		        };      
		    };
		    
		}

		/* 이미지 파일 첨부 시 실행  */
		$('#uploadInputBox').on('change', function() {
			if(this.disabled) return alert('File upload not supported!');
			var F = this.files;
			if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i] );
		});
		
		/* Custom 버튼 클릭시  uploadInputBox 클릭    */
		$('.ui.attach.file.primary.button').on('click', function() {
			$('#uploadInputBox').click();
		});	
		
	})(jQuery);
});
</script>
</head>
<body id="trashbox">

<div id="pop_wrap" class="ui alternate stripe vertical segment">

   <div class="ui center aligned grid container">
     <div class="column" style="max-width:450px;">

	<!-- header -->
    <h2 class="ui header">
       <i class="file icon"></i>
                 사진 첨부하기
    </h2>
    <!-- //header -->
    <!-- container -->
	
    <!-- [D] HTML5인 경우 pop_container 클래스와 하위 HTML 적용
	    	 그밖의 경우 pop_container2 클래스와 하위 HTML 적용      -->
	<div id="pop_container2" class="pop_container2 ">
    	<!-- content -->
<!--     	action="FileUploader.php" -->
         
		<form id="editor_upimage" name="editor_upimage"  method="post" enctype="multipart/form-data" onSubmit="return false;">
        <div id="pop_content2" class="ui segment">
			<div id="uploadPreview">
<!-- 	          <input type="text" placeholder="Search mini..."> -->
			</div>
			<div class="ui small attach file primary button">
                            파일첨부
            </div>
			<input type="file" class="upload" id="uploadInputBox" name="Filedata" style="display: none;"/>
			<input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="imageWidth" name="imageWidth"/>
            <p class="dsc" id="info"><strong>10MB</strong>이하의 이미지 파일만<br>등록할 수 있습니다.<br>(JPG, GIF, PNG, BMP)</p>
        </div>
        
		</form>
		
    <!-- //content -->
    
    </div>
    
    <!-- HTML5 멀티 드롭 업로드 사용 X -->
    <div id="pop_container" class="pop_container" style="display:none;">
    	<!-- content -->
        <div id="pop_content">
	        <p class="dsc"><em id="imageCountTxt">0장</em>/10장 <span class="bar">|</span> <em id="totalSizeTxt">0MB</em>/50MB</p>
       	<!-- [D] 첨부 이미지 여부에 따른 Class 변화 
            	 첨부 이미지가 있는 경우 : em에 "bg" 클래스 적용 //첨부 이미지가 없는 경우 : em에 "nobg" 클래스 적용   -->
				  
            <div class="drag_area" id="drag_area">
				<ul class="lst_type" >
				</ul>
            	<em class="blind">마우스로 드래그해서 이미지를 추가해주세요.</em><span id="guide_text" class="bg"></span>
            </div>
			<div style="display:none;" id="divImageList"></div>
           <p class="dsc dsc_v1"><em>한 장당 10MB, 1회에 50MB까지, 10개</em>의 이미지 파일을<br>등록할 수 있습니다. (JPG, GIF, PNG, BMP)</p>
        </div>
        <!-- //content -->
    </div>

    <!-- //container -->
    <!-- footer -->
    <div id="pop_footer">
	    <div class="btn_area">
            <a href="#"><img src='<c:url value="/resources/vendors/SE2.8.2.O12056/sample/photo_uploader/img/btn_confirm.png"/>'  width="49" height="28" alt="확인" id="btn_confirm"></a>
            <a href="#"><img src='<c:url value="/resources/vendors/SE2.8.2.O12056/sample/photo_uploader/img/btn_cancel.png"/>'  width="48" height="28" alt="취소" id="btn_cancel"></a>
        </div>
    </div>
    <!-- //footer -->
    
    </div>
    </div>
    
</div>


<script type="text/javascript" src="<c:url value="/resources/vendors/SE2.8.2.O12056/sample/photo_uploader/jindo.min.js"/>" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/resources/vendors/SE2.8.2.O12056/sample/photo_uploader/jindo.fileuploader.js"/>" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/resources/vendors/SE2.8.2.O12056/sample/photo_uploader/attach_photo.js"/>" charset="utf-8"></script>


</body>
</html>