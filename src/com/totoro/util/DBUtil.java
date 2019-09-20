package com.totoro.util;

import com.totoro.model.User;

import java.util.HashMap;
import java.util.Map;

public class DBUtil {
    private static Map<String,User> db=new HashMap<>();
    public static boolean addUser(String username,String password,int age,String sex){
        if (db.containsKey(username)){
            return false;
        }else{
            db.put(username,new User(username,password,age,sex));
            return true;
        }
    }
    public static User verifAccount(String username,String password){
        if (db.containsKey(username)){
            User user=db.get(username);
            if (user.getPassword().equals(password)){
                return user;
            }else {
                return null;
            }
        }
        return  null;
    }
}
