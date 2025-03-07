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
                    <div class="card-text">
                        Inscritos Analisados do Edital <%=edital.getNumeroEAno()%>
                    </div>
                    <table class="table table-hover table-responsive-sm dataTable" style="text-align: center;">
                        <thead class="thead-light">
                        <th>Nº da Inscricao</th>
                        <th>Aluno</th>
                        <th>Auxilio 1</th>
                        <th>Auxilio 2</th>
                        <th>Idade</th>
                        <th>Meio de Transporte</th>
                        <th>Modalidade</th>
                        <th>Curso</th>
                        <th>Periodo</th>
                        <th>Ensino Fundamental</th>
                        <th>Ensino Medio</th>
                        <th>Almoça no IFTO</th>
                        <th>Renda do Estudante</th>
                        <th>Renda Familiar</th>
                        <th>Despesa Familiar</th>
                        <th>Renda Percapita</th>
                        <th>Resultado da Análise Documental</th>
                        <th>Documentos Faltantes</th>
                        <th>Justificativa</th>
                        <th>Observação</th>

                        </thead>
                        <%                                                            
                            List<Inscricao> Inscricoes = daoFactory.getInscricaoDao().listarAnalisadosPorEdital(edital.getId());
                            int k;
                            Double rd = new Double(0);
                            for (Inscricao i : Inscricoes) {
                                empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(i.getAluno().getId());
                                despesa = daoFactory.getDespesaDao().perquisarClassePorAluno(i.getAluno().getId());
                                dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(i.getAluno().getId());
                                for(Dependente d: dependentes){
                                    rd =  rd + d.getRenda();
                                }
                                out.println("<tr>");
                                                                
                                out.println("<td>" + i.getId() + "</td>");
                                out.println("<td>" + i.getAluno().getNome() + "</td>");
                                out.println("<td>" + i.getBolsa1().getNome()+ "</td>");
                                out.println("<td>" + i.getBolsa2().getNome()+ "</td>");
                                out.println("<td>" + i.getAluno().getIdade()+ "</td>");
                                out.println("<td>" + i.getAluno().getMeioTransporte()+ "</td>");
                                out.println("<td>" + i.getAluno().getCurso().getCategoria().getNome()+ "</td>");
                                out.println("<td>" + i.getAluno().getCurso().getNome()+ "</td>");
                                out.println("<td>" + i.getAluno().getPeriodo()+" º "+ i.getAluno().getCurso().getTipoPeriodo() +"</td>");
                                out.println("<td>" + i.getAluno().getEnsinoFundamental()+ "</td>");
                                out.println("<td>" + i.getAluno().getEnsinoMedio()+ "</td>");
                                out.println("<td>" + i.getAlmocaIfto()+ "</td>");
                                out.println("<td>" + (empresa.getRenda()+empresa.getOrenda()) + "</td>");
                                out.println("<td>" + (empresa.getRenda()+empresa.getOrenda()+rd) + "</td>");
                                out.println("<td>" + despesa.getDespesaTotal() + "</td>");
                                out.println("<td>" + (empresa.getRenda()+empresa.getOrenda()+rd)/(dependentes.size()+1) + "</td>");
                                out.println("<td>" + i.getResultadoAnaliseDocumental() + "</td>");
                                out.println("<td>" + (i.getDocumentosFaltantes().equals("")?" - ":i.getDocumentosFaltantes())+ "</td>");
                                out.println("<td>" + i.getJustificativa()+ "</td>");
                                out.println("<td>" + i.getObservacaoAnaliseDocumental()+ "</td>");
                                                                
                                rd = 0.0;
                                out.println("</tr>");
                                                                
                            }
                        %>

                    </table> 
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>