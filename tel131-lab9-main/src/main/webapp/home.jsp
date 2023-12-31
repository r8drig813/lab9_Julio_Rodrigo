<%@page import="java.util.ArrayList" %>
<%@ page import="pe.edu.pucp.tel131lab9.bean.Post" %>
<jsp:useBean id="posts" type="java.util.ArrayList<pe.edu.pucp.tel131lab9.bean.Post>" scope="request"/>
<jsp:useBean id="userSession" scope="session" type="pe.edu.pucp.tel131lab9.dto.EmployeeDto"
             class="pe.edu.pucp.tel131lab9.dto.EmployeeDto"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <jsp:include page="includes/headCss.jsp"></jsp:include>
</head>
<body>
<div class='container'>
    <jsp:include page="includes/navbar.jsp">
        <jsp:param name="currentPage" value="home"/>
    </jsp:include>
    <div class="row mb-5 mt-4">
        <div class="col-md-7">
            <h1>Home</h1>
        </div>
        <%if(userSession.getEmployeeId()==0){%>

        <%}else{%>

        <div class="col-md-5 col-lg-4 ms-auto my-auto text-md-end">
            <a href="<%= request.getContextPath()%>/PostServlet?action=new" class="btn btn-primary">New Post</a>
        </div>


        <%}%>


    </div>
    <div class="row">
        <%for (Post p : posts) {%>
        <div class="col-sm-4 py-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getTitle()%></h5>
                    <h6 class="card-subtitle mb-2 text-muted"><%= p.getEmployee().getFirstName() + p.getEmployee().getLastName()%></h6>
                    <p class="card-text"><%= p.getContent()%></p>
                    <a href="<%= request.getContextPath()%>/PostServlet?action=view&id=<%=p.getPostId()%>" class="btn btn-primary">View</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>
    <jsp:include page="includes/footer.jsp"/>
</div>
</body>
</html>
