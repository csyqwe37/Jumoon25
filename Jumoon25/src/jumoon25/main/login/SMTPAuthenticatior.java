package jumoon25.main.login;
import javax.mail.PasswordAuthentication;

import com.sun.net.httpserver.Authenticator;
import com.sun.net.httpserver.HttpExchange;

public class SMTPAuthenticatior extends Authenticator{ 
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("���� ID","���� PW");
    }

	@Override
	public Result authenticate(HttpExchange arg0) {
		// TODO Auto-generated method stub
		return null;
	}
}