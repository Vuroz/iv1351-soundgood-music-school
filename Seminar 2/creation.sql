CREATE TABLE address (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 zip_code VARCHAR(5) NOT NULL,
 city VARCHAR(100) NOT NULL,
 street VARCHAR(100) NOT NULL,
 house_number VARCHAR(10) NOT NULL,
 apartment_number VARCHAR(10)
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (id);


CREATE TABLE instrument_type (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 general_name VARCHAR(100) NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(12) NOT NULL UNIQUE,
 name VARCHAR(100) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE person_address (
 person_id INT NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE person_address ADD CONSTRAINT PK_person_address PRIMARY KEY (person_id,address_id);


CREATE TABLE pricing (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price REAL NOT NULL,
 active_from TIMESTAMP(6) NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 level SMALLINT NOT NULL
);

ALTER TABLE pricing ADD CONSTRAINT PK_pricing PRIMARY KEY (id);


CREATE TABLE student (
 person_id INT NOT NULL,
 level SMALLINT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (person_id);


CREATE TABLE time_slot (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIMESTAMP(6) NOT NULL,
 end_time TIMESTAMP(6) NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (id);


CREATE TABLE contact_details (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(100),
 email VARCHAR(250)
);

ALTER TABLE contact_details ADD CONSTRAINT PK_contact_details PRIMARY KEY (person_id);


CREATE TABLE contact_person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL,
 relation VARCHAR(100) NOT NULL,
 phone_number VARCHAR(16) NOT NULL,
 email VARCHAR(100) NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id,person_id);


CREATE TABLE instructor (
 person_id INT NOT NULL,
 can_teach_ensemble BIT(1) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (person_id);


CREATE TABLE instructor_schedule (
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL
);

ALTER TABLE instructor_schedule ADD CONSTRAINT PK_instructor_schedule PRIMARY KEY (instructor_id,time_slot_id);


CREATE TABLE instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type_id INT NOT NULL,
 name VARCHAR(100) NOT NULL,
 brand VARCHAR(100) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE instrument_price (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 active_from TIMESTAMP(6) NOT NULL,
 rental_price REAL NOT NULL
);

ALTER TABLE instrument_price ADD CONSTRAINT PK_instrument_price PRIMARY KEY (id);


CREATE TABLE instrument_proficiency (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 instrument_type_id INT NOT NULL,
 proficiency SMALLINT NOT NULL
);

ALTER TABLE instrument_proficiency ADD CONSTRAINT PK_instrument_proficiency PRIMARY KEY (id);


CREATE TABLE lease (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 start_date TIMESTAMP(6) NOT NULL,
 end_date TIMESTAMP(6) NOT NULL
);

ALTER TABLE lease ADD CONSTRAINT PK_lease PRIMARY KEY (id,student_id,instrument_id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 instrument_type_id INT NOT NULL,
 level SMALLINT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE student_time_slot (
 time_slot_id INT NOT NULL,
 student_id INT NOT NULL,
 pricing_id INT NOT NULL
);

ALTER TABLE student_time_slot ADD CONSTRAINT PK_student_time_slot PRIMARY KEY (time_slot_id,student_id);


CREATE TABLE booking (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT NOT NULL,
 lesson_id INT NOT NULL,
 pricing_id INT NOT NULL,
 date_time TIMESTAMP(6) NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (id,student_id);


CREATE TABLE ensemble (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 level SMALLINT NOT NULL,
 genre VARCHAR(100) NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE group_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 min_students INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id,lesson_id);


ALTER TABLE person_address ADD CONSTRAINT FK_person_address_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_address ADD CONSTRAINT FK_person_address_1 FOREIGN KEY (address_id) REFERENCES address (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor_schedule ADD CONSTRAINT FK_instructor_schedule_0 FOREIGN KEY (instructor_id) REFERENCES instructor (person_id);
ALTER TABLE instructor_schedule ADD CONSTRAINT FK_instructor_schedule_1 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);


ALTER TABLE instrument_price ADD CONSTRAINT FK_instrument_price_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);


ALTER TABLE instrument_proficiency ADD CONSTRAINT FK_instrument_proficiency_0 FOREIGN KEY (instructor_id) REFERENCES instructor (person_id);
ALTER TABLE instrument_proficiency ADD CONSTRAINT FK_instrument_proficiency_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);


ALTER TABLE lease ADD CONSTRAINT FK_lease_0 FOREIGN KEY (student_id) REFERENCES student (person_id);
ALTER TABLE lease ADD CONSTRAINT FK_lease_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (person_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);


ALTER TABLE student_time_slot ADD CONSTRAINT FK_student_time_slot_0 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id);
ALTER TABLE student_time_slot ADD CONSTRAINT FK_student_time_slot_1 FOREIGN KEY (student_id) REFERENCES student (person_id);
ALTER TABLE student_time_slot ADD CONSTRAINT FK_student_time_slot_2 FOREIGN KEY (pricing_id) REFERENCES pricing (id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (student_id) REFERENCES student (person_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_2 FOREIGN KEY (pricing_id) REFERENCES pricing (id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (person_id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id);


