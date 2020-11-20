<%--
  Created by IntelliJ IDEA.
  User: SuperXX
  Date: 2020/11/20
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>商户展示</title>
    <link type="text/css" rel="stylesheet" href="webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
</head>
<body>
<script type="text/javascript" src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function del() {
        if(confirm("确定删除？")){
            return true;
        }
        return false;
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered">
                <tr style="text-align: center">
                    <td>商品编号</td>
                    <td>商品名字</td>
                    <td>店铺</td>
                    <td>价格</td>
                    <td>折扣</td>
                    <td>商品图片</td>
                    <td>商品操作</td>
                </tr>
                <c:forEach items="${glist}" var="good">
                    <tr style="text-align: center">
                        <td>${good.id}</td>
                        <td>${good.name}</td>
                        <td>${good.des}</td>
                        <td>${good.price}￥</td>
                        <td>${good.discount}</td>
                        <td><img src="${good.pic}" style="width: 60px;height: 60px"></td>
                        <td><a href="/good/deleteById?id=${good.id}" onclick="return del()"><button type="button" data-toggle="modal" style="background-color: red" class="btn btn-primary btn-sm">删除</button></a>|<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" style="background-color: aqua" data-target="#myModal${good.id}">
                            修改
                        </button>
                            <div class="modal fade" id="myModal${good.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal" method="post" action="/good/updateById" enctype="multipart/form-data">
                                                <input type="hidden" name="id" value="${good.id}">
                                                <div class="form-group">
                                                    <label for="inputName" class="col-sm-3 control-label">商品名字:</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" class="form-control" id="inputName" name="name" value="${good.name}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputDes" class="col-sm-3 control-label">店铺:</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" class="form-control" id="inputDes" name="des" value="${good.des}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputDept" class="col-sm-3 control-label">价格:</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" class="form-control" id="inputDept" name="price" value="${good.price}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputBirth" class="col-sm-3 control-label">折扣:</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" class="form-control" id="inputBirth" name="discount" value="${good.discount}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPic" class="col-sm-3 control-label">商品图片:</label>
                                                    <div class="col-sm-5">
                                                        <input type="file" class="form-control" id="inputPic" name="file">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-offset-4 col-sm-8">
                                                        <button type="submit" class="btn btn-default">修改</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="7" style="text-align: center">
                        <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModaladd">
                            添加商品
                        </button>
                        <div class="modal fade" id="myModaladd" tabindex="-1" role="dialog" aria-labelledby="myModalLabela">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabela">添加商品</h4>
                                    </div>
                                    <div class="modal-body">
                                        <!--
                                                   enctype="multipart/form-data"
                                                    图片的上传
                                                    -->
                                        <form class="form-horizontal" method="post" action="/good/addOne" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="inputName1" class="col-sm-3 control-label">商品名字:</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="inputName1" name="name">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputSex1" class="col-sm-3 control-label">商品:</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="inputSex1" name="des">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDept1" class="col-sm-3 control-label">价格:</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="inputDept1" name="price">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputBirth1" class="col-sm-3 control-label">折扣:</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="inputBirth1" name="discount">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPic1" class="col-sm-3 control-label">商品图片:</label>
                                                <div class="col-sm-5">
                                                    <input type="file" class="form-control" id="inputPic1" name="file">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-4 col-sm-8" style="margin: auto">
                                                    <button type="submit" class="btn btn-default" >添加</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" style="text-align: center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="/good/findAll?page=1" aria-label="top">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                <li>
                                    <c:if test="${pb.pageNum!=1}">
                                        <a href="/good/findAll?page=${pb.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </c:if>
                                </li>
                                <li>
                                    <c:choose>
                                        <c:when test="${pb.pages<=3}">
                                            <c:forEach begin="1" step="1" end="${pb.pages}" var="p">
                                                <a href="/good/findAll?page=${p}">${p}</a>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${pb.pages==pb.pageNum}">
                                                    <c:forEach begin="${pb.pageNum-2}" step="1" end="${pb.pages}" var="p">
                                                        <a href="/good/findAll?page=${p}">${p}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${pb.pageNum==1}">
                                                    <c:forEach begin="${pb.pageNum}" step="1" end="${pb.pageNum+2}" var="p">
                                                        <a href="/good/findAll?page=${p}">${p}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach begin="${pb.pageNum-1}" step="1" end="${pb.pageNum+1}" var="p">
                                                        <a href="/good/findAll?page=${p}">${p}</a>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li>
                                    <c:if test="${pb.pageNum!=pb.pages}">
                                        <a href="/good/findAll?page=${pb.nextPage}" aria-label="Next">
                                            <span aria-hidden="true">下一页</span>
                                        </a>
                                    </c:if>
                                </li>
                                <li>
                                    <a href="/good/findAll?page=${pb.pages}" aria-label="end">
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
