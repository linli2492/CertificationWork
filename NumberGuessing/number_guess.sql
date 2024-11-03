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
-- Name: games_played; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_played (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games_played OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_played_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_played_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_played_game_id_seq OWNED BY public.games_played.game_id;


--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_user_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_user_id_seq OWNED BY public.usernames.user_id;


--
-- Name: games_played game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played ALTER COLUMN game_id SET DEFAULT nextval('public.games_played_game_id_seq'::regclass);


--
-- Name: usernames user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN user_id SET DEFAULT nextval('public.usernames_user_id_seq'::regclass);


--
-- Data for Name: games_played; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_played VALUES (1, 23, 714);
INSERT INTO public.games_played VALUES (2, 24, 982);
INSERT INTO public.games_played VALUES (3, 23, 989);
INSERT INTO public.games_played VALUES (4, 23, 518);
INSERT INTO public.games_played VALUES (5, 23, 103);
INSERT INTO public.games_played VALUES (6, 25, 344);
INSERT INTO public.games_played VALUES (7, 26, 764);
INSERT INTO public.games_played VALUES (8, 25, 317);
INSERT INTO public.games_played VALUES (9, 25, 847);
INSERT INTO public.games_played VALUES (10, 25, 34);
INSERT INTO public.games_played VALUES (11, 27, 175);
INSERT INTO public.games_played VALUES (12, 28, 157);
INSERT INTO public.games_played VALUES (13, 27, 461);
INSERT INTO public.games_played VALUES (14, 27, 129);
INSERT INTO public.games_played VALUES (15, 27, 330);
INSERT INTO public.games_played VALUES (16, 29, 176);
INSERT INTO public.games_played VALUES (17, 30, 519);
INSERT INTO public.games_played VALUES (18, 29, 906);
INSERT INTO public.games_played VALUES (19, 29, 330);
INSERT INTO public.games_played VALUES (20, 29, 952);
INSERT INTO public.games_played VALUES (21, 31, 4);
INSERT INTO public.games_played VALUES (22, 31, 13);
INSERT INTO public.games_played VALUES (23, 32, 762);
INSERT INTO public.games_played VALUES (24, 32, 953);
INSERT INTO public.games_played VALUES (25, 31, 236);
INSERT INTO public.games_played VALUES (26, 31, 961);
INSERT INTO public.games_played VALUES (27, 31, 28);
INSERT INTO public.games_played VALUES (28, 33, 133);
INSERT INTO public.games_played VALUES (29, 34, 691);
INSERT INTO public.games_played VALUES (30, 33, 41);
INSERT INTO public.games_played VALUES (31, 33, 407);
INSERT INTO public.games_played VALUES (32, 33, 523);
INSERT INTO public.games_played VALUES (33, 35, 13);
INSERT INTO public.games_played VALUES (34, 35, 899);
INSERT INTO public.games_played VALUES (35, 36, 992);
INSERT INTO public.games_played VALUES (36, 36, 142);
INSERT INTO public.games_played VALUES (37, 35, 865);
INSERT INTO public.games_played VALUES (38, 35, 987);
INSERT INTO public.games_played VALUES (39, 35, 384);
INSERT INTO public.games_played VALUES (40, 37, 488);
INSERT INTO public.games_played VALUES (41, 37, 437);
INSERT INTO public.games_played VALUES (42, 38, 408);
INSERT INTO public.games_played VALUES (43, 38, 991);
INSERT INTO public.games_played VALUES (44, 37, 507);
INSERT INTO public.games_played VALUES (45, 37, 608);
INSERT INTO public.games_played VALUES (46, 37, 688);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (12, 'user_1730647323939');
INSERT INTO public.usernames VALUES (13, 'user_1730647323938');
INSERT INTO public.usernames VALUES (14, 'user_1730647366960');
INSERT INTO public.usernames VALUES (15, 'user_1730647366959');
INSERT INTO public.usernames VALUES (16, 'user_1730647496552');
INSERT INTO public.usernames VALUES (17, 'user_1730647496551');
INSERT INTO public.usernames VALUES (18, 'user_1730647625946');
INSERT INTO public.usernames VALUES (19, 'user_1730647625945');
INSERT INTO public.usernames VALUES (20, 'user_1730647756706');
INSERT INTO public.usernames VALUES (21, 'user_1730647756704');
INSERT INTO public.usernames VALUES (22, 'hkmujian00');
INSERT INTO public.usernames VALUES (23, 'user_1730648033192');
INSERT INTO public.usernames VALUES (24, 'user_1730648033191');
INSERT INTO public.usernames VALUES (25, 'user_1730648050728');
INSERT INTO public.usernames VALUES (26, 'user_1730648050727');
INSERT INTO public.usernames VALUES (27, 'user_1730648073620');
INSERT INTO public.usernames VALUES (28, 'user_1730648073619');
INSERT INTO public.usernames VALUES (29, 'user_1730648083088');
INSERT INTO public.usernames VALUES (30, 'user_1730648083087');
INSERT INTO public.usernames VALUES (31, 'user_1730648123379');
INSERT INTO public.usernames VALUES (32, 'user_1730648123378');
INSERT INTO public.usernames VALUES (33, 'user_1730648136659');
INSERT INTO public.usernames VALUES (34, 'user_1730648136658');
INSERT INTO public.usernames VALUES (35, 'user_1730648155989');
INSERT INTO public.usernames VALUES (36, 'user_1730648155988');
INSERT INTO public.usernames VALUES (37, 'user_1730648231872');
INSERT INTO public.usernames VALUES (38, 'user_1730648231871');


--
-- Name: games_played_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_played_game_id_seq', 46, true);


--
-- Name: usernames_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_user_id_seq', 38, true);


--
-- Name: games_played games_played_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played
    ADD CONSTRAINT games_played_pkey PRIMARY KEY (game_id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (user_id);


--
-- Name: usernames usernames_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_username_key UNIQUE (username);


--
-- Name: games_played games_played_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played
    ADD CONSTRAINT games_played_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.usernames(user_id);


--
-- PostgreSQL database dump complete
--

