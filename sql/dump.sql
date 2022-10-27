--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
                               api_key character varying(255),
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
                               is_active boolean,
                               "createdAt" timestamp with time zone NOT NULL,
                               "updatedAt" timestamp with time zone NOT NULL
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

INSERT INTO public.cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('paris', 'Paris', 'https://opendata.paris.fr/api/records/1.0/search', NULL, 'que-faire-a-paris-', 'title', 'lead_text', 'cover_url', 'url', 'address_street', 'occurences', 'date_start', 'date_end', 'lat_lon', 'address_city', 'address_city', true, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('bordeaux', 'Bordeaux', 'https://opendata.bordeaux-metropole.fr/api/records/1.0/search', NULL, 'met_agenda', 'title_fr', 'html_fr', 'location_image', 'registrationurl', 'location_name', 'firstdate', 'firstdate', 'lastdate', 'location_coordinates', 'location_city', 'location_department', false, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('lille', 'Lille', 'https://opendata.lillemetropole.fr/api/records/1.0/search', 'bf437e9135e61c1e2cbfa3304b80b6d7293a779fac9c16dc8115dd6a', 'evenements-publics-openagenda', 'title_fr', 'longdescription_fr', 'image', 'canonicalurl', 'location_address', 'none', 'firstdate_begin', 'lastdate_end', 'location_coordinates', 'location_city', 'location_department', true, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('orleans', 'Orléans', 'https://data.orleans-metropole.fr/api/records/1.0/search', NULL, 'agenda-orleans-metropole', 'title_fr', 'longdescription_fr', 'image', 'canonicalurl', 'location_address', 'none', 'firstdate_begin', 'lastdate_end', 'location_coordinates', 'location_city', 'location_department', true, '2022-10-27 11:27:56.436+02', '2022-10-27 11:27:56.436+02');


--
-- Data for Name: link_saved_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.link_saved_user (id, "createdAt", "updatedAt", user_uuid) VALUES (1, '2022-10-27 11:38:39.682+02', '2022-10-27 11:38:39.682+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');


--
-- Data for Name: link_theme_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (2, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (3, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (4, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (5, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (6, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (7, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (8, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (9, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (10, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (11, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (12, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (13, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (14, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (15, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (16, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (17, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (18, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (19, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (20, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (21, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO public.link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (22, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);


--
-- Data for Name: link_user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 1, '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 3, '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 3, '8a0f8b6b-c41c-4c79-9de3-b1a034511cad');
INSERT INTO public.link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 1, '8a0f8b6b-c41c-4c79-9de3-b1a034511cad');


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (2, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'localhost:3000', '2022-10-27 11:47:18.229+02', 'http://localhost:3000/cities/getCities', '2022-10-27 11:47:18.229+02', '2022-10-27 11:47:18.229+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (3, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'localhost:3000', '2022-10-27 11:47:18.233+02', 'http://localhost:3000/cities/fetchData?city_id=orleans&rows=15&start=0', '2022-10-27 11:47:18.233+02', '2022-10-27 11:47:18.233+02', NULL);
INSERT INTO public.requests (request_id, jwt_used, user_agent, hostname, date, endpoint, "createdAt", "updatedAt", user_uuid) VALUES (4, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'localhost:3000', '2022-10-27 11:47:28.993+02', 'http://localhost:3000/cities/fetchData?city_id=paris&rows=15&start=14', '2022-10-27 11:47:28.993+02', '2022-10-27 11:47:28.993+02', NULL);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (role_id, name, "createdAt", "updatedAt") VALUES (1, 'USER', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.roles (role_id, name, "createdAt", "updatedAt") VALUES (2, 'MODERATOR', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.roles (role_id, name, "createdAt", "updatedAt") VALUES (3, 'ADMIN', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');


--
-- Data for Name: saved_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.saved_events (id, event_id, "createdAt", "updatedAt", city_id) VALUES (1, 'bf3bdfa12fe83f61e25059274006980de29b50de', '2022-10-27 11:38:39.67+02', '2022-10-27 11:38:39.67+02', 'orleans');


--
-- Data for Name: theme_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.theme_states (status_id, name, "createdAt", "updatedAt") VALUES (1, 'PUBLIC', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.theme_states (status_id, name, "createdAt", "updatedAt") VALUES (2, 'PRIVATE', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');


--
-- Data for Name: themed_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (1, '981896f14f0342c6ff2589c2dcb688e0e90fcda4', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (2, '6e2cc6081680335a451b82ef30831f505a533e1c', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (3, '390d796e028ea068c8a6250c34c935d7abaa93d4', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (4, 'd0c9b84902f4a9935756523ebe1066728cac2718', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (5, 'a89bdb28944b772d355a32d785e634085181fb81', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (6, '389db77b6cb891149c06935e890ef3c239a2e2ed', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (7, 'f714dd19ee2e43243eedc482af38d892537ca3c7', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (8, '142340382fca2c826b98ec14058c83e1b1d99ac8', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (9, '7db7766fda2c69318d678769b314f83a8e0e48ee', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (10, 'dc2e25f77b232bab7171492b5e96e21a46e7a2ca', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (11, '9e76b3b77e8599dd305f257322b7611c101d3ced', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (12, '48612a6e14091eb31b6ccd804d1a1a0450317adc', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (13, 'a89bdb28944b772d355a32d785e634085181fb81', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (14, 'c9167bf42bece738342039a5f09ff87a6cfcb66d', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (15, 'bddcc1b26882d3e10a7cd58d91bf3aa9c25920a2', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (16, '2050eed3ad5a1412a0000473b1c94c19709873a1', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (17, '014a3611e20de5d77e1b4d9833574630940db6dc', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (18, '47287b52d668bffbe3171288e60d128fa4a3662f', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (19, '7f364a2bba56d87d5ad5affd795ed9c6d823058f', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (20, '0a4fa63606d145d46224c2a7c4af39283ad32aed', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (21, 'b265c6e6cc3733394f5d658c5e23bf55aabd625f', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO public.themed_events (id, event_id, "createdAt", "updatedAt") VALUES (22, '314ccf2d3178d6c1c84f72541a0ea8601be71d9a', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (2, 'Les meilleurs évènements de Paris !', 'Si vous aimez parcourir la ville la nuit, découvrir des nouveaux bars insolites ou vous amuser de jour comme de nuit, ce thème est fait pour vous ! Parcourez les évènements et vous serez conquis.', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');
INSERT INTO public.themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (4, 'Le sport à Paris', 'Les sportifs n''ont qu''à se préparer ! Tous les évènements de sports (matchs, tournois, marathons, ...) sont ici.', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');
INSERT INTO public.themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (5, 'Pour les enfants', 'Et oui, on pense aussi à vos enfants chez Moov.', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_uuid, username, email, password, birthyear, "userRecommandations", "userEmailNotifications", "preferedRadius", "createdAt", "updatedAt", city_id) VALUES ('8a0f8b6b-c41c-4c79-9de3-b1a034511cad', 'admin', 'admin@gmail.com', '$2a$08$3WpW5qD/d38D26DLJu/YW.ONWc7jLl6G5wnqEBdwcOfQHYRHL9Y7G', 2012, false, false, 25, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 'paris');
INSERT INTO public.users (user_uuid, username, email, password, birthyear, "userRecommandations", "userEmailNotifications", "preferedRadius", "createdAt", "updatedAt", city_id) VALUES ('6ab11aa6-984b-4ebe-8666-df59d60aa296', 'bastiansmn', 'bastian.somon@gmail.com', '$2a$08$mFRuzc8Hb.ThkFPVEfbCZe.m49evT51hTQ6jotUwG.Fi1urkC3NJu', 2001, false, false, 20, '2022-10-27 10:42:10.162499+02', '2022-10-27 11:47:28.977+02', 'paris');


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

SELECT pg_catalog.setval('public.requests_request_id_seq', 4, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);


--
-- Name: saved_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saved_events_id_seq', 1, true);


--
-- Name: theme_states_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theme_states_status_id_seq', 1, false);


--
-- Name: themed_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themed_events_id_seq', 1, false);


--
-- Name: themes_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_theme_id_seq', 1, false);


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

