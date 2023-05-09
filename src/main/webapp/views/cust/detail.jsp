<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let cust_detail = {
    init : function() {
        $("#modify_btn").click ( function() {
           cust_detail.send();
        });
        $("#delete_btn").click ( function() {
            let c = confirm("삭제하시겠습니까?");
            if(c == true) {
                location.href="/cust/deleteimpl?id=${cdetail.id}";
            }
        })
    },
    send : function() {
        // let pwd = $("#pwd").val();
        // let name = $("#name").val();
        // if(pwd=='') {
        //     $("#pwd").focus();
        //     return;
        // }
        // if(name=='') {
        //     $("#name").focus();
        //     return;
        // }
        $("#modify_form").attr({
            method:'post',
            action:'/cust/detailimpl'
        });
        $("#modify_form").submit();
    }
    };

    $( () => {
      cust_detail.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cust detail</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DETAILS</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="modify_form" class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">ID:</label>
                        <div class="col-sm-10">
                            <input type="id" class="form-control" name="id" id="id" value="${cdetail.id}" readonly>
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-danger"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Password:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="pwd" id="pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">Name:</label>
                        <div class="col-sm-10">
                            <input type="name" class="form-control" name="name" id="name" value="${cdetail.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="modify_btn" class="btn btn-primary btn-user btn-block">update</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="delete_btn" class="btn btn-danger btn-user btn-block">delete</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- /.container-fluid -->