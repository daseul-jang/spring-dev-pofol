<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEV POFO</title>
<script type="text/javascript">
	var header = "${_csrf.headerName}";
	var token = "${_csrf.token}";
	var $thumbnail = "";
	
	$(function() {
		// 날짜 선택 오픈소스 flatpickr Set
		$(".dateSelector").flatpickr({ 
			dateFormat: "Y-m-d"
		});
		
		$("#devDate :input").focusout(function() {
			console.log("포커스아웃");
			devDateSet();
		});
		
		/* 
		$("#stackInput").click(function() {
			//$("#searchListBox").empty();
			$("#myModal").modal();
			//$("#stackSearchInput").val("");
		});
		
		$("#stackSearchBtn").click(function() {
			//$("#searchListBox").empty();
			searchStack();
		});
		
		$("#stackSearchInput").keypress(function(e) {
			if(e.which == 13) {
				$("#stackSearchBtn").click();
			}
		}); */
	});
	
	function devDateSet() {
		var $startDate = $("#startDate").val();
		var $endDate = $("#endDate").val();
		
		var $startArr = $startDate.split("-");
		var $endArr = $endDate.split("-");
		
		var $startObj = new Date($startArr[0], $startArr[1], $startArr[2]);
		var $endObj = new Date($endArr[0], $endArr[1], $endArr[2]);
		
		if($startObj.getTime() > $endObj.getTime()) {
			alert("시작일은 종료일 이전이어야 합니다.");
			$("#startDate").val("");
			
			return false;
		}
	}
	/*
	function searchStack() {
		var $searchValue = $("#stackSearchInput").val();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/portfolio/write/stackSearch",
			type: "POST",
			data: {
				"searchValue" : $searchValue
			},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data, status) {
				if(status == "success") {
					var list = "";
					
					if(data.check) {
						for(var i = 0; i < data.stackList.length; i++) {
							//console.log("for문");
							console.log("stackList.getName: " + data.stackList[i].s_name);
							list = "<input type='checkbox' name='stackChkbox' value='"+ data.stackList[i].s_name +"'/>" + data.stackList[i].s_name;
							$("#searchListBox").append(list);
						}
					} else {
						console.log(data.msg);
					}
				}
			}
		});
	}*/
	
	/* function plusInput() {
		var input = "<li class='input-group mb-3'>"
					+ "<input class='form-control' type='text' id='skillInput' readonly />"
					+ "<div class='input-group-append'>"
					+ "<button class='input-group-text' onclick='removeInput(this);'><i class='fas fa-minus'></i></button>"	
					+ "</div>"
					+ "</li>";
		
		$("#skillInputArea ul li:last").after(input);
		
		
	} */
	
	/* function removeInput(obj) {
		obj.unwrap("li");
	} */
	/*
	function stackChkReturn() {
		//var $skillInput = $("#skillInputArea input:first-child").val();
		var chkList = [];
		var divList = [];
		var finalList = [];
		var add = "";
		
		$("input[name='stackChkbox']:checked").each(function(i) {
			chkList.push($(this).val());
			console.log(chkList[i]);
		});
		
		$("#myModal").modal("hide");
		$("#stackInput").attr("value", chkList);
		
		// 여기부터 주석
		if(!$("#stackInput").val().length) {
			$("#stackInput").attr("value", chkList[0]);
			
			for(var i = 0; i < chkList.length; i++) {
				add = "<li class='input-group mb-3'><input class='form-control' type='text' id='stackInput' value='"+ chkList[i+1] +"' readonly />"
					+"<div class='input-group-append'>"
					+"<button class='input-group-text'><i class='fas fa-times'></i></button>"
					+"</div>"
					+"</li>";
				$("#stackInputArea ul").append(add);
			}
			
			$("#stackInputArea li:last-child").remove();
			
		} else {
			for(var i = 0; i < chkList.length; i++) {
				add = "<li class='input-group mb-3'><input class='form-control' type='text' id='stackInput' value='"+ chkList[i] +"' readonly />"
					+"<div class='input-group-append'>"
					+"<button class='input-group-text'><i class='fas fa-times'></i></button>"
					+"</div>"
					+"</li>";
				$("#stackInputArea ul").append(add);
			}
		}
		
		console.log("chkList: " + chkList);
		divList = chkList;
		console.log("divList: " + divList); // 주석끝
	
		return chkList;
		
		// 주석
		for(var j = 0; j < chkList.length; j++) {
			var add = ""
			
			add = "<li><input class='form-control' type='text' id='skillInput' value='"+ chkList[j] +"' readonly /></li>"
			$("#skillInputArea ul").append(add);
			
		} 
		
		if($("#skillInputArea ul li:nth-child(2)").length) {
			$("#skillInputArea ul li:nth-child(1)").css("display", "none");
		} // 주석끝
	
	}*/
	
	function uploadImg(obj) {
		//var fileValue = $("#thumbnail").val().split("\\");
		//var fileName = fileValue[fileValue.length-1];
		
		if (obj.files && obj.files[0]) {
			console.log("if문");
			
			var fileName = obj.files[0].name;
			var fileSize = obj.files[0].size;
			var maxSize = 10 * 1024 * 1024;
			var ext = fileName.substr(fileName.lastIndexOf(".")+1, fileName.length);
			
			if(!($.inArray(ext.toLowerCase(), ["jpg", "jpeg", "jpe", "png", "gif"]) >= 0)) {
				alert("이미지 파일을 업로드해주세요.");
				return false;
			}
			
			if(fileSize > maxSize){
				alert("10MB 이하의 이미지 파일만 허용됩니다.");
				return false;
			}
			
			var formData = new FormData();
			formData.append("thumbnail", obj.files[0]);
			
			$.ajax({
				url: "${pageContext.request.contextPath}/portfolio/write/upload/thumbnail",
				type: "POST",
				cache: false,
				data: formData,
				processData: false,
				contentType: false,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success: function(data, status) {
					if(status == "success") {
						console.log("success");
						if(data.fileChk) {
							$(".thumbnail").html("<img class='tempThumb' src='${pageContext.request.contextPath}/resources/portfolio/upload/" + data.file_name + "' />");
							
							$thumbnail = data.file_name;
							console.log("파일이름: " + $thumbnail);
						}
					}
				}
			});
		} else {
			if ($(".thumbnail").children("img").length) {
				$(".thumbnail").empty();
				$(".thumbnail").html("<i class='far fa-images fa-5x'></i>");
				
				$thumbnail = "";
				console.log("파일이름(없을때): " + $thumbnail);
			}
		}
		
		console.log("obj.files[0]" + obj.files[0]);
	}
	
	function validTitle() {
		
	}
	
	function submit() {
		console.log("submit()");
		
		var $m_id = "${empty sessionScope.m_id? 0:sessionScope.m_id}";
		var $title = $("#titleInput").val();
		var $content = $("#contentInput").val();
		var $startDate = $("#startDate").val();
		var $endDate = $("#endDate").val();
		var $setting = $("#devSettingInput").val();
		var $stack = $("#stackInput").val();
		var $video = $("#videoInput").val();
		var $link = $("#linkInput").val();
		
		console.log("session : " + $m_id);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/portfolio/write/complete",
			type: "POST",
			cache: false,
			data: {
				"m_id" : $m_id,
				"p_title" : $title,
				"p_content" : $content,
				"p_startDate" : $startDate,
				"p_endDate" : $endDate,
				"p_devSetting" : $setting,
				"p_stack" : $stack,
				"p_thumbnail" : $thumbnail,
				"p_video" : $video,
				"p_link" : $link
			},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(data) {
				if(data == "Success") {
					alert("등록성공");
					location.href = "${pageContext.request.contextPath}/portfolio/myPofol?m_id=" + $m_id;
				} else {
					alert("등록실패");
				}
			}
		});
	}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor5/sample/styles.css">
