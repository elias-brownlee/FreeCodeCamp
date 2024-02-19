--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    type character varying,
    diameter numeric,
    is_hazardous boolean NOT NULL,
    distance_from_sun numeric NOT NULL,
    unique_name character varying,
    age integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    size numeric,
    is_active boolean NOT NULL,
    unique_name character varying(30),
    age integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    type character varying,
    diameter numeric,
    is_tidal_locked boolean NOT NULL,
    unique_name character varying,
    age integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    type character varying(30),
    distance_from_star numeric,
    has_atmosphere boolean NOT NULL,
    unique_name character varying(30),
    age integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type character varying(30),
    luminosity numeric,
    is_active boolean NOT NULL,
    unique_name character varying(30),
    age integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 3, 'Dwarf planet', 939.4, false, 2.767, 'ceres', NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 3, 'Asteroid', 525.4, false, 2.362, 'vesta', NULL);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 3, 'Asteroid', 512.2, false, 2.772, 'pallas', NULL);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 3, 'Asteroid', 431.4, false, 3.142, 'hygiea', NULL);
INSERT INTO public.asteroid VALUES (5, 'Eros', 3, 'Asteroid', 34.4, true, 1.458, 'eros', NULL);
INSERT INTO public.asteroid VALUES (6, 'Gaspra', 3, 'Asteroid', 5.1, false, 2.21, 'gaspra', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, true, 'milky_way', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 120000, true, 'andromeda', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000, true, 'triangulum', NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 200000, true, 'messier_87', NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Spiral', 60000, true, 'messier_81', NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 'Barred Spiral', 70000, true, 'ngc_1300', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Natural satellite', 3475, true, 'moon', NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Natural satellite', 22.2, true, 'phobos', NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Natural satellite', 12.4, true, 'deimos', NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4, 'Natural satellite', 5268, true, 'ganymede', NULL);
INSERT INTO public.moon VALUES (5, 'Titan', 5, 'Natural satellite', 5150, true, 'titan', NULL);
INSERT INTO public.moon VALUES (6, 'Triton', 6, 'Natural satellite', 2706, true, 'triton', NULL);
INSERT INTO public.moon VALUES (7, 'Europa', 4, 'Natural satellite', 3121, true, 'europa', NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 4, 'Natural satellite', 4821, true, 'callisto', NULL);
INSERT INTO public.moon VALUES (9, 'Io', 4, 'Natural satellite', 3643, true, 'io', NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', 5, 'Natural satellite', 504.2, true, 'enceladus', NULL);
INSERT INTO public.moon VALUES (11, 'Titania', 7, 'Natural satellite', 1577.8, true, 'titania', NULL);
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 'Natural satellite', 1522.8, true, 'oberon', NULL);
INSERT INTO public.moon VALUES (13, 'Rhea', 5, 'Natural satellite', 1527, true, 'rhea', NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', 5, 'Natural satellite', 1468, true, 'iapetus', NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 6, 'Natural satellite', 471.6, true, 'miranda', NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Natural satellite', 1157.8, true, 'ariel', NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 'Natural satellite', 1169.4, true, 'umbriel', NULL);
INSERT INTO public.moon VALUES (18, 'Dione', 5, 'Natural satellite', 1122.8, true, 'dione', NULL);
INSERT INTO public.moon VALUES (19, 'Charon', 9, 'Natural satellite', 1208, true, 'charon', NULL);
INSERT INTO public.moon VALUES (20, 'Luna', 1, 'Natural satellite', 3475, true, 'luna', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 1, true, 'earth', NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 1.5, true, 'mars', NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', 0.7, true, 'venus', NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, 'Gas giant', 5.2, false, 'jupiter', NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 2, 'Gas giant', 9.5, false, 'saturn', NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', 2, 'Ice giant', 30.1, true, 'neptune', NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 'Ice giant', 19.2, true, 'uranus', NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', 3, 'Terrestrial', 0.4, false, 'mercury', NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 3, 'Dwarf planet', 39.5, true, 'pluto', NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 4, 'Exoplanet', 0.35, true, 'kepler_186f', NULL);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 4, 'Exoplanet', 0.0475, false, 'hd_209458_b', NULL);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 4, 'Exoplanet', 0.0229, false, 'wasp_12b', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 1, true, 'sun', NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'Main-sequence', 1.5, true, 'alpha_centauri_a', NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 'Main-sequence', 0.5, true, 'alpha_centauri_b', NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red dwarf', 0.001, true, 'proxima_centauri', NULL);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 'Main-sequence', 25.4, true, 'sirius', NULL);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'Main-sequence', 40, true, 'vega', NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: asteroid asteroid_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_unique_name_key UNIQUE (unique_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name_key UNIQUE (unique_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name_key UNIQUE (unique_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name_key UNIQUE (unique_name);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

