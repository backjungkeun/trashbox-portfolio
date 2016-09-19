(function ($) {
	$(function () {
		
//		function getMetaContent(nameValue) {
//			return $("meta[name=" + nameValue + "]").attr("content");
//		}
//		
//		var boardTypeName = getMetaContent('boardTypeName'),
//		    articleNo = getMetaContent('articleNo'),
//		    articleAuthorNo = getMetaContent('articleAuthorNo'),
//		    token = getMetaContent('_csrf'),
//            header = getMetaContent('_csrf_header'),
//            currentUserNo = checkCurrentUser();
      
		
//     	/* reflash scrollTop */
//     	$("#trashbox").animate({scrollTop: 0}, 100);
    	
    	$(function () {
    		var token = $("meta[name='_csrf']").attr("content");
    		var header = $("meta[name='_csrf_header']").attr("content");
    		
    		$(document).ajaxSend(function(e, xhr, options) {
    			xhr.setRequestHeader(header, token);
    			xhr.setRequestHeader('X-AJAX-CALL', true);
    			
    		});
    		
    	});
    	
    	
    	$('.right-sidebar-button.item').on('click', function() {
    		
    		$('.right-sidebar-button.item .user.icon')
    		  .transition('remove looping');
    	});
	
//     	$('.notification-button').on('click', function() {
//     		notify('info');
    		
//     	$('.right-sidebar-button.item .user.icon')
//   		  .transition('set looping')
//   		  .transition({    
//   			  animation  : 'jiggle',
//   			  duration   : '2s'
//   		  })
//   		;
    		
//     	});
    	
//     	function notify(style) {
//     		$('.right-sidebar-button.item') 		
//     		.notify({
//                 title: 'Notification',
//                 text: 'new message!'
                
//             }, {
//                 style: 'semantic',
//                 className: style,
//                 arrowShow: false,
//                 position:'bottom right'
////                     autoHide: false,
////                     clickToHide: true
              
//             });
//         }
    	
    	

    	
    
        // introduction animation
        $('#trashbox .introduction').addClass('animated zoomIn');

        // sidebar settings
//        $('.ui.sidebar').sidebar({
//            dimPage: true,
//            transition: 'overlay',
//            mobileTransition: 'overlay'
//        });

//        // create sidebar and attach to menu open
//        $('.ui.sidebar.left')
//            .sidebar('attach events', '#left-sidebar-button')
//            .sidebar('attach events', '.right-sidebar-button.item', 'hide');
//
//        $('.ui.sidebar.right')
//            .sidebar('attach events', '.right-sidebar-button.item')
//            .sidebar('attach events', '#left-sidebar-button', 'hide');
//
//
//        $('.ui.sidebar.left')
//            .sidebar('attach events', '#second-left-sidebar-button');
//
//
//        $('.ui.sidebar.right')
//            .sidebar('attach events', '.right-sidebar-button.item');
//
//
//        $('.ui.sidebar.menu a.item')
//            .on('click', function () {
//                $(this)
//                    .addClass('active')
//                    .siblings()
//                    .removeClass('active');
//            });


//        //modal
//        $('.ui.small.logout.modal')
//            .modal({
//                closable: false,
//                onApprove: function () {
//                    $('#logout-form').submit();
//                }
//            })
//
//        .modal('attach events', '#logout-button', 'show');



        //tab
//         $('.ajax-tab.meun .item').tab();


        $('.fixed.inverted.menu')
        .find('.header.item')
        .addClass('red active');
        
        //following bar -visibility
        $('#trashbox')
            .visibility({
                offset: -10,
                observeChanges: false,
                once: false,
                continuous: false,
                onTopPassed: function () {
                    requestAnimationFrame(function () {
                        $('.following.bar')
                            .addClass('dark fixed')
                            .find('.menu .header.item')
                            .addClass('red active');
                        

                    });

                },
                onTopPassedReverse: function () {
                    requestAnimationFrame(function () {
                        $('.following.bar')
                            .removeClass('dark fixed')
                            .find('.menu .header.item')
                            .removeClass('red active');
                    });
                }
            });

        // banner background change
        $('#trashbox .masthead.zoomed')
            .removeClass('zoomed')
            .addClass('bg');

        // move main segment
        $('#trashbox .masthead.bg .button').on('click', function () {
            $('#trashbox').animate({
                scrollTop: ($('.ui.vertical.stripe.main.segment').offset().top)
            }, 750);

        });
        
        // Main에서만 삭제
        if($('#trashbox').offset().top == 0) {
    	   $('.following.bar.fixed.animated.fadeInDown.dark').removeClass('dark');
        }
       

//        // page loading 
//        $('.animsition').animsition({
//            inClass: 'fade-in',
//            outClass: 'fade-out',
//            inDuration: 1500,
//            outDuration: 800,
//            linkElement: '.animsition-link',
//            // e.g. linkElement: 'a:not([target="_blank"]):not([href^=#])'
//            loading: true,
//            loadingParentElement: 'body', //animsition wrapper element
//            loadingClass: 'animsition-loading',
//            loadingInner: '', // e.g '<img src="loading.svg" />'
//            timeout: false,
//            timeoutCountdown: 5000,
//            onLoadEvent: true,
//            browser: ['animation-duration', '-webkit-animation-duration'],
//            // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
//            // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
//            overlay: false,
//            overlayClass: 'animsition-overlay-slide',
//            overlayParentElement: 'body',
//            transition: function (url) {
//                window.location.href = url;
//            }
//        });

         //swal("Good job!", "You clicked the button!", "success");
        
        $('.ui.accordion').accordion();
        
        
        
        setTimeout(function(){ 
	    	
	    	  // notice segment visibility
	          $('.ui.notice.segment')
	          .visibility({
	            once: true,
	            observeChanges: true,
	            onTopVisible: function() {
	              console.log("ajax-tab notice load");
	              
	              $('#notice-tab-button').click();
//		              $('.ajax-tab.menu .item.active').each(function() {
//		            		//console.log($(this)); //
//		            		$(this).click();
	            
//		              });
	            }
	          })
	          ;
	    	  
	          $('.ui.event.segment')
	          .visibility({
	            once: true,
	            observeChanges: true,
	            onTopVisible: function() {
	              console.log("ajax-tab event load");
	              
	              $('#event-tab-button').click();
	            }
	          })
	          ;
	          
	          $('.ui.combo.segment')
	          .visibility({
	            once: true,
	            observeChanges: true,
	            onTopVisible: function() {
	              console.log("ajax-tab popular load");
	              
	              $('#popularArticle-tab-button').click();
	            }
	          })
	          ;
	          
	          $('.ui.Free.segment')
	          .visibility({
	            once: true,
	            observeChanges: true,
	            onTopVisible: function() {
	              console.log("ajax-tab freeboard load");
	              
	              $('#freeboard-tab-button').click();
	            }
	          })
	          ;
	          
	          
	          $('.ui.LectureAndTip.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab lecture and tip load');
	        		
	        		$('#lecture-and-tip-button').click();
	        	}
	        	  
	          });
	          
	          $('.ui.QnA.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab QnA load');
	        		
	        		$('#QnA-tab-button').click();
	        	}
	        	  
	          });	
	          
	          $('.ui.Creative.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab Creative load');
	        		
	        		$('#Creative-tab-button').click();
	        	}
	        	  
	          });	
	          
	          $('.ui.Decorate.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab Decorate load');
	        		
	        		$('#Decorate-tab-button').click();
	        	}
	        	  
	          });
	          
	          $('.ui.Car.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab Car load');
	        		
	        		$('#Car-tab-button').click();
	        	}
	        	  
	          });	
	          
	          $('.ui.ElectricAndElectron.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab electric and electron load');
	        		
	        		$('#ElectricAndElectron-tab-button').click();
	        	}
	        	  
	          });
	          
	          $('.ui.Furnishings.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab Furnishings load');
	        		
	        		$('#Furnishings-tab-button').click();
	        	}
	        	  
	          });
	          
	          $('.ui.Hardware.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab Hardware load');
	        		
	        		$('#Hardware-tab-button').click();
	        	}
	        	  
	          });
	          
	          $('.ui.Woodworking.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab Woodworking load');
	        		
	        		$('#Woodworking-tab-button').click();
	        	}
	        	  
	          });
	          
	          $('.ui.Etc.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab Etc load');
	        		
	        		$('#Etc-tab-button').click();
	        	}
	        	  
	          });
	          
	          $('.ui.BusinessAdvertisement.segment')
	          .visibility({
	        	once: true,
	        	observeChanges: true,
	        	onTopVisible: function() {
	        		console.log('ajax-tab BusinessAdvertisement load');
	        		
	        		$('#BusinessAdvertisement-tab-button').click();
	        	}
	        	  
	          });
	          
