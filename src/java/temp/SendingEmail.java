package temp;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
	public class SendingEmail {

		private String sender_email, sender_password, sender_host, port_no,
				receiver_email, msg_text, msg_subject;

		public SendingEmail() {
			sender_host = "smtp.gmail.com";
			port_no = "465";
			msg_text = "Message Text is not set";
			msg_subject = "";

		}

		public Boolean send_email(String s_email, String s_password, String r_email,
				String m_sub, String m_text) {

			sender_email = s_email;
			sender_password = s_password;
			receiver_email = r_email;
			msg_subject = m_sub;
			msg_text = m_text;

			Boolean reply = send_mail();
			return reply;
		}

		public Boolean send_email(String host, String s_email, String s_password,
				String r_email, String m_sub, String m_text) {
			sender_host = host;
			sender_email = s_email;
			sender_password = s_password;
			receiver_email = r_email;
			msg_subject = m_sub;
			msg_text = m_text;

			Boolean reply = send_mail();
			return reply;
		}

		public Boolean send_email(String s_email, String s_password, String r_email,
				String m_text) {

			sender_email = s_email;
			sender_password = s_password;
			receiver_email = r_email;
			msg_text = m_text;

			Boolean reply = send_mail();
			return reply;
		}

		public Boolean send_email(String s_email, String s_password, String r_email) {

			sender_email = s_email;
			sender_password = s_password;
			receiver_email = r_email;

			Boolean reply = send_mail();
			return reply;
		}

		private Boolean send_mail() {
			
			Properties props = new Properties();
			props.put("mail.smtp.user", sender_email);
			props.put("mail.smtp.host", sender_host);
			props.put("mail.smtp.port", port_no);
			props.put("mail.smtp.starttls.enable", "true");

			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", port_no);
			props.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");

			props.put("mail.smtp.socketFactory.fall", "false");

			try {
				Authenticator auth = new SMTPAuthenticator();
				Session session = Session.getInstance(props, auth);

				// session.setDebug(true);

				MimeMessage msg = new MimeMessage(session);
				// msg.setText(msg_text);
				msg.setSubject(msg_subject);
				msg.setFrom(new InternetAddress(sender_email));
				msg.setContent(msg_text, "text/html");
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						receiver_email));
				Transport.send(msg);

			} catch (Exception mex) {
				mex.printStackTrace();
				return false;
			}
			return true;
		}

		private class SMTPAuthenticator extends javax.mail.Authenticator {

			@Override
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender_email, sender_password);
			}
		}
	}
	


