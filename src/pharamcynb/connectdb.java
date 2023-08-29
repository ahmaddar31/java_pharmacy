/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pharamcynb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.BufferedReader;
import java.io.FileReader;
import org.json.JSONObject;

public class connectdb {
    public static Connection createconnection() {
        
        try {
            /*// Create a new FileReader object.
            FileReader fileReader = new FileReader("config.json");
            // Create a new BufferedReader object.
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            // Read the contents of the JSON file into a String object.
            String json = bufferedReader.readLine();
            // Parse the String object into a JSONObject object.
            JSONObject jsonObject = new JSONObject(json);
            // Get the value of the credentials property from the JSONObject object.
            JSONObject credentials = jsonObject.getJSONObject("credentials");
            // Get the values of the url, username, and password properties from the credentials object.
            String url = credentials.getString("url");
            String username = credentials.getString("username");
            String password = credentials.getString("password");*/
            
            String url = "jdbc:mysql://localhost:3306/pharmacy";
            String username = "root";
            String password = "";
            
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // Connection successful
            System.out.println("Connected to the database!");
            //bufferedReader.close();
            return conn;
        }catch (ClassNotFoundException e){
            System.out.println("MySQL JDBC driver not found.");
            e.printStackTrace();
            return null;
        }catch (SQLException e) {
            System.out.println("Connection to the database failed.");
            e.printStackTrace();
            return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
