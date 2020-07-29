package it.bean;

public class LoginBean {
	private int idcostumer;
	private String email;
	private String nome;
	private String password;
	private String cognome;
	private String indirizzo;
	private String city;
	private int cap;
	private int civico;
	private String dnascita;
	private String ntel1;
	private String ntel2;
	private String ruolo;
	
	public int getCivico() {
		return civico;
		}
		public void setCivico(int civico) {
			this.civico = civico;
		}
	public String getRuolo() {
		return ruolo;
		}
		public void setRuolo(String ruolo) {
			this.ruolo = ruolo;
		}
	public int getIdcostumer() {
	return idcostumer;
	}
	public void setIdcostumer(int idcostumer) {
		this.idcostumer = idcostumer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getCap() {
		return cap;
	}
	public void setCap(int cap) {
		this.cap = cap;
	}
	public String getDnascita() {
		return dnascita;
	}
	public void setDnascita(String dnascita) {
		this.dnascita = dnascita;
	}
	public String getNtel1() {
		return ntel1;
	}
	public void setNtel1(String ntel1) {
		this.ntel1 = ntel1;
	}
	public String getNtel2() {
		return ntel2;
	}
	public void setNtel2(String ntel2) {
		this.ntel2 = ntel2;
	}
}
