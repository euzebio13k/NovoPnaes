<%-- 
    Document   : documento
    Created on : 06/04/2018, 14:36:55
    Author     : ronan
--%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Bolsa"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Inscricao"%>
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
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <div class="card-header">
                        <%if (request.getParameter("analisados") != null) {%>
                        <h4 class="card-title" id="striped-row-layout-icons">Documentos Analisados</h4>
                        <%} else {%>
                        <h4 class="card-title" id="striped-row-layout-icons">Análise de Documentos</h4>
                        <%}%>
                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                        </div>
                    </div>
                    <div class="card-content collpase show">
                        <div class="card-body">
                            <div class="card-text">
                                <%if (request.getParameter("analisados") != null) {%>
                                Lista de Alunos com a Análise de Documentos Concluída
                                <%} else {%>
                                Lista de Alunos para a Análise de Documentos
                                <%}%>
                            </div><br>

                            <table class="table table-striped table-responsive-md" id="tabelaAlunosDocumentos">
                                <thead align="center">
                                    <tr>
                                        <th>Inscrição</th>
                                        <th>Aluno</th>
                                        <th>Modalidade de Curso</th>
                                        <th>Curso</th>
                                        <th>Auxílio 1ª Opção</th>
                                            <%if (request.getParameter("analisados") != null) {%>
                                        <th>Resultado da Análise Documental</th>
                                        <th>Análise Feita Por</th>
                                            <%}%>
                                        <th>Conferir Documentos</th>
                                    </tr>
                                </thead>
                                <%
                                    List<Inscricao> inscricoes = daoFactory.getInscricaoDao().perquisarPorEdital(1);

                                    for (Inscricao i : inscricoes) {

                                        if (i.getResultadoAnaliseDocumental() == null && request.getParameter("analisados") == null) {
                                            out.println("<tr align='center'>");
                                            out.println("<td>" + i.getId() + "</td>");
                                            out.println("<td>" + i.getAluno().getNome() + "</td>");
                                            out.println("<td>" + i.getAluno().getCurso().getCategoria().getNome() + "</td>");
                                            out.println("<td>" + i.getAluno().getCurso().getNome() + "</td>");
                                            out.println("<td>" + i.getBolsa1().getNome() + "</td>");
                                            out.println("<td><a href='cadastrar.jsp?i_id=" + i.getId() + "&editar=1'><button  class='btn btn-warning os-icon os-icon-eye' type='button' > Conferir Documentos</button></a></td>");
                                            out.println("</tr>");
                                        } else if (i.getResultadoAnaliseDocumental() != null && request.getParameter("analisados") != null) {
                                            //Mostrar somente Inscrições já analisadas 
                                            out.println("<tr align='center'>");
                                            out.println("<td>" + i.getId() + "</td>");
                                            out.println("<td>" + i.getAluno().getNome() + "</td>");
                                            out.println("<td>" + i.getAluno().getCurso().getCategoria().getNome() + "</td>");
                                            out.println("<td>" + i.getAluno().getCurso().getNome() + "</td>");
                                            out.println("<td>" + i.getBolsa1().getNome() + "</td>");
                                            out.println("<td>" + i.getResultadoAnaliseDocumental() + "</td>");
                                            out.println("<td>" + i.getUsuarioAlterou() + "</td>");
                                            out.println("<td><a href='cadastrar.jsp?i_id=" + i.getId() + "&editar=1&analisado=1'><button  class='btn btn-warning os-icon os-icon-eye' type='button' > Editar Conferência dos Documentos</button></a></td>");
                                            out.println("</tr>");
                                        }
                                    }
                                %>
                            </table>  
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>