<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.OrcamentoMensal"%>
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
        <link href="../css/estilo.css" rel="stylesheet">
    </head>
    <body>
        <div class="conteiner-fluid">            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar&i_id=<%=inscricao.getId()%>">
                        <div class="form-body">

                            <div class="form-group row">
                                <div class="col-md-9">
                                    <div class="input-group">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="cbrg" id="cbrg" value="" class="custom-control-input">
                                            <label class="custom-control-label" for="cbrg">RG</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="cbcpf" id="cbcpf" value="" class="custom-control-input">
                                            <label class="custom-control-label" for="cbcpf">CPF</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="cbendereco" id="cbendereco" value="" class="custom-control-input">
                                            <label class="custom-control-label" for="cbendereco">Comprovante de Endereco</label>
                                        </div>                                                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-9">
                                    <div class="input-group">
                                        <label class="col-md-3 label-control" for="resultado">Resultado</label>
                                        <div class="col-md-9">
                                            <select id="resultado" name="resultado" class="form-control" required>
                                                <option selected="" disabled="">Selecione o Resultado</option>
                                                <option value="Classificado">Classificado</option>
                                                <option value="Classificado com falta de documentos">Classificado com falta de documentos</option>
                                                <option value="Eliminado">Eliminado</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions right">
                                <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                    <i class="ft-x"></i> Limpar
                                </button>
                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                    <i class="fa fa-check-square-o"></i>Enviar
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