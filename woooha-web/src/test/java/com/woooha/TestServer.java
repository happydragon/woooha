package com.woooha;

import org.mortbay.jetty.Server;
import org.mortbay.jetty.webapp.WebAppContext;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: jian.liu
 * Date: 12-12-3
 * Time: 上午11:43
 * To change this template use File | Settings | File Templates.
 */
public class TestServer {

    private Server m_server;
    private int m_port;

    public TestServer(int port) {
        this.m_port = port;
    }

    private void startServer() throws Exception {
        Server server = new Server(m_port);
        WebAppContext context = new WebAppContext();
        File warRoot = new File("src/main/webapp");
        context.setContextPath("/woooha");
        context.setDescriptor(new File(warRoot, "WEB-INF/web.xml").getPath());
//        context.setExtraClasspath("target/classes");
        context.setClassLoader(Thread.currentThread().getContextClassLoader());
        context.setResourceBase(warRoot.getPath());
        server.setHandler(context);
        server.start();
        m_server = server;
    }

    public void startWebapp() throws Exception {

    }

    public void waitForAnyKey() throws IOException {
        String timestamp = new SimpleDateFormat("MM-dd HH:mm:ss.SSS").format(new Date());
        System.out.println(String.format("[%s] [INFO] Press any key to stop server ... ", timestamp));
        System.in.read();
    }

    public void stopServer() throws Exception {
        m_server.stop();
    }

    public static void main(String[] args) throws Exception {
        TestServer server = new TestServer(3477);
        server.startServer();
        server.startWebapp();
        server.waitForAnyKey();
        server.stopServer();
    }

}
