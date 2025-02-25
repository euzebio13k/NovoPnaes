<%@page import="java.util.GregorianCalendar"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Edital"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="../css/estilo.css" rel="stylesheet">
    </head>
    <body>
        <div class="conteiner-fluid">            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <div class="conteudo row">
                    <div class="col-md-10">
                        <fieldset>
                            <h2>Excluir Edital</h2>
                            <form action="../ServletEdital?opcao=excluir&id=<%=request.getParameter("id")%>" method="post">
                                <div class="form-group">
                                    <p>Deseja realmente excluir esse edital?</p>
                                </div>

                                <div class="form-group">
                                    <a href="listar.jsp"><button type="button" class="btn btn-success">Cancelar</button></a>
                                    <button name="excluir" type="submit" class="btn btn-danger">Excluir</button>
                                </div>
                            </form>
                        </fieldset>
                    </div>

                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
</html>