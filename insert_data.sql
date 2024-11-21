-- It should be noted that the following data may not make sense, but will show the intended functionality of the database


INSERT INTO "person" (person_number,name)
VALUES
    ('194231124107','Patrick Horton'),
    ('193586674165','Eaton M. Hill'),
    ('197409622153','Brendan O. Jacobson'),
    ('202197895308','Dorothy S. Armstrong'),
    ('198632916576','Kaitlin Griffin'),
    ('200985878129','Malachi W. Peters'),
    ('198653644650','Fredericka Burris'),
    ('198171227919','Hedwig Giles'),
    ('201247004006','TaShya Sellers'),
    ('198583827175','Xaviera K. Church'),
    ('200765872547','Echo M. Alexander'),
    ('199502472134','Eve U. Garrett'),
    ('200186064776','Simon Q. Vargas'),
    ('194769675113','Dawn L. Merritt'),
    ('197500151488','Jael T. Coffey'),
    ('194637032109','Kelsey Peters'),
    ('194069487584','Montana Q. Wiley'),
    ('201992061616','Emi I. Roberson'),
    ('196004662706','Delilah G. Foley'),
    ('199061543600','Raya R. Rogers');

INSERT INTO "time_slot" (start_time, end_time)
VALUES
    ('2023-05-15 08:00:00', '2023-05-15 09:00:00'),
    ('2023-06-20 09:15:00', '2023-06-20 10:15:00'),
    ('2024-01-10 10:30:00', '2024-01-10 11:30:00'),
    ('2024-02-25 11:45:00', '2024-02-25 12:45:00'),
    ('2025-07-05 13:00:00', '2025-07-05 14:00:00'),
    ('2025-08-10 14:15:00', '2025-08-10 15:15:00'),
    ('2023-11-01 15:30:00', '2023-11-01 16:30:00'),
    ('2023-12-12 16:45:00', '2023-12-12 17:45:00'),
    ('2024-09-08 18:00:00', '2024-09-08 19:00:00'),
    ('2024-10-25 19:15:00', '2024-10-25 20:15:00'),
    ('2025-04-15 08:00:00', '2025-04-15 09:00:00'),
    ('2024-03-20 09:15:00', '2024-03-20 10:15:00'),
    ('2023-12-01 10:30:00', '2023-12-01 11:30:00'),
    ('2024-06-17 11:45:00', '2024-06-17 12:45:00'),
    ('2025-01-05 13:00:00', '2025-01-05 14:00:00'),
    ('2025-05-22 14:15:00', '2025-05-22 15:15:00'),
    ('2023-11-15 15:30:00', '2023-11-15 16:30:00'),
    ('2024-02-28 16:45:00', '2024-02-28 17:45:00'),
    ('2025-06-05 18:00:00', '2025-06-05 19:00:00'),
    ('2023-08-22 19:15:00', '2023-08-22 20:15:00');

-- We know that the prices inserted here are not following the business rules, these are here to test the database
INSERT INTO "pricing" (price, discount, lesson_type)
VALUES
    (TRUNC((RANDOM() * 100 + 20)::numeric, 2), TRUNC((RANDOM() * 10)::numeric, 2), 'Lesson', '0'),
    (TRUNC((RANDOM() * 150 + 50)::numeric, 2), TRUNC((RANDOM() * 15)::numeric, 2), 'Group Lesson', '0'),
    (TRUNC((RANDOM() * 120 + 30)::numeric, 2), TRUNC((RANDOM() * 8)::numeric, 2), 'Ensemble', '0'),
    (TRUNC((RANDOM() * 80 + 10)::numeric, 2), TRUNC((RANDOM() * 5)::numeric, 2), 'Lesson', '0'),
    (TRUNC((RANDOM() * 140 + 20)::numeric, 2), TRUNC((RANDOM() * 12)::numeric, 2), 'Group Lesson', '0'),
    (TRUNC((RANDOM() * 110 + 25)::numeric, 2), TRUNC((RANDOM() * 7)::numeric, 2), 'Ensemble', '0'),
    (TRUNC((RANDOM() * 90 + 20)::numeric, 2), TRUNC((RANDOM() * 10)::numeric, 2), 'Lesson', '1'),
    (TRUNC((RANDOM() * 130 + 40)::numeric, 2), TRUNC((RANDOM() * 14)::numeric, 2), 'Group Lesson', '1'),
    (TRUNC((RANDOM() * 100 + 30)::numeric, 2), TRUNC((RANDOM() * 9)::numeric, 2), 'Ensemble', '0'),
    (TRUNC((RANDOM() * 95 + 15)::numeric, 2), TRUNC((RANDOM() * 6)::numeric, 2), 'Lesson', '0'),
    (TRUNC((RANDOM() * 120 + 50)::numeric, 2), TRUNC((RANDOM() * 18)::numeric, 2), 'Group Lesson', '0'),
    (TRUNC((RANDOM() * 80 + 20)::numeric, 2), TRUNC((RANDOM() * 4)::numeric, 2), 'Ensemble', '1'),
    (TRUNC((RANDOM() * 140 + 60)::numeric, 2), TRUNC((RANDOM() * 11)::numeric, 2), 'Lesson', '0'),
    (TRUNC((RANDOM() * 110 + 30)::numeric, 2), TRUNC((RANDOM() * 15)::numeric, 2), 'Group Lesson', '0'),
    (TRUNC((RANDOM() * 95 + 25)::numeric, 2), TRUNC((RANDOM() * 6)::numeric, 2), 'Ensemble', '0'),
    (TRUNC((RANDOM() * 125 + 20)::numeric, 2), TRUNC((RANDOM() * 7)::numeric, 2), 'Lesson', '1'),
    (TRUNC((RANDOM() * 150 + 35)::numeric, 2), TRUNC((RANDOM() * 20)::numeric, 2), 'Group Lesson', '0'),
    (TRUNC((RANDOM() * 100 + 10)::numeric, 2), TRUNC((RANDOM() * 5)::numeric, 2), 'Ensemble', '0'),
    (TRUNC((RANDOM() * 130 + 40)::numeric, 2), TRUNC((RANDOM() * 12)::numeric, 2), 'Lesson', '0'),
    (TRUNC((RANDOM() * 120 + 25)::numeric, 2), TRUNC((RANDOM() * 9)::numeric, 2), 'Group Lesson', '0');

