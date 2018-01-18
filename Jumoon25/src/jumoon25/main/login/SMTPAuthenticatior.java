package jumoon25.main.login;
import javax.mail.PasswordAuthentication;

import com.sun.net.httpserver.Authenticator;
import com.sun.net.httpserver.HttpExchange;

public class SMTPAuthenticatior extends Authenticator{ 
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("메일 ID","메일 PW");
    }

	@Override
	public Result authenticate(HttpExchange arg0) {
		// TODO Auto-generated method stub
		return null;
	}
}