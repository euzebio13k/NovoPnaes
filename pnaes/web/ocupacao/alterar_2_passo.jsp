<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Ocupacao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.Uf"%>
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
                    <form id="formEmpresa" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEmpresa?opcao=alterar_2_passo&aluno_id=<%=session.getAttribute("aluno_id")%>" onload="mostraCampos()">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="carteira">Tem Carteira de Trabalho?*:</label>
                                <div class="col-md-9">
                                    <div class="input-group">
                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                            <%
                                                DecimalFormat decimal = new DecimalFormat();
                                                System.out.println("id da empresa = "+request.getParameter("id"));
                                                //Ocupacao ocupacao = daoFactory.getOcupacaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                                                Ocupacao ocupacao = new Ocupacao();
                                                System.out.println("empresa = "+ocupacao.getNomeEmpresa());
                                                if (ocupacao.getTemCarteira()) {
                                                    out.println("<input checked type='radio' name='carteira' id='carteirasim' value='sim' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='carteira' id='carteirasim' value='sim' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="carteirasim">Sim ou Extraviada&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>

                                        <div class="d-inline-block custom-control custom-radio">
                                            <%
                                                if (!ocupacao.getTemCarteira()) {
                                                    out.println("<input checked type='radio' name='carteira' id='carteiranao' value='nao' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='carteira' id='carteiranao' value='nao' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="carteiranao">Não</label>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="atividade">Sua Ocupação*:</label>
                                <div class="col-md-9">
                                    <select id="atividade" name="atividade" class="form-control" required onchange="mostraCampos();" oninvalid="setCustomValidity('Por favor, preencha a Sua Ocupação')">
                                        <option selected="" disabled="" value="">Selecione a sua Ocupação</option>
                                        <%
                                            if (ocupacao.getAtividade().equals("Desempregado")) {
                                                out.print("<option selected value='Desempregado'>Desempregado</option>");
                                            } else {
                                                out.print("<option value='Desempregado'>Desempregado</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Empregado CLT")) {
                                                out.print("<option selected value='Empregado CLT'>Empregado de Carteira Assinada</option>");
                                            } else {
                                                out.print("<option value='Empregado CLT'>Empregado de Carteira Assinada</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Trabalho sem carteira")) {
                                                out.print("<option selected value='Trabalho sem carteira'>Trabalho sem Carteira Assinada</option>");
                                            } else {
                                                out.print("<option value='Trabalho sem carteira'>Trabalho sem Carteira Assinada</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Autonomo")) {
                                                out.print("<option selected value='Autonomo'>Autônomo (Formal)</option>");
                                            } else {
                                                out.print("<option value='Autonomo'>Autônomo (Formal)</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Autonomoi")) {
                                                out.print("<option selected value='Autonomoi'>Autônomo (Informal)</option>");
                                            } else {
                                                out.print("<option value='Autonomoi'>Autônomo (Informal)</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Funcionanio Publico")) {
                                                out.print("<option selected value='Funcionanio Publico'>Funcionário Público (Contratado)</option>");
                                            } else {
                                                out.print("<option value='Funcionanio Publico'>Funcionário Público (Contratado)</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Servidor Publico")) {
                                                out.print("<option selected value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                            } else {
                                                out.print("<option value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Estagiario")) {
                                                out.print("<option selected value='Estagiario'>Estagiário</option>");
                                            } else {
                                                out.print("<option value='Estagiario'>Estagiário</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Aposentado")) {
                                                out.print("<option selected value='Aposentado'>Aposentado</option>");
                                            } else {
                                                out.print("<option value='Aposentado'>Aposentado</option>");
                                            }

                                            if (ocupacao.getAtividade().equals("Pensionista")) {
                                                out.print("<option selected value='Pensionista'>Pensionista</option>");
                                            } else {
                                                out.print("<option value='Pensionista'>Pensionista</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </div> 



                            <%
                                if (ocupacao.getAtividade().equals("Empregado CLT")
                                        || ocupacao.getAtividade().equals("Funcionario Publico")
                                        || ocupacao.getAtividade().equals("Servidor Publico")) {
                                    out.println("<div id='div3' class='show'>");
                                } else {
                                    out.println("<div id='div3' class='hide'>");
                                }
                            %>
                            <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Local de Trabalho</h4>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="nome">Nome do Local de Trabalho:</label>
                                <div class="col-md-9">
                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do Local de Trabalho" value="<%=ocupacao.getNomeEmpresa() != null ? ocupacao.getNomeEmpresa() : ""%>" 
                                           <%
                                               if (ocupacao.getNomeEmpresa() != null && !ocupacao.getNomeEmpresa().equals("")) {
                                                   out.print("required");
                                               }%>
                                           >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="telefone">Telefone do Local de Trabalho (DD 99999-9999):</label>
                                <div class="col-md-9">
                                    <input type="text" name="telefone" id="telefone"  class="form-control" pattern="[0-9]{2} [0-9]{4,6}[0-9]{3,4}$" placeholder="Telefone do Local de Trabalho DD 999999999" maxlength="12" OnKeyPress="formatar('## #########', this)" value="<%=ocupacao.getTelefone() != null ? ocupacao.getTelefone() : ""%>"
                                           <%
                                               if (ocupacao.getTelefone() != null && !ocupacao.getTelefone().equals("")) {
                                                   out.print("required");%>
                                           >
                                </div>
                            </div>
                        </div>
                        <div class="card-text">
                            Informe abaixo <strong>APENAS os seus ganhos.</strong>  Não cabe informar aqui a renda que será declarada dos membros familiares, apenas se você possuir mais de uma renda.
                        </div><br>
                        <%
                            if (ocupacao.getAtividade().equals("Desempregado")) {
                                out.println("<div id='div4' class='hide'>");
                            } else {
                                out.println("<div id='div4' class='show'>");
                            }
                        %>
                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="renda">Valor da Sua remuneração Bruta (R$ 0,00)*:</label>
                            <div class="col-md-9">
                                <input type="text" name="renda" id="renda"  value="<%=ocupacao.getRenda() != null && ocupacao.getRenda() > 0 ? "R$ " + decimal.format(ocupacao.getRenda()) : ""%>" class="form-control" placeholder="Valor da Sua Remuneração Bruta (R$ 0,00)" onKeyPress="return(moeda(this, '.', ',', event))" 
                                       <%
                                           if (ocupacao.getRenda() != null && ocupacao.getRenda() > 0) {
                                               out.print("required");
                                           }%>
                                       >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="orenda">Valor da outra renda Ex: Aluguel, Pensão Alimentícia, Bolsa Família, etc (R$ 0,00):</label>
                            <div class="col-md-9">
                                <input type="text" name="orenda" id="orenda" value="<%=ocupacao.getOrenda() != null && ocupacao.getOrenda() > 0 ? "R$ " + decimal.format(ocupacao.getOrenda()) : ""%>" class="form-control" placeholder="Valor da Outra Renda do Aluno (R$ 0,00)" onKeyPress="return(moeda(this, '.', ',', event))">
                            </div>
                        </div>
                        <div class="form-actions">
                            <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;

                            <button type="reset" value="Limpar"  class="btn btn-warning mr-1 os-icon os-icon-hash">
                                <i class="ft-x"></i> Limpar
                            </button>

                            <button type="submit" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar">
                                <i class="la la-check-square-o"></i> Salvar
                            </button>
                        </div>
                    </form>    
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>