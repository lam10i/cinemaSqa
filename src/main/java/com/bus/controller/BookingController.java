package com.bus.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bus.repositories.CustomerDao;


@Controller
public class BookingController {
    @Autowired
    private CustomerDao dao;
    @Autowired
    private MovieRepo movieRepo;
    @Autowired
    private EventRepo eventRepo;

    @PostMapping("/check")
    public String checkDate(@RequestParam("localdate") String date, @RequestParam("localtime") String time, Model m,
                            HttpSession session) {
        Customer object = (Customer) session.getAttribute("user");
        String movie = (String) session.getAttribute("movieName");
        LocalDate monthLimit = LocalDate.now();
        if (movie.equals(null)) {
            return "home";

        } else if (object == null) {
            LocalDate now = LocalDate.parse(date);
            List<String> seatNo1 = new ArrayList<String>();
            List<Seat> all = dao.getAllSeat(now, time);

            for (Seat s : all) {
                for (String s1 : s.getSeatNo()) {
                    seatNo1.add(s1);
                }

            }

            session.setAttribute("bookingdate", now);
            session.setAttribute("bookingtime", time);
            m.addAttribute("date", now);
            m.addAttribute("max", monthLimit.plusMonths(1));
            m.addAttribute("min", monthLimit);
            m.addAttribute("time", time);
            m.addAttribute("seats", seatNo1);

            return "home";
        } else {
            LocalDate now = LocalDate.parse(date);
            List<String> seatNo1 = new ArrayList<String>();
            List<Seat> all = dao.getAllSeat(now, time);

            for (Seat s : all) {
                for (String s1 : s.getSeatNo()) {
                    seatNo1.add(s1);
                }
            }
            session.setAttribute("bookingdate", now);
            session.setAttribute("bookingtime", time);
            m.addAttribute("date", now);
            m.addAttribute("max", monthLimit.plusMonths(1));
            m.addAttribute("min", monthLimit);
            m.addAttribute("time", time);
            m.addAttribute("seats", seatNo1);
            return "dashboard";
        }
    }
    //second page
    @GetMapping("/booking")
    public String bookingCheck(@RequestParam("movieName") String movieName, Model m, HttpSession session) {
        List<MovieDetails> movie2 = movieRepo.findAll();
        List<String> checkMovie = new ArrayList<>();
        for (MovieDetails string : movie2) {
            checkMovie.add(string.getMovieName());
        }
        if (checkMovie.contains(movieName)) {
            session.setAttribute("movieName", movieName);
            System.out.println(movieName);
            LocalDate now = LocalDate.now();
            LocalDate monthLimit = LocalDate.now();
            String time = "09:00 am";
            List<String> seatNo1 = new ArrayList<String>();
            List<Seat> all = dao.getAllSeat(now, time);

            for (Seat s : all) {
                for (String s1 : s.getSeatNo()) {
                    seatNo1.add(s1);
                }

            }

            m.addAttribute("date", now);
            m.addAttribute("max", monthLimit.plusMonths(1));
            m.addAttribute("min", monthLimit);
            m.addAttribute("time", time);
            m.addAttribute("seats", seatNo1);
            return "home";

        } else {
            return "redirect:/";

        }

    }
    //	Dashboard page
    @GetMapping("/booking-seat")
    public String getUser(@RequestParam("movieName") String movieName, HttpSession session, Model m) {
        List<MovieDetails> movie2 = movieRepo.findAll();
        List<String> checkMovie = new ArrayList<>();
        for (MovieDetails string : movie2) {
            checkMovie.add(string.getMovieName());
        }
        if (checkMovie.contains(movieName)) {
            session.setAttribute("movieName", movieName);

            LocalDate now = LocalDate.now();
            LocalDate monthLimit = LocalDate.now();
            String time = "09:00 am";

            Customer customer = (Customer) session.getAttribute("user");
            List<String> seatNo1 = new ArrayList<String>();
            List<Seat> seat = customer.getSeat();

            List<Seat> all = dao.getAllSeat(now, time);

            for (Seat s : all) {
                for (String s1 : s.getSeatNo()) {
                    seatNo1.add(s1);
                }

            }

            m.addAttribute("date", now);
            m.addAttribute("time", time);
            m.addAttribute("max", monthLimit.plusMonths(1));
            m.addAttribute("min", monthLimit);
            m.addAttribute("seats", seatNo1);
            m.addAttribute("seat", seat);
            session.setAttribute("user", customer);
            return "dashboard";
        } else {
            return "redirect:/home";
        }

    }

