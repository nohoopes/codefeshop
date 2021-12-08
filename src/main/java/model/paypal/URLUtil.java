package model.paypal;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.*;

public class URLUtil {
    public static String getCurrentUrl(HttpServletRequest request) throws MalformedURLException, URISyntaxException {

        URL url = new URL(request.getRequestURL().toString());

        String host  = url.getHost();
        String directory_url = "https://" + host + "/";
        return  directory_url;
    }
}
