package com.bus.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.bus.models.*;
import com.bus.repositories.EventRepo;
import com.bus.repositories.MovieRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bus.repositories.CustomerDao;


@Controller
public class AdminController {
    @Autowired
    private CustomerDao dao;
    @Autowired
    private MovieRepo movieRepo;
    @Autowired
    private EventRepo eventRepo;

    @GetMapping("/admin")
    public String admin(Model m) {
        m.addAttribute("menu", "home");
        List<MovieDetails> movie2 = movieRepo.findAll();
        m.addAttribute("listMovie", movie2);
        return "adminPage";
    }
    //	Admin power to clear All seats
    @GetMapping("/clear-seats")
    public String eraseSeat(HttpSession session) {
        LocalDate now = LocalDate.now();
        String time = "09:00 am";
        Customer object = (Customer) session.getAttribute("user");

        if (object != null) {
            List<Seat> list = dao.getAllSeat(now, time);
            for (Seat seat : list) {
                long id = seat.getsId();
                dao.delete(id);
            }

        }
        return "redirect:/booking-seat";
    }

    //	Admin can see all Customers
    @GetMapping("/all-customers-records")
    public String allRecords(Model m, HttpSession session) {
        Customer object = (Customer) session.getAttribute("user");
        m.addAttribute("menu", "home");
        String message = (String) session.getAttribute("msg");
        m.addAttribute("message", message);
        session.removeAttribute("msg");
        long bid = object.getBid();
        if (bid == 1) {
            List<Customer> all = dao.getAll();
            m.addAttribute("records", all);
            m.addAttribute("menu", "allusers");
            return "user_records";
        } else {
            return "redirect:/booking-seat";
        }
    }

    //	Admin can see all Customers and their seats
    @GetMapping("/all-seats/{id}")
    public String allSeats(@PathVariable("id") long id, Model m, HttpSession session) {
        Customer object = (Customer) session.getAttribute("user");
        long bid = object.getBid();
        if (bid == 1) {
            List<OrderHistory> list = dao.getAllHistory(id);
            m.addAttribute("seatRecords", list);
            m.addAttribute("menu", "allusers");
            return "seat-records";
        } else {
            return "redirect:/booking-seat";
        }

    }

    @GetMapping("/addFilm")
    public String addFilm(Model m) {
        MovieDetails movieDetail=new MovieDetails();
        m.addAttribute("movieDetail",movieDetail);
        return "addFilm";
    }
    @GetMapping("/update/film/{id}")
    public String updateFilm(Model m,@PathVariable("id") Long id) {
        MovieDetails movieDetail=movieRepo.getById(id);

        m.addAttribute("movieDetail",movieDetail);
        return "updateFilm";
    }
    @GetMapping("/manageFilm")
    public String manageFilm(Model m,HttpSession session) {
        m.addAttribute("menu", "home");

        List<MovieDetails> movie2 = movieRepo.findAll();
        m.addAttribute("listMovie", movie2);
        return "manageFilm";
    }
    @GetMapping("/delete/film/{id}")
    public String deleteFilm(Model m,@PathVariable("id") Long id) {
        movieRepo.deleteById(id);
        return "redirect:/manageFilm";
    }
    @PostMapping("/saveNewFilm")
    public String saveNewFilm(@RequestParam(required = false) Long movieId,@ModelAttribute("movieDetails") MovieDetails movieDetail) {
        movieDetail.setMovieId(movieId);
        movieRepo.save(movieDetail);
        return "redirect:/manageFilm";
    }





    @GetMapping("/addEvent")
    public String addEvent(Model m) {
        Event event=new Event();
        m.addAttribute("event",event);
        return "addEvent";
    }
    @GetMapping("/update/event/{id}")
    public String updateEvent(Model m,@PathVariable("id") Long id) {
        Event event=eventRepo.getById(id);
        m.addAttribute("event",event);
        return "updateEvent";
    }
    @GetMapping("/manageEvent")
    public String manageEvent(Model m,HttpSession session) {
        m.addAttribute("menu", "home");

        List<Event> eventList = eventRepo.findAll();
        m.addAttribute("eventList", eventList);
        return "manageEvent";
    }
    @GetMapping("/delete/event/{id}")
    public String deleteEvent(Model m,@PathVariable("id") Long id) {
        eventRepo.deleteById(id);
        return "redirect:/manageEvent";
    }
    @PostMapping("/saveNewEvent")
    public String saveNewEvent(@RequestParam(required = false) Long id,@ModelAttribute("event") Event event) {
        event.setId(id);
        eventRepo.save(event);
        return "redirect:/manageEvent";
    }
}