<script src="${pageContext.request.contextPath}/resources/ckeditor5/build/ckeditor.js"></script> --%>
<!-- Header include -->
<%@ include file="/resources/include/navbar.jsp"%>
<style type="text/css">
	.filebox input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	
	.disnone {
		display: none;
	}
	
	.tempThumb {
		width: 150px;
		height: 150px;
	}
	
	.btn-plus {
		width: 25px;
		height: 25px;
		padding: 0px; !important;
	}
	
	#stackInputArea > ul {
		list-style: none;
	}
</style>
</head>
<body>
	<section class="container-fluid">
		<div class="">
			<div id="sectionOne">
				<div>
					<div>
						<span class="lead">제목</span>
					</div>
					<div class="input-group">
						<input class="form-control" type="text" id="titleInput" placeholder="제목을 입력해 주세요. (50자 이하)"/>
					</div>
				</div>
				<div>
					<div>
						<span class="lead">내용</span>
					</div>
					<div class="input-group">
						<textarea class="form-control" rows="5" id="contentInput" placeholder="작품의 설명과 주요 기능 등을 입력해 주세요."></textarea>
					</div>
				</div>
				<div>
					<div>
						<span class="lead">개발 기간</span>
					</div>
					<div class="input-group" id="devDate">
						<input class="form-control dateSelector start col-md-6" id="startDate" name="p_startDate" type="text" placeholder="시작일"/>
						<input class="form-control dateSelector end col-md-6" id="endDate" name="p_endDate" type="text" placeholder="종료일"/>
					</div>
				</div>
			</div>
			<div id="sectionTwo">
				<div>
					<div>
						<span class="lead">개발 환경</span>
					</div>
					<div class="input-group">
						<textarea class="form-control" id="devSettingInput" rows="5" placeholder="OS, IDE, JDK 등 개발 환경을 입력해 주세요."></textarea>
					</div>
				</div>
				<div>
					<div>
						<span class="lead">
							기술 스택
							<!-- <button class="btn btn-light btn-plus" onclick="plusInput();">
								<i class="fas fa-plus"></i>
							</button> -->
						</span>
					</div>
					<div class="input-group" id="stackInputArea">
						<%-- <ul style="width: 100%; padding: 0px;">
							<li class="input-group mb-3">
								<input class="form-control" type="text" id="stackInput" readonly />
							</li>
						</ul>
						<%@ include file="searchModal.jsp"%> --%>
						<textarea class="form-control" id="stackInput" rows="5" placeholder="사용 언어, 프레임워크, 데이터베이스 등 기술 스택을 입력해 주세요."></textarea>
					</div>
				</div>
			</div>
			<div id="sectionThree">
				<div>
					<div>
						<span class="lead">
							썸네일
						</span>
					</div>
					<div class="input-group filebox">
						<label class="thumbnail" for="thumbnail"><i class="far fa-images fa-5x"></i></label>
						<input type="file" id="thumbnail" onchange="uploadImg(this);"/>
					</div>
				</div>
				<div>
					<div>
						<span class="lead">
							동영상
						</span>
					</div>
					<div class="input-group">
						<textarea class="form-control" id="videoInput"></textarea>
					</div>
				</div>
				<div>
					<div>
						<span class="lead">
							링크
						</span>
					</div>
					<div class="input-group">
						<input class="form-control" type="text" id="linkInput" placeholder="시연 페이지 또는 GitHub 주소를 입력해 주세요."/>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div>
				<button onclick="submit();">완료</button>
			</div>
		</div>
	</section>
