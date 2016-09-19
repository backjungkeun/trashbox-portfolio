<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

  <!-- Small Following Menu -->
  <div class="ui fixed inverted menu">
    <a id="left-sidebar-button" class="item">
      <i class="sidebar icon"></i>
    </a>
    <div class="header item">
      
     
      <tiles:insertAttribute name="header-name"/>

    </div>
    <div class="right menu">
<!--       <a class="show search modal item" > -->
<!--         <i class="search icon"></i> -->
<!--       </a> -->
      <a id="right-sidebar-button" class="item">
        <i class="user icon"></i>
      </a>
    </div>
  </div>
  
  <!-- Large Following Menu  -->
  <div class="following bar fixed animated fadeInDown dark">
    <div class="ui container">
      <div class="ui large menu inverted">
        <a id="second-left-sidebar-button" class="item">
          <i class="sidebar icon"></i>
        </a>
        <div class="header item">
          <tiles:insertAttribute name="header-name"/>
        </div>
        <div class="right menu inverted">
<!--           <a class="show search modal item"> -->
<!--             <i class="search icon"></i> -->
<!--           </a> -->
          <a id="second-right-sidebar-button" class="item">
            <i class="user icon"></i>
          </a>
        </div>
      </div>
    </div>
  </div>