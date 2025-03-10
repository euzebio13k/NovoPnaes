<%-- 
    Document   : entrevistar
    Created on : 17/05/2018, 08:17:06
    Author     : ronan
--%>

<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Dependente"%>
<%@page import="modelo.Bolsa"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Entrevista</title>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                        <div class="content-header-right col-md-6 col-12" >

                        </div>
                        <center>
                            <div style="width: 99%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Entrevistar</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Dados do Candidato para a Entrevista
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <%                                                                DataFormat dataFormat = new DataFormat();

                                                                //SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                                                Entrevista entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                                                                Inscricao inscricao = entrevista.getInscricao();
                                                                empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                                                fichaMedica = daoFactory.getFichaMedicaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                                                dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                                                List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                                                despesa = daoFactory.getDespesaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                                            %>
                                                            <%@include file="../inscricao/dadosInscricao.jsp" %>
                                                            <h3>Dados da Entrevista</h3>
                                                            <form class="form form-horizontal striped-rows form-bordered" method="POST" action="/pnaes/ServletEntrevista?opcao=alterarEntrevista&e_id=<%=entrevista.getId()%>">
                                                                <div class="form-body">
                                                                    <table class="table table-striped table-responsive-md">
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="concorrencia">Motivo que levou a concorrer o auxílio:</label></td>
                                                                            <td><textarea  cols="35" rows="7" name="concorrencia"><%=entrevista.getConcorrencia()%></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="caracterizacao">Caracterização Situacional:</label></td>
                                                                            <td><textarea  class="form-control" rows="7" name="caracterizacao"><%=entrevista.getCaracterizacao()%></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="df">Documentos Faltantes</label></td>
                                                                            <td><textarea  class="form-control" rows="7" name="df" maxlength="255"><%=entrevista.getInscricao().getDocumentosFaltantes()%></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="oa">Observações na Análise Documental</label></td>
                                                                            <td><textarea  class="form-control" rows="7" name="oa"><%=entrevista.getInscricao().getObservacaoAnaliseDocumental()%></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="participaProjetos">Participa de Projetos no IFTO:</label></td>
                                                                            <td><select id="resultado" name="participaProjetos" class="form-control">
                                                                                    <option selected value="<%=entrevista.getParticipaProjetos()%>"><%=entrevista.getParticipaProjetos()%></option>
                                                                                    <option value="Nenhum">Nenhum</option>
                                                                                    <option value="Pibid">PIBID</option>
                                                                                    <option value="Extensao">Extensão</option>
                                                                                    <option value="Residencia">Residência Pedagógica</option>
                                                                                    <option value="Monitoria">Monitoria</option>
                                                                                    <option value="Outro">Outro</option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="bolsaPermanente">Recebe Bolsa Permanência PBP/MEC?: </label></td>
                                                                            <td><select id="resultado" name="bolsaPermanente" class="form-control">
                                                                                    <option selected value="<%=entrevista.getBolsaPermanente()%>"><%=entrevista.getBolsaPermanente()%></option>
                                                                                    <option value="Sim">Sim</option>
                                                                                    <option value="Nao">Não</option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="outraBolsa">Recebe outro tipo de auxílio PNAES?: </label></td>

                                                                            <td><select id="resultado" name="outraBolsa" class="form-control" >
                                                                                    <option selected value="<%=entrevista.getOutraBolsa()%>"><%=entrevista.getOutraBolsa()%></option>
                                                                                    <option value="Sim">Sim</option>
                                                                                    <option value="Nao">Não</option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="vulnerabilidade">Vulnerabilidade Social</label></td>
                                                                            <td><select id="vulnerabilidade" name="vulnerabilidade" class="form-control" >
                                                                                    <option selected value="<%=entrevista.getVulnerabilidade()%>"><%=entrevista.getVulnerabilidade()%></option>
                                                                                    <option value="Alta">Alta</option>                                                                           
                                                                                    <option value="Media">Media</option>
                                                                                    <option value="Baixa">Baixa</option>
                                                                                    <option value="Fora de Vulnerabilidade ">Fora de Vulnerabilidade </option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="resultado">Resultado da Entrevista</label></td>
                                                                            <td><select id="resultado" name="resultado" class="form-control" >
                                                                                    <option selected value="<%=entrevista.getResultado()%>"><%=entrevista.getResultado()%></option>
                                                                                    <option value="Classificado">Classificado</option>                                                                           
                                                                                    <option value="Desclassificado por falta de documento">Desclassificado por falta de documento</option>
                                                                                    <option value="Desclassificado por não comparecer a Entrevista">Desclassificado por não comparecer a Entrevista</option>
                                                                                    <option value="Desclassificado">Desclassificado</option>
                                                                                </select></td>
                                                                        </tr>

                                                                    </table>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-6">

                                                            <div class="col-md-3">
                                                                <img src="/pnaes/alunos/<%=inscricao.getAluno().getCpf()%>/<%=inscricao.getAluno().getCpf()%>.jpg" width="150" height="200" alt="Clique para abrir" class="img_aluno">

                                                            </div>
                                                            <form class="form form-horizontal striped-rows form-bordered" method="POST" action="/pnaes/ServletEntrevista?opcao=finalizar&e_id=<%=entrevista.getId()%>">
                                                                <div class="form-body">
                                                                    <input type="hidden" name="dataEntrevista" value="<%=date.format(dataAtual.getTime())%>">
                                                                    <input type="hidden" name="entrevistador" value="<%=session.getAttribute("nome")%> em: <%=date.format(dataAtual.getTime())%>">

                                                                    <table class="table table-striped table-responsive-md">
                                                                        <tr>
                                                                            <th>Numero da Inscrição:</th>
                                                                            <td><%=entrevista.getInscricao().getId()%></td>
                                                                        </tr> 
                                                                        <tr>
                                                                            <th>Nome:</th>
                                                                            <td><%=entrevista.getInscricao().getAluno().getNome()%></td>
                                                                        </tr>

                                                                        <tr>
                                                                            <th>Vulnerabilidade</th>
                                                                            <td><%=entrevista.getVulnerabilidade() == null ? " - " : entrevista.getVulnerabilidade()%></td>
                                                                        </tr>
                                                                        <!--<td><script>document.write(formatarMoeda());</script></td>-->
                                                                        <tr>
                                                                            <th>Renda PerCapita</th>
                                                                            <td>R$ <%=decimal.format(perCapita)%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>1ª opção de Auxílio (Aluno)</th>
                                                                            <td><select id="bolsa1" name="bolsa1" class="form-control" required>
                                                                                    <%
                                                                                        out.print("<option value=" + entrevista.getInscricao().getBolsa1().getId() + ">" + entrevista.getInscricao().getBolsa1().getNome() + "</option>");

                                                                                    %>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Definir Auxílio 1</th>
                                                                            <td><select id="resultadoBolsa1" name="resultadoBolsa1" class="form-control" required>
                                                                                    <%                                                                                        List<Bolsa> bolsas = daoFactory.getBolsaDao().buscarBolsaPorEdital(edital.getId());
                                                                                        out.print("<option> -- </option>");
                                                                                        out.print("<option value='0'>Não Contemplado</option>");
                                                                                        for (Bolsa b : bolsas) {
                                                                                            out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");

                                                                                        }
                                                                                    %>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>2ª opção de Auxílio (Aluno)</th>
                                                                            <td><select id="bolsa2" name="bolsa2" class="form-control" required>
                                                                                    <%
                                                                                        out.print("<option value=" + entrevista.getInscricao().getBolsa2().getId() + ">" + entrevista.getInscricao().getBolsa2().getNome() + "</option>");

                                                                                    %>
                                                                                </select></td>    
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Definir Auxílio 2</th>
                                                                            <td>
                                                                                <select id="resultadoBolsa2" name="resultadoBolsa2" class="form-control" required>
                                                                                    <%                                                                                        out.print("<option> -- </option>");
                                                                                        out.print("<option value='0'>Não Contemplado</option>");
                                                                                        for (Bolsa b : bolsas) {
                                                                                            out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                                        }
                                                                                    %>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <a href="/pnaes/entrevista/listarEntrevista.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                <button type="submit" value="Salvar" class="btn btn-primary os-icon os-icon-save">
                                                                                    <i class="fa fa-check-square-o"></i> Salvar
                                                                                </button></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
