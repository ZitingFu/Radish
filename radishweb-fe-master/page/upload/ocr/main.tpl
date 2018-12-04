<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>印刷文字识别-银行卡识别 </title>
	<link rel="stylesheet" href="1.css">
</head>
<body>
	<div class="box">
		<div class="div1">
			<img id="logoimgimg" src="images/2.jpg" alt="" >
		</div>
		<table>
			<tr>
				<th>姓名：</th>
				<td class="name"></td>
			</tr>
			<tr>
				<th>性别：</th>
				<td class="sex"></td>
			</tr>
			<tr>
				<th>名族：</th>
				<td class="nationality"></td>
			</tr>
			<tr>
				<th>出生年月日：</th>
				<td  class="birth"></td>
			</tr>
			<tr>
				<th>住址：</th>
				<td class="address"></td>
			</tr>
			<tr>
				<th>身份证件号：</th>
				<td class="num"></td>
			</tr>
		</table>

		<!-- file -->
		<form action="" id="form">
			<input type="file" id="file" name="file"/>
		</form>
	</div>	
	<script src="js/jquery-3.3.1.js"></script>
	<script src="js/index.js"></script>
</body>
</html>