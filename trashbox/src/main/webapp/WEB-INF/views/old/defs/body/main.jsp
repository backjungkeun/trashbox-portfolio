<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Masthead  -->
        <div class="ui vertical masthead center aligned segment zoomed">
          <div class="ui container">
            <div class="introduction">
              <h1 class="ui inverted header">
                <span class="main header">
                 TRASH BOX
                </span>
                <span class="sub header">
                 Do it yourself
                </span>
              </h1>
              <div class="ui hidden divider"></div>
            </div>
          </div>
          <a class="ui inverted circular basic icon button">
            <i class="big angle double down icon"></i>
          </a>
        </div>       
       
        <!-- Main -->
        <div class="ui vertical stripe main segment">
          <div class="ui three column relaxed stackable grid container">
            <div class="row">
              <div class="eight wide column">
                <div class="ui notice segment">
                  
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="notice-tab-button" class="item active" data-tab="notice">Notice</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/notice/1"/>">more</a>
                      </div>
                    </div>
                  </div>
                  
                  <div class="ui tab segment active" data-tab="notice">
               
                     <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
               
                  </div>
                </div>
                
                <div class="ui event segment">
               
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="event-tab-button" class="item active" data-tab="event">Event</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/event/1"/>">more</a>
                      </div>
                    </div>
                  </div>
                  
                  <div class="ui tab segment active" data-tab="event">
               
                     <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
               
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui combo segment">
          
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="popularArticle-tab-button" class="item active" data-tab="popularArticles">인기글</a>
                    <a class="item" data-tab="newArticles">최신글</a>
                    <a class="item" data-tab="newComments">최신댓글</a>
                  </div>
           
                  <div class="ui tab segment active" data-tab="popularArticles">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    <br/>
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                  </div>
                  
                  <div class="ui tab segment" data-tab="newArticles">
                    
                  </div>
                  
                  <div class="ui tab segment" data-tab="newComments">
                    
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="eight wide column">
                <div class="ui freeboard segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="freeboard-tab-button" class="item active" data-tab="freeboard">자유</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/freeboard/1"/>">more</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="freeboard">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui segment">
                  <div class="ui pointing secondary menu">
                    <a class="item active" data-tab="free">free</a>
                    <div class="right menu">
                      <div class="item"><a href=#>more</a></div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="free">
                    <div class="ui celled list">
                      <div class="item">
                        <div class="right floated content">
                          <div class="info">
                            <span class="num">
                              <i class="comments icon"></i>137
                            </span>
                          </div>
                        </div>
                        <div class="content">
                          <div class="header">
                            <i class="right triangle icon"></i>
                            <a href="#">DN3 LGT용 HDVOICE 테스트용 (처음이신분은 절대 사용하지 마세요)</a>
                          </div>
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          <div class="row">
              <div class="eight wide column">
                <div class="ui segment">
                  <div class="ui pointing secondary menu">
                    <a class="item active" data-tab="free">free</a>
                    <div class="right menu">
                      <div class="item"><a href=#>more</a></div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="free">
                    <div class="ui celled list">
                      <div class="item">
                        <div class="right floated content">
                          <div class="info">
                            <span class="num">
                              <i class="comments icon"></i>137
                            </span>
                          </div>
                        </div>
                        <div class="content">
                          <div class="header">
                            <i class="right triangle icon"></i>
                            <a href="#">DN3 LGT용 HDVOICE 테스트용 (처음이신분은 절대 사용하지 마세요)</a>
                          </div>
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
              <div class="eight wide column">
                <div class="ui segment">
                  <div class="ui pointing secondary menu">
                    <a class="item active" data-tab="free">free</a>
                    <div class="right menu">
                      <div class="item"><a href=#>more</a></div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="free">
                    <div class="ui celled list">
                      <div class="item">
                        <div class="right floated content">
                          <div class="info">
                            <span class="num">
                              <i class="comments icon"></i>137
                            </span>
                          </div>
                        </div>
                        <div class="content">
                          <div class="header">
                            <i class="right triangle icon"></i>
                            <a href="#">DN3 LGT용 HDVOICE 테스트용 (처음이신분은 절대 사용하지 마세요)</a>
                          </div>
                        </div>
                      </div>                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          <div class="row">
            <div class="sixteen wide column">
              <div class="ui segment">
                <h2 class="ui dividing header">Types<a class="anchor" id="types"></a></h2>
                <div class="ui six doubling link cards">
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                  <div class="card">
                    <div class="content">
                      <img class="ui avatar image" src="<c:url value="/resources/assets/images/avatar/nan.jpg"/>"> Elliot
                    </div>
                    <div class="image">
                      <img src="<c:url value="/resources/assets/images/wireframe/image.png"/>">
                    </div>
                    <div class="extra content">
                      <span class="right floated">
                        <i class="red heart icon"></i>
                        <em> 17 </em>
                      </span>
                      <i class="comment icon"></i>
                      <em> 3 </em>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <script type="text/javascript" src="<c:url value="/resources/javascript/main.js"/>"></script>