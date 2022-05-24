package com.example.demo;

import containers.Train;
import sql.DBmanager;
import containers.User;

import java.io.*;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/")
public class HelloServlet extends HttpServlet {
    private DBmanager dBmanager;

    public void init() {
        System.out.println("#init");
        dBmanager = new DBmanager();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("#doPost " + req.getSession().getId());
        final String action = req.getServletPath();
        System.out.println(action);
        switch (action){
            case "/new":
                addUser(req, resp);
                break;
            case "/enter":
                if(dBmanager.isCorrect(req.getParameter("username"), req.getParameter("password"), req.getSession().getId())) {
                    req.setAttribute("res", "Successful registration");
                }else {
                    req.setAttribute("res", "Registration fail");
                }
                req.getRequestDispatcher("Success.jsp").forward(req, resp);
//                showTrains(req, resp);
                break;
            case "/trains":
                doGet(req, resp);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("#doGet " + req.getSession().getId());
        String action = req.getServletPath();
        System.out.println(action);
        switch (action) {
            case "/menu" -> {
                var name = dBmanager.findUser(req.getSession().getId());
                if(name == null){
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }else {
                    req.setAttribute("ticket", dBmanager.findUserTickets(dBmanager.findUserId(req.getSession().getId())));
                    req.setAttribute("reg", name);
                    req.setAttribute("trains", dBmanager.selectTrains().subList(1, 2));
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }
            }
            case "/exit" -> {
                dBmanager.editSessionId(req.getSession().getId(), "");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
            case "/buy" -> {
                if(dBmanager.findUser(req.getSession().getId())==null){
                    req.setAttribute("res", "Fail, you have to login firstly");
                    req.getRequestDispatcher("Success.jsp").forward(req, resp);
                }else {
                    buyTicket(req, resp);
                }
            }
            case "/select" -> {
                var name = dBmanager.findUser(req.getSession().getId());
                if(name != null){
                    req.setAttribute("ticket", dBmanager.findUserTickets(dBmanager.findUserId(req.getSession().getId())));
                    req.setAttribute("reg", name);
                }
                System.out.print(req.getParameter("first") + " ");
                System.out.println(req.getParameter("last"));
                var d = selectTrain(req.getParameter("first"), req.getParameter("last"));
                System.out.println(d);
                req.setAttribute("search", d);
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            } case "/delete" -> {
                dBmanager.deleteUserTicket(dBmanager.findUserId(req.getSession().getId()), req.getParameter("f"), req.getParameter("l"));
                var name = dBmanager.findUser(req.getSession().getId());
                req.setAttribute("ticket", dBmanager.findUserTickets(dBmanager.findUserId(req.getSession().getId())));
                req.setAttribute("reg", name);
                req.setAttribute("trains", dBmanager.selectTrains().subList(1, 2));
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
            default -> {
                req.setAttribute("res", "Successful registration");
                showTrains(req, resp);
            }
        }
    }

    public void destroy() {
        System.out.println("#destroy");
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var user = createUser(req, resp);
        System.out.println(req.getParameter("fn"));
        System.out.println(req.getAttribute("pas"));
        for (var s: req.getParameterMap().entrySet()){
            System.out.println(s.getKey() + " " + Arrays.toString(s.getValue()));
        }
        dBmanager.insertUserSQL(user);
        req.setAttribute("res", "Successful registration");
        req.setAttribute("reg", "Registered");
        showTrains(req, resp);
    }

    private User createUser(HttpServletRequest req, HttpServletResponse resp) {
        User user = new User();
        user.setFirstName(req.getParameter("firstName"));
        user.setLastName(req.getParameter("lastName"));
        user.setUserName(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        user.setAddress(req.getParameter("address"));
        user.setContact(req.getParameter("contact"));
        user.setSessionId(req.getSession().getId());
        return user;
    }

    private void showTrains(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = Integer.parseInt(req.getParameter("page"));
        List<Train> trains = dBmanager.selectTrains().subList(page*3 - 3, page*3);
        System.out.println(trains);
        req.setAttribute("trains", trains);
        req.setAttribute("reg", "Registered");
        req.getRequestDispatcher("Registered.jsp").forward(req, resp);
    }

    public void buyTicket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        dBmanager.editFreeSeats(req.getParameter("f"), req.getParameter("l"));
        dBmanager.addTickets(dBmanager.findUserId(req.getSession().getId()), req.getParameter("f"), req.getParameter("l"));
        req.setAttribute("res", "Success,\n" + dBmanager.findUser(req.getSession().getId()) + " you buy 1 ticket");
        req.getRequestDispatcher("Success.jsp").forward(req, resp);
    }

    public List<Train> selectTrain(String first, String last) {
        return dBmanager.selectTrains().stream()
                .filter(a -> a.getFirst().equals(first) && a.getLast().equals(last)).collect(Collectors.toList());
    }
}