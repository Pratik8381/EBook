package User;

import lombok.*;

import java.util.Date;


@AllArgsConstructor
@Data
@NoArgsConstructor
@Builder
@ToString

public class Post {

    private int id;
    private String title;
    private String content;
    private Date pdate;
    private User user ;
}
