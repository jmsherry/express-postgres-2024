--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id bigint GENERATED ALWAYS AS IDENTITY,
    make character varying(50) NOT NULL,
    bhp integer NOT NULL,
    avatar_url character varying(100) DEFAULT 'https://static.thenounproject.com/png/449586-200.png'::character varying NOT NULL,
    owner integer
);


ALTER TABLE public.cars OWNER TO postgres;



--
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id bigint GENERATED ALWAYS AS IDENTITY,
    name character varying(50) NOT NULL
);


ALTER TABLE public.owners OWNER TO postgres;


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, make, bhp, avatar_url, owner) FROM stdin;
11	bugatti	666	https://static.thenounproject.com/png/449586-200.png	1
12	Ferrari	555	https://static.thenounproject.com/png/449586-200.png	\N
13	bugatti 5000	999	https://static.thenounproject.com/png/449586-200.png	1
14	bugatti 5000	999	https://static.thenounproject.com/png/449586-200.png	1
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, name) FROM stdin;
1	James Sherry
2	Robert Sherry
\.




--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);



--
-- Name: cars cars_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_owner_fkey FOREIGN KEY (owner) REFERENCES public.owners(id);


--
-- PostgreSQL database dump complete
--

