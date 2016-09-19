(function ($) {
	$.trashbox = {};
	
	var root = location.protocol + '//' + location.host ,
	    notRoot = location.protocol + '//' + location.host + '/' + location.pathname.split("/")[1];
	
	$.trashbox.baseUrl = notRoot;

	$.extend($.fn.api.settings.api, {
//		  'add comment'            : $.trashbox.baseUrl + '/comment/add',
//		  'remove comment'         : $.trashbox.baseUrl + '/comment/remove',
//		  'list comment'           : $.trashbox.baseUrl + '/comment/list',
//		  'update recommend count' : $.trashbox.baseUrl + '/board/ajax/updateRecommendCount',
		  'send message'           : $.trashbox.baseUrl + '/sendMessage',
		  
		 
		  'update nickname'        : $.trashbox.baseUrl + '/updateNickname',
		  'send mail'              : $.trashbox.baseUrl + '/sendAuthMail' ,
		  
		  'file remove'            : $.trashbox.baseUrl + '/file/remove',
		  'get userDefaultInfo'    : $.trashbox.baseUrl + '/getUserDefaultInfo',
		  'user leave'             : $.trashbox.baseUrl + '/leaveUser'
			  
	});

	$(function () {
		
		
		/* Browser Info */
		if($.browser.chrome) {
			console.log('Chrome ' + $.browser.version );
			$('#browser-info > span').text('Chrome ' + $.browser.version);

		} else if($.browser.msie) {
			console.log('IE '+ $.browser.version );
			$('#browser-info > span').text('IE ' + $.browser.version);

		} else if($.browser.msedge) {
			console.log('Edge ' + $.browser.version);
			$('#browser-info > span').text('Edge ' + $.browser.version);
			
		} else if($.browser.mozilla) {
			console.log($.browser.version);
		}
		
		
		/* Page Loading Animation */
		$('.animsition').animsition();

		
		/* Sidebar */
		
		// -setting
		$('.ui.sidebar').sidebar({ 
		    dimPage: true,
		    transition: 'overlay',
		    mobileTransition: 'overlay'
		}); 

		// -create sidebar and attach to menu open
		$('.ui.sidebar.left')
		    .sidebar('attach events', '#left-sidebar-button')
		    .sidebar('attach events', '#right-sidebar-button', 'hide');

		$('.ui.sidebar.right')
		    .sidebar('attach events', '#right-sidebar-button')
		    .sidebar('attach events', '#left-sidebar-button', 'hide');

		$('.ui.sidebar.left')
		    .sidebar('attach events', '#second-left-sidebar-button');

		$('.ui.sidebar.right')
		    .sidebar('attach events', '#second-right-sidebar-button');

		
		
		$('.ui.buttons > a')
		    .on('click', function () {
		        $(this)
		            .addClass('active')
		            .siblings()
		            .removeClass('active');
		    });

		$('.ui.buttons a.item')
		    .on('click', function () {
			    $(this)
			        .addClass('active')
			        .siblings()
			        .removeClass('active');
		    });
		
		$('.ui.sidebar.right.menu a.item')
		    .on('click', function() {
		    	$(this)
		    	   .addClass('active')
		    	   .siblings()
		    	   .removeClass('active');
		    	
		    });

		/* sidebar - end */

		/* Logout Modal */
		$('.ui.small.logout.modal')
		.modal({
		    closable: false,
		    onApprove: function () {
		        $('#logout-form').submit();
		    },
		    onDeny: function () {
		    	if($('#logout-button').hasClass('active')){
		    		$('#logout-button').removeClass('active');
		    	}
		    }
		})
		.modal('attach events', '#logout-button', 'show');
		
    	


		
	});
})(jQuery);