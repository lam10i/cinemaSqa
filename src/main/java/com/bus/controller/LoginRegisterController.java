package com.bus.controller;

import javax.servlet.http.HttpSession;

import com.bus.models.*;
import com.bus.repositories.EventRepo;
import com.bus.repositories.MovieRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bus.repositories.CustomerDao;


@Controller
public class LoginRegisterController {
    @Autowired
    private CustomerDao dao;
    @Autowired
    private MovieRepo movieRepo;
    @Autowired
    private EventRepo eventRepo;

    //	Logout process
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");

        session.removeAttribute("bookingdate");
        session.removeAttribute("bookingtime");
        session.removeAttribute("movieName");

        return "redirect:/";
    }

    //	Login process
    @PostMapping("/processing")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password,
                        HttpSession session, Model m) {

        Customer object = (Customer) session.getAttribute("user");
        if (object != null) {
            return "redirect:/booking-seat";
        } else {

            Customer customer = dao.login(email, password);

            if (customer == null) {
                m.addAttribute("failed", "Invalied login");
                return "login";
            } else {
                session.setAttribute("user", customer);
            }
            return "redirect:/home";
        }
    }
    //	Login form
    @GetMapping("/loginForm")
    public String loginForm(Model m) {
        m.addAttribute("menu", "login");
        return "login";
    }

    //	User save process
    @PostMapping("/save")
    public String save(@ModelAttribute("customer") Customer customer) {
        dao.save(customer);
        return "redirect:/register";

    }
    //Registeration User
    @GetMapping("/register")
    public String register(Model m) {

        m.addAttribute("menu", "register");
        return "register";
    }
}
