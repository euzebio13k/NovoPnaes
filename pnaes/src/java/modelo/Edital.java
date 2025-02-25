/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author ronan
 */
@Entity
public class Edital implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;
    private String numero;
    private GregorianCalendar dataInicial;
    private GregorianCalendar dataFinal;

    public String ativo() {
        GregorianCalendar dataAtual = new GregorianCalendar();
        if (this.getDataInicial().after(dataAtual)) {
            return "Pendente";
        } else if (this.getDataInicial().before(dataAtual) && this.getDataFinal().after(dataAtual)) {
            return "Aberto";
        } else {
            return "Encerrado";
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public GregorianCalendar getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(GregorianCalendar dataInicial) {
        this.dataInicial = dataInicial;
    }

    public GregorianCalendar getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(GregorianCalendar dataFinal) {
        this.dataFinal = dataFinal;
    }

    public String getNumeroEAno() {
        String ano = String.valueOf(getDataInicial().get(Calendar.YEAR));

        return numero + "/" + ano;
    }

}