INSERT INTO "instrument_type" (general_name)
VALUES
    ('Piano'),
    ('Guitar'),
    ('Violin'),
    ('Drums'),
    ('Flute'),
    ('Saxophone'),
    ('Trumpet'),
    ('Cello'),
    ('Clarinet'),
    ('Trombone'),
    ('Oboe'),
    ('Bass Guitar'),
    ('Harp'),
    ('Accordion'),
    ('Electric Guitar'),
    ('Mandolin'),
    ('Banjo'),
    ('French Horn'),
    ('Double Bass'),
    ('Harmonica'); 

-- Any of the phone numbers which happens to be real is purely a coincidence (they are genereated)
INSERT INTO "contact_details" (person_id, relation, phone_number, email)
VALUES
    -- Person 1 (Patrick Horton)
    (1, 'Self', '+46701234567', 'patrickh@example.com'),
    (1, 'Friend', '+46701234568', 'alexm@example.com'),
    -- Person 2 (Eaton M. Hill)
    (2, 'Self', '+46702345678', 'eatonh@example.com'),
    (2, 'Friend', '+46702345679', 'bethanyd@example.com'),
    (2, 'Work', '+46703456780', 'eatonw@example.com'),
    -- Person 3 (Brendan O. Jacobson)
    (3, 'Self', '+46703456789', 'brendanoj@example.com'),
    (3, 'Friend', '+46703456790', 'carlj@example.com'),
    (3, 'Work', '+46704567890', 'brendanw@example.com'),
    (3, 'Family', '+46705678901', 'brendanf@example.com'),
    -- Person 4 (Dorothy S. Armstrong)
    (4, 'Self', '+46705678901', 'dorothys@example.com'),
    (4, 'Friend', '+46705678902', 'emilyr@example.com'),
    (4, 'Work', '+46706789012', 'dorthysw@example.com'),
    (4, 'Family', '+46707890123', 'armstrongf@example.com'),
    -- Person 5 (Kaitlin Griffin)
    (5, 'Self', '+46706789012', 'kaitling@example.com'),
    (5, 'Friend', '+46707890123', 'josephb@example.com'),
    (5, 'Work', '+46708901234', 'kaitlinw@example.com'),
    (5, 'Family', '+46709012345', 'griffinf@example.com'),
    -- Person 6 (Malachi W. Peters)
    (6, 'Self', '+46707890123', 'malachiw@example.com'),
    (6, 'Friend', '+46707890124', 'lilithg@example.com'),
    (6, 'Work', '+46708901234', 'malachiwork@example.com'),
    (6, 'Family', '+46709012345', 'malachif@example.com'),
    -- Person 7 (Fredericka Burris)
    (7, 'Self', '+46708901234', 'frederickab@example.com'),
    (7, 'Friend', '+46708901235', 'ashleyc@example.com'),
    (7, 'Work', '+46709012346', 'frederickaw@example.com'),
    -- Person 8 (Hedwig Giles)
    (8, 'Self', '+46709012345', 'hedwigg@example.com'),
    (8, 'Friend', '+46710123456', 'jakeh@example.com'),
    (8, 'Family', '+46710123457', 'gilesf@example.com'),
    (8, 'Work', '+46711234567', 'hedwigw@example.com'),
    -- Person 9 (TaShya Sellers)
    (9, 'Self', '+46710123456', 'tashyas@example.com'),
    (9, 'Friend', '+46710123457', 'leonw@example.com'),
    (9, 'Work', '+46711234567', 'tashyaw@example.com'),
    -- Person 10 (Xaviera K. Church)
    (10, 'Self', '+46711234567', 'xavierak@example.com'),
    (10, 'Friend', '+46711234568', 'willowk@example.com'),
    (10, 'Work', '+46712345678', 'xavieraw@example.com'),
    (10, 'Family', '+46713456789', 'churchf@example.com'),
    -- Person 11 (Echo M. Alexander)
    (11, 'Self', '+46712345678', 'echom@example.com'),
    (11, 'Friend', '+46712345679', 'orlandog@example.com'),
    (11, 'Work', '+46713456780', 'echow@example.com'),
    (11, 'Family', '+46714567890', 'alexanderf@example.com'),
    -- Person 12 (Eve U. Garrett)
    (12, 'Self', '+46713456789', 'eveu@example.com'),
    (12, 'Friend', '+46713456790', 'maryk@example.com'),
    -- Person 13 (Simon Q. Vargas)
    (13, 'Self', '+46714567890', 'simonq@example.com'),
    (13, 'Friend', '+46714567891', 'karimr@example.com'),
    (13, 'Work', '+46715678901', 'simonw@example.com'),
    (13, 'Family', '+46716789012', 'vargasf@example.com'),
    -- Person 14 (Dawn L. Merritt)
    (14, 'Self', '+46715678901', 'dawnl@example.com'),
    (14, 'Friend', '+46715678902', 'travisg@example.com'),
    (14, 'Work', '+46716789013', 'dawnw@example.com'),
    (14, 'Family', '+46717890123', 'merrittf@example.com'),
    -- Person 15 (Jael T. Coffey)
    (15, 'Self', '+46716789012', 'jaelt@example.com'),
    (15, 'Work', '+46717890123', 'jaelw@example.com'),
    (15, 'Friend', '+46717890124', 'kenzies@example.com'),
    -- Person 16 (Kelsey Peters)
    (16, 'Self', '+46717890123', 'kelseyp@example.com'),
    (16, 'Friend', '+46717890124', 'davidh@example.com'),
    (16, 'Family', '+46718901234', 'petersf@example.com'),
    (16, 'Work', '+46719012345', 'kelseywork@example.com'),
    -- Person 17 (Montana Q. Wiley)
    (17, 'Self', '+46718901234', 'montanaw@example.com'),
    (17, 'Family', '+46719012345', 'wileyf@example.com'),
    (17, 'Work', '+46720123456', 'montanawork@example.com'),
    -- Person 18 (Emi I. Roberson)
    (18, 'Self', '+46719012345', 'emir@example.com'),
    (18, 'Friend', '+46719012346', 'anabelr@example.com'),
    (18, 'Work', '+46720123457', 'emirw@example.com'),
    -- Person 19 (Delilah G. Foley)
    (19, 'Self', '+46720123456', 'delilahg@example.com'),
    (19, 'Friend', '+46721234567', 'michaelj@example.com'),
    (19, 'Work', '+46722345678', 'delilahw@example.com'),
    -- Person 20 (Raya R. Rogers)
    (20, 'Self', '+46721234567', 'rayar@example.com'),
    (20, 'Friend', '+46721234568', 'isabellab@example.com'),
    (20, 'Work', '+46722345679', 'rayarw@example.com');

