<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Safe Zone</title>
</head>
<body>
	<form action="Send">
		<table text-align="center" border="1">
			<thead>
			<tr>
				<td colspan="2">창고 번호</td>
				
				<td colspan="2">경비 ON / OFF</td>
				<td colspan="2">사이렌 ON / OFF</td>
				<td> 제어 </td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="2">
				<select name = "">
				<option> 1 </option>
				<option> 2 </option>
				<option> 3 </option>
				</select>
				</td>
				<td colspan="2">
				ON <input type="radio" name="led" value="0">
				OFF <input type="radio" name="led" value="1">
				</td>
				<td colspan="2">
				ON <input type="radio" name="led" value="0">
				OFF <input type="radio" name="led" value="1">
				</td>
				<td>
				<input type="submit" value="전송">
				</td>
			</tr>
			</tbody>
		</table>
		
	</form>

</body>
</html>