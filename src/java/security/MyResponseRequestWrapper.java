/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.inter.security;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 *
 * @author <Eduardo at EBS>
 */
public class MyResponseRequestWrapper extends HttpServletResponseWrapper {

    public MyResponseRequestWrapper(HttpServletResponse response) {
        super(response);
    }


    /*METODOS NO ENCONTRADOS EN JAVA 6
    @Override
    public String getHeader(String name) {
        // TODO Auto-generated method stub
        return super.getHeader(name);
    }

    @Override
    public Collection<String> getHeaderNames() {
        // TODO Auto-generated method stub
        return super.getHeaderNames();
    }
     */

    @Override
    public void addHeader(String name, String value) {
        super.addHeader(name, value); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setHeader(String name, String value) {
        super.setHeader(name, value); //To change body of generated methods, choose Tools | Templates.
    }

//    protected void doFilterInternal(HttpServletRequest request,
//            HttpServletResponse response, FilterChain filterChain)
//            throws ServletException, IOException {
//
//        HttpServletResponse myResponse = (HttpServletResponse) response;
//        MyResponseRequestWrapper responseWrapper = new MyResponseRequestWrapper(myResponse);
//        responseWrapper.addHeader("X-XSS-Protection", "1");
//        responseWrapper.addHeader("secure", "*");
//        filterChain.doFilter(request, myResponse);
//    }
}