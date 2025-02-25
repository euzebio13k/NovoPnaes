/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dao.DaoFactory;
import modelo.Pessoa;

/**
 *
 * @author euzebio
 */
public class Teste {
    public static void main(String[] args) {
        
        
        DaoFactory daoFactory = new DaoFactory();
        Pessoa pessoa = (Pessoa) daoFactory.getPessoaDao().pesquisarPor("123456", "cpf").get(0);
        System.out.println("aki");
        
     }
}
