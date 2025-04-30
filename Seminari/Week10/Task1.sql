--CREATE DATABASE flights;

--use flights;
CREATE TABLE Airline (
	code INT CONSTRAINT pk_airline_code PRIMARY KEY,
	airline_name VARCHAR(255) NOT NULL,
	country VARCHAR(255) NOT NULL,

	CONSTRAINT uk_airline_name UNIQUE (airline_name)
);

CREATE TABLE Airport (
	code INT CONSTRAINT pk_airport_code PRIMARY KEY,
	airport_name VARCHAR(255) NOT NULL,
	country VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL,

	CONSTRAINT uk_airport_name_country UNIQUE(airport_name, country)
);

CREATE TABLE Airplane (
	code INT CONSTRAINT pk_airplane_code PRIMARY KEY,
	airplane_type VARCHAR(255) NOT NULL,
	seats_count INT NOT NULL,
	production_date DATE DEFAULT GETDATE() NOT NULL,

	CONSTRAINT chk_airplane CHECK (seats_count > 0)
);

CREATE TABLE Flight (
	flight_num INT CONSTRAINT pk_flight_num PRIMARY KEY,
	airline_code INT NOT NULL,
	leaving_airport_code INT NOT NULL,
	landing_airport_code INT NOT NULL,
	flight_time TIME NOT NULL,
	duration INT NOT NULL,
	airplane_code INT NOT NULL,

	CONSTRAINT fk_flight_airline FOREIGN KEY (airline_code) REFERENCES Airline(code),
	CONSTRAINT fk_flight_leaving_airport FOREIGN KEY (leaving_airport_code) REFERENCES Airport(code),
	CONSTRAINT fk_flight_landing_airport FOREIGN KEY (landing_airport_code) REFERENCES Airport(code),
	CONSTRAINT fk_flight_airplane FOREIGN KEY (airplane_code) REFERENCES Airplane(code)
);

CREATE TABLE Customer (
	id INT CONSTRAINT pk_id PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	family_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,

	CONSTRAINT chk_email CHECK (
		LEN(email) >= 6 AND
		email LIKE '%@%.%'
	)
);

CREATE TABLE Agency (
	name VARCHAR(255) CONSTRAINT pk_agency_name PRIMARY KEY,
	country VARCHAR(255),
	city VARCHAR(255),
	phone_number VARCHAR(20)
);

CREATE TABLE Booking (
    code INT CONSTRAINT pk_booking PRIMARY KEY,
    agency_name VARCHAR(255) NOT NULL,
    airline_code INT NOT NULL,
    flight_num INT NOT NULL,
    client_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    flight_date DATE NOT NULL,
    price INT NOT NULL,
    reservation_status VARCHAR(20) NOT NULL,
	
	CONSTRAINT fk_booking_airline FOREIGN KEY (airline_code) REFERENCES Airline(code),
    CONSTRAINT fk_booking_agency FOREIGN KEY (agency_name) REFERENCES Agency(name),
    CONSTRAINT fk_booking_flight FOREIGN KEY (flight_num) REFERENCES Flight(flight_num),
    CONSTRAINT fk_booking_customer FOREIGN KEY (client_id) REFERENCES Customer(id),

	CONSTRAINT chk_booking CHECK ((flight_date >= reservation_date) AND reservation_status IN ('0','1'))
);