//	          var firstWork = true;
//	          var percentage = 0;
//	          
//	          $('.pusher')
//                .visibility({
//                	once       : false,
//                    continuous : true,
//                    onPassing  : function(calculations) {
//                       console.log(calculations.percentagePassed);
//                    }
//                    
//                });
	    
	      }, 1000);
        
       
       
        
        $('.ajax-tab.menu .item')
         .tab({
      
        	 cache: false,	       
        	 apiSettings: {     		 
		         loadingDuration : 300,
		         
		         beforeSend : function(settings) {
                	 settings.dataType = 'JSON';
//                 	 settings.data = {
//                 			 limit : 5
//                 	 }

                    
//                      console.log(settings);

//                 	 console.log(settings.urlData.tab);
                	
                	 if(settings.urlData.tab == 'newComments') {
                		 settings.url = '/trashbox/comment/{$tab}';
                	 } else {
                		 settings.url = '/trashbox/board/{$tab}';  
                	 }
                	 
                	 
                	 return settings;
                 },
                 
                 responseAsync : false,
           
                 onResponse : function(myResponse) {
                	 
                	 console.log(myResponse.content);
                	 
                	 var boardTypeName = myResponse.boardTypeName;
                	 var content = myResponse.content;
                	
//                 	 var response = {
//                 		notice : content,
//                 		event  : content,
//                 		popularArticles : content,
//                 		newArticles : content,
//                 		newComments : content
//                 	 };

                     var response = {};
                     response[boardTypeName] = createList(boardTypeName, content);
                	 
                	 return response[boardTypeName];
                 }
                 
        	
//	        		 mockResponse : function(settings) {
        			 
//	        			 var response = {
//	        					 notice : 'AJAX Tab One',
//	        					 second : 'AJAX Tab Two',
//	        					 third  : 'AJAX Tab Three'
        					 
//	        			 };
        			 
//	        			 console.log(settings);
//	        			 return response[settings.urlData.tab]; 
//	        		 },
         
         
        	 },
        	 context : 'parent',
//	        	 auto    : true,
//	        	 path:  '/trashbox/board/',
        	 
        	 onRequest : function(tabPath) {
        		 console.log('tabPath : ' + tabPath);
        	 }
        	 
         });
        
        function getCommentCount(articleNoList) {
        	var result;
        	$.ajax({
	  			  async : false, // 비동기식으로 or 전역변수로 값을 넘겨야하는경우
	  			  type: "POST",
	  			  url: $.trashbox.baseUrl 
        	           + '/comment/getTotalCountByArticle',
	  			  data: {articleNoList : articleNoList}
	  			  
	  		    }).done(function(data) {
	  			  console.log(data);
	  			   result = data.commentCount;
	  		    });
        	
        	return result;
        }
        
        
        function createList(boardTypeName, articleList) {
			//받아온 정보만큼 list 화면 구성
            
            var articleNoList = [];

            $(articleList).each(function() {
            	articleNoList.push(this.no);
            });
            
            if(articleNoList.length > 0) {
            
            
            var commentCountInfo = getCommentCount(articleNoList);
            
            $(articleList).each(function(i) {
            	var no = $(this).attr('no');
            	if(typeof commentCountInfo[no] !== "undefined") {
            		this.commentCount = commentCountInfo[no];
            	} else {
            		this.commentCount = 0;
            	}
//             	this.commentCount = commentCountList[i];
            });
            

			var list = $('<div class="ui middle aligned divided list"></div>');

			
			$(articleList).each(function() {
				var item = $('<div class="item"></div>'),
				    rightContent = $('<div class="right floated content"></div>'),
				    info = $('<div class="info"></div>'),
				    
				    starNum = $('<span class="num"></span>'),
				    starIcon = $('<i class="star icon"></i>'),
				    commentNum = $('<span class="num"></span>'),
				    commentIcon = $('<i class="comment icon"></i>'),
				    
				    content = $('<div class="content"></div>'),
				    header = $('<div class="header title="x"></div>'),
				    icon = $('<i class="right triangle icon"></i>'),
				    link = $('<a href="#"></a>');
				

				    
				    if(boardTypeName == 'notice' 
				    		|| boardTypeName == 'newComments'
				    		|| boardTypeName == 'newArticles') {
					   info.text($.format.date(this.registrationDate, 'yyyy-MM-dd'));
				    } else {
				       starNum.text(this.recommendCount + '\n');
				       commentNum.text(this.commentCount);
				    }
				   
				    if(boardTypeName == 'newComments') {
				       link.attr('href', '/trashbox/board/detail/' + this.articleNo);
				       link.text(this.content);
				       header.attr('title', this.content);
				   
				    } else {
				       link.attr('href', '/trashbox/board/detail/' + this.no);
				       link.text(this.title);
				       header.attr('title', this.title);
				    }
				   
				   
				 
				    
//					    date.text($.format.prettyDate(this.registrationDate));
//					    text.text(this.content);
		
				
				
//					    avatar = $('<a class="avatar"></a>'),
//					    img = $('<img>'),
//					    content = $('<div class="content"></div>'),
//					    author = $('<a class="author"></a>'),
//					    metadata = $('<div class="metadata"></div>'),
//					    date = $('<span class="date"></span>'),
//					    text = $('<div class="text"></div>');
				
//					    img.attr('src', '/trashbox/resources/semantic-ui/assets/images/avatar/tom.jpg'); // 확인
//					    author.text(this.userNo);
//					    date.text($.format.prettyDate(this.registrationDate));
//					    text.text(this.content);
		
				   // $.format.prettyDate()
				    	
				    // build
				    header.append(icon, link);
				    content.append(header);
				    
				    if(boardTypeName != 'notice' 
				    		&& boardTypeName != 'newComments'
				    		&& boardTypeName != 'newArticles'){
				       starNum.prepend(starIcon);
					   info.append(starNum);
					   
					   commentNum.prepend(commentIcon);
					   info.append(commentNum);
					}
				    rightContent.append(info);
				    
				    item.append(rightContent, content);
				    list.append(item);
				    
//					    list.append(comment);
				    
			});
			
            } else {
             list =	$('<h3 class="ui center aligned icon header">'
            		 + '<i class="orange frown icon"></i>'
                     + '등록된 글이 없습니다.'
                     + '</h3>');
            }
            
            
            
			return list;
		}

		
		
	});

	
	
})(jQuery);








