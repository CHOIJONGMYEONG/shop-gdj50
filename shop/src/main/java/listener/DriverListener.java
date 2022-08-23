package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class DriverListener
 *
 */
@WebListener
public class DriverListener implements ServletContextListener {

    public DriverListener() {
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
         // 톰캣이꺼질떄 실행
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	
         // 톰캣이 실행될때 작동
    	
    	sce.getServletContext().setAttribute("currentCounter", 1);
    	// 2)톰캣 부팅시 드라이버 로딩
    	try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.print("드라이버로딩 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }
	
}
