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
        <link href="../css/estilo.css" rel="stylesheet">
    </head>
    <body>
        <div class="conteiner-fluid">            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletBolsa?opcao=cadastrar">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="edital">Edital</label>
                                <div class="col-md-9">
                                    <select id="campus" name="edital" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione o Edital:</option>
                                        <%                                            
                                            List<Edital> editals = daoFactory.getEditalDao().listar();
                                            for (Edital e : editals) {
                                                if (e.ativo().equals("Aberto")) {
                                                    out.print("<option value=" + e.getId() + ">" + e.getNumero() + "</option>");
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="nome">Nome</label>
                                <div class="col-md-9">
                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do auxílio" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="valor">Valor</label>
                                <div class="col-md-9">
                                    <input type="text" name="valor" id="valor" class="form-control" placeholder="Valor" required>
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