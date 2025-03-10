package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.*;

@Entity
public class Entrevista implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    private GregorianCalendar dataEntrevista;
    private GregorianCalendar dataAgendadaEntrevista;
    private String local;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="inscricao_id",unique = true)
    private Inscricao inscricao;
    private String observacao;
    @ManyToOne(cascade = CascadeType.ALL)
    private Bolsa resultadoBolsa1;
    @ManyToOne(cascade = CascadeType.ALL)
    private Bolsa resultadoBolsa2;
    private String concorrencia;
    private String participaProjetos;
    private String bolsaPermanente;
    private String outraBolsa;
    private String visitaDomiciliar;
    private String vulnerabilidade;
    private String caracterizacao;
    private String entrevistador;
    private String resultado;

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }
    
    

    public String getConcorrencia() {
        return concorrencia;
    }

    public void setConcorrencia(String concorrencia) {
        this.concorrencia = concorrencia;
    }

    public String getParticipaProjetos() {
        return participaProjetos;
    }

    public void setParticipaProjetos(String participaProjetos) {
        this.participaProjetos = participaProjetos;
    }

    public String getBolsaPermanente() {
        return bolsaPermanente;
    }

    public void setBolsaPermanente(String bolsaPermanente) {
        this.bolsaPermanente = bolsaPermanente;
    }

    public String getOutraBolsa() {
        return outraBolsa;
    }

    public void setOutraBolsa(String outraBolsa) {
        this.outraBolsa = outraBolsa;
    }

    public String getVisitaDomiciliar() {
        return visitaDomiciliar;
    }

    public void setVisitaDomiciliar(String visitaDomiciliar) {
        this.visitaDomiciliar = visitaDomiciliar;
    }
    
    
    public Integer getId() {
        return id;
    }

    public Inscricao getInscricao() {
        return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
        this.inscricao = inscricao;
    }

    
    
    public void setId(Integer id) {
        this.id = id;
    }

    public GregorianCalendar getDataEntrevista() {
        return dataEntrevista;
    }

    public void setDataEntrevista(GregorianCalendar dataEntrevista) {
        this.dataEntrevista = dataEntrevista;
    }

    public GregorianCalendar getDataAgendadaEntrevista() {
        return dataAgendadaEntrevista;
    }

    public void setDataAgendadaEntrevista(GregorianCalendar dataAgendadaEntrevista) {
        this.dataAgendadaEntrevista = dataAgendadaEntrevista;
    }
    

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
    public String getVulnerabilidade() {
        return vulnerabilidade;
    }

    public void setVulnerabilidade(String vulnerabilidade) {
        this.vulnerabilidade = vulnerabilidade;
    }

    public String getCaracterizacao() {
        return caracterizacao;
    }

    public void setCaracterizacao(String caracterizacao) {
        this.caracterizacao = caracterizacao;
    }

    public String getEntrevistador() {
        return entrevistador;
    }

    public void setEntrevistador(String entrevistador) {
        this.entrevistador = entrevistador;
    }

    public Bolsa getResultadoBolsa1() {
        return resultadoBolsa1;
    }

    public void setResultadoBolsa1(Bolsa resultadoBolsa1) {
        this.resultadoBolsa1 = resultadoBolsa1;
    }

    public Bolsa getResultadoBolsa2() {
        return resultadoBolsa2;
    }

    public void setResultadoBolsa2(Bolsa resultadoBolsa2) {
        this.resultadoBolsa2 = resultadoBolsa2;
    }
    
}
