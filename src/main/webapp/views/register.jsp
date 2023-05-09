<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let register = {
        init: () => {
            $('#register_btn').attr('disabled',true);
            $("#register_btn").click( () => {
                register.send();
            });
            $('#lev').keyup( () => {
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                let lev = $('#lev').val();

                if(id!=''&&pwd!=''&&lev!=''){
                    $('#register_btn').attr('disabled', false);
                };
            });
            $("#id").keyup( () => {
                let txt_id = $('#id').val();
                if(txt_id.length<=4) {
                    $('#check_id').text('아이디는 4자리 이상이어야 합니다.');
                    return;
                } else {
                    $('#check_id').text('');
                    $.ajax({
                        url:'/checkid',
                        data:{'id':txt_id},
                        success: function(result){
                            if(result == 0){
                                $('#check_id').text('사용 가능한 ID입니다');
                                $('#pwd').focus();
                            } else {
                                $('#check_id').text('사용 불가능한 ID입니다');
                            }
                        },
                    });
                }
            })
        },
        send:() => {
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let lev = $('#lev').val();

            if(id.length<=4) {
                $('#check_id').text('아이디는 4자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(lev == ''){
                $('#lev').focus();
                return;
            }
            $("#register_form").attr({
                'action':'/registerimpl',
                'method':'post'
            });
            $("#register_form").submit();
        }
    };

    $(function() {
        register.init();
    })
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Register</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Register</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form id="register_form">
                                <div class="form-group">
                                    <input type="id" class="form-control form-control-user" id="id" name="id" placeholder="Enter ID">
                                    <span id="check_id"></span>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="pwd" name="pwd" placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <input type="number" class="form-control form-control-user" id="lev" name="lev" placeholder="Enter level">
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-14">
                                        <button type="button" id="register_btn" class="btn btn-primary btn-user btn-block">register</button>
                                    </div>
                                </div>
                                <hr>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /.container-fluid -->