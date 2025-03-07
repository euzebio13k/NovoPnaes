<%@page import="modelo.Inscricao"%>
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
        <link href="css/estilo.css" rel="stylesheet">
    </head>
    <body>
        <div class="conteiner-fluid">            
            <%@include file="menu.jsp" %>
            <main class="main-content">
                <%@include file="cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <table class="table table-striped table-responsive-md dataTable" style="text-align: center;">
                                                        <thead>
                                                            <th>Nº da Inscricao</th>
                                                            <th>Aluno</th>
                                                            <th>Resultado da Análise Documental</th>
                                                            <th>Documentos Faltantes</th>
                                                            <th>Observação</th>
                                                            
                                                    </thead>
                                                        <%                                                            
                                                            List<Inscricao> Inscricoes = daoFactory.getInscricaoDao().listarAnalisadosPorEdital(edital.getId());
                                                            for (Inscricao i : Inscricoes) {
                                                                out.println("<tr>");
                                                                out.println("<td>" + i.getId() + "</td>");
                                                                out.println("<td>" + i.getAluno().getNome() + "</td>");
                                                                out.println("<td>" + i.getResultadoAnaliseDocumental() + "</td>");
                                                                out.println("<td>" + (i.getDocumentosFaltantes().equals("")?" - ":i.getDocumentosFaltantes())+ "</td>");
                                                                out.println("<td>" + i.getObservacaoAnaliseDocumental()+ "</td>");
                                                                
                                                                    }
                                                                %>
                                                        
                                                        <tfoot>
                                                            <th>Nº da Inscricao</th>
                                                            <th>Aluno</th>
                                                            <th>Documentos Faltantes</th>
                                                            <th>Resultado da Análise Documental</th>
                                                        </tfoot>
                                                    </table>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>