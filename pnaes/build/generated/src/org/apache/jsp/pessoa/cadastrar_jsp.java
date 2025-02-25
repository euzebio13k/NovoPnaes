package org.apache.jsp.pessoa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import modelo.Uf;
import dao.DaoFactory;

public final class cadastrar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Cadastro</title>\n");
      out.write("       \n");
      out.write("        <script>\n");
      out.write("          \n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('#uf').change(function () {\n");
      out.write("                    $('#cidade').load('/pnaes/cidadeajax.jsp?estado=' + $('#uf').val());\n");
      out.write("                });\n");
      out.write("          });\n");
      out.write("       \n");
      out.write("            $(function(){\n");
      out.write("      \n");
      out.write("           //Não Permite digitar letras\n");
      out.write("          $('#cpf').keyup(function() {\n");
      out.write("               $(this).val(this.value.replace(/\\D/g, ''));\n");
      out.write("            });\n");
      out.write("            $('#rg').keyup(function() {\n");
      out.write("               $(this).val(this.value.replace(/\\D/g, ''));\n");
      out.write("            });\n");
      out.write("        });\n");
      out.write("        \n");
      out.write("\n");
      out.write("         </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"element-box\">\n");
      out.write("            <h1 class=\"form-header\">1º Cadastro no Sistema PNAES</h1>\n");
      out.write("            <div class=\"form-desc\">\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            <div style=\"width: 80%\" >\n");
      out.write("                <!-- Basic form layout section start -->\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-12\">\n");
      out.write("                        <div class=\"card\">\n");
      out.write("                            <div class=\"card-header\">\n");
      out.write("                                <a class=\"heading-elements-toggle\"><i class=\"la la-ellipsis-v font-medium-3\"></i></a>\n");
      out.write("                                <div class=\"heading-elements\"></div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card-content collpase show\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    ");

                                        if (request.getParameter("msg") != null) {
                                            
                                           
                                    
      out.write("\n");
      out.write("                                    <center>\n");
      out.write("                                        <div class=\"alert alert-warning\" role=\"alert\">\n");
      out.write("                                            <strong>");
      out.print(request.getParameter("msg"));
      out.write("</strong>\n");
      out.write("                                        </div>\n");
      out.write("                                    </center>\n");
      out.write("                                    ");

                                        }
                                    
      out.write("\n");
      out.write("                                    <form method=\"Post\" id=\"formPessoa\" action=\"/pnaes/ServletAluno?opcao=cadastrar\" class=\"form form-horizontal\">\n");
      out.write("                                        <input type=\"hidden\" name=\"login\"  id=\"login\" class=\"form-control\"  value=\"");
      out.print(request.getParameter("login"));
      out.write("\">\n");
      out.write("                                        <div class=\"form-body\">\n");
      out.write("                                            <h4 class=\"form-section\"><i class=\"ft-user\"></i>Dados Pessoais</h4>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"nome\">Nome Completo*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"nome\" id=\"nome\" class=\"form-control\" placeholder=\"Nome\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
if(1 == 1){
      out.write("\n");
      out.write("                                           <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"cpf\">CPF(Somente Números)*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"hidden\" name=\"cpf\" id=\"cpf\" class=\"form-control\"   value=\"");
      out.print(request.getParameter("login"));
      out.write("\">\n");
      out.write("                                                    <input type=\"text\" disabled name=\"cpf\" id=\"cpf\" class=\"form-control\" placeholder=\"CPF\" maxlength=\"11\"  required value=\"");
      out.print(request.getParameter("login"));
      out.write("\">                                                    \n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                           ");
}else{
      out.write("\n");
      out.write("                                           <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"cpf\">CPF(Somente Números)*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"cpf\" id=\"cpf\" class=\"form-control\" placeholder=\"CPF\" maxlength=\"11\"  required >                                                    \n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"rg\">Número do RG*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"rg\" id=\"rg\"  class=\"form-control\" placeholder=\"RG\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"ufe\">Estado(UF) de Expedição do RG*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <select id=\"ufe\" name=\"ufe\" class=\"form-control\" required>\n");
      out.write("                                                        <option selected=\"\" disabled=\"\" value=\"\">Selecione o Estado(UF) de Expedição do RG</option>\n");
      out.write("                                                        ");
/*
                                                            DaoFactory daoFactory = new DaoFactory();
                                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                                            for (Uf ufe : ufes) {
                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                            }
                                                        */
      out.write("\n");
      out.write("                                                    </select>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"sexo\">Sexo*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <div class=\"input-group\">\n");
      out.write("                                                        <div class=\"d-inline-block custom-control custom-radio mr-1\">\n");
      out.write("                                                            <input type=\"radio\" name=\"sexo\" value=\"Masculino\" class=\"custom-control-input\" id=\"sexom\" required>\n");
      out.write("                                                            <label class=\"custom-control-label\" for=\"sexom\">Masculino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>\n");
      out.write("                                                        </div>\n");
      out.write("                                                        <div class=\"d-inline-block custom-control custom-radio\">\n");
      out.write("                                                            <input type=\"radio\" name=\"sexo\" value=\"Feminino\" class=\"custom-control-input\" id=\"sexof\" required>\n");
      out.write("                                                            <label class=\"custom-control-label\" for=\"sexof\">Feminino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>\n");
      out.write("                                                        </div>\n");
      out.write("                                                        <div class=\"d-inline-block custom-control custom-radio\">\n");
      out.write("                                                            <input type=\"radio\" name=\"sexo\" value=\"Indefinino\" class=\"custom-control-input\" id=\"sexoi\" required>\n");
      out.write("                                                            <label class=\"custom-control-label\" for=\"sexoi\">Indefinido</label>\n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"estadoCivil\">Estado Civil*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <select id=\"estadoCivil\" name=\"estadoCivil\" class=\"form-control\" required>\n");
      out.write("                                                        <option selected=\"\" disabled=\"\" value=\"\">Selecione o Estado Civil</option>\n");
      out.write("                                                        <option value=\"Solteiro\">Solteiro(a)</option>\n");
      out.write("                                                        <option value=\"Casado\">Casado(a)</option>\n");
      out.write("                                                        <option value=\"Separado\">Separado(a)</option>\n");
      out.write("                                                        <option value=\"Divorciado\">Divorciado(a)</option>\n");
      out.write("                                                        <option value=\"Viúvo\">Viúvo(a)</option> \n");
      out.write("                                                        <option value=\"Companheiro\">Companheiro(a)</option>\n");
      out.write("                                                    </select>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>        \n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"dtn\">Data de Nascimento* (dd/MM/yyyy):</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"date\" name=\"dtn\" id=\"dtn\" class=\"form-control\" placeholder=\"dd/MM/yyyy\" maxlength=\"10\" OnKeyPress=\"formatar('##/##/####', this)\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"email\">E-mail*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"email\" name=\"email\" id=\"email\"  class=\"form-control\" placeholder=\"Email\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>                                                \n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"telefone\">Telefone* (DD999999999):</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                   <!-- <input type=\"tel\" name=\"telefone\" id=\"telefone\"  class=\"form-control\" placeholder=\"DD 999999999\" maxlength=\"15\"  pattern=\"[0-9]{2} [0-9]{4,6}[0-9]{3,4}$\" required>-->\n");
      out.write("                                                   <input type=\"tel\" name=\"telefone\" id=\"telefone\"  class=\"form-control\" placeholder=\"DD999999999\" maxlength=\"11\"  pattern=\"[0-9]{10,11}$\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"autoDeclaracao\">Auto Declaração Cor/Raça*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <select id=\"autoDeclaracao\" name=\"autoDeclaracao\" class=\"form-control\" required>\n");
      out.write("                                                        <option selected=\"\" disabled=\"\" value=\"\"> Selecione a sua Cor/Raça </option>\n");
      out.write("                                                        <option value=\"Branco\">Branco</option>\n");
      out.write("                                                        <option value=\"Pardo\">Pardo</option>\n");
      out.write("                                                        <option value=\"Preto\">Preto</option>\n");
      out.write("                                                        <option value=\"Indígena\">Indígena</option>\n");
      out.write("                                                        <option value=\"Outra\">Outra</option>   \n");
      out.write("                                                    </select>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>        \n");
      out.write("                                             ");
if(request.getParameter("login").length()<11){
      out.write("\n");
      out.write("                                           <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"matricula\">Matricula (a mesma do SUAP)*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <div class=\"position-relative has-icon-left\">\n");
      out.write("                                                        <input type=\"hidden\" name=\"matricula\"  id=\"matricula\" class=\"form-control\"  value=\"");
      out.print(request.getParameter("login"));
      out.write("\">\n");
      out.write("                                                        <input type=\"text\" name=\"matricula\" disabled id=\"matricula\" class=\"form-control\"  value=\"");
      out.print(request.getParameter("login"));
      out.write("\">\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                           ");
}else{
      out.write("\n");
      out.write("                                           <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"matricula\">Matricula (a mesma do SIGA)*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <div class=\"position-relative has-icon-left\">\n");
      out.write("                                                        <input type=\"text\" name=\"matricula\"  id=\"matricula\" class=\"form-control\"  required  placeholder=\"Matricula (a mesma do SIGA)\">\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                            \n");
      out.write("                                                    \n");
      out.write("                                            <h4 class=\"form-section\"><i class=\"ft-clipboard\"></i> Dados do Endereço</h4>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"logradouro\">Logradouro(Rua, Avenida...)*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"logradouro\" id=\"logradouro\" class=\"form-control\" placeholder=\"Logradouro(Rua, Avenida...)\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"numero\">Número*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"numero\" id=\"numero\" class=\"form-control\" placeholder=\"Numero\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"bairro\">Bairro*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"bairro\" id=\"bairro\" class=\"form-control\" placeholder=\"Bairro\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"complemento\">Complemento:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"complemento\" id=\"complemento\" class=\"form-control\" placeholder=\"Complemento\">                                              </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"cep\">CEP*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <input type=\"text\" name=\"cep\" id=\"cep\" class=\"form-control\" placeholder=\"CEP\" maxlength=\"10\" OnKeyPress=\"formatar('##.###-###', this)\" required>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"uf\">Estado (UF)*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <select id=\"uf\" name=\"uf\" class=\"form-control\" required>\n");
      out.write("                                                        <option selected=\"\" disabled=\"\" value=\"\">Selecione o estado (UF)</option>\n");
      out.write("                                                        ");
/*
                                                            List<Uf> ufs = daoFactory.getUfDao().listar();
                                                            for (Uf uf : ufs) {
                                                                out.print("<option value=" + uf.getId() + ">" + uf.getNome() + "</option>");
                                                            }
                                                        */
      out.write("\n");
      out.write("                                                    </select>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-md-3 label-control\" for=\"cidade\">Cidade*:</label>\n");
      out.write("                                                <div class=\"col-md-9\">\n");
      out.write("                                                    <select id=\"cidade\" name=\"cidade\" class=\"form-control\" required>\n");
      out.write("                                                        <option selected=\"\" disabled=\"\" value=\"\">Selecione primeiro o estado (UF) ↑</option>\n");
      out.write("\n");
      out.write("                                                    </select>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>        \n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-actions\">\n");
      out.write("                                            <button type=\"reset\" value=\"Limpar\"  class=\"btn btn-warning mr-1 os-icon os-icon-hash\">\n");
      out.write("                                                <i class=\"ft-x\"></i> Limpar\n");
      out.write("                                            </button>\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary os-icon os-icon-save\"  name=\"cadastrar\" value=\"Cadastrar\">\n");
      out.write("                                                <i class=\"la la-check-square-o\"></i> Avançar\n");
      out.write("                                            </button>\n");
      out.write("                                        </div>                                                    \n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>                            \n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
