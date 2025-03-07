<%-- 
    Document   : cadastrarPessoa
    Created on : 08/02/2018, 15:02:10
    Author     : ronan
--%>

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
                    <form action="../ServletUpload?aluno_id=<%=aluno.getId()%>&cpf=<%=session.getAttribute("cpf")%>&nedital=<%=edital.getNumero()%>" method="post" class="form form-horizontal" enctype="multipart/form-data" >
                        <div class="form-body">

                            <div class="form-group row">
                                <div class="col-md-4"></div>
                                <div class="col-md-3">
                                    <!--<img src="" width="150" height="200">-->
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="foto">Foto* (png, jpg ou jpeg):</label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="target"></label>
                                    <input type="file" name="foto" required id="target" accept=".png,.jpg, .jpeg, .JPG, .PNG, .JPEG"  class="custom-file-input " title="Foto">                                    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="da">Documentos do Aluno* (pdf):</label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="da"></label>
                                    <input type="file" name="da" required id="da" class="custom-file-input" accept=".pdf, .PDF" >                                                  
                                </div>
                            </div>
                            <%if(dependentes.size() > 0){%>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dp">Documentos dos Membros Familiares* (pdf):</label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="dp"></label>
                                    <input type="file" name="dp" id="dp" required class="custom-file-input" accept=".pdf, .PDF">                                                  
                                </div>
                            </div>
                            <%}%>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dr">Documentos que Comprovam a Renda* (pdf):</label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="dr"></label>
                                    <input type="file" name="dr" required id="dr" class="custom-file-input" accept=".pdf, .PDF" placeholder="Upload versão L">                                                  
                                </div>
                            </div>   
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dd">Documentos que Comprovam as Despesas  (Ex: água, energia, telefone, aluguel etc.) (pdf):</label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="dd"></label>
                                    <input type="file" name="dd" id="dd" class="custom-file-input" accept=".pdf, .PDF">                                                  
                                </div>
                            </div>  
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="od">Outros Documentos (Ex: Atestado Médico, Receita, Financiamentos etc.) (pdf):</label>
                                <div class="col-md-9">                                                    
                                    <label class="col-md-6 custom-file-label" for="od"></label>
                                    <input type="file" name="od" id="od" class="custom-file-input" accept=".pdf, .PDF">                                                  
                                </div>
                            </div>   
                            <div class="form-group row">


                                <div class="col-md-9">  
                                    <p align="justify">
                                        <input type="checkbox" name="aceito" id="cbaceito" value="aceito" required>

                                        Declaro que as informações prestadas no formulário online são verdadeiras e de minha inteira
                                        responsabilidade. 
                                        Declarações falsas e/ou omissões implicam no cancelamento da inscrição ou
                                        perda automática do benefício concedido.
                                    </p>                                                  
                                </div>
                            </div>   
                            <div class="form-actions">
                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;

                                <button type="submit" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar">
                                    <i class="la la-check-square-o"></i> Enviar
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