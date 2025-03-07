<%@page import="modelo.Ocupacao"%>
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
        <div>            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <%                
    Integer id = Integer.parseInt(request.getParameter("id"));
    Ocupacao ocupacao = daoFactory.getOcupacaoDao().pesquisarPorId(id);
                    %>
                    <form class="form form-horizontal striped-rows form-bordered" method="POST"
                          action="../ServletOcupacao?opcao=alterar&id=<%=id%>">
                        <div class="form-body">

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="nome">Nome</label>
                                <div class="col-md-9">
                                    <input type="text" name="nomeEmpresa" value="<%=ocupacao.getNomeEmpresa()%>"
                                           id="nome" class="form-control" placeholder="Nome da Empresa">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="telefone">Telefone</label>
                                <div class="col-md-9">
                                    <input type="text" name="telefone" value="<%=ocupacao.getTelefone()%>"
                                           id="telefone" class="form-control" placeholder="Telefone">
                                </div>
                            </div>
                            
                            <div class="form-actions">
                                <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                    <i class="ft-x"></i> Limpar
                                </button>
                                <button type="submit" class="btn btn-primary" name="cadastrar"
                                        value="Cadastrar">
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