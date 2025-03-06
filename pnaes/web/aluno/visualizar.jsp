<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Aluno"%>
<%@page import="util.DataFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="../css/estilo.css" rel="stylesheet">
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
        </script>
    </head>
    <body>
        <div>            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <div class="card">
                        <% 
                            DataFormat dataFormat = new DataFormat();
                            DecimalFormat decimal = new DecimalFormat();
                            alunoId = Integer.parseInt(request.getParameter("id"));
                            aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(alunoId);
                            Despesa despesa = daoFactory.getDespesaDao().perquisarPorAluno(alunoId).get(0);
                            //Inscricao inscricao =  (Inscricao) daoFactory.getInscricaoDao().perquisarClassePorAluno(alunoId);
                            // List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().perquisarListaPorAluno(alunoId);
                            Empresa empresa = daoFactory.getEmpresaDao().perquisarPorAluno(alunoId).get(0);
                            FichaMedica fichaMedica = daoFactory.getFichaMedicaDao().perquisarPorAluno(alunoId).get(0);
                            List<Dependente> dependentes = daoFactory.getDependenteDao().perquisarPorAluno(alunoId);
                        %>

                        <div class="card-header">
                            <h4 class="card-title" id="striped-row-layout-icons">Dados do Aluno: <%=aluno.getNome()%></h4>
                            <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                            <div class="heading-elements">
                            </div>
                        </div>
                    </div><br>

                    <%@include file="../aluno/dadosAluno.jsp" %>
                    <br>
                    <div class="form-actions center">
                        <a href="/pnaes/aluno/listar.jsp">
                            <button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                    </div>   
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>