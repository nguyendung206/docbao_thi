package bo;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import dao.mahoadao;

public class mahoabo {
	mahoadao mhdao = new mahoadao();
	public String ecrypt(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException{ 
		return mhdao.ecrypt(text);
	}
}
