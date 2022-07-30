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
    name character varying(30) NOT NULL,
    diameter_in_light_years integer NOT NULL,
    shape_type character varying(10) NOT NULL,
    distance_from_earth_in_light_years bigint
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
    name character varying(40) NOT NULL,
    is_spherical boolean,
    diameter_in_km integer,
    has_water boolean NOT NULL,
    planet_id integer
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
-- Name: object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.object (
    object_id integer NOT NULL,
    name character varying(40) NOT NULL,
    man_made boolean NOT NULL
);


ALTER TABLE public.object OWNER TO freecodecamp;

--
-- Name: other_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_objects_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_objects_object_id_seq OWNER TO freecodecamp;

--
-- Name: other_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_objects_object_id_seq OWNED BY public.object.object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    planet_type character varying(20) NOT NULL,
    has_moons boolean,
    description text,
    star_id integer NOT NULL
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
    star_type character varying(30) NOT NULL,
    diameter_in_1000_km integer,
    age_in_bn_years numeric(3,1),
    has_planets boolean,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: object object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object ALTER COLUMN object_id SET DEFAULT nextval('public.other_objects_object_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 180000, 'spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200000, 'spiral', 2500000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 14000, 'spiral', 163000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 55000, 'spiral', 2760000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 18900, 'irregular', 200000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 132000, 'elliptical', 53000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, NULL, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, NULL, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, NULL, false, 4);
INSERT INTO public.moon VALUES (4, 'Dysnomia', false, NULL, false, 11);
INSERT INTO public.moon VALUES (5, 'Charon', true, NULL, false, 9);
INSERT INTO public.moon VALUES (6, 'Io', true, NULL, false, 5);
INSERT INTO public.moon VALUES (7, 'Europa', true, NULL, true, 5);
INSERT INTO public.moon VALUES (8, 'Ganymed', true, NULL, true, 5);
INSERT INTO public.moon VALUES (9, 'Kallisto', true, NULL, true, 5);
INSERT INTO public.moon VALUES (10, 'Tethys', true, NULL, true, 6);
INSERT INTO public.moon VALUES (11, 'Dione', true, NULL, true, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', true, NULL, true, 6);
INSERT INTO public.moon VALUES (13, 'Titan', true, NULL, true, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', true, NULL, true, 6);
INSERT INTO public.moon VALUES (15, 'Triton', true, NULL, true, 8);
INSERT INTO public.moon VALUES (16, 'Nereid', false, NULL, true, 8);
INSERT INTO public.moon VALUES (17, 'Miranda', true, NULL, true, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', true, NULL, true, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', true, NULL, true, 7);
INSERT INTO public.moon VALUES (20, 'Titania', true, NULL, true, 7);
INSERT INTO public.moon VALUES (21, 'Oberon', true, NULL, true, 7);


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.object VALUES (1, 'International Space Station', true);
INSERT INTO public.object VALUES (2, 'Hubble Space Telescope', true);
INSERT INTO public.object VALUES (3, 'Halley''s Comet', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 'terrestrial', false, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12000, 'terrestrial', false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12700, 'terrestrial', true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6800, 'terrestrial', true, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 143000, 'gas giant', true, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 120000, 'gas giant', true, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 51000, 'ice giant', true, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 50000, 'ice giant', true, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2400, 'dwarf planet', true, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 964, 'dwarf planet', false, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 2300, 'dwarf planet', true, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri B', 14000, 'exoplanet', false, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1400, 4.6, true, 1);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 'Red Hypergiant', NULL, 8.2, false, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red Dwarf', NULL, 4.9, true, 1);
INSERT INTO public.star VALUES (4, 'R136a1', 'Wolf-Rayet', NULL, NULL, false, 3);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red Supergiant', NULL, 8.0, false, 1);
INSERT INTO public.star VALUES (6, 'Sirius B', 'White Dwarf', 12, 22.0, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: other_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_objects_object_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: object other_objects_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT other_objects_name_key UNIQUE (name);


--
-- Name: object other_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT other_objects_pkey PRIMARY KEY (object_id);


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

