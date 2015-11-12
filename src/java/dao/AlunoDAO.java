
package dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Aluno;
import modelo.Professor;
/**
 *
 * @author marcelosiedler
 */
public class AlunoDAO {
    EntityManager em;
    
    public AlunoDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Aluno obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
            
        }
        
    }

    public List<Aluno> listar() throws Exception {
        return em.createNamedQuery("Aluno.findAll").getResultList();
    }
    
      public List<Aluno> listar(String nome) throws Exception {
        //passar o parâmetro pra query
         TypedQuery<Aluno> query = 
                 em.createNamedQuery("Professor.findByName", Aluno.class);
         
         //Seto o parâmetro
         query.setParameter("nome", '%' + nome + '%');
         //retorno minha lista
         return query.getResultList();
    }
    
    public void alterar(Aluno obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
    
    public void excluir(Aluno obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public Aluno buscarPorChavePrimaria (String chave)
    {
        return em.find(Aluno.class,chave);
    }
    
    public void fechaEmf() {
        Conexao.closeConexao();
    }
    


}
