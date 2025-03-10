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
        <script src="../js/jquery.js" type="text/javascript" ></script>
        
    </head>
    <body>         
        <%@include file="../menu.jsp" %>
        <main class="main-content">
            <%@include file="../cabecalho.jsp" %>    
            <div class="card conteudo">
                <div class="card-header">
                    <h4 class="card-title" id="striped-row-layout-icons">Cadastro de Membro Familiar <%=request.getParameter("nomeAluno") != null ? " do Aluno " + request.getParameter("nomeAluno") : ""%></h4>
                </div>
                <div class="card-body">
                    <% if (request.getParameter("msg") != null) {%>
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="alert alert-danger" role="alert">
                                <strong><%=request.getParameter("msg")%></strong>
                            </div>
                        </div>
                    </div>
                    <% }%>
                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletDependente?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="nome">Nome do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do Membro Familiar" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="cpf">CPF do Membro Familiar:</label>
                                <div class="col-md-9">
                                    <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF do Membro Familiar" maxlength="11">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="rg">RG do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG do Membro Familiar">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="ufe">Uf de Expedição do RG*:</label>
                                <div class="col-md-9">
                                    <select id="ufe" name="ufe" class="form-control">
                                        <option selected="" disabled="" value="">Selecione a UF de Expedição</option>
                                        <%
                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                            for (Uf ufe : ufes) {
                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="sexo">Sexo do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <div class="input-group">
                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                            <input type="radio" name="sexo" value="Masculino" class="custom-control-input" id="sexom"  required>
                                            <label class="custom-control-label" for="sexom">Masculino</label>
                                        </div>
                                        <div class="d-inline-block custom-control custom-radio">
                                            <input type="radio" name="sexo" value="Feminino" class="custom-control-input" id="sexof"  required>
                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <input type="date" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" maxlength="10" OnKeyPress="formatar('##/##/####', this)"  required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="telefone">Telefone do Membro Familiar* (DD 999999999):</label>
                                <div class="col-md-9">
                                    <input type="tel" name="telefone" id="telefone"  class="form-control" placeholder="99 999999999" pattern="[0-9]{2} [0-9]{4,6}[0-9]{3,4}$" maxlength="12" OnKeyPress="formatar('## #########', this)"  required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="grauParentesco">Grau de Parentesco do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <select id="grauParentesco" name="grauParentesco" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione o Grau de Parentesco do Membro Familiar</option>
                                        <option value="mae">Mãe</option>
                                        <option value="pai">Pai</option>
                                        <option value="madrasta">Madrasta</option>
                                        <option value="padrasto">Padrastro</option>
                                        <option value="filho">Filho(a)</option>
                                        <option value="esposo">Esposo(a)</option>
                                        <option value="avo">Avó ou Avô</option>
                                        <option value="primo">Primo(a)</option>
                                        <option value="tio">Tio(a)</option>
                                        <option value="outro">Outro(Bisavós, Padrinhos, Amigos, ect...)</option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="atividade">Ocupação do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <select id="atividade" name="atividade" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione a Ocupação do Membro Familiar</option>
                                        <option value="Desempregado">Desempregado</option>
                                        <option value="Empregado CLT">Empregado de Carteira Assinada</option>
                                        <option value="Trabalho sem carteira">Trabalho sem Carteira Assinada</option>
                                        <option value="Autonomo">Autônomo (Formal)</option>
                                        <option value="Autonomoi">Autônomo (Informal)</option>
                                        <option value="Funcionanio Publico">Funcionario Público (Contratado)</option>
                                        <option value="Servidor Publico">Servidor Público (Concursado)</option>
                                        <option value="Aposentado">Aposentado</option> 
                                        <option value="Pensionista">Pensionista</option> 
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="renda">Renda Total Mensal do Membro Familiar (R$ 0,00)*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="renda" id="renda"  value="R$ 0.00" class="form-control" placeholder="Renda Total Mensal do Membro Familiar" onKeyPress="return(moeda(this, '.', ',', event))"  required>
                                </div>
                            </div>        
                            <div class="form-actions right">
                                <% if (request.getParameter("idAluno") == null) {%>
                                <a href="/pnaes/dependente/listar.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                <%} else {%>
                                <a href="/pnaes/documento/cadastrar.jsp?i_id=<%=request.getParameter("i_id")%>&editar=1"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                <%}%>
                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                    <i class="ft-x"></i> Limpar
                                </button>
                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                    <i class="fa fa-check-square-o"></i> Cadastrar
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>