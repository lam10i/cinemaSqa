package com.bus.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bus.models.CurrentDateOperation;

@Repository
public interface OpeningDate extends JpaRepository<CurrentDateOperation, Long> {

}
