/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author MSI LAPTOP
 */
public class AccountDBContext extends DBContext {

    public Account check(String userid, String password) {
        try {
            String sql = "SELECT [userid]\n"
                    + "      ,[password]\n"
                    + "      ,[displayname]\n"
                    + "  FROM [dbo].[Account]\n"
                    + "  where userid = ? and [password]= ?\n";
                   
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, userid);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account ac = new Account(rs.getString("userid"), rs.getString("password"), rs.getString("displayname"));
                        return ac; 
            
            }
        } catch (Exception e) {
        }

        return null ;
    }
    
    public static void main(String[] args) {
        AccountDBContext db = new AccountDBContext();
        Account account = db.check("mra", "mra");
        System.out.println(account.getUserid());
        
    }
    
}

