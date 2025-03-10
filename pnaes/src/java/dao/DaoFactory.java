package dao;

import modelo.*;
/**
 *
 * @author ti-3
 */
public class DaoFactory {
    
    public BolsaDao getBolsaDao(){
        return new BolsaDao();
    }
    public DaoGenerico<Endereco> getEnderecoDao(){
        return new DaoGenerico<Endereco>(Endereco.class);
    } 
       public DaoGenerico<Uf> getUfDao(){
        return new DaoGenerico<Uf>(Uf.class);
    } 
    public CidadeDao getCidadeDao() {
        return new CidadeDao();
    }
    public AlunoDao getAlunoDao(){
        return new AlunoDao();
    }
    public DaoGenerico<Despesa>getDespesaDao(){
        return new DaoGenerico<Despesa>(Despesa.class);
    }
     public DaoGenerico<Ocupacao> getOcupacaoDao(){
        return new DaoGenerico<Ocupacao>(Ocupacao.class);
    }
    public EntrevistaDao getEntrevistaDao(){
        return new EntrevistaDao();
    }
    public InscricaoDao getInscricaoDao(){
        return new InscricaoDao();
    }
    public DaoGenerico<Pessoa> getPessoaDao(){
        return new DaoGenerico<Pessoa>(Pessoa.class);
    }
    public DaoGenerico<Visita> getVisitaDao(){
        return new DaoGenerico<Visita>(Visita.class);
    }
    public DaoGenerico<Dependente> getDependenteDao(){
        return new DaoGenerico<Dependente>(Dependente.class);
    }
    public DaoGenerico<FichaMedica> getFichaMedicaDao(){
        return new DaoGenerico<FichaMedica>(FichaMedica.class);
    }
      public EditalDao getEditalDao(){
        return new EditalDao();
    }
    
    public CursoDao getCursoDao() {
        return new CursoDao();
    }    
    public DaoGenerico<Categoria>getCategoriaDao(){
        return new DaoGenerico<Categoria>(Categoria.class);
    }  
    
    public DaoGenerico<Campus>getCampusDao(){
        return new DaoGenerico<Campus>(Campus.class);
    }  
}