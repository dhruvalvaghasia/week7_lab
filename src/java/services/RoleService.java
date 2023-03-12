/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import Dataaccess.RoleDB;
import java.util.ArrayList;
import models.Role;

/**
 *
 * @author dhruv
 */
public class RoleService {
    public ArrayList<Role> getAll() throws Exception {
        RoleDB newRoleDB = new RoleDB();
        ArrayList<Role> store_role = newRoleDB.getAll();
        return store_role;
    }
    
   
}