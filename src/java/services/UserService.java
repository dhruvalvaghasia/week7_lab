/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import Dataaccess.UserDb;
import java.util.ArrayList;
import models.User;

/**
 *
 * @author dhruv
 */
public class UserService {
    public ArrayList<User> getAll() throws Exception {
        UserDb newUserDB = new UserDb();
        ArrayList<User> store_user = newUserDB.getAll();
        return store_user;
    }
    

}