INSERT INTO "address" (zip_code, city, street, house_number, apartment_number)
VALUES
    -- Address 1 (Patrick Horton & Eaton M. Hill)
    ('12345', 'Stockholm', 'Drottninggatan', '15', 'A'),
    -- Address 2 (Brendan O. Jacobson)
    ('12345', 'Stockholm', 'Drottninggatan', '15', 'B'),
    -- Address 3 (Dorothy S. Armstrong)
    ('23456', 'Gothenburg', 'Kungsportsavenyen', '20', NULL),
    -- Address 4 (Kaitlin Griffin & Malachi W. Peters)
    ('23456', 'Gothenburg', 'Kungsportsavenyen', '20', '1B'),
    -- Address 5 (Fredericka Burris)
    ('34567', 'Malmö', 'Stortorget', '5', '2C'),
    -- Address 6 (Hedwig Giles & TaShya Sellers)
    ('34567', 'Malmö', 'Stortorget', '5', NULL),
    -- Address 7 (Xaviera K. Church)
    ('45678', 'Uppsala', 'Svartbäcksgatan', '10', '3A'),
    -- Address 8 (Echo M. Alexander)
    ('45678', 'Uppsala', 'Svartbäcksgatan', '10', '3B'),
    -- Address 9 (Eve U. Garrett)
    ('56789', 'Linköping', 'Nygatan', '30', '4A'),
    -- Address 10 (Simon Q. Vargas)
    ('56789', 'Linköping', 'Nygatan', '30', '4B'),
    -- Address 11 (Dawn L. Merritt)
    ('67890', 'Västerås', 'Västeråsgatan', '8', '5A'),
    -- Address 12 (Jael T. Coffey)
    ('67890', 'Västerås', 'Västeråsgatan', '8', NULL),
    -- Address 13 (Kelsey Peters & Montana Q. Wiley)
    ('78901', 'Östersund', 'Storgatan', '40', '6A'),
    -- Address 14 (Emi I. Roberson)
    ('78901', 'Östersund', 'Storgatan', '40', NULL),
    -- Address 15 (Delilah G. Foley & Raya R. Rogers)
    ('89012', 'Helsingborg', 'Södra Storgatan', '25', '7A'),
    -- Address 16 (Patrick Horton)
    ('89012', 'Helsingborg', 'Södra Storgatan', '25', '7B'),
    -- Address 17 (Eaton M. Hill)
    ('90123', 'Växjö', 'Linnégatan', '12', '8A'),
    -- Address 18 (Brendan O. Jacobson)
    ('90123', 'Växjö', 'Linnégatan', '12', '8B'),
    -- Address 19 (Fredericka Burris & TaShya Sellers)
    ('12345', 'Stockholm', 'Sergels Torg', '50', NULL),
    -- Address 20 (Kaitlin Griffin)
    ('12345', 'Stockholm', 'Sergels Torg', '50', '9B'),
    -- Address 21 (Malachi W. Peters)
    ('23456', 'Gothenburg', 'Haga Nygata', '7', '10A'),
    -- Address 22 (Xaviera K. Church & Simon Q. Vargas)
    ('23456', 'Gothenburg', 'Haga Nygata', '7', NULL),
    -- Address 23 (Dawn L. Merritt & Jael T. Coffey)
    ('34567', 'Malmö', 'Västra Hamngatan', '12', NULL),
    -- Address 24 (Kelsey Peters)
    ('34567', 'Malmö', 'Västra Hamngatan', '12', '11B'),
    -- Address 25 (Montana Q. Wiley)
    ('45678', 'Uppsala', 'Svartbäcksgatan', '22', '12A'),
    -- Address 26 (Emi I. Roberson)
    ('45678', 'Uppsala', 'Svartbäcksgatan', '22', NULL),
    -- Address 27 (Delilah G. Foley)
    ('56789', 'Linköping', 'Drottninggatan', '33', '13A'),
    -- Address 28 (Raya R. Rogers)
    ('56789', 'Linköping', 'Drottninggatan', '33', '13B'),
    -- Address 29 (Echo M. Alexander)
    ('67890', 'Västerås', 'Skogsgatan', '4', '14A');


