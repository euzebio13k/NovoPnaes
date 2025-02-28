<%@page import="modelo.Aluno"%>
<%@page import="dao.DaoFactory"%>
<%
    DaoFactory daoFactory = new DaoFactory();
    if(session.getAttribute("aluno_id")==null){
        response.sendRedirect("/pnaes/index.jsp");
    }
    Integer alunoId = Integer.parseInt(session.getAttribute("aluno_id").toString());
    Aluno aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(alunoId);
%>
<div class=" header">
    <a class="mm-logo" href="/pnaes/home.jsp"><img src="/pnaes/img/logotop.png"></a>
    <div class="user">
        <img src="/pnaes/alunos/<%=session.getAttribute("matricula")%>/<%=session.getAttribute("matricula")%>.jpg"  class="user_avatar">
        <p class="user_infos">
            <span class="item-description">
                <%=session.getAttribute("nome")%>
            </span>
        </p>
    </div>
    <div class="user">
        <img src="/pnaes/img/avatar1.jpg" class="user_avatar">
        <p class="user_infos">
            <span class="item-description">
                Fulano de tal
            </span>
        </p>
    </div>    
</div>        
