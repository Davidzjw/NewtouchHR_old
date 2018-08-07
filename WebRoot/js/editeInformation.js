$(document).ready(function() {
	findTr();
})
function findTr() {
	var tempTr = $("#data").find("TR");
	$(tempTr).each(function(i) {
		var tempId = $(this).attr("id");
		$("#userId1" + tempId).hide();
		$("#userName1" + tempId).hide();
		$("#password1" + tempId).hide();
		$("#age1" + tempId).hide();
		$("#department1" + tempId).hide();
		$("#sex1" + tempId).hide();
		$("#position1" + tempId).hide();
		$("#tel1" + tempId).hide();
		$("#level1" + tempId).hide();
		if (tempId != "-1000") {
			$("#edit" + tempId).click(function() {
				var storeId = $("#storeEdit" + tempId).val();
				if (storeId == "0") {
					$("#storeEdit" + tempId).val("1");
					$("#userName" + tempId).hide();
					$("#password" + tempId).hide();
					$("#age" + tempId).hide();
					$("#department" + tempId).hide();
					$("#sex" + tempId).hide();
					$("#position" + tempId).hide();
					$("#tel" + tempId).hide();
					$("#level" + tempId).hide();

					$("#userName1" + tempId).fadeIn();
					$("#password1" + tempId).fadeIn();
					$("#age1" + tempId).fadeIn();
					$("#department1" + tempId).fadeIn();
					$("#sex1" + tempId).fadeIn();
					$("#position1" + tempId).fadeIn();
					$("#tel1" + tempId).fadeIn();
					$("#level1" + tempId).fadeIn();
				}
				if (storeId == "1") {
					if (confirm("您确定提交吗？")) {
						$("#storeEdit" + tempId).val("0");
						var userId = tempId;
						var userName = $("#userName1" + tempId).children()
								.val();
						var password = $("#password1" + tempId).children()
								.val();

						var age = $("#age1" + tempId).children().val();
						var department = $("#department1" + tempId).children()
								.val();

						var sex = $("#sex1" + tempId).children().val();
						var position = $("#position1" + tempId).children()
								.val();
						var tel = $("#tel1" + tempId).children().val();
						var level = $("#level1" + tempId).children().val();

						if (userName == "") {
							alert("姓名不能为空！！");
							$("#userName1" + tempId).css("background",
									"#B7E1FA");
							$("INPUT").keypress(function() {
								$("#userName1" + tempId).css("background",
										"#FFFFFF");
							});
							return false;

						}
						if (password == "") {
							alert("密码不能为空！！");
							$("#password1" + tempId).css("background",
									"#B7E1FA");
							$("INPUT").keypress(function() {
								$("#password1" + tempId).css("background",
										"#FFFFFF");
							});
							return false;
						}
						if (age == "") {
							alert("年龄不能为空！！");
							$("#age1" + tempId).css("background", "#B7E1FA");
							$("INPUT").keypress(function() {
								$("#age1" + tempId)
										.css("background", "#FFFFFF");
							});
							return false;
						}
						if (sex == "") {
							alert("性别不能为空！！");
							$("#sex1" + tempId).css("background", "#B7E1FA");
							$("INPUT").keypress(function() {
								$("#sex1" + tempId)
										.css("background", "#FFFFFF");
							});
							return false;
						}
						if (position == "") {
							alert("职务不能为空！！");
							$("#position1" + tempId).css("background",
									"#B7E1FA");
							$("INPUT").keypress(function() {
								$("#position1" + tempId).css("background",
										"#FFFFFF");
							});
							return false;
						}
						if (tel == "") {
							alert("电话不能为空！！");
							$("#tel1" + tempId).css("background", "#B7E1FA");
							$("INPUT").keypress(function() {
								$("#tel1" + tempId)
										.css("background", "#FFFFFF");
							});
							return false;
						}
						if (level == "") {
							alert("权限不能为空！！");
							$("#level1" + tempId).css("background", "#B7E1FA");
							$("INPUT").keypress(function() {
								$("#level1" + tempId).css("background",
										"#FFFFFF");
							});
							return false;
						}

						if (age.search("^-?\\d+$") != 0) {
							alert("请输入正确的年龄格式！！");
							$("#sex1"+ tempId).val("");
							$("#sex1"+ tempId).css("background", "#B7E1FA");
							$("INPUT").keypress(function() {
								$("#sex1"+ tempId).css("background", "#FFFFFF");
							});
							return false;
						}
						if (tel.search("^-?\\d+$") != 0) {
							alert("请输入正确的电话格式！！");
							$("#tel1"+ tempId).val("");
							$("#tel1"+ tempId).css("background", "#B7E1FA");
							$("INPUT").keypress(function() {
								$("#tel1"+ tempId).css("background", "#FFFFFF");
							});
							return false;
						}

						$("#userName" + tempId).html(userName);
						$("#password" + tempId).html(password);
						$("#age" + tempId).html(age);
						$("#department" + tempId).html(department);
						$("#sex" + tempId).html(sex);
						$("#position" + tempId).html(position);
						$("#tel" + tempId).html(tel);
						$("#level" + tempId).html(level);

						$("#userName1" + tempId).hide();
						$("#password1" + tempId).hide();
						$("#age1" + tempId).hide();
						$("#department1" + tempId).hide();
						$("#sex1" + tempId).hide();
						$("#position1" + tempId).hide();
						$("#tel1" + tempId).hide();
						$("#level1" + tempId).hide();

						$("#userName" + tempId).fadeIn();
						$("#password" + tempId).fadeIn();
						$("#age" + tempId).fadeIn();
						$("#department" + tempId).fadeIn();
						$("#sex" + tempId).fadeIn();
						$("#position" + tempId).fadeIn();
						$("#tel" + tempId).fadeIn();
						$("#level" + tempId).fadeIn();

						submitEdit(userId, userName, password, age, department,
								sex, position, tel, level);

					} else {
						$("#storeEdit" + tempId).val("0");
						$("#userName1" + tempId).children().val($("#userName"
								+ tempId).html());
						$("#password1" + tempId).children().val($("#password"
								+ tempId).html());
						$("#age1" + tempId).children().val($("#age" + tempId)
								.html());
						$("#department1" + tempId).children()
								.val($("#department" + tempId).html());
						$("#sex1" + tempId).children().val($("#sex" + tempId)
								.html());
						$("#position1" + tempId).children().val($("#position"
								+ tempId).html());
						$("#tel1" + tempId).children().val($("#tel" + tempId)
								.html());
						$("#level1" + tempId).children().val($("#level"
								+ tempId).html());

						$("#userName1" + tempId).hide();
						$("#password1" + tempId).hide();
						$("#age1" + tempId).hide();
						$("#department1" + tempId).hide();
						$("#sex1" + tempId).hide();
						$("#position1" + tempId).hide();
						$("#tel1" + tempId).hide();
						$("#level1" + tempId).hide();

						$("#userName" + tempId).fadeIn();
						$("#password" + tempId).fadeIn();
						$("#age" + tempId).fadeIn();
						$("#department" + tempId).fadeIn();
						$("#sex" + tempId).fadeIn();
						$("#position" + tempId).fadeIn();
						$("#tel" + tempId).fadeIn();
						$("#level" + tempId).fadeIn();
					}
				}

			});
		}
		$("#deleteedit" + tempId).click(function() {
			var userid = tempId;
			$("#" + tempId).hide(100);
			if (confirm("您确定删除此用户吗？会级联删除")) {

				submitdelete(userid);

			} else {
				$("#" + tempId).fadeIn(100);
			}

		});

	});
}

function submitEdit(userId, userName, password, age, department, sex, position,
		tel, level) {
	department = encodeURI(encodeURI(department));
	userName = encodeURI(encodeURI(userName));
	sex = encodeURI(encodeURI(sex));
	position = encodeURI(encodeURI(position));
	level = encodeURI(encodeURI(level));
	$.ajax({
		type : "post",
		url : "updateInformation.do?method=updateInformation",
		data : "username=" + userName + "&password=" + password + "&sex=" + sex
				+ "&department=" + department + "&position=" + position
				+ "&tel=" + tel + "&level=" + level + "&userid=" + userId
				+ "&age=" + age,
		success : function(data) {
			alert("更新成功");
		}
	});
}
function submitdelete(userid) {
	$.ajax({
		type : "post",
		url : "deleteInformation.do?method=deleteInformation",
		data : "userid=" + userid,

		success : function(data) {
			alert("删除成功！！！");
		}
	});
}
