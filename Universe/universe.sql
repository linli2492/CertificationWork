CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE,
    number_of_stars INT NOT NULL,
    galaxy_type TEXT,
    distance_from_earth NUMERIC(10, 2),
    discovered_by TEXT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE,
    is_visible BOOLEAN,
    is_supernova BOOLEAN,
    age_in_million_years INT,
    mass NUMERIC(10, 3)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    distance_from_star NUMERIC(10, 2), 
    has_life BOOLEAN,
    radius_in_km INT, 
    is_gaseous BOOLEAN, 
    star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    diameter_in_km INT,
    has_atmosphere BOOLEAN,
    orbital_period_in_days NUMERIC(10, 2),
    planet_id INT REFERENCES planet(planet_id)
);

CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE, -- Ensures that each asteroid has a unique name
    is_near_earth BOOLEAN,
    mass NUMERIC(15, 4),
    discovered_by TEXT
);

INSERT INTO galaxy (name, number_of_stars, galaxy_type, distance_from_earth, discovered_by) VALUES 
('Milky Way', 100000000, 'Spiral', 0, 'Unknown'),
('Andromeda', 1000000000, 'Spiral', 2537000, 'Edwin Hubble'),
('Triangulum', 40000000, 'Spiral', 3000000, 'Charles Messier'),
('Messier 81', 25000000, 'Spiral', 11700000, 'Johann Bode'),
('Whirlpool', 50000000, 'Spiral', 23000000, 'Charles Messier'),
('Sculptor', 10000000, 'Elliptical', 11400000, 'Unknown');

INSERT INTO star (name, is_visible, is_supernova, age_in_million_years, mass, galaxy_id) VALUES
('Sun', TRUE, FALSE, 4600, 1.00, 1),
('Sirius', TRUE, FALSE, 242, 2.02, 1),
('Betelgeuse', TRUE, TRUE, 10000, 11.6, 1),
('Alpha Centauri', TRUE, FALSE, 4500, 1.10, 1),
('Vega', TRUE, FALSE, 455, 2.1, 2),
('Rigel', TRUE, TRUE, 870, 21.0, 2);

INSERT INTO planet (name, distance_from_star, has_life, radius_in_km, is_gaseous, star_id) VALUES
('Earth', 1.00, TRUE, 6371, FALSE, 1),
('Mars', 1.52, FALSE, 3390, FALSE, 1),
('Jupiter', 5.20, FALSE, 69911, TRUE, 1),
('Saturn', 9.58, FALSE, 58232, TRUE, 1),
('Proxima Centauri b', 0.0485, FALSE, 7070, FALSE, 4),
('Vega IX', 3.25, FALSE, 4200, FALSE, 5),
('Betelgeuse I', 0.5, FALSE, 6020, FALSE, 3),
('Sirius A b', 2.5, FALSE, 70900, TRUE, 2),
('Rigel II', 1.25, FALSE, 6040, FALSE, 6),
('Andromeda III', 4.0, FALSE, 6700, FALSE, 5),
('Planet X', 30.00, FALSE, 30000, TRUE, 6),
('Sculptor X-1', 3.7, FALSE, 5800, FALSE, 6);

INSERT INTO moon (name, diameter_in_km, has_atmosphere, orbital_period_in_days, planet_id) VALUES
('Luna', 3474, FALSE, 27.32, 1),
('Phobos', 22, FALSE, 0.3189, 2),
('Deimos', 12, FALSE, 1.263, 2),
('Ganymede', 5262, TRUE, 7.15, 3),
('Callisto', 4820, FALSE, 16.69, 3),
('Titan', 5150, TRUE, 15.95, 4),
('Europa', 3121, TRUE, 3.55, 3),
('Rhea', 1528, FALSE, 4.52, 4),
('Oberon', 1523, FALSE, 13.46, 3),
('Proxima Centauri c', 48, FALSE, 0.08, 5),
('Sirius A c', 320, FALSE, 29.5, 8),
('Betelgeuse II A', 460, FALSE, 0.32, 7),
('Rigel III C', 1400, FALSE, 17.2, 10),
('Andromeda I', 55, FALSE, 0.92, 11),
('Whirlpool X', 390, FALSE, 9.0, 9),
('Sculptor C1', 25, FALSE, 2.5, 12),
('Sculptor C2', 100, TRUE, 5.4, 12),
('Planet X Moon 1', 1800, FALSE, 14.2, 11),
('Planet X Moon 2', 900, FALSE, 23.1, 11),
('Andromeda X1', 95, FALSE, 1.5, 10);

INSERT INTO asteroid (name, is_near_earth, mass, discovered_by) VALUES
('Ceres', TRUE, 9.39, 'Piazzi'),
('Pallas', TRUE, 2.14, 'Olbers'),
('Eros', TRUE, 6.69, 'Witt');
