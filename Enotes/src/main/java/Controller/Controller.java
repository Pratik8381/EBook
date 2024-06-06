package Controller;

import Service.Service;
import User.User;

public class Controller {
     Service service = new Service();
    public boolean adduser(User user) {
    return service.adduser(user);
    }
    public User login(User user) {
        return service.login(user);
    }

}
