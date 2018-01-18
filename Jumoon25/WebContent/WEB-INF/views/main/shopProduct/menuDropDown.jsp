<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<style>
.my-dropdown-menu {
  width: 400px;
}
.my-dropdown-menu>ul {
  float: left;
  width: 50%;
}
.my-dropdown-menu>ul:not(:first-child) {
  border-left: 1px solid silver;
}
.my-dropdown-menu>ul>li>a {
  display: block;
  text-decoration: none;
  padding: 3px 20px 3px 20px;
  color: gray;
}
.my-dropdown-menu>ul>li>a:hover {
  background: #eee;
}
</style>

<div class="dropdown">
  <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">치킨<b class="caret"></b></a>
  <div class="dropdown-menu my-dropdown-menu">
    <ul class="list-unstyled">
      <li><a href="#">후라이드</a></li>
      <li><a href="#">양념</a></li>
      <li><a href="#">간장</a></li>
    </ul>
    <ul class="list-unstyled">
      <li><a href="#">1000</a></li>
      <li><a href="#">2000</a></li>
      <li><a href="#">3000</a></li>
    </ul>
    </div>
  </div>
</div>

<div class="dropdown">
  <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">피자<b class="caret"></b></a>
  <div class="dropdown-menu my-dropdown-menu">
    <ul class="list-unstyled">
      <li><a href="#">불고기</a></li>
      <li><a href="#">페퍼로니</a></li>
      <li><a href="#">포테이토</a></li>
    </ul>
    <ul class="list-unstyled">
      <li><a href="#">1000</a></li>
      <li><a href="#">2000</a></li>
      <li><a href="#">3000</a></li>
    </ul>
    </div>
  </div>
</div>