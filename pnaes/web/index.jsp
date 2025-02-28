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
        <div>            
            <main class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 conteiner">
                    <img src="/pnaes/img/logotop.png">    
                    <h2>Sistema PNAES</h2>
                    <div class="conteudo">
                        <div class="form-desc" align="justify">
                            O Programa Nacional de Assistência Estudantil – PNAES no Instituto Federal de Educação, Ciência e Tecnologia (IFTO) 
                            consiste no conjunto de ações voltadas ao atendimento ao estudante regularmente matriculado no curso presencial, visando o acesso, a permanência e o 
                            êxito na perspectiva de inclusão social, produção de conhecimento, melhoria do desempenho escolar e qualidade de vida. Destina-se, prioritariamente,
                            aos estudantes oriundos de escola pública, em situação de vulnerabilidade social e econômica, com renda per capita de até um salário mínimo e meio, 
                            que se enquadram nos critérios definidos em Edital, em conformidade com o Regulamento PNAES do IFTO e o Decreto 7234/2010.            
                        </div>            
                        <h5 class="auth-header">Entre com o Usuario e Senha do SUAP</h5>
                        <%
                            if (request.getParameter("msg") != null) {
                        %>

                        <div class="alert alert-danger" role="alert">
                            <strong><%=request.getParameter("msg")%></strong>
                        </div>
                        <%
                            }
                        %>
                        <form method="POST" action="ServletLogin">
                            <div class="form-body">
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="login">Usuário</label>
                                    <div class="col-md-6">
                                        <input type="number" name="login" id="login" class="form-control" placeholder="Usuário (mesmo do SUAP)" maxlength="11" required>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="senha">Senha</label>
                                    <div class="col-md-6">
                                        <input type="password" name="senha" id="senha" class="form-control" placeholder="Senha (mesma do SUAP)" required>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" id="showPassword" title="teste" class="btn btn-warning btn-sm os-icon os-icon os-icon-eye" /><span> Mostrar Senha</span></button>
                                    </div>
                                </div>
                                <div class="buttons-w">
                                    <button type="submit" value="Entrar" class="btn btn-primary btn-lg os-icon os-icon-log-in"> Entrar</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>

                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>