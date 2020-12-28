import java.util.ArrayList;
import java.util.List;

public class GruppoBean {
	
	private List<UtenteBean> utenti;
	private String nomeGruppo;
	
	public GruppoBean()
	{
		this.utenti = new ArrayList<UtenteBean>();
	}

	public List<UtenteBean> getUtenti() {
		return utenti;
	}

	public void setUtenti(List<UtenteBean> utenti) {
		this.utenti = utenti;
	}

	public String getNomeGruppo() {
		return nomeGruppo;
	}

	public void setNomeGruppo(String nomeGruppo) {
		this.nomeGruppo = nomeGruppo;
	}
	
	public void addUtente(UtenteBean utente)
	{
		if(utente==null)
			return;
		
		if(this.utenti.contains(utente))
		{
			this.utenti.remove(utente);
			this.utenti.add(utente);
		}
		
	}
	
	public void removeUtente(UtenteBean utente)
	{
		this.utenti.remove(utente);
	}
	
	public boolean containsUser(UtenteBean utente)
	{
		return this.utenti.contains(utente);
	}
	
	public UtenteBean getUtenteByName(String name)
	{
		if(name.isEmpty() || name==null)
			return null;
		for(UtenteBean u: this.utenti)
		{
			if(u.getNomeUtente().equals(name))
			{
				return u;
			}
		}
		return null;
	}
	
	public int checkValidity()
	{
		int result=0;
		for(UtenteBean u: this.utenti)
		{
			if(!u.isStillValid())
			{
				result++;
			}
		}
		return result;
	}

	
	
	
	
	
	
}
