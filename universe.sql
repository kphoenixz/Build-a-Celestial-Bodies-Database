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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(75) NOT NULL,
    type text,
    age integer,
    distance_in_ly numeric
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
    name character varying(75) NOT NULL,
    age integer,
    diameter_in_km numeric,
    mass_in_kg text,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(75) NOT NULL,
    type text,
    age integer,
    diameter_in_km numeric,
    mass_in_10p24_kg numeric,
    have_moon boolean,
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
-- Name: relationships; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relationships (
    relationships_id integer NOT NULL,
    name character varying(75) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.relationships OWNER TO freecodecamp;

--
-- Name: relationships_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.relationships_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationships_relationship_id_seq OWNER TO freecodecamp;

--
-- Name: relationships_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.relationships_relationship_id_seq OWNED BY public.relationships.relationships_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(75) NOT NULL,
    type text,
    age integer,
    still_alive boolean,
    solar_mass_in_2x10p30 numeric,
    distance_in_ly numeric,
    galaxy_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: relationships relationships_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships ALTER COLUMN relationships_id SET DEFAULT nextval('public.relationships_relationship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, 0);
INSERT INTO public.galaxy VALUES (2, 'Canis Major dwarf', NULL, NULL, 25000);
INSERT INTO public.galaxy VALUES (3, 'Segue 1', NULL, NULL, 75000);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Elliptical', NULL, NULL, 75500);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', NULL, NULL, 161500);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', NULL, NULL, 200000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', NULL, 3474.2, '7.348×10^22', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 22.2, '1.072×10^16', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 12.4, '1.480×10^15', 4);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 3660, '8.932×10^22', 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 3121, '4.800×10^22', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5262, '1.482×10^23', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 4820, '1.076×10^23', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', NULL, 396.4, '3.749×10^19', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, 504.2, '1.080×10^20', 6);
INSERT INTO public.moon VALUES (10, 'Tethys', NULL, 1062, '6.170×10^20', 6);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, 1123, '1.123×10^21', 6);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, 1527, '2.307×10^21', 6);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, 5151, '1.345×10^23', 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', NULL, 270, '5.6×10^18', 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', NULL, 1470, '1.806×10^21', 6);
INSERT INTO public.moon VALUES (16, 'Miranda', NULL, 471.6, '6.590×10^19', 7);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, 1158, '1.353×10^21', 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, 1169, '1.172×10^21', 7);
INSERT INTO public.moon VALUES (19, 'Titania', NULL, 1577, '3.527×10^21', 7);
INSERT INTO public.moon VALUES (20, 'Oberon', NULL, 1523, '3.014×10^21', 7);
INSERT INTO public.moon VALUES (21, 'Despina', NULL, 150, '2.100×10^18', 8);
INSERT INTO public.moon VALUES (22, 'Galatea', NULL, 176, '3.750×10^18', 8);
INSERT INTO public.moon VALUES (23, 'Larissa', NULL, 194, '4.950×10^18', 8);
INSERT INTO public.moon VALUES (24, 'Proteus', NULL, 420, '5.035×10^19', 8);
INSERT INTO public.moon VALUES (25, 'Triton', NULL, 2705, '2.141×10^22', 8);
INSERT INTO public.moon VALUES (26, 'Nereid', NULL, 340, '2.700×10^19', 8);
INSERT INTO public.moon VALUES (27, 'Charon', NULL, 1207, '1.52×10^21', 9);
INSERT INTO public.moon VALUES (28, 'Styx', NULL, NULL, 'unknown', 9);
INSERT INTO public.moon VALUES (29, 'Nix', NULL, NULL, '<2x10^18', 9);
INSERT INTO public.moon VALUES (30, 'Kerberos', NULL, NULL, 'unknown', 9);
INSERT INTO public.moon VALUES (31, 'Hydra', NULL, NULL, '<2x10^18', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, 0.330, 4879, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, 4.87, 12104, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, 5.97, 12756, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, 0.642, 1898, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, 1989, 142984, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, 568, 120536, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, 86.8, 51118, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, 102, 49528, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, NULL, 0.0130, 2376, true, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-78b', NULL, NULL, 15290.4, 10.2, NULL, 8);
INSERT INTO public.planet VALUES (11, 'TOI-733 b', NULL, NULL, NULL, 34.2, NULL, 9);
INSERT INTO public.planet VALUES (12, 'WASP-193b', NULL, NULL, 209720, 264.4, NULL, 10);


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relationships VALUES (1, 'Mercury', 1, NULL, NULL, NULL);
INSERT INTO public.relationships VALUES (2, 'Venus', 1, NULL, NULL, NULL);
INSERT INTO public.relationships VALUES (3, 'Earth', 1, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL, 1, 0.0000158, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, NULL, NULL, 0.122, 4.2465, 1);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', NULL, NULL, NULL, 1.079, 4.3441, 1);
INSERT INTO public.star VALUES (4, 'Toliman', NULL, NULL, NULL, 0.909, 4.3441, 1);
INSERT INTO public.star VALUES (5, 'Barnards Star', NULL, NULL, NULL, 0.144, 5.9629, 1);
INSERT INTO public.star VALUES (6, 'Luhman 16 A', NULL, NULL, NULL, 0.032, 6.5029, 1);
INSERT INTO public.star VALUES (7, 'Luhman 16 B', NULL, NULL, NULL, 0.027, 6.5029, 1);
INSERT INTO public.star VALUES (8, 'Kepler-78', NULL, NULL, NULL, 1.68, 407.3, 1);
INSERT INTO public.star VALUES (9, 'TOI 733', NULL, NULL, NULL, 0.956, 245.512, 1);
INSERT INTO public.star VALUES (10, 'WASP-193', NULL, NULL, NULL, 1.059, 1180.9696, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: relationships_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.relationships_relationship_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: relationships relationships_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_name_key UNIQUE (name);


--
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (relationships_id);


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
-- Name: relationships galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: relationships moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT moon_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: relationships planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: relationships star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

