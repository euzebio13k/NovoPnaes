<%@page import="modelo.Dependente"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Ocupacao"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Aluno"%>
<%@page import="dao.DaoFactory"%>
<div style="margin-left: 20px">
    <%
        Boolean editalEncerrado = false;
        List<Despesa> despesas = daoFactory.getDespesaDao().perquisarPorAluno(alunoId);
        Edital edital = (Edital) daoFactory.getEditalDao().listar().get(0);
        Ocupacao ocupacao = new Ocupacao();
        ocupacao = (Ocupacao) daoFactory.getOcupacaoDao().perquisarPorAluno(alunoId).get(0);
        Despesa despesa = new Despesa();
        FichaMedica fichaMedica = new FichaMedica();
        Dependente dependente = new Dependente();
        List<Inscricao> ins = daoFactory.getInscricaoDao().perquisarAlunoPorEdital(alunoId, 1);
        List<FichaMedica> fichasMedicas = daoFactory.getFichaMedicaDao().perquisarPorAluno(alunoId);
        if (session.getAttribute("nivel").equals(1) || session.getAttribute("nivel").equals(3)) {
            //System.out.println(ocupacao.getId()+"- ocupacao = "+ocupacao.getNomeEmpresa());
    %>
    <br>
    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center">
                <div class="col-sm-8">
                    <div class="element-info-with-icon">
                        <div class="element-info-icon">
                            <div class="os-icon os-icon-wallet-loaded"></div>
                        </div>
                        <div class="element-info-text">
                            <h5 class="element-inner-header">
                                <% if (aluno.getCurso() != null) {%>
                                PNAES - IFTO - <i>Campus </i> <%=aluno.getCurso().getCampus().getNome()%>
                                <% } else { %> 
                                PNAES - IFTO
                                <% } %> 
                            </h5>
                            <div class="element-inner-desc">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xl-4">
                <div class="element-box">
                    <h5 class="form-header">
                        INFORMA��ES DO ESTUDANTE
                    </h5>
                    <div class="form-desc">
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">                     
                        <% if (aluno.getCurso() != null) {%>
                        <a href="/pnaes/aluno/alterar_1_Passo.jsp?id=<%=aluno.getId()%>"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button" >Alterar o 1� Passo&#10004;</button> </a>
                        <% } else { %>     
                        <a href="/pnaes/aluno/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">1� Passo</button> </a>
                        <% } %> 
                    </div>
                </div>
            </div>
            <% if (aluno.getCurso() != null) { %>       
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                OCUPA��O DO ESTUDANTE
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (ocupacao.getAtividade() != null) { %>
                                <a href="/pnaes/ocupacao/alterar.jsp?id=<%=ocupacao.getId()%>"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Alterar o 2� Passo&#10004;</button> </a>
                                <%  } else { %>   
                                <a href="/pnaes/ocupacao/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">2� Passo</button> </a>
                                <% }   %> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% }
            if (ocupacao.getAtividade() != null) { %>
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                INFORMA��ES DO GRUPO FAMILIAR
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>


                            <div class="element-box-content">
                                <%  if (aluno.getDependeciaFamiliar() != null) { %>
                                <a href="/pnaes/dependente/listar.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Alterar o 3� Passo&#10004;</button> </a>
                                <%  } else {%>
                                <a href="/pnaes/dependente/listar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">3� Passo</button> </a>
                                <% }   %> 
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <% }  %> 
        </div>
    </div>

    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center">
            </div>
        </div>
        <div class="row">
            <%  if (aluno.getDependeciaFamiliar() != null) { %>
            <div class="col-md-6 col-xl-3">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                MORADIA
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (aluno.getOndeReside() != null) { %>
                                <a href="/pnaes/moradia/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Alterar o 4� Passo&#10004;</button> </a>
                                <%  } else { %> 
                                <a href="/pnaes/moradia/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">4� Passo</button> </a>
                                <% }   %> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% }  %>
            <% if (aluno.getOndeReside() != null) { %>
            <div class="col-md-6 col-xl-3">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                SA�DE
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (fichasMedicas.size() > 0) { %>
                                <a href="/pnaes/fichaMedica/alterar_5_passo.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Alterar o 5� Passo&#10004;</button> </a>
                                <%  } else { %> 
                                <a href="/pnaes/fichaMedica/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">5� Passo</button> </a>
                                <% }   %>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% }   %>
            <% if (fichasMedicas.size() > 0) { %>
            <div class="col-md-6 col-xl-3">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                DESPESAS
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (despesas.size() > 0) { %>
                                <a href="/pnaes/despesa/alterar_6_passo.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Alterar o 6� Passo&#10004;</button> </a>
                                <%  } else { %> 
                                <a href="/pnaes/despesa/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">6� Passo</button> </a>
                                <% }   %>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%   }   %>
            <% if (despesas.size() > 0 && !editalEncerrado) { %>
            <div class="col-md-6 col-xl-3">
                <div class="element-box">
                    <h5 class="form-header">
                        ENVIAR DOCUMENTA��O
                    </h5>
                    <div class="form-desc">
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">
                        <% if (aluno.getStatusCadastro() == 6 || aluno.getStatusCadastro() == 8 || aluno.getStatusCadastro() == 7) { %>
                        <a href="/pnaes/documento/alterar_upload.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Alterar o 7� Passo&#10004;</button> </a>
                        <%  } else { %>
                        <a href="/pnaes/documento/upload.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">7� Passo</button> </a>
                        <% }   %> 
                    </div>
                </div>
            </div>
            <%
            } else if (despesas.size() > 0 && ins.size() > 0) { %>
            <div class="col-md-6 col-xl-3">
                <div class="element-box">
                    <h5 class="form-header">
                        ENVIAR DOCUMENTA��O
                    </h5>
                    <div class="form-desc">
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">
                        <% if (aluno.getStatusCadastro() == 6 || aluno.getStatusCadastro() == 8 || aluno.getStatusCadastro() == 7) { %>
                        <a href="/pnaes/documento/alterar_upload.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Alterar o 7� Passo&#10004;</button> </a>
                        <%  } else { %>
                        <a href="/pnaes/documento/upload.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">7� Passo</button> </a>
                        <% }   %> 
                    </div>
                </div>
            </div>
            <% } else if (editalEncerrado && aluno.getCurso() != null) {   %>
            <div class="col-md-6 col-xl-3">
                <div class="element-box">
                    <h5 class="form-header">
                        Todos os Editais Foram Encerrados
                    </h5>
                    <div class="form-desc">
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">
                        <!-- <a href="www.ifto.edu.br"> <button  class="mr-2 mb-2 btn btn-warningbtn-lg" type="button"> Lista de Editais Lan�ados</button> </a>-->
                    </div>
                </div>
            </div>
            <% }   %> 

        </div>
    </div>
    <% if ((aluno.getStatusCadastro() == 6 && !editalEncerrado)) {
    %>
    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center ">
            </div>
        </div>
        <div class="row" >
            <div class="col-md-8 col-xl-10 ">
                <div class="element-box" >
                    <h1 class="form-header text-center" >
                        <script>
                            function continuarInscricao() {
                                alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ATEN��O!</h5>', 'Ap�s a confirma��o n�o ser� poss�vel alterar os dados cadastrados, deseja continuar?', function () {
                                    window.location.href = "ServletAluno?id=<%=aluno.getId()%>&opcao=continuar_Inscricao";
                                }, function () {
                                    alertify.error('Continue alterando os dados');
                                }).set('labels', {ok: 'Confirmo', cancel: 'Voltar'});
                                ;
                            }
                        </script>
                        <!-- <a href="/pnaes/inscricao/inscricao.jsp"> <button  class="mr-2 mb-3 btn btn-primary btn-lg btn-block" type="button">Fazer inscri��o do (s) aux�lio (s)</button> </a>-->
                        <button  class="mr-2 mb-3 btn btn-primary btn-lg btn-block" type="button" onclick="continuarInscricao()">Fazer Pedido do (s) Aux�lio (s) para o Edital N� <%=edital.getNumeroEAno()%> - <i>Campus </i> </button>
                    </h1>
                </div>
            </div>
        </div>
    </div>
</div>
<% }   %>
<%
    }
%>