INSERT INTO "person_address" (person_id, address_id)
VALUES
    -- Patrick Horton
    (1, 1),
    (1, 16),
    -- Eaton M. Hill
    (2, 1),
    (2, 17),
    -- Brendan O. Jacobson
    (3, 2),
    (3, 18),
    -- Dorothy S. Armstrong
    (4, 3),
    -- Kaitlin Griffin
    (5, 4),
    (5, 20),
    -- Malachi W. Peters
    (6, 4),
    (6, 21),
    -- Fredericka Burris
    (7, 5),
    (7, 19),
    -- Hedwig Giles
    (8, 6),
    -- TaShya Sellers
    (9, 6),
    (9, 19),
    -- Xaviera K. Church
    (10, 7),
    (10, 22),
    -- Echo M. Alexander
    (11, 8),
    (11, 29),
    -- Eve U. Garrett
    (12, 9),
    -- Simon Q. Vargas
    (13, 10),
    (13, 22),
    -- Dawn L. Merritt
    (14, 11),
    (14, 23),
    -- Jael T. Coffey
    (15, 12),
    (15, 23),
    -- Kelsey Peters
    (16, 13),
    (16, 24),
    -- Montana Q. Wiley
    (17, 13),
    (17, 25),
    -- Emi I. Roberson
    (18, 14),
    (18, 26),
    -- Delilah G. Foley
    (19, 15),
    (19, 27),
    -- Raya R. Rogers
    (20, 15),
    (20, 28);

INSERT INTO "student" (person_id, level, sibling_id)
VALUES
    (1, CAST(1 AS SMALLINT), 1),  -- Student 1 (no sibling, sibling_id is their own ID)
    (2, CAST(2 AS SMALLINT), 2),  -- Student 2 (no sibling, sibling_id is their own ID)
    (3, CAST(3 AS SMALLINT), 3),  -- Student 3 (no sibling, sibling_id is their own ID)
    (4, CAST(1 AS SMALLINT), 4),  -- Student 4 (no sibling, sibling_id is their own ID)
    (5, CAST(2 AS SMALLINT), 4),  -- Student 5 (sibling of Student 4)
    (6, CAST(3 AS SMALLINT), 4),  -- Student 6 (sibling of Student 4)
    (7, CAST(1 AS SMALLINT), 7),  -- Student 7 (no sibling, sibling_id is their own ID)
    (8, CAST(2 AS SMALLINT), 8),  -- Student 8 (no sibling, sibling_id is their own ID)
    (9, CAST(3 AS SMALLINT), 9),  -- Student 9 (no sibling, sibling_id is their own ID)
    (10, CAST(1 AS SMALLINT), 10), -- Student 10 (no sibling, sibling_id is their own ID)
    (11, CAST(2 AS SMALLINT), 11), -- Student 11 (no sibling, sibling_id is their own ID)
    (12, CAST(3 AS SMALLINT), 12), -- Student 12 (no sibling, sibling_id is their own ID)
    (13, CAST(1 AS SMALLINT), 13), -- Student 13 (no sibling, sibling_id is their own ID)
    (14, CAST(2 AS SMALLINT), 14), -- Student 14 (no sibling, sibling_id is their own ID)
    (15, CAST(3 AS SMALLINT), 15); -- Student 15 (no sibling, sibling_id is their own ID)

INSERT INTO "instructor" (person_id, can_teach_ensemble)
VALUES
    (16, CAST(1 AS BIT(1))), -- Instructor 1 (can teach ensemble, BIT value 1)
    (17, CAST(0 AS BIT(1))), -- Instructor 2 (cannot teach ensemble, BIT value 0)
    (18, CAST(1 AS BIT(1))), -- Instructor 3 (can teach ensemble, BIT value 1)
    (19, CAST(0 AS BIT(1))), -- Instructor 4 (cannot teach ensemble, BIT value 0)
    (20, CAST(1 AS BIT(1))); -- Instructor 5 (can teach ensemble, BIT value 1)

