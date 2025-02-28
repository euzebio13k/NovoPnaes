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
                         <%                                        DataFormat dataFormat = new DataFormat();
                                        Edital edital = (Edital) daoFactory.getEditalDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                                    %>
                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEdital?opcao=alterar&id=<%=edital.getId()%>">
                                        <div class="form-body">
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="numero">Numero</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="numero" id="numero" class="form-control" value="<%=edital.getNumero()%>" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dataInicial">Data de Abertura</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="dataInicial" id="dataInicial" class="form-control" value="<%=dataFormat.formatarData(edital.getDataInicial())%>" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dataFinal">Data de Encerramento</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="dataFinal" id="dataFinal" class="form-control" value="<%=dataFormat.formatarData(edital.getDataFinal())%>" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                </div>
                                            </div>
                                            <div class="form-actions right">
                                                <a href="/pnaes/edital/listar.jsp"><button  class="btn btn-success" type="button" >Voltar</button></a>&nbsp;
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