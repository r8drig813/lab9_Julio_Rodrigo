<%@page import="java.util.ArrayList" %>
<%@ page import="pe.edu.pucp.tel131lab9.bean.Post" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="userSession" scope="session" type="pe.edu.pucp.tel131lab9.dto.EmployeeDto"
             class="pe.edu.pucp.tel131lab9.dto.EmployeeDto"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Lista empleados</title>
    <jsp:include page="../includes/headCss.jsp"></jsp:include>
</head>
<body>
<div class='container'>
    <jsp:include page="../includes/navbar.jsp">
        <jsp:param name="currentPage" value="newPost"/>
    </jsp:include>
    <div class="row mb-5 mt-4">
        <div class="col-md-7">
            <h1>New Post</h1>
        </div>
    </div>
    <div class="row">
        <form method="post" action="<%=request.getContextPath()%>/PostServlet?action=guardar">

            <input type="hidden" class="form-control" name="idEmpleado" id="idEmpleado"
                    value="<%=userSession.getEmployeeId()%>">
            <div class="col-12">
                <label for="titulo" class="form-label">Title</label>
                <input type="text" name="titulo" class="form-control" id="titulo" required>
                <div class="invalid-feedback">Por favor ingrese su nombre!</div>
            </div>
            <div class="col-12">
                <label for="contenido" class="form-label">Comment</label>
                <input type="text" name="contenido" class="form-control" id="contenido" required>
                <div class="invalid-feedback">Por favor ingrese su nombre!</div>
            </div>
            <br>
            <a class="btn btn-danger" href="<%=request.getContextPath()%>/HomeServlet">Cancelar</a>
            <button type="submit" class="btn btn-primary" href="<%=request.getContextPath()%>/HomeServlet" >Guardar</button>
        </form>
    </div>
    <jsp:include page="../includes/footer.jsp"/>
</div>
</body>
</html>