INSERT INTO "instrument" (instrument_type_id, name, brand)
VALUES
    (1, 'Yamaha U1', 'Yamaha'),          -- Piano
    (1, 'Steinway & Sons Model D', 'Steinway'), -- Piano
    (1, 'Kawai K-300', 'Kawai'),         -- Piano
    (2, 'Fender Stratocaster', 'Fender'), -- Guitar
    (2, 'Gibson Les Paul', 'Gibson'),    -- Guitar
    (2, 'Ibanez RG550', 'Ibanez'),      -- Guitar
    (3, 'Stradivarius 1715', 'Stradivarius'), -- Violin
    (3, 'Guarneri del Gesù', 'Guarneri'), -- Violin
    (3, 'Antonio Stradivari Cremona', 'Stradivarius'), -- Violin
    (4, 'Ludwig Classic Maple', 'Ludwig'), -- Drums
    (4, 'Pearl Export', 'Pearl'),        -- Drums
    (4, 'Tama Superstar', 'Tama'),       -- Drums
    (5, 'Gemeinhardt 3OB', 'Gemeinhardt'), -- Flute
    (5, 'Yamaha 481', 'Yamaha'),        -- Flute
    (5, 'Muramatsu GX', 'Muramatsu'),   -- Flute
    (6, 'Selmer Mark VI', 'Selmer'),     -- Saxophone
    (6, 'Yamaha 62', 'Yamaha'),         -- Saxophone
    (6, 'Vandoren V16', 'Vandoren'),    -- Saxophone
    (7, 'Bach 180S37', 'Bach'),         -- Trumpet
    (7, 'Getzen 900', 'Getzen'),        -- Trumpet
    (7, 'Yamaha Xeno', 'Yamaha'),       -- Trumpet
    (8, 'Cello Stentor 1550', 'Stentor'), -- Cello
    (8, 'Yamaha VC2', 'Yamaha'),        -- Cello
    (8, 'Eastman VC305', 'Eastman'),    -- Cello
    (9, 'Buffet Crampon R13', 'Buffet Crampon'), -- Clarinet
    (9, 'Selmer Paris 10S', 'Selmer'),  -- Clarinet
    (9, 'Leblanc Symphonie', 'Leblanc'), -- Clarinet
    (10, 'Yamaha YSL-882O', 'Yamaha'),   -- Trombone
    (10, 'Bach 42B', 'Bach'),            -- Trombone
    (10, 'Conn 88H', 'Conn'),            -- Trombone
    (11, 'Moeck Rottenburgh', 'Moeck'),  -- Oboe
    (11, 'Fox 330', 'Fox'),              -- Oboe
    (11, 'Howarth S40', 'Howarth'),      -- Oboe
    (12, 'Fender Jazz Bass', 'Fender'),  -- Bass Guitar
    (12, 'Music Man StingRay', 'Music Man'), -- Bass Guitar
    (12, 'Gibson Thunderbird', 'Gibson'), -- Bass Guitar
    (13, 'Gibson L-5', 'Gibson'),        -- Electric Guitar
    (13, 'PRS Custom 24', 'PRS'),        -- Electric Guitar
    (13, 'Gretsch G2622', 'Gretsch'),    -- Electric Guitar
    (14, 'Requinto', 'J. Castro'),       -- Mandolin
    (14, 'Pava A5', 'Pava'),             -- Mandolin
    (14, 'Eastman MD305', 'Eastman'),    -- Mandolin
    (15, 'Deering Goodtime', 'Deering'), -- Banjo
    (15, 'Bacon & Day Silver Bell', 'Bacon & Day'), -- Banjo
    (15, 'Gibson Mastertone', 'Gibson'), -- Banjo
    (16, 'Conn 8D', 'Conn'),             -- French Horn
    (16, 'Holton H179', 'Holton'),       -- French Horn
    (16, 'Yamaha 667', 'Yamaha'),        -- French Horn
    (17, 'Korg SV-1', 'Korg'),           -- Electric Piano
    (17, 'Roland RD-2000', 'Roland'),    -- Electric Piano
    (17, 'Nord Stage 3', 'Nord'),        -- Electric Piano
    (18, 'Hohner Corona II', 'Hohner'),  -- Accordion
    (18, 'Scandalli Super VI', 'Scandalli'), -- Accordion
    (18, 'Vitali Crossover', 'Vitali'),  -- Accordion
    (19, 'Vox AC30', 'Vox'),             -- Amplifier
    (19, 'Marshall JCM800', 'Marshall'), -- Amplifier
    (19, 'Orange Rockerverb', 'Orange'), -- Amplifier
    (20, 'Hohner Marine Band', 'Hohner'); -- Harmonica

