<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title><tiles:getAsString name="title"/></title>
    
  <tiles:insertAttribute name="semantic-ui"/>
  </head>
  <body>
  
        <table>
      <tr>
        <td colspan="2">
          <tiles:insertAttribute name="header" />
        </td>
      </tr>
      <tr>
        <td>
          <tiles:insertAttribute name="menu" />
        </td>
        <td>
          <tiles:insertAttribute name="body" />
        </td>
      </tr>
     
    </table>
    
    <tiles:insertAttribute name="footer" />
    
  </body>
</html>