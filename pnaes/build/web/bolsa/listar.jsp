<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <a href="/pnaes/bolsa/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Cadastrar NOVO Auxílio</button></a>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-striped table-responsive-md dataTable" style="text-align: center;">
                            <thead>
                            <th>Edital</th>
                            <th>Nome do Auxílio</th>
                            <th>Valor</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                            </thead>
                            <%                                                            
                                List<Bolsa> bolsas = daoFactory.getBolsaDao().listar();
                                DecimalFormat decimal = new DecimalFormat("###,###,###,##0.00");
                                for (Bolsa b : bolsas) {
                                    
                            %>
                            <tr>
                                <td><%=b.getEdital().getNumeroEAno()%></td>
                                <td><%=b.getNome()%></td>
                                <td >R$ <%=decimal.format(b.getValor())%></td>
                                <td> <a href="alterar.jsp?id=<%=b.getId()%>" title="Editar"><button class="mr-2 mb-2 btn btn-outline-info" type="button"><i class="os-icon os-icon-file-text">Editar</button></a></td>
                                <td> <a href="#" onclick="apagar(<%=b.getId()%>)" title="Excluir"><button class="mr-2 mb-2 btn btn-outline-danger" type="button"><i class="os-icon os-icon-close"></i>Excluir</button></a></td>

                            </tr>
                            <%
                                    
                                }

                            %>

                        </table>   
                    </div>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>