package Service;

import Dao.Dao;
import User.User;

public class Service {
    Dao dao = new Dao();
    public boolean adduser(User user) {
      return   dao.adduser(user);
    }

    public User login(User user) {
        return   dao.login(user);

    }
}
