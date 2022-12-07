--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type character varying(10)
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
-- Name: galaxy_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_moon (
    galaxy_moon_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.galaxy_moon OWNER TO freecodecamp;

--
-- Name: galaxy_moon_galaxy_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_moon_galaxy_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_moon_galaxy_moon_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_moon_galaxy_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_moon_galaxy_moon_id_seq OWNED BY public.galaxy_moon.galaxy_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    distance_from_earth numeric,
    is_spherical boolean
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
    name character varying(40) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    star_id integer
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric,
    age_in_millions_of_years integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_moon galaxy_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon ALTER COLUMN galaxy_moon_id SET DEFAULT nextval('public.galaxy_moon_galaxy_moon_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'ngc3626', 'oval', 30, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'ngc3992', 'oval', 10, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'm58', 'barrie spiral galaxy', 40, 'sb_type');
INSERT INTO public.galaxy VALUES (4, 'M51', 'CRICALE', 20, 'C_TYPE');
INSERT INTO public.galaxy VALUES (5, 't01', 'irregular', 30, 'irr');
INSERT INTO public.galaxy VALUES (6, 'S3', 'UNKOWN', 90, 'UNKNOW');


--
-- Data for Name: galaxy_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_moon VALUES (1, 1, 2, NULL);
INSERT INTO public.galaxy_moon VALUES (2, 1, 4, NULL);
INSERT INTO public.galaxy_moon VALUES (3, 2, 6, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'M', 1, 30, true);
INSERT INTO public.moon VALUES (2, 'M1', 2, 25, false);
INSERT INTO public.moon VALUES (3, 'M3', 3, 70, true);
INSERT INTO public.moon VALUES (4, 'M4', 4, 45, false);
INSERT INTO public.moon VALUES (5, 'M5', 4, 30, true);
INSERT INTO public.moon VALUES (6, 'M6', 3, 23, false);
INSERT INTO public.moon VALUES (7, 'M7', 5, 42, false);
INSERT INTO public.moon VALUES (8, 'M8', 4, 10, false);
INSERT INTO public.moon VALUES (9, 'M9', 3, 18, true);
INSERT INTO public.moon VALUES (10, 'M10', 6, 9, false);
INSERT INTO public.moon VALUES (11, 'M11', 6, 25, true);
INSERT INTO public.moon VALUES (12, 'M12', 5, 10, false);
INSERT INTO public.moon VALUES (13, 'M13', 3, 17, true);
INSERT INTO public.moon VALUES (14, 'M14', 5, 19, false);
INSERT INTO public.moon VALUES (15, 'M15', 6, 16, true);
INSERT INTO public.moon VALUES (16, 'M16', 4, 27, false);
INSERT INTO public.moon VALUES (17, 'M17', 5, 8, false);
INSERT INTO public.moon VALUES (18, 'M19', 4, 15, false);
INSERT INTO public.moon VALUES (19, 'M18', 6, 19, false);
INSERT INTO public.moon VALUES (20, 'M20', 1, 22, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A', true, false, 9, 1);
INSERT INTO public.planet VALUES (2, 'B', false, true, 10, 2);
INSERT INTO public.planet VALUES (3, 'C', true, true, 8, 3);
INSERT INTO public.planet VALUES (4, 'D', false, false, 9, 4);
INSERT INTO public.planet VALUES (5, 'E', true, false, 6, 3);
INSERT INTO public.planet VALUES (6, 'F', false, false, 5, 4);
INSERT INTO public.planet VALUES (7, 'G', true, false, 7, 5);
INSERT INTO public.planet VALUES (8, 'H', true, false, 8, 6);
INSERT INTO public.planet VALUES (9, 'I', false, true, 7, 3);
INSERT INTO public.planet VALUES (10, 'J', false, false, 5, 5);
INSERT INTO public.planet VALUES (11, 'K', true, true, 4, 1);
INSERT INTO public.planet VALUES (12, 'L', true, true, 5, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'A', 1, 300.4, 10);
INSERT INTO public.star VALUES (2, 'B', 2, 200, 30);
INSERT INTO public.star VALUES (3, 'C', 3, 250, 25);
INSERT INTO public.star VALUES (4, 'D', 4, 500, 15);
INSERT INTO public.star VALUES (5, 'E', 5, 360, 18);
INSERT INTO public.star VALUES (6, 'F', 6, 280, 34);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_moon_galaxy_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_moon_galaxy_moon_id_seq', 3, true);


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
-- Name: galaxy_moon g_m; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT g_m UNIQUE (galaxy_id, moon_id);


--
-- Name: galaxy_moon galaxy_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_pkey PRIMARY KEY (galaxy_moon_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_moon galaxy_moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_moon galaxy_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

