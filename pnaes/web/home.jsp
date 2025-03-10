<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="js/jquery.js" type="text/javascript" ></script>
    </head>
    <body>         
        <%@include file="menu.jsp" %>
        <main class="main-content">
            <%@include file="cabecalho.jsp" %>    
            <div class="card conteudo">
                <div class="card-header">
                    <h4 class="card-title" id="striped-row-layout-icons">Minha Página Inicial</h4>
                </div>
                <div class="card-body">
                    <%@include file="homeAluno.jsp" %>    
                </div>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>