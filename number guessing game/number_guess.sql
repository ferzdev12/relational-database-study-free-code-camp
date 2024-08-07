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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES ('user_1723062851608', 1, 442);
INSERT INTO public.player VALUES ('user_1723062806737', 1, 442);
INSERT INTO public.player VALUES ('Fernando', 1, 442);
INSERT INTO public.player VALUES ('user_1723062485818', 1, 442);
INSERT INTO public.player VALUES ('user_1723062485817', 1, 442);
INSERT INTO public.player VALUES ('user_1723062536931', 1, 442);
INSERT INTO public.player VALUES ('user_1723062536930', 1, 442);
INSERT INTO public.player VALUES ('user_1723062561487', 1, 442);
INSERT INTO public.player VALUES ('user_1723062561486', 1, 442);
INSERT INTO public.player VALUES ('user_1723062581472', 1, 442);
INSERT INTO public.player VALUES ('user_1723062581471', 1, 442);
INSERT INTO public.player VALUES ('user_1723062751043', 1, 442);
INSERT INTO public.player VALUES ('user_1723062751042', 1, 442);
INSERT INTO public.player VALUES ('user_1723062806736', 1, 442);
INSERT INTO public.player VALUES ('user_1723062851609', 1, 442);


--
-- PostgreSQL database dump complete
--

