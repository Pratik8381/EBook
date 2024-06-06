package Dao;

import User.Post;
import UtillConnectior.UtillConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    public boolean addPost(String title, String content, int uid) throws SQLException {
        boolean flag = false;
        String sql = "INSERT INTO post (title, content, uid) VALUES (?, ?, ?)";
      Connection conn = UtillConnection.getCon();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, uid);
    int op=        ps.executeUpdate();
            if(op>0){
                flag = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return flag;
    }



    public List<Post> getData(int uid) throws SQLException {
        Post post = null;
        List<Post> list = new ArrayList<Post>();
        try {
            String sql = "SELECT * FROM post WHERE uid = ? ORDER BY id DESC";
            Connection conn = UtillConnection.getCon();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                post = new Post();

                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setPdate(rs.getDate("date"));
                list.add(post);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }


        return list;
    }

public Post getDataByID(int id) throws SQLException {
        Post post = null;
        try {
            String sql = "SELECT * FROM post WHERE id = ?";
            Connection conn = UtillConnection.getCon();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                post = new Post();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));


            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    return post;
}

public boolean postUpdate(int id, String title, String content) throws SQLException {
    boolean flag = false;
    try {


        String sql = "UPDATE post SET title = ?, content = ? WHERE id = ?";
        Connection conn = UtillConnection.getCon();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, content);
        ps.setInt(3, id);
        int op = ps.executeUpdate();
        if(op>0){
            flag = true;

        }

    }
    catch (SQLException e){
        throw new RuntimeException(e);
    }
    return flag;
}
public boolean deleteNotesByID(int id) throws SQLException {
        boolean flag = false;
        try {
            String sql = "DELETE FROM post WHERE id = ?";
            Connection conn = UtillConnection.getCon();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int op = ps.executeUpdate();
            if(op>0){
                flag = true;

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
return flag;
}
}
