<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


	<meta name="boardNo" content="${article.boardNo}"/>
	<meta name="title" content="${article.title}"/>

    <!-- SmartEditor -->   
    <script type="text/javascript" src="<c:url value="/resources/vendors/SE2.8.2.O12056/js/HuskyEZCreator.js"/>" charset="UTF-8"></script>
    
    
    <!-- FileUpload -->
    <!-- @Bootstrap -->
<%--     <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/bootstrap.min.css"/>"> --%>
    <!-- @Generic page styles -->
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/style.css"/>">
<!--     @blueimp Gallery styles -->
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/blueimp-gallery.min.css"/>">
<!--     @CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload.css"/>">
    <link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload-ui.css"/>">
<!--     @CSS adjustments for browsers with JavaScript disabled -->
    <noscript><link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload-noscript.css"/>"></noscript>
    <noscript><link rel="stylesheet" type="text/css"  href="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/css/jquery.fileupload-ui-noscript.css"/>"></noscript>
       
   

  <sec:authentication var="user" property="principal" />

  
        
        <!-- Article Edit -->
        <div class="ui vertical stripe article details segment">
          <div class="ui three column relaxed stackable grid container">
            <div class="row">
              <div class="sixteen wide column">

<!--               <h2 class="ui header"> -->
<!--                 <i class="list icon"></i> -->
<%--                                     ${boardType.koName} --%>
<!--               </h2>  -->
              <div class="ui segment">
             <h4 class="my header">
              ${article.title}
             </h4>
             <p class="info">
               <a class="author" data-title="Elliot Fu" data-content="Elliot has been a member since July 2012">${article.userNickname}</a> 
               <span class="sum">
                 <span class="read">조회 <b>${article.hitCount}</b></span>
                 <span class="vote">추천 <b>${article.recommendCount}</b></span>
                 <span class="date">날짜 <b><fmt:formatDate value="${article.registrationDate}" pattern="yyyy.MM.dd"/></b></span> 
               </span>
             </p>
             
             <br>
             <br>
             
             
             <div class="article body">
             <%-- enctype="multipart/form-data" / ${_csrf.parameterName}=${_csrf.token} --%>
            <c:url value="/board/edit/do" var="ArticleEditUrl"/>
            <form class="ui form" id="frm" method="POST" action="${ArticleEditUrl}" style="outline: none;">
              
              <input type="hidden" name="no" value="${article.no}" />
              <input type="hidden" name="userNo" value="${article.userNo}" />
           
           
              <div class="fields">

              <div class="four wide field">
              <label>카테고리</label>
                <div class="ui fluid category selection dropdown">
                  <input type="hidden" name="boardNo">
                  <i class="dropdown icon"></i>
                  <div class="default text">Select Category</div>
                    <div class="menu">
                     <c:forEach items="${boardTypeList}" var="boardType">
                       <div class="item" data-value="${boardType.no}" data-type="${boardType.name}">${boardType.koName}</div>
                     </c:forEach>
                    
                      
                    </div>
                </div>
              </div>
              
              <div class="twelve wide field">
               <label>제목</label>
                    <input type="text" name="title" placeholder="title">
              </div>
            
              </div>
           
           
<!--               <div class="field"> -->
<!--                 <label>제목</label> -->
<!--                 <div class="ui fluid small input"> -->
<%--                  <input type="text" name="title" placeholder="${article.title}" >               --%>
<!--                 </div> -->
<!--               </div> -->
              
              <div class="field">
                <label>내용</label>
                <textarea rows="2" name="content" id="smarteditor" rows="10" cols="100" style="width:100%; min-width: 270px!important; height:412px;">
                ${article.content}
                </textarea>
              
              </div>
              
              <br>
             <sec:csrfInput/>
<!--              <input type="button" id="savebutton" value="서버전송" /> -->
            </form>
            
            
            
 
 
 </div>
 
  <div class="article footer">

<!--     <a class="ui large basic blue label"><i class="thumbs outline up icon"></i>3</a> -->
<!--     <a class="ui large basic red label"><i class="thumbs outline down icon"></i>-3</a> -->
    
    
    
<!--     <div class="ui large labels"> -->
<!--       <a class="ui blue basic label"> -->
<!--         <i class="thumbs outline up icon"></i> -->
<!--          3 -->
<!--       </a> -->
<!--       <a class="ui red basic label"> -->
<!--         <i class="thumbs outline down icon"></i> -->
<!--          -3 -->
<!--       </a> -->
<!--     </div> -->

 

    

    