INSERT INTO "instrument_proficiency" (instructor_id, instrument_type_id, proficiency)
VALUES
    (16, 1, 5),  -- Instructor 16 (Piano, Proficiency 5)
    (16, 2, 4),  -- Instructor 16 (Guitar, Proficiency 4)
    (17, 3, 3),  -- Instructor 17 (Violin, Proficiency 3)
    (17, 4, 5),  -- Instructor 17 (Drums, Proficiency 5)
    (18, 1, 4),  -- Instructor 18 (Piano, Proficiency 4)
    (18, 2, 5),  -- Instructor 18 (Guitar, Proficiency 5)
    (18, 5, 3),  -- Instructor 18 (Flute, Proficiency 3)
    (19, 6, 4),  -- Instructor 19 (Saxophone, Proficiency 4)
    (19, 7, 5),  -- Instructor 19 (Trumpet, Proficiency 5)
    (20, 1, 3),  -- Instructor 20 (Piano, Proficiency 3)
    (20, 8, 5),  -- Instructor 20 (Cello, Proficiency 5)
    (20, 3, 4),  -- Instructor 20 (Violin, Proficiency 4)
    (16, 6, 3),  -- Instructor 16 (Saxophone, Proficiency 3)
    (17, 7, 4),  -- Instructor 17 (Trumpet, Proficiency 4)
    (18, 9, 2),  -- Instructor 18 (Clarinet, Proficiency 2)
    (19, 10, 4), -- Instructor 19 (Trombone, Proficiency 4)
    (19, 1, 2),  -- Instructor 19 (Piano, Proficiency 2)
    (20, 9, 3),  -- Instructor 20 (Clarinet, Proficiency 3)
    (16, 8, 4),  -- Instructor 16 (Cello, Proficiency 4)
    (17, 5, 5),  -- Instructor 17 (Flute, Proficiency 5)
    (18, 6, 4),  -- Instructor 18 (Saxophone, Proficiency 4)
    (19, 8, 3),  -- Instructor 19 (Cello, Proficiency 3)
    (20, 4, 4),  -- Instructor 20 (Drums, Proficiency 4)
    (16, 3, 5),  -- Instructor 16 (Violin, Proficiency 5)
    (18, 7, 3),  -- Instructor 18 (Trumpet, Proficiency 3)
    (19, 5, 2),  -- Instructor 19 (Flute, Proficiency 2)
    (17, 10, 5), -- Instructor 17 (Trombone, Proficiency 5)
    (16, 11, 4),  -- Instructor 16 (Oboe, Proficiency 4)
    (16, 12, 3),  -- Instructor 16 (Bass Guitar, Proficiency 3)
    (16, 13, 2),  -- Instructor 16 (Electric Guitar, Proficiency 2)
    (17, 14, 4),  -- Instructor 17 (Mandolin, Proficiency 4)
    (17, 15, 3),  -- Instructor 17 (Banjo, Proficiency 3)
    (17, 16, 2),  -- Instructor 17 (French Horn, Proficiency 2)
    (18, 17, 4),  -- Instructor 18 (Electric Piano, Proficiency 4)
    (18, 18, 3),  -- Instructor 18 (Accordion, Proficiency 3)
    (18, 19, 4),  -- Instructor 18 (Amplifier, Proficiency 4)
    (19, 20, 2),  -- Instructor 19 (Harmonica, Proficiency 2)
    (19, 11, 3),  -- Instructor 19 (Oboe, Proficiency 3)
    (19, 12, 5),  -- Instructor 19 (Bass Guitar, Proficiency 5)
    (20, 14, 4),  -- Instructor 20 (Mandolin, Proficiency 4)
    (20, 15, 5),  -- Instructor 20 (Banjo, Proficiency 5)
    (20, 16, 3),  -- Instructor 20 (French Horn, Proficiency 3)
    (16, 17, 3),  -- Instructor 16 (Electric Piano, Proficiency 3)
    (17, 18, 5),  -- Instructor 17 (Accordion, Proficiency 5)
    (18, 19, 4),  -- Instructor 18 (Amplifier, Proficiency 4)
    (19, 20, 5),  -- Instructor 19 (Harmonica, Proficiency 5)
    (20, 11, 4),  -- Instructor 20 (Oboe, Proficiency 4)
    (16, 12, 4),  -- Instructor 16 (Bass Guitar, Proficiency 4)
    (17, 13, 3),  -- Instructor 17 (Electric Guitar, Proficiency 3)
    (18, 14, 2),  -- Instructor 18 (Mandolin, Proficiency 2)
    (19, 15, 4),  -- Instructor 19 (Banjo, Proficiency 4)
    (20, 16, 5),  -- Instructor 20 (French Horn, Proficiency 5)
    (16, 17, 2),  -- Instructor 16 (Electric Piano, Proficiency 2)
    (17, 18, 3),  -- Instructor 17 (Accordion, Proficiency 3)
    (18, 19, 3),  -- Instructor 18 (Amplifier, Proficiency 3)
    (19, 20, 1);  -- Instructor 19 (Harmonica, Proficiency 1)

INSERT INTO "lease" (student_id, instrument_id, price, start_date, end_date)
VALUES
    (6, 15, 491.66, '2023-12-22 00:00:00', '2024-12-17 00:00:00'),
    (8, 14, 315.61, '2023-11-23 00:00:00', '2024-02-14 00:00:00'),
    (9, 18, 113.56, '2023-02-28 00:00:00', '2023-10-21 00:00:00'),
    (13, 1, 91.69, '2023-08-13 00:00:00', '2023-12-01 00:00:00'),
    (6, 11, 200.7, '2023-12-19 00:00:00', '2024-04-02 00:00:00'),
    (13, 15, 448.86, '2023-11-21 00:00:00', '2024-04-04 00:00:00'),
    (2, 19, 83.5, '2023-07-31 00:00:00', '2023-10-20 00:00:00'),
    (4, 9, 293.51, '2023-04-25 00:00:00', '2023-06-24 00:00:00'),
    (5, 19, 179.04, '2023-06-30 00:00:00', '2024-05-15 00:00:00'),
    (1, 3, 442.76, '2023-03-31 00:00:00', '2023-08-22 00:00:00'),
    (9, 8, 409.72, '2023-01-03 00:00:00', '2023-03-29 00:00:00'),
    (2, 6, 399.4, '2023-04-27 00:00:00', '2024-02-07 00:00:00'),
    (8, 18, 439.73, '2023-08-17 00:00:00', '2024-03-20 00:00:00'),
    (11, 10, 145.46, '2023-11-01 00:00:00', '2024-01-04 00:00:00'),
    (4, 1, 183.58, '2023-06-06 00:00:00', '2024-03-07 00:00:00'),
    (14, 5, 477.29, '2023-05-16 00:00:00', '2023-08-13 00:00:00'),
    (5, 3, 301.68, '2023-06-27 00:00:00', '2024-06-05 00:00:00'),
    (11, 16, 361.07, '2023-03-09 00:00:00', '2023-12-11 00:00:00'),
    (7, 1, 365.22, '2023-01-04 00:00:00', '2023-10-16 00:00:00'),
    (12, 10, 163.54, '2023-03-11 00:00:00', '2023-11-04 00:00:00');

