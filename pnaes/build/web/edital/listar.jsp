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
                <h2>Lista de Editais</h2>
                <div class="conteudo row">
                    <div class="col-md-3">
                        <a href="/pnaes/edital/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Lançar Novo Edital</button></a>
                    </div>
                    <div class="col-md-12">
                        <%
                            List<Edital> editals = daoFactory.getEditalDao().listar();
                            DataFormat dataFormat = new DataFormat();

                        %>        
                        <table class="table table-striped table-responsive-md">
                            <thead>
                            <th>Numero</th>
                            <th>Data Inicial</th>
                            <th>Data Final</th>
                            <th>Status</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                            </thead>
                            <tbody>
                                <%                                                                for (Edital e : editals) {
                                %>
                                <tr>
                                    <td><%=e.getNumero()%>/2025</td>
                                    <td><%=dataFormat.formatarData(e.getDataInicial())%></td>
                                    <td><%=dataFormat.formatarData(e.getDataFinal())%></td>
                                    <td><%=e.ativo()%></td>
                                    <td><a href="alterar.jsp?id=<%=e.getId()%>" title="Editar"><button class="mr-2 mb-2 btn btn-outline-info" type="button"><i class="os-icon os-icon-file-text">Editar</button></a></td>
                                    <td><a href="excluir.jsp?id=<%=e.getId()%>" title="Excluir"><button class="mr-2 mb-2 btn btn-outline-danger" type="button"><i class="os-icon os-icon-close"></i>Excluir</button></a></td>
                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                            <th>Numero</th>
                            <th>Data Inicial</th>
                            <th>Data Final</th>
                            <th>Status</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>