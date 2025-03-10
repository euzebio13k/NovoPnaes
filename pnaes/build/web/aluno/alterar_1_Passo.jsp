<%@page import="modelo.Campus"%>
<%@page import="modelo.Curso"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.Aluno"%>
<%@page import="util.DataFormat"%>
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
        <script type="text/javascript" >

            $(document).ready(function () {
                $('#campus').change(function () {
                    //$('#divcurso')[0].style.display="block";
                    //$('#divcurso').style.display = 'block';
                    $('#cat').load('/pnaes/categoriaajax.jsp?campus=' + $('#campus').val());
                });

            });

            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('/pnaes/cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            $(document).ready(function () {
                $('#cat').change(function () {
                    $('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val() + '&campus=' + $('#campus').val());
                    $('#periodo').html('<option selected="" disabled="" value="">Selecione primeiro o Curso ↑</option>');
                });

            });
            $(document).ready(function () {
                $('#curso').change(function () {
                    $('#periodo').load('/pnaes/periodoajax.jsp?curso=' + $('#curso').val());
                });

            });

            /*  $(document).ready(function () {
             $('#periodo').change(function () {
             // $('#divperiodo')[0].style.display="block";
             if($('#periodo').val()==='1'){
             document.getElementById('div_1_periodo').style.display = 'none';
             $("#naoReprovou").prop("checked", true);
             }else
             document.getElementById('div_1_periodo').style.display = 'block';
             });
             
             });*/

            function sReprovou() {
                document.getElementById('div_reprovou').style.display = 'block';
                $("#reprovou").prop('required', true);
                document.getElementById('reprovou').value = "0";
            }
            function nReprovou() {
                document.getElementById('div_reprovou').style.display = 'none';
                document.getElementById('reprovou').value = "";
                $("#reprovou").prop('required', false);
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
                                                        DataFormat dataFormat = new DataFormat();
                                                        Integer id = Integer.parseInt(request.getParameter("id"));
                                                        aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(id);
                    %>
                    <form  class="form form-horizontal striped-rows form-bordered" method="Post" action="../ServletAluno?opcao=alterar_1_passo&id=<%=aluno.getId()%>" id="formAluno">
                        <div class="form-body">

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="campus">Campus*:</label>
                                <div class="col-md-9">
                                    <select id="campus" name="campus" class="form-control" required disabled>
                                        <option selected="" disabled="">Selecione o Campus</option>
                                        <%
                                          List<Campus> campus = daoFactory.getCampusDao().listar();
                                          out.print("<option selected value=" + aluno.getCurso().getCampus().getId() + ">" + aluno.getCurso().getCampus().getNome() + "</option>");
                                            for (Campus c : campus) {
                                              if(c.getId()!=aluno.getCurso().getCampus().getId())
                                              out.print("<option value=" + c.getId() + ">" + c.getNome() + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="cat">Modalidade do Curso:*</label>
                                <div class="col-md-9">
                                    <select id="cat" name="cat" class="form-control" required>
                                        <option selected="" disabled="">Selecione a Modalidade do Curso</option>
                                        <%
                                          //  int categoria_id = -1;
                                        //  List<Curso> categorias = daoFactory.getCursoDao().buscarCursoPorCampus(aluno.getCurso().getCampus().getId());
                                          List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                          out.print("<option selected value=" + aluno.getCurso().getCategoria().getId() + ">" + aluno.getCurso().getCategoria().getNome() + "</option>");
                                            for (Categoria c : categorias) {
                                             // if(c.getCategoria().getId()!=aluno.getCurso().getCategoria().getId() || categoria_id!=c.getCategoria().getId())
                                              out.print("<option value=" + c.getId() + ">" + c.getNome() + "</option>");
                                                                              
                                             // categoria_id = c.getCategoria().getId();
                                                                              
                                                                              
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="curso">Curso:*</label>
                                <div class="col-md-9">
                                    <select id="curso" name="curso" class="form-control" required>
                                        <%
                                            List<Curso> cursos = daoFactory.getCursoDao().buscarCursoPorCategoria(aluno.getCurso().getCategoria().getId(),aluno.getCurso().getCampus().getId());
                                            out.print("<option selected value=" + aluno.getCurso().getId() + ">" + aluno.getCurso().getNome() + "</option>");
                                            for (Curso curso : cursos) {
                                                if(curso.getId()!=aluno.getCurso().getId()) 
                                                out.print("<option value=" + curso.getId() + ">" + curso.getNome() +"</option>");
                                            }
                                          //  out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                        %>  
                                    </select>
                                </div>
                            </div>        
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="periodo">Período:*</label>
                                <div class="col-md-9">
                                    <select id="periodo" name="periodo" class="form-control" required>

                                        <%
                                          //List<Curso> cursos2 = daoFactory.getCursoDao().buscarCursoPorCategoria(aluno.getCurso().getCategoria().getId());
                                          Curso curso = (Curso) daoFactory.getCursoDao().pesquisarPorId(aluno.getCurso().getId());
                                           out.print("<option selected value=" + aluno.getPeriodo() + ">" + aluno.getPeriodo() + "º " + curso.getTipoPeriodo() +  "</option>");
                                            for (int i = 1; i <= curso.getqPeriodo(); i++) {
                                                if(i!=aluno.getPeriodo())
                                                out.println("<option value=" + i + ">" + i + "º " + curso.getTipoPeriodo() + "</option>");
                                                //out.println("<option value="+curso.getId()+">"+curso.getTipoPeriodo()+"</option>");
                                                //curso.setTipoPeriodo(curso.getTipoPeriodo());
                                            }
                                                                            
                                          //  out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                        %>  
                                        <!--<option value="1 Ano/Modulo/Periodo">1 Ano/Modulo/Periodo</option>
                                        <option value="2 Ano/Modulo/Periodo">2 Ano/Modulo/Periodo</option>
                                        <option value="3 Ano/Modulo/Periodo">3 Ano/Modulo/Periodo</option>
                                        <option value="4 Periodo">4 Periodo</option>
                                        <option value="5 Periodo">5 Periodo</option>
                                        <option value="6 Periodo">6 Periodo</option>
                                        <option value="7 Periodo">7 Periodo</option>
                                        <option value="8 Periodo">8 Periodo</option>-->

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="transporte">Qual seu meio de Transporte para chegar até o IFTO:*</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <!--<input type="radio" name="transporte" id="onibus" value="Onibus" class="custom-control-input" required>-->
                                            <%
                                                if (aluno.getMeioTransporte().equals("OnibusGratuito")) {
                                                    out.println("<input checked type='radio' name='transporte' id='onibusgratuito' value='OnibusGratuito' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='transporte' id='onibusgratuito' value='OnibusGratuito' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="onibusgratuito">Ônibus (Gratuito)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <!--<input type="radio" name="transporte" id="onibus" value="Onibus" class="custom-control-input" required>-->
                                            <%
                                                if (aluno.getMeioTransporte().equals("OnibusPago")) {
                                                    out.println("<input checked type='radio' name='transporte' id='onibusPago' value='OnibusPago' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='transporte' id='onibusPago' value='OnibusPago' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="onibusPago">Ônibus (Pago)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                 if (aluno.getMeioTransporte().equals("Carro")) {
                                                     out.println("<input checked type='radio' name='transporte' id='carro' value='Carro' class='custom-control-input' required>");
                                                 } else {
                                                     out.println("<input type='radio' name='transporte' id='carro' value='Carro' class='custom-control-input' required>");
                                                 }
                                            %>
                                            <label class="custom-control-label" for="carro">Carro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getMeioTransporte().equals("Moto")) {
                                                    out.println("<input checked type='radio' name='transporte' id='moto' value='Moto' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='transporte' id='moto' value='Moto' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="moto">Moto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getMeioTransporte().equals("Bicicleta")) {
                                                    out.println("<input checked type='radio' name='transporte' id='bicicleta' value='Bicicleta' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='transporte' id='bicicleta' value='Bicicleta' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="bicicleta">Bicicleta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">

                                            <%
                                                if (aluno.getMeioTransporte().equals("A pé")) {
                                                    out.println("<input checked type='radio' name='transporte' id='ape' value='A pé' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='transporte' id='ape' value='A pé' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="ape">A pé&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getMeioTransporte().equals("Carona")) {
                                                    out.println("<input checked type='radio' name='transporte' id='carona' value='Carona' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='transporte' id='carona' value='Carona' class='custom-control-input' required>");
                                                }
                                            %>

                                            <label class="custom-control-label" for="carona">Carona</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="ensinoFundamental">Você cursou o Ensino Fundamental em Escola:*</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <%
                                                 if (aluno.getEnsinoFundamental().equals("Publico")) {
                                                     out.println("<input checked type='radio' name='ensinoFundamental' id='ensinoFundamentalPu' value='Publico' class='custom-control-input' required>");
                                                 } else {
                                                     out.println("<input type='radio' name='ensinoFundamental' id='ensinoFundamentalPu' value='Publico' class='custom-control-input' required>");
                                                 }
                                            %>
                                            <label class="custom-control-label" for="ensinoFundamentalPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getEnsinoFundamental().equals("Particular")) {
                                                    out.println("<input checked type='radio' name='ensinoFundamental' id='ensinoFundamentalPa' value='Particular' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='ensinoFundamental' id='ensinoFundamentalPa' value='Particular' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="ensinoFundamentalPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getEnsinoFundamental().equals("Publica/Particular")) {
                                                    out.println("<input checked type='radio' name='ensinoFundamental' id='ensinoFundamentalPp' value='Publica/Particular' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='ensinoFundamental' id='ensinoFundamentalPp' value='Publica/Particular' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="ensinoFundamentalPp">Pública e Particular</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="ensinoMedio">Você cursou ou está cursando o Ensino Médio em Escola:*</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getEnsinoMedio().equals("Publico")) {
                                                    out.println("<input checked type='radio' name='ensinoMedio' id='ensinoMedioPu' value='Publico' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='ensinoMedio' id='ensinoMedioPu' value='Publico' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="ensinoMedioPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                  if (aluno.getEnsinoMedio().equals("Particular")) {
                                                      out.println("<input checked type='radio' name='ensinoMedio' id='ensinoMedioPa' value='Particular' class='custom-control-input' required>");
                                                  } else {
                                                      out.println("<input type='radio' name='ensinoMedio' id='ensinoMedioPa' value='Particular' class='custom-control-input' required>");
                                                  }
                                            %>
                                            <label class="custom-control-label" for="ensinoMedioPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                 if (aluno.getEnsinoMedio().equals("Publica/Particular")) {
                                                     out.println("<input checked type='radio' name='ensinoMedio' id='ensinoMedioPp' value='Publica/Particular' class='custom-control-input' required>");
                                                 } else {
                                                     out.println("<input type='radio' name='ensinoMedio' id='ensinoMedioPp' value='Publica/Particular' class='custom-control-input' required>");
                                                 }
                                            %>
                                            <label class="custom-control-label" for="ensinoMedioPp">Pública e Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>   

                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 label-control" for="entrada">Como você ingressou no IFTO:*</label>
                                <div class="col-md-9">
                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                        <div class="custom-control custom-radio">
                                            <%
                                                 if (aluno.getEntradaIfto().equals("Ampla concorrencia")) {
                                                     out.println("<input checked type='radio' name='entrada' id='entrada1' value='Ampla concorrencia' class='custom-control-input' required>");
                                                 } else {
                                                     out.println("<input type='radio' name='entrada' id='entrada1' value='Ampla concorrencia' class='custom-control-input' required>");
                                                 }
                                            %>
                                            <label class="custom-control-label" for="entrada1">Vestibular por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getEntradaIfto().equals("Cota")) {
                                                    out.println("<input checked type='radio' name='entrada' id='entrada2' value='Cota' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='entrada' id='entrada2' value='Cota' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="entrada2">Vestibular por cotas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getEntradaIfto().equals("Sisu")) {
                                                    out.println("<input checked type='radio' name='entrada' id='entrada3' value='Sisu' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='entrada' id='entrada3' value='Sisu' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="entrada3">Sisu por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <%
                                                if (aluno.getEntradaIfto().equals("SisuCota")) {
                                                    out.println("<input checked type='radio' name='entrada' id='entrada4' value='SisuCota' class='custom-control-input' required>");
                                                } else {
                                                    out.println("<input type='radio' name='entrada' id='entrada4' value='SisuCota' class='custom-control-input' required>");
                                                }
                                            %>
                                            <label class="custom-control-label" for="entrada4">Sisu por cotas</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%//if(aluno.getPeriodo()==1){%>                  
                            <!--<div id="div_1_periodo" class="hide">-->
                            <%//}else{%>
                            <div id="div_1_periodo" class="hide" style="display: block;">
                                <%//}%>
                                <div class="form-group row">
                                    <label class="col-md-3 label-control" for="reprovousimounao">Você reprovou em alguma disciplina no IFTO?*:</label>
                                    <div class="col-md-9">
                                        <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                            <div class="col-md-2">
                                                <div class="custom-control custom-radio">
                                                    <%
                                                            if (!aluno.getReprovou()) {
                                                                out.println("<input checked type='radio' name='reprovousimounao' id='naoReprovou' value='Nao' class='custom-control-input' onclick='nReprovou();' required>");
                                                            } else {
                                                                out.println("<input type='radio' name='reprovousimounao' id='naoReprovou' value='Nao' class='custom-control-input' onclick='nReprovou();' required>");
                                                            }
                                                    %>
                                                    <label class="custom-control-label" for="naoReprovou">Não</label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <%
                                                            if (aluno.getReprovou()) {
                                                                out.println("<input checked type='radio' name='reprovousimounao' id='simReprovou' value='Sim' class='custom-control-input' onclick='sReprovou();' required>");
                                                            } else {
                                                                out.println("<input type='radio' name='reprovousimounao' id='simReprovou' value='Sim' class='custom-control-input' onclick='sReprovou();' required>");
                                                            }
                                                    %>
                                                    <label class="custom-control-label" for="simReprovou">Sim</label>
                                                </div>
                                            </div>
                                            <%
                                                    if (!aluno.getReprovou()) {
                                                        out.println("<div id='div_reprovou' class='hide col-md-9'>");
                                                    } else {
                                                        out.println("<div id='div_reprovou' class='col-md-9'>");
                                                    }
                                                                                    
                                            %>
                                            <div class="col-md-9">
                                                <div class="position-relative has-icon-left">
                                                    <div class="form-control-position">
                                                        <i class="fa fa-briefcase">Em Quantas Disciplinas Você Reprovou?(Entre 1 e 20)</i>
                                                    </div>
                                                    <%
                                                                                if(aluno.getReprovou()){%>
                                                    <input type="number" name="reprovou" id="reprovou" value="<%=aluno.getReprovouQuantas()%>" min="1" max="20" required>

                                                    <%} else { %>
                                                    <input type="number" name="reprovou" id="reprovou" value="1" min="1" max="20">
                                                    <% } %>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 label-control" for="visita">Qual o melhor horário para uma visita, se necessário:*</label>
                            <div class="col-md-9">
                                <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                    <div class="custom-control custom-radio">
                                        <%
                                             if (aluno.getPeriodoVisita().equals("Manha")) {
                                                 out.println("<input checked type='radio' name='visita' id='visita1' value='Manha' class='custom-control-input' required>");
                                             } else {
                                                 out.println("<input type='radio' name='visita' id='visita1' value='Manha' class='custom-control-input' required>");
                                             }
                                        %>
                                        <label class="custom-control-label" for="visita1">Manhã&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <%
                                            if (aluno.getPeriodoVisita().equals("Tarde")) {
                                                out.println("<input checked type='radio' name='visita' id='visita2' value='Tarde' class='custom-control-input' required>");
                                            } else {
                                                out.println("<input type='radio' name='visita' id='visita2' value='Tarde' class='custom-control-input' required>");
                                            }
                                        %>
                                        <label class="custom-control-label" for="visita2">Tarde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <%
                                           if (aluno.getPeriodoVisita().equals("Noite")) {
                                               out.println("<input checked type='radio' name='visita' id='visita3' value='Noite' class='custom-control-input' required>");
                                           } else {
                                               out.println("<input type='radio' name='visita' id='visita3' value='Noite' class='custom-control-input' required>");
                                           }
                                        %>
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

                            <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save" >
                                <i class="fa fa-check-square-o"></i> Salvar
                            </button>
                        </div>
                    </form> 
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>