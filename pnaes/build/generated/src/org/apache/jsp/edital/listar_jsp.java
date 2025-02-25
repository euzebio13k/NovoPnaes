package org.apache.jsp.edital;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.GregorianCalendar;
import util.DataFormat;
import modelo.Edital;
import java.util.ArrayList;
import java.util.List;
import dao.DaoFactory;

public final class listar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/edital/../menu.jsp");
    _jspx_dependants.add("/edital/../cabecalho.jsp");
  }

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Home</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css\">\n");
      out.write("        <link href=\"css/estilo.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"conteiner-fluid\">            \n");
      out.write("            ");
      out.write("<div class=\"sidebar\">\n");
      out.write("    <nav class=\"nav flex-column\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-grid\"></i></span>\n");
      out.write("            <span class=\"description\">Menu</span>\n");
      out.write("        </a>\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-clipboard-check\"></i></span>\n");
      out.write("            <span class=\"description\">Posts</span>\n");
      out.write("        </a>\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-bell\"></i></span>\n");
      out.write("            <span class=\"description\">Notificações</span>\n");
      out.write("        </a>\n");
      out.write("        <a class=\"nav-link\" href=\"#\" data-bs-toggle=\"collapse\" data-bs-target=\"#submenu\" aria-expanded=\"false\" aria-controls=\"submenu\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-box-seam\"></i></span>\n");
      out.write("            <span class=\"description\">Projetos<i class=\"bi bi-caret-down-fill\"></i></span>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"sub-menu collapse\" id=\"submenu\">\n");
      out.write("            <a class=\"nav-link\" href=\"#\">\n");
      out.write("                <span class=\"icon\"><i class=\"bi bi-file-earmark-check\"></i></span>\n");
      out.write("                <span class=\"description\">Projeto 1</span>\n");
      out.write("            </a>\n");
      out.write("            <a class=\"nav-link\" href=\"#\">\n");
      out.write("                <span class=\"icon\"><i class=\"bi bi-file-earmark-check\"></i></span>\n");
      out.write("                <span class=\"description\">Projeto 2</span>\n");
      out.write("            </a>\n");
      out.write("            <a class=\"nav-link\" href=\"#\">\n");
      out.write("                <span class=\"icon\"><i class=\"bi bi-file-earmark-check\"></i></span>\n");
      out.write("                <span class=\"description\">Projeto 3</span>\n");
      out.write("            </a>\n");
      out.write("        </div>\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-gear\"></i></span>\n");
      out.write("            <span class=\"description\">Configurações</span>\n");
      out.write("        </a>\n");
      out.write("    </nav>\n");
      out.write("</div>");
      out.write("\n");
      out.write("            <main class=\"main-content\">\n");
      out.write("                ");
      out.write("<div class=\"row\">\n");
      out.write("    <a class=\"mm-logo\" href=\"/pnaes/home.jsp\"><img src=\"/pnaes/img/logotop.png\"></a>\n");
      out.write("</div>\n");
      out.write("  ");
      out.write("    \n");
      out.write("                <h2>Minha home</h2>\n");
      out.write("            </main>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Lista de Editais</title>\n");
      out.write("        <link href=\"/pnaes/css/main.css?version=4.4.0\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"auth-wrapper\">\n");
      out.write("    <center>\n");
      out.write("        <div class=\"col-md-10\">\n");
      out.write("            <div class=\"all-wrapper with-side-panel solid-bg-all\">\n");
      out.write("                ");
      out.write("<div class=\"row\">\n");
      out.write("    <a class=\"mm-logo\" href=\"/pnaes/home.jsp\"><img src=\"/pnaes/img/logotop.png\"></a>\n");
      out.write("</div>\n");
      out.write("  ");
      out.write("\n");
      out.write("                <div class=\"layout-w\">\n");
      out.write("                    <div class=\"content-w\">\n");
      out.write("                        <div class=\"row align-items-center\">\n");
      out.write("                            ");
      out.write("<div class=\"sidebar\">\n");
      out.write("    <nav class=\"nav flex-column\">\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-grid\"></i></span>\n");
      out.write("            <span class=\"description\">Menu</span>\n");
      out.write("        </a>\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-clipboard-check\"></i></span>\n");
      out.write("            <span class=\"description\">Posts</span>\n");
      out.write("        </a>\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-bell\"></i></span>\n");
      out.write("            <span class=\"description\">Notificações</span>\n");
      out.write("        </a>\n");
      out.write("        <a class=\"nav-link\" href=\"#\" data-bs-toggle=\"collapse\" data-bs-target=\"#submenu\" aria-expanded=\"false\" aria-controls=\"submenu\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-box-seam\"></i></span>\n");
      out.write("            <span class=\"description\">Projetos<i class=\"bi bi-caret-down-fill\"></i></span>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"sub-menu collapse\" id=\"submenu\">\n");
      out.write("            <a class=\"nav-link\" href=\"#\">\n");
      out.write("                <span class=\"icon\"><i class=\"bi bi-file-earmark-check\"></i></span>\n");
      out.write("                <span class=\"description\">Projeto 1</span>\n");
      out.write("            </a>\n");
      out.write("            <a class=\"nav-link\" href=\"#\">\n");
      out.write("                <span class=\"icon\"><i class=\"bi bi-file-earmark-check\"></i></span>\n");
      out.write("                <span class=\"description\">Projeto 2</span>\n");
      out.write("            </a>\n");
      out.write("            <a class=\"nav-link\" href=\"#\">\n");
      out.write("                <span class=\"icon\"><i class=\"bi bi-file-earmark-check\"></i></span>\n");
      out.write("                <span class=\"description\">Projeto 3</span>\n");
      out.write("            </a>\n");
      out.write("        </div>\n");
      out.write("        <a class=\"nav-link\" href=\"#\">\n");
      out.write("            <span class=\"icon\"><i class=\"bi bi-gear\"></i></span>\n");
      out.write("            <span class=\"description\">Configurações</span>\n");
      out.write("        </a>\n");
      out.write("    </nav>\n");
      out.write("</div>");
      out.write("\n");
      out.write("                            <div class=\"col-md-9\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"card-text\">\n");
      out.write("                                        Lista com Todos os Editais Cadastrados\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-md-3\">\n");
      out.write("                                            <a href=\"/pnaes/edital/cadastrar.jsp\"><button class=\"mr-2 mb-2 btn btn-primary\" type=\"button\">Lançar NOVO Edital</button></a>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-md-12\">\n");
      out.write("                                            ");
                                                            
                                                DaoFactory daoFactory = new DaoFactory();
                                                List<Edital> editals = daoFactory.getEditalDao().listar();
                                                DataFormat dataFormat = new DataFormat();

                                            
      out.write("        \n");
      out.write("                                            <table class=\"table table-striped table-responsive-md dataTable\" style=\"text-align: center;\">\n");
      out.write("                                                <thead>\n");
      out.write("                                                <th>Numero</th>\n");
      out.write("                                                <th>Data Inicial</th>\n");
      out.write("                                                <th>Data Final</th>\n");
      out.write("                                                <th>Status</th>\n");
      out.write("                                                <th>Editar</th>\n");
      out.write("                                                <th>Excluir</th>\n");
      out.write("\n");
      out.write("                                                </thead>\n");
      out.write("                                                ");
                                                                for (Edital e : editals) {
                                                
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print(e.getNumero());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(dataFormat.formatarData(e.getDataInicial()));
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(dataFormat.formatarData(e.getDataFinal()));
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(e.ativo());
      out.write("</td>\n");
      out.write("                                                    <td><a href=\"alterar.jsp?id=");
      out.print(e.getId());
      out.write("\" title=\"Editar\"><button class=\"mr-2 mb-2 btn btn-outline-info\" type=\"button\"><i class=\"os-icon os-icon-file-text\">Editar</button></a></td>\n");
      out.write("                                                    <td><a href=\"excluir.jsp?id=");
      out.print(e.getId());
      out.write("\" title=\"Excluir\"><button class=\"mr-2 mb-2 btn btn-outline-danger\" type=\"button\"><i class=\"os-icon os-icon-close\"></i>Excluir</button></a></td>\n");
      out.write("                                                </tr>\n");
      out.write("                                                ");
}
      out.write("\n");
      out.write("                                                <tfoot>\n");
      out.write("                                                <th>Numero</th>\n");
      out.write("                                                <th>Data Inicial</th>\n");
      out.write("                                                <th>Data Final</th>\n");
      out.write("                                                <th>Status</th>\n");
      out.write("                                                <th>Editar</th>\n");
      out.write("                                                <th>Excluir</th>\n");
      out.write("                                                </tfoot>\n");
      out.write("                                            </table>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </center>\n");
      out.write("</body>\n");
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
