package User;

public class Message {
	private int ticketId ;
	private String time ;
	private int sender ;
	private String content ;
	
	
	public Message(int ticketId, String time, int sender, String content) {
		
		this.ticketId = ticketId;
		this.time = time;
		this.sender = sender;
		this.content = content;
	}


	public int getTicketId() {
		return ticketId;
	}


	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public int getSender() {
		return sender;
	}


	public void setSender(int sender) {
		this.sender = sender;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	

}
