<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="dao.AlunoDAO"%>
<%@include file="cabecalho.jsp"%>
<%
AlunoDAO dao = new AlunoDAO();

List<Aluno> lista;
//Verificar se veio algo do filtro, 
//se vier eu filtro pro nome
//caso contrário eu trago todos os professores
if(request.getParameter("txtFiltro")!= null && request.getParameter("txtFiltro")!= "")
{
    String txtFiltro = request.getParameter("txtFiltro");
     lista = dao.listar(txtFiltro);
  
}
else
{
    lista = dao.listar();
}

%>




        <div>
            <h1 class="centro">Alunos</h1>
            
            <div>
                +<a href="alunos-cadastrar.jsp">Novo Aluno</a><br />
                <form>
                    <input type="text" />
                    <input type="submit" value="Pesquisar"/><br />
                   
                       <table>
                        <tr>
                            <th>Matricula</th>
                            <th>Nome</th>
                            <th>Disciplinas</th>
                            <th>Matriculado</th>
                            <th>Ações</th>
                          
                        </tr>
                        <%
                        for(Aluno item:lista)
                        {
                        %>
                        <tr>
                            <td><%=item.getMatricula()%></td>
                            <td><%=item.getNome()%></td>
                            <td><%=item.getDisciplinas()%></td>
                            <td><%=item.getAtivo()%></td>

                            <td><a href="alunos-atualizar.jsp?siape=<%=item.getMatricula()%>">Editar</a>
                                <a href="alunos-excluir-ok.jsp?siape=<%=item.getMatricula()%>">Excluir</a>
                            </td>
                            
                        </tr>
                       <%
                        }
                       %>
                    </table>
                  
                    
                </form>
            </div>
        </div>
    </body>
</html>
