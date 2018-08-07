package com.coe.uitl;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharEncodingFilter implements Filter {

	protected FilterConfig filterConfig;
	protected String encodingName;
	protected boolean enable;

	public CharEncodingFilter() {

		this.encodingName = "utf-8";
		this.enable = false;
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (this.enable) {
			request.setCharacterEncoding(this.encodingName);
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterConfig = filterConfig;
		loadConfigParams();
	}

	private void loadConfigParams() {

		this.encodingName = this.filterConfig.getInitParameter("encoding");
		String strIgnoreFlag = this.filterConfig.getInitParameter("enable");
		if (strIgnoreFlag.equalsIgnoreCase("true")) {
			this.enable = true;
		} else {
			this.enable = false;
		}
	}
}
