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

INSERT INTO users (user_uuid, username, email, password, birthyear, "userRecommandations", "userEmailNotifications", "preferedRadius", "createdAt", "updatedAt", city_id) VALUES ('8a0f8b6b-c41c-4c79-9de3-b1a034511cad', 'admin', 'admin@gmail.com', '$2a$08$3WpW5qD/d38D26DLJu/YW.ONWc7jLl6G5wnqEBdwcOfQHYRHL9Y7G', 2012, false, false, 25, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 'paris');
INSERT INTO users (user_uuid, username, email, password, birthyear, "userRecommandations", "userEmailNotifications", "preferedRadius", "createdAt", "updatedAt", city_id) VALUES ('6ab11aa6-984b-4ebe-8666-df59d60aa296', 'bastiansmn', 'bastian.somon@gmail.com', '$2a$08$mFRuzc8Hb.ThkFPVEfbCZe.m49evT51hTQ6jotUwG.Fi1urkC3NJu', 2001, false, false, 20, '2022-10-27 10:42:10.162499+02', '2022-10-27 11:36:43.412+02', 'orleans');


--
-- Data for Name: link_saved_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO link_saved_user (id, "createdAt", "updatedAt", user_uuid) VALUES (1, '2022-10-27 11:38:39.682+02', '2022-10-27 11:38:39.682+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296');


--
-- Data for Name: theme_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO theme_states (status_id, name, "createdAt", "updatedAt") VALUES (1, 'PUBLIC', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO theme_states (status_id, name, "createdAt", "updatedAt") VALUES (2, 'PRIVATE', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');


--
-- Data for Name: themed_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (1, '981896f14f0342c6ff2589c2dcb688e0e90fcda4', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (2, '6e2cc6081680335a451b82ef30831f505a533e1c', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (3, '390d796e028ea068c8a6250c34c935d7abaa93d4', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (4, 'd0c9b84902f4a9935756523ebe1066728cac2718', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (5, 'a89bdb28944b772d355a32d785e634085181fb81', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (6, '389db77b6cb891149c06935e890ef3c239a2e2ed', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (7, 'f714dd19ee2e43243eedc482af38d892537ca3c7', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (8, '142340382fca2c826b98ec14058c83e1b1d99ac8', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (9, '7db7766fda2c69318d678769b314f83a8e0e48ee', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (10, 'dc2e25f77b232bab7171492b5e96e21a46e7a2ca', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (11, '9e76b3b77e8599dd305f257322b7611c101d3ced', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (12, '48612a6e14091eb31b6ccd804d1a1a0450317adc', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (13, 'a89bdb28944b772d355a32d785e634085181fb81', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (14, 'c9167bf42bece738342039a5f09ff87a6cfcb66d', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (15, 'bddcc1b26882d3e10a7cd58d91bf3aa9c25920a2', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (16, '2050eed3ad5a1412a0000473b1c94c19709873a1', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (17, '014a3611e20de5d77e1b4d9833574630940db6dc', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (18, '47287b52d668bffbe3171288e60d128fa4a3662f', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (19, '7f364a2bba56d87d5ad5affd795ed9c6d823058f', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (20, '0a4fa63606d145d46224c2a7c4af39283ad32aed', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (21, 'b265c6e6cc3733394f5d658c5e23bf55aabd625f', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');
INSERT INTO themed_events (id, event_id, "createdAt", "updatedAt") VALUES (22, '314ccf2d3178d6c1c84f72541a0ea8601be71d9a', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02');


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (2, 'Les meilleurs évènements de Paris !', 'Si vous aimez parcourir la ville la nuit, découvrir des nouveaux bars insolites ou vous amuser de jour comme de nuit, ce thème est fait pour vous ! Parcourez les évènements et vous serez conquis.', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');
INSERT INTO themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (4, 'Le sport à Paris', 'Les sportifs n''ont qu''à se préparer ! Tous les évènements de sports (matchs, tournois, marathons, ...) sont ici.', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');
INSERT INTO themes (theme_id, name, description, "createdAt", "updatedAt", user_uuid, status_id, city_id) VALUES (5, 'Pour les enfants', 'Et oui, on pense aussi à vos enfants chez Moov.', '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', '6ab11aa6-984b-4ebe-8666-df59d60aa296', 1, 'paris');


--
-- Data for Name: link_theme_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (2, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (3, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (4, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (5, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (6, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (7, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (8, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (9, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 2);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (10, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (11, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (12, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (13, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (14, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 4);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (15, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (16, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (17, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (18, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (19, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (20, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (21, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);
INSERT INTO link_theme_events (id, "createdAt", "updatedAt", theme_id) VALUES (22, '2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 5);


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
INSERT INTO link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 3, '8a0f8b6b-c41c-4c79-9de3-b1a034511cad');
INSERT INTO link_user_roles ("createdAt", "updatedAt", role_id, user_uuid) VALUES ('2022-10-27 10:42:10.162499+02', '2022-10-27 10:42:10.162499+02', 1, '8a0f8b6b-c41c-4c79-9de3-b1a034511cad');

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

