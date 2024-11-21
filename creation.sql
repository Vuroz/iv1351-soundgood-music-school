DROP TABLE IF EXISTS "student_time_slot";
DROP TABLE IF EXISTS "person_address";
DROP TABLE IF EXISTS "lease";
DROP TABLE IF EXISTS "booking";
DROP TABLE IF EXISTS "group_lesson";
DROP TABLE IF EXISTS "lesson";
DROP TABLE IF EXISTS "instrument_proficiency";
DROP TABLE IF EXISTS "instrument";
DROP TABLE IF EXISTS "ensemble";
DROP TABLE IF EXISTS "instructor";
DROP TABLE IF EXISTS "student";
DROP TABLE IF EXISTS "address";
DROP TABLE IF EXISTS "contact_details";
DROP TABLE IF EXISTS "instrument_type";
DROP TABLE IF EXISTS "person";
DROP TABLE IF EXISTS "pricing";
DROP TABLE IF EXISTS "time_slot";

CREATE TABLE "time_slot" (
    id INT GENERATED ALWAYS AS IDENTITY,
    start_time TIMESTAMP(6) NOT NULL,
    end_time TIMESTAMP(6) NOT NULL,
    CHECK (start_time < end_time),
    PRIMARY KEY(id)
);

CREATE TABLE "pricing"(
    id INT GENERATED ALWAYS AS IDENTITY,
    price REAL NOT NULL,
    discount REAL,
    lesson_type VARCHAR (100) NOT NULL,
    completed BIT (1) NOT NULL DEFAULT '0',
    CHECK (discount >= 0 AND discount <= 100),
    CHECK (price >= 0),
    PRIMARY KEY (id)
);

CREATE TABLE "person" (
    id INT GENERATED ALWAYS AS IDENTITY,
    person_number VARCHAR(12) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    CHECK (person_number ~ '^[\d]{12}$'),
    PRIMARY KEY (id)
);

