(function ($) {
	$(function () {
		
		function getMetaContent(nameValue) {
			return $("meta[name=" + nameValue + "]").attr("content");
		}
		
		var token = getMetaContent('_csrf'),
            header = getMetaContent('_csrf_header'),
		    boardNo = getMetaContent('boardNo'),
		    title = getMetaContent('title');


		/* form (naver-smart-editor)*/
		$('#frm').form({
	    	  
	    	  inline: true,
	    	  on: blur,
	    	  
	    	 
	    	  fields: {
	            
	    		category: {
	    			identifier : 'boardNo',
	    			rules: [
	    			    { 
	    			      type : 'empty', 
	    			      prompt : 'empty boardNo'
	    			    }
	    			  ]
	    		},
	    		  
	            title: {
	                identifier  : 'title',
	                rules: [
	                  {
	                    type   : 'empty',
	                    prompt : 'empty title.'
	                  } 
	                ]
	              },
	            content: {
	                identifier  : 'content',
	                rules: [  
	                  {
	                    type   : 'empty',
	                    prompt : 'empty content'
	                  }
	                ]
	              }
	              
	          }
	      });
		
		/* dropdown (category)*/
	  	$('.category.dropdown')
	    .dropdown({
	      onChange: function(value, text , $selectedItem) {
	    	 
	    	  var boardTypeName = $selectedItem.attr('data-type');
	    	  
	    	  $('#frm').form('set value', 'boardTypeName', boardTypeName);
	    	
	    	  console.log(value);
	    	  console.log($selectedItem);
//	     	  if(value != '') {
//	         	  $('#post_option_button').attr('data-action', value);
//	           } 
	      }
	    })
	    .dropdown('set selected', ''+boardNo);
	  	
	  	
	  	/*set value article default info  */
	  	$('#frm').form('set value', 'title', ''+ title);
	  	$('#frm').form('set value', 'boardNo', ''+ boardNo);
//	      
//	  	
//	  	$('#frm').form('set value', {
//	  		'title' : ''+ title,
//	  		'boardNo' : ''+ boardNo
//	  	});
	  	
	  	
	  	/* smart editor 관련 */
	  	
	     // 전역 변수
		 var oEditors = [];

		 // 스마트에디터 프레임 생성
		 nhn.husky.EZCreator.createInIFrame({
			 
			 oAppRef: oEditors,
			 
			 elPlaceHolder: "smarteditor", //textarea에서 지정한 id와 일치해야 합니다.
			 
			 sSkinURI: $.trashbox.baseUrl
			        + "/resources/vendors/SE2.8.2.O12056/SmartEditor2Skin.html",

			 fCreator: "createSEditor2",
			 
			 htParams : {
				 // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				 bUseToolbar : true,
				 // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				 bUseVerticalResizer : true,
				 // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				 bUseModeChanger : true 
			 }
		 
		 });
	  	
		 //전송버튼
		 $("#savebutton").click(function(){
			 //id가 smarteditor인 textarea에 에디터에서 대입
			 oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
			 
			 
			 for(var i=0; i<$.uploadSuccessFiles.length; i++) {
//				 var name = $('<input type="hidden" name="attachFiles['+ i +'].originName" value="' + $.uploadSuccessFiles[i].name + '" />'),
//				     saveName = $('<input type="hidden" name="attachFiles['+ i +'].saveName" value="' + $.uploadSuccessFiles[i].saveName + '" />'),
//				     size = $('<input type="hidden" name="attachFiles['+ i +'].size" value="' + $.uploadSuccessFiles[i].size + '" />'),
//				     type = $('<input type="hidden" name="attachFiles['+ i +'].type" value="' + $.uploadSuccessFiles[i].type + '" />');
//				 
				 var name = $('<input type="hidden" name="file-name[]" value="' + $.uploadSuccessFiles[i].name + '" />'),
			         saveName = $('<input type="hidden" name="file-saveName[]" value="' + $.uploadSuccessFiles[i].saveName + '" />'),
			         size = $('<input type="hidden" name="file-size[]" value="' + $.uploadSuccessFiles[i].size + '" />'),
			         type = $('<input type="hidden" name="file-type[]" value="' + $.uploadSuccessFiles[i].type + '" />');
			 
				 
				 $('#frm').append(name, saveName, size, type);
			 }
			 
			 
			 //폼 submit
			 $("#frm").submit();

		 });
		 
		 
		 /* 파일첨부 관련 */
		 
		 $('#file-table .delete.button').each(function() {
	        	
		        $(this).api({
		        	action : 'file remove',
		        	method : 'POST',
		        	data: {},
		        	
		        	beforeSend: function (settings) {
		        		console.log(settings);
		        		
//		         		console.log($(this).addClass('disabled'));       		

//		         		var no;
//		         		var originName;
//		         		var saveName;
//		         		var size;
//		         		var type;
		        		
		        		var no = $(this).attr('data-no'),
		        		    originName = $(this).attr('data-name'),
		        		    saveName = $(this).attr('data-saveName'),
		        		    type = $(this).attr('data-type');
		        		
		        		settings.data.no = no;
		        		settings.data.originName = originName;
		        		settings.data.saveName = saveName;
		        		settings.data.type = type;
		        		
		        		console.log(settings);
		        		return settings;
		        	},
		        	
		        	beforeXHR: function(xhr) {
		        		xhr.setRequestHeader (header, token);
		        		xhr.setRequestHeader ('X-REMOVE-CALL', true);
		        	},
		        	
		        	onSuccess: function (response, element) {
		        		console.log(response);
		        		
		        		console.log(response.fileRemoveResult);
		        		
		        		console.log(response.deleteFileInfo);
		        		
		        		var  result = response.fileRemoveResult,
		        		     fileInfo = response.deleteFileInfo;
		        		
		        		if(result) {
		        			swal({
		 					   title: "삭제 완료",
		 					   text: fileInfo.originName,
		 					   type: "success",
		 					   confirmButtonText: "확인",
		 					   confirmButtonColor: "#21BA45"
		 					   
		 				   });
		        			
		                  console.log(element.closest('table').find('tr').length);
		                  
		                  
		                  
		        		  if(element.closest('table').find('tr').length == 1) {
		        			  element.closest('.row').remove();
		        			  
		        		  } else {
		        			  element.closest('tr').remove();
		        		  }
		        			
		                  $('.attachfiles.segment .header .content > span').text($('.attachfiles.segment').find('tr').length);
		        		   
		        		}
		        		
		        		
		        		
		        	},
		        	
		        	onFailure: function (response, element) {
		        		console.log(response);
		        	}
		        	
		        });
		        
		 });
		 
		 
		 // grobal progress hide
	     $('#grobal-progress')
	       .transition('hide')
	     ;
	
	});

	
	
})(jQuery);








