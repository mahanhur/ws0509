<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let marker_search = {
        init: function() {
            $("#search_btn").click( ()=>{
                $("#search_form").attr({
                    method:'post',
                    action:'/marker/search'
                });
                $("#search_form").submit();

            })
        }
    };

    $(function() {
        marker_search.init();
    });

</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">All</h6>
            <form id="search_form" class="form-inline well">
<%--                <div class="dropdown">--%>
<%--                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Locations--%>
<%--                        <span class="caret"></span></button>--%>
<%--                    <ul class="dropdown-menu">--%>
<%--                        <c:forEach var="i" items="${mllist}">--%>
<%--                            <li>${i.loc}</li>--%>
<%--                        </c:forEach>--%>
<%--                    </ul>--%>
<%--                </div>--%>
                <label>Location : </label>
                <select class="form-control col-sm-3" name="loc">
                    <option value="">지역</option>
                    <option value="S" <c:if test="${ms.loc=='s'}">selected</c:if>>서울</option>
                    <option value="B" <c:if test="${ms.loc=='b'}">selected</c:if>>부산</option>
                    <option value="J" <c:if test="${ms.loc=='j'}">selected</c:if>>제주</option>
                </select>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="title" id="title" placeholder="Enter title">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-12">
                        <button type="button" id="search_btn" class="btn btn-primary btn-user btn-block">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Img</th>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Target</th>
                        <th>Lat</th>
                        <th>Lng</th>
                        <th>Loc</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Img</th>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Target</th>
                        <th>Lat</th>
                        <th>Lng</th>
                        <th>Loc</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="i" items="${mlist}">
                        <tr>
                            <td><a href="#" data-toggle="modal" data-target="#target${i.id}"><img src="/uimg/${i.img}"></a></td>
                            <td><a href="/marker/detail?id=${i.id}">${i.id}</a></td>
                            <td>${i.title}</td>
                            <td>${i.target}</td>
                            <td>${i.lat}</td>
                            <td>${i.lng}</td>
                            <td>${i.loc}</td>
                        </tr>
                        <!-- Modal -->
                        <div id="target${i.id}" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${i.title}</p>
                                        <img src="/uimg/${i.img}" style="height:400px;"><hr/>
                                        <p>url : <a href="${i.target}">${i.target}</a></p>
                                        <p>location : ${i.lat}, ${i.lng}</p>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/marker/detail?id=${i.id}" class="btn btn-info" role="button">Detail</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End of Modal -->
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->