package User;

public class Ticket {
	private int ticketId ;
	private int userId ;
	private String status ;
	private int agent ;
	private String subject ;
	private String lastmodified ;
	
	private static Ticket uniqueinstance ;
	
	private Ticket() {} ;
	
	public static Ticket getInstance() {
		
		if(uniqueinstance ==  null) {
			synchronized(User.class) {
				if( uniqueinstance ==  null ) {
					uniqueinstance =  new Ticket() ;
				}
			}
		}
		return uniqueinstance;
	}
	
	public Ticket(int ticketId, int userId, String status, int agent, String subject , String lastmodified) {
		
		this.ticketId = ticketId;
		this.userId = userId;
		this.status = status;
		this.agent = agent;
		this.subject = subject;
		this.lastmodified = lastmodified ;
	}

	public String getLastmodified() {
		return lastmodified;
	}

	public void setLastmodified(String lastmodified) {
		this.lastmodified = lastmodified;
	}

	public int getTicketId() {
		return ticketId;
	}

	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAgent() {
		return agent;
	}

	public void setAgent(int agent) {
		this.agent = agent;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
}
