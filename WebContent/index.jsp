<%-- 
    Document   : login
    Created on : May 2, 2008, 11:04:17 AM
    Author     : samuel.ramalho
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/ans_REALM_ADMP">
select DE_RAZAO_BLOQUEIO from DIDES.ta_razao_bloqueio
</sql:query>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">
<head>
<meta name="description" content="ANS">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="pragma" content="no-cache">
<meta name="keywords"
	content="ANS, Agência Nacional de Saúde Suplementar" lang="pt-BR">
<meta http-equiv="content-language" content="pt-BR">

<title>ANS - Agência Nacional de Saúde Suplementar</title>



</head>

<body onload="document.form.j_username.focus()">

	<div class="topoAreaRestritaOperadoras-ans" id="top-box">
		<div style="margin-top: 27px">
			<div class="marca-po-ans">
				
			</div>
			<div class="left-po-ans titulo-principal-po-ans">REALM teste</div>
		</div>
	</div>

	<div class="clear-po-ans">
		<br />
		<hr style="border-bottom: none; border-top: 1px solid #097189;"
			class="ui-separator ui-state-default ui-corner-all" />
	</div>

	<div class="topoAreaRestritaOperadoras-ans">

		<div id="element-box" class="login">

			<div class="centralizaLogin-ans"
				style="position: absolute; width: 300px; margin-left: -150px; left: 50%; height: 350px;">
				<h1>Login</h1>

				<div class="alert alert-alerta" id="system-message"	style="display:<%=(session.getAttribute("ans.login.erro") != null) ? "block" : "none"%>">
					<p>
						<b>Erro</b>
					</p>
					<p><%=session.getAttribute("ans.login.erro")%></p>
				</div>

				<br />
				<div id="section-box" class="boxcinza-ans">
					<form name="form" method="POST"	action="<%=response.encodeURL("j_security_check")%>"
						id="form">

						<div class="form-group">
							<label id="mod-login-username-lbl" for="j_username">Usuário</label>
							<input name="j_username" id="j_username" type="text"
								class="form-control campoTexto ui-inputfield ui-inputtext ui-widget ui-state-default ui-corner-all"
								size="20">
						</div>
						<div class="form-group">
							<label id="mod-login-password-lbl" for="j_password">Senha</label>
							<input name="j_password" id="j_password" type="password"
								class="form-control campoTexto" size="20">
						</div>

						<input type="submit" value="Acessar" class="btn btn-primary btn-block" />
					</form>
				</div>

			</div>

		</div>

		<div id="lock"></div>
		
	</div>
	</br>
	<div>
		<h2>Results</h2>

			<c:forEach var="row" items="${rs.rows}">
			    item: ${row}<br/>
			    
			</c:forEach>
	</div>


</body>
</html>
