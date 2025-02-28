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
        <script>

            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('/pnaes/cidadeajax.jsp?estado=' + $('#uf').val());
                });
            });

            $(function () {

                //Não Permite digitar letras
                $('#cpf').keyup(function () {
                    $(this).val(this.value.replace(/\D/g, ''));
                });
                $('#rg').keyup(function () {
                    $(this).val(this.value.replace(/\D/g, ''));
                });
            });

        </script>
    </head>
    <body>
        <div class="conteiner-fluid">            
            <%@include file="../menu.jsp" %>
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <%
                        if (request.getParameter("msg") != null) {
                                            
                    %>
                    <center>
                        <div class="alert alert-warning" role="alert">
                            <strong><%=request.getParameter("msg")%></strong>
                        </div>
                    </center>
                    <%
                        }
                    %>
                    <form method="Post" id="formPessoa" action="/pnaes/ServletAluno?opcao=cadastrar" class="form form-horizontal">
                        <input type="hidden" name="login"  id="login" class="form-control"  value="<%=request.getParameter("login")%>">
                        <div class="form-body">
                            <h4 class="form-section"><i class="ft-user"></i>Dados Pessoais</h4>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="nome">Nome Completo*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="cpf">CPF(Somente Números)*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF" maxlength="11"  required >                                                    
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="rg">Número do RG*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="ufe">Estado(UF) de Expedição do RG*:</label>
                                <div class="col-md-9">
                                    <select id="ufe" name="ufe" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione o Estado(UF) de Expedição do RG</option>
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
                                <label class="col-md-3 label-control" for="sexo">Sexo*:</label>
                                <div class="col-md-9">
                                    <div class="input-group">
                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                            <input type="radio" name="sexo" value="Masculino" class="custom-control-input" id="sexom" required>
                                            <label class="custom-control-label" for="sexom">Masculino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="d-inline-block custom-control custom-radio">
                                            <input type="radio" name="sexo" value="Feminino" class="custom-control-input" id="sexof" required>
                                            <label class="custom-control-label" for="sexof">Feminino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="d-inline-block custom-control custom-radio">
                                            <input type="radio" name="sexo" value="Indefinino" class="custom-control-input" id="sexoi" required>
                                            <label class="custom-control-label" for="sexoi">Indefinido</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="estadoCivil">Estado Civil*:</label>
                                <div class="col-md-9">
                                    <select id="estadoCivil" name="estadoCivil" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione o Estado Civil</option>
                                        <option value="Solteiro">Solteiro(a)</option>
                                        <option value="Casado">Casado(a)</option>
                                        <option value="Separado">Separado(a)</option>
                                        <option value="Divorciado">Divorciado(a)</option>
                                        <option value="Viúvo">Viúvo(a)</option> 
                                        <option value="Companheiro">Companheiro(a)</option>
                                    </select>
                                </div>
                            </div>        
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento* (dd/MM/yyyy):</label>
                                <div class="col-md-9">
                                    <input type="date" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" maxlength="10" OnKeyPress="formatar('##/##/####', this)" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="email">E-mail*:</label>
                                <div class="col-md-9">
                                    <input type="email" name="email" id="email"  class="form-control" placeholder="Email" required>
                                </div>
                            </div>                                                
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="telefone">Telefone* (DD999999999):</label>
                                <div class="col-md-9">
                                    <!-- <input type="tel" name="telefone" id="telefone"  class="form-control" placeholder="DD 999999999" maxlength="15"  pattern="[0-9]{2} [0-9]{4,6}[0-9]{3,4}$" required>-->
                                    <input type="tel" name="telefone" id="telefone"  class="form-control" placeholder="DD999999999" maxlength="11"  pattern="[0-9]{10,11}$" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="autoDeclaracao">Auto Declaração Cor/Raça*:</label>
                                <div class="col-md-9">
                                    <select id="autoDeclaracao" name="autoDeclaracao" class="form-control" required>
                                        <option selected="" disabled="" value=""> Selecione a sua Cor/Raça </option>
                                        <option value="Branco">Branco</option>
                                        <option value="Pardo">Pardo</option>
                                        <option value="Preto">Preto</option>
                                        <option value="Indígena">Indígena</option>
                                        <option value="Outra">Outra</option>   
                                    </select>
                                </div>
                            </div>        
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="matricula">Matricula (a mesma do SUAP)*:</label>
                                <div class="col-md-9">
                                    <div class="position-relative has-icon-left">
                                        <input type="hidden" name="matricula"  id="matricula" class="form-control"  value="<%=request.getParameter("login")%>">
                                        <input type="text" name="matricula" disabled id="matricula" class="form-control"  value="<%=request.getParameter("login")%>">
                                    </div>
                                </div>
                            </div>
                            <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Endereço</h4>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="logradouro">Logradouro(Rua, Avenida...)*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="logradouro" id="logradouro" class="form-control" placeholder="Logradouro(Rua, Avenida...)" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="numero">Número*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="numero" id="numero" class="form-control" placeholder="Numero" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="bairro">Bairro*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="bairro" id="bairro" class="form-control" placeholder="Bairro" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="complemento">Complemento:</label>
                                <div class="col-md-9">
                                    <input type="text" name="complemento" id="complemento" class="form-control" placeholder="Complemento">                                              </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="cep">CEP*:</label>
                                <div class="col-md-9">
                                    <input type="text" name="cep" id="cep" class="form-control" placeholder="CEP" maxlength="10" OnKeyPress="formatar('##.###-###', this)" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="uf">Estado (UF)*:</label>
                                <div class="col-md-9">
                                    <select id="uf" name="uf" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione o estado (UF)</option>
                                        <%
                                            List<Uf> ufs = daoFactory.getUfDao().listar();
                                            for (Uf uf : ufs) {
                                                out.print("<option value=" + uf.getId() + ">" + uf.getNome() + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="cidade">Cidade*:</label>
                                <div class="col-md-9">
                                    <select id="cidade" name="cidade" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione primeiro o estado (UF) ↑</option>

                                    </select>
                                </div>
                            </div>        

                        </div>
                        <div class="form-actions">
                            <button type="reset" value="Limpar"  class="btn btn-warning mr-1 os-icon os-icon-hash">
                                <i class="ft-x"></i> Limpar
                            </button>
                            <button type="submit" class="btn btn-primary os-icon os-icon-save"  name="cadastrar" value="Cadastrar">
                                <i class="la la-check-square-o"></i> Avançar
                            </button>
                        </div>                                                    
                    </form>

                </div>
            </main>
        </div>
        
                                                             
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>