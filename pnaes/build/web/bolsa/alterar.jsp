<%@page import="modelo.Edital"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <%    
                                                        Bolsa bolsa = (Bolsa) daoFactory.getBolsaDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    %>
                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletBolsa?opcao=alterar&id=<%=bolsa.getId()%>">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="edital">Edital:</label>
                                <div class="col-md-9">
                                    <select id="edital" name="edital" class="form-control" required>
                                        <option selected="" disabled="">Selecione o Edital</option>
                                        <%
                                          List<Edital> editals = daoFactory.getEditalDao().listar();
                                          out.print("<option selected value=" + bolsa.getEdital().getId() + ">" + bolsa.getEdital().getNumeroEAno() + "</option>");
                                            for (Edital c : editals) {
                                              //if(c.getId()!=aluno.getCurso().getCampus().getId())
                                              out.print("<option value=" + c.getId() + ">" + c.getNumeroEAno() + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="nome">Nome</label>
                                <div class="col-md-9">
                                    <input type="text" name="nome" id="nome" class="form-control" value="<%=bolsa.getNome()%>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="valor">Valor</label>
                                <div class="col-md-9">
                                    <input type="text" name="valor" id="valor" class="form-control" value="<%=bolsa.getValor()%>" required>
                                </div>
                            </div>
                            <div class="form-actions right">                                                                
                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                    <i class="fa fa-check-square-o"></i>Alterar
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
