<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

  <script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js" type="text/javascript"></script>
  <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
  <title>Index Page</title>
</head>
<body>
<div class="container" style="margin-left: 15px">
  <h1>Script Creator Service</h1>
  <sec:authorize access="!isAuthenticated()">
    <p><a class="btn btn-lg btn-success" href="<c:redirect url="/login"/>">ВОЙТИ</a></p>
  </sec:authorize>
  <sec:authorize access="isAuthenticated()">
    <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
      <div style="width: 400px" class="alert alert-success">Добро пожаловать: <sec:authentication property="principal"/>!</div>
      <ul class="nav nav-pills nav-stacked" style="width: 400px">
        <li><a href="<c:url value="/users/"/>">Управление пользователями</a></li>
        <li><a href="<c:url value="/roles/"/>">Управление ролями</a></li>
        <li><a href="<c:url value="/categories/"/>">Управление категориями</a></li>
        <li><a href="<c:url value="/logout"/>">Выход</a></li>
      </ul>
    </sec:authorize>
  </sec:authorize>
</div>
</body>
</html>
