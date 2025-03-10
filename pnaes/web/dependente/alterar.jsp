<%-- 
    Document   : cadastrarDependente
    Created on : 12/02/2018, 06:29:44
    Author     : ronan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
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
                    <% }
                                                            DataFormat dataFormat = new DataFormat();
                                                            DecimalFormat decimal = new DecimalFormat();
                                                            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
                                                            Integer id = Integer.parseInt(request.getParameter("id"));
                                                            Dependente dependente = daoFactory.getDependenteDao().pesquisarPorId(id);
                                                             // out.println("DATA: "+formatador.format(dependente.getDtn().getTime()));
                                                           
                    %>
                    <form  class="form form-horizontal striped-rows form-bordered" method="Post" action="../ServletDependente?opcao=alterar&id=<%=dependente.getId()%>">    <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="nome">Nome do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="nome" id="nome" class="form-control" value="<%=dependente.getNome()%>" placeholder="Nome do Membro Familiar" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="cpf">CPF do Membro Familiar:</label>
                                <div class="col-md-9">
                                    <input type="text" name="cpf" id="cpf" class="form-control" value="<%=dependente.getCpfd()!=null?dependente.getCpfd():""%>" maxlength="11"  placeholder="CPF do Membro Familiar">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="rg">RG do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="rg" id="rg"  class="form-control" value="<%=dependente.getRg()%>" placeholder="RG do Membro Familiar">
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
                                                if(dependente.getUfExpedicao()!=null)
                                                out.print("<option selected value=" + dependente.getUfExpedicao().getId()+ ">" + dependente.getUfExpedicao().getNome() + "</option>");
                                                                                
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
                                        <div class="custom-control custom-radio">                                                                           
                                            <%
                                                if(dependente.getSexo().equals("Masculino")){
                                                    out.println("<input checked type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom' required>");                                         
                                                }else{
                                                    out.println("<input type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="sexom">Masculino</label>
                                        </div>
                                        <div class="d-inline-block custom-control custom-radio">
                                            <%
                                                if(dependente.getSexo().equals("Feminino")){
                                                    out.println("<input checked type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof' required>");                                         
                                                }
                                                else{
                                                    out.println("<input type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <input type="date" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" value="<%=formatador.format(dependente.getDtn().getTime())%>" maxlength="10" OnKeyPress="formatar('##/##/####', this)" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="telefone">Telefone do Membro Familiar (DD999999999):</label>
                                <div class="col-md-9">
                                    <input type="tel" name="telefone" id="telefone"  class="form-control" value="<%=dependente.getTelefone()%>"  maxlength="14" placeholder="Telefone do Membro Familiar">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="grauParentesco">Grau de Parentesco do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <select id="grauParentesco" name="grauParentesco" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione o Grau de Parentesco do Membro Familiar</option>
                                        <%
                                        if(dependente.getGrauParentesco().equals("mae"))
                                        out.print("<option selected value='mae'>Mãe</option>");
                                        else
                                        out.print("<option value='mae'>Mãe</option>");
                                                                        
                                        if(dependente.getGrauParentesco().equals("pai"))
                                        out.print("<option selected value='pai'>Pai</option>");
                                        else
                                        out.print("<option value='pai'>Pai</option>");
                                                                        
                                        if(dependente.getGrauParentesco().equals("filho"))
                                        out.print("<option selected value='filho'>Filho(a)</option>");
                                        else
                                        out.print("<option value='filho'>Filho(a)</option>");
                                                                        
                                        if(dependente.getGrauParentesco().equals("esposo"))
                                        out.print("<option selected value='esposo'>Esposo(a)</option>");
                                        else
                                        out.print("<option value='esposo'>Esposo(a)</option>");
                                                                        
                                        if(dependente.getGrauParentesco().equals("avo"))
                                        out.print("<option selected value='avo'>Avó ou Avô</option>");
                                        else
                                        out.print("<option value='avo'>Avó ou Avô</option>");
                                                                        
                                        if(dependente.getGrauParentesco().equals("primo"))
                                        out.print("<option selected value='primo'>Primo(a)</option>");
                                        else
                                        out.print("<option value='primo'>Primo(a)</option>");
                                                                        
                                        if(dependente.getGrauParentesco().equals("outro"))
                                        out.print("<option selected value='outro'>Outro(Bisavós, Padrinhos, Amigos, ect...)</option>");
                                        else
                                        out.print("<option value='outro'>Outro(Bisavós, Padrinhos, Amigos, ect...)</option>");
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="atividade">Ocupação do Membro Familiar*:</label>
                                <div class="col-md-9">
                                    <select id="atividade" name="atividade" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione a Ocupação do Membro Familiar</option>
                                        <%
                                        if(dependente.getAtividadeProf().equals("Desempregado"))
                                        out.print("<option selected value='Desempregado'>Desempregado</option>");
                                        else
                                        out.print("<option value='Desempregado'>Desempregado</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Empregado CLT"))
                                        out.print("<option selected value='Empregado CLT'>Empregado de Carteira Assinada</option>");
                                        else
                                        out.print("<option value='Empregado CLT'>Empregado de Carteira Assinada</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Trabalho sem carteira"))
                                        out.print("<option selected value='Trabalho sem carteira'>Trabalho sem Carteira Assinada</option>");
                                        else
                                        out.print("<option value='Trabalho sem carteira'>Trabalho sem Carteira Assinada</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Autonomo"))
                                        out.print("<option selected value='Autonomo'>Autônomo (Formal)</option>");
                                        else
                                        out.print("<option value='Autonomo'>Autônomo (Formal)</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Autonomoi"))
                                        out.print("<option selected value='Autonomoi'>Autônomo (Informal)</option>");
                                        else
                                        out.print("<option value='Autonomoi'>Autônomo (Informal)</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Funcionanio Publico"))
                                        out.print("<option selected value='Funcionanio Publico'>Funcionario Público (Contratado)</option>");
                                        else
                                        out.print("<option value='Funcionanio Publico'>Funcionario Público (Contratado)</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Servidor Publico"))
                                        out.print("<option selected value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                        else
                                        out.print("<option value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Aposentado"))
                                        out.print("<option selected value='Aposentado'>Aposentado</option>");
                                        else
                                        out.print("<option value='Aposentado'>Aposentado</option>");
                                                                        
                                        if(dependente.getAtividadeProf().equals("Pensionista"))
                                        out.print("<option selected value='Pensionista'>Pensionista</option>");
                                        else
                                        out.print("<option value='Pensionista'>Pensionista</option>");
                                        %>
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="renda">Renda Total Mensal do Membro Familiar (R$ 0,00):</label>
                                <div class="col-md-9">
                                    <input type="text" name="renda" id="renda" class="form-control" value="<%=dependente.getRenda()!=null?"R$ "+decimal.format(dependente.getRenda()):""%>" placeholder="Renda Total Mensal do Membro Familiar" required onKeyPress="return(moeda(this, '.', ',', event))">
                                </div>
                            </div>
                            <div class="form-actions right">
                                <a href="/pnaes/dependente/listar.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                    <i class="ft-x"></i> Limpar
                                </button>
                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                    <i class="fa fa-check-square-o"></i> Alterar
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