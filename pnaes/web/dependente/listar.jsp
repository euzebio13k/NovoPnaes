<%-- 
    Document   : listar
    Created on : 17/08/2018, 00:06:08
    Author     : euzebio
--%>
<%@page import="modelo.Dependente"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Aluno"%>
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
        <%@include file="../menu.jsp" %>
        <main class="main-content">
            <%@include file="../cabecalho.jsp" %>    
            <h2>Minha home</h2>
            <div class="conteudo row">
                <% if (request.getParameter("msg") != null) {%>
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="alert alert-success" role="alert">
                            <strong><%=request.getParameter("msg")%></strong>
                        </div>
                    </div>
                </div>
                <% }%>
                <% if (request.getParameter("msg2") != null) {%>
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="alert alert-danger" role="alert">
                            <strong><%=request.getParameter("msg2")%></strong>
                        </div>
                    </div>
                </div>
                <% }
                    List<Dependente> dependentes = daoFactory.getDependenteDao().perquisarPorAluno(alunoId);
                %>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title" id="striped-row-layout-icons">Informações do Grupo Familiar</h4>
                            </div>
                            <div class="card-body">
                                <form id="formGrupo" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=cadastrar_3_passo&id=<%=session.getAttribute("aluno_id")%>"> 
                                    <div class="form-group row border">
                                        <label class="col-md-3 label-control" for="moradia">Como Você Mora?*:</label>
                                        <div class="col-md-9">
                                            <div class="input-group">
                                                <div class="d-inline-block custom-control custom-radio mr-1">
                                                    <%
                                                        if (aluno.getMoradia() != null && aluno.getMoradia().equals("sozinho")) {
                                                            out.println("<input checked type='radio' name='moradia' id='sozinho' value='sozinho' class='custom-control-input' required onclick='eIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='moradia' id='sozinho' value='sozinho' class='custom-control-input' required onclick='eIndependente()'>");
                                                        }
                                                    %>
                                                    <label class="custom-control-label" for="sozinho">Sozinho&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                </div>
                                            </div>
                                            <div class="input-group">
                                                <div class="d-inline-block custom-control custom-radio">
                                                    <%
                                                        if (aluno.getMoradia() != null && aluno.getMoradia().equals("comFamilia")) {
                                                            out.println("<input checked type='radio' name='moradia' id='comFamilia' value='comFamilia' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='moradia' id='comFamilia' value='comFamilia' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        }
                                                    %>
                                                    <label class="custom-control-label" for="comFamilia">Com a Família&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                </div>
                                            </div>
                                            <div class="input-group">
                                                <div class="d-inline-block custom-control custom-radio">
                                                    <%
                                                        if (aluno.getMoradia() != null && aluno.getMoradia().equals("comTerceiros")) {
                                                            out.println("<input checked type='radio' name='moradia' id='comTerceiros' value='comTerceiros' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='moradia' id='comTerceiros' value='comTerceiros' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        }
                                                    %>

                                                    <label class="custom-control-label" for="comTerceiros">Com Terceiros (Amigos, Conhecidos, etc...)</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row border" >
                                        <label class="col-md-3 label-control" for="dependenciaFamiliar">Como se Configura a sua Relação de Dependência Financeira?*:</label>
                                        <div class="col-md-9">
                                            <div class="input-group" >
                                                <div class="d-inline-block custom-control custom-radio">
                                                    <%
                                                        if (aluno.getDependeciaFamiliar() != null && aluno.getDependeciaFamiliar().equals("indepTodas")) {
                                                            out.println("<input checked type='radio' name='dependenciaFamiliar' id='indepTodas' value='indepTodas' class='custom-control-input' required onclick='eIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='dependenciaFamiliar' id='indepTodas' value='indepTodas' class='custom-control-input' onclick='eIndependente()' required>");
                                                        }
                                                    %>

                                                    <label class="custom-control-label" for="indepTodas">É INDEPENDENTE financeiramente e responsável por todas as despesas domésticas &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                </div>
                                            </div>
                                            <div class="input-group" >
                                                <div class="d-inline-block custom-control custom-radio">
                                                    <%
                                                        if (aluno.getDependeciaFamiliar() != null && aluno.getDependeciaFamiliar().equals("indepParte")) {
                                                            out.println("<input checked type='radio' name='dependenciaFamiliar' id='indepParte' value='indepParte' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='dependenciaFamiliar' id='indepParte' value='indepParte' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        }
                                                    %>
                                                    <label class="custom-control-label" for="indepParte">É INDEPENDENTE financeiramente e responsável por parte das despesas doméstica &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                </div>
                                            </div>
                                            <div class="input-group" >
                                                <div class="d-inline-block custom-control custom-radio">
                                                    <%
                                                        if (aluno.getDependeciaFamiliar() != null && aluno.getDependeciaFamiliar().equals("depFamilia")) {
                                                            out.println("<input checked type='radio' name='dependenciaFamiliar' id='depFamilia' value='depFamilia' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='dependenciaFamiliar' id='depFamilia' value='depFamilia' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        }
                                                    %>
                                                    <label class="custom-control-label" for="depFamilia">DEPENDENTE financeiramente da renda dos pais&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                </div>
                                            </div>
                                            <div class="input-group" >
                                                <div class="d-inline-block custom-control custom-radio">
                                                    <%
                                                        if (aluno.getDependeciaFamiliar() != null && aluno.getDependeciaFamiliar().equals("depParentes")) {
                                                            out.println("<input checked type='radio' name='dependenciaFamiliar' id='depParentes' value='depParentes' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='dependenciaFamiliar' id='depParentes' value='depParentes' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        }
                                                    %>
                                                    <label class="custom-control-label" for="depParentes">DEPENDENTE financeiramente de outros parentes&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                </div>
                                            </div>
                                            <div class="input-group" >
                                                <div class="d-inline-block custom-control custom-radio">
                                                    <%
                                                        if (aluno.getDependeciaFamiliar() != null && aluno.getDependeciaFamiliar().equals("depTerceiros")) {
                                                            out.println("<input checked type='radio' name='dependenciaFamiliar' id='depTerceiros' value='depTerceiros' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        } else {
                                                            out.println("<input type='radio' name='dependenciaFamiliar' id='depTerceiros' value='depTerceiros' class='custom-control-input' required onclick='naoIndependente()'>");
                                                        }
                                                    %>
                                                    <label class="custom-control-label" for="depTerceiros">DEPENDENTE financeiramente de terceiros (Amigos, Conhecidos, etc...)</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </br>
                                    <%
                                        if (aluno.getDependeciaFamiliar() != null
                                                && aluno.getDependeciaFamiliar().equals("indepTodas")
                                                && aluno.getMoradia() != null
                                                && aluno.getMoradia().equals("sozinho")
                                                || (aluno.getDependeciaFamiliar() == null || aluno.getMoradia() == null)) {
                                    %>
                                    <div class="hide" id="tem_membro">
                                        <%} else {%>
                                        <div  id="tem_membro">
                                            <%}%>

                                            <div class="card-text" style="border-style: dashed; border-radius: 15px;">

                                                <div class="card-header">
                                                    <h4 class="card-title" id="striped-row-layout-icons">Lista de membros Familiares</h4>
                                                </div>
                                                DEVERÃO SER INCLUÍDOS SOMENTE os membros do grupo em que reside ou que possui relação de 
                                                dependência financeira.<br>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <a href="cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary " type="button">Incluir Membro Familiar</button></a>
                                                    </div>
                                                </div>                                                    
                                                <%
                                                    DataFormat dataFormat = new DataFormat();

                                                %>
                                                <table class="table table-striped table-responsive-md">
                                                    <tr>
                                                        <th>Nome</th>
                                                        <th>Data de Nascimento</th>
                                                        <th>Idade</th>
                                                        <th>Sexo</th>
                                                        <th>Telefone</th>
                                                        <th>Grau Parentesco</th>
                                                        <th>Alterar</th>
                                                        <th>Excluir</th>
                                                    </tr>
                                                    <%                    for (Dependente d : dependentes) {
                                                    %>
                                                    <tr>
                                                        <td><%=d.getNome()%></td>
                                                        <td><%=dataFormat.formatarData(d.getDtn())%></td>
                                                        <td><%=d.getIdade()%></td>
                                                        <td><%=d.getSexo()%></td>
                                                        <td><%=d.getTelefone()%></td>
                                                        <td><%
                                                            if (d.getGrauParentesco().equals("mae")) {
                                                                out.print("Mãe");
                                                            } else if (d.getGrauParentesco().equals("pai")) {
                                                                out.print("Pai");
                                                            } else if (d.getGrauParentesco().equals("madrasta")) {
                                                                out.print("Madrasta");
                                                            } else if (d.getGrauParentesco().equals("padastro")) {
                                                                out.print("Padastro");
                                                            } else if (d.getGrauParentesco().equals("filho")) {
                                                                out.print("Filho(a)");
                                                            } else if (d.getGrauParentesco().equals("esposo")) {
                                                                out.print("Esposo(a)");
                                                            } else if (d.getGrauParentesco().equals("avo")) {
                                                                out.print("Avó ou Avô");
                                                            } else if (d.getGrauParentesco().equals("primo")) {
                                                                out.print("Primo(a)");
                                                            } else if (d.getGrauParentesco().equals("tio")) {
                                                                out.print("Tio(a)");
                                                            } else if (d.getGrauParentesco().equals("outro")) {
                                                                out.print("Outro(Bisavós, Padrinhos, Amigos, ect...)");
                                                            } else {
                                                                out.print(d.getGrauParentesco());
                                                            }
                                                            %>
                                                        </td>
                                                        <td><a href="alterar.jsp?id=<%=d.getId()%>" title="Editar"><button class="mr-2 mb-2 btn btn-outline-info" type="button"><i class="os-icon os-icon-file-text">Editar</button></a></td>
                                                        <td><a href="excluir.jsp?id=<%=d.getId()%>" title="Excluir"><button class="mr-2 mb-2 btn btn-outline-danger" type="button"><i class="os-icon os-icon-close"></i>Excluir</button></a></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </table>  
                                            </div>
                                        </div> 
                                        </br>
                                        <div class="form-group row">
                                            <div class="col-md-3">
                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" value="Cadastrar" class="btn btn-primary os-icon os-icon-save" onclick="verificaGrupo();">
                                                    <i class="fa fa-check-square-o"></i> Salvar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>