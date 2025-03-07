<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Entrevista"%>
<%@page import="modelo.Bolsa"%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Dependente"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Inscricao"%>
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
        <link href="css/estilo.css" rel="stylesheet">
    </head>
    <body>
        <div class="conteiner-fluid">            
            <%@include file="menu.jsp" %>
            <main class="main-content">
                <%@include file="cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <% if (request.getParameter("analisado") != null) {%>
                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar_analise&i_id=<%=inscricao.getId()%>">
                        <% } else {%>
                        <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar&i_id=<%=inscricao.getId()%>">
                            <% } %>
                            <div class="form-body">

                                <div class="form-group row">
                                    <div class="col-md-3"><h6>Selecione os Documentos Faltantes:</h6>
                                        <div class="input-group" >
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="docPessoaisCand" value="Docs. Pessoais do Candidato" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="docPessoaisCand">Documentos Pessoais do Candidato</label>
                                            </div>
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="docPessoaisDeps" value="Docs. Pessoais do(s) Familiar(es)" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="docPessoaisDeps">Documentos Pessoais do(s) Familiar(es)</label>
                                            </div>
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="compAgua" value="Comp. de Água" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="compAgua">Comprovante de Água</label>
                                            </div>
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="compEnergia" value="Comp. de Energia" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="compEnergia">Comprovante de Energia</label>
                                            </div>
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="compTelefone" value="Comp. de Telefone" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="compTelefone">Comprovante de Telefone</label>
                                            </div>
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="compEnd" value="Comp. de Endereço" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="compEnd">Comprovante de Endereço</label>
                                            </div>
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="compRendaCand" value="Comp. de Renda do Estudante" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="compRendaCand">Comprovante de Renda do Estudante</label>
                                            </div>
                                            <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                <input type="checkbox" name="cbdf" id="compRendaDep" value="Comp. de Renda do(s) Familiar(es)" class="custom-control-input" onclick="soma()">
                                                <label class="custom-control-label" for="compRendaDep">Comprovante de Renda do(s) Familiar(es)</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <textarea  cols="30" rows="5" name="docf" id="docf"><%if (request.getParameter("analisado") != null && inscricao.getDocumentosFaltantes() != null) {
                                                out.print(inscricao.getDocumentosFaltantes());
                                            }%></textarea>
                                    </div>
                                </div>
                                <div class="card-header">
                                    <h6 class="card-title" id="striped-row-layout-icons">Observação da comissão:</h6>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                    </div>
                                    <textarea  cols="40" rows="5" name="observacaoAnaliseDocumental" id="observacaoAnaliseDocumental"><%if (request.getParameter("analisado") != null && inscricao.getObservacaoAnaliseDocumental() != null) {
                                            out.print(inscricao.getObservacaoAnaliseDocumental());
                                        }%></textarea>
                                </div>
                                <div class="card-header">
                                    <h6 class="card-title" id="striped-row-layout-icons">Observação para o Aluno:</h6>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                    </div>
                                    <textarea  cols="40" rows="5" name="observacaoAluno" id="observacaoAluno"><%if (request.getParameter("analisado") != null && inscricao.getObservacaoAluno() != null) {
                                            out.print(inscricao.getObservacaoAluno());
                                        }%></textarea>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <label class="col-md-12 label-control h4" for="resultadoAnalise">Resultado da Análise Documental:</label>
                                            <div class="col-md-12">
                                                <select id="resultadoAnalise" name="resultadoAnalise" class="form-control" required>
                                                    <option selected='' disabled='' value='' class="h6">Selecione o Resultado da Análise Documental</option>
                                                    <%
                                                        if (request.getParameter("analisado") != null && inscricao.getResultadoAnaliseDocumental() != null) {
                                                            if (inscricao.getResultadoAnaliseDocumental().equals("Classificado")) {
                                                                out.print("<option selected value='Classificado' >Classificado</option>");
                                                            } else {
                                                                out.print("<option value='Classificado'>Classificado</option>");
                                                            }

                                                            if (inscricao.getResultadoAnaliseDocumental().equals("Classificado com falta de documentos")) {
                                                                out.print("<option selected value='Classificado com falta de documentos'>Classificado com falta de Documentos</option>");
                                                            } else {
                                                                out.print("<option value='Classificado com falta de documentos'>Classificado com falta de Documentos</option>");
                                                            }

                                                            if (inscricao.getResultadoAnaliseDocumental().equals("Desclassificado por falta de Documento")) {
                                                                out.print("<option selected value='Desclassificado por falta de Documento'>Desclassificado por falta de Documento</option>");
                                                            } else {
                                                                out.print("<option value='Desclassificado por falta de Documento'>Desclassificado por falta de Documento</option>");
                                                            }

                                                        } else {%>
                                                    <option value="Classificado">Classificado</option>
                                                    <option value="Classificado com falta de documentos">Classificado com falta de Documentos</option>
                                                    <option value="Desclassificado por falta de Documento">Desclassificado por falta de Documento</option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="usuario" value="<%=session.getAttribute("nome")%> em: <%=date.format(dataAtual.getTime())%>">
                                <div class="form-actions right">
                                    <%if (request.getParameter("analisado") != null) {
                                            if (request.getParameter("analisado").equals("2")) {
                                    %>
                                    <a href="/pnaes/entrevista/horario.jsp?pb=<%=request.getParameter("pb")%>&pc=<%=request.getParameter("pc")%>&data=<%=request.getParameter("dataEntrevista")%>&local=<%=request.getParameter("local")%>"><button  class="btn btn-lg btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                    <%} else {%>
                                    <a href="/pnaes/documento/documento.jsp?analisado=1"><button  class="btn btn-lg btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                    <%}
                                                                    } else {%>
                                    <a href="/pnaes/documento/documento.jsp?analisado=1"><button  class="btn btn-lg btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                    <%}%>
                                    <%if (request.getParameter("analisado") != null) {%>
                                    <button type="submit" value="Cadastrar" class="btn btn-lg btn-primary os-icon os-icon-save">
                                        <i class="fa fa-check-square-o"></i> Alterar Análise Documental
                                    </button>
                                    <%} else {%>
                                    <button type="submit" value="Cadastrar" class="btn btn-lg btn-primary os-icon os-icon-save">
                                        <i class="fa fa-check-square-o"></i> Enviar
                                    </button>
                                    <%}%>
                                    <div class="form-group row"><br></div>
                                </div>
                            </div>
                        </form>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>