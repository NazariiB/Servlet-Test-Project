package sql;

import containers.Train;
import containers.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBmanager {
    private Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_test", "root", "root");
        }catch (SQLException | ClassNotFoundException exception){
            exception.printStackTrace();
        }
        return connection;
    }
    public void insertUserSQL(User user) {
        try (Connection connection = getConnection()) {
            Statement statement = connection.createStatement();
             statement.execute("insert into users values(default, '"+user.getFirstName() +"', '"+user.getLastName() +
                    "', '"+user.getUserName() +"', '"+user.getPassword() +"', '"+user.getAddress() +"', '"+user.getContact() +"','" + user.getSessionId() + "')");
            System.out.println(user);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public boolean isCorrect(String username, String password, String session_id) {
        boolean res = false;
        try (Connection connection = getConnection()){
            ResultSet resultSet = connection.createStatement().executeQuery("select first_name from users where password='" + password + "' and username='" + username + "'");
            connection.createStatement().execute("update users set session_id='" + session_id + "' where password='" + password + "' and username='" + username + "'");
            res = resultSet.next();
            System.out.println(res);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return res;
    }

    public List<Train> selectTrains(){
        List<Train> trains = new ArrayList<>();
        try (ResultSet resSet = getConnection().createStatement().executeQuery("select * from trains")) {
            while (resSet.next()) {
                Train train = new Train();
                train.setFirst(resSet.getString("first"));
                train.setLast(resSet.getString("final"));
                train.setFreeSeats(resSet.getInt("free_seats"));
                trains.add(train);
                }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return trains;
    }

    public String findUser(String sessoinId){
        String user = null;
        String query = "select first_name from users where session_id='" + sessoinId + "'";
        try (Connection connection = getConnection()){
            ResultSet resultSet = connection.createStatement().executeQuery(query);
            while (resultSet.next()) {;
                user = resultSet.getString("first_name");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    public boolean editSessionId(String oldId, String newId) {
        boolean res = false;
        try (Statement statement = getConnection().createStatement()) {
            statement.execute("update users set session_id='" + newId + "' where session_id='" + oldId + "'");
            res = true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return res;
    }

    public void editFreeSeats(String first, String last) {
        try (Statement statement = getConnection().createStatement()) {
            statement.execute("update trains set free_seats=(free_seats + 1) where first='" + first + "' and final='" + last + "'");
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addTickets (int id, String first, String last) {
        try (Statement statement = getConnection().createStatement()) {
            statement.execute("insert into tickets values(" + id + ", '" + first + "', '" + last + "')");
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int findUserId(String sessionId) {
        int res = 0;
        try (Statement statement = getConnection().createStatement()) {
            ResultSet resultSet = statement.executeQuery("select id from users where session_id='" + sessionId + "'");
            if(resultSet.next()){
                res = resultSet.getInt("id");
            }else {
                System.out.println("Not found");
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public List<Train> findUserTickets(int id) {
        List<Train> trains = new ArrayList<>();
        try (ResultSet resSet = getConnection().createStatement().executeQuery("select * from tickets where user_id=" + id)) {
            while (resSet.next()) {
                Train train = new Train();
                train.setFirst(resSet.getString("first"));
                train.setLast(resSet.getString("final"));
                trains.add(train);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return trains;
    }

    public void deleteUserTicket(int id, String first, String last) {
        try (Statement statement = getConnection().createStatement()) {
            statement.execute("delete from tickets where user_id=" + id + " and first='" + first + "' and final='" + last + "'");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
