(function ($) {
	$(function () {
		
		var socket,
	        client;
	    
	    function connect() {
	    	var wsUrl = $.trashbox.baseUrl + '/portfolio';
	    	
	    	socket = new SockJS(wsUrl);
	       
	    	client = Stomp.over(socket);
	    	
	    	client.connect({}, function(frame) {
	    	    console.log('connected stomp over sockjs');
	    	    
	    	    var user = frame.headers['user-name'];
	    	    
//	     	    client.subscribe('/topic/article/' + articleNo , function(message) {
//	     	    	var result = JSON.parse(message.body);
	    	    	
//	     	    	switch (result.eventType) { 
//	     	    	    case 'recommend': 
	// //     	    	    	alert("update recommend");
	    	    	    	
//	     	    	    	$('#recommend-button .basic.label').text(result.message);
//	     	    	    	$('.info .vote > b').text(result.message);
//	     	    	    	break;
	    	    	    	
//	     	    	    default : alert(result.eventType);
//	     	    	}
	// //     	    	alert(message.body);

//	     	    });

	            /* Global Notification */
//	             client.subscribe('/topic/globalNotification', function(message) {
//	             	alert(message.body);
//	             });
	    	   
	    	    // Topic Article (recommend count)
	    	    if((location.pathname.split("/")[3]) == 'detail') {
	    	          var articleNo =  $("meta[name=articleNo]").attr("content");
	    	    	
	    	    	  client.subscribe('/topic/article/' + articleNo , function(message) {
	   	     	      var result = JSON.parse(message.body);
	   	    	    	
	   	     	    	switch (result.eventType) { 
	   	     	    	    case 'recommend': 
	   	// //     	    	    	alert("update recommend");
	   	    	    	    	
	   	     	    	    	$('#recommend-button .basic.label').text(result.message);
	   	     	    	    	$('.info .vote > b').text(result.message);
	   	     	    	    	break;
	   	    	    	    	
	   	     	    	    default : alert(result.eventType);
	   	     	    	}
	   	// //     	    	alert(message.body);

	   	     	    });
	    	    }
	    	
	    	    
	    	    if(user != null || user != undefined) {
	    	    	client.subscribe('/user/queue/privateMessage', function(message) {
//	    	    		alert(message.body);
	    	    		var result = JSON.parse(message.body);
	    	    		
	    	    		console.log(result.sender);
	    	    		console.log(result.content);
	    	    		
	    	    		  $.notify({
	    	    	            title: 'Notification',
	    	    	            text: result.content 
	    	    	            
	    	    	        }, {
	    	    	            style: 'semantic',
	    	    	            className: 'info',
	    	    	            arrowShow: false,
	    	    	            position:'bottom right',
	    	    	            autoHide: false
//	    	    	             clickToHide: true
	    	    	          
	    	    	      });
	    	    		  
	 
	    	    		  if($('.sidebar.right.menu .teal.item').children().length > 0) {
	    	    			  // 메시지 라벨 있음
	    	    			  console.log('message label');
	    	    			  
	    	    			 var messageCount =  parseInt($('#message-label').text());
	    	    			 
	    	    			 $('#message-label').text(messageCount + 1);
	    	    			  
	    	    		  } else {
	    	    			  // 메시지 라벨 없음
	    	    			  console.log('message label x');
	    	    			  
	    	    			  var messageLabel = $('<div id="message-label" class="ui blue label">1</div>');
	    	    			  
	    	    			  $('.sidebar.right.menu .teal.item').append(messageLabel);
	    	    			  
	    	    			  
	    	    		  }
	    	 
	    	    		  
//	    	    		  $('.user.icon')
//	    	      		  .transition('set looping')
//	    	      		  .transition({    
//	    	      			  animation  : 'jiggle',
//	    	      			  duration   : '2s'
//	    	      		  })
//	    	      		;
	    	    		
	    	    	});
	    	    }
	 
	    	    
	    	});
	    }
	    
	    connect();
	    
	    
	  
	
	});

})(jQuery);








