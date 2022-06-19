--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

DROP DATABASE IF EXISTS moov;
--
-- Name: moov; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE moov WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';


ALTER DATABASE moov OWNER TO postgres;

\connect moov

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
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    city_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    api_base_link character varying(255),
    dataset_name character varying(255),
    title_field character varying(255),
    description_field character varying(255),
    image_field character varying(255),
    url_field character varying(255),
    placename_field character varying(255),
    timing_field character varying(255),
    date_start_field character varying(255),
    date_end_field character varying(255),
    latlon_field character varying(255),
    city_field character varying(255),
    district_field character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    api_key character varying(255)
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: link_saved_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_saved_user (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_uuid uuid NOT NULL
);


ALTER TABLE public.link_saved_user OWNER TO postgres;

--
-- Name: link_saved_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.link_saved_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_saved_user_id_seq OWNER TO postgres;

--
-- Name: link_saved_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.link_saved_user_id_seq OWNED BY public.link_saved_user.id;


--
-- Name: link_theme_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_theme_events (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    theme_id integer NOT NULL
);


ALTER TABLE public.link_theme_events OWNER TO postgres;

--
-- Name: link_theme_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.link_theme_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_theme_events_id_seq OWNER TO postgres;

--
-- Name: link_theme_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.link_theme_events_id_seq OWNED BY public.link_theme_events.id;


--
-- Name: link_user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_user_roles (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    role_id integer NOT NULL,
    user_uuid uuid NOT NULL
);


ALTER TABLE public.link_user_roles OWNER TO postgres;

--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    request_id integer NOT NULL,
    jwt_used character varying(255),
    user_agent character varying(255),
    hostname character varying(255),
    date timestamp with time zone,
    endpoint character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_uuid uuid
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- Name: requests_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requests_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_request_id_seq OWNER TO postgres;

--
-- Name: requests_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requests_request_id_seq OWNED BY public.requests.request_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_role_id_seq OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: saved_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saved_events (
    id integer NOT NULL,
    event_id character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    city_id character varying(255)
);


ALTER TABLE public.saved_events OWNER TO postgres;

--
-- Name: saved_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saved_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_events_id_seq OWNER TO postgres;

--
-- Name: saved_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.saved_events_id_seq OWNED BY public.saved_events.id;