</body>
<!-- <script type="text/javascript">
	//CKEDITOR.replace('contentInput');
	
	$(window).on('load', function() {
		editorResize();
	});
	
	$(window).on('resize', function() {
		editorResize();
	});
	
	function editorResize() {
		var width = $(window).width();
		
		if(width > 768) {
			ClassicEditor
	        .create( document.querySelector( '#contentInput' ), {
	        	toolbar: {
	        		items: [
	        			'heading',
	        			'|',
	        			'fontFamily',
	        			'fontSize',
	        			'fontColor',
	        			'fontBackgroundColor',
	        			'bold',
	        			'italic',
	        			'underline',
	        			'highlight',
	        			'|',
	        			'blockQuote',
	        			'bolletedList',
	        			'numberedList',
	        			'indent',
	        			'outdent',
	        			'|',
	        			'imageUpload',
	        			'link',
	        			'|',
	        			'undo',
	        			'redo',
	        			'findAndReplace'
	        			
	        		]
	        	},
	        	fontFamily: {
	        		options: [
	        			'default',
	        			'Arial',
	        			'바탕',
	        			'돋움',
	        			'궁서체'
	        		]
	        	}
	        } )
	        .catch( error => {
	            console.error( error );
	        } );
		}
	}
</script> -->
</html>