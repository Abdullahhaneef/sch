--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-10-06 17:57:42 PKT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 200 (class 1259 OID 343344)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 343342)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2066 (class 2604 OID 343347)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2188 (class 0 OID 343344)
-- Dependencies: 200
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, username, email, password, "createdAt", "updatedAt") VALUES (1, 'reveler', 'reveler@revel.com', '$2a$10$VvwHLuZTDu19ocpueuQlZ.8wsDNDxZJ477GB9D5GZGbPA8dG0XOIq', '2017-10-06 10:44:44.324+05', '2017-10-06 10:44:44.324+05');
INSERT INTO users (id, username, email, password, "createdAt", "updatedAt") VALUES (2, 'admin', 'admin@revel.com', '$2a$10$H6/rYZ/m1MhFSC0DkbXlzOx/fkW8ZysGFKNAuW.XqPND6nXvZ0j26', '2017-10-06 10:44:44.324+05', '2017-10-06 10:44:44.324+05');


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 2068 (class 2606 OID 343356)
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2070 (class 2606 OID 343352)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2072 (class 2606 OID 343354)
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


-- Completed on 2017-10-06 17:57:42 PKT

--
-- PostgreSQL database dump complete
--

