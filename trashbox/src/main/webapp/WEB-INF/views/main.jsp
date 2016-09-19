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
                    <a id="notice-tab-button" class="item active" data-tab="notice">공지사항</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/notice/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  
                  <div class="ui tab segment active" data-tab="notice">
               
                     <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
               
                  </div>
                </div>
                
                <div class="ui event segment">
               
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="event-tab-button" class="item active" data-tab="event">이벤트</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/event/1"/>">더보기</a>
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
                <div class="ui LectureAndTip segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="lecture-and-tip-button" class="item active" data-tab="LectureAndTip">강좌 / 팁</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/LectureAndTip/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="LectureAndTip">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui Free segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="freeboard-tab-button" class="item active" data-tab="Free">자유</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Free/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Free">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              
            </div>
            
          <div class="row">
              <div class="eight wide column">
                <div class="ui QnA segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="QnA-tab-button" class="item active" data-tab="QnA">질문 / 답변</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/QnA/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="QnA">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui Creative segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="Creative-tab-button" class="item active" data-tab="Creative">창작</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Creative/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Creative">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
            </div>
            
            
                      <div class="row">
              <div class="eight wide column">
                <div class="ui Decorate segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="Decorate-tab-button" class="item active" data-tab="Decorate">장식</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Decorate/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Decorate">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui Car segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="Car-tab-button" class="item active" data-tab="Car">자동차</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Car/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Car">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
            </div>
            
                      <div class="row">
              <div class="eight wide column">
                <div class="ui ElectricAndElectron segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="ElectricAndElectron-tab-button" class="item active" data-tab="ElectricAndElectron">전기 / 전자</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/ElectricAndElectron/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="ElectricAndElectron">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui Furnishings segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="Furnishings-tab-button" class="item active" data-tab="Furnishings">가구</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Furnishings/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Furnishings">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
            </div>
            
                      <div class="row">
              <div class="eight wide column">
                <div class="ui Hardware segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="Hardware-tab-button" class="item active" data-tab="Hardware">하드웨어</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Hardware/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Hardware">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui Woodworking segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="Woodworking-tab-button" class="item active" data-tab="Woodworking">목공</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Woodworking/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Woodworking">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="eight wide column">
                <div class="ui Etc segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="Etc-tab-button" class="item active" data-tab="Etc">기타</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/Etc/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="Etc">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
                  </div>
                </div>
              </div>
              
              <div class="eight wide column">
                <div class="ui BusinessAdvertisement segment">
                  <div class="ui pointing secondary ajax-tab menu">
                    <a id="BusinessAdvertisement-tab-button" class="item active" data-tab="BusinessAdvertisement">업체광고</a>
                    <div class="right menu">
                      <div class="item">
                        <a href="<c:url value="/board/BusinessAdvertisement/1"/>">더보기</a>
                      </div>
                    </div>
                  </div>
                  <div class="ui tab segment active" data-tab="BusinessAdvertisement">
                    <img class="ui wireframe image" src="<c:url value="/resources/assets/images/wireframe/paragraph.png"/>">
                    
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