INSERT INTO "lesson" (instructor_id, instrument_type_id, level)
VALUES
    -- Instructor 16 lessons
    (16, 1, 4),  -- Piano (Proficiency 5), Level 4 (can teach)
    (16, 2, 3),  -- Guitar (Proficiency 4), Level 3 (can teach)
    (16, 3, 5),  -- Violin (Proficiency 5), Level 5 (can teach)
    (16, 4, 3),  -- Drums (Proficiency 3), Level 3 (can teach)
    (16, 5, 2),  -- Flute (Proficiency 2), Level 2 (can teach)
    (16, 6, 3),  -- Saxophone (Proficiency 3), Level 3 (can teach)
    (16, 7, 4),  -- Trumpet (Proficiency 4), Level 4 (can teach)
    (16, 8, 4),  -- Cello (Proficiency 4), Level 4 (can teach)
    (16, 9, 2),  -- Clarinet (Proficiency 2), Level 2 (can teach)
    (16, 10, 3), -- Trombone (Proficiency 3), Level 3 (can teach)
    -- Instructor 17 lessons
    (17, 1, 4),  -- Piano (Proficiency 4), Level 4 (can teach)
    (17, 2, 3),  -- Guitar (Proficiency 3), Level 3 (can teach)
    (17, 3, 2),  -- Violin (Proficiency 2), Level 2 (can teach)
    (17, 4, 5),  -- Drums (Proficiency 5), Level 5 (can teach)
    (17, 5, 3),  -- Flute (Proficiency 3), Level 3 (can teach)
    (17, 6, 4),  -- Saxophone (Proficiency 4), Level 4 (can teach)
    (17, 7, 4),  -- Trumpet (Proficiency 4), Level 4 (can teach)
    (17, 8, 3),  -- Cello (Proficiency 3), Level 3 (can teach)
    (17, 9, 5),  -- Clarinet (Proficiency 5), Level 5 (can teach)
    (17, 10, 5), -- Trombone (Proficiency 5), Level 5 (can teach)
    -- Instructor 18 lessons
    (18, 1, 4),  -- Piano (Proficiency 4), Level 4 (can teach)
    (18, 2, 5),  -- Guitar (Proficiency 5), Level 5 (can teach)
    (18, 3, 3),  -- Violin (Proficiency 3), Level 3 (can teach)
    (18, 4, 2),  -- Drums (Proficiency 2), Level 2 (can teach)
    (18, 5, 4),  -- Flute (Proficiency 4), Level 4 (can teach)
    (18, 6, 4),  -- Saxophone (Proficiency 4), Level 4 (can teach)
    (18, 7, 3),  -- Trumpet (Proficiency 3), Level 3 (can teach)
    (18, 8, 5),  -- Cello (Proficiency 5), Level 5 (can teach)
    (18, 9, 2),  -- Clarinet (Proficiency 2), Level 2 (can teach)
    (18, 10, 4), -- Trombone (Proficiency 4), Level 4 (can teach)
    -- Instructor 19 lessons
    (19, 1, 2),  -- Piano (Proficiency 2), Level 2 (can teach)
    (19, 2, 5),  -- Guitar (Proficiency 5), Level 5 (can teach)
    (19, 3, 4),  -- Violin (Proficiency 4), Level 4 (can teach)
    (19, 4, 4),  -- Drums (Proficiency 4), Level 4 (can teach)
    (19, 5, 3),  -- Flute (Proficiency 3), Level 3 (can teach)
    (19, 6, 4),  -- Saxophone (Proficiency 4), Level 4 (can teach)
    (19, 7, 5),  -- Trumpet (Proficiency 5), Level 5 (can teach)
    (19, 8, 3),  -- Cello (Proficiency 3), Level 3 (can teach)
    (19, 9, 3),  -- Clarinet (Proficiency 3), Level 3 (can teach)
    (19, 10, 4), -- Trombone (Proficiency 4), Level 4 (can teach)
    -- Instructor 20 lessons
    (20, 1, 3),  -- Piano (Proficiency 3), Level 3 (can teach)
    (20, 2, 4),  -- Guitar (Proficiency 4), Level 4 (can teach)
    (20, 3, 4),  -- Violin (Proficiency 4), Level 4 (can teach)
    (20, 4, 5),  -- Drums (Proficiency 5), Level 5 (can teach)
    (20, 5, 4),  -- Flute (Proficiency 4), Level 4 (can teach)
    (20, 6, 3),  -- Saxophone (Proficiency 3), Level 3 (can teach)
    (20, 7, 4),  -- Trumpet (Proficiency 4), Level 4 (can teach)
    (20, 8, 5),  -- Cello (Proficiency 5), Level 5 (can teach)
    (20, 9, 3),  -- Clarinet (Proficiency 3), Level 3 (can teach)
    (20, 10, 4), -- Trombone (Proficiency 4), Level 4 (can teach)
    -- Additional lessons using instrument_type_id from 11 to 20
    (16, 11, 4),  -- Oboe (Proficiency 4), Level 4 (can teach)
    (16, 12, 3),  -- Bass Guitar (Proficiency 3), Level 3 (can teach)
    (16, 13, 2),  -- Electric Guitar (Proficiency 2), Level 2 (can teach)
    (17, 14, 4),  -- Mandolin (Proficiency 4), Level 4 (can teach)
    (17, 15, 3),  -- Banjo (Proficiency 3), Level 3 (can teach)
    (17, 16, 2),  -- French Horn (Proficiency 2), Level 2 (can teach)
    (18, 17, 4),  -- Electric Piano (Proficiency 4), Level 4 (can teach)
    (18, 18, 3),  -- Accordion (Proficiency 3), Level 3 (can teach)
    (18, 19, 4),  -- Amplifier (Proficiency 4), Level 4 (can teach)
    (19, 20, 2),  -- Harmonica (Proficiency 2), Level 2 (can teach)
    (19, 11, 3),  -- Oboe (Proficiency 3), Level 3 (can teach)
    (19, 12, 5),  -- Bass Guitar (Proficiency 5), Level 5 (can teach)
    (20, 14, 4),  -- Mandolin (Proficiency 4), Level 4 (can teach)
    (20, 15, 5),  -- Banjo (Proficiency 5), Level 5 (can teach)
    (20, 16, 3),  -- French Horn (Proficiency 3), Level 3 (can teach)
    (16, 17, 3),  -- Electric Piano (Proficiency 3), Level 3 (can teach)
    (17, 18, 5),  -- Accordion (Proficiency 5), Level 5 (can teach)
    (18, 19, 4),  -- Amplifier (Proficiency 4), Level 4 (can teach)
    (19, 20, 5);  -- Harmonica (Proficiency 5), Level 5 (can teach)

