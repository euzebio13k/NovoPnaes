<%@page import="modelo.Curso"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Edital"%>
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
        <script src="../js/jquery.js" type="text/javascript" ></script>
    </head>
    <body>
        <div>            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <div class="row">
                        <!--<div class="col-md-3">
                            <a href="/pnaes/aluno/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Cadastar Aluno</button></a>
                        </div>-->
                        <div class="col-md-12">
                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                <div class="form-body">
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control" for="pCat">Pesquisa por Modalidade</label>
                                        <div class="col-md-4">
                                            <select name="pCategoria" id="cat" class="form-control">
                                                <option selected="" disabled="">Selecione a Modalidade ↓</option>
                                                <%                                                    List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                    for (Categoria c : categorias) {
                                                        out.print("<option value=" + c.getId() + ">" + c.getNome() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control" for="pesquisa">Pesquisa por Curso</label>
                                        <div class="col-md-4">
                                            <select name="pCurso" id="curso" class="form-control">
                                                <option selected="" disabled="">Selecione primeiro a Modalidade do Curso ↑</option>

                                            </select>
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" value="Cadastrar" class="btn btn-primary btn-lg">
                                                <i class="fa fa-check-square-o"></i>Buscar
                                            </button>&nbsp;

                                        </div>
                                        <div class="col-md-2">
                                            <a href="/pnaes/aluno/listar.jsp"> <button type="button" value="Limpar" class="btn btn-danger">
                                                    <i class="fa fa-check-square-o"></i>Limpar Busca/Filtro
                                                </button></a>
                                            <div style="margin: 25px 50px 75px 100px;">
                                                <!-- <button class="btn btn-primary" onclick="generate()">
                                                    <i class="fa fa-check-square-o"></i>Gerar PDF
                                                </button>-->
                                            </div>
                                        </div>    
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                        List<Aluno> alunos = daoFactory.getAlunoDao().listarAlunosPorCampus(aluno.getCurso().getCampus().getId());
                        if (request.getParameter("pCategoria") != null && request.getParameter("pCurso") == null) {
                            alunos = daoFactory.getAlunoDao().listarAlunosPorCategoria(Integer.parseInt(request.getParameter("pCategoria")));
                        } else if (request.getParameter("pCurso") != null && request.getParameter("pCategoria") != null) {
                            alunos = daoFactory.getAlunoDao().listarAlunosPorCurso(Integer.parseInt(request.getParameter("pCurso")));
                        }
                    %>                     
                    <table class="table table-hover table-responsive-sm" id="tabelaAlunos">
                        <thead class="thead-light" align="center">
                            <tr>
                                <th>Nome</th>
                                <th>CPF</th>
                                <th>Idade</th>
                                <th>Telefone</th>
                                <th>Email</th>
                                <th>Matricula</th>
                                <th>Modalidade</th>
                                <th>Curso</th>
                                    <%if (session.getAttribute("nivel").equals(3)) {%>
                                <th>Editar</th>
                                    <%}%>
                                <th>Vizualizar</th>
                            </tr>
                        </thead>
                        <%
                            for (Aluno a : alunos) {
                                if (a.getCurso() != null) {
                        %>
                        <tr align="center">

                            <td><%=a.getNome()%></td>
                            <td><%=a.getCpf()%></td>
                            <td><%=a.getIdade()%></td>
                            <td><%=a.getTelefone()%></td>
                            <td><%=a.getEmail()%></td>
                            <td><%=a.getMatricula()%></td>
                            <td><%=a.getCurso().getCategoria().getNome()%></td>
                            <td><%=a.getCurso().getNome()%></td>
                            <%if (session.getAttribute("nivel").equals(3)) {%>

                            <td><a href="/pnaes/aluno/alterar.jsp?id=<%=a.getId()%>" title="Editar" class="text-info"><div class="os-icon os-icon-edit"></div><span>Editar</span></a></td>
                                        <%}%>
                            <td><a href="/pnaes/aluno/visualizar.jsp?id=<%=a.getId()%>"><img src="/pnaes/alunos/<%=a.getCpf()%>/<%=a.getCpf()%>.jpg" width="30" height="40"/></a></td>
                        </tr>
                        <%
                                }
                            }
                        %>

                    </table>    
                </div>
            </main>
        </div>
        <script type="text/javascript" >

            $(document).ready(function () {
                $('#cat').change(function () {
                    $('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val() + '&campus=<%=aluno.getCurso().getCampus().getId()%>');
                    //$('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val()+'&campus=1');
                });

            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>