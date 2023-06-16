package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

public class userDBUtil {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static boolean raiseticket(int uid, String subject, String message) {
		boolean isSuccess = false;
		String status = "pending";

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			// insert into ticket
			String ticketSql = "INSERT INTO ticket VALUES( 0,  " + uid + " , '" + status + "' , NULL , '" + subject
					+ "' , NOW() )";

			int ticketrs = stmt.executeUpdate(ticketSql);

			// selecting ticket id
			String selecttid = "SELECT MAX(ticketId) as mx  FROM ticket  WHERE userId =" + uid;
			rs = stmt.executeQuery(selecttid);

			while (rs.next()) {
				int tid = rs.getInt("mx");

				// insert into message
				String messageSql = "INSERT INTO message VALUES ( " + tid + " , NOW() , " + uid + "  , '" + message
						+ "' )";
				int messagers = stmt.executeUpdate(messageSql);

				// if success
				if (ticketrs > 0 && messagers > 0) {
					isSuccess = true;
				} else // if unsuccessful
				{
					isSuccess = false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static ArrayList<User> getUserDetails(String eml, String pwd) {

		ArrayList<User> usr = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM enduser WHERE email = '" + eml + "' and password = '" + pwd + "'";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int userId = rs.getInt(1);
				String userName = rs.getString(2);
				String firstName = rs.getString(3);
				String lastName = rs.getString(4);
				String email = rs.getString(5);
				String password = rs.getString(6);
				String type = rs.getString(7);

				User.getInstance().setUserId(userId);
				User.getInstance().setUserName(userName);
				User.getInstance().setFirstName(firstName);
				User.getInstance().setLastName(lastName);
				User.getInstance().setEmail(email);
				User.getInstance().setPassword(password);
				User.getInstance().setType(type);
				// User u = new User(userId , userName , firstName , lastName , email ,password
				// , type) ;

				// usr.add(u) ;
				usr.add(User.getInstance());

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return usr;
	}

	public static ArrayList<Ticket> getTicketDetails(int uid) {

		ArrayList<Ticket> tkt = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM ticket WHERE userId = " + uid + " ORDER BY  lastmodified DESC ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int ticketId = rs.getInt(1);
				int userId = rs.getInt(2);
				String status = rs.getString(3);
				int agent = rs.getInt(4);
				String subject = rs.getString(5);
				String lastmod = rs.getString(6);
				Ticket t = new Ticket(ticketId, userId, status, agent, subject, lastmod);

				tkt.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tkt;
	}

	public static ArrayList<Ticket> getTickettypesDetails(int uid, String st) {

		ArrayList<Ticket> tkt = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM ticket WHERE userId = " + uid + " AND  status = '" + st
					+ "'  ORDER BY  lastmodified DESC ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int ticketId = rs.getInt(1);
				int userId = rs.getInt(2);
				String status = rs.getString(3);
				int agent = rs.getInt(4);
				String subject = rs.getString(5);
				String lastmod = rs.getString(6);

				Ticket t = new Ticket(ticketId, userId, status, agent, subject, lastmod);

				tkt.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tkt;
	}

	public static ArrayList<Ticket> getAgentTicketTypes(int uid, String st) {

		ArrayList<Ticket> tkt = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM ticket WHERE agent = " + uid + " AND  status = '" + st + "' AND userId != "
					+ uid + "  ORDER BY  lastmodified DESC ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int ticketId = rs.getInt(1);
				int userId = rs.getInt(2);
				String status = rs.getString(3);
				int agent = rs.getInt(4);
				String subject = rs.getString(5);
				String lastmod = rs.getString(6);

				Ticket t = new Ticket(ticketId, userId, status, agent, subject, lastmod);

				tkt.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tkt;
	}

	public static ArrayList<Ticket> getATicketDetails(int tid) {

		ArrayList<Ticket> tkt = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM ticket WHERE ticketId = " + tid + " ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int ticketId = rs.getInt(1);
				int userId = rs.getInt(2);
				String status = rs.getString(3);
				int agent = rs.getInt(4);
				String subject = rs.getString(5);
				String lastmod = rs.getString(6);
				// Ticket t = new Ticket (ticketId , userId , status ,agent ,subject , lastmod)
				// ;

				Ticket.getInstance();

				Ticket.getInstance().setTicketId(ticketId);
				Ticket.getInstance().setUserId(userId);
				Ticket.getInstance().setStatus(status);
				Ticket.getInstance().setAgent(agent);
				Ticket.getInstance().setSubject(subject);
				Ticket.getInstance().setLastmodified(lastmod);

				tkt.add(Ticket.getInstance());

				// tkt.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tkt;
	}

	public static boolean pickTicket(int tid, int uid) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE ticket SET status = 'onprogress' , agent = " + uid
					+ " , lastmodified = NOW() WHERE ticketId = " + tid + "";

			int messagers = stmt.executeUpdate(sql);

			if (messagers > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean sendMessage(int tid, int uid, String message) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "INSERT INTO message VALUES(" + tid + " , NOW() , " + uid + " , '" + message + "' )";

			int messagers = stmt.executeUpdate(sql);

			String timeupdate = "UPDATE ticket SET lastmodified = now() WHERE ticketId = " + tid;

			int timers = stmt.executeUpdate(timeupdate);

			if (messagers > 0 && timers > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static ArrayList<Message> getMessages(int tid) {

		ArrayList<Message> ms = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM message WHERE ticketId = " + tid + " ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int ticketId = rs.getInt(1);
				String time = rs.getString(2);
				int agent = rs.getInt(3);
				String content = rs.getString(4);

				Message m = new Message(ticketId, time, agent, content);

				ms.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ms;
	}

	public static boolean solveTicket(int tid) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE ticket SET status = 'solved' WHERE ticketId = " + tid + "";

			int messagers = stmt.executeUpdate(sql);

			if (messagers > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean deleteTemp(int tid) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE ticket SET status = 'trash' WHERE ticketId = " + tid + "";

			int deletetemprs = stmt.executeUpdate(sql);

			if (deletetemprs > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean deletePerm(int tid) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "DELETE FROM ticket WHERE ticketId = " + tid;
			String sql1 = "DELETE FROM message WHERE ticketId = " + tid;

			int deletemsg = stmt.executeUpdate(sql1);
			int deletepermrs = stmt.executeUpdate(sql);

			if (deletepermrs > 0 && deletemsg > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static ArrayList<Ticket> agentPick() {

		ArrayList<Ticket> tk = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM ticket WHERE status = 'pending' ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				int ticketId = rs.getInt(1);
				int userId = rs.getInt(2);
				String status = rs.getString(3);
				int agent = rs.getInt(4);
				String subject = rs.getString(5);
				String lastmod = rs.getString(6);
				Ticket t = new Ticket(ticketId, userId, status, agent, subject, lastmod);

				tk.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tk;
	}

	public static boolean validate(String email, String password) {

		boolean isSuccess = false;

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM enduser WHERE email = '" + email + "' and password = '" + password + "' ";

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean checkEmail(String email) {

		boolean isSuccess = false;

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM enduser WHERE email = '" + email + "' ";

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				isSuccess = false;
			} else {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean registerUser(String uname, String fname, String lname, String email, String password) {
		boolean isSuccess = false;

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			// insert into user
			String sql = "INSERT INTO enduser VALUES( 0 ,'" + uname + "' , '" + fname + "' , '" + lname + "' , '"
					+ email + "' , '" + password + "' , 'user' )";

			int userRs = stmt.executeUpdate(sql);

			if (userRs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static ArrayList<User> getuserTypes(String tp) {

		ArrayList<User> usr = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM enduser WHERE type = '" + tp + "' ";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int userID = rs.getInt(1);
				String userName = rs.getString(2);
				String firstName = rs.getString(3);
				String lastName = rs.getString(4);
				String email = rs.getString(5);
				String password = rs.getString(6);
				String type = rs.getString(7);

				User u = new User(userID, userName, firstName, lastName, email, password, type);

				usr.add(u);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return usr;
	}

	public static ArrayList<Ticket> allTickets() {

		ArrayList<Ticket> tk = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM ticket ORDER BY  lastmodified DESC";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				int ticketId = rs.getInt(1);
				int userId = rs.getInt(2);
				String status = rs.getString(3);
				int agent = rs.getInt(4);
				String subject = rs.getString(5);
				String lastmod = rs.getString(6);
				Ticket t = new Ticket(ticketId, userId, status, agent, subject, lastmod);

				tk.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tk;
	}

	public static boolean changeAsAdmin(int uid) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE enduser SET type = 'admin' WHERE userID = " + uid;

			int updateType = stmt.executeUpdate(sql);

			if (updateType > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean changeAsAgent(int uid) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE enduser SET type = 'agent' WHERE userID = " + uid;

			int updateType = stmt.executeUpdate(sql);

			if (updateType > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean removeUser(int uid) {

		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "DELETE from enduser WHERE userID = " + uid + "";

			int deleteUser = stmt.executeUpdate(sql);

			if (deleteUser > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static ArrayList<User> getProfileDetails(int uid) {

		ArrayList<User> usr = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM enduser WHERE userId = " + uid;

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int userId = rs.getInt(1);
				String userName = rs.getString(2);
				String firstName = rs.getString(3);
				String lastName = rs.getString(4);
				String email = rs.getString(5);
				String password = rs.getString(6);
				String type = rs.getString(7);

				User u = new User(userId, userName, firstName, lastName, email, password, type);

				usr.add(u);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return usr;
	}

	public static boolean deleteprofile(int uid) {
		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "DELETE FROM enduser WHERE userID = " + uid;
			String sql1 = "DELETE FROM ticket WHERE userId = " + uid;
			String sql2 = "DELETE FROM message where ticketId = any (select ticketId from ticket where userId = " + uid
					+ ")";

			int deleteprof = stmt.executeUpdate(sql2);
			int deleteprof1 = stmt.executeUpdate(sql1);
			int deleteprof2 = stmt.executeUpdate(sql);

			if (deleteprof > 0)
				isSuccess = true;
			else
				isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

}
