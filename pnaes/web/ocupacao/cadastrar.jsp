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
        <script>
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });
            });
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i);
                if (texto.substring(0, 1) !== saida) {
                    documento.value += texto.substring(0, 1);
                }
            }

            function mostraCampos() {
                if (document.getElementById('atividade').value === "Estagiario" ||
                        document.getElementById('atividade').value === "Empregado CLT" ||
                        document.getElementById('atividade').value === "Funcionanio Publico" ||
                        document.getElementById('atividade').value === "Servidor Publico") {
                    document.getElementById('div3').style.display = 'block';
                    $("#nome").prop('required', true);
                    $("#telefone").prop('required', true);
                } else {
                    document.getElementById('nome').value = "";
                    document.getElementById('telefone').value = "";
                    document.getElementById('renda').value = "";
                    $("#nome").prop('required', false);
                    $("#telefone").prop('required', false);
                    document.getElementById('div3').style.display = 'none';
                }
                if (document.getElementById('atividade').value === "Desempregado") {
                    document.getElementById('div4').style.display = 'none';
                    document.getElementById('renda').value = "";
                    $("#renda").prop('required', false);
                } else {
                    document.getElementById('div4').style.display = 'block';
                    $("#renda").prop('required', true);
                }
            }


            function verificaAtividade() {
                prencheuTudo = true;

                if (!verificaRadioChecadoPeloName('carteira')) {
                    document.getElementById('carteirasim').focus();
                    alertify.errorAlert("<h6 class='card-title'>Selecione uma opção no campo Tem Carteira de Trabalho.</h6>");
                    prencheuTudo = false;
                } else

                if (document.getElementById('atividade').value === "") {
                    document.getElementById('atividade').focus();
                    alertify.errorAlert("<h6 class='card-title'>Selecione uma opção no campo Sua Ocupação.</h6>");
                    prencheuTudo = false;
                }

                if (prencheuTudo)
                    document.getElementById("formEmpresa").submit();

            }
        </script> 

    </head>
    <body>
        <div>            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <%
                                            if (request.getParameter("msg") != null) {
                    %>
                    <center>
                        <div class="alert alert-danger" role="alert">
                            <strong><%=request.getParameter("msg")%></strong>
                        </div>
                    </center>
                    <%
                        }
                    %>
                    <center>

                        <form id="formEmpresa" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEmpresa?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>">
                            <div class="form-body">
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="carteira">Tem Carteira de Trabalho ?*:</label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <div class="d-inline-block custom-control custom-radio mr-1">
                                                <input type="radio" name="carteira" value="sim" class="custom-control-input" id="carteirasim" required>
                                                <label class="custom-control-label" for="carteirasim">Sim ou Extraviada&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            </div>
                                            <div class="d-inline-block custom-control custom-radio">
                                                <input type="radio" name="carteira" value="nao" class="custom-control-input" id="carteiranao" required>
                                                <label class="custom-control-label" for="carteiranao">Não</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="atividade">Sua Ocupação*:</label>
                                    <div class="col-md-9">
                                        <select id="atividade" name="atividade" class="form-control" required onchange="mostraCampos();">
                                            <option selected="" disabled="" value="">Selecione a Sua Ocupação</option>
                                            <option value="Desempregado">Desempregado</option>
                                            <option value="Empregado CLT">Empregado de Carteira Assinada</option>
                                            <option value="Trabalho sem carteira">Trabalho sem Carteira Assinada</option>
                                            <option value="Autonomo">Autônomo (Formal)</option>
                                            <option value="Autonomoi">Autônomo (Informal)</option>
                                            <option value="Funcionanio Publico">Funcionário Público (Contratado)</option>
                                            <option value="Servidor Publico">Servidor Público (Concursado)</option>
                                            <option value="Estagiario">Estagiário</option>
                                            <option value="Aposentado">Aposentado</option> 
                                            <option value="Pensionista">Pensionista</option> 
                                        </select>
                                    </div>
                                </div> 

                                <div id="div3" class="hide">
                                    <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Local de Trabalho</h4>
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control" for="nome">Nome do Local de Trabalho:</label>
                                        <div class="col-md-9">
                                            <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do Local de Trabalho" >
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control" for="telefone">Telefone do Local de Trabalho (DD 99999-9999):</label>
                                        <div class="col-md-9">
                                            <input type="tel" name="telefone" id="telefone"  class="form-control" placeholder="Telefone do Local de Trabalho DDD 999999999" maxlength="12" OnKeyPress="formatar('## #########', this)" pattern="[0-9]{2} [0-9]{4,6}[0-9]{3,4}$">
                                        </div>
                                    </div>
                                </div>

                                <div class="card-text">
                                    Informe abaixo <b>APENAS</b> os seus ganhos. <strong>Não</strong> cabe informar aqui a renda que será declarada dos membros familiares, apenas se você possuir mais de uma renda.
                                </div><br>
                                <div id='div4' class='hide'>
                                    <div class="form-group row">
                                        <label class="col-md-3 label-control" for="renda">Valor da Sua remuneração Bruta (R$ 0,00)*:</label>
                                        <div class="col-md-9">
                                            <input type="text" name="renda" id="renda"  value="" class="form-control" placeholder="Valor da Sua Remuneração Bruta (R$ 0,00)" onKeyPress="return(moeda(this, '.', ',', event))">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="orenda">Valor da outra renda Ex: Aluguel, Pensão Alimentícia, Bolsa Família, etc (R$ 0,00):</label>
                                    <div class="col-md-9">
                                        <input type="text" name="orenda" id="orenda" value="" class="form-control" placeholder="Valor da Outra Renda do Aluno (R$ 0,00)" onKeyPress="return(moeda(this, '.', ',', event))">
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                    <button type="reset" value="Limpar"  class="btn btn-warning mr-1 os-icon os-icon-hash">
                                        <i class="ft-x"></i> Limpar
                                    </button>
                                    <button type="submit" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar">
                                        <i class="la la-check-square-o"></i> Avançar
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