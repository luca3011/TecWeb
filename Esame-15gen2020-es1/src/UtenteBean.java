import java.util.Date;

public class UtenteBean {
	
	private String nomeUtente;
	private String password;
	private String gruppo;
	private Date zero;
	private boolean valid;
	
	public UtenteBean()
	{
		super();
		this.zero= new Date();
	}

	public String getNomeUtente() {
		return nomeUtente;
	}

	public void setNomeUtente(String nomeUtente) {
		this.nomeUtente = nomeUtente;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGruppo() {
		return gruppo;
	}

	public void setGruppo(String gruppo) {
		this.gruppo = gruppo;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	
	public Date getZero() {
		return zero;
	}

	public void setZero(Date zero) {
		this.zero = zero;
	}

	@Override
	public String toString()
	{
		return "Utente [nomeUtente=" + nomeUtente + ", gruppo=" + gruppo + ", valid=" + valid + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((gruppo == null) ? 0 : gruppo.hashCode());
		result = prime * result + ((nomeUtente == null) ? 0 : nomeUtente.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + (valid ? 1231 : 1237);
		result = prime * result + ((zero == null) ? 0 : zero.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UtenteBean other = (UtenteBean) obj;
		if (gruppo == null) {
			if (other.gruppo != null)
				return false;
		} else if (!gruppo.equals(other.gruppo))
			return false;
		if (nomeUtente == null) {
			if (other.nomeUtente != null)
				return false;
		} else if (!nomeUtente.equals(other.nomeUtente))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (valid != other.valid)
			return false;
		if (zero == null) {
			if (other.zero != null)
				return false;
		} else if (!zero.equals(other.zero))
			return false;
		return true;
	}
	
	public boolean isStillValid()
	{
		if((this.getZero().getTime() - new Date().getTime())>=60000*24*60)
		{
			this.setValid(false);
			return false;
		}else
		{
			this.setValid(true);
			return true;
		}
	}
	
	

}
