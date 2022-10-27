--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('paris', 'Paris', 'https://opendata.paris.fr/api/records/1.0/search', NULL, 'que-faire-a-paris-', 'title', 'lead_text', 'cover_url', 'url', 'address_street', 'occurences', 'date_start', 'date_end', 'lat_lon', 'address_city', 'address_city', true, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('bordeaux', 'Bordeaux', 'https://opendata.bordeaux-metropole.fr/api/records/1.0/search', NULL, 'met_agenda', 'title_fr', 'html_fr', 'location_image', 'registrationurl', 'location_name', 'firstdate', 'firstdate', 'lastdate', 'location_coordinates', 'location_city', 'location_department', false, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('lille', 'Lille', 'https://opendata.lillemetropole.fr/api/records/1.0/search', 'bf437e9135e61c1e2cbfa3304b80b6d7293a779fac9c16dc8115dd6a', 'evenements-publics-openagenda', 'title_fr', 'longdescription_fr', 'image', 'canonicalurl', 'location_address', 'none', 'firstdate_begin', 'lastdate_end', 'location_coordinates', 'location_city', 'location_department', true, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO cities (city_id, name, api_base_link, api_key, dataset_name, title_field, description_field, image_field, url_field, placename_field, timing_field, date_start_field, date_end_field, latlon_field, city_field, district_field, is_active, "createdAt", "updatedAt") VALUES ('orleans', 'Orléans', 'https://data.orleans-metropole.fr/api/records/1.0/search', NULL, 'agenda-orleans-metropole', 'title_fr', 'longdescription_fr', 'image', 'canonicalurl', 'location_address', 'none', 'firstdate_begin', 'lastdate_end', 'location_coordinates', 'location_city', 'location_department', true, '2022-10-27 11:27:56.436+02', '2022-10-27 11:27:56.436+02');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (user_uuid, username, email, password, birthyear, "userRecommandations", "userEmailNotifications", "preferedRadius", "createdAt", "updatedAt", city_id) VALUES ('6ab11aa6-984b-4ebe-8666-df59d60aa296', 'bastiansmn', 'bastian.somon@gmail.com', '$2a$08$mFRuzc8Hb.ThkFPVEfbCZe.m49evT51hTQ6jotUwG.Fi1urkC3NJu', 2001, false, false, 20, '2022-10-27 10:42:10.162499+02', '2022-10-27 11:36:43.412+02', 'orleans');


--
-- Data for Name: theme_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO theme_states (status_id, name, "createdAt", "updatedAt") VALUES (1, 'PUBLIC', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO theme_states (status_id, name, "createdAt", "updatedAt") VALUES (2, 'PRIVATE', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO roles (role_id, name, "createdAt", "updatedAt") VALUES (1, 'USER', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO roles (role_id, name, "createdAt", "updatedAt") VALUES (2, 'MODERATOR', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO roles (role_id, name, "createdAt", "updatedAt") VALUES (3, 'ADMIN', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');


--
-- Data for Name: link_user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 1, '6ab11aa6-984b-4ebe-8666-df59d60aa296');
INSERT INTO link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 3, '6ab11aa6-984b-4ebe-8666-df59d60aa296');


--
-- Name: link_saved_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('link_saved_user_id_seq', 1, false);


--
-- Name: link_theme_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('link_theme_events_id_seq', 1, false);


--
-- Name: requests_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requests_request_id_seq', 1, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_role_id_seq', 1, false);


--
-- Name: saved_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('saved_events_id_seq', 1, true);


--
-- Name: theme_states_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theme_states_status_id_seq', 1, false);


--
-- Name: themed_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('themed_events_id_seq', 1, false);


--
-- Name: themes_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('themes_theme_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

