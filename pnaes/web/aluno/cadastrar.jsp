<%@page import="modelo.Campus"%>
<%@page import="modelo.Bolsa"%>
<%@page import="modelo.Categoria"%>
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
        <script type="text/javascript" >
            $(document).ready(function () {
                $('#campus').change(function () {
                    //$('#divcurso')[0].style.display="block";
                    //$('#divcurso').style.display = 'block';
                    $('#cat').load('/pnaes/categoriaajax.jsp?campus='+$('#campus').val());
                    $('#curso').html('<option selected="" disabled="" value="">Selecione primeiro a Modalidade do Curso ↑</option>');
                    //$('#periodo').html('<option selected="" disabled="" value="">Selecione primeiro o Curso ↑</option>');
                });

            });
            $(document).ready(function () {
                $('#cat').change(function () {
                    //$('#divcurso')[0].style.display="block";
                    //$('#divcurso').style.display = 'block';
                    $('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val()+'&campus='+$('#campus').val());
                    //$('#periodo').html('<option selected="" disabled="" value="">Selecione primeiro o Curso ↑</option>');
                });

            });
            $(document).ready(function () {
                $('#curso').change(function () {
                   // $('#divperiodo')[0].style.display="block";
                    //$('#periodo').load('/pnaes/periodoajax.jsp?curso=' + $('#curso').val());
                });

            });
            /*
            $(document).ready(function () {
                $('#periodo').change(function () {
                   // $('#divperiodo')[0].style.display="block";
                    if($('#periodo').val()==='1'){
                     document.getElementById('div_1_periodo').style.display = 'none';
                     $("#naoReprovou").prop("checked", true);
                    }else
                     document.getElementById('div_1_periodo').style.display = 'block';
                });

            });
            */
             function sReprovou() {
                document.getElementById('div_reprovou').style.display = 'block';
                document.getElementById('reprovou').value = "0";
                $("#reprovou").prop('required',true);
            }
            function nReprovou() {
                document.getElementById('div_reprovou').style.display = 'none';
                document.getElementById('reprovou').value = "";
                 $("#reprovou").prop('required',false);
            }
            
        </script>
    </head>
    <body>
        <div>            
            <main class="main-content">
                <%@include file="../cabecalho.jsp" %>    
                <h2>Minha home</h2>
                <div class="conteudo row">
                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=preencher&id=<%=session.getAttribute("aluno_id")%>" id="formAluno">
                        <div class="form-body">
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="campus">Campus*:</label>
                                <div class="col-md-9">
                                    <select id="campus" name="campus" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione o Campus:</option>
                                        <%
                                            List<Campus> campus = daoFactory.getCampusDao().listar();
                                            for (Campus c : campus) {
                                                out.print("<option value=" + c.getId() + ">" + c.getNome() + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="cat">Modalidade do Curso*:</label>
                                <div class="col-md-9">
                                    <select id="cat" name="cat" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione primeiro o Campus ↑</option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group row" >
                                <label class="col-md-3 label-control" for="curso">Curso*:</label>
                                <div class="col-md-9">
                                    <select id="curso" name="curso" class="form-control" required>
                                        <option selected="" disabled="" value="">Selecione primeiro a Modalidade do Curso ↑</option>
                                    </select>
                                </div>
                            </div>   


                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="periodo">Período:</label>
                                <div class="col-md-9">
                                    <select id="periodo" name="periodo" class="form-control">
                                        <option selected="" disabled="" value="">Selecione primeiro o Curso ↑</option>
                                        <option value="1">1 Ano/Modulo/Periodo</option>
                                        <option value="2">2 Ano/Modulo/Periodo</option>
                                        <option value="3">3 Ano/Modulo/Periodo</option>
                                        <option value="4">4 Periodo</option>
                                        <option value="5">5 Periodo</option>
                                        <option value="6">6 Periodo</option>
                                        <option value="7">7 Periodo</option>
                                        <option value="8">8 Periodo</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="transporte">Qual seu meio de Transporte para chegar até o IFTO*:</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="transporte" id="onibusgratuito" value="OnibusGratuito" class="custom-control-input" required>
                                            <label class="custom-control-label" for="onibusgratuito">Ônibus (Gratuito)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div> 
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="transporte" id="onibusPago" value="OnibusPago" class="custom-control-input" required>
                                            <label class="custom-control-label" for="onibusPago">Ônibus (Pago)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="transporte" id="carro" value="Carro" class="custom-control-input" required>
                                            <label class="custom-control-label" for="carro">Carro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="transporte" id="moto" value="Moto" class="custom-control-input" required>
                                            <label class="custom-control-label" for="moto">Moto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="transporte" id="bicicleta" value="Bicicleta" class="custom-control-input" required>
                                            <label class="custom-control-label" for="bicicleta">Bicicleta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="transporte" id="ape" value="A pé" class="custom-control-input" required>
                                            <label class="custom-control-label" for="ape">A pé&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="transporte" id="carona" value="Carona" class="custom-control-input" required>
                                            <label class="custom-control-label" for="carona">Carona</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="ensinoFundamental">Você cursou o Ensino Fundamental em Escola*:</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPu" value="Publico" class="custom-control-input" required>
                                            <label class="custom-control-label" for="ensinoFundamentalPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPa" value="Particular" class="custom-control-input" required>
                                            <label class="custom-control-label" for="ensinoFundamentalPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPp" value="Publica/Particular" class="custom-control-input" required>
                                            <label class="custom-control-label" for="ensinoFundamentalPp">Pública e Particular</label>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="ensinoMedio">Você cursou ou está cursando o Ensino Médio em Escola*:</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPu" value="Publico" class="custom-control-input" required>
                                            <label class="custom-control-label" for="ensinoMedioPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPa" value="Particular" class="custom-control-input" required>
                                            <label class="custom-control-label" for="ensinoMedioPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPp" value="Publica/Particular" class="custom-control-input" required>
                                            <label class="custom-control-label" for="ensinoMedioPp">Pública e Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="entrada">Como você ingressou no IFTO*:</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="entrada" id="entrada1" value="Ampla concorrencia" class="custom-control-input" required>
                                            <label class="custom-control-label" for="entrada1">Vestibular por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="entrada" id="entrada2" value="Cota" class="custom-control-input" required>
                                            <label class="custom-control-label" for="entrada2">Vestibular por cotas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="entrada" id="entrada3" value="Sisu" class="custom-control-input" required>
                                            <label class="custom-control-label" for="entrada3">Sisu por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="entrada" id="entrada4" value="SisuCota" class="custom-control-input" required>
                                            <label class="custom-control-label" for="entrada4">Sisu por cotas</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="div_1_periodo" class="">
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="reprovousimounao">Você reprovou em alguma disciplina no IFTO?*:</label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" name="reprovousimounao" id="naoReprovou" value="Nao" class="custom-control-input" onclick="nReprovou()" >
                                                <label class="custom-control-label" for="naoReprovou">Não&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" name="reprovousimounao" id="simReprovou" value="Sim" class="custom-control-input" onclick="sReprovou()" >
                                                <label class="custom-control-label" for="simReprovou">Sim</label>
                                            </div>

                                            <div id='div_reprovou' class='hide col-md-9'>
                                                <div class="col-md-9">
                                                    <div class="position-relative has-icon-left">
                                                        <div class="form-control-position">
                                                            <i class="fa fa-briefcase">Em Quantas Disciplinas Você Reprovou?(Entre 1 e 20)</i>
                                                        </div>
                                                        <input type="number" name="reprovou" id="reprovou" value="1" min="1" max="20">
                                                        <!--<input type="range" name="reprovou" id="reprovou" value="0" min="1" max="20" oninput="ageOutputId.value = reprovou.value">
                                                          <output name="ageOutputName" id="ageOutputId">0</output>-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="visita">Qual o melhor horário para uma visita, se necessário*:</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio" >
                                            <input type="radio" name="visita" id="visita1" value="Manha" class="custom-control-input" required>
                                            <label class="custom-control-label" for="visita1">Manhã&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="visita" id="visita2" value="Tarde" class="custom-control-input" required>
                                            <label class="custom-control-label" for="visita2">Tarde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="visita" id="visita3" value="Noite" class="custom-control-input" required>
                                            <label class="custom-control-label" for="visita3">Noite</label>
                                        </div>
                                    </div>
                                </div>
                            </div>     

                            <div class="form-actions right">
                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                    <i class="ft-x"></i> Limpar
                                </button>
                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                    <i class="fa fa-check-square-o"></i> Avançar
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