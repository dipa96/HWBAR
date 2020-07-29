package it.bean;

public class OrdiniUser {
private int id;
private double totale;
private String data;
private int status;
private int users_id;
private int pagamento_id;


public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public double getTotale() {
	return totale;
}
public void setTotale(double totale) {
	this.totale = totale;
}
public String getData() {
	return data;
}
public void setData(String data) {
	this.data = data;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public int getUsers_id() {
	return users_id;
}
public void setUsers_id(int users_id) {
	this.users_id = users_id;
}
public int getPagamento_id() {
	return pagamento_id;
}
public void setPagamento_id(int pagamento_id) {
	this.pagamento_id = pagamento_id;
}

}
