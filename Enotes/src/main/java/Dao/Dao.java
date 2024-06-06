package Dao;

import User.User;
import UtillConnectior.UtillConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dao {

    public boolean adduser(User user){
boolean flag = false;


try {
    String sql = "insert into user(name,email,password) values(?,?,?)";
    Connection connection= UtillConnection.getCon();
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, user.getName());
    preparedStatement.setString(3, user.getEmail());
    preparedStatement.setString(2, user.getPassword());
      int f = preparedStatement.executeUpdate();
    if(f==1){
flag = true;
    }



}catch (Exception e) {
    e.printStackTrace();

}



return flag;

    }

    public User login(User user){
        User user1 = null;

        String sql = "SELECT * FROM user WHERE email=? AND password=?";
        try (Connection connection = UtillConnection.getCon();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
user1=User.builder()
        .id(resultSet.getInt("id"))
        .name(resultSet.getString("name"))
        .email(resultSet.getString("email"))
        .password(resultSet.getString("password"))
        .build();

                }
            }
        } catch (SQLException e) {
            // Rethrow as a runtime exception to propagate it to the caller
            throw new RuntimeException("Error during login", e);
        }

        return user1;

    }

}
