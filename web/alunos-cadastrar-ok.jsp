<%@page import="modelo.Aluno"%>
<%@page import="dao.AlunoDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    
    
    
    
    String msg="";
    
    if(request.getParameter("txtSiape") == null || request.getParameter("txtNome")== null)
    {
        response.sendRedirect("professores.jsp");
    }
    else
    {
    
        String nome = request.getParameter("txtnome");
        String matr = request.getParameter("txtmatricula");
        Integer disc = request.getParameter("txtDisciplinas");
      
        
        
        //Chamar a inclusão da DAO
        AlunoDAO dao = new AlunoDAO();

        Aluno obj = new Aluno();
        obj.setNome(nome);
     
        obj.setDisciplinas(disc);
        obj.setMatricula(matr);
      
        try
        {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar registro";
        }
        
    }
    
    
    
    

//txtnome é o NAME que eu coloquei no input na tela 
//anterior
String nome = request.getParameter("txtnome");
String matr = request.getParameter("txtmatricula");
%>
         <h1 class="centro">Cadastro de Alunos</h1>
            
         <div>
             Registro cadastrado com sucesso.<br />
             Nome:<%=nome%><br />
             Matrícula:<%=matr%><br />
             <a href="alunos.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>
