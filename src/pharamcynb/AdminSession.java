/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pharamcynb;

/**
 *
 * @author HP
 */
public class AdminSession {
    private static boolean isLoggedIn = false;
    private static int adminId = -1;
    private static int ministryAdminId = -1;

    public static boolean isLoggedIn() {
        return isLoggedIn;
    }

    public static void setLoggedIn(boolean loggedIn, int id) {
        isLoggedIn = loggedIn;
        adminId = id;
    }
    
    public static int getAdminId() {
        return adminId;
    }
    
    public static void setMinistryAdminId(boolean loggedIn,int id) {
        isLoggedIn = loggedIn;
        ministryAdminId = id;
    }

    public static int getMinistryAdminId() {
        return ministryAdminId;
    }
}

