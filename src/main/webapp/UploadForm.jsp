<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring MVC File Upload Demo</title>
</head>
<body>
	<center>
		<h1>Spring MVC File Upload Demo</h1>
		<form method="post" action="singleFileUpload" enctype="multipart/form-data">
			<table border="0">
				<tr>
					<td>Description:</td>
					<td><input type="text" name="description" size="50" id="description"/></td>
				</tr>
				<tr>
					<td>Pick file #1:</td>
					<td><input type="file" name="fileupload" id="fileupload" size="50"  /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Upload" /></td>
				</tr>
			</table>
		</form>
                
		  <h3>Multiple file Upload</h3>
  <form action="multipleFileUpload" method="post" enctype="multipart/form-data">
    <table>
      <tr>
        <td>Select Files</td>
        <td><input type="file" name="file" multiple="multiple"></td>
        <td><button type="submit">Upload</button></td>
      </tr>
    </table>
  </form>
  <br>
  <hr />
	</center>
</body>
</html>