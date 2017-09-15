--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-09-15 18:35:25 PKT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE revel_ashes;
--
-- TOC entry 2293 (class 1262 OID 326479)
-- Name: revel_ashes; Type: DATABASE; Schema: -; Owner: ahaneef
--

CREATE DATABASE revel_ashes WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE revel_ashes OWNER TO ahaneef;

\connect revel_ashes

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 326536)
-- Name: analytics_emp_skill_reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE analytics_emp_skill_reference (
    id integer NOT NULL,
    emp_id integer,
    core_competency_id integer,
    tool_capability_id integer,
    category_id integer,
    skill_id integer,
    experience_id integer,
    level_id integer,
    certification_id integer,
    learning_interest_id integer,
    community_id integer
);


ALTER TABLE analytics_emp_skill_reference OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 326500)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    id integer NOT NULL,
    name character varying(250)
);


ALTER TABLE category OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 326498)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO postgres;

--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 185
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- TOC entry 194 (class 1259 OID 326524)
-- Name: certification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE certification (
    id integer NOT NULL,
    value character varying(10)
);


ALTER TABLE certification OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 326522)
-- Name: certification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE certification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE certification_id_seq OWNER TO postgres;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 193
-- Name: certification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE certification_id_seq OWNED BY certification.id;


--
-- TOC entry 204 (class 1259 OID 334854)
-- Name: community; Type: TABLE; Schema: public; Owner: ahaneef
--

CREATE TABLE community (
    id integer NOT NULL,
    name character varying(200)
);


ALTER TABLE community OWNER TO ahaneef;

--
-- TOC entry 203 (class 1259 OID 334852)
-- Name: community_id_seq; Type: SEQUENCE; Schema: public; Owner: ahaneef
--

CREATE SEQUENCE community_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE community_id_seq OWNER TO ahaneef;

--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 203
-- Name: community_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ahaneef
--

ALTER SEQUENCE community_id_seq OWNED BY community.id;


--
-- TOC entry 184 (class 1259 OID 326488)
-- Name: core_competency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_competency (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE core_competency OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 326486)
-- Name: core_competency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_competency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_competency_id_seq OWNER TO postgres;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 183
-- Name: core_competency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_competency_id_seq OWNED BY core_competency.id;


--
-- TOC entry 197 (class 1259 OID 326534)
-- Name: emp_skill_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE emp_skill_reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emp_skill_reference_id_seq OWNER TO postgres;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 197
-- Name: emp_skill_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE emp_skill_reference_id_seq OWNED BY analytics_emp_skill_reference.id;


--
-- TOC entry 182 (class 1259 OID 326482)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE employees (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE employees OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 326480)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employees_id_seq OWNER TO postgres;

--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 181
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- TOC entry 190 (class 1259 OID 326512)
-- Name: experience; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE experience (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE experience OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 326510)
-- Name: experience_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE experience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE experience_id_seq OWNER TO postgres;

--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 189
-- Name: experience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE experience_id_seq OWNED BY experience.id;


--
-- TOC entry 202 (class 1259 OID 334832)
-- Name: human_element_survey; Type: TABLE; Schema: public; Owner: ahaneef
--

CREATE TABLE human_element_survey (
    id integer NOT NULL,
    emp_id integer,
    category character varying(250),
    dimension character varying(250),
    value text
);


ALTER TABLE human_element_survey OWNER TO ahaneef;

--
-- TOC entry 201 (class 1259 OID 334830)
-- Name: human_element_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: ahaneef
--

CREATE SEQUENCE human_element_survey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE human_element_survey_id_seq OWNER TO ahaneef;

--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 201
-- Name: human_element_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ahaneef
--

ALTER SEQUENCE human_element_survey_id_seq OWNED BY human_element_survey.id;


--
-- TOC entry 196 (class 1259 OID 326530)
-- Name: learning_interest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE learning_interest (
    id integer NOT NULL,
    name character varying(10),
    value integer
);


ALTER TABLE learning_interest OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 326528)
-- Name: learning_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE learning_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE learning_interest_id_seq OWNER TO postgres;

--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 195
-- Name: learning_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE learning_interest_id_seq OWNED BY learning_interest.id;


--
-- TOC entry 192 (class 1259 OID 326518)
-- Name: level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE level (
    id integer NOT NULL,
    name character varying(250),
    value integer
);


ALTER TABLE level OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 326516)
-- Name: level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE level_id_seq OWNER TO postgres;

--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 191
-- Name: level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE level_id_seq OWNED BY level.id;


--
-- TOC entry 188 (class 1259 OID 326506)
-- Name: skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE skill (
    id integer NOT NULL,
    name character varying(500),
    community_id integer
);


ALTER TABLE skill OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 326504)
-- Name: skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skill_id_seq OWNER TO postgres;

--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 187
-- Name: skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE skill_id_seq OWNED BY skill.id;


--
-- TOC entry 206 (class 1259 OID 334873)
-- Name: skill_survey; Type: TABLE; Schema: public; Owner: ahaneef
--

CREATE TABLE skill_survey (
    id integer NOT NULL,
    emp_id integer,
    core_competency character varying(250),
    tool_capability_id integer,
    category character varying(250),
    skill character varying(500),
    experience_id integer,
    level character varying(100),
    certification_id integer,
    learning_interest character varying(100),
    community_id integer
);


ALTER TABLE skill_survey OWNER TO ahaneef;

--
-- TOC entry 205 (class 1259 OID 334871)
-- Name: skill_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: ahaneef
--

CREATE SEQUENCE skill_survey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skill_survey_id_seq OWNER TO ahaneef;

--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 205
-- Name: skill_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ahaneef
--

ALTER SEQUENCE skill_survey_id_seq OWNED BY skill_survey.id;


--
-- TOC entry 200 (class 1259 OID 326609)
-- Name: tool_capability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tool_capability (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE tool_capability OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 326607)
-- Name: tool_capability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tool_capability_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tool_capability_id_seq OWNER TO postgres;

--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 199
-- Name: tool_capability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tool_capability_id_seq OWNED BY tool_capability.id;


