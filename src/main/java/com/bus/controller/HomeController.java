package com.bus.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.bus.models.*;
import com.bus.repositories.EventRepo;
import com.bus.repositories.MovieRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bus.repositories.CustomerDao;


@Controller
public class HomeController {
    @Autowired
    private CustomerDao dao;
    @Autowired
    private MovieRepo movieRepo;
    @Autowired
    private EventRepo eventRepo;


    // Opening home page
    @GetMapping("/")
    public String home(Model m, HttpSession session) {

        String movie = (String) session.getAttribute("movieName");
        System.out.println(movie + "========Index");
        List<MovieDetails> movie2 = movieRepo.findAll();
        m.addAttribute("movieList", movie2);
        m.addAttribute("menu", "home");

        return "index";
    }
    @GetMapping("/search")
    public String search(@Param("keyword") String keyword,Model m){
        List<MovieDetails> movie2=movieRepo.search(keyword);
        m.addAttribute("movieList",movie2);
        m.addAttribute("menu", "home");
        return "search_result";
    }
    @GetMapping("/searchHome")
    public String searchHome(@Param("keyword") String keyword,Model m){
        List<MovieDetails> movie2=movieRepo.search(keyword);
        m.addAttribute("movieList",movie2);
        m.addAttribute("menu", "home");
        return "search_result-home";
    }
    @GetMapping("/event")
    public String event(Model m, HttpSession session){
        String movie = (String) session.getAttribute("movieName");
        m.addAttribute("menu", "home");
        List<Event> eventList=eventRepo.findAll();
        m.addAttribute("eventList",eventList);
        return "event";
    }
    @GetMapping("eventHome")
    public String eventHome(Model m, HttpSession session){
        String movie = (String) session.getAttribute("movieName");
        System.out.println(movie + "========Index");
        m.addAttribute("menu", "home");
        List<Event> eventList=eventRepo.findAll();
        m.addAttribute("eventList",eventList);
        return "eventHome";
    }
    @GetMapping("/contact")
    public String contact(Model model){
        return "contactUs";
    }
    @GetMapping("/contactHome")
    public String contactHome(Model model){
        return "contactUsHome";
    }
    //	Exception handling
    @ExceptionHandler(Exception.class)
    public String handleError(Exception ex, Model m, HttpSession session) {
        Customer object = (Customer) session.getAttribute("user");
        if (object == null) {
            return "redirect:/loginForm";
        } else {
            return "redirect:/home";
        }
    }
    //	User Setting
    @GetMapping("/setting")
    public String getSetting(Model m, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("user");
        m.addAttribute("user", customer);
        m.addAttribute("menu", "setting");
        return "setting";
    }





    //	User update form
    @GetMapping("/setting/update/{id}")
    public String updateForm(@PathVariable("id") long id, Model m) {
        System.out.println(id);
        m.addAttribute("menu", "setting");
        return "update-details";

    }

    //	update Details
    @PostMapping("/setting/update-details")
    public String updateDetails(@ModelAttribute("customer") Customer cust, HttpSession session) {
        String name = cust.getName();
        String email = cust.getEmail();
        Customer customer = (Customer) session.getAttribute("user");
        customer.setName(name);
        customer.setEmail(email);
        dao.updateDetail(customer);

        return "redirect:/setting";

    }
    //	Order history
    @GetMapping("/order-history")
    public String history(HttpSession session, Model m) {
        Date todayDate = new Date();
        Customer object = (Customer) session.getAttribute("user");
        session.setAttribute("user", object);
        List<OrderHistory> list = dao.getAllHistory(object.getBid());
        m.addAttribute("hList", list);
        m.addAttribute("todaydate", todayDate);

        LocalDate date = (LocalDate) session.getAttribute("bookingdate");
        System.out.println(date);
        m.addAttribute("menu", "order");
        return "history";
    }
    @GetMapping("/home")
    public String mainDashboard(HttpSession session, Model m) {
        session.removeAttribute("bookingdate");
        session.removeAttribute("bookingtime");
        session.removeAttribute("movieName");
        m.addAttribute("menu", "home");

        String message = (String) session.getAttribute("msg");
        m.addAttribute("message", message);
        session.removeAttribute("msg");
//		System.out.println(message);
        List<MovieDetails> movie2 = movieRepo.findAll();
        m.addAttribute("listMovie", movie2);

        return "main-dashboard";
    }
    @GetMapping("/movieDetail/{movieId}")
    public String detailMovie(Model m,@PathVariable Long movieId) {

        MovieDetails movie2 = movieRepo.getById(movieId);
        m.addAttribute("m", movie2);

        return "detail-movie";
    }
    @GetMapping("/movie-detail-manage/{movieId}")
    public String detailMovieManage(Model m,@PathVariable Long movieId) {

        MovieDetails movie2 = movieRepo.getById(movieId);
        m.addAttribute("m", movie2);

        return "detail-manage-movie";
    }



    @GetMapping("/movieDetailHome/{movieId}")
    public String detailMovieHome(Model m,@PathVariable Long movieId) {

        MovieDetails movie2 = movieRepo.getById(movieId);
        m.addAttribute("m", movie2);
        return "detail-movie-home";
    }
}
