<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<style>
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
   padding-top: 60px;
   padding-left: 60px;
   padding-right: 60px;
   padding-bottom: 150px;
}

.uploadResult {
width:100%
background-color: gray;
}

.uploadResult ul{
display:flex;
flex-flow: row;
justify-content: center;
align-items: center;
}

.uploadResult ul li {
list-style: none;
padding: 10px;
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
                              <li>구매 후기</li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


<div class="list">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header" style="color:black;">후기 작성</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading"></div>
			<div class="panel-body">

				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name='content'></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer' 
						value='<sec:authentication property="principal.username"/>' readonly="readonly">
					</div>
					
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">

								<div class="panel-heading"></div>
								<div class="panel-body">
									<div class="form-group uploadDiv">
										<input type="file" name='uploadFile' multiple>
									</div>

									<div class='uploadResult'>
										<ul>

										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>

					<button type="submit" class="btn btn-default">글 등록</button>
					<button type="reset" class="btn btn-default">다시 쓰기</button>
				</form>

			</div>
		</div>
	</div>
</div>

</div>

<script>
$(document).ready(function(e) {
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj) {
			
			var jobj =$(obj);
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		})
		
		formObj.append(str).submit();
	});
	
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alx)$");
	  var maxSize = 5242880; // 5MB
	  
	  function checkExtension(fileName, fileSize) {
		  
		  if(fileSize >= maxSize) {
			  alert ("파일 사이즈 초과");
			  return false;
		  }
		  
		  if(regex.test(fileName)) {
			  alert("해당 종류의 파일은 업로드할 수 없습니다.");
			  return false;
		  }
		  return true;
	  }
	  
	  $("input[type='file']").change(function(e) {
		  var formData = new FormData();
		  var inputFile = $("input[name='uploadFile']");
		  var files = inputFile[0].files;
	  
		  for(var i=0; i<files.length; i++) {
			  
			  if(!checkExtension(files[i].name, files[i].size)) {
				  return false;
			  }
			  formData.append("uploadFile", files[i]);
		  }
		  
		  $.ajax({
			  url: '/uploadAjaxAction',
			  processData: false,
			  contentType: false,
			  data: formData,
			  type: 'POST',
			  dataType: 'json',
			  success: function(result){
				  console.log(result);
				  showUploadResult(result);
			  }
		  });
		  
	  });
	  
});

function showUploadResult(uploadResultArr) {
	  
	  if(!uploadResultArr || uploadResultArr.length == 0) { return; }
	  
	  var uploadUL = $(".uploadResult ul");
	  
	  var str = "";
	  
	  $(uploadResultArr).each(function(i, obj){
		  if(obj.image) {
			  var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			  	str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
			  	str += " data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div><sapn> "+ obj.fileName+"</span>";
			  	str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
			  	str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			  	str += "<img src='/display?fileName="+fileCallPath+"'></div></li>";
		  } else {
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/"+ obj.uuid +"_"+obj.fileName);
				  
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
			  	str += " data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div><sapn> "+ obj.fileName+"</span>";
			  	str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
			  	str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			  	str += "<img src='/resources/img/attach.png'></a></div></li>";
		  }
	  });
	  
	  uploadUL.append(str);
	  
	  $(".uploadResult").on("click", "button", function(e){
				 
			  var targetFile = $(this).data("file");
			  var type = $(this).data("type");
			  
			  var targetLi = $(this).closest("li");
			  
			  $.ajax({
				  url: '/deleteFile',
				  data: {fileName: targetFile, type:type},
				  dataType: 'text',
				  type: 'POST',
				  success: function(result){
					  targetLi.remove();
				  } 
			  });
	  });

}

</script>

<%@ include file="../includes/footer.jsp"%>