package com.bus.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "movies_details")
public class MovieDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="movie_id")
	private long movieId;
	
	@Column(nullable = false)
	private String movieName;
	
	@Column(nullable = false)
	private String image;

	@Column(nullable = false)
	private String movieDetail;

	public String getMovieDetail() {
		return movieDetail;
	}

	public void setMovieDetail(String movieDetail) {
		this.movieDetail = movieDetail;
	}

	@Column(nullable = false)
	private String iframe;

	@Column(nullable = false)
	private String director;

	@Column(nullable = false)
	private String cast;

	@Column(nullable = false)
	private String producer;

	@Column(nullable = false)
	private String nation;

	@Column(nullable = false)
	private String category;

	@Column(nullable = false)
	private String timeRelease;

	@Column(nullable = false)
	private float point;

	@Column(nullable = false)
	private int duration;

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTimeRelease() {
		return timeRelease;
	}

	public void setTimeRelease(String timeRelease) {
		this.timeRelease = timeRelease;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(float point) {
		this.point = point;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getIframe() {
		return iframe;
	}

	public void setIframe(String iframe) {
		this.iframe = iframe;
	}

	public long getMovieId() {
		return movieId;
	}

	public void setMovieId(long movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}







	public MovieDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MovieDetails [movieId=" + movieId + ", movieName=" + movieName + ", image=" + image + ", movieDetails="
				 + "]";
	}
	
	
	


}