--
-- Name: theme_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.theme_states (
    status_id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.theme_states OWNER TO postgres;

--
-- Name: theme_states_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.theme_states_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theme_states_status_id_seq OWNER TO postgres;

--
-- Name: theme_states_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.theme_states_status_id_seq OWNED BY public.theme_states.status_id;


--
-- Name: themed_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themed_events (
    id integer NOT NULL,
    event_id character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.themed_events OWNER TO postgres;

--
-- Name: themed_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themed_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themed_events_id_seq OWNER TO postgres;

--
-- Name: themed_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themed_events_id_seq OWNED BY public.themed_events.id;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    theme_id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_uuid uuid,
    status_id integer,
    city_id character varying(255)
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- Name: themes_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_theme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_theme_id_seq OWNER TO postgres;

--
-- Name: themes_theme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_theme_id_seq OWNED BY public.themes.theme_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_uuid uuid NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    birthyear integer,
    "userRecommandations" boolean DEFAULT false,
    "userEmailNotifications" boolean DEFAULT false,
    "preferedRadius" integer DEFAULT 25,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    city_id character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: link_saved_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_saved_user ALTER COLUMN id SET DEFAULT nextval('public.link_saved_user_id_seq'::regclass);


--
-- Name: link_theme_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_theme_events ALTER COLUMN id SET DEFAULT nextval('public.link_theme_events_id_seq'::regclass);


--
-- Name: requests request_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests ALTER COLUMN request_id SET DEFAULT nextval('public.requests_request_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: saved_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_events ALTER COLUMN id SET DEFAULT nextval('public.saved_events_id_seq'::regclass);


--
-- Name: theme_states status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theme_states ALTER COLUMN status_id SET DEFAULT nextval('public.theme_states_status_id_seq'::regclass);


--
-- Name: themed_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themed_events ALTER COLUMN id SET DEFAULT nextval('public.themed_events_id_seq'::regclass);


--
-- Name: themes theme_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes ALTER COLUMN theme_id SET DEFAULT nextval('public.themes_theme_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (city_id, name, api_base_link, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, "createdAt", "updatedAt", api_key) VALUES ('paris', 'Paris', 'https://opendata.paris.fr/api/records/1.0/search', 'que-faire-a-paris-', 'title', 'lead_text', 'cover_url', 'url', 'address_street', 'occurences', 'date_start', 'date_end', 'lat_lon', 'address_city', 'address_city', '2022-05-30 20:48:45.062+02', '2022-05-30 20:48:46.143+02', NULL);
INSERT INTO public.cities (city_id, name, api_base_link, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, "createdAt", "updatedAt", api_key) VALUES ('bordeaux', 'Bordeaux', 'https://opendata.bordeaux-metropole.fr/api/records/1.0/search', 'met_agenda', 'title_fr', 'html_fr', 'location_image', 'registrationurl', 'location_name', 'firstdate', 'firstdate', 'lastdate', 'location_coordinates', 'location_city', 'location_department', '2022-05-31 22:02:44.094+02', '2022-05-31 22:02:44.094+02', NULL);
INSERT INTO public.cities (city_id, name, api_base_link, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, "createdAt", "updatedAt", api_key) VALUES ('lille', 'Lille', 'https://opendata.lillemetropole.fr/api/records/1.0/search', 'evenements-publics-openagenda0', 'title', 'free_text', 'image', 'link', 'address', 'timetable', 'date_start', 'date_end', 'latlon', 'city', 'department', '2022-05-31 21:33:03.096+02', '2022-05-31 21:33:03.096+02', 'bf437e9135e61c1e2cbfa3304b80b6d7293a779fac9c16dc8115dd6a');


--
-- Data for Name: link_saved_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: link_theme_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (2, '2022-05-31 21:12:07.586+02', '2022-05-31 21:12:07.586+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (3, '2022-05-31 21:12:24.881+02', '2022-05-31 21:12:24.881+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (4, '2022-05-31 21:12:34.779+02', '2022-05-31 21:12:34.779+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (5, '2022-05-31 21:12:50.811+02', '2022-05-31 21:12:50.811+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (6, '2022-05-31 21:13:03.818+02', '2022-05-31 21:13:03.818+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (7, '2022-05-31 21:13:20.806+02', '2022-05-31 21:13:20.806+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (8, '2022-05-31 21:13:49.902+02', '2022-05-31 21:13:49.902+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (9, '2022-05-31 21:13:56.86+02', '2022-05-31 21:13:56.86+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (10, '2022-05-31 21:17:00.238+02', '2022-05-31 21:17:00.238+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (11, '2022-05-31 21:17:32.485+02', '2022-05-31 21:17:32.485+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (12, '2022-05-31 21:17:59.568+02', '2022-05-31 21:17:59.568+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (13, '2022-05-31 21:18:15.316+02', '2022-05-31 21:18:15.316+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (14, '2022-05-31 21:18:32.206+02', '2022-05-31 21:18:32.206+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (15, '2022-05-31 21:28:04.569+02', '2022-05-31 21:28:04.569+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (16, '2022-05-31 21:28:16.582+02', '2022-05-31 21:28:16.582+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (17, '2022-05-31 21:28:24.731+02', '2022-05-31 21:28:24.731+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (18, '2022-05-31 21:28:40.67+02', '2022-05-31 21:28:40.67+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (19, '2022-05-31 21:28:55.578+02', '2022-05-31 21:28:55.578+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (20, '2022-05-31 21:29:03.551+02', '2022-05-31 21:29:03.551+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (21, '2022-05-31 21:30:19.552+02', '2022-05-31 21:30:19.552+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (22, '2022-05-31 21:30:37.413+02', '2022-05-31 21:30:37.413+02', 5);


--
-- Data for Name: link_user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-05-30 18:48:52.458+02', '2022-05-30 18:48:52.458+02', 1, '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-05-30 20:49:14.583+02', '2022-05-30 20:49:15.113+02', 3, '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-05-30 19:28:50.41+02', '2022-05-30 19:28:50.41+02', 3, '8a0f8b6b-c41c-4c79-9de3-b1a034511cad');
INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-05-30 19:28:50.411+02', '2022-05-30 19:28:50.411+02', 1, '8a0f8b6b-c41c-4c79-9de3-b1a034511cad');


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:40:51.282+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 18:40:51.284+02', '2022-05-30 18:40:51.284+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (2, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:41:02.965+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 18:41:02.965+02', '2022-05-30 18:41:02.965+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (3, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:41:12.113+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 18:41:12.113+02', '2022-05-30 18:41:12.113+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (4, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:41:39.041+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 18:41:39.041+02', '2022-05-30 18:41:39.041+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (5, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:42:53.849+02', 'http://localhost:4000/auth/signup', '2022-05-30 18:42:53.85+02', '2022-05-30 18:42:53.85+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (6, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:48:52.417+02', 'http://localhost:4000/auth/signup', '2022-05-30 18:48:52.418+02', '2022-05-30 18:48:52.418+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (7, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:48:52.615+02', 'http://localhost:4000/cities/getCities', '2022-05-30 18:48:52.616+02', '2022-05-30 18:48:52.616+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (8, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:49:18.513+02', 'http://localhost:4000/cities/getCities', '2022-05-30 18:49:18.513+02', '2022-05-30 18:49:18.513+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (9, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:49:18.515+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 18:49:18.515+02', '2022-05-30 18:49:18.515+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (10, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:49:54.295+02', 'http://localhost:4000/cities/getCities', '2022-05-30 18:49:54.295+02', '2022-05-30 18:49:54.295+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (11, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 18:49:54.301+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 18:49:54.301+02', '2022-05-30 18:49:54.301+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (12, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:16:49.71+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:16:49.71+02', '2022-05-30 19:16:49.71+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (13, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:16:49.719+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:16:49.719+02', '2022-05-30 19:16:49.719+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (14, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:16:50.94+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-30 19:16:50.94+02', '2022-05-30 19:16:50.94+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (15, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:16:53.942+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-30 19:16:53.942+02', '2022-05-30 19:16:53.942+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (16, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:17:08.559+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-30 19:17:08.559+02', '2022-05-30 19:17:08.559+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (17, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:17:09.393+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-30 19:17:09.393+02', '2022-05-30 19:17:09.393+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (18, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:17:10.181+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=75', '2022-05-30 19:17:10.182+02', '2022-05-30 19:17:10.182+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (19, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:17:11.092+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=90', '2022-05-30 19:17:11.093+02', '2022-05-30 19:17:11.093+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (20, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:17:42.007+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:17:42.007+02', '2022-05-30 19:17:42.007+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (21, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:17:42.01+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:17:42.01+02', '2022-05-30 19:17:42.01+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (22, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:17:44.022+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-30 19:17:44.022+02', '2022-05-30 19:17:44.022+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzEwNjEsImV4cCI6MTY1NjYwOTQ2MX0.aMe3Euj6yR0RiQ9w5uo_4Wolq1gdP1nz1y1stPBdRmo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:18:33.564+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:18:33.564+02', '2022-05-30 19:18:33.564+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzEwNjEsImV4cCI6MTY1NjYwOTQ2MX0.aMe3Euj6yR0RiQ9w5uo_4Wolq1gdP1nz1y1stPBdRmo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:18:33.576+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:18:33.576+02', '2022-05-30 19:18:33.576+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (25, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:11.409+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:21:11.409+02', '2022-05-30 19:21:11.409+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (26, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:24.793+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:21:24.794+02', '2022-05-30 19:21:24.794+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (27, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:26.005+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:21:26.005+02', '2022-05-30 19:21:26.005+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (28, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:26.694+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:21:26.694+02', '2022-05-30 19:21:26.694+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (29, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:26.698+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:21:26.698+02', '2022-05-30 19:21:26.698+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (30, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:44.497+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:21:44.497+02', '2022-05-30 19:21:44.497+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (31, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:44.501+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:21:44.501+02', '2022-05-30 19:21:44.501+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzEzMDQsImV4cCI6MTY1NjYwOTcwNH0.oMQN-_Amw4yK2SY53uO2AnQR6fpTItny7afW-WiwvLA', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:46.362+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:21:46.363+02', '2022-05-30 19:21:46.363+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzEzMDQsImV4cCI6MTY1NjYwOTcwNH0.oMQN-_Amw4yK2SY53uO2AnQR6fpTItny7afW-WiwvLA', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:21:46.392+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:21:46.392+02', '2022-05-30 19:21:46.392+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (34, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:22:42.493+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:22:42.494+02', '2022-05-30 19:22:42.494+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (35, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:06.032+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:24:06.032+02', '2022-05-30 19:24:06.032+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (36, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:09.137+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:24:09.138+02', '2022-05-30 19:24:09.138+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (37, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:10.144+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:24:10.144+02', '2022-05-30 19:24:10.144+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (38, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:10.146+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:24:10.146+02', '2022-05-30 19:24:10.146+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (39, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:50.667+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:24:50.668+02', '2022-05-30 19:24:50.668+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (40, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:50.672+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:24:50.672+02', '2022-05-30 19:24:50.672+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE0OTAsImV4cCI6MTY1NjYwOTg5MH0.7YyknicQIUEyOR1wN_Tz-chWIZD_IWDZm-eFvpomXZ4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:52.071+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:24:52.072+02', '2022-05-30 19:24:52.072+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE0OTAsImV4cCI6MTY1NjYwOTg5MH0.7YyknicQIUEyOR1wN_Tz-chWIZD_IWDZm-eFvpomXZ4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:24:52.128+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:24:52.128+02', '2022-05-30 19:24:52.128+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (43, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:25:48.436+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:25:48.436+02', '2022-05-30 19:25:48.436+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:25:48.634+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:25:48.634+02', '2022-05-30 19:25:48.634+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:25:48.67+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:25:48.67+02', '2022-05-30 19:25:48.67+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:28:45.204+02', 'http://localhost:4000/user/create', '2022-05-30 19:28:45.204+02', '2022-05-30 19:28:45.204+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:28:50.403+02', 'http://localhost:4000/user/updateRoles', '2022-05-30 19:28:50.403+02', '2022-05-30 19:28:50.403+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:31:38.275+02', 'http://localhost:4000/mail/send', '2022-05-30 19:31:38.276+02', '2022-05-30 19:31:38.276+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-30 19:37:51.949+02', 'http://localhost:3000/theme/createTheme', '2022-05-30 19:37:51.95+02', '2022-05-30 19:37:51.95+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-30 19:43:46.889+02', 'http://localhost:3000/theme/createTheme', '2022-05-30 19:43:46.89+02', '2022-05-30 19:43:46.89+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (51, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:45:17.321+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:45:17.322+02', '2022-05-30 19:45:17.322+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzI3MTcsImV4cCI6MTY1NjYxMTExN30._XBiCgx8vnlAVF2D67anpeniByf8Zy9RDCiFBXAuzGI', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:45:17.551+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:45:17.551+02', '2022-05-30 19:45:17.551+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzI3MTcsImV4cCI6MTY1NjYxMTExN30._XBiCgx8vnlAVF2D67anpeniByf8Zy9RDCiFBXAuzGI', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:45:17.587+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:45:17.587+02', '2022-05-30 19:45:17.587+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (54, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:45:18.531+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:45:18.531+02', '2022-05-30 19:45:18.531+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (55, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:48:07.875+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:48:07.875+02', '2022-05-30 19:48:07.875+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (56, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:48:07.947+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:48:07.948+02', '2022-05-30 19:48:07.948+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzI4ODcsImV4cCI6MTY1NjYxMTI4N30.a_pm844nm0cQoo9rTYW80s7R91jxm0MVO_p69qt45UQ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:49:47.564+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:49:47.565+02', '2022-05-30 19:49:47.565+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzI4ODcsImV4cCI6MTY1NjYxMTI4N30.a_pm844nm0cQoo9rTYW80s7R91jxm0MVO_p69qt45UQ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:49:47.575+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:49:47.575+02', '2022-05-30 19:49:47.575+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (59, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:52:08.856+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:52:08.857+02', '2022-05-30 19:52:08.857+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (60, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMxMjgsImV4cCI6MTY1NjYxMTUyOH0.J-rvaiKBovIq3-Fsu0bb65RiSJVmgKmtMO3TomvrjpI', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:52:09.106+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:52:09.106+02', '2022-05-30 19:52:09.106+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMxMjgsImV4cCI6MTY1NjYxMTUyOH0.J-rvaiKBovIq3-Fsu0bb65RiSJVmgKmtMO3TomvrjpI', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:52:09.125+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:52:09.125+02', '2022-05-30 19:52:09.125+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (62, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:52:18.053+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:52:18.053+02', '2022-05-30 19:52:18.053+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMxMzgsImV4cCI6MTY1NjYxMTUzOH0.WruYb3TeJ_3UIFxllvDWV3x4Yy4rsEhewFHGIq2CGW4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:52:18.266+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:52:18.266+02', '2022-05-30 19:52:18.266+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMxMzgsImV4cCI6MTY1NjYxMTUzOH0.WruYb3TeJ_3UIFxllvDWV3x4Yy4rsEhewFHGIq2CGW4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:52:18.309+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:52:18.31+02', '2022-05-30 19:52:18.31+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (65, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:06.289+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:54:06.29+02', '2022-05-30 19:54:06.29+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMyNDYsImV4cCI6MTY1NjYxMTY0Nn0.bFsKMPNNu4zOeJl3OZYz_TWrTPTnKWTSiybXPUgP0Rc', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:06.576+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:54:06.576+02', '2022-05-30 19:54:06.576+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMyNDYsImV4cCI6MTY1NjYxMTY0Nn0.bFsKMPNNu4zOeJl3OZYz_TWrTPTnKWTSiybXPUgP0Rc', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:06.596+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:54:06.596+02', '2022-05-30 19:54:06.596+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (68, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:42.493+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:54:42.493+02', '2022-05-30 19:54:42.493+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (69, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMyODIsImV4cCI6MTY1NjYxMTY4Mn0.cR5olYk8CvD0PuiU6iGS4QVdF3UuYXuwwAjl9Dnf7z4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:42.74+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:54:42.74+02', '2022-05-30 19:54:42.74+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (70, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMyODIsImV4cCI6MTY1NjYxMTY4Mn0.cR5olYk8CvD0PuiU6iGS4QVdF3UuYXuwwAjl9Dnf7z4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:42.759+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:54:42.759+02', '2022-05-30 19:54:42.759+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (71, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:59.377+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:54:59.377+02', '2022-05-30 19:54:59.377+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (72, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMyOTksImV4cCI6MTY1NjYxMTY5OX0.yId_iVe2-g3i_XVzEVLdIMqUOVZq8CvMpPmrjFd46vk', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:59.634+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:54:59.634+02', '2022-05-30 19:54:59.634+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMyOTksImV4cCI6MTY1NjYxMTY5OX0.yId_iVe2-g3i_XVzEVLdIMqUOVZq8CvMpPmrjFd46vk', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:54:59.658+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:54:59.658+02', '2022-05-30 19:54:59.658+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (74, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:55:18.846+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:55:18.847+02', '2022-05-30 19:55:18.847+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMzMTgsImV4cCI6MTY1NjYxMTcxOH0.EfC5JrsgiJrKWnn7GjYgsCvUzoV5PU1tlHyaqJzZVJA', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:55:19.056+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:55:19.056+02', '2022-05-30 19:55:19.056+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMzMTgsImV4cCI6MTY1NjYxMTcxOH0.EfC5JrsgiJrKWnn7GjYgsCvUzoV5PU1tlHyaqJzZVJA', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:55:19.081+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:55:19.081+02', '2022-05-30 19:55:19.081+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (77, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:55:42.594+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:55:42.594+02', '2022-05-30 19:55:42.594+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (78, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMzNDIsImV4cCI6MTY1NjYxMTc0Mn0.KdfUykpNO0TDvzjcit4KYJE0ONU6TA5DAqoZbQamcRo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:55:42.653+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:55:42.653+02', '2022-05-30 19:55:42.653+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzMzNDIsImV4cCI6MTY1NjYxMTc0Mn0.KdfUykpNO0TDvzjcit4KYJE0ONU6TA5DAqoZbQamcRo', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:55:42.788+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:55:42.788+02', '2022-05-30 19:55:42.788+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (80, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:55:45.699+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 19:55:45.699+02', '2022-05-30 19:55:45.699+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (81, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:57:02.509+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:57:02.51+02', '2022-05-30 19:57:02.51+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (82, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM0MjIsImV4cCI6MTY1NjYxMTgyMn0.pI5cmkvPWM95vXW7xckYjZZfTlNYVUxOXkEnT7PdzqM', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:57:02.784+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:57:02.784+02', '2022-05-30 19:57:02.784+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (83, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM0MjIsImV4cCI6MTY1NjYxMTgyMn0.pI5cmkvPWM95vXW7xckYjZZfTlNYVUxOXkEnT7PdzqM', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:57:02.803+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:57:02.803+02', '2022-05-30 19:57:02.803+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (84, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:57:24.841+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:57:24.841+02', '2022-05-30 19:57:24.841+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (85, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM0NDQsImV4cCI6MTY1NjYxMTg0NH0.VHhwzJ3wo2XD5jfSEHjjmkHUUZ1nZyiLUQwdiOEhwUA', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:57:25.06+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:57:25.06+02', '2022-05-30 19:57:25.06+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM0NDQsImV4cCI6MTY1NjYxMTg0NH0.VHhwzJ3wo2XD5jfSEHjjmkHUUZ1nZyiLUQwdiOEhwUA', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:57:25.097+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:57:25.097+02', '2022-05-30 19:57:25.097+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (87, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:58:08.472+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:58:08.472+02', '2022-05-30 19:58:08.472+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (88, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM0ODgsImV4cCI6MTY1NjYxMTg4OH0.95KwA8rHvhYRlvWtIGN670hW828EVbjrx6-vvIpR25I', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:58:08.572+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:58:08.572+02', '2022-05-30 19:58:08.572+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (89, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM0ODgsImV4cCI6MTY1NjYxMTg4OH0.95KwA8rHvhYRlvWtIGN670hW828EVbjrx6-vvIpR25I', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:58:08.586+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:58:08.586+02', '2022-05-30 19:58:08.586+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (90, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:58:22.652+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:58:22.653+02', '2022-05-30 19:58:22.653+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (91, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM1MDIsImV4cCI6MTY1NjYxMTkwMn0.mmhdnlcB28LV4-pwmqyJBl4N6-9R6PNJRjH4i1FbJOY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:58:22.732+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:58:22.732+02', '2022-05-30 19:58:22.732+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (92, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM1MDIsImV4cCI6MTY1NjYxMTkwMn0.mmhdnlcB28LV4-pwmqyJBl4N6-9R6PNJRjH4i1FbJOY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:58:22.744+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:58:22.745+02', '2022-05-30 19:58:22.745+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (93, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:59:25.937+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:59:25.937+02', '2022-05-30 19:59:25.937+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (94, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM1NjUsImV4cCI6MTY1NjYxMTk2NX0.I6Yd15owgopx-RJKUTLTDjIcDs5-eWdhM1CSrf0B-Jg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:59:26.199+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:59:26.199+02', '2022-05-30 19:59:26.199+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (95, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM1NjUsImV4cCI6MTY1NjYxMTk2NX0.I6Yd15owgopx-RJKUTLTDjIcDs5-eWdhM1CSrf0B-Jg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:59:26.221+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:59:26.221+02', '2022-05-30 19:59:26.221+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (96, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:59:31.152+02', 'http://localhost:4000/cities/getCities', '2022-05-30 19:59:31.152+02', '2022-05-30 19:59:31.152+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (97, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM1NzEsImV4cCI6MTY1NjYxMTk3MX0.WsC2wEV62zCZwglPP2IWoYQQ7Kumq41Bp0fIeNxTQoY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:59:31.391+02', 'http://localhost:4000/user/getUsers', '2022-05-30 19:59:31.391+02', '2022-05-30 19:59:31.391+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (98, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM1NzEsImV4cCI6MTY1NjYxMTk3MX0.WsC2wEV62zCZwglPP2IWoYQQ7Kumq41Bp0fIeNxTQoY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 19:59:31.43+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 19:59:31.43+02', '2022-05-30 19:59:31.43+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (99, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:00:24.957+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:00:24.957+02', '2022-05-30 20:00:24.957+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (100, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2MjQsImV4cCI6MTY1NjYxMjAyNH0.mlsR3VePA8fOloeudnVcmXCo7aLf42c81Va6lcvgr4M', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:00:25.221+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:00:25.221+02', '2022-05-30 20:00:25.221+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (101, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2MjQsImV4cCI6MTY1NjYxMjAyNH0.mlsR3VePA8fOloeudnVcmXCo7aLf42c81Va6lcvgr4M', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:00:25.249+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:00:25.249+02', '2022-05-30 20:00:25.249+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (102, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:03.516+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:01:03.516+02', '2022-05-30 20:01:03.516+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (103, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2NjMsImV4cCI6MTY1NjYxMjA2M30.A5-X4o6pZpjYt-_92zXo1xARBuSm8bMYE3liHPOTbQ4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:03.758+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:01:03.758+02', '2022-05-30 20:01:03.758+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (104, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2NjMsImV4cCI6MTY1NjYxMjA2M30.A5-X4o6pZpjYt-_92zXo1xARBuSm8bMYE3liHPOTbQ4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:03.793+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:01:03.793+02', '2022-05-30 20:01:03.793+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (105, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:22.079+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:01:22.079+02', '2022-05-30 20:01:22.079+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (106, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2ODIsImV4cCI6MTY1NjYxMjA4Mn0.H8t2hANOMAhK1uoilfsSCAfXJJbrUuIOd3N2fRXKbWY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:22.337+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:01:22.337+02', '2022-05-30 20:01:22.337+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (107, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2ODIsImV4cCI6MTY1NjYxMjA4Mn0.H8t2hANOMAhK1uoilfsSCAfXJJbrUuIOd3N2fRXKbWY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:22.362+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:01:22.362+02', '2022-05-30 20:01:22.362+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (108, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:27.363+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:01:27.363+02', '2022-05-30 20:01:27.363+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (109, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2ODcsImV4cCI6MTY1NjYxMjA4N30.Vl3ybkqka-C0r9PrIZtIcBnWBdtDKxm0N6ptHBdTX-Y', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:27.639+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:01:27.639+02', '2022-05-30 20:01:27.639+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (110, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2ODcsImV4cCI6MTY1NjYxMjA4N30.Vl3ybkqka-C0r9PrIZtIcBnWBdtDKxm0N6ptHBdTX-Y', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:27.669+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:01:27.669+02', '2022-05-30 20:01:27.669+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (111, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:31.526+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:01:31.526+02', '2022-05-30 20:01:31.526+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (112, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2OTEsImV4cCI6MTY1NjYxMjA5MX0.KYaWg10Y6UrL9TRXJAXSqU4I1NLXrVUe7CtbxxLmVCM', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:31.731+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:01:31.731+02', '2022-05-30 20:01:31.731+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (113, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM2OTEsImV4cCI6MTY1NjYxMjA5MX0.KYaWg10Y6UrL9TRXJAXSqU4I1NLXrVUe7CtbxxLmVCM', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:01:31.797+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:01:31.797+02', '2022-05-30 20:01:31.797+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (114, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:28.701+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:02:28.702+02', '2022-05-30 20:02:28.702+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (115, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM3NDgsImV4cCI6MTY1NjYxMjE0OH0.SFHWeXk6cJ7LoBPT2XAR_aXqvLbAmjk3_ulrdJG5vd0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:28.97+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:02:28.97+02', '2022-05-30 20:02:28.97+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (116, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM3NDgsImV4cCI6MTY1NjYxMjE0OH0.SFHWeXk6cJ7LoBPT2XAR_aXqvLbAmjk3_ulrdJG5vd0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:28.997+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:02:28.997+02', '2022-05-30 20:02:28.997+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (117, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:29.219+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 20:02:29.219+02', '2022-05-30 20:02:29.219+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (118, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:54.282+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:02:54.282+02', '2022-05-30 20:02:54.282+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (119, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM3NzQsImV4cCI6MTY1NjYxMjE3NH0.Gw1R0meoe_doyBT8FLVoySfSrbrOF17onKyTo2c7U-E', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:54.486+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:02:54.486+02', '2022-05-30 20:02:54.486+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (120, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM3NzQsImV4cCI6MTY1NjYxMjE3NH0.Gw1R0meoe_doyBT8FLVoySfSrbrOF17onKyTo2c7U-E', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:54.527+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:02:54.527+02', '2022-05-30 20:02:54.527+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (121, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:02:54.759+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 20:02:54.759+02', '2022-05-30 20:02:54.759+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (122, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:03:09.485+02', 'http://localhost:4000/cities/getCities', '2022-05-30 20:03:09.486+02', '2022-05-30 20:03:09.486+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (123, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM3ODksImV4cCI6MTY1NjYxMjE4OX0.q0gl1UYpMW1h1NWRtZiAbeQ4yRzr0cYFGqApqPpyuFY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:03:09.542+02', 'http://localhost:4000/user/getUsers', '2022-05-30 20:03:09.543+02', '2022-05-30 20:03:09.543+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (124, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzM3ODksImV4cCI6MTY1NjYxMjE4OX0.q0gl1UYpMW1h1NWRtZiAbeQ4yRzr0cYFGqApqPpyuFY', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:03:09.685+02', 'http://localhost:4000/role/getAllRoles', '2022-05-30 20:03:09.685+02', '2022-05-30 20:03:09.685+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (125, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-30 20:03:10+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-30 20:03:10+02', '2022-05-30 20:03:10+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (126, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 19:52:41.887+02', 'http://localhost:4000/cities/getCities', '2022-05-31 19:52:41.888+02', '2022-05-31 19:52:41.888+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (127, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 19:52:41.892+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 19:52:41.893+02', '2022-05-31 19:52:41.893+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (128, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 19:55:23.828+02', 'http://localhost:4000/cities/getCities', '2022-05-31 19:55:23.828+02', '2022-05-31 19:55:23.828+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (129, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 19:55:23.831+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 19:55:23.831+02', '2022-05-31 19:55:23.831+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (130, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:06:34.174+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:06:34.175+02', '2022-05-31 20:06:34.175+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (131, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:06:53.99+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:06:53.99+02', '2022-05-31 20:06:53.99+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (132, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:06:56.027+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:06:56.027+02', '2022-05-31 20:06:56.027+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (133, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:07:06.612+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:07:06.612+02', '2022-05-31 20:07:06.612+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (134, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:07:06.615+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 20:07:06.615+02', '2022-05-31 20:07:06.615+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (135, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:13:35.326+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:13:35.327+02', '2022-05-31 20:13:35.327+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (136, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:13:35.329+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 20:13:35.33+02', '2022-05-31 20:13:35.33+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (137, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:13:42.513+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:13:42.513+02', '2022-05-31 20:13:42.513+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (138, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:13:42.516+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 20:13:42.516+02', '2022-05-31 20:13:42.516+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (139, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:13:49.139+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:13:49.139+02', '2022-05-31 20:13:49.139+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (140, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:13:49.142+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 20:13:49.142+02', '2022-05-31 20:13:49.142+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (141, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:49:48.623+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:49:48.623+02', '2022-05-31 20:49:48.623+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (142, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:49:48.651+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:49:48.651+02', '2022-05-31 20:49:48.651+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (143, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:02.054+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:50:02.054+02', '2022-05-31 20:50:02.054+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (144, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:05.372+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:50:05.372+02', '2022-05-31 20:50:05.372+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (145, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:05.602+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:50:05.602+02', '2022-05-31 20:50:05.602+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (146, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:49.646+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:50:49.646+02', '2022-05-31 20:50:49.646+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (147, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:51.101+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:50:51.101+02', '2022-05-31 20:50:51.101+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (148, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:51.342+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:50:51.342+02', '2022-05-31 20:50:51.342+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (149, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:59.849+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:50:59.849+02', '2022-05-31 20:50:59.849+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (150, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:50:59.879+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:50:59.879+02', '2022-05-31 20:50:59.879+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (151, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:34.808+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:34.808+02', '2022-05-31 20:51:34.808+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (152, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:35.94+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:51:35.941+02', '2022-05-31 20:51:35.941+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (153, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:36.135+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:36.136+02', '2022-05-31 20:51:36.136+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (154, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:39.826+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:39.826+02', '2022-05-31 20:51:39.826+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (155, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:45.392+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:45.393+02', '2022-05-31 20:51:45.393+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (156, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:53.98+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:53.98+02', '2022-05-31 20:51:53.98+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (157, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:55.125+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:51:55.126+02', '2022-05-31 20:51:55.126+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (158, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:55.318+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:55.318+02', '2022-05-31 20:51:55.318+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (159, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:57.882+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:57.882+02', '2022-05-31 20:51:57.882+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (160, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:58.816+02', 'http://localhost:4000/cities/getCities', '2022-05-31 20:51:58.816+02', '2022-05-31 20:51:58.816+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (161, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:51:58.848+02', 'http://localhost:4000/event/fetchEvent?event_id=981896f14f0342c6ff2589c2dcb688e0e90fcda4&city_id=paris', '2022-05-31 20:51:58.848+02', '2022-05-31 20:51:58.848+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (162, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 20:52:12.292+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 20:52:12.292+02', '2022-05-31 20:52:12.292+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (163, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-31 21:05:29.575+02', 'http://localhost:3000/theme/deleteTheme', '2022-05-31 21:05:29.575+02', '2022-05-31 21:05:29.575+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (164, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-31 21:06:54.142+02', 'http://localhost:3000/theme/createTheme', '2022-05-31 21:06:54.142+02', '2022-05-31 21:06:54.142+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (165, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:07:01.61+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:07:01.61+02', '2022-05-31 21:07:01.61+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (166, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:07:01.766+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:07:01.767+02', '2022-05-31 21:07:01.767+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (167, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:25.619+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:09:25.619+02', '2022-05-31 21:09:25.619+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (168, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:25.729+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:09:25.73+02', '2022-05-31 21:09:25.73+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (169, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:35.017+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:09:35.017+02', '2022-05-31 21:09:35.017+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (170, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:36.281+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:09:36.281+02', '2022-05-31 21:09:36.281+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (171, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:37.036+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:09:37.036+02', '2022-05-31 21:09:37.036+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (172, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:37.557+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 21:09:37.557+02', '2022-05-31 21:09:37.557+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (173, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:38.678+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=75', '2022-05-31 21:09:38.678+02', '2022-05-31 21:09:38.678+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (174, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:39.243+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=90', '2022-05-31 21:09:39.243+02', '2022-05-31 21:09:39.243+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (175, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:40.236+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=105', '2022-05-31 21:09:40.236+02', '2022-05-31 21:09:40.236+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (176, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:40.488+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=120', '2022-05-31 21:09:40.489+02', '2022-05-31 21:09:40.489+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (177, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:41.17+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=135', '2022-05-31 21:09:41.17+02', '2022-05-31 21:09:41.17+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (178, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:41.937+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=150', '2022-05-31 21:09:41.937+02', '2022-05-31 21:09:41.937+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (179, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:43.122+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=165', '2022-05-31 21:09:43.122+02', '2022-05-31 21:09:43.122+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (180, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:44.204+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=180', '2022-05-31 21:09:44.204+02', '2022-05-31 21:09:44.204+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (181, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:44.896+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=195', '2022-05-31 21:09:44.896+02', '2022-05-31 21:09:44.896+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (182, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:46.467+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=210', '2022-05-31 21:09:46.467+02', '2022-05-31 21:09:46.467+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (183, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:46.762+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=225', '2022-05-31 21:09:46.762+02', '2022-05-31 21:09:46.762+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (184, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:47.821+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=240', '2022-05-31 21:09:47.821+02', '2022-05-31 21:09:47.821+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (185, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:48.166+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=255', '2022-05-31 21:09:48.166+02', '2022-05-31 21:09:48.166+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (186, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:49.004+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=270', '2022-05-31 21:09:49.004+02', '2022-05-31 21:09:49.004+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (187, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:49.524+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=285', '2022-05-31 21:09:49.524+02', '2022-05-31 21:09:49.524+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (188, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:50.588+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=300', '2022-05-31 21:09:50.588+02', '2022-05-31 21:09:50.588+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (189, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:51.016+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=315', '2022-05-31 21:09:51.016+02', '2022-05-31 21:09:51.016+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (190, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:51.889+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=330', '2022-05-31 21:09:51.889+02', '2022-05-31 21:09:51.889+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (191, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:52.275+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=345', '2022-05-31 21:09:52.276+02', '2022-05-31 21:09:52.276+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (192, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:53.449+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=360', '2022-05-31 21:09:53.449+02', '2022-05-31 21:09:53.449+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (193, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:53.936+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=375', '2022-05-31 21:09:53.936+02', '2022-05-31 21:09:53.936+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (194, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:54.822+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=390', '2022-05-31 21:09:54.823+02', '2022-05-31 21:09:54.823+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (195, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:55.231+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=405', '2022-05-31 21:09:55.231+02', '2022-05-31 21:09:55.231+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (196, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:56.557+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=420', '2022-05-31 21:09:56.557+02', '2022-05-31 21:09:56.557+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (197, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:57.718+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=435', '2022-05-31 21:09:57.718+02', '2022-05-31 21:09:57.718+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (198, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:58.954+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=450', '2022-05-31 21:09:58.954+02', '2022-05-31 21:09:58.954+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (199, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:09:59.5+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=465', '2022-05-31 21:09:59.5+02', '2022-05-31 21:09:59.5+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (200, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:10:01.624+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=480', '2022-05-31 21:10:01.625+02', '2022-05-31 21:10:01.625+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (201, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:10:02.119+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=495', '2022-05-31 21:10:02.119+02', '2022-05-31 21:10:02.119+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (202, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:10:03.55+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=510', '2022-05-31 21:10:03.55+02', '2022-05-31 21:10:03.55+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (203, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:10:11.655+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=525', '2022-05-31 21:10:11.655+02', '2022-05-31 21:10:11.655+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (204, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:10:12.588+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=540', '2022-05-31 21:10:12.588+02', '2022-05-31 21:10:12.588+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (205, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:03.889+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:12:03.889+02', '2022-05-31 21:12:03.889+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (206, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:03.979+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:12:03.979+02', '2022-05-31 21:12:03.979+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (207, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:09.234+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:12:09.234+02', '2022-05-31 21:12:09.234+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (208, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:09.443+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:12:09.443+02', '2022-05-31 21:12:09.443+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (209, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:27.45+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:12:27.45+02', '2022-05-31 21:12:27.45+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (210, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:36.822+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:12:36.823+02', '2022-05-31 21:12:36.823+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (211, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:36.828+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:12:36.828+02', '2022-05-31 21:12:36.828+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (212, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:38.252+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:12:38.252+02', '2022-05-31 21:12:38.252+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (213, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:39.165+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:12:39.165+02', '2022-05-31 21:12:39.165+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (214, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:41.203+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:12:41.203+02', '2022-05-31 21:12:41.203+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (215, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:53.537+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:12:53.537+02', '2022-05-31 21:12:53.537+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (216, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:53.538+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:12:53.538+02', '2022-05-31 21:12:53.538+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (217, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:12:55.549+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:12:55.55+02', '2022-05-31 21:12:55.55+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (218, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:06.632+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:13:06.632+02', '2022-05-31 21:13:06.632+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (219, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:06.897+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:13:06.897+02', '2022-05-31 21:13:06.897+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (220, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:34.332+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:13:34.332+02', '2022-05-31 21:13:34.332+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (221, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:34.333+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:13:34.333+02', '2022-05-31 21:13:34.333+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (222, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:39.187+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:13:39.188+02', '2022-05-31 21:13:39.188+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (223, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:40.19+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:13:40.191+02', '2022-05-31 21:13:40.191+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (224, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:43.485+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:13:43.485+02', '2022-05-31 21:13:43.485+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (225, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:13:52.326+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 21:13:52.326+02', '2022-05-31 21:13:52.326+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (226, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:10.204+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:14:10.204+02', '2022-05-31 21:14:10.204+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (227, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:10.364+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:14:10.364+02', '2022-05-31 21:14:10.364+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (228, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-31 21:14:29.766+02', 'http://localhost:3000/theme/createTheme', '2022-05-31 21:14:29.766+02', '2022-05-31 21:14:29.766+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (229, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:32.053+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:14:32.053+02', '2022-05-31 21:14:32.053+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (230, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:32.246+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:14:32.246+02', '2022-05-31 21:14:32.246+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (231, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:38.702+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:14:38.702+02', '2022-05-31 21:14:38.702+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (232, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:38.909+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:14:38.91+02', '2022-05-31 21:14:38.91+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (233, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-31 21:14:44.771+02', 'http://localhost:3000/theme/deleteTheme', '2022-05-31 21:14:44.771+02', '2022-05-31 21:14:44.771+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (234, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:45.96+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:14:45.961+02', '2022-05-31 21:14:45.961+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (235, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:14:46.17+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:14:46.17+02', '2022-05-31 21:14:46.17+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (236, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-31 21:16:12.749+02', 'http://localhost:3000/theme/createTheme', '2022-05-31 21:16:12.749+02', '2022-05-31 21:16:12.749+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (237, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:16:16.225+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:16:16.225+02', '2022-05-31 21:16:16.225+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (238, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:16:16.36+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:16:16.36+02', '2022-05-31 21:16:16.36+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (239, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:16:49.587+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:16:49.588+02', '2022-05-31 21:16:49.588+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (240, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:16:49.789+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:16:49.789+02', '2022-05-31 21:16:49.789+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (241, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:17:02.448+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:17:02.448+02', '2022-05-31 21:17:02.448+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (242, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:17:02.494+02', 'http://localhost:4000/event/fetchEvent?event_id=dc2e25f77b232bab7171492b5e96e21a46e7a2ca&city_id=paris', '2022-05-31 21:17:02.495+02', '2022-05-31 21:17:02.495+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (243, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:17:02.943+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:17:02.943+02', '2022-05-31 21:17:02.943+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (244, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:17:06.697+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:17:06.697+02', '2022-05-31 21:17:06.697+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (245, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:17:25.705+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:17:25.705+02', '2022-05-31 21:17:25.705+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (246, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:17:37.871+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:17:37.871+02', '2022-05-31 21:17:37.871+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (247, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:17:38.998+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 21:17:38.998+02', '2022-05-31 21:17:38.998+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (248, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:18.058+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:18:18.058+02', '2022-05-31 21:18:18.058+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (249, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:18.181+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:18:18.181+02', '2022-05-31 21:18:18.181+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (250, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:22.18+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:18:22.18+02', '2022-05-31 21:18:22.18+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (251, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:22.958+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:18:22.958+02', '2022-05-31 21:18:22.958+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (252, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:24.454+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:18:24.456+02', '2022-05-31 21:18:24.456+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (253, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:24.722+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 21:18:24.722+02', '2022-05-31 21:18:24.722+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (254, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:26.027+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=75', '2022-05-31 21:18:26.027+02', '2022-05-31 21:18:26.027+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (255, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:38.113+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=90', '2022-05-31 21:18:38.113+02', '2022-05-31 21:18:38.113+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (256, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:51.288+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=105', '2022-05-31 21:18:51.288+02', '2022-05-31 21:18:51.288+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (257, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:54.836+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=120', '2022-05-31 21:18:54.836+02', '2022-05-31 21:18:54.836+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (258, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:56.741+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=135', '2022-05-31 21:18:56.741+02', '2022-05-31 21:18:56.741+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (259, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:58.253+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=150', '2022-05-31 21:18:58.254+02', '2022-05-31 21:18:58.254+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (260, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:18:59.155+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=165', '2022-05-31 21:18:59.155+02', '2022-05-31 21:18:59.155+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (261, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:02.428+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=180', '2022-05-31 21:19:02.429+02', '2022-05-31 21:19:02.429+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (262, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:03.355+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=195', '2022-05-31 21:19:03.355+02', '2022-05-31 21:19:03.355+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (263, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:05.609+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=210', '2022-05-31 21:19:05.609+02', '2022-05-31 21:19:05.609+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (264, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:06.615+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=225', '2022-05-31 21:19:06.615+02', '2022-05-31 21:19:06.615+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (265, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:08.876+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=240', '2022-05-31 21:19:08.876+02', '2022-05-31 21:19:08.876+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (266, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:10.9+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=255', '2022-05-31 21:19:10.901+02', '2022-05-31 21:19:10.901+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (267, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:12.603+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=270', '2022-05-31 21:19:12.603+02', '2022-05-31 21:19:12.603+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (268, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:15.345+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=285', '2022-05-31 21:19:15.346+02', '2022-05-31 21:19:15.346+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (269, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:22.014+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=300', '2022-05-31 21:19:22.014+02', '2022-05-31 21:19:22.014+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (270, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:19:24.093+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=315', '2022-05-31 21:19:24.093+02', '2022-05-31 21:19:24.093+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (271, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:20:39.06+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:20:39.061+02', '2022-05-31 21:20:39.061+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (272, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:20:39.165+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:20:39.165+02', '2022-05-31 21:20:39.165+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (273, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:20:43.312+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:20:43.312+02', '2022-05-31 21:20:43.312+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (274, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:20:44.293+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:20:44.294+02', '2022-05-31 21:20:44.294+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (275, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:20:46.296+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:20:46.297+02', '2022-05-31 21:20:46.297+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (276, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:20:46.564+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 21:20:46.564+02', '2022-05-31 21:20:46.564+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (277, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:22:13.419+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:22:13.419+02', '2022-05-31 21:22:13.419+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (278, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:22:13.465+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:22:13.465+02', '2022-05-31 21:22:13.465+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (279, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:22:35.893+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:22:35.894+02', '2022-05-31 21:22:35.894+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (280, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:22:35.998+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:22:35.998+02', '2022-05-31 21:22:35.998+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (281, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:22:47.824+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:22:47.825+02', '2022-05-31 21:22:47.825+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (282, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:22:47.987+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:22:47.987+02', '2022-05-31 21:22:47.987+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (283, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:23:04.56+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:23:04.561+02', '2022-05-31 21:23:04.561+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (284, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:23:04.692+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:23:04.692+02', '2022-05-31 21:23:04.692+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (285, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:23:32.758+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:23:32.759+02', '2022-05-31 21:23:32.759+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (286, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:23:32.913+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:23:32.913+02', '2022-05-31 21:23:32.913+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (287, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:23:50.967+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:23:50.968+02', '2022-05-31 21:23:50.968+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (288, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:23:51.099+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:23:51.099+02', '2022-05-31 21:23:51.099+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (289, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:24:40.941+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:24:40.942+02', '2022-05-31 21:24:40.942+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (290, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:24:41.059+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:24:41.059+02', '2022-05-31 21:24:41.059+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (291, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:25:02.479+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:25:02.48+02', '2022-05-31 21:25:02.48+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (292, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:25:02.629+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:25:02.629+02', '2022-05-31 21:25:02.629+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (293, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:26:04.296+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:26:04.297+02', '2022-05-31 21:26:04.297+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (294, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:26:04.353+02', 'http://localhost:4000/event/fetchEvent?event_id=e8b2ac4c1cad3296f0350f4b2e698804b791be2f&city_id=paris', '2022-05-31 21:26:04.353+02', '2022-05-31 21:26:04.353+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (295, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:26:04.691+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:26:04.691+02', '2022-05-31 21:26:04.691+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (296, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTM5MzE1NDgsImV4cCI6MTY1NjYwOTk0OH0.tSiBiBqM2ijPpNmWu4MW-Uym8xgK2zAfu9KMBXpHyuE', 'PostmanRuntime/7.29.0', 'localhost:3000', '2022-05-31 21:26:59.681+02', 'http://localhost:3000/theme/createTheme', '2022-05-31 21:26:59.681+02', '2022-05-31 21:26:59.681+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (297, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:14.434+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:27:14.435+02', '2022-05-31 21:27:14.435+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (298, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:14.531+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:27:14.531+02', '2022-05-31 21:27:14.531+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (299, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:19.504+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:27:19.504+02', '2022-05-31 21:27:19.504+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (300, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:34.661+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:27:34.661+02', '2022-05-31 21:27:34.661+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (301, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:35.44+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:27:35.44+02', '2022-05-31 21:27:35.44+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (302, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:36.307+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 21:27:36.307+02', '2022-05-31 21:27:36.307+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (303, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:37.08+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=75', '2022-05-31 21:27:37.081+02', '2022-05-31 21:27:37.081+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (304, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:37.774+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=90', '2022-05-31 21:27:37.774+02', '2022-05-31 21:27:37.774+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (305, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:38.67+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=105', '2022-05-31 21:27:38.67+02', '2022-05-31 21:27:38.67+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (306, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:39.905+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=120', '2022-05-31 21:27:39.905+02', '2022-05-31 21:27:39.905+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (307, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:40.652+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=135', '2022-05-31 21:27:40.652+02', '2022-05-31 21:27:40.652+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (308, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:41.011+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=150', '2022-05-31 21:27:41.011+02', '2022-05-31 21:27:41.011+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (309, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:41.932+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=165', '2022-05-31 21:27:41.932+02', '2022-05-31 21:27:41.932+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (310, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:42.907+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=180', '2022-05-31 21:27:42.907+02', '2022-05-31 21:27:42.907+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (311, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:44.508+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=195', '2022-05-31 21:27:44.508+02', '2022-05-31 21:27:44.508+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (312, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:46.287+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=210', '2022-05-31 21:27:46.287+02', '2022-05-31 21:27:46.287+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (313, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:27:48.636+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=225', '2022-05-31 21:27:48.636+02', '2022-05-31 21:27:48.636+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (314, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:06.369+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:29:06.37+02', '2022-05-31 21:29:06.37+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (315, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:06.442+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:29:06.443+02', '2022-05-31 21:29:06.443+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (316, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:10.22+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:29:10.22+02', '2022-05-31 21:29:10.22+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (317, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:10.361+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:29:10.361+02', '2022-05-31 21:29:10.361+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (318, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:17.359+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:29:17.359+02', '2022-05-31 21:29:17.359+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (319, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:17.516+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:29:17.516+02', '2022-05-31 21:29:17.516+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (320, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:28.07+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:29:28.07+02', '2022-05-31 21:29:28.07+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (321, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:28.56+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:29:28.56+02', '2022-05-31 21:29:28.56+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (322, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:38.476+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:29:38.476+02', '2022-05-31 21:29:38.476+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (323, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:39.485+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 21:29:39.486+02', '2022-05-31 21:29:39.486+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (324, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:41.15+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=75', '2022-05-31 21:29:41.15+02', '2022-05-31 21:29:41.15+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (325, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:42.526+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=90', '2022-05-31 21:29:42.526+02', '2022-05-31 21:29:42.526+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (326, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:44.222+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=105', '2022-05-31 21:29:44.222+02', '2022-05-31 21:29:44.222+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (327, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:45.159+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=120', '2022-05-31 21:29:45.159+02', '2022-05-31 21:29:45.159+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (328, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:29:46.949+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=135', '2022-05-31 21:29:46.949+02', '2022-05-31 21:29:46.949+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (329, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:00.049+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=150', '2022-05-31 21:30:00.049+02', '2022-05-31 21:30:00.049+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (330, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:01.031+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=165', '2022-05-31 21:30:01.031+02', '2022-05-31 21:30:01.031+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (331, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:01.946+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=180', '2022-05-31 21:30:01.946+02', '2022-05-31 21:30:01.946+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (332, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:02.999+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=195', '2022-05-31 21:30:02.999+02', '2022-05-31 21:30:02.999+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (333, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:03.561+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=210', '2022-05-31 21:30:03.562+02', '2022-05-31 21:30:03.562+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (334, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:04.583+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=225', '2022-05-31 21:30:04.583+02', '2022-05-31 21:30:04.583+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (335, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:05.716+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=240', '2022-05-31 21:30:05.716+02', '2022-05-31 21:30:05.716+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (336, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:07.018+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=255', '2022-05-31 21:30:07.018+02', '2022-05-31 21:30:07.018+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (337, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:39.785+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:30:39.785+02', '2022-05-31 21:30:39.785+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (338, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:30:39.794+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:30:39.794+02', '2022-05-31 21:30:39.794+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (339, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjU0MzksImV4cCI6MTY1NjcwMzgzOX0.c78NRMX-zOUPaJrRXAIftDFmk6VgAZfHFhkC83p-5aM', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:31:20.313+02', 'http://localhost:4000/user/getUsers', '2022-05-31 21:31:20.313+02', '2022-05-31 21:31:20.313+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (340, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjU0MzksImV4cCI6MTY1NjcwMzgzOX0.c78NRMX-zOUPaJrRXAIftDFmk6VgAZfHFhkC83p-5aM', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:31:20.323+02', 'http://localhost:4000/role/getAllRoles', '2022-05-31 21:31:20.323+02', '2022-05-31 21:31:20.323+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (341, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:31:20.747+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:31:20.747+02', '2022-05-31 21:31:20.747+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (342, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjU0MzksImV4cCI6MTY1NjcwMzgzOX0.c78NRMX-zOUPaJrRXAIftDFmk6VgAZfHFhkC83p-5aM', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:03.094+02', 'http://localhost:4000/cities/create', '2022-05-31 21:33:03.094+02', '2022-05-31 21:33:03.094+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (343, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:08.175+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:33:08.176+02', '2022-05-31 21:33:08.176+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (344, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjU1ODgsImV4cCI6MTY1NjcwMzk4OH0.Hz-p9VgyLPPZNlu188C-O56fEI8wozc1tUZK6R-88xE', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:08.267+02', 'http://localhost:4000/user/getUsers', '2022-05-31 21:33:08.267+02', '2022-05-31 21:33:08.267+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (345, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjU1ODgsImV4cCI6MTY1NjcwMzk4OH0.Hz-p9VgyLPPZNlu188C-O56fEI8wozc1tUZK6R-88xE', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:08.28+02', 'http://localhost:4000/role/getAllRoles', '2022-05-31 21:33:08.28+02', '2022-05-31 21:33:08.28+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (346, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:08.873+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:33:08.874+02', '2022-05-31 21:33:08.874+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (347, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:11.438+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 21:33:11.438+02', '2022-05-31 21:33:11.438+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (348, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:15.045+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:33:15.045+02', '2022-05-31 21:33:15.045+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (349, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:15.045+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:33:15.046+02', '2022-05-31 21:33:15.046+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (350, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:26.334+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 21:33:26.335+02', '2022-05-31 21:33:26.335+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (351, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:31.967+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 21:33:31.967+02', '2022-05-31 21:33:31.967+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (352, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:43.824+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:33:43.824+02', '2022-05-31 21:33:43.824+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (353, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:43.839+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:33:43.839+02', '2022-05-31 21:33:43.839+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (354, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:33:49.143+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 21:33:49.143+02', '2022-05-31 21:33:49.143+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (355, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:35:18.575+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:35:18.576+02', '2022-05-31 21:35:18.576+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (356, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:35:18.581+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:35:18.581+02', '2022-05-31 21:35:18.581+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (357, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:35:23.235+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:35:23.235+02', '2022-05-31 21:35:23.235+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (358, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:36:11.021+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=30', '2022-05-31 21:36:11.021+02', '2022-05-31 21:36:11.021+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (359, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:36:16.906+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 21:36:16.906+02', '2022-05-31 21:36:16.906+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (360, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:08.111+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:37:08.111+02', '2022-05-31 21:37:08.111+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (361, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:08.115+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:37:08.116+02', '2022-05-31 21:37:08.116+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (362, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:09.56+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:37:09.56+02', '2022-05-31 21:37:09.56+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (363, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:09.563+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:37:09.563+02', '2022-05-31 21:37:09.563+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (364, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:20.922+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:37:20.922+02', '2022-05-31 21:37:20.922+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (365, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:20.926+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:37:20.926+02', '2022-05-31 21:37:20.926+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (366, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:31.871+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:37:31.871+02', '2022-05-31 21:37:31.871+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (367, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:31.874+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:37:31.874+02', '2022-05-31 21:37:31.874+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (368, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:45.583+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:37:45.583+02', '2022-05-31 21:37:45.583+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (369, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:45.588+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:37:45.589+02', '2022-05-31 21:37:45.589+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (370, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:46.989+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:37:46.989+02', '2022-05-31 21:37:46.989+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (371, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:47.094+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:37:47.094+02', '2022-05-31 21:37:47.094+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (372, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:37:52.952+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 21:37:52.952+02', '2022-05-31 21:37:52.952+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (373, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:14.268+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:38:14.268+02', '2022-05-31 21:38:14.268+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (374, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:14.272+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:38:14.272+02', '2022-05-31 21:38:14.272+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (375, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:17.704+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:38:17.704+02', '2022-05-31 21:38:17.704+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (376, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:24.089+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 21:38:24.089+02', '2022-05-31 21:38:24.089+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (377, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:43.396+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:38:43.397+02', '2022-05-31 21:38:43.397+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (378, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:43.407+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:38:43.407+02', '2022-05-31 21:38:43.407+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (379, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:46.416+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:38:46.416+02', '2022-05-31 21:38:46.416+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (380, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:38:51.587+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 21:38:51.587+02', '2022-05-31 21:38:51.587+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (381, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:40:04.98+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:40:04.981+02', '2022-05-31 21:40:04.981+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (382, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:40:05.064+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:40:05.064+02', '2022-05-31 21:40:05.064+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (383, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:41:00.204+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:41:00.205+02', '2022-05-31 21:41:00.205+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (384, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:41:00.336+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:41:00.336+02', '2022-05-31 21:41:00.336+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (385, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:42:41.311+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:42:41.313+02', '2022-05-31 21:42:41.313+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (386, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:42:41.409+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:42:41.409+02', '2022-05-31 21:42:41.409+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (387, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:04.838+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:43:04.84+02', '2022-05-31 21:43:04.84+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (388, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:04.988+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:43:04.988+02', '2022-05-31 21:43:04.988+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (389, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:35.392+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:43:35.393+02', '2022-05-31 21:43:35.393+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (390, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:35.55+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:43:35.55+02', '2022-05-31 21:43:35.55+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (391, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:49.611+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:43:49.612+02', '2022-05-31 21:43:49.612+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (392, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:49.777+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:43:49.777+02', '2022-05-31 21:43:49.777+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (393, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:57.668+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:43:57.67+02', '2022-05-31 21:43:57.67+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (394, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:43:57.815+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:43:57.815+02', '2022-05-31 21:43:57.815+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (395, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:44:09.488+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:44:09.489+02', '2022-05-31 21:44:09.489+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (396, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:44:09.631+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:44:09.631+02', '2022-05-31 21:44:09.631+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (397, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:08.771+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:45:08.772+02', '2022-05-31 21:45:08.772+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (398, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:08.779+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:45:08.78+02', '2022-05-31 21:45:08.78+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (399, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:33.412+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:45:33.413+02', '2022-05-31 21:45:33.413+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (400, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:33.533+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:45:33.533+02', '2022-05-31 21:45:33.533+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (401, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:44.481+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:45:44.482+02', '2022-05-31 21:45:44.482+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (402, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:44.601+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:45:44.601+02', '2022-05-31 21:45:44.601+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (403, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:49.178+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:45:49.179+02', '2022-05-31 21:45:49.179+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (404, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:45:49.322+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:45:49.322+02', '2022-05-31 21:45:49.322+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (405, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:48:27.856+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:48:27.857+02', '2022-05-31 21:48:27.857+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (406, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:48:27.949+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:48:27.949+02', '2022-05-31 21:48:27.949+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (407, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:48:44.688+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:48:44.689+02', '2022-05-31 21:48:44.689+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (408, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:48:44.876+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:48:44.876+02', '2022-05-31 21:48:44.876+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (409, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:49:24.138+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:49:24.139+02', '2022-05-31 21:49:24.139+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (410, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:49:24.267+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:49:24.267+02', '2022-05-31 21:49:24.267+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (411, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:49:43.684+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:49:43.685+02', '2022-05-31 21:49:43.685+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (412, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:49:43.813+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:49:43.813+02', '2022-05-31 21:49:43.813+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (413, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:51:05.547+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:51:05.548+02', '2022-05-31 21:51:05.548+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (414, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:51:05.554+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:51:05.554+02', '2022-05-31 21:51:05.554+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (415, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:52:47.189+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:52:47.19+02', '2022-05-31 21:52:47.19+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (416, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:52:47.264+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:52:47.264+02', '2022-05-31 21:52:47.264+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (417, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:53:13.685+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:53:13.686+02', '2022-05-31 21:53:13.686+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (418, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:53:13.802+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:53:13.802+02', '2022-05-31 21:53:13.802+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (419, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:08.425+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:55:08.427+02', '2022-05-31 21:55:08.427+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (420, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:08.509+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:55:08.509+02', '2022-05-31 21:55:08.509+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (421, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:16.265+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:55:16.265+02', '2022-05-31 21:55:16.265+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (422, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:16.414+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:55:16.415+02', '2022-05-31 21:55:16.415+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (423, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:42.598+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:55:42.599+02', '2022-05-31 21:55:42.599+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (424, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:42.608+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:55:42.608+02', '2022-05-31 21:55:42.608+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (425, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:55.484+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:55:55.485+02', '2022-05-31 21:55:55.485+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (426, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:55:55.613+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:55:55.614+02', '2022-05-31 21:55:55.614+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (427, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:56:46.36+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:56:46.362+02', '2022-05-31 21:56:46.362+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (428, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:56:46.369+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:56:46.369+02', '2022-05-31 21:56:46.369+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (429, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:56:57.787+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:56:57.788+02', '2022-05-31 21:56:57.788+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (430, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:56:57.922+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:56:57.922+02', '2022-05-31 21:56:57.922+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (431, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:57:49.703+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:57:49.704+02', '2022-05-31 21:57:49.704+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (432, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:57:49.87+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 21:57:49.87+02', '2022-05-31 21:57:49.87+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (433, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:57:56.997+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:57:56.998+02', '2022-05-31 21:57:56.998+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (434, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:08.97+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:58:08.97+02', '2022-05-31 21:58:08.97+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (435, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:09.209+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:58:09.209+02', '2022-05-31 21:58:09.209+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (436, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:09.903+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:58:09.903+02', '2022-05-31 21:58:09.903+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (437, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:11.056+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:58:11.057+02', '2022-05-31 21:58:11.057+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (438, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:12.736+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:58:12.736+02', '2022-05-31 21:58:12.736+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (439, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:13.557+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:58:13.557+02', '2022-05-31 21:58:13.557+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (440, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:28.641+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:58:28.642+02', '2022-05-31 21:58:28.642+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (441, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:28.653+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:58:28.654+02', '2022-05-31 21:58:28.654+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (442, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:36.185+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 21:58:36.186+02', '2022-05-31 21:58:36.186+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (443, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:58:47.789+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 21:58:47.79+02', '2022-05-31 21:58:47.79+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (444, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:59:26.166+02', 'http://localhost:4000/cities/getCities', '2022-05-31 21:59:26.167+02', '2022-05-31 21:59:26.167+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (445, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 21:59:26.181+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 21:59:26.181+02', '2022-05-31 21:59:26.181+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (446, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjcxNjYsImV4cCI6MTY1NjcwNTU2Nn0.le34AflI7M6ydXZrbMwUIkmCx-u5U1K1m9RmUFfSNGw', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:00:05.395+02', 'http://localhost:4000/user/getUsers', '2022-05-31 22:00:05.395+02', '2022-05-31 22:00:05.395+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (447, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjcxNjYsImV4cCI6MTY1NjcwNTU2Nn0.le34AflI7M6ydXZrbMwUIkmCx-u5U1K1m9RmUFfSNGw', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:00:05.409+02', 'http://localhost:4000/role/getAllRoles', '2022-05-31 22:00:05.409+02', '2022-05-31 22:00:05.409+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (448, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:00:05.871+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:00:05.871+02', '2022-05-31 22:00:05.871+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (449, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjcxNjYsImV4cCI6MTY1NjcwNTU2Nn0.le34AflI7M6ydXZrbMwUIkmCx-u5U1K1m9RmUFfSNGw', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:44.091+02', 'http://localhost:4000/cities/create', '2022-05-31 22:02:44.091+02', '2022-05-31 22:02:44.091+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (450, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:48.007+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:02:48.008+02', '2022-05-31 22:02:48.008+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (451, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjczNjcsImV4cCI6MTY1NjcwNTc2N30.IXYaU1R8U9ulwx40-N1XWQogVj3aMdqhY7jklFoRp-c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:48.092+02', 'http://localhost:4000/user/getUsers', '2022-05-31 22:02:48.092+02', '2022-05-31 22:02:48.092+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (452, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjczNjcsImV4cCI6MTY1NjcwNTc2N30.IXYaU1R8U9ulwx40-N1XWQogVj3aMdqhY7jklFoRp-c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:48.104+02', 'http://localhost:4000/role/getAllRoles', '2022-05-31 22:02:48.104+02', '2022-05-31 22:02:48.104+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (453, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:48.49+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 22:02:48.49+02', '2022-05-31 22:02:48.49+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (454, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:51.101+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:02:51.102+02', '2022-05-31 22:02:51.102+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (455, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:53.845+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:02:53.845+02', '2022-05-31 22:02:53.845+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (456, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:54.498+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:02:54.498+02', '2022-05-31 22:02:54.498+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (457, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:54.915+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:02:54.916+02', '2022-05-31 22:02:54.916+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (458, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:56.07+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:02:56.07+02', '2022-05-31 22:02:56.07+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (459, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:56.629+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:02:56.629+02', '2022-05-31 22:02:56.629+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (460, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:02:58.388+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:02:58.388+02', '2022-05-31 22:02:58.388+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (461, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:00.809+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:03:00.809+02', '2022-05-31 22:03:00.809+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (462, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:18.261+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=15', '2022-05-31 22:03:18.261+02', '2022-05-31 22:03:18.261+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (463, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:33.163+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:33.163+02', '2022-05-31 22:03:33.163+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (464, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:35.783+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:35.783+02', '2022-05-31 22:03:35.783+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (465, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:36.242+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:36.242+02', '2022-05-31 22:03:36.242+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (466, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:36.51+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:36.51+02', '2022-05-31 22:03:36.51+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (467, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:36.941+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:36.941+02', '2022-05-31 22:03:36.941+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (468, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:37.386+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:37.387+02', '2022-05-31 22:03:37.387+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (469, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:37.641+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:37.641+02', '2022-05-31 22:03:37.641+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (470, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:39.304+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:39.304+02', '2022-05-31 22:03:39.304+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (471, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:39.746+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:39.746+02', '2022-05-31 22:03:39.746+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (472, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:03:40.009+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:03:40.01+02', '2022-05-31 22:03:40.01+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (473, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:08.176+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:04:08.176+02', '2022-05-31 22:04:08.176+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (474, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:08.18+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 22:04:08.18+02', '2022-05-31 22:04:08.18+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (475, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:09.806+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:04:09.806+02', '2022-05-31 22:04:09.806+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (476, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:10.006+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 22:04:10.007+02', '2022-05-31 22:04:10.007+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (477, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:11.526+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:04:11.526+02', '2022-05-31 22:04:11.526+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (478, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:12.128+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 22:04:12.129+02', '2022-05-31 22:04:12.129+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (479, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:13.04+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 22:04:13.04+02', '2022-05-31 22:04:13.04+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (480, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:13.752+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 22:04:13.753+02', '2022-05-31 22:04:13.753+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (481, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:22.357+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=75', '2022-05-31 22:04:22.358+02', '2022-05-31 22:04:22.358+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (482, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:23.819+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=90', '2022-05-31 22:04:23.819+02', '2022-05-31 22:04:23.819+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (483, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:24.722+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=102', '2022-05-31 22:04:24.722+02', '2022-05-31 22:04:24.722+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (484, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:50.92+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:04:50.92+02', '2022-05-31 22:04:50.92+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (485, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:04:50.923+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:04:50.923+02', '2022-05-31 22:04:50.923+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (486, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:01.534+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:05:01.534+02', '2022-05-31 22:05:01.534+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (487, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:01.536+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:05:01.536+02', '2022-05-31 22:05:01.536+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (488, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:37.219+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:05:37.219+02', '2022-05-31 22:05:37.219+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (489, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:37.222+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:05:37.222+02', '2022-05-31 22:05:37.222+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (490, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:38.902+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:05:38.902+02', '2022-05-31 22:05:38.902+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (491, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:38.908+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:05:38.909+02', '2022-05-31 22:05:38.909+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (492, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:41.146+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:05:41.146+02', '2022-05-31 22:05:41.146+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (493, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:43.531+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=15', '2022-05-31 22:05:43.531+02', '2022-05-31 22:05:43.531+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (494, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:43.796+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=30', '2022-05-31 22:05:43.796+02', '2022-05-31 22:05:43.796+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (495, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:44.214+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=45', '2022-05-31 22:05:44.214+02', '2022-05-31 22:05:44.214+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (496, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:05:45.145+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=60', '2022-05-31 22:05:45.145+02', '2022-05-31 22:05:45.145+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (497, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:04.905+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=75', '2022-05-31 22:10:04.905+02', '2022-05-31 22:10:04.905+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (498, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:05.718+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=14', '2022-05-31 22:10:05.718+02', '2022-05-31 22:10:05.718+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (499, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:07.114+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=29', '2022-05-31 22:10:07.114+02', '2022-05-31 22:10:07.114+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (500, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:07.415+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=42', '2022-05-31 22:10:07.415+02', '2022-05-31 22:10:07.415+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (501, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:08.306+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=55', '2022-05-31 22:10:08.306+02', '2022-05-31 22:10:08.306+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (502, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:08.593+02', 'http://localhost:4000/cities/fetchData?city_id=bordeaux&rows=15&start=67', '2022-05-31 22:10:08.593+02', '2022-05-31 22:10:08.593+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (503, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:15.08+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=81', '2022-05-31 22:10:15.08+02', '2022-05-31 22:10:15.08+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (504, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:17.684+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=81', '2022-05-31 22:10:17.684+02', '2022-05-31 22:10:17.684+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (505, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:33.443+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:10:33.443+02', '2022-05-31 22:10:33.443+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (506, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:33.47+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:10:33.47+02', '2022-05-31 22:10:33.47+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (507, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:51.711+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 22:10:51.711+02', '2022-05-31 22:10:51.711+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (508, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:52.969+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:10:52.969+02', '2022-05-31 22:10:52.969+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (509, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:10:52.97+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 22:10:52.97+02', '2022-05-31 22:10:52.97+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (510, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:13:50.6+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:13:50.601+02', '2022-05-31 22:13:50.601+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (511, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:13:50.67+02', 'http://localhost:4000/cities/fetchData?city_id=paris&rows=15&start=0', '2022-05-31 22:13:50.671+02', '2022-05-31 22:13:50.671+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (512, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:14:07.723+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=15', '2022-05-31 22:14:07.723+02', '2022-05-31 22:14:07.723+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (513, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:31:44.209+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:31:44.21+02', '2022-05-31 22:31:44.21+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (514, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:31:44.262+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:31:44.263+02', '2022-05-31 22:31:44.263+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (515, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:39:56.166+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:39:56.167+02', '2022-05-31 22:39:56.167+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (516, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:39:56.248+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:39:56.248+02', '2022-05-31 22:39:56.248+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (517, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:40:11.794+02', 'http://localhost:4000/cities/getCities', '2022-05-31 22:40:11.795+02', '2022-05-31 22:40:11.795+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (518, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:40:11.971+02', 'http://localhost:4000/cities/fetchData?city_id=lille&rows=15&start=0', '2022-05-31 22:40:11.971+02', '2022-05-31 22:40:11.971+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (519, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjk2MTEsImV4cCI6MTY1NjcwODAxMX0.mp0qAjazJvqXRpt29kRHhvsHJntoxlDgBc8I9GBUH-s', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:40:15.453+02', 'http://localhost:4000/user/setRecommandations', '2022-05-31 22:40:15.453+02', '2022-05-31 22:40:15.453+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (520, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3V1aWQiOiI2YWIxMWFhNi05ODRiLTRlYmUtODY2Ni1kZjU5ZDYwYWEyOTYiLCJpYXQiOjE2NTQwMjk2MTEsImV4cCI6MTY1NjcwODAxMX0.mp0qAjazJvqXRpt29kRHhvsHJntoxlDgBc8I9GBUH-s', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'localhost:4000', '2022-05-31 22:40:16.896+02', 'http://localhost:4000/user/setRecommandations', '2022-05-31 22:40:16.896+02', '2022-05-31 22:40:16.896+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (role_id, name, "createdAt", "updatedAt") VALUES (1, 'USER', '2022-05-30 18:15:28.71+02', '2022-05-30 18:15:28.71+02');
INSERT INTO public.roles (role_id, name, "createdAt", "updatedAt") VALUES (2, 'MODERATOR', '2022-05-30 18:15:28.71+02', '2022-05-30 18:15:28.71+02');
INSERT INTO public.roles (role_id, name, "createdAt", "updatedAt") VALUES (3, 'ADMIN', '2022-05-30 18:15:28.71+02', '2022-05-30 18:15:28.71+02');


--
-- Data for Name: saved_events; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: theme_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.theme_states (status_id, name, "createdAt", "updatedAt") VALUES (1, 'PUBLIC', '2022-05-30 18:15:28.71+02', '2022-05-30 18:15:28.71+02');
INSERT INTO public.theme_states (status_id, name, "createdAt", "updatedAt") VALUES (2, 'PRIVATE', '2022-05-30 18:15:28.71+02', '2022-05-30 18:15:28.71+02');


--
-- Data for Name: themed_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (1, '981896f14f0342c6ff2589c2dcb688e0e90fcda4', '2022-05-30 19:48:04.876+02', '2022-05-30 19:48:04.876+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (2, '6e2cc6081680335a451b82ef30831f505a533e1c', '2022-05-31 21:12:07.582+02', '2022-05-31 21:12:07.582+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (3, '390d796e028ea068c8a6250c34c935d7abaa93d4', '2022-05-31 21:12:24.879+02', '2022-05-31 21:12:24.879+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (4, 'd0c9b84902f4a9935756523ebe1066728cac2718', '2022-05-31 21:12:34.777+02', '2022-05-31 21:12:34.777+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (5, 'a89bdb28944b772d355a32d785e634085181fb81', '2022-05-31 21:12:50.81+02', '2022-05-31 21:12:50.81+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (6, '389db77b6cb891149c06935e890ef3c239a2e2ed', '2022-05-31 21:13:03.816+02', '2022-05-31 21:13:03.816+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (7, 'f714dd19ee2e43243eedc482af38d892537ca3c7', '2022-05-31 21:13:20.803+02', '2022-05-31 21:13:20.803+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (8, '142340382fca2c826b98ec14058c83e1b1d99ac8', '2022-05-31 21:13:49.9+02', '2022-05-31 21:13:49.9+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (9, '7db7766fda2c69318d678769b314f83a8e0e48ee', '2022-05-31 21:13:56.859+02', '2022-05-31 21:13:56.859+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (10, 'dc2e25f77b232bab7171492b5e96e21a46e7a2ca', '2022-05-31 21:17:00.236+02', '2022-05-31 21:17:00.236+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (11, '9e76b3b77e8599dd305f257322b7611c101d3ced', '2022-05-31 21:17:32.482+02', '2022-05-31 21:17:32.482+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (12, '48612a6e14091eb31b6ccd804d1a1a0450317adc', '2022-05-31 21:17:59.565+02', '2022-05-31 21:17:59.565+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (13, 'a89bdb28944b772d355a32d785e634085181fb81', '2022-05-31 21:18:15.314+02', '2022-05-31 21:18:15.314+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (14, 'c9167bf42bece738342039a5f09ff87a6cfcb66d', '2022-05-31 21:18:32.155+02', '2022-05-31 21:18:32.155+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (15, 'bddcc1b26882d3e10a7cd58d91bf3aa9c25920a2', '2022-05-31 21:28:04.565+02', '2022-05-31 21:28:04.565+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (16, '2050eed3ad5a1412a0000473b1c94c19709873a1', '2022-05-31 21:28:16.579+02', '2022-05-31 21:28:16.579+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (17, '014a3611e20de5d77e1b4d9833574630940db6dc', '2022-05-31 21:28:24.73+02', '2022-05-31 21:28:24.73+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (18, '47287b52d668bffbe3171288e60d128fa4a3662f', '2022-05-31 21:28:40.668+02', '2022-05-31 21:28:40.668+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (19, '7f364a2bba56d87d5ad5affd795ed9c6d823058f', '2022-05-31 21:28:55.575+02', '2022-05-31 21:28:55.575+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (20, '0a4fa63606d145d46224c2a7c4af39283ad32aed', '2022-05-31 21:29:03.549+02', '2022-05-31 21:29:03.549+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (21, 'b265c6e6cc3733394f5d658c5e23bf55aabd625f', '2022-05-31 21:30:19.55+02', '2022-05-31 21:30:19.55+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (22, '314ccf2d3178d6c1c84f72541a0ea8601be71d9a', '2022-05-31 21:30:37.41+02', '2022-05-31 21:30:37.41+02');


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (2, 'Les meilleurs évènements de Paris !', 'Si vous aimez parcourir la ville la nuit, découvrir des nouveaux bars insolites ou vous amuser de jour comme de nuit, ce thème est fait pour vous ! Parcourez les évènements et vous serez conquis.', '2022-05-31 21:06:54.145+02', '2022-05-31 21:09:20.593+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');
INSERT INTO public.themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (4, 'Le sport à Paris', 'Les sportifs n''ont qu''à se préparer ! Tous les évènements de sports (matchs, tournois, marathons, ...) sont ici.', '2022-05-31 21:16:12.751+02', '2022-05-31 21:16:47.45+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');
INSERT INTO public.themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (5, 'Pour les enfants', 'Et oui, on pense aussi à vos enfants chez Moov.', '2022-05-31 21:26:59.684+02', '2022-05-31 21:29:16.519+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_uuid, username, email, password, birthyear, "userRecommandations", "userEmailNotifications", "preferedRadius", "createdAt", "updatedAt", city_id) VALUES ('8a0f8b6b-c41c-4c79-9de3-b1a034511cad', 'admin', 'admin@gmail.com', '$2a$08$3WpW5qD/d38D26DLJu/YW.ONWc7jLl6G5wnqEBdwcOfQHYRHL9Y7G', 2012, false, false, 25, '2022-05-30 19:28:45.221+02', '2022-05-30 19:28:45.221+02', 'paris');
INSERT INTO public.users (user_uuid, username, email, password, birthyear, "userRecommandations", "userEmailNotifications", "preferedRadius", "createdAt", "updatedAt", city_id) VALUES ('6ab11aa6-984b-4ebe-8666-df59d60aa296', 'bastiansmn', 'bastian.somon@gmail.com', '$2a$08$mFRuzc8Hb.ThkFPVEfbCZe.m49evT51hTQ6jotUwG.Fi1urkC3NJu', 2001, false, false, 20, '2022-05-30 18:48:52.448+02', '2022-05-31 22:40:16.897+02', 'lille');


--
-- Name: link_saved_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.link_saved_user_id_seq', 1, false);


--
-- Name: link_theme_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.link_theme_events_id_seq', 1, false);


--
-- Name: requests_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requests_request_id_seq', 520, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 4, true);


--
-- Name: saved_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saved_events_id_seq', 1, false);


--
-- Name: theme_states_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theme_states_status_id_seq', 2, true);


--
-- Name: themed_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themed_events_id_seq', 22, true);


--
-- Name: themes_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_theme_id_seq', 5, true);


--
-- Name: cities cities_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: link_saved_user link_saved_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_saved_user
    ADD CONSTRAINT link_saved_user_pkey PRIMARY KEY (id, user_uuid);


--
-- Name: link_theme_events link_theme_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_theme_events
    ADD CONSTRAINT link_theme_events_pkey PRIMARY KEY (id, theme_id);


--
-- Name: link_user_roles link_user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_user_roles
    ADD CONSTRAINT link_user_roles_pkey PRIMARY KEY (role_id, user_uuid);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (request_id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: saved_events saved_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_events
    ADD CONSTRAINT saved_events_pkey PRIMARY KEY (id);


--
-- Name: theme_states theme_states_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theme_states
    ADD CONSTRAINT theme_states_name_key UNIQUE (name);


--
-- Name: theme_states theme_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theme_states
    ADD CONSTRAINT theme_states_pkey PRIMARY KEY (status_id);


--
-- Name: themed_events themed_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themed_events
    ADD CONSTRAINT themed_events_pkey PRIMARY KEY (id);


--
-- Name: themes themes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_name_key UNIQUE (name);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (theme_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: link_saved_user link_saved_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_saved_user
    ADD CONSTRAINT link_saved_user_id_fkey FOREIGN KEY (id) REFERENCES public.saved_events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: link_saved_user link_saved_user_user_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_saved_user
    ADD CONSTRAINT link_saved_user_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: link_theme_events link_theme_events_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_theme_events
    ADD CONSTRAINT link_theme_events_id_fkey FOREIGN KEY (id) REFERENCES public.themed_events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: link_theme_events link_theme_events_theme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_theme_events
    ADD CONSTRAINT link_theme_events_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES public.themes(theme_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: link_user_roles link_user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_user_roles
    ADD CONSTRAINT link_user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: link_user_roles link_user_roles_user_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_user_roles
    ADD CONSTRAINT link_user_roles_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests requests_user_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: saved_events saved_events_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_events
    ADD CONSTRAINT saved_events_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: themes themes_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: themes themes_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.theme_states(status_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: themes themes_user_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users users_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