INSERT INTO "group_lesson" (lesson_id, time_slot_id, min_students)
VALUES
    (12, 1, 5),   -- Lesson ID 12, Time Slot ID 1, Min Students 5
    (23, 2, 6),   -- Lesson ID 23, Time Slot ID 2, Min Students 6
    (35, 3, 4),   -- Lesson ID 35, Time Slot ID 3, Min Students 4
    (7, 4, 3),    -- Lesson ID 7, Time Slot ID 4, Min Students 3
    (45, 5, 8),   -- Lesson ID 45, Time Slot ID 5, Min Students 8
    (19, 6, 5),   -- Lesson ID 19, Time Slot ID 6, Min Students 5
    (56, 7, 4),   -- Lesson ID 56, Time Slot ID 7, Min Students 4
    (42, 8, 6),   -- Lesson ID 42, Time Slot ID 8, Min Students 6
    (28, 9, 7),   -- Lesson ID 28, Time Slot ID 9, Min Students 7
    (11, 10, 3);  -- Lesson ID 11, Time Slot ID 10, Min Students 3

INSERT INTO "ensemble" (instructor_id, time_slot_id, level, genre, min_students, max_students)
VALUES
    (16, 11, 3, 'Jazz', 4, 8),       -- Instructor ID 16, Time Slot ID 11, Level 3, Jazz genre, 4-8 students
    (17, 12, 2, 'Classical', 5, 10), -- Instructor ID 17, Time Slot ID 12, Level 2, Classical genre, 5-10 students
    (18, 13, 4, 'Rock', 6, 12),      -- Instructor ID 18, Time Slot ID 13, Level 4, Rock genre, 6-12 students
    (19, 14, 3, 'Pop', 5, 8),        -- Instructor ID 19, Time Slot ID 14, Level 3, Pop genre, 5-8 students
    (20, 15, 5, 'Blues', 4, 7),      -- Instructor ID 20, Time Slot ID 15, Level 5, Blues genre, 4-7 students
    (16, 16, 1, 'Folk', 3, 6),       -- Instructor ID 16, Time Slot ID 16, Level 1, Folk genre, 3-6 students
    (17, 17, 4, 'Country', 4, 9),    -- Instructor ID 17, Time Slot ID 17, Level 4, Country genre, 4-9 students
    (18, 18, 2, 'Reggae', 5, 10),    -- Instructor ID 18, Time Slot ID 18, Level 2, Reggae genre, 5-10 students
    (19, 19, 5, 'Soul', 6, 12),      -- Instructor ID 19, Time Slot ID 19, Level 5, Soul genre, 6-12 students
    (20, 20, 3, 'Electronic', 4, 7); -- Instructor ID 20, Time Slot ID 20, Level 3, Electronic genre, 4-7 students

INSERT INTO "student_time_slot" (student_id, pricing_id, time_slot_id)
VALUES
    (1, 3, 5),   -- Student 1 assigned to time_slot 5 with pricing_id 3
    (2, 8, 5),   -- Student 2 also attends time_slot 5
    (3, 12, 7),  -- Student 3 assigned to a new time_slot
    (4, 5, 7),   -- Student 4 also attends time_slot 7
    (5, 15, 9),  -- Student 5 assigned to time_slot 9
    (6, 10, 9),  -- Student 6 also attends time_slot 9
    (7, 2, 12),  -- Student 7 assigned to time_slot 12
    (8, 18, 12), -- Student 8 also attends time_slot 12
    (9, 7, 12),  -- Student 9 also attends time_slot 12
    (10, 11, 15),-- Student 10 assigned to time_slot 15
    (11, 4, 15), -- Student 11 also attends time_slot 15
    (12, 14, 18),-- Student 12 assigned to time_slot 18
    (13, 6, 18), -- Student 13 also attends time_slot 18
    (14, 19, 20),-- Student 14 assigned to time_slot 20
    (15, 9, 20); -- Student 15 also attends time_slot 20

INSERT INTO "booking" (student_id, lesson_id, pricing_id, date_time)
VALUES
    (15, 39, 5, '2023-07-08 00:00:00'),
    (12, 67, 2, '2023-12-10 00:00:00'),
    (2, 54, 3, '2023-03-26 00:00:00'),
    (8, 7, 5, '2023-11-21 00:00:00'),
    (13, 38, 5, '2023-12-06 00:00:00'),
    (12, 20, 2, '2023-03-03 00:00:00'),
    (6, 55, 2, '2023-06-16 00:00:00'),
    (1, 36, 4, '2023-02-06 00:00:00'),
    (3, 14, 3, '2023-09-04 00:00:00'),
    (2, 48, 3, '2023-09-09 00:00:00'),
    (15, 16, 5, '2023-08-05 00:00:00'),
    (13, 58, 2, '2023-02-08 00:00:00'),
    (13, 36, 1, '2023-12-13 00:00:00'),
    (14, 21, 4, '2023-12-05 00:00:00'),
    (13, 4, 2, '2023-09-02 00:00:00'),
    (12, 8, 1, '2023-02-04 00:00:00'),
    (7, 37, 2, '2023-10-22 00:00:00'),
    (6, 20, 2, '2023-03-07 00:00:00'),
    (4, 46, 3, '2023-06-16 00:00:00'),
    (7, 58, 1, '2023-08-18 00:00:00');