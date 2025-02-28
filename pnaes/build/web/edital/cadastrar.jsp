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
        <link href="../css/estilo.css" rel="stylesheet">
    </head>
    <body>
        <div class="conteiner-fluid">            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Lista de Editais</h2>
                <div class="conteudo row">
                    <div class="col-md-10">
                        <fieldset>
                         

                            <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEdital?opcao=cadastrar">
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control" for="numero">Numero do edital:</label>
                                        <div class="col-md-9">
                                            <input type="text" name="numero" id="numero" class="form-control" placeholder="Numero do Edital">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control" for="dataInicial">Data de Abertura:</label>
                                        <div class="col-md-9">
                                            <input type="date" name="dataInicial" id="dataInicial" class="form-control" placeholder="dd/MM/yyyy" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control label" for="dataFinal">Data de Encerramento:</label>
                                        <div class="col-md-9">
                                            <input type="date" name="dataFinal" id="dataFinal" class="form-control" placeholder="dd/MM/yyyy" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
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
                        </fieldset>
                    </div>

                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
</html>