    //	Seat booking process
    @PostMapping("/book-seat")
    public String bookSeat(@ModelAttribute("Seat") Seat seat, @RequestParam("movieName") String movieName,
                           HttpSession session, Model m) {
        LocalDate currentDate = LocalDate.now();
        ZoneId defaultZoneId = ZoneId.systemDefault();
        Date todayDate = Date.from(currentDate.atStartOfDay(defaultZoneId).toInstant());
        LocalDate date = (LocalDate) session.getAttribute("bookingdate");
        String time = (String) session.getAttribute("bookingtime");
        System.out.println(seat.getSeatNo().equals(null) + " wooo" + movieName.equals(null));
        Customer object = (Customer) session.getAttribute("user");

        if (object == null) {
            return "redirect:/loginForm";
        } else if ((seat.getSeatNo().isEmpty()) && (movieName.equals(null))) {
            System.out.println("Seat is null");
            return "redirect:/home";
        } else if (date == null) {
            date = currentDate;
            time = "09:00 am";
            if (((date.isAfter(currentDate)) || (date.equals(currentDate)))
                    && (date.isBefore(currentDate.plusMonths(1)) || date.equals(currentDate.plusMonths(1)))) {

                Date date2 = Date.from(date.atStartOfDay(defaultZoneId).toInstant());
                List<Double> price = new ArrayList<Double>();
                double sum = 0;
                double p = 60000;
                for (String s : seat.getSeatNo()) {
                    sum = sum + p;
                    price.add(p);
                }
                seat.setTotal(sum);
                seat.setPrice(price);

                OrderHistory history = new OrderHistory(seat.getSeatNo(), price, sum, movieName, todayDate, date2, time,
                        object);
                dao.saveSeat(seat, object, date2, time);
                dao.saveHistory(history, object);
                List<String> seatNo1 = new ArrayList<String>();
                List<Customer> all = dao.getAll();
                for (Customer c : all) {
                    for (Seat s : c.getSeat()) {
                        for (String s1 : s.getSeatNo()) {
                            seatNo1.add(s1);
                        }

                    }
                }

                m.addAttribute("seats", seatNo1);
                session.setAttribute("user", object);
                session.setAttribute("msg", "your seat book successsfully");
                return "redirect:/home";

            } else {
                System.out.println("ye date current date se pahle ki date hai");
                return "redirect:/booking-seat?movieName=" + movieName;

            }
        } else {
            if (((date.isAfter(currentDate)) || (date.equals(currentDate)))
                    && (date.isBefore(currentDate.plusMonths(1)) || date.equals(currentDate.plusMonths(1)))) {
                Date date2 = Date.from(date.atStartOfDay(defaultZoneId).toInstant());
                List<Double> price = new ArrayList<Double>();
                double sum = 0;
                double p = 60000;
                for (String s : seat.getSeatNo()) {
                    sum = sum + p;
                    price.add(p);
                }
                seat.setTotal(sum);
                seat.setPrice(price);

                OrderHistory history = new OrderHistory(seat.getSeatNo(), price, sum, movieName, todayDate, date2, time,
                        object);
                dao.saveSeat(seat, object, date2, time);
                dao.saveHistory(history, object);
                List<String> seatNo1 = new ArrayList<String>();
                List<Customer> all = dao.getAll();
                for (Customer c : all) {
                    for (Seat s : c.getSeat()) {
                        for (String s1 : s.getSeatNo()) {
                            seatNo1.add(s1);
                        }

                    }
                }

                m.addAttribute("seats", seatNo1);
                session.setAttribute("user", object);
                session.setAttribute("msg", "your seat book successsfully");
                return "redirect:/home";

            } else {
                System.out.println("ye date current date se pahle ki date hai");
                return "redirect:/booking-seat?movieName=" + movieName;
            }
        }

    }
}
