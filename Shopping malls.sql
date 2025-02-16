CREATE DATABASE shopping_malls;

USE shopping_malls;

CREATE TABLE chennai_malls(
    id INT PRIMARY KEY AUTO_INCREMENT,
    branch VARCHAR(30),
    area VARCHAR(40),   
    movie_name VARCHAR(30),
    release_date DATE,
    regional VARCHAR(40), -- 'Tamil','English','Telugu'.
    ticket_price DECIMAL(10,2),
    show_timings TIME,
    screen_number INT, -- '1','2','3'.
    screen_floor VARCHAR(40),
    screen_size VARCHAR(30),  -- 'Big','Small'.
    screen_type VARCHAR(30),  -- '4K','4K-3D','IMAX-3D','4K-Upscalled'.
    show_status VARCHAR(30)
);

-- INSERT DATA INTO chennai_malls
INSERT INTO chennai_malls (branch, area, movie_name, release_date, regional, ticket_price, show_timings, screen_number, screen_floor, screen_size, screen_type, show_status) 
VALUES
('Phoenix market city', 'Velachery', 'Thuppakki', '2012-04-01', 'Tamil', 150.00, '10:00:00', 1, 'Third floor', 'Big', '4K', 'Housefull'),
('VR mall', 'Koyembedu', 'Aarambam', '2015-05-04', 'Tamil', 150.00, '10:00:00', 2, 'Third floor', 'Big', '4K', 'Housefull'),
('Phoenix market city', 'Velachery', 'Thuppakki', '2012-04-01', 'Tamil', 150.00, '10:00:00', 2, 'Third floor', 'Big', '4K', 'Housefull'),
('Phoenix market city', 'Velachery', 'Batman The Rise', '2012-08-01', 'Tamil-Dubbed', 550.00, '14:00:00', 3, 'Third floor', 'Big', 'IMAX-4K', 'Housefull'),
('PVR Grand mall', 'Velachery', 'Uthama Villan', '2016-05-10', 'Tamil', 120.00, '10:00:00', 3, 'Third floor', 'Big', '4K', 'Tickets available'),
('PVR Grand mall', 'Velachery', 'The Lion King', '2024-08-16', 'Tamil-Dubbed', 550.00, '11:00:00', 2, 'Third floor', 'Big', 'IMAX-3D', 'Housefull'),
('Marina mall', 'Marina', 'Enthiran 2.0', '2017-07-08', 'Tamil', 250.00, '08:00:00', 1, 'Third floor', 'Big', '4k-3D', 'Housefull'),
('Marina mall', 'Marina', 'Thalapathy', '1991-04-10', 'Tamil', 150.00, '08:00:00', 2, 'Third floor', 'Big', '4k-Upscalled', 'Housefull'),
('EA', 'Royapet', 'Kalki 2098AD', '2023-05-02', 'Telugu', 250.00, '10:00:00', 4, 'Third floor', 'Small', '4k-3D', 'Show is cancelled');

select  * from chennai_malls;


-- TO FIND BRANCH, AREA, MOVIE NAME AND SHOW STATUS IN CHENNAI MALL TABLE.
SELECT branch, area, movie_name, show_status 
FROM chennai_malls;

-- TO FIND BRANCH , AREA, MOVIE NAME, RELEASE DATE, TICKET PRICE IN CHENNAI MALL TABLE AND CHOOSE REGIONAL NOT IN TELUGU AND ORDER BY RELEASE DATE
SELECT branch, area, movie_name, release_date,ticket_price
FROM chennai_malls
WHERE regional <> 'Telugu'
ORDER BY release_date;
-- TO FIND MOVIE NAME, FLOOR, SCREEN NUMBER, REGIONAL, BRANCH AND AREA IN CHENNAI MALL TABLE AND USING WHERE AND ORDER BY FUNCTION.
SELECT movie_name, screen_floor,screen_number, regional,show_timings, branch, area
FROM chennai_malls
WHERE show_timings != '08:00:00'
ORDER BY movie_name;
-- TO FIND ALL FROM THE CHENNAI MALL TABLE USING WHERE FUNCTION AND ORDER BY SHOW TIMINGS.
SELECT * FROM chennai_malls
WHERE branch ='Phoenix market city'
ORDER BY show_timings;


-- TO FIND MALL BRANCH, AREA, SHOW TIME, SCREEN TYPE AND SHOWSTATUS OF A MOVIE
SELECT branch,area, movie_name, show_timings, screen_number, screen_type, show_status
FROM chennai_malls
WHERE release_date = '2012-04-01';
GROUP BY screen_number;


