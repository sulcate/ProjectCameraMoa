<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 .orderInfo input { width:200px; height:25px;}
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 
 #container {
 	padding-top: 60px;
   	padding-left: 60px;
   	padding-right: 60px;
   	padding-bottom: 230px;
 }
 
 .orderInfo p {
 	line-height: 1.1;
 }
 
 .home
{
   width: 100%;
   height: 362px;
   background: #FFFFFF;
   z-index: 2;
   padding-top: 130px;
   padding-left: 60px;
   padding-right: 60px;
}
.home_container
{
   width: 100%;
   height: 100%;
}
.home_background
{
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background-repeat: no-repeat;
   background-size: cover;
   background-position: center center;
}
.home_content_container
{
   position: absolute;
   top: 53%;
   left: 0;
   -webkit-transform: translateY(-50%);
   -moz-transform: translateY(-50%);
   -ms-transform: translateY(-50%);
   -o-transform: translateY(-50%);
   transform: translateY(-50%);
   width: 100%;
}
.home_content
{
   width: 580px;
}
.breadcrumbs ul li
{
   display: inline-block;
   position: relative;
   font-size: 14px;
   font-weight: 500;
   color: #e95a5a;
}
.breadcrumbs ul li:not(:last-child)::after
{
   display: inline-block;
   content: '/';
   margin-left: 10px;
   margin-right: 6px;
   color: #FFFFFF;
}
.breadcrumbs ul li a
{
   font-size: 14px;
   font-weight: 500;
   color: #FFFFFF;
   -webkit-transition: all 200ms ease;
   -moz-transition: all 200ms ease;
   -ms-transition: all 200ms ease;
   -o-transition: all 200ms ease;
   transition: all 200ms ease;
}
.breadcrumbs ul li a:hover
{
   color: #e95a5a;
}
.list
{
   width: 100%;
   background: #FFFFFF;
   padding-top: 130px;
   padding-left: 60px;
   padding-right: 60px;
}
</style>

</head>

<!-- Home -->

   <div class="home">
      <div class="home_container">
         <div class="home_background" style="background-image:url(/resources/images/cart.jpg)"></div>
         <div class="home_content_container">
            <div class="container">
               <div class="row">
                  <div class="col">
                     <div class="home_content">
                        <div class="breadcrumbs">
                           <ul>
                              <li><a href="/">Home</a></li>
                              <li><a href="/user/mypage">My page</a></li>
                              <li><a href="/shop/orderList">주문내역 조회</a></li>
                              <li>주문정보 수정</li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

	<section id="container">
		<div id="container_box">
			<section id="content">
				<div class="orderInfo">
  					<c:forEach items="${orderView}" var="orderView" varStatus="status">
   
   					<c:if test="${status.first}">
   						<form role="form" action="/shop/orderModify" method="post" autocomplete="off">
									
						<input type="hidden" id="orderId" name="orderId" value="${orderView.orderId }" />
						
   						<p><span>주문날짜</span><fmt:formatDate value="${orderView.orderDate}" pattern="yyyy.MM.dd" /></p>
    					<p><span>수령인</span><input name='orderRec' value="${orderView.orderRec}" required="required"></p>
    					<p><span>주소</span><input type="text" name="postCode" id="sample2_postcode" placeholder="우편번호" value="${orderView.postCode}" required="required">
											<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" style="width:100px;">
    					<p><span>&nbsp;</span><input type="text" name="userAddr1" id="sample2_address" value="${orderView.userAddr1}" placeholder="주소" required="required">
										    <input type="text" name="userAddr2" id="sample2_detailAddress" value="${orderView.userAddr2}" placeholder="상세주소" required="required">
										    <input type="text" name="userAddr3" id="sample2_extraAddress" value="${orderView.userAddr3}" placeholder="참고항목">
    					</p>
    					<p><span>연락처</span><input name='orderPhon' value="${orderView.orderPhon}"></p>
    					<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
    					<p><span>상태</span><d style="color:red;">${orderView.delivery }</d></p>
    					<p>&nbsp;</p>
						<p>&nbsp;</p>
						<button type="submit" class="btn btn-warning" style="cursor:pointer;"><a>수정하기</a></button>
						<button type="button" class="btn btn-info"><a href="/shop/orderList" style="color:white;">취소</a></button>
						
						</form>
   					</c:if>
   
  					</c:forEach>
 				</div>
 
 					<ul class="orderView">
  						<c:forEach items="${orderView}" var="orderView">     
  					<li>
   					<div class="thumb">
    					<img src="${orderView.gdsThumbImg}" />
   					</div>
   					<div class="gdsInfo">
    					<p>
     					<span>상품명</span>${orderView.gdsName}<br />
     					<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
     					<span>구입 수량</span>${orderView.cartStock} 개<br />
     					<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원                  
    					</p>
   					</div>
  					</li>     
  						</c:forEach>
 					</ul>
			</section>
	
		</div>
	</section>
	
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
    	
    	document.getElementById('sample2_postcode').value = "";
        document.getElementById("sample2_address").value = "";
        document.getElementById("sample2_detailAddress").value = "";
        document.getElementById("sample2_extraAddress").value = "";
    	
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

<%@ include file="../includes/footer.jsp" %>