package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"pt-br\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\" integrity=\"sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"src/css/styles.css\">\r\n");
      out.write("    <title>Sidebar</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <nav id=\"sidebar\">\r\n");
      out.write("        <div id=\"sidebar_content\">\r\n");
      out.write("            <div id=\"user\">\r\n");
      out.write("                <img src=\"src/images/avatar.jpg\" id=\"user_avatar\" alt=\"Avatar\">\r\n");
      out.write("    \r\n");
      out.write("                <p id=\"user_infos\">\r\n");
      out.write("                    <span class=\"item-description\">\r\n");
      out.write("                        Fulano de Tal\r\n");
      out.write("                    </span>\r\n");
      out.write("                    <span class=\"item-description\">\r\n");
      out.write("                        Lorem Ipsum\r\n");
      out.write("                    </span>\r\n");
      out.write("                </p>\r\n");
      out.write("            </div>\r\n");
      out.write("    \r\n");
      out.write("            <ul id=\"side_items\">\r\n");
      out.write("                <li class=\"side-item active\">\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <i class=\"fa-solid fa-chart-line\"></i>\r\n");
      out.write("                        <span class=\"item-description\">\r\n");
      out.write("                            Dashboard\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("    \r\n");
      out.write("                <li class=\"side-item\">\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <i class=\"fa-solid fa-user\"></i>\r\n");
      out.write("                        <span class=\"item-description\">\r\n");
      out.write("                            UsuÃ¡rios\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("    \r\n");
      out.write("                <li class=\"side-item\">\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <i class=\"fa-solid fa-bell\"></i>\r\n");
      out.write("                        <span class=\"item-description\">\r\n");
      out.write("                            NotificaÃ§Ãµes\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("    \r\n");
      out.write("                <li class=\"side-item\">\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <i class=\"fa-solid fa-box\"></i>\r\n");
      out.write("                        <span class=\"item-description\">\r\n");
      out.write("                            Produtos\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("    \r\n");
      out.write("                <li class=\"side-item\">\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <i class=\"fa-solid fa-image\"></i>\r\n");
      out.write("                        <span class=\"item-description\">\r\n");
      out.write("                            Imagens\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("    \r\n");
      out.write("                <li class=\"side-item\">\r\n");
      out.write("                    <a href=\"#\">\r\n");
      out.write("                        <i class=\"fa-solid fa-gear\"></i>\r\n");
      out.write("                        <span class=\"item-description\">\r\n");
      out.write("                            ConfiguraÃ§Ãµes\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("    \r\n");
      out.write("            <button id=\"open_btn\">\r\n");
      out.write("                <i id=\"open_btn_icon\" class=\"fa-solid fa-chevron-right\"></i>\r\n");
      out.write("            </button>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div id=\"logout\">\r\n");
      out.write("            <button id=\"logout_btn\">\r\n");
      out.write("                <i class=\"fa-solid fa-right-from-bracket\"></i>\r\n");
      out.write("                <span class=\"item-description\">\r\n");
      out.write("                    Logout\r\n");
      out.write("                </span>\r\n");
      out.write("            </button>\r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("\r\n");
      out.write("    <main>\r\n");
      out.write("        <h1>TÃ­tulo</h1>\r\n");
      out.write("    </main>\r\n");
      out.write("    <script src=\"src/javascript/script.js\"></script>\r\n");
      out.write("</body>\r\n");
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
