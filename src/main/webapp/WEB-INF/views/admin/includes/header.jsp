<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i class="fa fa-bars"></i></a>
                <div class="top-left-part"><a class="logo" href="/admin/index"><b><img src="/resources/pluginsAdmin/images/pixeladmin-logo.png" alt="home" /></b><span class="hidden-xs"><img src="/resources/pluginsAdmin/images/pixeladmin-text.png" alt="home" /></span></a></div>
        
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <a class="profile-pic" href="#" style="cursor:default;"> <img src="/resources/images/admin.png" alt="user-img" width="36" class="img-circle"><b class="hidden-xs">${userid }</b> </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- Left navbar-header -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li style="padding: 10px 0 0;">
                        <a href="/admin/goods/list" class="waves-effect"><img src="/resources/images/gbutton.png" width="10" height="10"> <span class="hide-menu">상품 관리</span></a>
                    </li>
                    <li>
                        <a href="/admin/shop/orderList" class="waves-effect"><img src="/resources/images/gbutton.png" width="10" height="10"> <span class="hide-menu">주문 관리</span></a>
                    </li>
                    <li>
                        <a href="/admin/shop/refundList" class="waves-effect"><img src="/resources/images/gbutton.png" width="10" height="10"> <span class="hide-menu">환불 관리</span></a>
                    </li>
                    <li>
                        <a href="/admin/board/inquiryList" class="waves-effect"><img src="/resources/images/gbutton.png" width="10" height="10"> <span class="hide-menu">문의 게시판</span></a>
                    </li>
                    <li>
                        <a href="/admin/board/reviewList" class="waves-effect"><img src="/resources/images/gbutton.png" width="10" height="10"> <span class="hide-menu">구매 후기</span></a>
                    </li>
                    <li>
                        <a href="/admin/board/noticeList" class="waves-effect"><img src="/resources/images/gbutton.png" width="10" height="10"> <span class="hide-menu">공지사항</span></a>
                    </li>
                    <li>
                        <a href="/admin/user/userList" class="waves-effect"><img src="/resources/images/gbutton.png" width="10" height="10"> <span class="hide-menu">회원 관리</span></a>
                    </li>
                </ul>
                <div class="center p-20">
                    <span class="hide-menu"><a href="/" class="btn btn-danger btn-block btn-rounded waves-effect waves-light">메인으로 돌아가기</a></span>
                </div>
            </div>
        </div>
        <!-- Left navbar-header end -->