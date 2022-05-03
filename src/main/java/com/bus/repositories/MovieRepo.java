package com.bus.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bus.models.MovieDetails;

import java.util.List;

@Repository
public interface MovieRepo extends JpaRepository<MovieDetails, Long> {
@Query("SELECT m FROM MovieDetails  m WHERE m.movieName LIKE %?1%")
    public  List<MovieDetails> search(String keyword);
}
