package it.bean;

public class ProductBean {
private int id;
private String nome;
private double prezzo;
private int deposito;
private String descrizione;
private int idcategorie;
private String path;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public double getPrezzo() {
	return prezzo;
}
public void setPrezzo(double prezzo) {
	this.prezzo = prezzo;
}
public int getDeposito() {
	return deposito;
}
public void setDeposito(int deposito) {
	this.deposito = deposito;
}
public String getDescrizione() {
	return descrizione;
}
public void setDescrizione(String descrizione) {
	this.descrizione = descrizione;
}
public int getIdcategorie() {
	return idcategorie;
}
public void setIdcategorie(int idcategorie) {
	this.idcategorie = idcategorie;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}

}
