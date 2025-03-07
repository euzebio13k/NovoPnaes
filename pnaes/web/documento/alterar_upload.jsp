<%-- 
    Document   : cadastrarPessoa
    Created on : 08/02/2018, 15:02:10
    Author     : ronan
--%>

<%@page import="java.io.File"%>
<%@page import="modelo.Edital"%>
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
                    <form action="../ServletUpload?aluno_id=<%=aluno.getId()%>&cpf=<%=session.getAttribute("cpf")%>&nedital=<%=edital.getNumero()%>&alterar=1" method="post" class="form form-horizontal" enctype="multipart/form-data">
                        <!-- Modal documentosAluno -->
                        <div class="modal fade" id="documentosAluno" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">Documentos do Aluno</h4> 
                                    </div>
                                    <div class="modal-body">
                                        <div style="text-align: center;">
                                            <iframe src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=edital.getNumero()%>/da.pdf" style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal documentosDependentes -->
                        <div class="modal fade" id="documentosDependentes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">Documentos dos Membros Familiares</h4> 
                                    </div>
                                    <div class="modal-body">
                                        <div style="text-align: center;">
                                            <iframe src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=edital.getNumero()%>/dp.pdf" style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal documentosRenda -->
                        <div class="modal fade" id="documentosRenda" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">Documentos que Comprovam a Renda</h4> 
                                    </div>
                                    <div class="modal-body">
                                        <div style="text-align: center;">
                                            <iframe src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=edital.getNumero()%>/dr.pdf" 
                                                    style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal documentosDespesas -->
                        <div class="modal fade" id="documentosDespesas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">Documentos que Comprovam as Despesas</h4> 
                                    </div>
                                    <div class="modal-body">
                                        <div style="text-align: center;">
                                            <iframe src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=edital.getNumero()%>/dd.pdf" 
                                                    style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal documentosOutros -->
                        <div class="modal fade" id="documentosOutros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">Outros Documentos</h4> 
                                    </div>
                                    <div class="modal-body">
                                        <div style="text-align: center;">
                                            <iframe src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=edital.getNumero()%>/od.pdf" 
                                                    style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-body">

                            <div class="form-group row">
                                <div class="col-md-4"></div>
                                <div class="col-md-3">
                                    <img src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg" width="150" height="200" class="img_aluno">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="foto">Alterar Foto* (png, jpg ou jpeg):</label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="target"></label>
                                    <input type="file" name="foto"  id="target" accept=".png,.jpg, .jpeg, .JPG, .PNG, .JPEG" class="custom-file-input" title="Foto">

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="da">Alterar Documentos do Aluno (pdf):
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosAluno">Visualizar Documentos do Aluno</button>
                                </label>
                                <div class="col-md-9">

                                    <label class="col-md-6 custom-file-label" for="da"></label>
                                    <input type="file" name="da"  id="da" class="custom-file-input" accept=".pdf, .PDF">

                                </div>
                            </div>
                            <%if(dependentes.size() > 0){%>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dp">Alterar Documentos dos Membros Familiares (pdf):
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosDependentes">Visualizar Documentos dos Membros Familiares</button>
                                </label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="dp"></label>
                                    <input type="file" name="dp" id="dp" class="custom-file-input" accept=".pdf, .PDF">                                                  
                                </div>
                            </div>
                            <%}%>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dr">Alterar Documentos que Comprovam a Renda (pdf):
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosRenda">Visualizar Documentos que Comprovam a Renda</button>
                                </label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="dr"></label>
                                    <input type="file" name="dr" id="dr" class="custom-file-input" accept=".pdf, .PDF">                                                  
                                </div>
                            </div>   
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dd">Alterar Documentos que Comprovam as Despesas (Ex: água, energia, telefone, aluguel etc.) (pdf):
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosDespesas">Visualizar Documentos que Comprovam as Despesas</button>
                                </label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="dd"></label>
                                    <input type="file" name="dd" id="dd" class="custom-file-input" accept=".pdf, .PDF">                                                  
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="od">Alterar Outros Documentos (Ex: Atestado Médico, Receita, Financiamentos etc.) (pdf):
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosOutros">Visualizar Outros Documentos</button>
                                </label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="od"></label>
                                    <input type="file" name="od" id="od" class="custom-file-input" accept=".pdf, .PDF">                                                  
                                </div>
                            </div>   
                            <div class="form-group row">


                                <div class="col-md-9">  
                                    <p>
                                        <input type="checkbox" name="aceito" id="cbaceito" value="aceito" required>

                                        Declaro que as informações prestadas no formulário online são verdadeiras e de minha inteira
                                        responsabilidade. Declarações falsas e/ou omissões implicam no cancelamento da inscrição ou
                                        perda automática do benefício concedido.
                                    </p>                                                  
                                </div>
                            </div>   
                            <div class="form-actions">

                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="submit" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar">
                                    <i class="la la-check-square-o"></i> Salvar
                                </button>
                            </div>
                        </div>                                                    
                    </form>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>