CREATE TABLE "instrument_type" (
    id INT GENERATED ALWAYS AS IDENTITY,
    general_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE "contact_details"(
    id INT GENERATED ALWAYS AS IDENTITY,
    person_id INT NOT NULL,
    relation VARCHAR (100) NOT NULL,
    phone_number VARCHAR (16) NOT NULL,
    email VARCHAR (100) NOT NULL,
    PRIMARY KEY(id, person_id),
    CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE "address" (
  id INT GENERATED ALWAYS AS IDENTITY,
  zip_code varchar(5) NOT NULL,
  city varchar(100) NOT NULL,
  street varchar(100) NOT NULL,
  house_number varchar(10) NOT NULL,
  apartment_number varchar(10),
  CHECK (zip_code ~ '^[\d]{5}$'),
  PRIMARY KEY (id)
);

CREATE TABLE "student" (
    person_id INT NOT NULL,
    level SMALLINT NOT NULL,
    sibling_id INT NOT NULL,
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE,
    PRIMARY KEY(person_id)
);

CREATE TABLE "instructor" (
    person_id INT NOT NULL,
    can_teach_ensemble BIT(1) NOT NULL,
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE,
    PRIMARY KEY (person_id)
);

CREATE TABLE "ensemble" (
    id INT GENERATED ALWAYS AS IDENTITY,
    instructor_id INT NOT NULL,
    time_slot_id INT NOT NULL,
    level SMALLINT NOT NULL,
    genre VARCHAR(100) NOT NULL,
    min_students INT NOT NULL,
    max_students INT NOT NULL,
    CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES instructor(person_id) ON DELETE CASCADE,
    CONSTRAINT fk_time_slot FOREIGN KEY (time_slot_id) REFERENCES time_slot(id) ON DELETE CASCADE,
    CHECK (min_students <= max_students),
    PRIMARY KEY(id)
);

CREATE TABLE "instrument" (
    id INT GENERATED ALWAYS AS IDENTITY,
    instrument_type_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    CONSTRAINT fk_instrument_type FOREIGN KEY (instrument_type_id) REFERENCES instrument_type(id) ON DELETE NO ACTION,
    PRIMARY KEY (id)
);

CREATE TABLE "instrument_proficiency" (
    id INT GENERATED ALWAYS AS IDENTITY,
    instructor_id INT NOT NULL,
    instrument_type_id INT NOT NULL,
    proficiency SMALLINT NOT NULL,
    CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES instructor(person_id) ON DELETE CASCADE,
    CONSTRAINT fk_instrument_type FOREIGN KEY (instrument_type_id) REFERENCES instrument_type(id) ON DELETE NO ACTION,
    PRIMARY KEY (id)
);

CREATE TABLE "lesson" (
    id INT GENERATED ALWAYS AS IDENTITY,
    instructor_id INT NOT NULL,
    instrument_type_id INT NOT NULL,
    level SMALLINT NOT NULL,
    CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES instructor(person_id) ON DELETE CASCADE,
    CONSTRAINT fk_instrument_type FOREIGN KEY (instrument_type_id) REFERENCES instrument_type(id) ON DELETE NO ACTION,
    PRIMARY KEY(id)
);

CREATE TABLE "group_lesson" (
    id INT GENERATED ALWAYS AS IDENTITY,
    lesson_id INT NOT NULL,
    time_slot_id INT NOT NULL,
    min_students INT NOT NULL,
    CONSTRAINT fk_lesson FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE,
    CONSTRAINT fk_time_slot FOREIGN KEY (time_slot_id) REFERENCES time_slot(id) ON DELETE CASCADE,
    PRIMARY KEY(id, lesson_id)
);

CREATE TABLE "booking" (
    id INT GENERATED ALWAYS AS IDENTITY,
    student_id INT NOT NULL,
    lesson_id INT NOT NULL,
    pricing_id INT NOT NULL,
    date_time TIMESTAMP(6) NOT NULL,
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES student(person_id) ON DELETE CASCADE,
    CONSTRAINT fk_lesson FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE,
    CONSTRAINT fk_pricing FOREIGN KEY (pricing_id) REFERENCES pricing(id) ON DELETE CASCADE,
    PRIMARY KEY(id, student_id)
);

CREATE TABLE "lease" (
    id INT GENERATED ALWAYS AS IDENTITY,
    student_id INT NOT NULL,
    instrument_id INT NOT NULL,
    price REAL NOT NULL,
    start_date TIMESTAMP (6) NOT NULL,
    end_date TIMESTAMP (6) NOT NULL, 
    CONSTRAINT fk_instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument(id) ON DELETE CASCADE,
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student(person_id) ON DELETE CASCADE,
    CHECK (start_date < end_date AND end_date <= start_date + INTERVAL '12 months'),
    CHECK (price >= 0), 
    PRIMARY KEY (id, student_id, instrument_id)
);

CREATE OR REPLACE FUNCTION ensure_max_two_leases_func() RETURNS TRIGGER AS $$
BEGIN
	IF ( SELECT COUNT(*) FROM lease WHERE student_id = NEW.student_id
		AND (start_date < NEW.end_date AND NEW.start_date < end_date) ) >= 2 THEN
		RAISE EXCEPTION 'A student can only lease 2 instruments at the same time.';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ensure_max_two_leases
BEFORE INSERT OR UPDATE ON lease
FOR EACH ROW EXECUTE FUNCTION ensure_max_two_leases_func();

CREATE TABLE "person_address" (
    person_id INT NOT NULL,
    address_id INT NOT NULL,
    CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE,
    CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE CASCADE,
    PRIMARY KEY (person_id, address_id)
);

CREATE TABLE "student_time_slot" (
    time_slot_id INT NOT NULL,
    student_id INT NOT NULL,
    pricing_id INT NOT NULL,
    PRIMARY KEY (time_slot_id, student_id),
    CONSTRAINT fk_time_slot FOREIGN KEY (time_slot_id) REFERENCES time_slot(id) ON DELETE CASCADE,
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES student(person_id) ON DELETE CASCADE,
    CONSTRAINT fk_pricing FOREIGN KEY (pricing_id) REFERENCES pricing(id) ON DELETE CASCADE
);