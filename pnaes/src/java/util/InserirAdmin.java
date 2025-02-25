package util;

import dao.DaoFactory;
import modelo.Pessoa;

public class InserirAdmin {
    
    
    public static void main(String[] args) {
        
        Pessoa pessoa = new Pessoa();
        DaoFactory daoFactory = new DaoFactory();
        pessoa.setNome("Admin");
        pessoa.setCpf("123456");
        pessoa.setNivel(3);
        daoFactory.getPessoaDao().inserirOuAlterar(pessoa);
     }
    
}