/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import modelo.Ocupacao;
import util.JPAUtil;

/**
 *
 * @author ti-3
 */
public class DaoGenerico<T> {

    private Class classe;
    protected EntityManager em;

    public DaoGenerico() {
        em = JPAUtil.getEntityManager();
    }
    public DaoGenerico(Class classe) {
        this.classe = classe;
        em = JPAUtil.getEntityManager();
    }
    public T inserirOuAlterar(T u) {
        try {
            em.getTransaction().begin();
            u = em.merge(u);
            em.getTransaction().commit();
            return u;
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    public void excluir(T u) {
        try {
            em.getTransaction().begin();
            u = em.merge(u);
            em.remove(u);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    public T pesquisarPorId(Integer id) {
        try {
        return (T) this.em.find(classe, id);
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }        
    }
    public List<T> listar() {
        try {
        String jpql = "select a from " + classe.getSimpleName() + " a";
        return em.createQuery(jpql, classe).getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    public List<T> pesquisarPor(String busca, String campo) {
        try {
        String jpql = "select a from " + classe.getSimpleName() + " a where a." + campo + " like '%" + busca + "%'";
        return em.createQuery(jpql, classe).getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    public List<T> perquisarPorAluno(Integer alunoId) {
        try {
            String jpql = "select a from " + classe.getSimpleName() + " a where a.aluno.id = " + alunoId;
            return em.createQuery(jpql, classe).getResultList();
        } catch (Exception ex) {
            return null;
        }
        finally {
            em.close();
        }
    }    
}