<button id="savebutton" class="ui teal right floated right labeled icon button">
  <i class="write icon"></i>
  Save
</button>

  
<!-- <div class="ui teal right floated right labeled icon top right pointing dropdown button"> -->
<!--    <i class="setting icon"></i> -->
<!--   <span class="text">Save</span> -->
<!--   <div class="menu"> -->
    
<!--     <div class="item"><i class="edit icon"></i> Edit Post</div> -->
<!--     <div class="item"><i class="delete icon"></i> Remove Post</div> -->
<!--     <div class="item"><i class="hide icon"></i> Hide Post</div> -->
    
<!--   </div> -->
<!-- </div> -->


    <br>
    <br>
    
  
  </div>
 
               
               
              </div>
              
              </div>             
              

	

                  
                   
                                
         
              </div>  
              
              <c:if test="${fn:length(attachFiles) > 0}">
      
      <!-- 첨부파일  -->
      <div class="row">
        <div class="sixteen wide column">
          <div class="ui attachfiles segment">
            <h4 class="ui dividing aligned left header">
              <i class="file icon"></i>
              <div class="content">
              파일첨부 [<span>${fn:length(attachFiles)}</span>]
              </div>
            </h4>
          
            <table id="file-table" class="ui compact striped definition table">
              <tbody class="files">
                
                <c:forEach varStatus="status" items="${attachFiles}" var="file">
                <tr>
                  <td class="no collapsing center aligned">
                    <i class="caret right icon"></i>
                  </td>
                  <td class="preview center aligned">
                    <c:set var="fileType" value="${fn:split(file.type, '/')[0]}" /> 
                    
                    <c:choose >
                      <c:when test="${fileType eq 'image'}">
                          <a href="/trashbox/resources/file_upload/${file.saveName}" title="${file.originName}" download="${file.originName}" data-gallery=""><img src="/trashbox/resources/file_upload/${file.saveName}" style="max-width:80px;max-height:80px;"></a>
                      </c:when>
                      <c:when test="${fileType eq 'video'}">
                          비디오
                      </c:when>
                      <c:when test="${fileType eq 'text'}">
                          텍스트      
                      </c:when>
                      <c:otherwise>
                        <i class="large file icon"></i>
                      </c:otherwise>
                    </c:choose>
                 
                  </td>
                  <td class="name">
                  
                     <c:choose >
                      <c:when test="${fileType eq 'image'}">
                          <a href="/trashbox/resources/file_upload/${file.saveName}" title="${file.originName}" download="${file.originName}" data-gallery="">${file.originName}</a>
                      </c:when>
                      <c:when test="${fileType eq 'video'}">
                          비디오
                      </c:when>
                      <c:when test="${fileType eq 'text'}">
                          텍스트      
                      </c:when>
                      <c:otherwise>
                          <a href="/trashbox/resources/file_upload/${file.saveName}" title="${file.originName}" download>${file.originName}</a>
                      </c:otherwise>
                    </c:choose>
                    
                    
                  </td>
                  <td class="size">
                    ${file.size}
                  </td>
                  <td class="remove">
                    <button class="ui red icon delete button" data-name="${file.originName}" data-saveName="${file.saveName}" data-type="${fileType}" data-no="${file.no}">
                      <i class="trash icon"></i>
                    </button>
                  </td>
                </tr>
                </c:forEach>
                
              </tbody>
            </table>
          
          </div>
        </div>
      </div>
              
      </c:if>  
              
              <div class="row">
              <div class="sixteen wide column">
              
                <div class="ui attach file segment" style="text-align:left;">
  
 <!-- The file upload form used as target for the file upload widget -->
    <form id="fileupload" class="ui form" action="/" method="POST" enctype="multipart/form-data">
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
<!--        <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>-->
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
<!--         <div class="field"> -->
<!--                <h3 class="ui header">첨부파일</h3> -->
                
<!--         </div> -->
        
        <div class="fileupload-buttonbar">
           
           <!-- The fileinput-button span is used to style the file input field as button -->
           <table class="ui striped unstackable table">
             <thead>
               <tr class="center aligned">
                 <th class="check">
                   <div id="master-checkbox" class="ui master checkbox">
                     <input type="checkbox" name="removeAll" class="toggle">
                     <label></label>   
                   </div>
                 </th>
                 <th>
                   <button class="ui green icon button fileinput-button">
                    <i class="add circle icon"></i>
                    <input type="file" name="files[]" multiple>
                   </button>
                 </th>
                 <th>
                   <button type="submit" class="ui blue icon button start">
                    <i class="upload icon"></i>
                   </button>
                 </th>
                 <th>
                   <button type="reset" class="ui yellow icon button cancel">
                    <i class="remove icon"></i>
                   </button>
                 </th>
                 <th>
                   <button type="button" class="ui red icon button delete">
                    <i class="trash icon"></i>
                   </button>
                 </th>
               </tr>
             </thead>
           </table>

           
           </div> 
            
               
            <!-- The global file processing state -->
            <span class="fileupload-process"></span>

            <!-- The global progress state -->
            <div id="grobal-progress" class="fileupload-progress fade" >
                <!-- The global progress bar -->