--
-- TOC entry 2102 (class 2604 OID 326539)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference ALTER COLUMN id SET DEFAULT nextval('emp_skill_reference_id_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 326503)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 326527)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certification ALTER COLUMN id SET DEFAULT nextval('certification_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 334857)
-- Name: id; Type: DEFAULT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY community ALTER COLUMN id SET DEFAULT nextval('community_id_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 326491)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_competency ALTER COLUMN id SET DEFAULT nextval('core_competency_id_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 326485)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 326515)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experience ALTER COLUMN id SET DEFAULT nextval('experience_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 334835)
-- Name: id; Type: DEFAULT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY human_element_survey ALTER COLUMN id SET DEFAULT nextval('human_element_survey_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 326533)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY learning_interest ALTER COLUMN id SET DEFAULT nextval('learning_interest_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 326521)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY level ALTER COLUMN id SET DEFAULT nextval('level_id_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 326509)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY skill ALTER COLUMN id SET DEFAULT nextval('skill_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 334876)
-- Name: id; Type: DEFAULT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY skill_survey ALTER COLUMN id SET DEFAULT nextval('skill_survey_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 326612)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tool_capability ALTER COLUMN id SET DEFAULT nextval('tool_capability_id_seq'::regclass);


--
-- TOC entry 2280 (class 0 OID 326536)
-- Dependencies: 198
-- Data for Name: analytics_emp_skill_reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1928, 47, 1, 1, 1, 3, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1929, 47, 1, 2, 2, 4, 1, 5, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1930, 47, 1, 2, 2, 5, 1, 5, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1931, 47, 1, 2, 2, 6, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1932, 47, 1, 2, 2, 7, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1933, 47, 1, 2, 2, 8, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1934, 47, 1, 2, 2, 9, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1935, 47, 1, 2, 3, 10, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1936, 47, 1, 2, 3, 11, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1937, 47, 1, 2, 3, 12, 2, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1938, 47, 1, 2, 3, 13, 2, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1939, 47, 1, 2, 3, 14, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1940, 47, 1, 2, 3, 15, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1941, 47, 1, 2, 3, 16, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1942, 47, 1, 2, 2, 17, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1943, 47, 1, 2, 2, 18, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1944, 47, 1, 2, 2, 19, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1945, 47, 1, 2, 2, 20, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1946, 47, 1, 2, 4, 21, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1947, 47, 1, 2, 4, 22, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1948, 47, 1, 2, 4, 23, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1949, 47, 1, 2, 4, 24, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1950, 47, 1, 2, 4, 25, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1951, 47, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1952, 47, 1, 2, 4, 27, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1953, 47, 1, 2, 5, 28, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1954, 47, 1, 2, 5, 29, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1955, 47, 1, 2, 5, 30, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1956, 47, 1, 2, 5, 31, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1957, 47, 1, 2, 5, 32, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1958, 47, 1, 2, 5, 33, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1959, 47, 1, 2, 5, 34, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1960, 47, 1, 2, 5, 35, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1961, 47, 1, 2, 5, 36, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1962, 47, 1, 2, 6, 37, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1963, 47, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1964, 47, 1, 2, 6, 39, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1965, 47, 1, 2, 6, 40, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1966, 47, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1967, 47, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1968, 47, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1969, 47, 2, 1, 7, 44, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1970, 47, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1971, 47, 2, 1, 7, 46, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1972, 47, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1973, 47, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1974, 47, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1975, 47, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1976, 47, 2, 1, 8, 51, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1977, 47, 2, 1, 8, 52, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1978, 47, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1979, 47, 2, 1, 8, 54, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1980, 47, 2, 2, 9, 55, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1981, 47, 2, 2, 9, 56, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1982, 47, 2, 2, 9, 57, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1983, 47, 2, 2, 9, 58, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1984, 47, 2, 2, 9, 59, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1985, 47, 2, 2, 9, 60, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1986, 47, 2, 2, 9, 61, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1987, 47, 2, 2, 9, 62, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1988, 47, 2, 2, 9, 63, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1989, 47, 2, 2, 9, 64, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1990, 47, 2, 2, 9, 65, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1991, 47, 2, 2, 9, 66, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1992, 47, 2, 2, 9, 67, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1993, 47, 2, 2, 9, 68, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1994, 47, 2, 2, 9, 69, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1995, 47, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1996, 47, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1997, 47, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1998, 47, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1999, 47, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2000, 47, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2001, 47, 3, 1, 10, 76, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2002, 47, 3, 1, 10, 77, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2003, 47, 3, 1, 10, 78, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2004, 47, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2005, 47, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2006, 47, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2007, 47, 3, 1, 11, 82, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2008, 47, 3, 1, 11, 83, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2009, 47, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2010, 47, 3, 1, 11, 85, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2011, 47, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2012, 47, 3, 1, 11, 87, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2013, 47, 3, 1, 11, 88, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2014, 47, 3, 1, 11, 89, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2015, 47, 3, 1, 11, 90, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2016, 47, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2017, 47, 3, 1, 13, 92, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2018, 47, 3, 1, 13, 93, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2019, 47, 3, 1, 13, 94, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2020, 47, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2021, 47, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2022, 47, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2023, 47, 3, 1, 14, 98, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2024, 47, 3, 1, 14, 99, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2025, 47, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2026, 47, 3, 1, 14, 101, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2027, 47, 3, 1, 14, 102, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2028, 47, 3, 1, 14, 103, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2029, 47, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2030, 47, 3, 1, 14, 105, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2031, 47, 3, 1, 15, 106, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2032, 47, 3, 1, 15, 107, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2033, 47, 3, 1, 16, 108, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2034, 47, 3, 1, 16, 109, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2035, 47, 3, 1, 16, 110, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1927, 47, 1, 1, 1, 2, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2036, 47, 3, 1, 16, 111, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2037, 47, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2038, 47, 3, 2, 17, 113, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2039, 47, 3, 2, 17, 114, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2040, 47, 3, 2, 17, 115, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2041, 47, 3, 2, 17, 116, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2042, 47, 3, 2, 17, 117, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2043, 47, 3, 2, 17, 118, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2044, 47, 3, 2, 17, 119, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2045, 47, 3, 2, 17, 120, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2046, 47, 3, 2, 17, 121, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2047, 47, 3, 2, 17, 122, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2048, 47, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2049, 47, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2050, 47, 3, 2, 17, 125, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2051, 47, 3, 2, 17, 126, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2052, 47, 3, 2, 17, 127, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2053, 47, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2054, 47, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2055, 47, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2056, 47, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2057, 47, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2058, 47, 4, 1, 18, 133, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2059, 47, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2060, 47, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2061, 47, 4, 1, 18, 136, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2062, 47, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2063, 47, 4, 1, 18, 138, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2064, 47, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2065, 47, 4, 1, 18, 140, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2066, 47, 4, 1, 18, 141, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2067, 47, 4, 1, 18, 142, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2068, 47, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2069, 47, 4, 1, 18, 144, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2070, 47, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2071, 47, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2072, 47, 4, 2, 18, 147, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2073, 47, 4, 2, 18, 148, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2074, 47, 4, 2, 18, 149, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2075, 47, 4, 2, 18, 150, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2076, 47, 4, 2, 18, 151, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2077, 47, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2078, 47, 4, 2, 18, 153, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2079, 47, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2080, 47, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2081, 47, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2082, 47, 4, 2, 18, 157, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2083, 47, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2084, 47, 4, 2, 18, 159, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2085, 47, 4, 2, 18, 160, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2086, 47, 4, 2, 18, 161, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2087, 47, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2088, 47, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2089, 47, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2090, 47, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2091, 47, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2092, 47, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2093, 47, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2094, 47, 4, 2, 18, 169, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2095, 47, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2096, 47, 4, 2, 18, 171, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2097, 47, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2098, 47, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2099, 47, 4, 2, 19, 174, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2100, 47, 4, 2, 19, 175, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2101, 47, 4, 2, 19, 176, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2102, 47, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2103, 47, 4, 2, 19, 178, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2104, 47, 4, 2, 19, 179, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2105, 47, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2106, 47, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2107, 47, 4, 2, 19, 182, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2108, 47, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2109, 47, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2110, 47, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2111, 47, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2112, 47, 4, 2, 19, 187, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2113, 47, 4, 2, 19, 188, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2114, 47, 4, 2, 19, 189, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2115, 47, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2116, 47, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2117, 47, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2118, 47, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2119, 47, 4, 2, 19, 194, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2120, 47, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2121, 47, 5, 1, 20, 196, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2122, 47, 5, 1, 20, 197, 1, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2123, 47, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2124, 47, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2125, 47, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2126, 47, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2127, 47, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2128, 47, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2129, 47, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2130, 47, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2131, 47, 5, 1, 21, 206, 2, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2132, 47, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2133, 47, 5, 1, 21, 208, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2134, 47, 5, 1, 21, 209, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2135, 47, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2136, 47, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2137, 47, 5, 1, 21, 212, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2138, 47, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2139, 47, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2140, 47, 5, 1, 21, 215, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2141, 47, 6, 1, 22, 216, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2142, 47, 6, 1, 22, 217, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2143, 47, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2144, 47, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2145, 47, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2146, 47, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2147, 47, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2148, 47, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2149, 47, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2150, 47, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2151, 47, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2152, 47, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2153, 47, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2154, 47, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2155, 47, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2156, 47, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2157, 47, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2158, 47, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2159, 47, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2160, 47, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2161, 47, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2162, 47, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2163, 47, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2164, 47, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2165, 47, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2166, 47, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2167, 47, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2168, 47, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2169, 47, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2170, 47, 7, 1, 26, 245, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2171, 47, 7, 1, 26, 246, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2172, 47, 7, 1, 26, 247, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2173, 47, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2174, 47, 7, 1, 26, 249, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2175, 47, 7, 1, 26, 250, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2176, 47, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2177, 47, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2178, 47, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2179, 47, 7, 1, 26, 254, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2180, 47, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2181, 47, 7, 1, 26, 256, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2182, 47, 7, 1, 26, 257, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2183, 47, 7, 1, 26, 258, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2184, 47, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2185, 47, 7, 1, 26, 260, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2186, 47, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2187, 47, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2188, 47, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2189, 47, 8, 1, 27, 264, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2190, 47, 8, 1, 27, 265, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2191, 47, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2192, 47, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2193, 47, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2194, 47, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2195, 47, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2196, 47, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2197, 47, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2198, 47, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2199, 47, 8, 1, 27, 274, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2200, 48, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2201, 48, 1, 1, 1, 2, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2202, 48, 1, 1, 1, 3, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2203, 48, 1, 2, 2, 4, 1, 3, 1, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2204, 48, 1, 2, 2, 5, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2205, 48, 1, 2, 2, 6, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2206, 48, 1, 2, 2, 7, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2207, 48, 1, 2, 2, 8, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2208, 48, 1, 2, 2, 9, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2209, 48, 1, 2, 3, 10, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2210, 48, 1, 2, 3, 11, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2211, 48, 1, 2, 3, 12, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2212, 48, 1, 2, 3, 13, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2213, 48, 1, 2, 3, 14, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2214, 48, 1, 2, 3, 15, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2215, 48, 1, 2, 3, 16, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2216, 48, 1, 2, 2, 17, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2217, 48, 1, 2, 2, 18, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2218, 48, 1, 2, 2, 19, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2219, 48, 1, 2, 2, 20, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2220, 48, 1, 2, 4, 21, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2221, 48, 1, 2, 4, 22, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2222, 48, 1, 2, 4, 23, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2223, 48, 1, 2, 4, 24, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2224, 48, 1, 2, 4, 25, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2225, 48, 1, 2, 4, 26, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2226, 48, 1, 2, 4, 27, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2227, 48, 1, 2, 5, 28, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2228, 48, 1, 2, 5, 29, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2229, 48, 1, 2, 5, 30, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2230, 48, 1, 2, 5, 31, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2231, 48, 1, 2, 5, 32, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2232, 48, 1, 2, 5, 33, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2233, 48, 1, 2, 5, 34, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2234, 48, 1, 2, 5, 35, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2235, 48, 1, 2, 5, 36, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2236, 48, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2237, 48, 1, 2, 6, 38, 2, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2238, 48, 1, 2, 6, 39, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2239, 48, 1, 2, 6, 40, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2240, 48, 2, 1, 7, 41, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2241, 48, 2, 1, 7, 42, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2242, 48, 2, 1, 7, 43, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2243, 48, 2, 1, 7, 44, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2244, 48, 2, 1, 7, 45, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2245, 48, 2, 1, 7, 46, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2246, 48, 2, 1, 7, 47, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2247, 48, 2, 1, 7, 48, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2248, 48, 2, 1, 7, 49, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2249, 48, 2, 1, 7, 50, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2250, 48, 2, 1, 8, 51, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2251, 48, 2, 1, 8, 52, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2252, 48, 2, 1, 8, 53, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2253, 48, 2, 1, 8, 54, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2254, 48, 2, 2, 9, 55, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2255, 48, 2, 2, 9, 56, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2256, 48, 2, 2, 9, 57, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2257, 48, 2, 2, 9, 58, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2258, 48, 2, 2, 9, 59, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2259, 48, 2, 2, 9, 60, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2260, 48, 2, 2, 9, 61, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2261, 48, 2, 2, 9, 62, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2262, 48, 2, 2, 9, 63, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2263, 48, 2, 2, 9, 64, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2264, 48, 2, 2, 9, 65, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2265, 48, 2, 2, 9, 66, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2266, 48, 2, 2, 9, 67, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2267, 48, 2, 2, 9, 68, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2268, 48, 2, 2, 9, 69, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2269, 48, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2270, 48, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2271, 48, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2272, 48, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2273, 48, 3, 1, 10, 74, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2274, 48, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2275, 48, 3, 1, 10, 76, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2276, 48, 3, 1, 10, 77, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2277, 48, 3, 1, 10, 78, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2278, 48, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2279, 48, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2280, 48, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2281, 48, 3, 1, 11, 82, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2282, 48, 3, 1, 11, 83, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2283, 48, 3, 1, 11, 84, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2284, 48, 3, 1, 11, 85, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2285, 48, 3, 1, 11, 86, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2286, 48, 3, 1, 11, 87, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2287, 48, 3, 1, 11, 88, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2288, 48, 3, 1, 11, 89, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2289, 48, 3, 1, 11, 90, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2290, 48, 3, 1, 12, 91, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2291, 48, 3, 1, 13, 92, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2292, 48, 3, 1, 13, 93, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2293, 48, 3, 1, 13, 94, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2294, 48, 3, 1, 13, 95, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2295, 48, 3, 1, 13, 96, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2296, 48, 3, 1, 13, 97, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2297, 48, 3, 1, 14, 98, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2298, 48, 3, 1, 14, 99, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2299, 48, 3, 1, 14, 100, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2300, 48, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2301, 48, 3, 1, 14, 102, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2302, 48, 3, 1, 14, 103, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2303, 48, 3, 1, 14, 104, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2304, 48, 3, 1, 14, 105, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2305, 48, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2306, 48, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2307, 48, 3, 1, 16, 108, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2308, 48, 3, 1, 16, 109, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2309, 48, 3, 1, 16, 110, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2310, 48, 3, 1, 16, 111, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2311, 48, 3, 1, 16, 112, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2312, 48, 3, 2, 17, 113, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2313, 48, 3, 2, 17, 114, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2314, 48, 3, 2, 17, 115, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2315, 48, 3, 2, 17, 116, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2316, 48, 3, 2, 17, 117, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2317, 48, 3, 2, 17, 118, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2318, 48, 3, 2, 17, 119, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2319, 48, 3, 2, 17, 120, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2320, 48, 3, 2, 17, 121, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2321, 48, 3, 2, 17, 122, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2322, 48, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2323, 48, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2324, 48, 3, 2, 17, 125, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2325, 48, 3, 2, 17, 126, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2326, 48, 3, 2, 17, 127, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2327, 48, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2328, 48, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2329, 48, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2330, 48, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2331, 48, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2332, 48, 4, 1, 18, 133, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2333, 48, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2334, 48, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2335, 48, 4, 1, 18, 136, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2336, 48, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2337, 48, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2338, 48, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2339, 48, 4, 1, 18, 140, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2340, 48, 4, 1, 18, 141, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2341, 48, 4, 1, 18, 142, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2342, 48, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2343, 48, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2344, 48, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2345, 48, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2346, 48, 4, 2, 18, 147, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2347, 48, 4, 2, 18, 148, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2348, 48, 4, 2, 18, 149, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2349, 48, 4, 2, 18, 150, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2350, 48, 4, 2, 18, 151, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2351, 48, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2352, 48, 4, 2, 18, 153, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2353, 48, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2354, 48, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2355, 48, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2356, 48, 4, 2, 18, 157, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2357, 48, 4, 2, 18, 158, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2358, 48, 4, 2, 18, 159, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2359, 48, 4, 2, 18, 160, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2360, 48, 4, 2, 18, 161, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2361, 48, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2362, 48, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2363, 48, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2364, 48, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2365, 48, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2366, 48, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2367, 48, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2368, 48, 4, 2, 18, 169, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2369, 48, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2370, 48, 4, 2, 18, 171, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2371, 48, 4, 2, 19, 172, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2372, 48, 4, 2, 19, 173, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2373, 48, 4, 2, 19, 174, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2374, 48, 4, 2, 19, 175, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2375, 48, 4, 2, 19, 176, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2376, 48, 4, 2, 19, 177, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2377, 48, 4, 2, 19, 178, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2378, 48, 4, 2, 19, 179, 2, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2379, 48, 4, 2, 19, 180, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2380, 48, 4, 2, 19, 181, 2, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2381, 48, 4, 2, 19, 182, 2, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2382, 48, 4, 2, 19, 183, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2383, 48, 4, 2, 19, 184, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2384, 48, 4, 2, 19, 185, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2385, 48, 4, 2, 19, 186, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2386, 48, 4, 2, 19, 187, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2387, 48, 4, 2, 19, 188, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2388, 48, 4, 2, 19, 189, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2389, 48, 4, 2, 19, 190, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2390, 48, 4, 2, 19, 191, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2391, 48, 4, 2, 19, 192, 2, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2392, 48, 4, 2, 19, 193, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2393, 48, 4, 2, 19, 194, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2394, 48, 4, 2, 19, 195, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2395, 48, 5, 1, 20, 196, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2396, 48, 5, 1, 20, 197, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2397, 48, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2398, 48, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2399, 48, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2400, 48, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2401, 48, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2402, 48, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2403, 48, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2404, 48, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2405, 48, 5, 1, 21, 206, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2406, 48, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2407, 48, 5, 1, 21, 208, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2408, 48, 5, 1, 21, 209, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2409, 48, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2410, 48, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2411, 48, 5, 1, 21, 212, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2412, 48, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2413, 48, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2414, 48, 5, 1, 21, 215, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2415, 48, 6, 1, 22, 216, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2416, 48, 6, 1, 22, 217, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2417, 48, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2418, 48, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2419, 48, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2420, 48, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2421, 48, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2422, 48, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2423, 48, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2424, 48, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2425, 48, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2426, 48, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2427, 48, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2428, 48, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2429, 48, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2430, 48, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2431, 48, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2432, 48, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2433, 48, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2434, 48, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2435, 48, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2436, 48, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2437, 48, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2438, 48, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2439, 48, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2440, 48, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2441, 48, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2442, 48, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2443, 48, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2444, 48, 7, 1, 26, 245, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2445, 48, 7, 1, 26, 246, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2446, 48, 7, 1, 26, 247, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2447, 48, 7, 1, 26, 248, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2448, 48, 7, 1, 26, 249, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2449, 48, 7, 1, 26, 250, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2450, 48, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2451, 48, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2452, 48, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2453, 48, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2454, 48, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2455, 48, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2456, 48, 7, 1, 26, 257, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2457, 48, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2458, 48, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2459, 48, 7, 1, 26, 260, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2460, 48, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2461, 48, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2462, 48, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2463, 48, 8, 1, 27, 264, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2464, 48, 8, 1, 27, 265, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2465, 48, 8, 1, 27, 266, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2466, 48, 8, 1, 27, 267, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2467, 48, 8, 1, 27, 268, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2468, 48, 8, 1, 27, 269, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2469, 48, 8, 1, 27, 270, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2470, 48, 8, 1, 27, 271, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2471, 48, 8, 1, 27, 272, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2472, 48, 8, 1, 27, 273, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2473, 48, 8, 1, 27, 274, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2474, 49, 1, 1, 1, 1, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2475, 49, 1, 1, 1, 2, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2476, 49, 1, 1, 1, 3, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2477, 49, 1, 2, 2, 4, 1, 5, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2478, 49, 1, 2, 2, 5, 1, 5, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2479, 49, 1, 2, 2, 6, 1, 5, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2480, 49, 1, 2, 2, 7, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2481, 49, 1, 2, 2, 8, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2482, 49, 1, 2, 2, 9, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2483, 49, 1, 2, 3, 10, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2484, 49, 1, 2, 3, 11, 1, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2485, 49, 1, 2, 3, 12, 1, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2486, 49, 1, 2, 3, 13, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2487, 49, 1, 2, 3, 14, 2, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2488, 49, 1, 2, 3, 15, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2489, 49, 1, 2, 3, 16, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2490, 49, 1, 2, 2, 17, 1, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2491, 49, 1, 2, 2, 18, 1, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2492, 49, 1, 2, 2, 19, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2493, 49, 1, 2, 2, 20, 1, 5, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2494, 49, 1, 2, 4, 21, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2495, 49, 1, 2, 4, 22, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2496, 49, 1, 2, 4, 23, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2497, 49, 1, 2, 4, 24, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2498, 49, 1, 2, 4, 25, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2499, 49, 1, 2, 4, 26, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2500, 49, 1, 2, 4, 27, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2501, 49, 1, 2, 5, 28, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2502, 49, 1, 2, 5, 29, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2503, 49, 1, 2, 5, 30, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2504, 49, 1, 2, 5, 31, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2505, 49, 1, 2, 5, 32, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2506, 49, 1, 2, 5, 33, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2507, 49, 1, 2, 5, 34, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2508, 49, 1, 2, 5, 35, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2509, 49, 1, 2, 5, 36, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2510, 49, 1, 2, 6, 37, 1, 5, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2511, 49, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2512, 49, 1, 2, 6, 39, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2513, 49, 1, 2, 6, 40, 2, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2514, 49, 2, 1, 7, 41, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2515, 49, 2, 1, 7, 42, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2516, 49, 2, 1, 7, 43, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2517, 49, 2, 1, 7, 44, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2518, 49, 2, 1, 7, 45, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2519, 49, 2, 1, 7, 46, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2520, 49, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2521, 49, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2522, 49, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2523, 49, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2524, 49, 2, 1, 8, 51, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2525, 49, 2, 1, 8, 52, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2526, 49, 2, 1, 8, 53, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2527, 49, 2, 1, 8, 54, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2528, 49, 2, 2, 9, 55, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2529, 49, 2, 2, 9, 56, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2530, 49, 2, 2, 9, 57, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2531, 49, 2, 2, 9, 58, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2532, 49, 2, 2, 9, 59, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2533, 49, 2, 2, 9, 60, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2534, 49, 2, 2, 9, 61, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2535, 49, 2, 2, 9, 62, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2536, 49, 2, 2, 9, 63, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2537, 49, 2, 2, 9, 64, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2538, 49, 2, 2, 9, 65, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2539, 49, 2, 2, 9, 66, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2540, 49, 2, 2, 9, 67, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2541, 49, 2, 2, 9, 68, 1, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2542, 49, 2, 2, 9, 69, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2543, 49, 3, 1, 10, 70, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2544, 49, 3, 1, 10, 71, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2545, 49, 3, 1, 10, 72, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2546, 49, 3, 1, 10, 73, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2547, 49, 3, 1, 10, 74, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2548, 49, 3, 1, 10, 75, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2549, 49, 3, 1, 10, 76, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2550, 49, 3, 1, 10, 77, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2551, 49, 3, 1, 10, 78, 1, 3, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2552, 49, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2553, 49, 3, 1, 10, 80, 1, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2554, 49, 3, 1, 10, 81, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2555, 49, 3, 1, 11, 82, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2556, 49, 3, 1, 11, 83, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2557, 49, 3, 1, 11, 84, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2558, 49, 3, 1, 11, 85, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2559, 49, 3, 1, 11, 86, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2560, 49, 3, 1, 11, 87, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2561, 49, 3, 1, 11, 88, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2562, 49, 3, 1, 11, 89, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2563, 49, 3, 1, 11, 90, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2564, 49, 3, 1, 12, 91, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2565, 49, 3, 1, 13, 92, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2566, 49, 3, 1, 13, 93, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2567, 49, 3, 1, 13, 94, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2568, 49, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2569, 49, 3, 1, 13, 96, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2570, 49, 3, 1, 13, 97, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2571, 49, 3, 1, 14, 98, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2572, 49, 3, 1, 14, 99, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2573, 49, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2574, 49, 3, 1, 14, 101, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2575, 49, 3, 1, 14, 102, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2576, 49, 3, 1, 14, 103, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2577, 49, 3, 1, 14, 104, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2578, 49, 3, 1, 14, 105, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2579, 49, 3, 1, 15, 106, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2580, 49, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2581, 49, 3, 1, 16, 108, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2582, 49, 3, 1, 16, 109, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2583, 49, 3, 1, 16, 110, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2584, 49, 3, 1, 16, 111, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2585, 49, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2586, 49, 3, 2, 17, 113, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2587, 49, 3, 2, 17, 114, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2588, 49, 3, 2, 17, 115, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2589, 49, 3, 2, 17, 116, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2590, 49, 3, 2, 17, 117, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2591, 49, 3, 2, 17, 118, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2592, 49, 3, 2, 17, 119, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2593, 49, 3, 2, 17, 120, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2594, 49, 3, 2, 17, 121, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2595, 49, 3, 2, 17, 122, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2596, 49, 3, 2, 17, 123, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2597, 49, 3, 2, 17, 124, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2598, 49, 3, 2, 17, 125, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2599, 49, 3, 2, 17, 126, 1, 5, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2600, 49, 3, 2, 17, 127, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2601, 49, 4, 1, 18, 128, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2602, 49, 4, 1, 18, 129, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2603, 49, 4, 1, 18, 130, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2604, 49, 4, 1, 18, 131, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2605, 49, 4, 1, 18, 132, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2606, 49, 4, 1, 18, 133, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2607, 49, 4, 1, 18, 134, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2608, 49, 4, 1, 18, 135, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2609, 49, 4, 1, 18, 136, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2610, 49, 4, 1, 18, 137, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2611, 49, 4, 1, 18, 138, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2612, 49, 4, 1, 18, 139, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2613, 49, 4, 1, 18, 140, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2614, 49, 4, 1, 18, 141, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2615, 49, 4, 1, 18, 142, 2, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2616, 49, 4, 1, 18, 143, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2617, 49, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2618, 49, 4, 1, 18, 145, 2, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2619, 49, 4, 1, 18, 146, 2, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2620, 49, 4, 2, 18, 147, 2, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2621, 49, 4, 2, 18, 148, 2, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2622, 49, 4, 2, 18, 149, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2623, 49, 4, 2, 18, 150, 2, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2624, 49, 4, 2, 18, 151, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2625, 49, 4, 2, 18, 152, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2626, 49, 4, 2, 18, 153, 2, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2627, 49, 4, 2, 18, 154, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2628, 49, 4, 2, 18, 155, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2629, 49, 4, 2, 18, 156, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2630, 49, 4, 2, 18, 157, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2631, 49, 4, 2, 18, 158, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2632, 49, 4, 2, 18, 159, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2633, 49, 4, 2, 18, 160, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2634, 49, 4, 2, 18, 161, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2635, 49, 4, 2, 18, 162, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2636, 49, 4, 2, 18, 163, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2637, 49, 4, 2, 18, 164, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2638, 49, 4, 2, 18, 165, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2639, 49, 4, 2, 18, 166, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2640, 49, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2641, 49, 4, 2, 18, 168, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2642, 49, 4, 2, 18, 169, 2, 3, 1, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2643, 49, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2644, 49, 4, 2, 18, 171, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2645, 49, 4, 2, 19, 172, 2, 3, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2646, 49, 4, 2, 19, 173, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2647, 49, 4, 2, 19, 174, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2648, 49, 4, 2, 19, 175, 2, 3, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2649, 49, 4, 2, 19, 176, 2, 3, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2650, 49, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2651, 49, 4, 2, 19, 178, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2652, 49, 4, 2, 19, 179, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2653, 49, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2654, 49, 4, 2, 19, 181, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2655, 49, 4, 2, 19, 182, 2, 2, 1, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2656, 49, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2657, 49, 4, 2, 19, 184, 2, 2, 1, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2658, 49, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2659, 49, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2660, 49, 4, 2, 19, 187, 2, 2, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2661, 49, 4, 2, 19, 188, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2662, 49, 4, 2, 19, 189, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2663, 49, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2664, 49, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2665, 49, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2666, 49, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2667, 49, 4, 2, 19, 194, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2668, 49, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2669, 49, 5, 1, 20, 196, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2670, 49, 5, 1, 20, 197, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2671, 49, 5, 1, 20, 198, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2672, 49, 5, 1, 20, 199, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2673, 49, 5, 1, 20, 200, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2674, 49, 5, 1, 20, 201, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2675, 49, 5, 1, 20, 202, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2676, 49, 5, 1, 20, 203, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2677, 49, 5, 1, 20, 204, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2678, 49, 5, 1, 20, 205, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2679, 49, 5, 1, 21, 206, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2680, 49, 5, 1, 21, 207, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2681, 49, 5, 1, 21, 208, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2682, 49, 5, 1, 21, 209, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2683, 49, 5, 1, 21, 210, 2, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2684, 49, 5, 1, 21, 211, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2685, 49, 5, 1, 21, 212, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2686, 49, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2687, 49, 5, 1, 21, 214, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2688, 49, 5, 1, 21, 215, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2689, 49, 6, 1, 22, 216, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2690, 49, 6, 1, 22, 217, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2691, 49, 6, 1, 22, 218, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2692, 49, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2693, 49, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2694, 49, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2695, 49, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2696, 49, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2697, 49, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2698, 49, 6, 1, 23, 225, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2699, 49, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2700, 49, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2701, 49, 6, 1, 24, 228, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2702, 49, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2703, 49, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2704, 49, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2705, 49, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2706, 49, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2707, 49, 6, 1, 25, 234, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2708, 49, 6, 1, 25, 235, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2709, 49, 6, 1, 25, 236, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2710, 49, 6, 1, 25, 237, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2711, 49, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2712, 49, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2713, 49, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2714, 49, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2715, 49, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2716, 49, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2717, 49, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2718, 49, 7, 1, 26, 245, 2, 3, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2719, 49, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2720, 49, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2721, 49, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2722, 49, 7, 1, 26, 249, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2723, 49, 7, 1, 26, 250, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2724, 49, 7, 1, 26, 251, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2725, 49, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2726, 49, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2727, 49, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2728, 49, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2729, 49, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2730, 49, 7, 1, 26, 257, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2731, 49, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2732, 49, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2733, 49, 7, 1, 26, 260, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2734, 49, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2735, 49, 7, 1, 26, 262, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2736, 49, 7, 1, 26, 263, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2737, 49, 8, 1, 27, 264, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2738, 49, 8, 1, 27, 265, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2739, 49, 8, 1, 27, 266, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2740, 49, 8, 1, 27, 267, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2741, 49, 8, 1, 27, 268, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2742, 49, 8, 1, 27, 269, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2743, 49, 8, 1, 27, 270, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2744, 49, 8, 1, 27, 271, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2745, 49, 8, 1, 27, 272, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2746, 49, 8, 1, 27, 273, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2747, 49, 8, 1, 27, 274, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2748, 50, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2749, 50, 1, 1, 1, 2, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2750, 50, 1, 1, 1, 3, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2751, 50, 1, 2, 2, 4, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2752, 50, 1, 2, 2, 5, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2753, 50, 1, 2, 2, 6, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2754, 50, 1, 2, 2, 7, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2755, 50, 1, 2, 2, 8, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2756, 50, 1, 2, 2, 9, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2757, 50, 1, 2, 3, 10, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2758, 50, 1, 2, 3, 11, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2759, 50, 1, 2, 3, 12, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2760, 50, 1, 2, 3, 13, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2761, 50, 1, 2, 3, 14, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2762, 50, 1, 2, 3, 15, 1, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2763, 50, 1, 2, 3, 16, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2764, 50, 1, 2, 2, 17, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2765, 50, 1, 2, 2, 18, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2766, 50, 1, 2, 2, 19, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2767, 50, 1, 2, 2, 20, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2768, 50, 1, 2, 4, 21, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2769, 50, 1, 2, 4, 22, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2770, 50, 1, 2, 4, 23, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2771, 50, 1, 2, 4, 24, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2772, 50, 1, 2, 4, 25, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2773, 50, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2774, 50, 1, 2, 4, 27, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2775, 50, 1, 2, 5, 28, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2776, 50, 1, 2, 5, 29, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2777, 50, 1, 2, 5, 30, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2778, 50, 1, 2, 5, 31, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2779, 50, 1, 2, 5, 32, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2780, 50, 1, 2, 5, 33, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2781, 50, 1, 2, 5, 34, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2782, 50, 1, 2, 5, 35, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2783, 50, 1, 2, 5, 36, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2784, 50, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2785, 50, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2786, 50, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2787, 50, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2788, 50, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2789, 50, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2790, 50, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2791, 50, 2, 1, 7, 44, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2792, 50, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2793, 50, 2, 1, 7, 46, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2794, 50, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2795, 50, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2796, 50, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2797, 50, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2798, 50, 2, 1, 8, 51, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2799, 50, 2, 1, 8, 52, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2800, 50, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2801, 50, 2, 1, 8, 54, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2802, 50, 2, 2, 9, 55, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2803, 50, 2, 2, 9, 56, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2804, 50, 2, 2, 9, 57, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2805, 50, 2, 2, 9, 58, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2806, 50, 2, 2, 9, 59, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2807, 50, 2, 2, 9, 60, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2808, 50, 2, 2, 9, 61, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2809, 50, 2, 2, 9, 62, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2810, 50, 2, 2, 9, 63, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2811, 50, 2, 2, 9, 64, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2812, 50, 2, 2, 9, 65, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2813, 50, 2, 2, 9, 66, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2814, 50, 2, 2, 9, 67, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2815, 50, 2, 2, 9, 68, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2816, 50, 2, 2, 9, 69, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2817, 50, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2818, 50, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2819, 50, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2820, 50, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2821, 50, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2822, 50, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2823, 50, 3, 1, 10, 76, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2824, 50, 3, 1, 10, 77, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2825, 50, 3, 1, 10, 78, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2826, 50, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2827, 50, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2828, 50, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2829, 50, 3, 1, 11, 82, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2830, 50, 3, 1, 11, 83, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2831, 50, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2832, 50, 3, 1, 11, 85, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2833, 50, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2834, 50, 3, 1, 11, 87, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2835, 50, 3, 1, 11, 88, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2836, 50, 3, 1, 11, 89, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2837, 50, 3, 1, 11, 90, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2838, 50, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2839, 50, 3, 1, 13, 92, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2840, 50, 3, 1, 13, 93, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2841, 50, 3, 1, 13, 94, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2842, 50, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2843, 50, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2844, 50, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2845, 50, 3, 1, 14, 98, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2846, 50, 3, 1, 14, 99, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2847, 50, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2848, 50, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2849, 50, 3, 1, 14, 102, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2850, 50, 3, 1, 14, 103, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2851, 50, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2852, 50, 3, 1, 14, 105, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2853, 50, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2854, 50, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2855, 50, 3, 1, 16, 108, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2856, 50, 3, 1, 16, 109, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2857, 50, 3, 1, 16, 110, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2858, 50, 3, 1, 16, 111, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2859, 50, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2860, 50, 3, 2, 17, 113, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2861, 50, 3, 2, 17, 114, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2862, 50, 3, 2, 17, 115, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2863, 50, 3, 2, 17, 116, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2864, 50, 3, 2, 17, 117, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2865, 50, 3, 2, 17, 118, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2866, 50, 3, 2, 17, 119, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2867, 50, 3, 2, 17, 120, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2868, 50, 3, 2, 17, 121, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2869, 50, 3, 2, 17, 122, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2870, 50, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2871, 50, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2872, 50, 3, 2, 17, 125, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2873, 50, 3, 2, 17, 126, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2874, 50, 3, 2, 17, 127, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2875, 50, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2876, 50, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2877, 50, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2878, 50, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2879, 50, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2880, 50, 4, 1, 18, 133, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2881, 50, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2882, 50, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2883, 50, 4, 1, 18, 136, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2884, 50, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2885, 50, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2886, 50, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2887, 50, 4, 1, 18, 140, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2888, 50, 4, 1, 18, 141, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2889, 50, 4, 1, 18, 142, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2890, 50, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2891, 50, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2892, 50, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2893, 50, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2894, 50, 4, 2, 18, 147, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2895, 50, 4, 2, 18, 148, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2896, 50, 4, 2, 18, 149, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2897, 50, 4, 2, 18, 150, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2898, 50, 4, 2, 18, 151, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2899, 50, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2900, 50, 4, 2, 18, 153, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2901, 50, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2902, 50, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2903, 50, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2904, 50, 4, 2, 18, 157, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2905, 50, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2906, 50, 4, 2, 18, 159, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2907, 50, 4, 2, 18, 160, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2908, 50, 4, 2, 18, 161, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2909, 50, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2910, 50, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2911, 50, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2912, 50, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2913, 50, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2914, 50, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2915, 50, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2916, 50, 4, 2, 18, 169, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2917, 50, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2918, 50, 4, 2, 18, 171, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2919, 50, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2920, 50, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2921, 50, 4, 2, 19, 174, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2922, 50, 4, 2, 19, 175, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2923, 50, 4, 2, 19, 176, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2924, 50, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2925, 50, 4, 2, 19, 178, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2926, 50, 4, 2, 19, 179, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2927, 50, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2928, 50, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2929, 50, 4, 2, 19, 182, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2930, 50, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2931, 50, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2932, 50, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2933, 50, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2934, 50, 4, 2, 19, 187, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2935, 50, 4, 2, 19, 188, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2936, 50, 4, 2, 19, 189, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2937, 50, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2938, 50, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2939, 50, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2940, 50, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2941, 50, 4, 2, 19, 194, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2942, 50, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2943, 50, 5, 1, 20, 196, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2944, 50, 5, 1, 20, 197, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2945, 50, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2946, 50, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2947, 50, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2948, 50, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2949, 50, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2950, 50, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2951, 50, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2952, 50, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2953, 50, 5, 1, 21, 206, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2954, 50, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2955, 50, 5, 1, 21, 208, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2956, 50, 5, 1, 21, 209, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2957, 50, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2958, 50, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2959, 50, 5, 1, 21, 212, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2960, 50, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2961, 50, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2962, 50, 5, 1, 21, 215, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2963, 50, 6, 1, 22, 216, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2964, 50, 6, 1, 22, 217, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2965, 50, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2966, 50, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2967, 50, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2968, 50, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2969, 50, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2970, 50, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2971, 50, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2972, 50, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2973, 50, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2974, 50, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2975, 50, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2976, 50, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2977, 50, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2978, 50, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2979, 50, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2980, 50, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2981, 50, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2982, 50, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2983, 50, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2984, 50, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2985, 50, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2986, 50, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2987, 50, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2988, 50, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2989, 50, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2990, 50, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2991, 50, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2992, 50, 7, 1, 26, 245, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2993, 50, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2994, 50, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2995, 50, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2996, 50, 7, 1, 26, 249, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2997, 50, 7, 1, 26, 250, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2998, 50, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (2999, 50, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3000, 50, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3001, 50, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3002, 50, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3003, 50, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3004, 50, 7, 1, 26, 257, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3005, 50, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3006, 50, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3007, 50, 7, 1, 26, 260, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3008, 50, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3009, 50, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3010, 50, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3011, 50, 8, 1, 27, 264, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3012, 50, 8, 1, 27, 265, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3013, 50, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3014, 50, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3015, 50, 8, 1, 27, 268, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3016, 50, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3017, 50, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3018, 50, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3019, 50, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3020, 50, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3021, 50, 8, 1, 27, 274, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3022, 51, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3023, 51, 1, 1, 1, 2, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3024, 51, 1, 1, 1, 3, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3025, 51, 1, 2, 2, 4, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3026, 51, 1, 2, 2, 5, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3027, 51, 1, 2, 2, 6, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3028, 51, 1, 2, 2, 7, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3029, 51, 1, 2, 2, 8, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3030, 51, 1, 2, 2, 9, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3031, 51, 1, 2, 3, 10, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3032, 51, 1, 2, 3, 11, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3033, 51, 1, 2, 3, 12, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3034, 51, 1, 2, 3, 13, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3035, 51, 1, 2, 3, 14, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3036, 51, 1, 2, 3, 15, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3037, 51, 1, 2, 3, 16, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3038, 51, 1, 2, 2, 17, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3039, 51, 1, 2, 2, 18, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3040, 51, 1, 2, 2, 19, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3041, 51, 1, 2, 2, 20, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3042, 51, 1, 2, 4, 21, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3043, 51, 1, 2, 4, 22, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3044, 51, 1, 2, 4, 23, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3045, 51, 1, 2, 4, 24, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3046, 51, 1, 2, 4, 25, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3047, 51, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3048, 51, 1, 2, 4, 27, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3049, 51, 1, 2, 5, 28, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3050, 51, 1, 2, 5, 29, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3051, 51, 1, 2, 5, 30, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3052, 51, 1, 2, 5, 31, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3053, 51, 1, 2, 5, 32, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3054, 51, 1, 2, 5, 33, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3055, 51, 1, 2, 5, 34, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3056, 51, 1, 2, 5, 35, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3057, 51, 1, 2, 5, 36, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3058, 51, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3059, 51, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3060, 51, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3061, 51, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3062, 51, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3063, 51, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3064, 51, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3065, 51, 2, 1, 7, 44, 1, 3, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3066, 51, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3067, 51, 2, 1, 7, 46, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3068, 51, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3069, 51, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3070, 51, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3071, 51, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3072, 51, 2, 1, 8, 51, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3073, 51, 2, 1, 8, 52, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3074, 51, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3075, 51, 2, 1, 8, 54, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3076, 51, 2, 2, 9, 55, 1, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3077, 51, 2, 2, 9, 56, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3078, 51, 2, 2, 9, 57, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3079, 51, 2, 2, 9, 58, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3080, 51, 2, 2, 9, 59, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3081, 51, 2, 2, 9, 60, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3082, 51, 2, 2, 9, 61, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3083, 51, 2, 2, 9, 62, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3084, 51, 2, 2, 9, 63, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3085, 51, 2, 2, 9, 64, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3086, 51, 2, 2, 9, 65, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3087, 51, 2, 2, 9, 66, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3088, 51, 2, 2, 9, 67, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3089, 51, 2, 2, 9, 68, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3090, 51, 2, 2, 9, 69, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3091, 51, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3092, 51, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3093, 51, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3094, 51, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3095, 51, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3096, 51, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3097, 51, 3, 1, 10, 76, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3098, 51, 3, 1, 10, 77, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3099, 51, 3, 1, 10, 78, 1, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3100, 51, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3101, 51, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3102, 51, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3103, 51, 3, 1, 11, 82, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3104, 51, 3, 1, 11, 83, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3105, 51, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3106, 51, 3, 1, 11, 85, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3107, 51, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3108, 51, 3, 1, 11, 87, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3109, 51, 3, 1, 11, 88, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3110, 51, 3, 1, 11, 89, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3111, 51, 3, 1, 11, 90, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3112, 51, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3113, 51, 3, 1, 13, 92, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3114, 51, 3, 1, 13, 93, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3115, 51, 3, 1, 13, 94, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3116, 51, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3117, 51, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3118, 51, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3119, 51, 3, 1, 14, 98, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3120, 51, 3, 1, 14, 99, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3121, 51, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3122, 51, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3123, 51, 3, 1, 14, 102, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3124, 51, 3, 1, 14, 103, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3125, 51, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3126, 51, 3, 1, 14, 105, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3127, 51, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3128, 51, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3129, 51, 3, 1, 16, 108, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3130, 51, 3, 1, 16, 109, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3131, 51, 3, 1, 16, 110, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3132, 51, 3, 1, 16, 111, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3133, 51, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3134, 51, 3, 2, 17, 113, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3135, 51, 3, 2, 17, 114, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3136, 51, 3, 2, 17, 115, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3137, 51, 3, 2, 17, 116, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3138, 51, 3, 2, 17, 117, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3139, 51, 3, 2, 17, 118, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3140, 51, 3, 2, 17, 119, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3141, 51, 3, 2, 17, 120, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3142, 51, 3, 2, 17, 121, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3143, 51, 3, 2, 17, 122, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3144, 51, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3145, 51, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3146, 51, 3, 2, 17, 125, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3147, 51, 3, 2, 17, 126, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3148, 51, 3, 2, 17, 127, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3149, 51, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3150, 51, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3151, 51, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3152, 51, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3153, 51, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3154, 51, 4, 1, 18, 133, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3155, 51, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3156, 51, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3157, 51, 4, 1, 18, 136, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3158, 51, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3159, 51, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3160, 51, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3161, 51, 4, 1, 18, 140, 2, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3162, 51, 4, 1, 18, 141, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3163, 51, 4, 1, 18, 142, 1, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3164, 51, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3165, 51, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3166, 51, 4, 1, 18, 145, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3167, 51, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3168, 51, 4, 2, 18, 147, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3169, 51, 4, 2, 18, 148, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3170, 51, 4, 2, 18, 149, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3171, 51, 4, 2, 18, 150, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3172, 51, 4, 2, 18, 151, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3173, 51, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3174, 51, 4, 2, 18, 153, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3175, 51, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3176, 51, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3177, 51, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3178, 51, 4, 2, 18, 157, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3179, 51, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3180, 51, 4, 2, 18, 159, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3181, 51, 4, 2, 18, 160, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3182, 51, 4, 2, 18, 161, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3183, 51, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3184, 51, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3185, 51, 4, 2, 18, 164, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3186, 51, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3187, 51, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3188, 51, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3189, 51, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3190, 51, 4, 2, 18, 169, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3191, 51, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3192, 51, 4, 2, 18, 171, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3193, 51, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3194, 51, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3195, 51, 4, 2, 19, 174, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3196, 51, 4, 2, 19, 175, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3197, 51, 4, 2, 19, 176, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3198, 51, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3199, 51, 4, 2, 19, 178, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3200, 51, 4, 2, 19, 179, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3201, 51, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3202, 51, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3203, 51, 4, 2, 19, 182, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3204, 51, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3205, 51, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3206, 51, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3207, 51, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3208, 51, 4, 2, 19, 187, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3209, 51, 4, 2, 19, 188, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3210, 51, 4, 2, 19, 189, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3211, 51, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3212, 51, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3213, 51, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3214, 51, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3215, 51, 4, 2, 19, 194, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3216, 51, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3217, 51, 5, 1, 20, 196, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3218, 51, 5, 1, 20, 197, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3219, 51, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3220, 51, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3221, 51, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3222, 51, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3223, 51, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3224, 51, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3225, 51, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3226, 51, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3227, 51, 5, 1, 21, 206, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3228, 51, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3229, 51, 5, 1, 21, 208, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3230, 51, 5, 1, 21, 209, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3231, 51, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3232, 51, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3233, 51, 5, 1, 21, 212, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3234, 51, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3235, 51, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3236, 51, 5, 1, 21, 215, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3237, 51, 6, 1, 22, 216, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3238, 51, 6, 1, 22, 217, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3239, 51, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3240, 51, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3241, 51, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3242, 51, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3243, 51, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3244, 51, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3245, 51, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3246, 51, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3247, 51, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3248, 51, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3249, 51, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3250, 51, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3251, 51, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3252, 51, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3253, 51, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3254, 51, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3586, 53, 1, 2, 2, 17, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3255, 51, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3256, 51, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3257, 51, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3258, 51, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3259, 51, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3260, 51, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3261, 51, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3262, 51, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3263, 51, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3264, 51, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3265, 51, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3266, 51, 7, 1, 26, 245, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3267, 51, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3268, 51, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3269, 51, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3270, 51, 7, 1, 26, 249, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3271, 51, 7, 1, 26, 250, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3272, 51, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3273, 51, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3274, 51, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3275, 51, 7, 1, 26, 254, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3276, 51, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3277, 51, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3278, 51, 7, 1, 26, 257, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3279, 51, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3280, 51, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3281, 51, 7, 1, 26, 260, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3282, 51, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3283, 51, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3284, 51, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3285, 51, 8, 1, 27, 264, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3286, 51, 8, 1, 27, 265, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3287, 51, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3288, 51, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3289, 51, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3290, 51, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3291, 51, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3292, 51, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3293, 51, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3294, 51, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3295, 51, 8, 1, 27, 274, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3296, 52, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3297, 52, 1, 1, 1, 2, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3298, 52, 1, 1, 1, 3, 1, 3, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3299, 52, 1, 2, 2, 4, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3300, 52, 1, 2, 2, 5, 1, 4, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3301, 52, 1, 2, 2, 6, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3302, 52, 1, 2, 2, 7, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3303, 52, 1, 2, 2, 8, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3304, 52, 1, 2, 2, 9, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3305, 52, 1, 2, 3, 10, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3306, 52, 1, 2, 3, 11, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3307, 52, 1, 2, 3, 12, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3308, 52, 1, 2, 3, 13, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3309, 52, 1, 2, 3, 14, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3310, 52, 1, 2, 3, 15, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3311, 52, 1, 2, 3, 16, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3312, 52, 1, 2, 2, 17, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3313, 52, 1, 2, 2, 18, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3314, 52, 1, 2, 2, 19, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3315, 52, 1, 2, 2, 20, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3316, 52, 1, 2, 4, 21, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3317, 52, 1, 2, 4, 22, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3318, 52, 1, 2, 4, 23, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3319, 52, 1, 2, 4, 24, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3320, 52, 1, 2, 4, 25, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3321, 52, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3322, 52, 1, 2, 4, 27, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3323, 52, 1, 2, 5, 28, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3324, 52, 1, 2, 5, 29, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3325, 52, 1, 2, 5, 30, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3326, 52, 1, 2, 5, 31, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3327, 52, 1, 2, 5, 32, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3328, 52, 1, 2, 5, 33, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3329, 52, 1, 2, 5, 34, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3330, 52, 1, 2, 5, 35, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3331, 52, 1, 2, 5, 36, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3332, 52, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3333, 52, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3334, 52, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3335, 52, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3336, 52, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3337, 52, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3338, 52, 2, 1, 7, 43, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3339, 52, 2, 1, 7, 44, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3340, 52, 2, 1, 7, 45, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3341, 52, 2, 1, 7, 46, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3342, 52, 2, 1, 7, 47, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3343, 52, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3344, 52, 2, 1, 7, 49, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3345, 52, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3346, 52, 2, 1, 8, 51, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3347, 52, 2, 1, 8, 52, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3348, 52, 2, 1, 8, 53, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3349, 52, 2, 1, 8, 54, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3350, 52, 2, 2, 9, 55, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3351, 52, 2, 2, 9, 56, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3352, 52, 2, 2, 9, 57, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3353, 52, 2, 2, 9, 58, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3354, 52, 2, 2, 9, 59, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3355, 52, 2, 2, 9, 60, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3356, 52, 2, 2, 9, 61, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3357, 52, 2, 2, 9, 62, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3358, 52, 2, 2, 9, 63, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3359, 52, 2, 2, 9, 64, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3360, 52, 2, 2, 9, 65, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3361, 52, 2, 2, 9, 66, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3362, 52, 2, 2, 9, 67, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3363, 52, 2, 2, 9, 68, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3364, 52, 2, 2, 9, 69, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3365, 52, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3366, 52, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3367, 52, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3368, 52, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3369, 52, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3370, 52, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3371, 52, 3, 1, 10, 76, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3372, 52, 3, 1, 10, 77, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3373, 52, 3, 1, 10, 78, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3374, 52, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3375, 52, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3376, 52, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3377, 52, 3, 1, 11, 82, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3378, 52, 3, 1, 11, 83, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3379, 52, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3380, 52, 3, 1, 11, 85, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3381, 52, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3382, 52, 3, 1, 11, 87, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3383, 52, 3, 1, 11, 88, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3384, 52, 3, 1, 11, 89, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3385, 52, 3, 1, 11, 90, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3386, 52, 3, 1, 12, 91, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3387, 52, 3, 1, 13, 92, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3388, 52, 3, 1, 13, 93, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3389, 52, 3, 1, 13, 94, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3390, 52, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3391, 52, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3392, 52, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3393, 52, 3, 1, 14, 98, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3394, 52, 3, 1, 14, 99, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3395, 52, 3, 1, 14, 100, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3396, 52, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3397, 52, 3, 1, 14, 102, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3398, 52, 3, 1, 14, 103, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3399, 52, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3400, 52, 3, 1, 14, 105, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3401, 52, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3402, 52, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3403, 52, 3, 1, 16, 108, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3404, 52, 3, 1, 16, 109, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3405, 52, 3, 1, 16, 110, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3406, 52, 3, 1, 16, 111, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3407, 52, 3, 1, 16, 112, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3408, 52, 3, 2, 17, 113, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3409, 52, 3, 2, 17, 114, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3410, 52, 3, 2, 17, 115, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3411, 52, 3, 2, 17, 116, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3412, 52, 3, 2, 17, 117, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3413, 52, 3, 2, 17, 118, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3414, 52, 3, 2, 17, 119, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3415, 52, 3, 2, 17, 120, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3416, 52, 3, 2, 17, 121, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3417, 52, 3, 2, 17, 122, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3418, 52, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3419, 52, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3420, 52, 3, 2, 17, 125, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3421, 52, 3, 2, 17, 126, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3422, 52, 3, 2, 17, 127, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3423, 52, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3424, 52, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3425, 52, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3426, 52, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3427, 52, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3428, 52, 4, 1, 18, 133, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3429, 52, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3430, 52, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3431, 52, 4, 1, 18, 136, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3432, 52, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3433, 52, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3434, 52, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3435, 52, 4, 1, 18, 140, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3436, 52, 4, 1, 18, 141, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3437, 52, 4, 1, 18, 142, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3438, 52, 4, 1, 18, 143, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3439, 52, 4, 1, 18, 144, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3440, 52, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3441, 52, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3442, 52, 4, 2, 18, 147, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3443, 52, 4, 2, 18, 148, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3444, 52, 4, 2, 18, 149, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3445, 52, 4, 2, 18, 150, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3446, 52, 4, 2, 18, 151, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3447, 52, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3448, 52, 4, 2, 18, 153, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3449, 52, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3450, 52, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3451, 52, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3452, 52, 4, 2, 18, 157, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3453, 52, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3454, 52, 4, 2, 18, 159, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3455, 52, 4, 2, 18, 160, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3456, 52, 4, 2, 18, 161, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3457, 52, 4, 2, 18, 162, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3458, 52, 4, 2, 18, 163, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3459, 52, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3460, 52, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3461, 52, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3462, 52, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3463, 52, 4, 2, 18, 168, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3464, 52, 4, 2, 18, 169, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3465, 52, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3466, 52, 4, 2, 18, 171, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3467, 52, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3468, 52, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3469, 52, 4, 2, 19, 174, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3470, 52, 4, 2, 19, 175, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3471, 52, 4, 2, 19, 176, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3472, 52, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3473, 52, 4, 2, 19, 178, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3474, 52, 4, 2, 19, 179, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3475, 52, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3476, 52, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3477, 52, 4, 2, 19, 182, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3478, 52, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3479, 52, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3480, 52, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3481, 52, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3482, 52, 4, 2, 19, 187, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3483, 52, 4, 2, 19, 188, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3484, 52, 4, 2, 19, 189, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3485, 52, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3486, 52, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3487, 52, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3488, 52, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3489, 52, 4, 2, 19, 194, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3490, 52, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3491, 52, 5, 1, 20, 196, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3492, 52, 5, 1, 20, 197, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3493, 52, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3494, 52, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3495, 52, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3496, 52, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3497, 52, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3498, 52, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3499, 52, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3500, 52, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3501, 52, 5, 1, 21, 206, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3502, 52, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3503, 52, 5, 1, 21, 208, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3504, 52, 5, 1, 21, 209, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3505, 52, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3506, 52, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3507, 52, 5, 1, 21, 212, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3508, 52, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3509, 52, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3510, 52, 5, 1, 21, 215, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3511, 52, 6, 1, 22, 216, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3512, 52, 6, 1, 22, 217, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3513, 52, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3514, 52, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3515, 52, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3516, 52, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3517, 52, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3518, 52, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3519, 52, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3520, 52, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3521, 52, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3522, 52, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3523, 52, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3524, 52, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3525, 52, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3526, 52, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3527, 52, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3528, 52, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3529, 52, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3530, 52, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3531, 52, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3532, 52, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3533, 52, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3534, 52, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3535, 52, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3536, 52, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3537, 52, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3538, 52, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3539, 52, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3540, 52, 7, 1, 26, 245, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3541, 52, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3542, 52, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3543, 52, 7, 1, 26, 248, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3544, 52, 7, 1, 26, 249, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3545, 52, 7, 1, 26, 250, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3546, 52, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3547, 52, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3548, 52, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3549, 52, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3550, 52, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3551, 52, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3552, 52, 7, 1, 26, 257, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3553, 52, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3554, 52, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3555, 52, 7, 1, 26, 260, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3556, 52, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3557, 52, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3558, 52, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3559, 52, 8, 1, 27, 264, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3560, 52, 8, 1, 27, 265, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3561, 52, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3562, 52, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3563, 52, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3564, 52, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3565, 52, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3566, 52, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3567, 52, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3568, 52, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3569, 52, 8, 1, 27, 274, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3570, 53, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3571, 53, 1, 1, 1, 2, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3572, 53, 1, 1, 1, 3, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3573, 53, 1, 2, 2, 4, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3574, 53, 1, 2, 2, 5, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3575, 53, 1, 2, 2, 6, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3576, 53, 1, 2, 2, 7, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3577, 53, 1, 2, 2, 8, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3578, 53, 1, 2, 2, 9, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3579, 53, 1, 2, 3, 10, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3580, 53, 1, 2, 3, 11, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3581, 53, 1, 2, 3, 12, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3582, 53, 1, 2, 3, 13, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3583, 53, 1, 2, 3, 14, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3584, 53, 1, 2, 3, 15, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3585, 53, 1, 2, 3, 16, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3587, 53, 1, 2, 2, 18, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3588, 53, 1, 2, 2, 19, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3589, 53, 1, 2, 2, 20, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3590, 53, 1, 2, 4, 21, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3591, 53, 1, 2, 4, 22, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3592, 53, 1, 2, 4, 23, 1, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3593, 53, 1, 2, 4, 24, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3594, 53, 1, 2, 4, 25, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3595, 53, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3596, 53, 1, 2, 4, 27, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3597, 53, 1, 2, 5, 28, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3598, 53, 1, 2, 5, 29, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3599, 53, 1, 2, 5, 30, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3600, 53, 1, 2, 5, 31, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3601, 53, 1, 2, 5, 32, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3602, 53, 1, 2, 5, 33, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3603, 53, 1, 2, 5, 34, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3604, 53, 1, 2, 5, 35, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3605, 53, 1, 2, 5, 36, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3606, 53, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3607, 53, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3608, 53, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3609, 53, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3610, 53, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3611, 53, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3612, 53, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3613, 53, 2, 1, 7, 44, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3614, 53, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3615, 53, 2, 1, 7, 46, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3616, 53, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3617, 53, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3618, 53, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3619, 53, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3620, 53, 2, 1, 8, 51, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3621, 53, 2, 1, 8, 52, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3622, 53, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3623, 53, 2, 1, 8, 54, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3624, 53, 2, 2, 9, 55, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3625, 53, 2, 2, 9, 56, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3626, 53, 2, 2, 9, 57, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3627, 53, 2, 2, 9, 58, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3628, 53, 2, 2, 9, 59, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3629, 53, 2, 2, 9, 60, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3630, 53, 2, 2, 9, 61, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3631, 53, 2, 2, 9, 62, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3632, 53, 2, 2, 9, 63, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3633, 53, 2, 2, 9, 64, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3634, 53, 2, 2, 9, 65, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3635, 53, 2, 2, 9, 66, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3636, 53, 2, 2, 9, 67, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3637, 53, 2, 2, 9, 68, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3638, 53, 2, 2, 9, 69, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3639, 53, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3640, 53, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3641, 53, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3642, 53, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3643, 53, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3644, 53, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3645, 53, 3, 1, 10, 76, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3646, 53, 3, 1, 10, 77, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3647, 53, 3, 1, 10, 78, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3648, 53, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3649, 53, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3650, 53, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3651, 53, 3, 1, 11, 82, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3652, 53, 3, 1, 11, 83, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3653, 53, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3654, 53, 3, 1, 11, 85, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3655, 53, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3656, 53, 3, 1, 11, 87, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3657, 53, 3, 1, 11, 88, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3658, 53, 3, 1, 11, 89, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3659, 53, 3, 1, 11, 90, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3660, 53, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3661, 53, 3, 1, 13, 92, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3662, 53, 3, 1, 13, 93, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3663, 53, 3, 1, 13, 94, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3664, 53, 3, 1, 13, 95, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3665, 53, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3666, 53, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3667, 53, 3, 1, 14, 98, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3668, 53, 3, 1, 14, 99, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3669, 53, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3670, 53, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3671, 53, 3, 1, 14, 102, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3672, 53, 3, 1, 14, 103, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3673, 53, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3674, 53, 3, 1, 14, 105, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3675, 53, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3676, 53, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3677, 53, 3, 1, 16, 108, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3678, 53, 3, 1, 16, 109, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3679, 53, 3, 1, 16, 110, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3680, 53, 3, 1, 16, 111, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3681, 53, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3682, 53, 3, 2, 17, 113, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3683, 53, 3, 2, 17, 114, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3684, 53, 3, 2, 17, 115, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3685, 53, 3, 2, 17, 116, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3686, 53, 3, 2, 17, 117, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3687, 53, 3, 2, 17, 118, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3688, 53, 3, 2, 17, 119, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3689, 53, 3, 2, 17, 120, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3690, 53, 3, 2, 17, 121, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3691, 53, 3, 2, 17, 122, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3692, 53, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3693, 53, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3694, 53, 3, 2, 17, 125, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3695, 53, 3, 2, 17, 126, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3696, 53, 3, 2, 17, 127, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3697, 53, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3698, 53, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3699, 53, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3700, 53, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3701, 53, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3702, 53, 4, 1, 18, 133, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3703, 53, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3704, 53, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3705, 53, 4, 1, 18, 136, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3706, 53, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3707, 53, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3708, 53, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3709, 53, 4, 1, 18, 140, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3710, 53, 4, 1, 18, 141, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3711, 53, 4, 1, 18, 142, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3712, 53, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3713, 53, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3714, 53, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3715, 53, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3716, 53, 4, 2, 18, 147, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3717, 53, 4, 2, 18, 148, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3718, 53, 4, 2, 18, 149, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3719, 53, 4, 2, 18, 150, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3720, 53, 4, 2, 18, 151, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3721, 53, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3722, 53, 4, 2, 18, 153, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3723, 53, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3724, 53, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3725, 53, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3726, 53, 4, 2, 18, 157, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3727, 53, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3728, 53, 4, 2, 18, 159, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3729, 53, 4, 2, 18, 160, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3730, 53, 4, 2, 18, 161, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3731, 53, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3732, 53, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3733, 53, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3734, 53, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3735, 53, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3736, 53, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3737, 53, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3738, 53, 4, 2, 18, 169, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3739, 53, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3740, 53, 4, 2, 18, 171, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3741, 53, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3742, 53, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3743, 53, 4, 2, 19, 174, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3744, 53, 4, 2, 19, 175, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3745, 53, 4, 2, 19, 176, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3746, 53, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3747, 53, 4, 2, 19, 178, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3748, 53, 4, 2, 19, 179, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3749, 53, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3750, 53, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3751, 53, 4, 2, 19, 182, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3752, 53, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3753, 53, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3754, 53, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3755, 53, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3756, 53, 4, 2, 19, 187, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3757, 53, 4, 2, 19, 188, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3758, 53, 4, 2, 19, 189, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3759, 53, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3760, 53, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3761, 53, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3762, 53, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3763, 53, 4, 2, 19, 194, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3764, 53, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3765, 53, 5, 1, 20, 196, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3766, 53, 5, 1, 20, 197, 2, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3767, 53, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3768, 53, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3769, 53, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3770, 53, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3771, 53, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3772, 53, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3773, 53, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3774, 53, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3775, 53, 5, 1, 21, 206, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3776, 53, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3777, 53, 5, 1, 21, 208, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3778, 53, 5, 1, 21, 209, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3779, 53, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3780, 53, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3781, 53, 5, 1, 21, 212, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3782, 53, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3783, 53, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3784, 53, 5, 1, 21, 215, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3785, 53, 6, 1, 22, 216, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3786, 53, 6, 1, 22, 217, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3787, 53, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3788, 53, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3789, 53, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3790, 53, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3791, 53, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3792, 53, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3793, 53, 6, 1, 22, 224, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3794, 53, 6, 1, 23, 225, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3795, 53, 6, 1, 23, 226, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3796, 53, 6, 1, 23, 227, 1, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3797, 53, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3798, 53, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3799, 53, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3800, 53, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3801, 53, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3802, 53, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3803, 53, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3804, 53, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3805, 53, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3806, 53, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3807, 53, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3808, 53, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3809, 53, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3810, 53, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3811, 53, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3812, 53, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3813, 53, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3814, 53, 7, 1, 26, 245, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3815, 53, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3816, 53, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3817, 53, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3818, 53, 7, 1, 26, 249, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3819, 53, 7, 1, 26, 250, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3820, 53, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3821, 53, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3822, 53, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3823, 53, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3824, 53, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3825, 53, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3826, 53, 7, 1, 26, 257, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3827, 53, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3828, 53, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3829, 53, 7, 1, 26, 260, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3830, 53, 7, 1, 26, 261, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3831, 53, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3832, 53, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3833, 53, 8, 1, 27, 264, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3834, 53, 8, 1, 27, 265, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3835, 53, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3836, 53, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3837, 53, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3838, 53, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3839, 53, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3840, 53, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3841, 53, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3842, 53, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3843, 53, 8, 1, 27, 274, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3844, 54, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3845, 54, 1, 1, 1, 2, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3846, 54, 1, 1, 1, 3, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3847, 54, 1, 2, 2, 4, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3848, 54, 1, 2, 2, 5, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3849, 54, 1, 2, 2, 6, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3850, 54, 1, 2, 2, 7, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3851, 54, 1, 2, 2, 8, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3852, 54, 1, 2, 2, 9, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3853, 54, 1, 2, 3, 10, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3854, 54, 1, 2, 3, 11, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3855, 54, 1, 2, 3, 12, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3856, 54, 1, 2, 3, 13, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3857, 54, 1, 2, 3, 14, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3858, 54, 1, 2, 3, 15, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3859, 54, 1, 2, 3, 16, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3860, 54, 1, 2, 2, 17, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3861, 54, 1, 2, 2, 18, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3862, 54, 1, 2, 2, 19, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3863, 54, 1, 2, 2, 20, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3864, 54, 1, 2, 4, 21, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3865, 54, 1, 2, 4, 22, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3866, 54, 1, 2, 4, 23, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3867, 54, 1, 2, 4, 24, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3868, 54, 1, 2, 4, 25, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3869, 54, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3870, 54, 1, 2, 4, 27, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3871, 54, 1, 2, 5, 28, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3872, 54, 1, 2, 5, 29, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3873, 54, 1, 2, 5, 30, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3874, 54, 1, 2, 5, 31, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3875, 54, 1, 2, 5, 32, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3876, 54, 1, 2, 5, 33, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3877, 54, 1, 2, 5, 34, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3878, 54, 1, 2, 5, 35, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3879, 54, 1, 2, 5, 36, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3880, 54, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3881, 54, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3882, 54, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3883, 54, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3884, 54, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3885, 54, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3886, 54, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3887, 54, 2, 1, 7, 44, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3888, 54, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3889, 54, 2, 1, 7, 46, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3890, 54, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3891, 54, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3892, 54, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3893, 54, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3894, 54, 2, 1, 8, 51, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3895, 54, 2, 1, 8, 52, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3896, 54, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3897, 54, 2, 1, 8, 54, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3898, 54, 2, 2, 9, 55, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3899, 54, 2, 2, 9, 56, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3900, 54, 2, 2, 9, 57, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3901, 54, 2, 2, 9, 58, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3902, 54, 2, 2, 9, 59, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3903, 54, 2, 2, 9, 60, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3904, 54, 2, 2, 9, 61, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3905, 54, 2, 2, 9, 62, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3906, 54, 2, 2, 9, 63, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3907, 54, 2, 2, 9, 64, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3908, 54, 2, 2, 9, 65, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3909, 54, 2, 2, 9, 66, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3910, 54, 2, 2, 9, 67, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3911, 54, 2, 2, 9, 68, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3912, 54, 2, 2, 9, 69, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3913, 54, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3914, 54, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3915, 54, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3916, 54, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3917, 54, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3918, 54, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3919, 54, 3, 1, 10, 76, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3920, 54, 3, 1, 10, 77, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3921, 54, 3, 1, 10, 78, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3922, 54, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3923, 54, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3924, 54, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3925, 54, 3, 1, 11, 82, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3926, 54, 3, 1, 11, 83, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3927, 54, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3928, 54, 3, 1, 11, 85, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3929, 54, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3930, 54, 3, 1, 11, 87, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3931, 54, 3, 1, 11, 88, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3932, 54, 3, 1, 11, 89, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3933, 54, 3, 1, 11, 90, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3934, 54, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3935, 54, 3, 1, 13, 92, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3936, 54, 3, 1, 13, 93, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3937, 54, 3, 1, 13, 94, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3938, 54, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3939, 54, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3940, 54, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3941, 54, 3, 1, 14, 98, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3942, 54, 3, 1, 14, 99, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3943, 54, 3, 1, 14, 100, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3944, 54, 3, 1, 14, 101, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3945, 54, 3, 1, 14, 102, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3946, 54, 3, 1, 14, 103, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3947, 54, 3, 1, 14, 104, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3948, 54, 3, 1, 14, 105, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3949, 54, 3, 1, 15, 106, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3950, 54, 3, 1, 15, 107, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3951, 54, 3, 1, 16, 108, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3952, 54, 3, 1, 16, 109, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3953, 54, 3, 1, 16, 110, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3954, 54, 3, 1, 16, 111, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3955, 54, 3, 1, 16, 112, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3956, 54, 3, 2, 17, 113, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3957, 54, 3, 2, 17, 114, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3958, 54, 3, 2, 17, 115, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3959, 54, 3, 2, 17, 116, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3960, 54, 3, 2, 17, 117, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3961, 54, 3, 2, 17, 118, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3962, 54, 3, 2, 17, 119, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3963, 54, 3, 2, 17, 120, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3964, 54, 3, 2, 17, 121, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3965, 54, 3, 2, 17, 122, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3966, 54, 3, 2, 17, 123, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3967, 54, 3, 2, 17, 124, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3968, 54, 3, 2, 17, 125, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3969, 54, 3, 2, 17, 126, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3970, 54, 3, 2, 17, 127, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3971, 54, 4, 1, 18, 128, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3972, 54, 4, 1, 18, 129, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3973, 54, 4, 1, 18, 130, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3974, 54, 4, 1, 18, 131, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3975, 54, 4, 1, 18, 132, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3976, 54, 4, 1, 18, 133, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3977, 54, 4, 1, 18, 134, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3978, 54, 4, 1, 18, 135, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3979, 54, 4, 1, 18, 136, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3980, 54, 4, 1, 18, 137, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3981, 54, 4, 1, 18, 138, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3982, 54, 4, 1, 18, 139, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3983, 54, 4, 1, 18, 140, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3984, 54, 4, 1, 18, 141, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3985, 54, 4, 1, 18, 142, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3986, 54, 4, 1, 18, 143, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3987, 54, 4, 1, 18, 144, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3988, 54, 4, 1, 18, 145, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3989, 54, 4, 1, 18, 146, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3990, 54, 4, 2, 18, 147, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3991, 54, 4, 2, 18, 148, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3992, 54, 4, 2, 18, 149, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3993, 54, 4, 2, 18, 150, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3994, 54, 4, 2, 18, 151, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3995, 54, 4, 2, 18, 152, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3996, 54, 4, 2, 18, 153, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3997, 54, 4, 2, 18, 154, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3998, 54, 4, 2, 18, 155, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (3999, 54, 4, 2, 18, 156, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4000, 54, 4, 2, 18, 157, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4001, 54, 4, 2, 18, 158, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4002, 54, 4, 2, 18, 159, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4003, 54, 4, 2, 18, 160, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4004, 54, 4, 2, 18, 161, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4005, 54, 4, 2, 18, 162, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4006, 54, 4, 2, 18, 163, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4007, 54, 4, 2, 18, 164, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4008, 54, 4, 2, 18, 165, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4009, 54, 4, 2, 18, 166, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4010, 54, 4, 2, 18, 167, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4011, 54, 4, 2, 18, 168, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4012, 54, 4, 2, 18, 169, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4013, 54, 4, 2, 18, 170, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4014, 54, 4, 2, 18, 171, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4015, 54, 4, 2, 19, 172, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4016, 54, 4, 2, 19, 173, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4017, 54, 4, 2, 19, 174, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4018, 54, 4, 2, 19, 175, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4019, 54, 4, 2, 19, 176, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4020, 54, 4, 2, 19, 177, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4021, 54, 4, 2, 19, 178, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4022, 54, 4, 2, 19, 179, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4023, 54, 4, 2, 19, 180, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4024, 54, 4, 2, 19, 181, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4025, 54, 4, 2, 19, 182, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4026, 54, 4, 2, 19, 183, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4027, 54, 4, 2, 19, 184, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4028, 54, 4, 2, 19, 185, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4029, 54, 4, 2, 19, 186, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4030, 54, 4, 2, 19, 187, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4031, 54, 4, 2, 19, 188, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4032, 54, 4, 2, 19, 189, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4033, 54, 4, 2, 19, 190, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4034, 54, 4, 2, 19, 191, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4035, 54, 4, 2, 19, 192, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4036, 54, 4, 2, 19, 193, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4037, 54, 4, 2, 19, 194, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4038, 54, 4, 2, 19, 195, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4039, 54, 5, 1, 20, 196, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4040, 54, 5, 1, 20, 197, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4041, 54, 5, 1, 20, 198, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4042, 54, 5, 1, 20, 199, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4043, 54, 5, 1, 20, 200, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4044, 54, 5, 1, 20, 201, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4045, 54, 5, 1, 20, 202, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4046, 54, 5, 1, 20, 203, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4047, 54, 5, 1, 20, 204, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4048, 54, 5, 1, 20, 205, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4049, 54, 5, 1, 21, 206, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4050, 54, 5, 1, 21, 207, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4051, 54, 5, 1, 21, 208, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4052, 54, 5, 1, 21, 209, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4053, 54, 5, 1, 21, 210, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4054, 54, 5, 1, 21, 211, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4055, 54, 5, 1, 21, 212, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4056, 54, 5, 1, 21, 213, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4057, 54, 5, 1, 21, 214, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4058, 54, 5, 1, 21, 215, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4059, 54, 6, 1, 22, 216, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4060, 54, 6, 1, 22, 217, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4061, 54, 6, 1, 22, 218, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4062, 54, 6, 1, 22, 219, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4063, 54, 6, 1, 22, 220, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4064, 54, 6, 1, 22, 221, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4065, 54, 6, 1, 22, 222, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4066, 54, 6, 1, 22, 223, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4067, 54, 6, 1, 22, 224, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4068, 54, 6, 1, 23, 225, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4069, 54, 6, 1, 23, 226, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4070, 54, 6, 1, 23, 227, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4071, 54, 6, 1, 24, 228, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4072, 54, 6, 1, 24, 229, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4073, 54, 6, 1, 24, 230, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4074, 54, 6, 1, 24, 231, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4075, 54, 6, 1, 24, 232, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4076, 54, 6, 1, 24, 233, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4077, 54, 6, 1, 25, 234, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4078, 54, 6, 1, 25, 235, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4079, 54, 6, 1, 25, 236, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4080, 54, 6, 1, 25, 237, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4081, 54, 6, 1, 25, 238, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4082, 54, 6, 1, 25, 239, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4083, 54, 6, 1, 25, 240, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4084, 54, 6, 1, 25, 241, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4085, 54, 6, 1, 25, 242, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4086, 54, 6, 1, 25, 243, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4087, 54, 6, 1, 25, 244, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4088, 54, 7, 1, 26, 245, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4089, 54, 7, 1, 26, 246, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4090, 54, 7, 1, 26, 247, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4091, 54, 7, 1, 26, 248, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4092, 54, 7, 1, 26, 249, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4093, 54, 7, 1, 26, 250, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4094, 54, 7, 1, 26, 251, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4095, 54, 7, 1, 26, 252, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4096, 54, 7, 1, 26, 253, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4097, 54, 7, 1, 26, 254, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4098, 54, 7, 1, 26, 255, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4099, 54, 7, 1, 26, 256, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4100, 54, 7, 1, 26, 257, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4101, 54, 7, 1, 26, 258, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4102, 54, 7, 1, 26, 259, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4103, 54, 7, 1, 26, 260, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4104, 54, 7, 1, 26, 261, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4105, 54, 7, 1, 26, 262, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4106, 54, 7, 1, 26, 263, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4107, 54, 8, 1, 27, 264, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4108, 54, 8, 1, 27, 265, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4109, 54, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4110, 54, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4111, 54, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4112, 54, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4113, 54, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4114, 54, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4115, 54, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4116, 54, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4117, 54, 8, 1, 27, 274, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4118, 55, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4119, 55, 1, 1, 1, 2, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4120, 55, 1, 1, 1, 3, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4121, 55, 1, 2, 2, 4, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4122, 55, 1, 2, 2, 5, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4123, 55, 1, 2, 2, 6, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4124, 55, 1, 2, 2, 7, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4125, 55, 1, 2, 2, 8, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4126, 55, 1, 2, 2, 9, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4127, 55, 1, 2, 3, 10, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4128, 55, 1, 2, 3, 11, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4129, 55, 1, 2, 3, 12, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4130, 55, 1, 2, 3, 13, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4131, 55, 1, 2, 3, 14, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4132, 55, 1, 2, 3, 15, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4133, 55, 1, 2, 3, 16, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4134, 55, 1, 2, 2, 17, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4135, 55, 1, 2, 2, 18, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4136, 55, 1, 2, 2, 19, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4137, 55, 1, 2, 2, 20, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4138, 55, 1, 2, 4, 21, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4139, 55, 1, 2, 4, 22, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4140, 55, 1, 2, 4, 23, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4141, 55, 1, 2, 4, 24, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4142, 55, 1, 2, 4, 25, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4143, 55, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4144, 55, 1, 2, 4, 27, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4145, 55, 1, 2, 5, 28, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4146, 55, 1, 2, 5, 29, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4147, 55, 1, 2, 5, 30, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4148, 55, 1, 2, 5, 31, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4149, 55, 1, 2, 5, 32, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4150, 55, 1, 2, 5, 33, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4151, 55, 1, 2, 5, 34, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4152, 55, 1, 2, 5, 35, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4153, 55, 1, 2, 5, 36, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4154, 55, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4155, 55, 1, 2, 6, 38, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4156, 55, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4157, 55, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4158, 55, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4159, 55, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4160, 55, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4161, 55, 2, 1, 7, 44, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4162, 55, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4163, 55, 2, 1, 7, 46, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4164, 55, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4165, 55, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4166, 55, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4167, 55, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4168, 55, 2, 1, 8, 51, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4169, 55, 2, 1, 8, 52, 3, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4170, 55, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4171, 55, 2, 1, 8, 54, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4172, 55, 2, 2, 9, 55, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4173, 55, 2, 2, 9, 56, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4174, 55, 2, 2, 9, 57, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4175, 55, 2, 2, 9, 58, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4176, 55, 2, 2, 9, 59, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4177, 55, 2, 2, 9, 60, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4178, 55, 2, 2, 9, 61, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4179, 55, 2, 2, 9, 62, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4180, 55, 2, 2, 9, 63, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4181, 55, 2, 2, 9, 64, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4182, 55, 2, 2, 9, 65, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4183, 55, 2, 2, 9, 66, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4184, 55, 2, 2, 9, 67, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4185, 55, 2, 2, 9, 68, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4186, 55, 2, 2, 9, 69, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4187, 55, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4188, 55, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4189, 55, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4190, 55, 3, 1, 10, 73, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4191, 55, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4192, 55, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4193, 55, 3, 1, 10, 76, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4194, 55, 3, 1, 10, 77, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4195, 55, 3, 1, 10, 78, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4196, 55, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4197, 55, 3, 1, 10, 80, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4198, 55, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4199, 55, 3, 1, 11, 82, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4200, 55, 3, 1, 11, 83, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4201, 55, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4202, 55, 3, 1, 11, 85, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4203, 55, 3, 1, 11, 86, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4204, 55, 3, 1, 11, 87, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4205, 55, 3, 1, 11, 88, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4206, 55, 3, 1, 11, 89, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4207, 55, 3, 1, 11, 90, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4208, 55, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4209, 55, 3, 1, 13, 92, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4210, 55, 3, 1, 13, 93, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4211, 55, 3, 1, 13, 94, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4212, 55, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4213, 55, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4214, 55, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4215, 55, 3, 1, 14, 98, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4216, 55, 3, 1, 14, 99, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4217, 55, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4218, 55, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4219, 55, 3, 1, 14, 102, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4220, 55, 3, 1, 14, 103, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4221, 55, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4222, 55, 3, 1, 14, 105, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4223, 55, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4224, 55, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4225, 55, 3, 1, 16, 108, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4226, 55, 3, 1, 16, 109, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4227, 55, 3, 1, 16, 110, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4228, 55, 3, 1, 16, 111, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4229, 55, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4230, 55, 3, 2, 17, 113, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4231, 55, 3, 2, 17, 114, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4232, 55, 3, 2, 17, 115, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4233, 55, 3, 2, 17, 116, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4234, 55, 3, 2, 17, 117, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4235, 55, 3, 2, 17, 118, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4236, 55, 3, 2, 17, 119, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4237, 55, 3, 2, 17, 120, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4238, 55, 3, 2, 17, 121, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4239, 55, 3, 2, 17, 122, 3, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4240, 55, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4241, 55, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4242, 55, 3, 2, 17, 125, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4243, 55, 3, 2, 17, 126, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4244, 55, 3, 2, 17, 127, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4245, 55, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4246, 55, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4247, 55, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4248, 55, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4249, 55, 4, 1, 18, 132, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4250, 55, 4, 1, 18, 133, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4251, 55, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4252, 55, 4, 1, 18, 135, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4253, 55, 4, 1, 18, 136, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4254, 55, 4, 1, 18, 137, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4255, 55, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4256, 55, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4257, 55, 4, 1, 18, 140, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4258, 55, 4, 1, 18, 141, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4259, 55, 4, 1, 18, 142, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4260, 55, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4261, 55, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4262, 55, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4263, 55, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4264, 55, 4, 2, 18, 147, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4265, 55, 4, 2, 18, 148, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4266, 55, 4, 2, 18, 149, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4267, 55, 4, 2, 18, 150, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4268, 55, 4, 2, 18, 151, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4269, 55, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4270, 55, 4, 2, 18, 153, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4271, 55, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4272, 55, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4273, 55, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4274, 55, 4, 2, 18, 157, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4275, 55, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4276, 55, 4, 2, 18, 159, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4277, 55, 4, 2, 18, 160, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4278, 55, 4, 2, 18, 161, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4279, 55, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4280, 55, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4281, 55, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4282, 55, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4283, 55, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4284, 55, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4285, 55, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4286, 55, 4, 2, 18, 169, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4287, 55, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4288, 55, 4, 2, 18, 171, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4289, 55, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4290, 55, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4291, 55, 4, 2, 19, 174, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4292, 55, 4, 2, 19, 175, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4293, 55, 4, 2, 19, 176, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4294, 55, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4295, 55, 4, 2, 19, 178, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4296, 55, 4, 2, 19, 179, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4297, 55, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4298, 55, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4299, 55, 4, 2, 19, 182, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4300, 55, 4, 2, 19, 183, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4301, 55, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4302, 55, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4303, 55, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4304, 55, 4, 2, 19, 187, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4305, 55, 4, 2, 19, 188, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4306, 55, 4, 2, 19, 189, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4307, 55, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4308, 55, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4309, 55, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4310, 55, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4311, 55, 4, 2, 19, 194, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4312, 55, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4313, 55, 5, 1, 20, 196, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4314, 55, 5, 1, 20, 197, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4315, 55, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4316, 55, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4317, 55, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4318, 55, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4319, 55, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4320, 55, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4321, 55, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4322, 55, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4323, 55, 5, 1, 21, 206, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4324, 55, 5, 1, 21, 207, 3, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4325, 55, 5, 1, 21, 208, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4326, 55, 5, 1, 21, 209, 3, 4, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4327, 55, 5, 1, 21, 210, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4328, 55, 5, 1, 21, 211, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4329, 55, 5, 1, 21, 212, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4330, 55, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4331, 55, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4332, 55, 5, 1, 21, 215, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4333, 55, 6, 1, 22, 216, 3, 2, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4334, 55, 6, 1, 22, 217, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4335, 55, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4336, 55, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4337, 55, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4338, 55, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4339, 55, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4340, 55, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4341, 55, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4342, 55, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4343, 55, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4344, 55, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4345, 55, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4346, 55, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4347, 55, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4348, 55, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4349, 55, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4350, 55, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4351, 55, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4352, 55, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4353, 55, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4354, 55, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4355, 55, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4356, 55, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4357, 55, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4358, 55, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4359, 55, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4360, 55, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4361, 55, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4362, 55, 7, 1, 26, 245, 3, NULL, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4363, 55, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4364, 55, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4365, 55, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4366, 55, 7, 1, 26, 249, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4367, 55, 7, 1, 26, 250, 3, 1, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4368, 55, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4369, 55, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4370, 55, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4371, 55, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4372, 55, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4373, 55, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4374, 55, 7, 1, 26, 257, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4375, 55, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4376, 55, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4377, 55, 7, 1, 26, 260, 3, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4378, 55, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4379, 55, 7, 1, 26, 262, 3, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4380, 55, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4381, 55, 8, 1, 27, 264, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4382, 55, 8, 1, 27, 265, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4383, 55, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4384, 55, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4385, 55, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4386, 55, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4387, 55, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4388, 55, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4389, 55, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4390, 55, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4391, 55, 8, 1, 27, 274, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4392, 56, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4393, 56, 1, 1, 1, 2, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4394, 56, 1, 1, 1, 3, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4395, 56, 1, 2, 2, 4, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4396, 56, 1, 2, 2, 5, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4397, 56, 1, 2, 2, 6, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4398, 56, 1, 2, 2, 7, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4399, 56, 1, 2, 2, 8, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4400, 56, 1, 2, 2, 9, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4401, 56, 1, 2, 3, 10, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4402, 56, 1, 2, 3, 11, 1, 5, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4403, 56, 1, 2, 3, 12, 1, 5, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4404, 56, 1, 2, 3, 13, 1, 3, 2, 1, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4405, 56, 1, 2, 3, 14, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4406, 56, 1, 2, 3, 15, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4407, 56, 1, 2, 3, 16, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4408, 56, 1, 2, 2, 17, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4409, 56, 1, 2, 2, 18, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4410, 56, 1, 2, 2, 19, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4411, 56, 1, 2, 2, 20, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4412, 56, 1, 2, 4, 21, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4413, 56, 1, 2, 4, 22, 1, 5, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4414, 56, 1, 2, 4, 23, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4415, 56, 1, 2, 4, 24, 2, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4416, 56, 1, 2, 4, 25, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4417, 56, 1, 2, 4, 26, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4418, 56, 1, 2, 4, 27, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4419, 56, 1, 2, 5, 28, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4420, 56, 1, 2, 5, 29, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4421, 56, 1, 2, 5, 30, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4422, 56, 1, 2, 5, 31, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4423, 56, 1, 2, 5, 32, 3, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4424, 56, 1, 2, 5, 33, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4425, 56, 1, 2, 5, 34, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4426, 56, 1, 2, 5, 35, 1, 2, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4427, 56, 1, 2, 5, 36, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4428, 56, 1, 2, 6, 37, 1, 5, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4429, 56, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4430, 56, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4431, 56, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4432, 56, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4433, 56, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4434, 56, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4435, 56, 2, 1, 7, 44, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4436, 56, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4437, 56, 2, 1, 7, 46, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4438, 56, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4439, 56, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4440, 56, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4441, 56, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4442, 56, 2, 1, 8, 51, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4443, 56, 2, 1, 8, 52, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4444, 56, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4445, 56, 2, 1, 8, 54, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4446, 56, 2, 2, 9, 55, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4447, 56, 2, 2, 9, 56, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4448, 56, 2, 2, 9, 57, 1, 5, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4449, 56, 2, 2, 9, 58, 1, 5, 1, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4450, 56, 2, 2, 9, 59, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4451, 56, 2, 2, 9, 60, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4452, 56, 2, 2, 9, 61, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4453, 56, 2, 2, 9, 62, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4454, 56, 2, 2, 9, 63, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4455, 56, 2, 2, 9, 64, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4456, 56, 2, 2, 9, 65, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4457, 56, 2, 2, 9, 66, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4458, 56, 2, 2, 9, 67, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4459, 56, 2, 2, 9, 68, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4460, 56, 2, 2, 9, 69, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4461, 56, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4462, 56, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4463, 56, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4464, 56, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4465, 56, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4466, 56, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4467, 56, 3, 1, 10, 76, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4468, 56, 3, 1, 10, 77, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4469, 56, 3, 1, 10, 78, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4470, 56, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4471, 56, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4472, 56, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4473, 56, 3, 1, 11, 82, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4474, 56, 3, 1, 11, 83, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4475, 56, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4476, 56, 3, 1, 11, 85, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4477, 56, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4478, 56, 3, 1, 11, 87, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4479, 56, 3, 1, 11, 88, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4480, 56, 3, 1, 11, 89, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4481, 56, 3, 1, 11, 90, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4482, 56, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4483, 56, 3, 1, 13, 92, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4484, 56, 3, 1, 13, 93, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4485, 56, 3, 1, 13, 94, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4486, 56, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4487, 56, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4488, 56, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4489, 56, 3, 1, 14, 98, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4490, 56, 3, 1, 14, 99, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4491, 56, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4492, 56, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4493, 56, 3, 1, 14, 102, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4494, 56, 3, 1, 14, 103, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4495, 56, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4496, 56, 3, 1, 14, 105, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4497, 56, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4498, 56, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4499, 56, 3, 1, 16, 108, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4500, 56, 3, 1, 16, 109, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4501, 56, 3, 1, 16, 110, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4502, 56, 3, 1, 16, 111, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4503, 56, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4504, 56, 3, 2, 17, 113, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4505, 56, 3, 2, 17, 114, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4506, 56, 3, 2, 17, 115, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4507, 56, 3, 2, 17, 116, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4508, 56, 3, 2, 17, 117, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4509, 56, 3, 2, 17, 118, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4510, 56, 3, 2, 17, 119, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4511, 56, 3, 2, 17, 120, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4512, 56, 3, 2, 17, 121, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4513, 56, 3, 2, 17, 122, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4514, 56, 3, 2, 17, 123, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4515, 56, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4516, 56, 3, 2, 17, 125, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4517, 56, 3, 2, 17, 126, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4518, 56, 3, 2, 17, 127, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4519, 56, 4, 1, 18, 128, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4520, 56, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4521, 56, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4522, 56, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4523, 56, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4524, 56, 4, 1, 18, 133, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4525, 56, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4526, 56, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4527, 56, 4, 1, 18, 136, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4528, 56, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4529, 56, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4530, 56, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4531, 56, 4, 1, 18, 140, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4532, 56, 4, 1, 18, 141, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4533, 56, 4, 1, 18, 142, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4534, 56, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4535, 56, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4536, 56, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4537, 56, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4538, 56, 4, 2, 18, 147, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4539, 56, 4, 2, 18, 148, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4540, 56, 4, 2, 18, 149, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4541, 56, 4, 2, 18, 150, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4542, 56, 4, 2, 18, 151, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4543, 56, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4544, 56, 4, 2, 18, 153, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4545, 56, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4546, 56, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4547, 56, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4548, 56, 4, 2, 18, 157, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4549, 56, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4550, 56, 4, 2, 18, 159, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4551, 56, 4, 2, 18, 160, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4552, 56, 4, 2, 18, 161, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4553, 56, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4554, 56, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4555, 56, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4556, 56, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4557, 56, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4558, 56, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4559, 56, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4560, 56, 4, 2, 18, 169, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4561, 56, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4562, 56, 4, 2, 18, 171, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4563, 56, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4564, 56, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4565, 56, 4, 2, 19, 174, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4566, 56, 4, 2, 19, 175, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4567, 56, 4, 2, 19, 176, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4568, 56, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4569, 56, 4, 2, 19, 178, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4570, 56, 4, 2, 19, 179, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4571, 56, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4572, 56, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4573, 56, 4, 2, 19, 182, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4574, 56, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4575, 56, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4576, 56, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4577, 56, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4578, 56, 4, 2, 19, 187, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4579, 56, 4, 2, 19, 188, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4580, 56, 4, 2, 19, 189, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4581, 56, 4, 2, 19, 190, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4582, 56, 4, 2, 19, 191, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4583, 56, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4584, 56, 4, 2, 19, 193, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4585, 56, 4, 2, 19, 194, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4586, 56, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4587, 56, 5, 1, 20, 196, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4588, 56, 5, 1, 20, 197, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4589, 56, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4590, 56, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4591, 56, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4592, 56, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4593, 56, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4594, 56, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4595, 56, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4596, 56, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4597, 56, 5, 1, 21, 206, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4598, 56, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4599, 56, 5, 1, 21, 208, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4600, 56, 5, 1, 21, 209, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4601, 56, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4602, 56, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4603, 56, 5, 1, 21, 212, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4604, 56, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4605, 56, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4606, 56, 5, 1, 21, 215, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4607, 56, 6, 1, 22, 216, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4608, 56, 6, 1, 22, 217, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4609, 56, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4610, 56, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4611, 56, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4612, 56, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4613, 56, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4614, 56, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4615, 56, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4616, 56, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4617, 56, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4618, 56, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4619, 56, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4620, 56, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4621, 56, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4622, 56, 6, 1, 24, 231, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4623, 56, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4624, 56, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4625, 56, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4626, 56, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4627, 56, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4628, 56, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4629, 56, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4630, 56, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4631, 56, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4632, 56, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4633, 56, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4634, 56, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4635, 56, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4636, 56, 7, 1, 26, 245, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4637, 56, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4638, 56, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4639, 56, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4640, 56, 7, 1, 26, 249, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4641, 56, 7, 1, 26, 250, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4642, 56, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4643, 56, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4644, 56, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4645, 56, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4646, 56, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4647, 56, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4648, 56, 7, 1, 26, 257, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4649, 56, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4650, 56, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4651, 56, 7, 1, 26, 260, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4652, 56, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4653, 56, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4654, 56, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4655, 56, 8, 1, 27, 264, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4656, 56, 8, 1, 27, 265, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4657, 56, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4658, 56, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4659, 56, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4660, 56, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4661, 56, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4662, 56, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4663, 56, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4664, 56, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4665, 56, 8, 1, 27, 274, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4666, 57, 1, 1, 1, 1, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4667, 57, 1, 1, 1, 2, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4668, 57, 1, 1, 1, 3, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4669, 57, 1, 2, 2, 4, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4670, 57, 1, 2, 2, 5, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4671, 57, 1, 2, 2, 6, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4672, 57, 1, 2, 2, 7, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4673, 57, 1, 2, 2, 8, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4674, 57, 1, 2, 2, 9, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4675, 57, 1, 2, 3, 10, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4676, 57, 1, 2, 3, 11, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4677, 57, 1, 2, 3, 12, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4678, 57, 1, 2, 3, 13, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4679, 57, 1, 2, 3, 14, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4680, 57, 1, 2, 3, 15, 2, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4681, 57, 1, 2, 3, 16, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4682, 57, 1, 2, 2, 17, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4683, 57, 1, 2, 2, 18, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4684, 57, 1, 2, 2, 19, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4685, 57, 1, 2, 2, 20, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4686, 57, 1, 2, 4, 21, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4687, 57, 1, 2, 4, 22, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4688, 57, 1, 2, 4, 23, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4689, 57, 1, 2, 4, 24, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4690, 57, 1, 2, 4, 25, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4691, 57, 1, 2, 4, 26, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4692, 57, 1, 2, 4, 27, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4693, 57, 1, 2, 5, 28, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4694, 57, 1, 2, 5, 29, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4695, 57, 1, 2, 5, 30, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4696, 57, 1, 2, 5, 31, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4697, 57, 1, 2, 5, 32, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4698, 57, 1, 2, 5, 33, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4699, 57, 1, 2, 5, 34, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4700, 57, 1, 2, 5, 35, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4701, 57, 1, 2, 5, 36, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4702, 57, 1, 2, 6, 37, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4703, 57, 1, 2, 6, 38, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4704, 57, 1, 2, 6, 39, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4705, 57, 1, 2, 6, 40, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4706, 57, 2, 1, 7, 41, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4707, 57, 2, 1, 7, 42, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4708, 57, 2, 1, 7, 43, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4709, 57, 2, 1, 7, 44, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4710, 57, 2, 1, 7, 45, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4711, 57, 2, 1, 7, 46, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4712, 57, 2, 1, 7, 47, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4713, 57, 2, 1, 7, 48, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4714, 57, 2, 1, 7, 49, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4715, 57, 2, 1, 7, 50, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4716, 57, 2, 1, 8, 51, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4717, 57, 2, 1, 8, 52, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4718, 57, 2, 1, 8, 53, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4719, 57, 2, 1, 8, 54, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4720, 57, 2, 2, 9, 55, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4721, 57, 2, 2, 9, 56, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4722, 57, 2, 2, 9, 57, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4723, 57, 2, 2, 9, 58, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4724, 57, 2, 2, 9, 59, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4725, 57, 2, 2, 9, 60, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4726, 57, 2, 2, 9, 61, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4727, 57, 2, 2, 9, 62, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4728, 57, 2, 2, 9, 63, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4729, 57, 2, 2, 9, 64, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4730, 57, 2, 2, 9, 65, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4731, 57, 2, 2, 9, 66, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4732, 57, 2, 2, 9, 67, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4733, 57, 2, 2, 9, 68, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4734, 57, 2, 2, 9, 69, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4735, 57, 3, 1, 10, 70, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4736, 57, 3, 1, 10, 71, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4737, 57, 3, 1, 10, 72, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4738, 57, 3, 1, 10, 73, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4739, 57, 3, 1, 10, 74, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4740, 57, 3, 1, 10, 75, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4741, 57, 3, 1, 10, 76, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4742, 57, 3, 1, 10, 77, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4743, 57, 3, 1, 10, 78, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4744, 57, 3, 1, 10, 79, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4745, 57, 3, 1, 10, 80, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4746, 57, 3, 1, 10, 81, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4747, 57, 3, 1, 11, 82, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4748, 57, 3, 1, 11, 83, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4749, 57, 3, 1, 11, 84, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4750, 57, 3, 1, 11, 85, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4751, 57, 3, 1, 11, 86, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4752, 57, 3, 1, 11, 87, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4753, 57, 3, 1, 11, 88, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4754, 57, 3, 1, 11, 89, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4755, 57, 3, 1, 11, 90, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4756, 57, 3, 1, 12, 91, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4757, 57, 3, 1, 13, 92, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4758, 57, 3, 1, 13, 93, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4759, 57, 3, 1, 13, 94, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4760, 57, 3, 1, 13, 95, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4761, 57, 3, 1, 13, 96, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4762, 57, 3, 1, 13, 97, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4763, 57, 3, 1, 14, 98, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4764, 57, 3, 1, 14, 99, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4765, 57, 3, 1, 14, 100, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4766, 57, 3, 1, 14, 101, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4767, 57, 3, 1, 14, 102, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4768, 57, 3, 1, 14, 103, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4769, 57, 3, 1, 14, 104, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4770, 57, 3, 1, 14, 105, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4771, 57, 3, 1, 15, 106, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4772, 57, 3, 1, 15, 107, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4773, 57, 3, 1, 16, 108, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4774, 57, 3, 1, 16, 109, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4775, 57, 3, 1, 16, 110, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4776, 57, 3, 1, 16, 111, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4777, 57, 3, 1, 16, 112, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4778, 57, 3, 2, 17, 113, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4779, 57, 3, 2, 17, 114, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4780, 57, 3, 2, 17, 115, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4781, 57, 3, 2, 17, 116, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4782, 57, 3, 2, 17, 117, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4783, 57, 3, 2, 17, 118, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4784, 57, 3, 2, 17, 119, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4785, 57, 3, 2, 17, 120, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4786, 57, 3, 2, 17, 121, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4787, 57, 3, 2, 17, 122, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4788, 57, 3, 2, 17, 123, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4789, 57, 3, 2, 17, 124, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4790, 57, 3, 2, 17, 125, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4791, 57, 3, 2, 17, 126, 1, 3, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4792, 57, 3, 2, 17, 127, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4793, 57, 4, 1, 18, 128, 1, 4, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4794, 57, 4, 1, 18, 129, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4795, 57, 4, 1, 18, 130, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4796, 57, 4, 1, 18, 131, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4797, 57, 4, 1, 18, 132, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4798, 57, 4, 1, 18, 133, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4799, 57, 4, 1, 18, 134, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4800, 57, 4, 1, 18, 135, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4801, 57, 4, 1, 18, 136, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4802, 57, 4, 1, 18, 137, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4803, 57, 4, 1, 18, 138, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4804, 57, 4, 1, 18, 139, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4805, 57, 4, 1, 18, 140, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4806, 57, 4, 1, 18, 141, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4807, 57, 4, 1, 18, 142, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4808, 57, 4, 1, 18, 143, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4809, 57, 4, 1, 18, 144, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4810, 57, 4, 1, 18, 145, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4811, 57, 4, 1, 18, 146, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4812, 57, 4, 2, 18, 147, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4813, 57, 4, 2, 18, 148, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4814, 57, 4, 2, 18, 149, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4815, 57, 4, 2, 18, 150, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4816, 57, 4, 2, 18, 151, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4817, 57, 4, 2, 18, 152, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4818, 57, 4, 2, 18, 153, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4819, 57, 4, 2, 18, 154, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4820, 57, 4, 2, 18, 155, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4821, 57, 4, 2, 18, 156, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4822, 57, 4, 2, 18, 157, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4823, 57, 4, 2, 18, 158, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4824, 57, 4, 2, 18, 159, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4825, 57, 4, 2, 18, 160, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4826, 57, 4, 2, 18, 161, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4827, 57, 4, 2, 18, 162, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4828, 57, 4, 2, 18, 163, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4829, 57, 4, 2, 18, 164, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4830, 57, 4, 2, 18, 165, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4831, 57, 4, 2, 18, 166, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4832, 57, 4, 2, 18, 167, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4833, 57, 4, 2, 18, 168, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4834, 57, 4, 2, 18, 169, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4835, 57, 4, 2, 18, 170, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4836, 57, 4, 2, 18, 171, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4837, 57, 4, 2, 19, 172, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4838, 57, 4, 2, 19, 173, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4839, 57, 4, 2, 19, 174, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4840, 57, 4, 2, 19, 175, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4841, 57, 4, 2, 19, 176, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4842, 57, 4, 2, 19, 177, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4843, 57, 4, 2, 19, 178, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4844, 57, 4, 2, 19, 179, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4845, 57, 4, 2, 19, 180, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4846, 57, 4, 2, 19, 181, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4847, 57, 4, 2, 19, 182, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4848, 57, 4, 2, 19, 183, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4849, 57, 4, 2, 19, 184, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4850, 57, 4, 2, 19, 185, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4851, 57, 4, 2, 19, 186, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4852, 57, 4, 2, 19, 187, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4853, 57, 4, 2, 19, 188, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4854, 57, 4, 2, 19, 189, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4855, 57, 4, 2, 19, 190, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4856, 57, 4, 2, 19, 191, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4857, 57, 4, 2, 19, 192, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4858, 57, 4, 2, 19, 193, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4859, 57, 4, 2, 19, 194, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4860, 57, 4, 2, 19, 195, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4861, 57, 5, 1, 20, 196, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4862, 57, 5, 1, 20, 197, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4863, 57, 5, 1, 20, 198, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4864, 57, 5, 1, 20, 199, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4865, 57, 5, 1, 20, 200, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4866, 57, 5, 1, 20, 201, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4867, 57, 5, 1, 20, 202, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4868, 57, 5, 1, 20, 203, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4869, 57, 5, 1, 20, 204, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4870, 57, 5, 1, 20, 205, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4871, 57, 5, 1, 21, 206, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4872, 57, 5, 1, 21, 207, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4873, 57, 5, 1, 21, 208, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4874, 57, 5, 1, 21, 209, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4875, 57, 5, 1, 21, 210, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4876, 57, 5, 1, 21, 211, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4877, 57, 5, 1, 21, 212, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4878, 57, 5, 1, 21, 213, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4879, 57, 5, 1, 21, 214, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4880, 57, 5, 1, 21, 215, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4881, 57, 6, 1, 22, 216, 1, 2, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4882, 57, 6, 1, 22, 217, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4883, 57, 6, 1, 22, 218, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4884, 57, 6, 1, 22, 219, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4885, 57, 6, 1, 22, 220, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4886, 57, 6, 1, 22, 221, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4887, 57, 6, 1, 22, 222, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4888, 57, 6, 1, 22, 223, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4889, 57, 6, 1, 22, 224, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4890, 57, 6, 1, 23, 225, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4891, 57, 6, 1, 23, 226, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4892, 57, 6, 1, 23, 227, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4893, 57, 6, 1, 24, 228, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4894, 57, 6, 1, 24, 229, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4895, 57, 6, 1, 24, 230, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4896, 57, 6, 1, 24, 231, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4897, 57, 6, 1, 24, 232, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4898, 57, 6, 1, 24, 233, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4899, 57, 6, 1, 25, 234, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4900, 57, 6, 1, 25, 235, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4901, 57, 6, 1, 25, 236, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4902, 57, 6, 1, 25, 237, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4903, 57, 6, 1, 25, 238, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4904, 57, 6, 1, 25, 239, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4905, 57, 6, 1, 25, 240, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4906, 57, 6, 1, 25, 241, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4907, 57, 6, 1, 25, 242, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4908, 57, 6, 1, 25, 243, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4909, 57, 6, 1, 25, 244, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4910, 57, 7, 1, 26, 245, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4911, 57, 7, 1, 26, 246, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4912, 57, 7, 1, 26, 247, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4913, 57, 7, 1, 26, 248, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4914, 57, 7, 1, 26, 249, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4915, 57, 7, 1, 26, 250, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4916, 57, 7, 1, 26, 251, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4917, 57, 7, 1, 26, 252, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4918, 57, 7, 1, 26, 253, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4919, 57, 7, 1, 26, 254, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4920, 57, 7, 1, 26, 255, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4921, 57, 7, 1, 26, 256, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4922, 57, 7, 1, 26, 257, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4923, 57, 7, 1, 26, 258, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4924, 57, 7, 1, 26, 259, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4925, 57, 7, 1, 26, 260, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4926, 57, 7, 1, 26, 261, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4927, 57, 7, 1, 26, 262, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4928, 57, 7, 1, 26, 263, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4929, 57, 8, 1, 27, 264, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4930, 57, 8, 1, 27, 265, 2, 1, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4931, 57, 8, 1, 27, 266, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4932, 57, 8, 1, 27, 267, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4933, 57, 8, 1, 27, 268, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4934, 57, 8, 1, 27, 269, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4935, 57, 8, 1, 27, 270, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4936, 57, 8, 1, 27, 271, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4937, 57, 8, 1, 27, 272, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4938, 57, 8, 1, 27, 273, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (4939, 57, 8, 1, 27, 274, 3, NULL, 2, 2, 1);
INSERT INTO analytics_emp_skill_reference (id, emp_id, core_competency_id, tool_capability_id, category_id, skill_id, experience_id, level_id, certification_id, learning_interest_id, community_id) VALUES (1926, 47, 1, 1, 1, 1, 3, NULL, 2, 2, 1);


--
-- TOC entry 2268 (class 0 OID 326500)
-- Dependencies: 186
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category (id, name) VALUES (1, 'Project Management Suites');
INSERT INTO category (id, name) VALUES (2, 'Project Management');
INSERT INTO category (id, name) VALUES (3, 'Core Consulting, Finance, Leadership');
INSERT INTO category (id, name) VALUES (4, 'Functional Experience');
INSERT INTO category (id, name) VALUES (5, 'Industry Vertical Experience');
INSERT INTO category (id, name) VALUES (6, 'Education');
INSERT INTO category (id, name) VALUES (7, 'Data Visualization tools');
INSERT INTO category (id, name) VALUES (8, 'OLAP & Operational Reporting, Dashboarding tools');
INSERT INTO category (id, name) VALUES (9, 'Data Visualization');
INSERT INTO category (id, name) VALUES (10, 'Data Integration tools');
INSERT INTO category (id, name) VALUES (11, 'Data Warehousing platforms');
INSERT INTO category (id, name) VALUES (12, 'Data Modeling tools');
INSERT INTO category (id, name) VALUES (13, 'NoSQL tools');
INSERT INTO category (id, name) VALUES (14, 'Big Data tools');
INSERT INTO category (id, name) VALUES (15, 'IoT tools');
INSERT INTO category (id, name) VALUES (16, 'OLTP Databases');
INSERT INTO category (id, name) VALUES (17, 'Data Integration');
INSERT INTO category (id, name) VALUES (18, 'Advanced Analytics');
INSERT INTO category (id, name) VALUES (19, 'Statistics');
INSERT INTO category (id, name) VALUES (20, 'Cloud Infrastructure');
INSERT INTO category (id, name) VALUES (21, 'Database Admin, Server Admin');
INSERT INTO category (id, name) VALUES (22, 'Web Analytics');
INSERT INTO category (id, name) VALUES (23, 'Real-time Stats');
INSERT INTO category (id, name) VALUES (24, 'Advanced Customer Analytics');
INSERT INTO category (id, name) VALUES (25, 'Data Management Platforms');
INSERT INTO category (id, name) VALUES (26, 'Programming Languages');
INSERT INTO category (id, name) VALUES (27, 'Adobe Creative Cloud');
INSERT INTO category (id, name) VALUES (28, 'General (PROGRAM MANAGEMENT)');
INSERT INTO category (id, name) VALUES (29, 'Execution Experience');
INSERT INTO category (id, name) VALUES (30, 'Certifications (PROGRAM MANAGEMENT)');
INSERT INTO category (id, name) VALUES (31, 'General Tools');
INSERT INTO category (id, name) VALUES (32, 'Certification (PRODUCT MANAGEMENT)');
INSERT INTO category (id, name) VALUES (33, 'General / UX Design');
INSERT INTO category (id, name) VALUES (34, 'Strategy & Execution');
INSERT INTO category (id, name) VALUES (35, 'MarTech');
INSERT INTO category (id, name) VALUES (36, 'e-Commerce');
INSERT INTO category (id, name) VALUES (37, 'CRM');
INSERT INTO category (id, name) VALUES (38, 'ERP');
INSERT INTO category (id, name) VALUES (39, 'Cloud');
INSERT INTO category (id, name) VALUES (40, 'Mobile');
INSERT INTO category (id, name) VALUES (41, 'General (DIGITAL ENABLEMENT)');


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 185
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_seq', 2, true);


--
-- TOC entry 2276 (class 0 OID 326524)
-- Dependencies: 194
-- Data for Name: certification; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO certification (id, value) VALUES (1, 'Yes');
INSERT INTO certification (id, value) VALUES (2, 'No');


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 193
-- Name: certification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('certification_id_seq', 1, false);


--
-- TOC entry 2286 (class 0 OID 334854)
-- Dependencies: 204
-- Data for Name: community; Type: TABLE DATA; Schema: public; Owner: ahaneef
--

INSERT INTO community (id, name) VALUES (1, 'Analytics');
INSERT INTO community (id, name) VALUES (2, 'Transformation');


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 203
-- Name: community_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ahaneef
--

SELECT pg_catalog.setval('community_id_seq', 1, false);


--
-- TOC entry 2266 (class 0 OID 326488)
-- Dependencies: 184
-- Data for Name: core_competency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO core_competency (id, name) VALUES (2, 'DATA VISUALIZATION');
INSERT INTO core_competency (id, name) VALUES (3, 'DATA INTEGRATION');
INSERT INTO core_competency (id, name) VALUES (4, 'ADVANCED ANALYTICS');
INSERT INTO core_competency (id, name) VALUES (5, 'SOLUTION ARCHITECTURE, INFRASTRUCTURE, AND SECURITY');
INSERT INTO core_competency (id, name) VALUES (6, 'DIGITAL MARKETING & WEB ANALYTICS');
INSERT INTO core_competency (id, name) VALUES (7, 'PROGRAMMING');
INSERT INTO core_competency (id, name) VALUES (8, 'ADOBE CREATIVE CLOUD');
INSERT INTO core_competency (id, name) VALUES (1, 'CORE CONSULTING');
INSERT INTO core_competency (id, name) VALUES (9, 'PROGRAM MANAGEMENT');
INSERT INTO core_competency (id, name) VALUES (11, 'DIGITAL ENABLEMENT');
INSERT INTO core_competency (id, name) VALUES (12, 'DIGITAL ENGAGEMENT & OPERATIONS');
INSERT INTO core_competency (id, name) VALUES (10, 'PRODUCT MANAGEMENT');


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 183
-- Name: core_competency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_competency_id_seq', 8, true);


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 197
-- Name: emp_skill_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('emp_skill_reference_id_seq', 4939, true);


--
-- TOC entry 2264 (class 0 OID 326482)
-- Dependencies: 182
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO employees (id, name) VALUES (47, 'Allan Yeung');
INSERT INTO employees (id, name) VALUES (48, 'Bloomiya Kurian');
INSERT INTO employees (id, name) VALUES (49, 'Brandon Germer');
INSERT INTO employees (id, name) VALUES (50, 'Brian Wong');
INSERT INTO employees (id, name) VALUES (51, 'Jay Williams');
INSERT INTO employees (id, name) VALUES (52, 'Kory Mills');
INSERT INTO employees (id, name) VALUES (53, 'Mark Stringham');
INSERT INTO employees (id, name) VALUES (54, 'Peter Chen');
INSERT INTO employees (id, name) VALUES (55, 'Spencer McGhin');
INSERT INTO employees (id, name) VALUES (56, 'Steven Silverman');
INSERT INTO employees (id, name) VALUES (57, 'Trinh Le');


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 181
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employees_id_seq', 60, true);


--
-- TOC entry 2272 (class 0 OID 326512)
-- Dependencies: 190
-- Data for Name: experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO experience (id, name) VALUES (2, 'General Education');
INSERT INTO experience (id, name) VALUES (3, 'N/A');
INSERT INTO experience (id, name) VALUES (1, 'Project Experience');


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 189
-- Name: experience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('experience_id_seq', 1, false);


--
-- TOC entry 2284 (class 0 OID 334832)
-- Dependencies: 202
-- Data for Name: human_element_survey; Type: TABLE DATA; Schema: public; Owner: ahaneef
--

INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (65, 47, 'My Personality', 'Climber', '0.27');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (66, 47, 'My Personality', 'Dreamer', '0.43');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (67, 47, 'My Personality', 'Purist', '0.3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (68, 47, 'My Satisfaction', 'Self', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (69, 47, 'My Satisfaction', 'Project', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (70, 47, 'My Satisfaction', 'Client', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (71, 47, 'My Satisfaction', 'Community', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (72, 47, 'My Satisfaction', 'Revel', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (73, 47, 'My Satisfaction', 'Career', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (74, 47, 'My Goals', 'My Goals', 'Success is exceeding my manager and client expectations while working on a project topic which aligns my interests with the market needs.  While maintaining a balance between family, health, and career development');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (75, 47, 'My Wins', 'My Wins', 'Revel Career: Delivering project under high pressure to client, and they were thrilled to renew me each time.  Development: Expanding my horizons using the EdEx funds.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (76, 47, 'My Losses', 'My Losses', 'One loss is not having pursued a product management role.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (77, 47, 'My Personal Brand', 'My Personal Brand', 'Customer focused, quick to learn, ideal mix of technical and business.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (78, 47, 'My Habits', 'Chameleon to Peacock', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (79, 47, 'My Habits', 'Gatherer to Hunter', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (80, 47, 'My Habits', 'Ambiguity to Structure', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (81, 47, 'My Habits', 'Introvert to Extrovert', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (82, 47, 'My Habits', 'Morning Lark to Night Owl', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (83, 47, 'My Habits', 'Evolution to Revolution', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (84, 47, 'My Habits', 'Script to Improv', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (85, 47, 'My Habits', 'Think to Do', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (86, 47, 'My Habits', 'Build to Improve', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (87, 47, 'My Motivations', 'Advancement', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (88, 47, 'My Motivations', 'Autonomy', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (89, 47, 'My Motivations', 'Work/Life Balance', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (90, 47, 'My Motivations', 'Influencing', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (91, 47, 'My Motivations', 'Mastery', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (92, 47, 'My Motivations', 'Money', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (93, 47, 'My Motivations', 'Praise', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (94, 47, 'My Motivations', 'Problem', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (95, 47, 'My Motivations', 'Purpose', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (96, 47, 'My Motivations', 'Relationships', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (97, 48, 'My Personality', 'Climber', '0.44');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (98, 48, 'My Personality', 'Dreamer', '0.21');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (99, 48, 'My Personality', 'Purist', '0.35');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (100, 48, 'My Satisfaction', 'Self', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (101, 48, 'My Satisfaction', 'Project', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (102, 48, 'My Satisfaction', 'Client', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (103, 48, 'My Satisfaction', 'Community', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (104, 48, 'My Satisfaction', 'Revel', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (105, 48, 'My Satisfaction', 'Career', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (106, 48, 'My Goals', 'My Goals', 'To become strategy and/or decision maker for the data capabilities of an organization and to be the to-go person whenever data holds the key to solving a problem, howsoever complex/unreal/challenging it may be');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (107, 48, 'My Wins', 'My Wins', 'To be able to successfully lead a data related project from beginning to the end');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (108, 48, 'My Losses', 'My Losses', 'Client interactions and requirements gathering when I had limited exposure/ background in the client''s business');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (109, 48, 'My Personal Brand', 'My Personal Brand', 'My diverse project experiences background (Computer Science, Software Development, Systems Analysis, Business Analysis, Business Architecture, BI Reporting, Project Management, Product Management) and a commitment to master new skills');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (110, 48, 'My Habits', 'Chameleon to Peacock', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (111, 48, 'My Habits', 'Gatherer to Hunter', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (112, 48, 'My Habits', 'Ambiguity to Structure', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (113, 48, 'My Habits', 'Introvert to Extrovert', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (114, 48, 'My Habits', 'Morning Lark to Night Owl', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (115, 48, 'My Habits', 'Evolution to Revolution', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (116, 48, 'My Habits', 'Script to Improv', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (117, 48, 'My Habits', 'Think to Do', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (118, 48, 'My Habits', 'Build to Improve', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (119, 48, 'My Motivations', 'Advancement', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (120, 48, 'My Motivations', 'Autonomy', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (121, 48, 'My Motivations', 'Work/Life Balance', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (122, 48, 'My Motivations', 'Influencing', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (123, 48, 'My Motivations', 'Mastery', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (124, 48, 'My Motivations', 'Money', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (125, 48, 'My Motivations', 'Praise', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (126, 48, 'My Motivations', 'Problem', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (127, 48, 'My Motivations', 'Purpose', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (128, 48, 'My Motivations', 'Relationships', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (129, 49, 'My Personality', 'Climber', '0.4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (130, 49, 'My Personality', 'Dreamer', '0.38');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (131, 49, 'My Personality', 'Purist', '0.21');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (132, 49, 'My Satisfaction', 'Self', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (133, 49, 'My Satisfaction', 'Project', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (134, 49, 'My Satisfaction', 'Client', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (135, 49, 'My Satisfaction', 'Community', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (136, 49, 'My Satisfaction', 'Revel', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (137, 49, 'My Satisfaction', 'Career', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (138, 49, 'My Goals', 'My Goals', 'My long-term vision of success is to build the Revel Analytics Community into a brand that is talked about when we''re not in the room amongst the CMOs and CIOs of the Greater Seattle Area. I want to build our practice into a community of the highest performing, most fun data integrators, visualizers, and data scientists, all coming together to discover new insights, tell amazing stories, and inspire and lead our clients through their digital business transformations.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (139, 49, 'My Wins', 'My Wins', 'The best is yet to come.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (140, 49, 'My Losses', 'My Losses', 'I almost died climbing Denali, and I saw people pass away around me. It still haunts me. I didn''t make the summit by about 1000ft, and to this day I still dream about it at least every few weeks. Denali taught me that I have limits, and that I am mortal. Failure teaches us more than success, if we let it.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (141, 49, 'My Personal Brand', 'My Personal Brand', '"Be formless, shapeless, like water."');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (142, 49, 'My Habits', 'Chameleon to Peacock', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (143, 49, 'My Habits', 'Gatherer to Hunter', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (144, 49, 'My Habits', 'Ambiguity to Structure', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (145, 49, 'My Habits', 'Introvert to Extrovert', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (146, 49, 'My Habits', 'Morning Lark to Night Owl', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (147, 49, 'My Habits', 'Evolution to Revolution', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (148, 49, 'My Habits', 'Script to Improv', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (149, 49, 'My Habits', 'Think to Do', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (150, 49, 'My Habits', 'Build to Improve', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (151, 49, 'My Motivations', 'Advancement', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (152, 49, 'My Motivations', 'Autonomy', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (153, 49, 'My Motivations', 'Work/Life Balance', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (154, 49, 'My Motivations', 'Influencing', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (155, 49, 'My Motivations', 'Mastery', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (156, 49, 'My Motivations', 'Money', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (157, 49, 'My Motivations', 'Praise', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (158, 49, 'My Motivations', 'Problem', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (159, 49, 'My Motivations', 'Purpose', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (160, 49, 'My Motivations', 'Relationships', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (161, 50, 'My Personality', 'Climber', '0.58');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (162, 50, 'My Personality', 'Dreamer', '0.13');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (163, 50, 'My Personality', 'Purist', '0.27');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (164, 50, 'My Satisfaction', 'Self', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (165, 50, 'My Satisfaction', 'Project', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (166, 50, 'My Satisfaction', 'Client', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (167, 50, 'My Satisfaction', 'Community', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (168, 50, 'My Satisfaction', 'Revel', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (169, 50, 'My Satisfaction', 'Career', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (170, 50, 'My Goals', 'My Goals', 'Continue to learn and build skills. I first strenthened vertically in Finance, and now focusing on breadth of skills horizontally. I still have a strong interest in Finance and Analytics. ');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (171, 50, 'My Wins', 'My Wins', 'Lengthy career in Finance and Accounting at Starbucks and Nintendo. At Nintendo, I was heavily involved in the Oracle ERP implementation, and helped with business expansion in Latin America. At Starbucks, a proud win was revamping the corporate planning model from 40-tab workbook to a dynamic model driven by well structured pivot tables. ');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (172, 50, 'My Losses', 'My Losses', 'I left Nintendo to help family with investment research/trading with longer term goal of starting a hedge fund, but it did not work out but I still learned a ton of investment strategy and analytical methods that I still use to manage my own finances.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (173, 50, 'My Personal Brand', 'My Personal Brand', 'I have strong experience in Finance and Cost Accounting, which has made me strong in data analysis, critical thinking, and process improvement. I worked with my cross-functional teams and have a great get-along factor. I am a data junkie and an early adopter of new technology.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (174, 50, 'My Habits', 'Chameleon to Peacock', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (175, 50, 'My Habits', 'Gatherer to Hunter', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (176, 50, 'My Habits', 'Ambiguity to Structure', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (177, 50, 'My Habits', 'Introvert to Extrovert', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (178, 50, 'My Habits', 'Morning Lark to Night Owl', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (179, 50, 'My Habits', 'Evolution to Revolution', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (180, 50, 'My Habits', 'Script to Improv', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (181, 50, 'My Habits', 'Think to Do', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (182, 50, 'My Habits', 'Build to Improve', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (183, 50, 'My Motivations', 'Advancement', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (184, 50, 'My Motivations', 'Autonomy', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (185, 50, 'My Motivations', 'Work/Life Balance', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (186, 50, 'My Motivations', 'Influencing', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (187, 50, 'My Motivations', 'Mastery', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (188, 50, 'My Motivations', 'Money', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (189, 50, 'My Motivations', 'Praise', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (190, 50, 'My Motivations', 'Problem', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (191, 50, 'My Motivations', 'Purpose', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (192, 50, 'My Motivations', 'Relationships', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (193, 51, 'My Personality', 'Climber', '0.37');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (194, 51, 'My Personality', 'Dreamer', '0.32');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (195, 51, 'My Personality', 'Purist', '0.32');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (196, 51, 'My Satisfaction', 'Self', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (197, 51, 'My Satisfaction', 'Project', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (198, 51, 'My Satisfaction', 'Client', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (199, 51, 'My Satisfaction', 'Community', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (200, 51, 'My Satisfaction', 'Revel', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (201, 51, 'My Satisfaction', 'Career', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (202, 51, 'My Goals', 'My Goals', 'Continue to develop analytics skills and business experience, with the goal of using these base skills and knowledge while working towards a leadership or management role.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (203, 51, 'My Wins', 'My Wins', 'From a work perspective, stepping onto a new team with little knowledge of the data, problem, or issues faced and developing fraud detection models that were selected for implementation within 2 months of my start date. ');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (204, 51, 'My Losses', 'My Losses', 'I''d say my biggest loss/regret is not having tried to pursue new project opportunities earlier in my career when tasked with projects that were not aligned with my interests and goals. ');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (205, 51, 'My Personal Brand', 'My Personal Brand', 'Advanced analytics with plenty of general consulting and visualization mixed in. Solid balance between soft consulting skills and technical expertise, but motivated to improve and continue to develop in both phases.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (206, 51, 'My Habits', 'Chameleon to Peacock', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (207, 51, 'My Habits', 'Gatherer to Hunter', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (208, 51, 'My Habits', 'Ambiguity to Structure', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (209, 51, 'My Habits', 'Introvert to Extrovert', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (210, 51, 'My Habits', 'Morning Lark to Night Owl', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (211, 51, 'My Habits', 'Evolution to Revolution', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (212, 51, 'My Habits', 'Script to Improv', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (213, 51, 'My Habits', 'Think to Do', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (214, 51, 'My Habits', 'Build to Improve', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (215, 51, 'My Motivations', 'Advancement', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (216, 51, 'My Motivations', 'Autonomy', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (217, 51, 'My Motivations', 'Work/Life Balance', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (218, 51, 'My Motivations', 'Influencing', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (219, 51, 'My Motivations', 'Mastery', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (220, 51, 'My Motivations', 'Money', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (221, 51, 'My Motivations', 'Praise', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (222, 51, 'My Motivations', 'Problem', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (223, 51, 'My Motivations', 'Purpose', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (224, 51, 'My Motivations', 'Relationships', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (225, 52, 'My Personality', 'Climber', '0.38');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (226, 52, 'My Personality', 'Dreamer', '0.27');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (227, 52, 'My Personality', 'Purist', '0.33');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (228, 52, 'My Satisfaction', 'Self', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (229, 52, 'My Satisfaction', 'Project', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (230, 52, 'My Satisfaction', 'Client', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (231, 52, 'My Satisfaction', 'Community', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (232, 52, 'My Satisfaction', 'Revel', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (233, 52, 'My Satisfaction', 'Career', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (234, 52, 'My Goals', 'My Goals', 'set up and maintain business analytic engagements for our clients.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (235, 52, 'My Wins', 'My Wins', 'Providing actionable insights quickly and help others do the same.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (236, 52, 'My Losses', 'My Losses', 'Not everyone that has the technical know how, also have the business accumen needed to deliver Business Analytics that are relevant and actionable.  Same is true the other way�  Hard to train someone if they are solely in one camp or the other.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (237, 52, 'My Personal Brand', 'My Personal Brand', 'Get it done quickly and iteratively.  Provide directional, actionable insights that help our clients pivot in the right direction.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (238, 52, 'My Habits', 'Chameleon to Peacock', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (239, 52, 'My Habits', 'Gatherer to Hunter', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (240, 52, 'My Habits', 'Ambiguity to Structure', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (241, 52, 'My Habits', 'Introvert to Extrovert', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (242, 52, 'My Habits', 'Morning Lark to Night Owl', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (243, 52, 'My Habits', 'Evolution to Revolution', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (244, 52, 'My Habits', 'Script to Improv', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (245, 52, 'My Habits', 'Think to Do', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (246, 52, 'My Habits', 'Build to Improve', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (247, 52, 'My Motivations', 'Advancement', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (248, 52, 'My Motivations', 'Autonomy', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (249, 52, 'My Motivations', 'Work/Life Balance', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (250, 52, 'My Motivations', 'Influencing', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (251, 52, 'My Motivations', 'Mastery', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (252, 52, 'My Motivations', 'Money', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (253, 52, 'My Motivations', 'Praise', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (254, 52, 'My Motivations', 'Problem', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (255, 52, 'My Motivations', 'Purpose', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (256, 52, 'My Motivations', 'Relationships', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (257, 53, 'My Personality', 'Climber', '0.2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (258, 53, 'My Personality', 'Dreamer', '0.13');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (259, 53, 'My Personality', 'Purist', '0.68');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (260, 53, 'My Satisfaction', 'Self', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (261, 53, 'My Satisfaction', 'Project', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (262, 53, 'My Satisfaction', 'Client', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (263, 53, 'My Satisfaction', 'Community', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (264, 53, 'My Satisfaction', 'Revel', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (265, 53, 'My Satisfaction', 'Career', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (266, 53, 'My Goals', 'My Goals', 'I want to help the client achieve success through strategic / thoughtful consulting and execution ');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (267, 53, 'My Wins', 'My Wins', 'I''ve consulted, implemented and managed the success of top brands in digital analytics over the past 12 years - including Fortune 500 clients in the media industry. I''ve architected Adobe Analytics measurement strategy for brands of all sizes and I consider myself a senior-level analytics architect');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (268, 53, 'My Losses', 'My Losses', '');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (269, 53, 'My Personal Brand', 'My Personal Brand', 'I''m passionate about helping clients align business goals with great solutions and technology.I love building enterprise-level relationships and I''m a client advocate.I''m a highly motivated, team player with solid interpersonal skills.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (270, 53, 'My Habits', 'Chameleon to Peacock', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (271, 53, 'My Habits', 'Gatherer to Hunter', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (272, 53, 'My Habits', 'Ambiguity to Structure', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (273, 53, 'My Habits', 'Introvert to Extrovert', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (274, 53, 'My Habits', 'Morning Lark to Night Owl', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (275, 53, 'My Habits', 'Evolution to Revolution', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (276, 53, 'My Habits', 'Script to Improv', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (277, 53, 'My Habits', 'Think to Do', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (278, 53, 'My Habits', 'Build to Improve', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (279, 53, 'My Motivations', 'Advancement', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (280, 53, 'My Motivations', 'Autonomy', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (281, 53, 'My Motivations', 'Work/Life Balance', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (282, 53, 'My Motivations', 'Influencing', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (283, 53, 'My Motivations', 'Mastery', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (284, 53, 'My Motivations', 'Money', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (285, 53, 'My Motivations', 'Praise', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (286, 53, 'My Motivations', 'Problem', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (287, 53, 'My Motivations', 'Purpose', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (288, 53, 'My Motivations', 'Relationships', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (289, 54, 'My Personality', 'Climber', '0.29');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (290, 54, 'My Personality', 'Dreamer', '0.33');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (291, 54, 'My Personality', 'Purist', '0.38');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (292, 54, 'My Satisfaction', 'Self', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (293, 54, 'My Satisfaction', 'Project', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (294, 54, 'My Satisfaction', 'Client', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (295, 54, 'My Satisfaction', 'Community', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (296, 54, 'My Satisfaction', 'Revel', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (297, 54, 'My Satisfaction', 'Career', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (298, 54, 'My Goals', 'My Goals', 'Career-wise, I want to be able to confidentially solve technical problems and be considered an "expert" in a variety of tanglible/hard skills.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (299, 54, 'My Wins', 'My Wins', 'Career-wise, I''m proud of my past career accomplishments as a civil engineer, and my career change to a business consultant.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (300, 54, 'My Losses', 'My Losses', 'Career-wise, coding.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (301, 54, 'My Personal Brand', 'My Personal Brand', 'Personal pride in my work.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (302, 54, 'My Habits', 'Chameleon to Peacock', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (303, 54, 'My Habits', 'Gatherer to Hunter', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (387, 57, 'My Personality', 'Purist', '0.11');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (304, 54, 'My Habits', 'Ambiguity to Structure', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (305, 54, 'My Habits', 'Introvert to Extrovert', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (306, 54, 'My Habits', 'Morning Lark to Night Owl', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (307, 54, 'My Habits', 'Evolution to Revolution', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (308, 54, 'My Habits', 'Script to Improv', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (309, 54, 'My Habits', 'Think to Do', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (310, 54, 'My Habits', 'Build to Improve', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (311, 54, 'My Motivations', 'Advancement', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (312, 54, 'My Motivations', 'Autonomy', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (313, 54, 'My Motivations', 'Work/Life Balance', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (314, 54, 'My Motivations', 'Influencing', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (315, 54, 'My Motivations', 'Mastery', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (316, 54, 'My Motivations', 'Money', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (317, 54, 'My Motivations', 'Praise', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (318, 54, 'My Motivations', 'Problem', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (319, 54, 'My Motivations', 'Purpose', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (320, 54, 'My Motivations', 'Relationships', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (321, 55, 'My Personality', 'Climber', '0.42');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (322, 55, 'My Personality', 'Dreamer', '0.36');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (323, 55, 'My Personality', 'Purist', '0.22');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (324, 55, 'My Satisfaction', 'Self', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (325, 55, 'My Satisfaction', 'Project', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (326, 55, 'My Satisfaction', 'Client', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (327, 55, 'My Satisfaction', 'Community', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (328, 55, 'My Satisfaction', 'Revel', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (329, 55, 'My Satisfaction', 'Career', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (330, 55, 'My Goals', 'My Goals', 'I want to be consistently challenged by anything I''m involved in. It''s difficult for me to be stagnant in a career and for this reason, I''ve always tried to rely on my technique while expanding on those things I''m already comfortable with. I''d like to be someone others can look to and be comfortable with coming to for leadership and direction, in addition to any technical expertise I may possess. I see myself becoming a big picture guy when it comes to mapping out project architecture and solutions. This is mostly encouraged by my appreciation for strong and positive collaboration between all of those involved in whatever the final solution may be.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (331, 55, 'My Wins', 'My Wins', 'I am very proud of the fact that I feel that my life has gotten better with every year. While there have been setbacks and no small number of tragedies, I always seem to pick myself up and make myself better in some way, whether it''s something tangible, like learning some new skill, or intangible, like figuring out how to better who I am on the inside and my mental state.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (332, 55, 'My Losses', 'My Losses', 'I''ll keep this strictly work related. Early on I went after a masters in computer science, but didn�t get accepted based on my work experience. I''m going to try this again now that I''ve got a little more work under my belt.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (333, 55, 'My Personal Brand', 'My Personal Brand', 'I get things done while helping others to feel invested in the process. I am ok with making the decisions that need to be made, and owning the mistakes and successes that result from those decisions.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (334, 55, 'My Habits', 'Chameleon to Peacock', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (335, 55, 'My Habits', 'Gatherer to Hunter', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (336, 55, 'My Habits', 'Ambiguity to Structure', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (337, 55, 'My Habits', 'Introvert to Extrovert', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (338, 55, 'My Habits', 'Morning Lark to Night Owl', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (339, 55, 'My Habits', 'Evolution to Revolution', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (340, 55, 'My Habits', 'Script to Improv', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (341, 55, 'My Habits', 'Think to Do', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (342, 55, 'My Habits', 'Build to Improve', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (343, 55, 'My Motivations', 'Advancement', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (344, 55, 'My Motivations', 'Autonomy', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (345, 55, 'My Motivations', 'Work/Life Balance', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (346, 55, 'My Motivations', 'Influencing', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (347, 55, 'My Motivations', 'Mastery', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (348, 55, 'My Motivations', 'Money', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (349, 55, 'My Motivations', 'Praise', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (350, 55, 'My Motivations', 'Problem', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (351, 55, 'My Motivations', 'Purpose', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (352, 55, 'My Motivations', 'Relationships', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (353, 56, 'My Personality', 'Climber', '0.36');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (354, 56, 'My Personality', 'Dreamer', '0.41');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (355, 56, 'My Personality', 'Purist', '0.23');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (356, 56, 'My Satisfaction', 'Self', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (357, 56, 'My Satisfaction', 'Project', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (358, 56, 'My Satisfaction', 'Client', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (359, 56, 'My Satisfaction', 'Community', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (360, 56, 'My Satisfaction', 'Revel', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (361, 56, 'My Satisfaction', 'Career', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (362, 56, 'My Goals', 'My Goals', 'I want to work in a role where I nurture and guide people and develop strategy and marketing solutions for clients.
I want to learn more about emerging issues in strategy and marketing to be a better contributor to the team.
I want to learnhow to sell our services so I can partner with leadership in developing client relationships.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (363, 56, 'My Wins', 'My Wins', 'Influencing the direction of digital business management at senior levels of Operations and Microsoft.
Guiding and delivering Research Design and Analysis for Bing Rewards to inform management of search behavior.
Developing strategy for Microsoft Remote Management - a B2B Online service from Microsoft.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (364, 56, 'My Losses', 'My Losses', 'Writing a paper without a clear mandate - don''t do it.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (365, 56, 'My Personal Brand', 'My Personal Brand', 'When other people see stars, I see constellations. I link points of data together to form meaning. I tie the meaning to the business processes and capabilities that drive customer outcomes. These links guide strategy and choices that inform actions and deliver business results.');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (366, 56, 'My Habits', 'Chameleon to Peacock', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (367, 56, 'My Habits', 'Gatherer to Hunter', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (368, 56, 'My Habits', 'Ambiguity to Structure', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (369, 56, 'My Habits', 'Introvert to Extrovert', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (370, 56, 'My Habits', 'Morning Lark to Night Owl', '1');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (371, 56, 'My Habits', 'Evolution to Revolution', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (372, 56, 'My Habits', 'Script to Improv', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (373, 56, 'My Habits', 'Think to Do', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (374, 56, 'My Habits', 'Build to Improve', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (375, 56, 'My Motivations', 'Advancement', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (376, 56, 'My Motivations', 'Autonomy', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (377, 56, 'My Motivations', 'Work/Life Balance', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (378, 56, 'My Motivations', 'Influencing', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (379, 56, 'My Motivations', 'Mastery', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (380, 56, 'My Motivations', 'Money', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (381, 56, 'My Motivations', 'Praise', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (382, 56, 'My Motivations', 'Problem', '6th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (383, 56, 'My Motivations', 'Purpose', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (384, 56, 'My Motivations', 'Relationships', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (385, 57, 'My Personality', 'Climber', '0.44');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (386, 57, 'My Personality', 'Dreamer', '0.44');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (388, 57, 'My Satisfaction', 'Self', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (389, 57, 'My Satisfaction', 'Project', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (390, 57, 'My Satisfaction', 'Client', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (391, 57, 'My Satisfaction', 'Community', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (392, 57, 'My Satisfaction', 'Revel', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (393, 57, 'My Satisfaction', 'Career', '4');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (394, 57, 'My Goals', 'My Goals', 'Long term vision of success is to be able to master in my field of business intelligence and helping Revel achieve that. ');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (395, 57, 'My Wins', 'My Wins', 'Creating BI visualizations that exceeds clients'' expectations');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (396, 57, 'My Losses', 'My Losses', 'Pure project management is not my strong suit');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (397, 57, 'My Personal Brand', 'My Personal Brand', 'I''m a data creator and visualizer');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (398, 57, 'My Habits', 'Chameleon to Peacock', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (399, 57, 'My Habits', 'Gatherer to Hunter', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (400, 57, 'My Habits', 'Ambiguity to Structure', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (401, 57, 'My Habits', 'Introvert to Extrovert', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (402, 57, 'My Habits', 'Morning Lark to Night Owl', '5');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (403, 57, 'My Habits', 'Evolution to Revolution', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (404, 57, 'My Habits', 'Script to Improv', '2');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (405, 57, 'My Habits', 'Think to Do', '1');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (406, 57, 'My Habits', 'Build to Improve', '3');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (407, 57, 'My Motivations', 'Advancement', '9th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (408, 57, 'My Motivations', 'Autonomy', '5th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (409, 57, 'My Motivations', 'Work/Life Balance', '1st');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (410, 57, 'My Motivations', 'Influencing', '4th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (411, 57, 'My Motivations', 'Mastery', '8th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (412, 57, 'My Motivations', 'Money', '3rd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (413, 57, 'My Motivations', 'Praise', '10th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (414, 57, 'My Motivations', 'Problem', '7th');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (415, 57, 'My Motivations', 'Purpose', '2nd');
INSERT INTO human_element_survey (id, emp_id, category, dimension, value) VALUES (416, 57, 'My Motivations', 'Relationships', '6th');


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 201
-- Name: human_element_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ahaneef
--

SELECT pg_catalog.setval('human_element_survey_id_seq', 416, true);


--
-- TOC entry 2278 (class 0 OID 326530)
-- Dependencies: 196
-- Data for Name: learning_interest; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO learning_interest (id, name, value) VALUES (1, 'Yes', 1);
INSERT INTO learning_interest (id, name, value) VALUES (2, 'No', 0);
INSERT INTO learning_interest (id, name, value) VALUES (3, 'AVOID', 0);
INSERT INTO learning_interest (id, name, value) VALUES (4, 'DEVELOP', 1);
INSERT INTO learning_interest (id, name, value) VALUES (5, 'ENGAGE', 2);
INSERT INTO learning_interest (id, name, value) VALUES (6, 'ACCELERATE', 3);


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 195
-- Name: learning_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('learning_interest_id_seq', 1, false);


--
-- TOC entry 2274 (class 0 OID 326518)
-- Dependencies: 192
-- Data for Name: level; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO level (id, name, value) VALUES (1, 'INTRODUCTORY', 1);
INSERT INTO level (id, name, value) VALUES (2, 'BASIC', 2);
INSERT INTO level (id, name, value) VALUES (3, 'PROFICIENT', 3);
INSERT INTO level (id, name, value) VALUES (4, 'ADVANCED', 4);
INSERT INTO level (id, name, value) VALUES (5, 'MASTERY', 5);
INSERT INTO level (id, name, value) VALUES (6, 'NO EXPERIENCE', 0);
INSERT INTO level (id, name, value) VALUES (7, 'COMPETENT', 1);
INSERT INTO level (id, name, value) VALUES (8, 'PROFICIENT', 2);
INSERT INTO level (id, name, value) VALUES (9, 'ADVANCED', 3);
INSERT INTO level (id, name, value) VALUES (10, 'MASTERY', 4);


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 191
-- Name: level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('level_id_seq', 1, false);


--
-- TOC entry 2270 (class 0 OID 326506)
-- Dependencies: 188
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO skill (id, name, community_id) VALUES (1, 'VersionOne', NULL);
INSERT INTO skill (id, name, community_id) VALUES (2, 'MicrosoftProject', NULL);
INSERT INTO skill (id, name, community_id) VALUES (3, 'JIRA', NULL);
INSERT INTO skill (id, name, community_id) VALUES (4, 'PMP / Project Management Professional', NULL);
INSERT INTO skill (id, name, community_id) VALUES (5, 'CSM / Certified Scrum Master', NULL);
INSERT INTO skill (id, name, community_id) VALUES (6, 'Kanban method', NULL);
INSERT INTO skill (id, name, community_id) VALUES (7, 'Offshore Delivery Model Experience (delivery role)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (8, 'Offshore Delivery Model Experience (leadership role)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (9, 'Project Effort Estimation', NULL);
INSERT INTO skill (id, name, community_id) VALUES (10, 'Data Strategy', NULL);
INSERT INTO skill (id, name, community_id) VALUES (11, 'Corporate Strategy', NULL);
INSERT INTO skill (id, name, community_id) VALUES (12, 'Competitive Strategy', NULL);
INSERT INTO skill (id, name, community_id) VALUES (13, 'Business Case Writing', NULL);
INSERT INTO skill (id, name, community_id) VALUES (14, 'Product Development', NULL);
INSERT INTO skill (id, name, community_id) VALUES (15, 'Financial Analysis (DCF NPV ROI Cost Benefit Analysis Market Research)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (16, 'Sensative Analysis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (17, 'Go to Market (GTM Strategy Outreach RFP Response SOW writing Relationship Mgmt Salesforce)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (18, 'Oral Experience', NULL);
INSERT INTO skill (id, name, community_id) VALUES (19, 'Recruiting', NULL);
INSERT INTO skill (id, name, community_id) VALUES (20, 'Public Speaking', NULL);
INSERT INTO skill (id, name, community_id) VALUES (21, 'Product Management', NULL);
INSERT INTO skill (id, name, community_id) VALUES (22, 'Sales & Marketing', NULL);
INSERT INTO skill (id, name, community_id) VALUES (23, 'Dev Ops', NULL);
INSERT INTO skill (id, name, community_id) VALUES (24, 'Finance', NULL);
INSERT INTO skill (id, name, community_id) VALUES (25, 'Operations', NULL);
INSERT INTO skill (id, name, community_id) VALUES (26, 'HR', NULL);
INSERT INTO skill (id, name, community_id) VALUES (27, 'Supply Chain & Inventory Management', NULL);
INSERT INTO skill (id, name, community_id) VALUES (28, 'High Tech', NULL);
INSERT INTO skill (id, name, community_id) VALUES (29, 'Financial Services', NULL);
INSERT INTO skill (id, name, community_id) VALUES (30, 'Internal', NULL);
INSERT INTO skill (id, name, community_id) VALUES (31, 'Communications', NULL);
INSERT INTO skill (id, name, community_id) VALUES (32, 'Retail', NULL);
INSERT INTO skill (id, name, community_id) VALUES (33, 'Healthcare & Life Sciences', NULL);
INSERT INTO skill (id, name, community_id) VALUES (34, 'Media & Entertainment', NULL);
INSERT INTO skill (id, name, community_id) VALUES (35, 'Manufacturing', NULL);
INSERT INTO skill (id, name, community_id) VALUES (36, 'PubSec', NULL);
INSERT INTO skill (id, name, community_id) VALUES (37, 'MBA', NULL);
INSERT INTO skill (id, name, community_id) VALUES (38, 'MS IS / Masters of Science in Information Systems', NULL);
INSERT INTO skill (id, name, community_id) VALUES (39, 'MS Data Science', NULL);
INSERT INTO skill (id, name, community_id) VALUES (40, 'SAS Certificate in Business Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (41, 'Pentaho', NULL);
INSERT INTO skill (id, name, community_id) VALUES (42, 'Qlik Sense', NULL);
INSERT INTO skill (id, name, community_id) VALUES (43, 'QlikView', NULL);
INSERT INTO skill (id, name, community_id) VALUES (44, 'Tableau', NULL);
INSERT INTO skill (id, name, community_id) VALUES (45, 'Microstrategy', NULL);
INSERT INTO skill (id, name, community_id) VALUES (46, 'Power BI', NULL);
INSERT INTO skill (id, name, community_id) VALUES (47, 'Birst', NULL);
INSERT INTO skill (id, name, community_id) VALUES (48, 'Tibco Spotfire', NULL);
INSERT INTO skill (id, name, community_id) VALUES (49, 'Alteryx', NULL);
INSERT INTO skill (id, name, community_id) VALUES (50, 'Neo4j', NULL);
INSERT INTO skill (id, name, community_id) VALUES (51, 'IBM Cognos', NULL);
INSERT INTO skill (id, name, community_id) VALUES (52, 'OBIEE', NULL);
INSERT INTO skill (id, name, community_id) VALUES (53, 'SAP BOBJ', NULL);
INSERT INTO skill (id, name, community_id) VALUES (54, 'SSRS', NULL);
INSERT INTO skill (id, name, community_id) VALUES (55, 'Financial Reporting', NULL);
INSERT INTO skill (id, name, community_id) VALUES (56, 'Operational Reporting', NULL);
INSERT INTO skill (id, name, community_id) VALUES (57, 'Customer Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (58, 'Consumer Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (59, 'Interactive Visualization', NULL);
INSERT INTO skill (id, name, community_id) VALUES (60, 'Insight Driven Organization', NULL);
INSERT INTO skill (id, name, community_id) VALUES (61, 'Guided Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (62, 'Data Visualization', NULL);
INSERT INTO skill (id, name, community_id) VALUES (63, 'OLAP', NULL);
INSERT INTO skill (id, name, community_id) VALUES (64, 'Measure and Metric Definition', NULL);
INSERT INTO skill (id, name, community_id) VALUES (65, 'Requirement Gathering', NULL);
INSERT INTO skill (id, name, community_id) VALUES (66, 'Self-Service BI / Self-Service Business Intelligence', NULL);
INSERT INTO skill (id, name, community_id) VALUES (67, 'Unstructured Data Analysis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (68, 'Geospatial Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (69, 'GIS', NULL);
INSERT INTO skill (id, name, community_id) VALUES (70, 'Informatica Powercenter', NULL);
INSERT INTO skill (id, name, community_id) VALUES (71, 'Informatica Cloud', NULL);
INSERT INTO skill (id, name, community_id) VALUES (72, 'IBM DataStage', NULL);
INSERT INTO skill (id, name, community_id) VALUES (73, 'ODI / Oracle Data Integrator', NULL);
INSERT INTO skill (id, name, community_id) VALUES (74, 'Talend', NULL);
INSERT INTO skill (id, name, community_id) VALUES (75, 'SAP BODI', NULL);
INSERT INTO skill (id, name, community_id) VALUES (76, 'T-SQL', NULL);
INSERT INTO skill (id, name, community_id) VALUES (77, 'SSIS', NULL);
INSERT INTO skill (id, name, community_id) VALUES (78, 'SAS', NULL);
INSERT INTO skill (id, name, community_id) VALUES (79, 'Information Builders', NULL);
INSERT INTO skill (id, name, community_id) VALUES (80, 'Kafka', NULL);
INSERT INTO skill (id, name, community_id) VALUES (81, 'Ab Initio', NULL);
INSERT INTO skill (id, name, community_id) VALUES (82, 'Snowflake', NULL);
INSERT INTO skill (id, name, community_id) VALUES (83, 'RedShift', NULL);
INSERT INTO skill (id, name, community_id) VALUES (84, 'Netezza', NULL);
INSERT INTO skill (id, name, community_id) VALUES (85, 'Postgres', NULL);
INSERT INTO skill (id, name, community_id) VALUES (86, 'Cloudera', NULL);
INSERT INTO skill (id, name, community_id) VALUES (87, 'Teradata', NULL);
INSERT INTO skill (id, name, community_id) VALUES (88, 'Amazon Kenesis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (89, 'Amazon Athena', NULL);
INSERT INTO skill (id, name, community_id) VALUES (90, 'Amazon Data Pipeline', NULL);
INSERT INTO skill (id, name, community_id) VALUES (91, 'CA ERWin', NULL);
INSERT INTO skill (id, name, community_id) VALUES (92, 'NewSQL', NULL);
INSERT INTO skill (id, name, community_id) VALUES (93, 'NoSql', NULL);
INSERT INTO skill (id, name, community_id) VALUES (94, 'MongoDB', NULL);
INSERT INTO skill (id, name, community_id) VALUES (95, 'Neo4j', NULL);
INSERT INTO skill (id, name, community_id) VALUES (96, 'Cassandra', NULL);
INSERT INTO skill (id, name, community_id) VALUES (97, 'DynamoDB', NULL);
INSERT INTO skill (id, name, community_id) VALUES (98, 'Hadoop', NULL);
INSERT INTO skill (id, name, community_id) VALUES (99, 'HIVE', NULL);
INSERT INTO skill (id, name, community_id) VALUES (100, 'Microsoft Cosmos', NULL);
INSERT INTO skill (id, name, community_id) VALUES (101, 'Amazon EMR', NULL);
INSERT INTO skill (id, name, community_id) VALUES (102, 'Google Cloud BigTable', NULL);
INSERT INTO skill (id, name, community_id) VALUES (103, 'Google Cloud BigQuery', NULL);
INSERT INTO skill (id, name, community_id) VALUES (104, 'Splunk', NULL);
INSERT INTO skill (id, name, community_id) VALUES (105, 'Spark', NULL);
INSERT INTO skill (id, name, community_id) VALUES (106, 'AWS IoT', NULL);
INSERT INTO skill (id, name, community_id) VALUES (107, 'AWS GreenGrass', NULL);
INSERT INTO skill (id, name, community_id) VALUES (108, 'Microsoft SQL', NULL);
INSERT INTO skill (id, name, community_id) VALUES (109, 'Oracle', NULL);
INSERT INTO skill (id, name, community_id) VALUES (110, 'MySQL', NULL);
INSERT INTO skill (id, name, community_id) VALUES (111, 'Google Cloud SQL', NULL);
INSERT INTO skill (id, name, community_id) VALUES (112, 'DB2', NULL);
INSERT INTO skill (id, name, community_id) VALUES (113, 'Master Data Management / MDM', NULL);
INSERT INTO skill (id, name, community_id) VALUES (114, 'Data Quality Management / DQM', NULL);
INSERT INTO skill (id, name, community_id) VALUES (115, 'Data Quality Analysis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (116, 'Data Profiling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (117, 'Data Integration', NULL);
INSERT INTO skill (id, name, community_id) VALUES (118, 'Data Governance', NULL);
INSERT INTO skill (id, name, community_id) VALUES (119, 'Dimensional Data Modeling (Star Schemas EDWs)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (120, 'Relational Modeling / ERDs / Entity Relationship Diagram / OLTP modeling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (121, 'Conceptual Data Modeling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (122, 'Logical Data Modeling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (123, 'IoT', NULL);
INSERT INTO skill (id, name, community_id) VALUES (124, 'Telematics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (125, 'OLTP', NULL);
INSERT INTO skill (id, name, community_id) VALUES (126, 'KPI Strategy', NULL);
INSERT INTO skill (id, name, community_id) VALUES (127, 'Data Acquisition', NULL);
INSERT INTO skill (id, name, community_id) VALUES (128, 'Amazon Kinesis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (129, 'Amazon Lex', NULL);
INSERT INTO skill (id, name, community_id) VALUES (130, 'Amazon Polly', NULL);
INSERT INTO skill (id, name, community_id) VALUES (131, 'Amazon Rekognition', NULL);
INSERT INTO skill (id, name, community_id) VALUES (132, 'AWS Deep Learning', NULL);
INSERT INTO skill (id, name, community_id) VALUES (133, 'Amazon Machine Learning', NULL);
INSERT INTO skill (id, name, community_id) VALUES (134, 'Google Cloud DataLab', NULL);
INSERT INTO skill (id, name, community_id) VALUES (135, 'Google Cloud Tensorflow', NULL);
INSERT INTO skill (id, name, community_id) VALUES (136, 'Google Cloud Machine Learning', NULL);
INSERT INTO skill (id, name, community_id) VALUES (137, 'Google Cloud Natural Language API', NULL);
INSERT INTO skill (id, name, community_id) VALUES (138, 'IBM Watson', NULL);
INSERT INTO skill (id, name, community_id) VALUES (139, '@Risk', NULL);
INSERT INTO skill (id, name, community_id) VALUES (140, 'R', NULL);
INSERT INTO skill (id, name, community_id) VALUES (141, 'Python', NULL);
INSERT INTO skill (id, name, community_id) VALUES (142, 'SAS', NULL);
INSERT INTO skill (id, name, community_id) VALUES (143, 'SSAS', NULL);
INSERT INTO skill (id, name, community_id) VALUES (144, 'Matlab', NULL);
INSERT INTO skill (id, name, community_id) VALUES (145, 'SAS Enterprise Miner', NULL);
INSERT INTO skill (id, name, community_id) VALUES (146, 'Frontline Risk Solver', NULL);
INSERT INTO skill (id, name, community_id) VALUES (147, 'Simulation Modeling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (148, 'Optimization Modeling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (149, 'Text Analysis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (150, 'Monte Carlo Simulations', NULL);
INSERT INTO skill (id, name, community_id) VALUES (151, 'Machine Learning', NULL);
INSERT INTO skill (id, name, community_id) VALUES (152, 'Artificial Intelligence', NULL);
INSERT INTO skill (id, name, community_id) VALUES (153, 'Advance Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (154, 'Cognitive Automation', NULL);
INSERT INTO skill (id, name, community_id) VALUES (155, 'Cognitive Intelligence', NULL);
INSERT INTO skill (id, name, community_id) VALUES (156, 'Cognitive Insights', NULL);
INSERT INTO skill (id, name, community_id) VALUES (157, 'Data Science', NULL);
INSERT INTO skill (id, name, community_id) VALUES (158, 'Multi-touch attribution modeling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (159, 'Neural Networks', NULL);
INSERT INTO skill (id, name, community_id) VALUES (160, 'Supervised Learning', NULL);
INSERT INTO skill (id, name, community_id) VALUES (161, 'Clustering - (aka Unsupervised Learning)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (162, 'Segmentation Models', NULL);
INSERT INTO skill (id, name, community_id) VALUES (163, 'Up-Selling Models', NULL);
INSERT INTO skill (id, name, community_id) VALUES (164, 'Fraud-Detection Models', NULL);
INSERT INTO skill (id, name, community_id) VALUES (165, 'Policy Lapse Prediction Models', NULL);
INSERT INTO skill (id, name, community_id) VALUES (166, 'Churn Models', NULL);
INSERT INTO skill (id, name, community_id) VALUES (167, 'Multi-Touch Attribution Models', NULL);
INSERT INTO skill (id, name, community_id) VALUES (168, 'Pricing Analysis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (169, 'Supply Chain Optimization', NULL);
INSERT INTO skill (id, name, community_id) VALUES (170, 'Structured Prediction', NULL);
INSERT INTO skill (id, name, community_id) VALUES (171, 'Anomaly Detection', NULL);
INSERT INTO skill (id, name, community_id) VALUES (172, 'Arbitrage', NULL);
INSERT INTO skill (id, name, community_id) VALUES (173, 'Association Rules', NULL);
INSERT INTO skill (id, name, community_id) VALUES (174, 'Bayesian Statistics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (175, 'Confidence Interval', NULL);
INSERT INTO skill (id, name, community_id) VALUES (176, 'Decision Trees', NULL);
INSERT INTO skill (id, name, community_id) VALUES (177, 'Deep Learning', NULL);
INSERT INTO skill (id, name, community_id) VALUES (178, 'Game Theory', NULL);
INSERT INTO skill (id, name, community_id) VALUES (179, 'K Means Clustering', NULL);
INSERT INTO skill (id, name, community_id) VALUES (180, 'Lift Modeling', NULL);
INSERT INTO skill (id, name, community_id) VALUES (181, 'Naïve Bayesian Classifier', NULL);
INSERT INTO skill (id, name, community_id) VALUES (182, 'Neural Networks', NULL);
INSERT INTO skill (id, name, community_id) VALUES (183, 'Pattern Recognition', NULL);
INSERT INTO skill (id, name, community_id) VALUES (184, 'Random Numbers', NULL);
INSERT INTO skill (id, name, community_id) VALUES (185, 'Regression: ElasticNet Regression', NULL);
INSERT INTO skill (id, name, community_id) VALUES (186, 'Regression: Lasso Regression', NULL);
INSERT INTO skill (id, name, community_id) VALUES (187, 'Regression: Linear Regression', NULL);
INSERT INTO skill (id, name, community_id) VALUES (188, 'Regression: Logistic Regression', NULL);
INSERT INTO skill (id, name, community_id) VALUES (189, 'Regression: Polynomial Regression', NULL);
INSERT INTO skill (id, name, community_id) VALUES (190, ' Regression: Ridge Recognition', NULL);
INSERT INTO skill (id, name, community_id) VALUES (191, 'Regression: Stepwise Regression', NULL);
INSERT INTO skill (id, name, community_id) VALUES (192, 'Support Vector Machine - (SVM)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (193, 'Test of Hypotheses', NULL);
INSERT INTO skill (id, name, community_id) VALUES (194, 'Time Series Analysis', NULL);
INSERT INTO skill (id, name, community_id) VALUES (195, 'Yield Optimization', NULL);
INSERT INTO skill (id, name, community_id) VALUES (196, 'AWS / Amazon Web Services', NULL);
INSERT INTO skill (id, name, community_id) VALUES (197, 'Azure', NULL);
INSERT INTO skill (id, name, community_id) VALUES (198, 'Google Cloud Storage', NULL);
INSERT INTO skill (id, name, community_id) VALUES (199, 'Google Cloud Persistent Disk', NULL);
INSERT INTO skill (id, name, community_id) VALUES (200, 'AWS Data Lake solution implementation', NULL);
INSERT INTO skill (id, name, community_id) VALUES (201, 'Azure Data Lake solution implementation', NULL);
INSERT INTO skill (id, name, community_id) VALUES (202, 'AWS Glacier', NULL);
INSERT INTO skill (id, name, community_id) VALUES (203, 'AWS S3', NULL);
INSERT INTO skill (id, name, community_id) VALUES (204, 'AWS VPC setup', NULL);
INSERT INTO skill (id, name, community_id) VALUES (205, 'AWS Security configuration', NULL);
INSERT INTO skill (id, name, community_id) VALUES (206, 'Redhat Admin', NULL);
INSERT INTO skill (id, name, community_id) VALUES (207, 'Ubuntu Admin', NULL);
INSERT INTO skill (id, name, community_id) VALUES (208, 'Microsoft Server OS Admin', NULL);
INSERT INTO skill (id, name, community_id) VALUES (209, 'UNIX', NULL);
INSERT INTO skill (id, name, community_id) VALUES (210, 'Network Security & Penetration', NULL);
INSERT INTO skill (id, name, community_id) VALUES (211, 'Cloud Infrastructure', NULL);
INSERT INTO skill (id, name, community_id) VALUES (212, 'Solution Architecture', NULL);
INSERT INTO skill (id, name, community_id) VALUES (213, 'TOGAF (select 5 for level if certified)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (214, 'ORDBMS', NULL);
INSERT INTO skill (id, name, community_id) VALUES (215, 'Database Performance Tuning', NULL);
INSERT INTO skill (id, name, community_id) VALUES (216, 'Google Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (217, 'Adobe Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (218, 'Piwik', NULL);
INSERT INTO skill (id, name, community_id) VALUES (219, 'Open Web Analytics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (220, 'StatCounter', NULL);
INSERT INTO skill (id, name, community_id) VALUES (221, 'Clicky', NULL);
INSERT INTO skill (id, name, community_id) VALUES (222, 'W3COUNTER', NULL);
INSERT INTO skill (id, name, community_id) VALUES (223, 'Heap', NULL);
INSERT INTO skill (id, name, community_id) VALUES (224, 'Omniture', NULL);
INSERT INTO skill (id, name, community_id) VALUES (225, 'Chartbeat', NULL);
INSERT INTO skill (id, name, community_id) VALUES (226, 'Guages', NULL);
INSERT INTO skill (id, name, community_id) VALUES (227, 'GoSquared', NULL);
INSERT INTO skill (id, name, community_id) VALUES (228, 'Calq', NULL);
INSERT INTO skill (id, name, community_id) VALUES (229, 'Indicative', NULL);
INSERT INTO skill (id, name, community_id) VALUES (230, 'KissMetrics', NULL);
INSERT INTO skill (id, name, community_id) VALUES (231, 'MixPanel', NULL);
INSERT INTO skill (id, name, community_id) VALUES (232, 'Woopra', NULL);
INSERT INTO skill (id, name, community_id) VALUES (233, 'Trakio', NULL);
INSERT INTO skill (id, name, community_id) VALUES (234, 'Adobe AudienceManager (demdex)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (235, 'Oracle DMP (bluekai)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (236, 'Lotame', NULL);
INSERT INTO skill (id, name, community_id) VALUES (237, 'Salesforce DMP (Krux)', NULL);
INSERT INTO skill (id, name, community_id) VALUES (238, 'Nielson DMP', NULL);
INSERT INTO skill (id, name, community_id) VALUES (239, 'V12 Data', NULL);
INSERT INTO skill (id, name, community_id) VALUES (240, 'MediaMath', NULL);
INSERT INTO skill (id, name, community_id) VALUES (241, 'DalaLogix', NULL);
INSERT INTO skill (id, name, community_id) VALUES (242, 'IgnitionOne', NULL);
INSERT INTO skill (id, name, community_id) VALUES (243, 'Simpli.fi', NULL);
INSERT INTO skill (id, name, community_id) VALUES (244, 'CXENSE', NULL);
INSERT INTO skill (id, name, community_id) VALUES (245, 'Java', NULL);
INSERT INTO skill (id, name, community_id) VALUES (246, 'C', NULL);
INSERT INTO skill (id, name, community_id) VALUES (247, 'C++', NULL);
INSERT INTO skill (id, name, community_id) VALUES (248, 'C#', NULL);
INSERT INTO skill (id, name, community_id) VALUES (249, '.NET', NULL);
INSERT INTO skill (id, name, community_id) VALUES (250, 'JavaScript', NULL);
INSERT INTO skill (id, name, community_id) VALUES (251, 'Perl', NULL);
INSERT INTO skill (id, name, community_id) VALUES (252, 'Delphi/Object Pascal', NULL);
INSERT INTO skill (id, name, community_id) VALUES (253, 'Ruby', NULL);
INSERT INTO skill (id, name, community_id) VALUES (254, 'Swift', NULL);
INSERT INTO skill (id, name, community_id) VALUES (255, 'Assembly language', NULL);
INSERT INTO skill (id, name, community_id) VALUES (256, 'Go', NULL);
INSERT INTO skill (id, name, community_id) VALUES (257, 'Visual Basic', NULL);
INSERT INTO skill (id, name, community_id) VALUES (258, 'Objective-C', NULL);
INSERT INTO skill (id, name, community_id) VALUES (259, 'Scratch', NULL);
INSERT INTO skill (id, name, community_id) VALUES (260, 'iOS Family', NULL);
INSERT INTO skill (id, name, community_id) VALUES (261, 'PHP', NULL);
INSERT INTO skill (id, name, community_id) VALUES (262, 'Bash scripting', NULL);
INSERT INTO skill (id, name, community_id) VALUES (263, 'Batch scripting', NULL);
INSERT INTO skill (id, name, community_id) VALUES (264, 'Photoshop', NULL);
INSERT INTO skill (id, name, community_id) VALUES (265, 'Lightroom', NULL);
INSERT INTO skill (id, name, community_id) VALUES (266, 'Illustrator', NULL);
INSERT INTO skill (id, name, community_id) VALUES (267, 'InDesign', NULL);
INSERT INTO skill (id, name, community_id) VALUES (268, 'ExperienceDesign', NULL);
INSERT INTO skill (id, name, community_id) VALUES (269, 'PremierPro', NULL);
INSERT INTO skill (id, name, community_id) VALUES (270, 'AfterEffects', NULL);
INSERT INTO skill (id, name, community_id) VALUES (271, 'CharacterAnimator', NULL);
INSERT INTO skill (id, name, community_id) VALUES (272, 'Audition', NULL);
INSERT INTO skill (id, name, community_id) VALUES (273, 'Animate CC', NULL);
INSERT INTO skill (id, name, community_id) VALUES (274, 'Dreamweaver', NULL);


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 187
-- Name: skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('skill_id_seq', 1, false);


--
-- TOC entry 2288 (class 0 OID 334873)
-- Dependencies: 206
-- Data for Name: skill_survey; Type: TABLE DATA; Schema: public; Owner: ahaneef
--



--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 205
-- Name: skill_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ahaneef
--

SELECT pg_catalog.setval('skill_survey_id_seq', 132, true);


--
-- TOC entry 2282 (class 0 OID 326609)
-- Dependencies: 200
-- Data for Name: tool_capability; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tool_capability (id, name) VALUES (1, 'Tool');
INSERT INTO tool_capability (id, name) VALUES (2, 'Capability');
INSERT INTO tool_capability (id, name) VALUES (3, 'Skills');
INSERT INTO tool_capability (id, name) VALUES (4, 'Platform');


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 199
-- Name: tool_capability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tool_capability_id_seq', 1, false);


--
-- TOC entry 2112 (class 2606 OID 326545)
-- Name: category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- TOC entry 2120 (class 2606 OID 326543)
-- Name: certification_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certification
    ADD CONSTRAINT certification_pk PRIMARY KEY (id);


--
-- TOC entry 2130 (class 2606 OID 334859)
-- Name: community_pk; Type: CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY community
    ADD CONSTRAINT community_pk PRIMARY KEY (id);


--
-- TOC entry 2110 (class 2606 OID 326547)
-- Name: core_competency_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_competency
    ADD CONSTRAINT core_competency_pk PRIMARY KEY (id);


--
-- TOC entry 2124 (class 2606 OID 326549)
-- Name: emp_skill_reference_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT emp_skill_reference_pk PRIMARY KEY (id);


--
-- TOC entry 2108 (class 2606 OID 326551)
-- Name: employees_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pk PRIMARY KEY (id);


--
-- TOC entry 2116 (class 2606 OID 326553)
-- Name: experience_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experience
    ADD CONSTRAINT experience_pk PRIMARY KEY (id);


--
-- TOC entry 2128 (class 2606 OID 334846)
-- Name: human_element_survey_pk; Type: CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY human_element_survey
    ADD CONSTRAINT human_element_survey_pk PRIMARY KEY (id);


--
-- TOC entry 2122 (class 2606 OID 326555)
-- Name: learning_interest_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY learning_interest
    ADD CONSTRAINT learning_interest_pk PRIMARY KEY (id);


--
-- TOC entry 2118 (class 2606 OID 326557)
-- Name: level_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY level
    ADD CONSTRAINT level_pk PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 326559)
-- Name: skill_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_pk PRIMARY KEY (id);


--
-- TOC entry 2132 (class 2606 OID 334881)
-- Name: skill_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY skill_survey
    ADD CONSTRAINT skill_survey_pkey PRIMARY KEY (id);


--
-- TOC entry 2126 (class 2606 OID 326614)
-- Name: tool_capability_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tool_capability
    ADD CONSTRAINT tool_capability_pk PRIMARY KEY (id);


--
-- TOC entry 2135 (class 2606 OID 326577)
-- Name: category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES category(id);


--
-- TOC entry 2139 (class 2606 OID 326597)
-- Name: certification_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT certification_id_fk FOREIGN KEY (certification_id) REFERENCES certification(id);


--
-- TOC entry 2148 (class 2606 OID 334902)
-- Name: certification_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY skill_survey
    ADD CONSTRAINT certification_id_fk FOREIGN KEY (certification_id) REFERENCES certification(id);


--
-- TOC entry 2142 (class 2606 OID 334863)
-- Name: community_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT community_id_fk FOREIGN KEY (community_id) REFERENCES community(id);


--
-- TOC entry 2144 (class 2606 OID 334882)
-- Name: community_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY skill_survey
    ADD CONSTRAINT community_id_fk FOREIGN KEY (community_id) REFERENCES community(id);


--
-- TOC entry 2134 (class 2606 OID 326567)
-- Name: core_competency_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT core_competency_id_fk FOREIGN KEY (core_competency_id) REFERENCES core_competency(id);


--
-- TOC entry 2133 (class 2606 OID 326562)
-- Name: emp_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT emp_id_fk FOREIGN KEY (emp_id) REFERENCES employees(id);


--
-- TOC entry 2143 (class 2606 OID 334847)
-- Name: employees_fk; Type: FK CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY human_element_survey
    ADD CONSTRAINT employees_fk FOREIGN KEY (emp_id) REFERENCES employees(id);


--
-- TOC entry 2146 (class 2606 OID 334892)
-- Name: employees_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY skill_survey
    ADD CONSTRAINT employees_id_fk FOREIGN KEY (emp_id) REFERENCES employees(id);


--
-- TOC entry 2145 (class 2606 OID 334887)
-- Name: expereince_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY skill_survey
    ADD CONSTRAINT expereince_id_fk FOREIGN KEY (experience_id) REFERENCES experience(id);


--
-- TOC entry 2137 (class 2606 OID 326587)
-- Name: experience_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT experience_id_fk FOREIGN KEY (experience_id) REFERENCES experience(id);


--
-- TOC entry 2140 (class 2606 OID 326602)
-- Name: learning_interest_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT learning_interest_id_fk FOREIGN KEY (learning_interest_id) REFERENCES learning_interest(id);


--
-- TOC entry 2138 (class 2606 OID 326592)
-- Name: level_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT level_id_fk FOREIGN KEY (level_id) REFERENCES level(id);


--
-- TOC entry 2136 (class 2606 OID 326582)
-- Name: skill_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT skill_id_fk FOREIGN KEY (skill_id) REFERENCES skill(id);


--
-- TOC entry 2141 (class 2606 OID 326615)
-- Name: tool_capability_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analytics_emp_skill_reference
    ADD CONSTRAINT tool_capability_id_fk FOREIGN KEY (tool_capability_id) REFERENCES tool_capability(id);


--
-- TOC entry 2147 (class 2606 OID 334897)
-- Name: tool_capability_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: ahaneef
--

ALTER TABLE ONLY skill_survey
    ADD CONSTRAINT tool_capability_id_fk FOREIGN KEY (tool_capability_id) REFERENCES tool_capability(id);


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 198
-- Name: analytics_emp_skill_reference; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE analytics_emp_skill_reference FROM PUBLIC;
REVOKE ALL ON TABLE analytics_emp_skill_reference FROM postgres;
GRANT ALL ON TABLE analytics_emp_skill_reference TO postgres;
GRANT ALL ON TABLE analytics_emp_skill_reference TO ahaneef;


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 186
-- Name: category; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE category FROM PUBLIC;
REVOKE ALL ON TABLE category FROM postgres;
GRANT ALL ON TABLE category TO postgres;
GRANT ALL ON TABLE category TO ahaneef;


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 185
-- Name: category_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE category_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE category_id_seq FROM postgres;
GRANT ALL ON SEQUENCE category_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE category_id_seq TO ahaneef;


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 194
-- Name: certification; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE certification FROM PUBLIC;
REVOKE ALL ON TABLE certification FROM postgres;
GRANT ALL ON TABLE certification TO postgres;
GRANT ALL ON TABLE certification TO ahaneef;


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 193
-- Name: certification_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE certification_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE certification_id_seq FROM postgres;
GRANT ALL ON SEQUENCE certification_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE certification_id_seq TO ahaneef;


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 184
-- Name: core_competency; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE core_competency FROM PUBLIC;
REVOKE ALL ON TABLE core_competency FROM postgres;
GRANT ALL ON TABLE core_competency TO postgres;
GRANT ALL ON TABLE core_competency TO ahaneef;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 183
-- Name: core_competency_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE core_competency_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE core_competency_id_seq FROM postgres;
GRANT ALL ON SEQUENCE core_competency_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE core_competency_id_seq TO ahaneef;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 197
-- Name: emp_skill_reference_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE emp_skill_reference_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE emp_skill_reference_id_seq FROM postgres;
GRANT ALL ON SEQUENCE emp_skill_reference_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE emp_skill_reference_id_seq TO ahaneef;


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 182
-- Name: employees; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE employees FROM PUBLIC;
REVOKE ALL ON TABLE employees FROM postgres;
GRANT ALL ON TABLE employees TO postgres;
GRANT ALL ON TABLE employees TO ahaneef;


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 181
-- Name: employees_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE employees_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE employees_id_seq FROM postgres;
GRANT ALL ON SEQUENCE employees_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE employees_id_seq TO ahaneef;


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 190
-- Name: experience; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE experience FROM PUBLIC;
REVOKE ALL ON TABLE experience FROM postgres;
GRANT ALL ON TABLE experience TO postgres;
GRANT ALL ON TABLE experience TO ahaneef;


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 189
-- Name: experience_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE experience_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE experience_id_seq FROM postgres;
GRANT ALL ON SEQUENCE experience_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE experience_id_seq TO ahaneef;


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 196
-- Name: learning_interest; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE learning_interest FROM PUBLIC;
REVOKE ALL ON TABLE learning_interest FROM postgres;
GRANT ALL ON TABLE learning_interest TO postgres;
GRANT ALL ON TABLE learning_interest TO ahaneef;


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 195
-- Name: learning_interest_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE learning_interest_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE learning_interest_id_seq FROM postgres;
GRANT ALL ON SEQUENCE learning_interest_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE learning_interest_id_seq TO ahaneef;


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 192
-- Name: level; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE level FROM PUBLIC;
REVOKE ALL ON TABLE level FROM postgres;
GRANT ALL ON TABLE level TO postgres;
GRANT ALL ON TABLE level TO ahaneef;


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 191
-- Name: level_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE level_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE level_id_seq FROM postgres;
GRANT ALL ON SEQUENCE level_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE level_id_seq TO ahaneef;


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 188
-- Name: skill; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE skill FROM PUBLIC;
REVOKE ALL ON TABLE skill FROM postgres;
GRANT ALL ON TABLE skill TO postgres;
GRANT ALL ON TABLE skill TO ahaneef;


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 187
-- Name: skill_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE skill_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE skill_id_seq FROM postgres;
GRANT ALL ON SEQUENCE skill_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE skill_id_seq TO ahaneef;


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 200
-- Name: tool_capability; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tool_capability FROM PUBLIC;
REVOKE ALL ON TABLE tool_capability FROM postgres;
GRANT ALL ON TABLE tool_capability TO postgres;
GRANT ALL ON TABLE tool_capability TO ahaneef;


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 199
-- Name: tool_capability_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE tool_capability_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE tool_capability_id_seq FROM postgres;
GRANT ALL ON SEQUENCE tool_capability_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE tool_capability_id_seq TO ahaneef;


-- Completed on 2017-09-15 18:35:26 PKT

--
-- PostgreSQL database dump complete
--

