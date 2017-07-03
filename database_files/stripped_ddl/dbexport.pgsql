--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


--
-- Data for Name: organization_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY organization_unit (organization_business_id, name, description) FROM stdin;
1	Armco	the best water
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (customer_id, organization_business_id, name, gender) FROM stdin;
1	1	postgres Omondi	Male
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY address (address_id, address_line_1, address_line_2, zip_code, billing) FROM stdin;
1	56 North Avenue	Wichita, Kansas	4567	t
\.


--
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_address (id, customer_id, address_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: service_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_type (id, description) FROM stdin;
1	water
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service (service_id, service_type_id, provider_id, description) FROM stdin;
1	1	1	Armco water
\.


--
-- Data for Name: service_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_location (id, service_id, address_id, latitude, longitude) FROM stdin;
1	1	1	52	53
\.


--
-- PostgreSQL database dump complete
--