<!--                 <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100"> -->
<!--                     <div class="progress-bar progress-bar-success" style="width:0%;"></div> -->
<!--                 </div> -->
                
                <div class="ui indicating progress" role="progressbar" data-value="1" data-total="20">
                  <div class="bar">
                    <div class="progress"></div>
                  </div>
                </div>
                
                <!-- The extended global progress state -->
                <h4 class="ui orange header progress-extended">&nbsp;</h4>
            </div>
       
        <!-- The table listing the files available for upload/download -->
        <table id="file-table" role="presentation" class="ui compact striped definition table" ><tbody class="files"></tbody></table>
        
        
    </form>
    
     </div>
            
            </div>
          </div>
          
          
          
          <!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload animated bounceInLeft">
        <td class="check collapsing center aligned">
           <div class="ui disabled checkbox">
             <input type="checkbox" disabled="disabled">
             <label></label>
           </div>
        </td>
        <td class="preview center aligned">
          
        </td>
        <td class="name">
            {%=file.name%}
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            
            <div class="ui indicating progress" role="progressbar" data-value="1" data-total="20">
              <div class="bar">
                <div class="progress"></div>
              </div>
            </div>
    
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="ui icon blue button start" disabled>
                    <i class="upload icon"></i>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="ui icon yellow button cancel">
                    <i class="remove circle icon"></i>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td class="check collapsing center aligned">
            {% if (file.deleteUrl) { %}
                <div class="ui child checkbox">
                  <input type="checkbox" name="delete" value="1" class="toggle">
                  <label></label>   
                </div>
            {% } %}
        </td>
        <td class="preview center aligned">

                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}" style="max-width:80px;max-height:80px;"></a>
                {% } %}
        </td>
        <td class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
           
            {% if (file.error) { %}
                <div><div class="ui small red label">Error</div> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="ui red icon button delete"  data-name="{%=file.name%}" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}?saveName={%=file.saveName%}&${_csrf.parameterName}=${_csrf.token}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="trash icon"></i>
                </button>
            {% } else { %}
                <button class="ui icon yellow button cancel">
                    <i class="remove circle icon"></i>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
              
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/vendor/jquery.ui.widget.js"/>"></script>

<!-- The Templates plugin is included to render the upload/download listings -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/tmpl.min.js"/>"></script>

<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/load-image.all.min.js"/>"></script>

<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/canvas-to-blob.min.js"/>"></script>

<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<!--<script src="js/test/semantic.min.js"></script> -->
<%-- <script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/bootstrap.min.js"/>"></script> --%>

<!-- blueimp Gallery script -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/test/jquery.blueimp-gallery.min.js"/>"></script>

<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.iframe-transport.js"/>"></script>

<!-- The basic File Upload plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload.js"/>"></script>

<!-- The File Upload processing plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-process.js"/>"></script>

<!-- The File Upload image preview & resize plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-image.js"/>"></script>

<!-- The File Upload audio preview plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-audio.js"/>"></script>

<!-- The File Upload video preview plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-video.js"/>"></script>

<!-- The File Upload validation plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-validate.js"/>"></script>

<!-- The File Upload user interface plugin -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/jquery.fileupload-ui.js"/>"></script>

<!-- The main application script -->
<script type="text/javascript" src="<c:url value="/resources/vendors/jQuery-File-Upload-9.12.5/js/main.js"/>"></script>

<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
                
              
             
                         
              
              
              
              
              
               <div class="row">
              <div class="sixteen wide column">
              
                <div class="ui segment">
             
                <table class="ui selectable compact unstackable table">
                  <thead class="full-width">
                    <tr>
                      <th class="one wide center aligned no"><span>번호</span></th>
                      <th class="nine wide center aligned title"><span>제목</span></th>
                      <th class="three wide aligned author"><span>글쓴이</span></th>
                      <th class="one wide center aligned hit"><span><a href=#>조회</a></span></th>
                      <th class="one wide center aligned recommend"><span><a href=#>추천</a></span></th>
                      <th class="one wide center aligned date"><span><a href=#>날짜</a></span></th>
