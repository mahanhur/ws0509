<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let item_detail = {
        init : function() {
            $("#register_btn").click ( function() {
                item_detail.send();
            })
            $("#delete_btn").click ( function() {
                let c = confirm("삭제하시겠습니까?");
                if(c == true) {
                    location.href="/item/deleteimpl?id=${gitem.id}";
                }
            })
        },
        send : function() {
            $("#register_form").attr({
                method:'post',
                action:'/item/detailimpl',
                enctype: 'multipart/form-data'
            });
            $("#register_form").submit();
        }

    };

    $( () => {
        item_detail.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">ITEM</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">detail about ${gitem.id}</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal">
                    <input type="hidden" name="id" value="${gitem.id}">
                    <input type="hidden" name="imgname" value="${gitem.imgname}">

                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src="/uimg/${gitem.imgname}" style="height:500px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">Name:</label>
                        <div class="col-sm-10">
                            <input type="name" class="form-control" name="name" id="name" value="${gitem.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="price">Price:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="price" id="price" value="${gitem.price}">
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-danger"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">Image:</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" name="img" id="img" placeholder="Input image">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="register_btn" class="btn btn-primary btn-user btn-block">update</button>
                            <button type="button" id="delete_btn" class="btn btn-danger btn-user btn-block">delete</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- /.container-fluid -->