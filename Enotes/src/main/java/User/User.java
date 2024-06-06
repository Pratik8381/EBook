package User;

import lombok.*;

@AllArgsConstructor
@Data
@NoArgsConstructor
@Builder
@ToString
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
}
