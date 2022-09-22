package cn.edu.neusoft.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
	  , urlPatterns = { "/*" }
	  , initParams={@WebInitParam(name="encoding",value="UTF-8")})

public class CharacterEncodingFilter implements Filter {

	String encoding;

    	public CharacterEncodingFilter() {
        	// TODO Auto-generated constructor stub
    	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		response.setContentType("text/html;charset=utf-8");
		if(encoding!=null)
			request.setCharacterEncoding(encoding);
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		encoding=fConfig.getInitParameter("encoding");
	}

}
