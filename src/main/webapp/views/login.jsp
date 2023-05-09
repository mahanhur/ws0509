<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let login = {
        init:function() {
            $("#login_btn").click( () => {
                login.send();
            });
        },
        send:function() {
            $("#login_form").attr({
                'action':'/loginimpl',
                'method':'post'
            });
            $("#login_form").submit();
        }
    };

    $(function() {
        login.init();
    })
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Login</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Login</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <div class="row">
                    <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                            </div>
                            <form id="login_form">
                                <div class="form-group">
                                    <input type="id" class="form-control form-control-user" id="id" name="id" placeholder="Enter ID">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="pwd" name="pwd" placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-14">
                                        <button type="button" id="login_btn" class="btn btn-primary btn-user btn-block">Login</button>
                                    </div>
                                </div>
                                <hr>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="register.html">Create an Account!</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>  <!--container end-->

        </div>   <!--card-body end-->
    </div>
</div>

<!-- /.container-fluid -->