<!--                       <th class="my header">추천수</th> -->
<!--                       <th class="my header">생성일</th> -->
<!--                       <th class="my header">변경일</th> -->
                    </tr>
                  </thead>
                  
                  <tbody class="collapsing">
                    
                    <c:forEach items="${list}" var="board"> 
                    <tr>
                      <td class="no">${board.no}</td>
                      <td class="title"><a href="#">${board.title}</a>
                       <span class="comment num"><span>[3]</span></span>
                       <br> 
                       <span class="small info">
                        <span><span>Date</span><b><fmt:formatDate value="${board.registrationDate}" pattern="yyyy.MM.dd"/></b></span>
                        <span class="left solid"><span>By</span><b><img class="ui avatar image" src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>"><a href="#">${board.userNickname}</a></b></span>
                        <span class="left solid"><span>Views</span><b>${board.hitCount}</b></span>
                       </span>
                      </td>
                      <td class="author">
                      <img class="ui avatar image" src="<c:url value="/resources/semantic-ui/assets/images/avatar/tom.jpg"/>">
                      ${board.userNickname}
                      
                      
                      </td>
                      <td class="hit">${board.hitCount}</td>
                      <td class="recommend">${board.recommendCount}</td>
                      <td class="date">
                        <fmt:formatDate value="${board.registrationDate}" pattern="yyyy.MM.dd"/>
                      </td>
<%--                       <td>${board.boardNo}</td> --%>                    
<%--                       <td>${board.content}</td> --%>
<%--                       <td>${board.changeDate}</td> --%>
                    </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>

<div class="ui small left floated main menu">
  <a class="item">
    <i class="sidebar icon"></i>
    목록
  </a>
  
</div> 

<!-- <div class="ui small right floated main menu"> -->
<!--   <a class="item"> -->
<!--     <i class="write icon"></i> -->
<!--     글쓰기 -->
<!--   </a> -->
<!-- </div>  -->
 
 <br>
 <br>
<br>               


<div class="pagination">
  <a href="#" class="ui compact icon basic button">
    <i class="left chevron icon"></i>
    Prev
  </a>
  <a href="#" class="ui compact icon basic button">
   5
  </a>	
  <a href="#" class="ui compact icon basic button">
   6
  </a>	  
  <a href="#" class="ui compact icon basic button">
   7
  </a>	  
  <a href="#" class="ui compact icon basic button">
   8
  </a>	
  <a href="#" class="ui compact icon basic button">
   9
  </a>	  
  <a href="#" class="ui compact icon basic button">
   10
  </a>	  
  <a href="#" class="ui compact icon basic button">
   11
  </a>
  <a href="#" class="ui compact icon basic button">
   12
  </a>	  
  <a href="#" class="ui compact icon basic button">
   13
  </a>	  
  <a href="#" class="ui compact icon basic button">
   14
  </a>	  
  <a href="#" class="ui compact icon basic button">
   36
  </a>	  
  <a href="#" class="ui compact icon basic button">
    Next
    <i class="right chevron icon"></i>   
  </a>
</div>

<br>
<br>



<div class="ui small floating labeled icon bottom left pointing dropdown basic button">
   <input type="hidden" name="searchTarget" value="title_content">
   <i class="filter icon"></i>
   <span class="text">검색</span>
   <div class="menu"> 
     <div class="item" data-value="title_content">제목+내용</div>
     <div class="item" data-value="title">제목</div> 
     <div class="item" data-value="content">내용</div>
     <div class="item" data-value="comment">댓글</div>
     <div class="item" data-value="nickname">닉네임</div>
   </div>
</div>
<div class="ui small action input">
  <input type="text" placeholder="Search...">
  
   <button class="ui basic icon button" type="button">
    <i class="search icon"></i>
  </button>
</div>
                
              
              </div>
            
            </div>
          </div>
           
           
           
           
           
              
                        
            </div>
            
           
          
        </div>
            
        
        
        
  
            
       

     
        

<div class="ui small basic modal">
    <div class="ui icon header">
      <i class="child icon"></i>
            <p></p>       
    </div>
    <div class="actions">
      <a class="ui green ok inverted button">
    	<i class="checkmark icon"></i>
       	 확인   
      </a>
    </div>
</div>


<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>

<script type="text/javascript" src="<c:url value="/resources/javascript/board/edit.js"/>"></script>

