--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: favorite; Type: TABLE; Schema: public; Owner: rhaast
--

CREATE TABLE public.favorite (
    id integer NOT NULL,
    user_id integer,
    resort_id integer,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.favorite OWNER TO rhaast;

--
-- Name: favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: rhaast
--

CREATE SEQUENCE public.favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_id_seq OWNER TO rhaast;

--
-- Name: favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhaast
--

ALTER SEQUENCE public.favorite_id_seq OWNED BY public.favorite.id;


--
-- Name: resort; Type: TABLE; Schema: public; Owner: rhaast
--

CREATE TABLE public.resort (
    id integer NOT NULL,
    name text NOT NULL,
    state text NOT NULL,
    lifts integer,
    runs integer,
    acres double precision,
    green_percent double precision,
    green_acres double precision,
    blue_percent double precision,
    blue_acres double precision,
    black_percent double precision,
    black_acres double precision,
    lat double precision NOT NULL,
    lon double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.resort OWNER TO rhaast;

--
-- Name: resort_id_seq; Type: SEQUENCE; Schema: public; Owner: rhaast
--

CREATE SEQUENCE public.resort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resort_id_seq OWNER TO rhaast;

--
-- Name: resort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhaast
--

ALTER SEQUENCE public.resort_id_seq OWNED BY public.resort.id;


--
-- Name: search; Type: TABLE; Schema: public; Owner: rhaast
--

CREATE TABLE public.search (
    id integer NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    user_id integer,
    resort_id integer
);


ALTER TABLE public.search OWNER TO rhaast;

--
-- Name: search_id_seq; Type: SEQUENCE; Schema: public; Owner: rhaast
--

CREATE SEQUENCE public.search_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_id_seq OWNER TO rhaast;

--
-- Name: search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhaast
--

ALTER SEQUENCE public.search_id_seq OWNED BY public.search.id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: rhaast
--

CREATE TABLE public.state (
    id integer NOT NULL,
    name character varying NOT NULL,
    abbr character varying NOT NULL
);


ALTER TABLE public.state OWNER TO rhaast;

--
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: rhaast
--

CREATE SEQUENCE public.state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_id_seq OWNER TO rhaast;

--
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhaast
--

ALTER SEQUENCE public.state_id_seq OWNED BY public.state.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: rhaast
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    email text,
    state text NOT NULL,
    password text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO rhaast;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: rhaast
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO rhaast;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhaast
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: favorite id; Type: DEFAULT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.favorite ALTER COLUMN id SET DEFAULT nextval('public.favorite_id_seq'::regclass);


--
-- Name: resort id; Type: DEFAULT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.resort ALTER COLUMN id SET DEFAULT nextval('public.resort_id_seq'::regclass);


--
-- Name: search id; Type: DEFAULT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.search ALTER COLUMN id SET DEFAULT nextval('public.search_id_seq'::regclass);


--
-- Name: state id; Type: DEFAULT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.state ALTER COLUMN id SET DEFAULT nextval('public.state_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: rhaast
--

COPY public.favorite (id, user_id, resort_id, "timestamp") FROM stdin;
7	10	540	2022-04-04 21:09:06.829805
12	10	261	2022-04-08 21:29:46.747887
13	10	480	2022-04-09 17:23:22.081878
14	10	255	2022-04-09 17:32:48.946431
15	1	332	2022-04-09 21:41:23.817139
16	1	294	2022-04-09 21:42:21.569171
17	1	268	2022-04-09 21:42:57.196636
18	1	332	2022-04-09 21:44:09.480049
19	1	255	2022-04-09 21:45:21.717098
20	1	247	2022-04-10 00:54:33.304092
21	11	566	2022-04-10 14:35:24.670599
22	11	255	2022-04-10 22:37:58.454084
23	1	500	2022-04-18 21:51:28.673667
\.


--
-- Data for Name: resort; Type: TABLE DATA; Schema: public; Owner: rhaast
--

COPY public.resort (id, name, state, lifts, runs, acres, green_percent, green_acres, blue_percent, blue_acres, black_percent, black_acres, lat, lon, created_at, updated_at) FROM stdin;
247	49(degrees) North WA	Washington	6	68	2325	0.3	697.5	0.4	930	0.3	697.5	49	-115.84	\N	\N
248	Afton Alps MN	Minnesota	21	48	300	0.2	60	0.6	180	0.2	60	44.85	-92.79	\N	\N
249	Alpine Meadows CA	California	13	100	2400	0.25	600	0.4	960	0.35	840	39.17	-120.22	\N	\N
250	Alpine Mountain PA	Pennsylvania	3	21	120	0.17	20.4	0.55	66	0.28	33.6	40.08	-76.9	\N	\N
251	Alpine Valley MI	Michigan	14	25	118	0.39	46.02	0.26	30.68	0.35	41.3	44.96	-84.87	\N	\N
252	Alpine Valley OH	Ohio	6	11	72	0.33	23.76	0.34	24.48	0.33	23.76	40.31	-83.68	\N	\N
253	Alpine Valley WI	Wisconsin	16	20	90	0.4	36	0.4	36	0.2	18	42.45	-88.25	\N	\N
254	Alta UT	Utah	11	116	2200	0.25	550	0.4	880	0.35	770	40.6	-111.64	\N	\N
255	Alyeska AK	Alaska	9	73	1500	0.11	165	0.52	780	0.37	555	60.97	-149.11	\N	\N
256	Andes Tower MN	Minnesota	4	16	45	0.35	15.75	0.35	15.75	0.3	13.5	46.73	-94.69	\N	\N
257	Angel Fire NM	New Mexico	7	77	560	0.26	145.6	0.5	280	0.24	134.4	36.39	-105.29	\N	\N
258	Anthony Lakes OR	Oregon	3	21	1100	0.2	220	0.38	418	0.42	462	44.97	-118.23	\N	\N
259	Appalachian NC	North Carolina	6	12	22	0.18	3.96	0.55	12.1	0.27	5.94	41.29	-76.57	\N	\N
260	Apple Mountain MI	Michigan	5	12	40	0.4	16	0.4	16	0.2	8	43.46	-84.1	\N	\N
261	Arapahoe Basin CO	Colorado	7	105	900	0.1	90	0.3	270	0.6	540	39.72	-104.79	\N	\N
262	Arctic Valley AK	Alaska	4	25	320	0.2	64	0.5	160	0.3	96	61.24	-149.61	\N	\N
263	Arizona Snowball AZ	Arizona 	6	40	777	0.37	287.49	0.42	326.34	0.21	163.17	35.32782	-111.69517	\N	\N
264	Aspen Highlands CO	Colorado	5	118	1028	0.18	185.04	0.3	308.4	0.52	534.56	39.12	-106.85	\N	\N
265	Aspen Mt CO	Colorado	8	76	673	0	0	0.48	323.04	0.52	349.96	39.17	-106.82	\N	\N
266	Attitash NH	New Hampshire 	11	76	310	0.2	62	0.47	145.7	0.33	102.3	44.09	-71.21	\N	\N
267	Badger Mountain WA	Washington	3	5	20	0.33	6.6	0.34	6.8	0.33	6.6	47.59	-120.19	\N	\N
268	Bald Mountain ID	Idaho	2	\N	140	0.25	35	0.4	56	0.35	49	44.37	-114.35	\N	\N
269	Bear Creek Mountain PA	Pennsylvania	6	21	86	0.3	25.8	0.4	34.4	0.3	25.8	41.21	-75.68	\N	\N
270	Bear Mountain CA	California	12	\N	748	0.3	224.4	0.4	299.2	0.3	224.4	37.1	-119.1	\N	\N
271	Bear Paw MT	Montana	1	11	80	0.25	20	0.25	20	0.5	40	41.78	-123.66	\N	\N
272	Bear Valley Mt CA	California	9	75	1680	0.25	420	0.4	672	0.35	588	39.2	-122.44	\N	\N
273	Bears Den ND	North Dakota	3	8	30	0.25	7.5	0.5	15	0.25	7.5	46.53	-97.95	\N	\N
274	Beaver Creek CO	Colorado	25	149	1832	0.19	348.08	0.64	1172.48	0.17	311.44	39.61	-106.53	\N	\N
275	Beaver Mt UT	Utah	5	47	828	0.25	207	0.4	331.2	0.35	289.8	41.97	-111.57	\N	\N
276	Beech Mountain NC	North Carolina	10	15	95	0.3	28.5	0.4	38	0.3	28.5	36.22	-81.88	\N	\N
277	Belleayre NY	New York	8	55	171	0.22	37.62	0.58	99.18	0.2	34.2	40.86	-73.4	\N	\N
278	Berkshire East MA	Massachusetts 	6	45	400	0.3	120	0.35	140	0.35	140	42.32	-73.17	\N	\N
279	Big Boulder PA	Pennsylvania	8	15	55	0.4	22	0.35	19.25	0.25	13.75	41.05	-75.59	\N	\N
280	Big Powderhorn MI	Michigan	10	33	253	0.35	88.55	0.35	88.55	0.3	75.9	46.49	-90.1	\N	\N
281	Big Sky MT	Montana	34	306	5800	0.15	870	0.25	1450	0.6	3480	45.29	-111.38	\N	\N
282	Bigrock ME	Maine	5	28	60	0.11	6.6	0.75	45	0.14	8.4	44.6	-67.94	\N	\N
283	Bittersweet MI	Michigan	12	20	110	0.3	33	0.6	66	0.1	11	43.38	-85.78	\N	\N
284	Black Mountain ME	Maine	3	35	48	\N	0	\N	0	\N	0	45.18	-70.67	\N	\N
285	Black Mountain NH	New Hampshire 	4	40	143	0.33	47.19	0.35	50.05	0.32	45.76	44.22	-71.16	\N	\N
286	Blackjack MI	Michigan	6	26	126	0.2	25.2	0.4	50.4	0.4	50.4	46.48	-89.99	\N	\N
287	Blacktail Mountain MT	Montana	4	25	2500	0.15	375	0.7	1750	0.15	375	48	-114.36	\N	\N
288	Blanford MA	Massachusetts 	5	22	158	0.4	63.2	0.5	79	0.1	15.8	42.18	-72.93	\N	\N
289	Blue Hills MA 	Massachusetts 	4	12	60	0.25	15	0.5	30	0.25	15	41.81	-72.7	\N	\N
290	Blue Knob PA	Pennsylvania	5	34	100	0.2	20	0.35	35	0.45	45	40.28	-78.55	\N	\N
291	Blue Mountain PA	Pennsylvania	13	39	164	0.41	67.24	0.13	21.32	0.46	75.44	40.19	-77.61	\N	\N
292	Bogus Basin ID	Idaho	8	66	2600	0.22	572	0.45	1170	0.33	858	43.76	-116.1	\N	\N
293	Bolton Valley VT	Vermont	6	71	165	0.32	52.8	0.36	59.4	0.32	52.8	44.42	-72.85	\N	\N
294	Boreal CA	California	6	41	480	0.3	144	0.55	264	0.15	72	39.33	-120.35	\N	\N
295	Boston Mills/Brandywine OH	Ohio	16	17	88	0.27	23.76	0.27	23.76	0.46	40.48	40.07	-82.95	\N	\N
296	Bottineau Winter Park ND	North Dakota	5	9	40	0.4	16	0.4	16	0.2	8	48.83	-100.45	\N	\N
297	Bousquet MA 	Massachusetts 	5	23	200	0.34	68	0.33	66	0.33	66	42.4	-71.39	\N	\N
298	Boyce Park PA	Pennsylvania	3	4	25	0.75	18.75	0.25	6.25	\N	0	40.46	-79.75	\N	\N
299	Boyne Highlands MI	Michigan	8	55	435	0.37	160.95	0.29	126.15	0.34	147.9	45.47	-84.94	\N	\N
300	Boyne Mountain MI	Michigan	10	60	415	0.29	120.35	0.41	170.15	0.3	124.5	45.17	-84.94	\N	\N
301	Brantling NY	New York	6	8	36	0.3	10.8	0.4	14.4	0.3	10.8	43.16	-77.06	\N	\N
302	Breckenridge CO	Colorado	31	155	2358	0.14	330.12	0.31	730.98	0.55	1296.9	39.49	-106.03	\N	\N
303	Bretton Woods NH	New Hampshire 	10	102	464	0.25	116	0.29	134.56	0.46	213.44	44.26	-71.45	\N	\N
304	Brian Head UT	Utah	9	71	650	0.3	195	0.35	227.5	0.35	227.5	37.69	-112.86	\N	\N
305	Bridger Bowl MT	Montana	8	71	2000	0.2	400	0.3	600	0.5	1000	45.83	-110.89	\N	\N
306	Brighton  UT	Utah	5	66	1050	0.21	220.5	0.4	420	0.39	409.5	40.6	-111.58	\N	\N
307	Bristol Mountain NY	New York	6	34	138	0.32	44.16	0.5	69	0.18	24.84	44.24	-73.1	\N	\N
308	Bromley Mountain VT 	Vermont	10	46	300	0.35	105	0.34	102	0.31	93	43.23	-72.94	\N	\N
309	Brundage ID	Idaho	5	46	1500	0.3	450	0.5	750	0.2	300	45.05	-116.12	\N	\N
310	Bryce VA	Virginia	7	8	25	0.34	8.5	0.33	8.25	0.33	8.25	38.75	-78.65	\N	\N
311	Buck Hill MN	Minnesota	9	16	45	0.4	18	0.4	18	0.2	9	44.72	-93.28	\N	\N
312	Buena Vista MN	Minnesota	5	16	30	0.2	6	0.55	16.5	0.25	7.5	47.57	-94.72	\N	\N
313	Burke Mountain VT	Vermont	6	55	270	0.11	29.7	0.47	126.9	0.42	113.4	44.57	-71.9	\N	\N
314	Buttermilk CO	Colorado	9	44	470	0.35	164.5	0.39	183.3	0.26	122.2	39.24	-104.91	\N	\N
315	Caberfae Peaks MI	Michigan	6	34	200	0.35	70	0.33	66	0.32	64	44.32	-85.6	\N	\N
316	Camden Snow Bowl ME	Maine	4	11	80	0.2	16	0.6	48	0.2	16	44.21	-69.15	\N	\N
317	Camelback Mountain PA	Pennsylvania	15	34	160	0.39	62.4	0.26	41.6	0.35	56	41.05	-75.35	\N	\N
318	Camp 10 WI	Wisconsin	4	14	120	0.4	48	0.4	48	0.2	24	45.4	-88.22	\N	\N
319	Campgaw Mountain NJ	New Jersey	6	5	18	0.7	12.6	0.2	3.6	0.1	1.8	41.05	-74.21	\N	\N
320	Canaan Valley WV	West Virginia 	5	42	91	0.3	27.3	0.4	36.4	0.3	27.3	39.12	-79.37	\N	\N
321	Cannon Mountain NH	New Hampshire 	10	73	264	0.21	55.44	0.47	124.08	0.32	84.48	44.15	-71.69	\N	\N
322	Cannonsburg MI	Michigan	10	19	100	0.2	20	0.25	25	0.55	55	43.06	-85.48	\N	\N
323	Cascade Mountain WI	Wisconsin	10	35	160	0.38	60.8	0.24	38.4	0.38	60.8	43.49	-89.52	\N	\N
324	Cataloochee NC	North Carolina	5	12	50	0.25	12.5	0.5	25	0.25	12.5	35.63	-83.09	\N	\N
325	Catamount NY	New York	6	33	130	0.32	41.6	0.33	42.9	0.35	45.5	44.59	-74.09	\N	\N
326	Chester Bowl Park MN	Minnesota	1	4	117	0.4	46.8	0.6	70.2	\N	0	46.73	-94.69	\N	\N
327	Chestnut Mountain IL	Illinois	9	19	146	0.3	43.8	0.4	58.4	0.3	43.8	42.32	-90.38	\N	\N
328	China Peak CA	California	11	45	1200	0.11	132	0.28	336	0.61	732	40.9	-123.34	\N	\N
329	Christie Mountain WI	Wisconsin	5	21	100	0.4	40	0.25	25	0.35	35	45.19	-88.49	\N	\N
330	Christmas Mountain WI	Wisconsin	3	10	40	0.4	16	0.4	16	0.2	8	43.6	-89.87	\N	\N
331	Clear Fork OH	Ohio	6	9	60	0.29	17.4	0.42	25.2	0.29	17.4	41.68	-84.58	\N	\N
332	Cloudmont AL	Alabama	2	2	10	0.5	5	0.5	5	\N	0	33.4	-86.08	\N	\N
333	Cochran VT	Vermont	5	6	30	0.22	6.6	0.56	16.8	0.22	6.6	44.39	-72.97	\N	\N
334	Coffee Mill MN	Minnesota	3	10	28	0.3	8.4	0.4	11.2	0.3	8.4	44.36	-92.04	\N	\N
335	Cooper Spur OR	Oregon	2	10	50	0.4	20	0.4	20	0.2	10	45.39	-121.67	\N	\N
336	Copper Mt CO	Colorado	22	127	2465	0.21	517.65	0.25	616.25	0.54	1331.1	39.46	-106.17	\N	\N
337	Cortina NY	New York	4	18	87	0.45	39.15	0.5	43.5	0.05	4.35	43.15	-76.31	\N	\N
338	Cottonwood Butte ID	Idaho	2	7	260	0.28	72.8	0.29	75.4	0.43	111.8	46.06	-116.46	\N	\N
339	Cranmore Mountain NH	New Hampshire 	10	54	200	0.36	72	0.44	88	0.2	40	44.06	-71.11	\N	\N
340	Crested Butte CO	Colorado	16	121	1547	0.21	324.87	0.46	711.62	0.33	510.51	38.87	-106.99	\N	\N
341	Crotched Mountain NH	New Hampshire 	5	25	100	0.28	28	0.4	40	0.32	32	42.99	-71.88	\N	\N
342	Crystal Mountain MI	Michigan	8	45	85	0.25	21.25	0.49	41.65	0.26	22.1	44.51	-86	\N	\N
343	Crystal Mountain WA	Washington	12	57	2600	0.11	286	0.54	1404	0.35	910	46.92	-121.52	\N	\N
344	Dartmouth Skiway NH	New Hampshire 	4	31	107	0.24	25.68	0.5	53.5	0.26	27.82	43.2	-71.56	\N	\N
345	Dear Valley UT	Utah	21	100	2026	0.27	547.02	0.4	810.4	0.33	668.58	40.61	-111.5	\N	\N
346	Devils Head WI	Wisconsin	11	30	300	0.3	90	0.4	120	0.3	90	46.22	-89.26	\N	\N
347	Diamond Peak NV	Nevada	6	31	655	0.18	117.9	0.46	301.3	0.36	235.8	39.58	-115.81	\N	\N
348	Discovery Basin MT	Montana	7	67	2200	0.2	440	0.25	550	0.55	1210	46.26	-112.26	\N	\N
349	Dodge Ridge CA	California	12	67	852	0.2	170.4	0.4	340.8	0.4	340.8	38.14	-120.03	\N	\N
350	Donner Ski Ranch CA	California	8	53	503	0.25	125.75	0.5	251.5	0.25	125.75	39.31	-120.34	\N	\N
351	Dry Hill NY	New York	3	7	42	0.33	13.86	0.34	14.28	0.33	13.86	42.99	-75.21	\N	\N
352	Eagle Point UT	Utah	6	40	625	0.2	125	0.35	218.75	0.45	281.25	41.25	-111.8	\N	\N
353	Eagle Rock PA	Pennsylvania	3	14	43	0.6	25.8	0.1	4.3	0.3	12.9	39.83	-77.53	\N	\N
354	Eaglecrest AK	Alaska	4	31	640	0.2	128	0.4	256	0.4	256	58.3	-134.55	\N	\N
355	Echo Valley WA	Washington	4	8	70	0.25	17.5	0.5	35	0.25	17.5	48.64	-117.93	\N	\N
356	Eldora CO	Colorado	12	53	680	0.2	136	0.5	340	0.3	204	39.94	-105.56	\N	\N
357	Elk Mountain PA	Pennsylvania	6	27	140	0.25	35	0.3	42	0.45	63	41.72	-75.55	\N	\N
358	Elk Ridge AZ	Arizona 	2	12	37	0.3	11.1	0.5	18.5	0.2	7.4	35.1	-112.23	\N	\N
359	Four Lakes IL	Illinois	7	5	9	0.3	2.7	0.7	6.3	0	0	41.79	-88.09	\N	\N
360	Four Seasons NY	New York	2	4	12	0.4	4.8	0.4	4.8	0.2	2.4	42.48	-73.81	\N	\N
361	Frost Fire ND	North Dakota	3	10	25	0.25	6.25	0.25	6.25	0.5	12.5	48.91	-98.07	\N	\N
362	Giants Ridge MN	Minnesota	7	35	202	0.31	62.62	0.44	88.88	0.25	50.5	47.59	-92.3	\N	\N
363	Gladstone MI	Michigan	5	6	30	0.6	18	0.4	12	\N	0	45.86	-87.02	\N	\N
364	Gore Mountain NY	New York	14	94	438	0.11	48.18	0.53	232.14	0.36	157.68	43.67	-74.05	\N	\N
365	Grand Geneva WI	Wisconsin	6	18	14	0.3	4.2	0.4	5.6	0.3	4.2	42.6	-88.4	\N	\N
366	Grand Targhee WY	Wyoming	5	72	3000	0.1	300	0.7	2100	0.2	600	43.74	-111.07	\N	\N
367	Granite Gorge NH	New Hampshire 	2	17	25	0.35	8.75	0.35	8.75	0.3	7.5	42.97	-72.21	\N	\N
368	Granite Peak WI	Wisconsin	8	74	275	0.35	96.25	0.3	82.5	0.35	96.25	43.79	-88.79	\N	\N
369	Great Bear SD	South Dakota	5	12	20	0.25	5	0.5	10	0.25	5	43.57	-96.67	\N	\N
370	Great Divide MT	Montana	6	140	1600	0.15	240	0.35	560	0.5	800	25	-147	\N	\N
371	Greek Peak Mountain NY	New York	8	32	220	0.4	88	0.25	55	0.35	77	40.71	-74.01	\N	\N
372	Gunstock NH	New Hampshire 	7	55	227	0.12	27.24	0.61	138.47	0.27	61.29	42.91	-71.08	\N	\N
373	Hanson Hills MI	Michigan	4	11	125	0.5	62.5	0.5	62.5	\N	0	44.64	-84.75	\N	\N
374	Heavenly CA	California	29	97	4800	0.2	960	0.45	2160	0.35	1680	38.9353	-119.94	\N	\N
375	Hidden Valley MO	Missouri	6	12	30	0.3	9	0.6	18	0.1	3	38.95	-94.54	\N	\N
376	Hidden Valley NJ	New Jersey	4	13	36	0.25	9	0.3	10.8	0.45	16.2	40.64	-74.88	\N	\N
377	Hidden Valley PA	Pennsylvania	11	31	110	0.31	34.1	0.45	49.5	0.24	26.4	40.06	-79.26	\N	\N
378	Hidden Valley WI	Wisconsin	2	7	50	0.25	12.5	0.5	25	0.25	12.5	43.03	-88.18	\N	\N
379	Highlands of Olympia WI	Wisconsin	\N	3	5	0.5	2.5	0.3	1.5	0.2	1	43.79	-88.79	\N	\N
380	Hilltop AK	Alaska	3	10	30	0.8	24	0.1	3	0.1	3	61.43	-149.44	\N	\N
381	Hogadon WY	Wyoming	3	15	60	0.2	12	0.4	24	0.4	24	39.52	-119.87	\N	\N
382	Holiday Mountain NY	New York	4	7	60	0.3	18	0.4	24	0.3	18	41.63	-74.62	\N	\N
383	Holiday Valley NY	New York	13	58	290	0.34	98.6	0.28	81.2	0.38	110.2	42.26	-78.68	\N	\N
384	HoliMont NY	New York	9	52	140	0.25	35	0.25	35	0.5	70	42.28	-78.7	\N	\N
385	Homewood CA	California	8	64	1260	0.15	189	0.5	630	0.35	441	39.08	-120.17	\N	\N
386	Hoodoo OR	Oregon	7	30	806	0.3	241.8	0.3	241.8	0.4	322.4	43.89	-121.43	\N	\N
387	Huff Hills ND	North Dakota	2	16	80	0.4	32	0.5	40	0.1	8	46.63	-100.72	\N	\N
388	Hunter Mountain NY	New York	10	55	240	0.3	72	0.3	72	0.4	96	42.18	-74.24	\N	\N
389	Hyland MN	Minnesota	6	14	35	0.4	14	0.4	14	0.2	7	44.82	-93.37	\N	\N
390	Indianhead MI	Michigan	9	30	238	0.17	40.46	0.33	78.54	0.5	119	46.49	-89.97	\N	\N
391	Jack Frost PA	Pennsylvania	9	21	100	0.2	20	0.4	40	0.4	40	41.1	-75.66	\N	\N
392	Jackson Hole WY	Wyoming	12	116	2500	0.1	250	0.4	1000	0.5	1250	43.49	-110.75	\N	\N
393	Jay Peak VT	Vermont	9	78	385	0.2	77	0.4	154	0.4	154	44.97	-72.47	\N	\N
394	Jiminy Peak MA	Massachusetts 	9	45	170	0.22	37.4	0.45	76.5	0.33	56.1	42.55	-73.3	\N	\N
395	Kelly Canyon ID	Idaho	6	16	640	0.35	224	0.45	288	0.2	128	44.14	-112.7	\N	\N
396	Keystone CO	Colorado	20	135	3148	0.19	598.12	0.32	1007.36	0.49	1542.52	39.6	-105.95	\N	\N
397	Killington VT	Vermont	22	140	752	0.28	210.56	0.33	248.16	0.39	293.28	43.67	-72.78	\N	\N
398	Kirkwood CA	California	15	81	2300	0.15	345	0.5	1150	0.35	805	38.684	-120.068	\N	\N
399	Kissing Bridge NY	New York	10	38	778	0.35	272.3	0.35	272.3	0.3	233.4	42.61	-78.65	\N	\N
400	Labrador Mountain NY	New York	4	22	250	0.33	82.5	0.34	85	0.33	82.5	40.71	-74.01	\N	\N
401	Las Vegas NV	Nevada	4	30	195	0.1	19.5	0.45	87.75	0.45	87.75	36.12	-115.18	\N	\N
402	Liberty Mountain PA	Pennsylvania	8	16	100	0.35	35	0.4	40	0.25	25	41.51	-77.09	\N	\N
403	Little Ski Hill ID	Idaho	1	5	40	0.35	14	0.45	18	0.2	8	44.93	-116.16	\N	\N
404	Little Switzerland WI	Wisconsin	7	17	50	\N	0	\N	0	\N	0	43.79	-88.79	\N	\N
405	Lookout Pass ID	Idaho	4	34	540	0.2	108	0.5	270	0.3	162	47.47	-115.69	\N	\N
406	Loon NH	New Hampshire 	12	61	370	0.2	74	0.6	222	0.2	74	43.8	-71.02	\N	\N
407	Lost Trail Powder MT	Montana	8	50	900	0.2	180	0.6	540	0.2	180	45.69	-111.06	\N	\N
408	Lost Valley ME	Maine	2	17	45	0.3	13.5	0.5	22.5	0.2	9	44.12	-70.27	\N	\N
409	Loup Loup WA	Washington	4	10	300	0.2	60	0.3	90	0.5	150	48.29	-119.71	\N	\N
410	Loveland CO	Colorado	10	93	1800	0.13	234	0.41	738	0.46	828	40.41	-105.08	\N	\N
411	Lutsen Mountains MN	Minnesota	10	92	986	0.18	177.48	0.47	463.42	0.35	345.1	46.73	-94.69	\N	\N
412	Mad River Glen VT	Vermont	5	45	915	0.3	274.5	0.3	274.5	0.4	366	44.57	-72.57	\N	\N
413	Mad River OH	Ohio	14	24	144	0.22	31.68	0.34	48.96	0.44	63.36	39.91	-83.93	\N	\N
414	Magic Mountain ID	Idaho	3	11	120	0.3	36	0.25	30	0.45	54	42.2	-114.41	\N	\N
415	Magic Mountain VT	Vermont	4	43	195	0.3	58.5	0.3	58.5	0.4	78	43.2	-72.77	\N	\N
416	Mammoth CA	California	28	150	3500	0.25	875	0.4	1400	0.35	1225	41.73	-121.37	\N	\N
417	Marquette Mountain MI	Michigan	4	25	169	0.15	25.35	0.5	84.5	0.35	59.15	46.53	-87.41	\N	\N
418	Massanutten VA	Virginia	7	14	70	0.3	21	0.35	24.5	0.35	24.5	38.41	-78.73	\N	\N
419	Maverick Mountain MT	Montana	2	24	210	0.2	42	0.35	73.5	0.45	94.5	45.45	-113.16	\N	\N
420	McCauley Mountain NY 	New York	5	21	75	0.33	24.75	0.34	25.5	0.33	24.75	43.39	-74.89	\N	\N
421	Meadowlark WY	Wyoming	3	14	160	0.3	48	0.4	64	0.3	48	44.66	-93.17	\N	\N
422	Mission Ridge WA	Washington	6	36	2000	0.1	200	0.6	1200	0.3	600	47.34	-120.47	\N	\N
423	Mohawk Mountain CT	Connecticut	7	25	107	0.2	21.4	0.6	64.2	0.2	21.4	41.83	-73.31	\N	\N
424	Monarch CO	Colorado	7	64	800	0.14	112	0.28	224	0.58	464	38.54	-106.33	\N	\N
425	Mont du Lac WI	Wisconsin	4	9	66	0.33	21.78	0.34	22.44	0.33	21.78	46.64	-92.29	\N	\N
426	Mont Ripley MI	Michigan	3	24	112	0.22	24.64	0.3	33.6	0.48	53.76	47.11	-88.56	\N	\N
427	Montage Mountain PA	Pennsylvania	7	30	140	0.35	49	0.25	35	0.4	56	41.35	-75.68	\N	\N
428	Montana Snowbowl MT	Montana	4	32	1200	0.1	120	0.4	480	0.5	600	46.99	-114.01	\N	\N
429	Moose Mountain AK	Alaska	14	35	200	0.15	30	0.65	130	0.2	40	64.92	-147.94	\N	\N
430	Mount Ashwabay WI	Wisconsin	2	11	65	0.4	26	0.35	22.75	0.25	16.25	46.79	-90.9	\N	\N
431	Mount Bohemia MI	Michigan	2	85	450	\N	0	0.07	31.5	0.93	418.5	47.4	-88	\N	\N
432	Mount Kato MN	Minnesota	8	19	55	0.24	13.2	0.59	32.45	0.17	9.35	44.15	-94.04	\N	\N
433	Mount Pleasant of Edinboro PA	Pennsylvania	3	8	25	0.2	5	0.7	17.5	0.1	2.5	41.85	-80.07	\N	\N
434	Mount Rose CA	California	6	43	1200	0.2	240	0.3	360	0.5	600	39.34	-119.92	\N	\N
435	Mount Snow VT	Vermont	20	80	588	0.14	82.32	0.73	429.24	0.13	76.44	42.97	-72.93	\N	\N
436	Mount Sunapee NH	New Hampshire 	11	66	232	0.26	60.32	0.49	113.68	0.25	58	43.35	-72.07	\N	\N
437	Mountain Creek NJ	New Jersey	9	41	167	0.2	33.4	0.57	95.19	0.23	38.41	40.84	-74.82	\N	\N
438	Mountain High CA	California	12	28	290	0.25	72.5	0.4	116	0.35	101.5	41.96	-122.44	\N	\N
439	Mt Shasta CA	California	5	32	425	0.2	85	0.55	233.75	0.25	106.25	41.31	-122.29	\N	\N
440	Mt. Abram  ME	Maine	5	44	560	0.28	156.8	0.48	268.8	0.24	134.4	44.38	-70.72	\N	\N
441	Mt. Ashland OR	Oregon	4	23	200	0.05	10	0.2	40	0.75	150	42.09	-122.72	\N	\N
442	Mt. Aurora AK	Alaska	3	\N	100	0.2	20	0.4	40	0.4	40	63.52	-146.54	\N	\N
443	Mt. Bachelor OR	Oregon	14	71	3683	0.15	552.45	0.25	920.75	0.6	2209.8	43.99	-121.68	\N	\N
444	Mt. Baker WA	Washington	10	38	1000	0.24	240	0.45	450	0.31	310	48.78	-121.81	\N	\N
445	Mt. Brighton MI	Michigan	18	26	130	0.3	39	0.4	52	0.3	39	42.53	-83.82	\N	\N
446	Mt. Crescent IA	Iowa	2	9	50	0.33	16.5	0.34	17	0.33	16.5	45.6	-107.45	\N	\N
447	Mt. Holiday MI	Michigan	4	12	20	\N	0	\N	0	\N	0	44.75	-85.53	\N	\N
448	Mt. Holly MI	Michigan	14	18	100	0.22	22	0.39	39	0.39	39	42.82	-83.58	\N	\N
449	Mt. Hood Meadows OR	Oregon	13	85	2150	0.15	322.5	0.5	1075	0.35	752.5	45.33	-121.66	\N	\N
450	Mt. Hood Skibowl OR	Oregon	9	65	960	0.2	192	0.4	384	0.4	384	45.37	-121.7	\N	\N
451	Mt. La Crosse WI	Wisconsin	4	18	100	0.3	30	0.4	40	0.3	30	43.79	-91.24	\N	\N
452	Mt. Lemmon AZ	Arizona 	3	21	200	0.2	40	0.38	76	0.42	84	32.45	-110.76	\N	\N
453	Mt. Peter NY	New York	4	14	60	0.33	19.8	0.34	20.4	0.33	19.8	41.23	-74.29	\N	\N
454	Mt. Pisgah NY	New York	2	5	15	\N	0	0.8	12	0.2	3	44.33	-74.14	\N	\N
455	Mt. Rose Ski Tahoe NV	Nevada	8	60	1200	0.2	240	0.7	840	0.1	120	38.81	-116.41	\N	\N
456	Mt. Southington CT 	Connecticut	7	14	51	0.33	16.83	0.42	21.42	0.25	12.75	41.61	-72.94	\N	\N
457	Mt. Spokane WA	Washington	5	45	1425	0.23	327.75	0.45	641.25	0.32	456	47.93	-117.12	\N	\N
458	Mt. Zion MI	Michigan	2	10	20	0.25	5	0.5	10	0.25	5	46.47	-90.16	\N	\N
459	Mulligans Hollow MI	Michigan	5	6	7	0.5	3.5	0.5	3.5	\N	0	43.06	-86.22	\N	\N
460	Mystic Mountain PA	Pennsylvania	3	6	25	0.4	10	0.35	8.75	0.25	6.25	39.57	-79.19	\N	\N
461	Nashoba Valley MA	Massachusetts 	9	17	59	0.2	11.8	0.47	27.73	0.33	19.47	42.48	-71.49	\N	\N
462	New Hermon ME	Maine	3	18	75	0.4	30	0.3	22.5	0.3	22.5	44.44	-69.52	\N	\N
463	Nordic Mountain WI	Wisconsin	6	16	60	0.15	9	0.5	30	0.35	21	45.19	-88.49	\N	\N
464	Northstat CA	California	20	17	3170	0.13	412.1	0.6	1902	0.27	855.9	38.58	-121.75	\N	\N
465	Nubs Nob MI	Michigan	11	53	248	0.31	76.88	0.48	119.04	0.21	52.08	45.47	-84.91	\N	\N
466	Ober Gatlinburg TN	Tennessee	5	9	32	0.25	8	0.5	16	0.25	8	35.51	-86.59	\N	\N
467	Okemo Mountain VT	Vermont	19	119	632	0.32	202.24	0.36	227.52	0.32	202.24	43.41	-72.72	\N	\N
468	Otis Ridge MA	Massachusetts 	5	11	60	0.3	18	0.4	24	0.3	18	42.2	-73.11	\N	\N
469	Pajarito NM	New Mexico	6	40	300	0.2	60	0.5	150	0.3	90	35.91	-106.14	\N	\N
470	Park City Mt UT	Utah	41	344	7300	0.09	657	0.51	3723	0.4	2920	40.68	-111.48	\N	\N
471	Pats Peak NH	New Hampshire 	10	23	90	0.5	45	0.18	16.2	0.32	28.8	43.2	-71.56	\N	\N
472	Pebble Creek ID	Idaho	3	54	1100	0.12	132	0.35	385	0.53	583	42.74	-112.03	\N	\N
473	Peek n Peak NY	New York	8	27	105	0.26	27.3	0.52	54.6	0.22	23.1	42.06	-79.74	\N	\N
474	Perfect North IN	Indiana	11	23	100	0.25	25	0.5	50	0.25	25	40.78	-89.62	\N	\N
475	Petoskey MI	Michigan	1	1	36	\N	0	1	36	\N	0	45.36	-84.95	\N	\N
476	Pico Mountain VT	Vermont	7	50	214	0.2	42.8	0.48	102.72	0.32	68.48	43.86	-72.88	\N	\N
477	Pine Knob MI	Michigan	12	17	85	0.3	25.5	0.35	29.75	0.35	29.75	42.75	-83.38	\N	\N
478	Pine Mountain MI	Michigan	5	27	340	0.3	102	0.4	136	0.3	102	45.84	-88.09	\N	\N
479	Plattekill Mountain	New York	4	38	75	0.2	15	0.4	30	0.4	30	42.27	-74.64	\N	\N
480	Pomerelle Mountain ID	Idaho	3	24	500	0.35	175	0.4	200	0.25	125	42.32	-113.61	\N	\N
481	Powder Mt UT	Utah	7	135	2800	0.25	700	0.4	1120	0.35	980	40.15	-112.18	\N	\N
482	Powder Ridge MN	Minnesota	6	15	60	0.4	24	0.4	24	0.2	12	45.33	-94.31	\N	\N
483	Powderhorn CO	Colorado	4	43	1600	0.2	320	0.5	800	0.3	480	38.28	-107.1	\N	\N
484	Purgatory CO	Colorado	10	85	1200	0.23	276	0.51	612	0.26	312	39.46	-106.08	\N	\N
485	Ragged Mountain NH	New Hampshire 	5	45	220	0.3	66	0.4	88	0.3	66	43.47	-71.83	\N	\N
486	Red Lodge Mountain MT	Montana	7	65	1565	0.17	266.05	0.45	704.25	0.38	594.7	45.16	-109.29	\N	\N
487	Red River NM	New Mexico	7	57	290	0.32	92.8	0.38	110.2	0.3	87	36.72	-105.41	\N	\N
488	Roundtop PA	Pennsylvania	10	16	100	0.38	38	0.32	32	0.3	30	41.34	-76.5	\N	\N
489	Royal Mountain NY	New York	3	13	30	0.33	9.9	0.34	10.2	0.33	9.9	43.04	-74.51	\N	\N
490	Saddleback ME	Maine	5	66	220	0.38	83.6	0.29	63.8	0.33	72.6	44.11	-68.54	\N	\N
491	Sandia Peak NM	New Mexico	6	30	200	0.35	70	0.55	110	0.1	20	35.21	-106.45	\N	\N
492	Sawkill NY	New York	1	2	6	0.7	4.2	0.3	1.8	\N	0	41.6	-74.18	\N	\N
493	Schweitzer Mountain ID	Idaho	9	92	2900	0.1	290	0.4	1160	0.5	1450	48.35	-116.59	\N	\N
494	Seven Oaks IA	Iowa	4	11	30	0.4	12	0.4	12	0.2	6	41.46	-91.06	\N	\N
495	Seven Springs PA	Pennsylvania	10	33	285	0.35	99.75	0.4	114	0.25	71.25	40.02	-79.29	\N	\N
496	Shanty Creek  MI	Michigan	12	55	400	0.37	148	0.3	120	0.33	132	44.92	-85.18	\N	\N
497	Shawnee Mountain PA	Pennsylvania	12	23	125	0.25	31.25	0.5	62.5	0.25	31.25	41.03	-75.07	\N	\N
498	Shawnee Peak ME	Maine	5	40	249	0.25	62.25	0.5	124.5	0.25	62.25	44.06	-70.81	\N	\N
499	Showdown Montana MT	Montana	4	34	640	0.3	192	0.4	256	0.3	192	46.84	-110.69	\N	\N
500	Sierra at Tahoe CA	California	14	46	2000	0.25	500	0.5	1000	0.25	500	38.81	-120.07	\N	\N
501	Silver Mountain ID	Idaho	7	73	1600	0.2	320	0.4	640	0.4	640	48.96	-116.74	\N	\N
502	Silverton CO	Colorado	1	69	1819	0	0	0	0	1	1819	37.82	-107.66	\N	\N
503	Sipapu NM	New Mexico	5	41	200	0.2	40	0.4	80	0.4	80	36.15	-105.55	\N	\N
504	Ski Apache NM	New Mexico	11	55	750	0.2	150	0.6	450	0.2	150	33.4	-105.78	\N	\N
505	Ski Bluewood WA	Washington	3	24	430	0.27	116.1	0.43	184.9	0.3	129	47.75	-120.74	\N	\N
506	Ski Bradford MA	Massachusetts 	10	15	48	0.1	4.8	0.8	38.4	0.1	4.8	42.76	-71.06	\N	\N
507	Ski Brule MI	Michigan	11	17	150	0.2	30	0.5	75	0.3	45	44.32	-85.6	\N	\N
508	Ski Butternut MA	Massachusetts 	11	22	110	0.2	22	0.6	66	0.2	22	42.4	-71.39	\N	\N
509	Ski Cooper CO	Colorado	5	26	400	0.3	120	0.4	160	0.3	120	39.36	-106.3	\N	\N
510	Ski Denton PA	Pennsylvania	4	22	75	0.35	26.25	0.35	26.25	0.3	22.5	41.19	-77.21	\N	\N
511	Ski Granby CO	Colorado	5	33	406	0.5	203	0.3	121.8	0.2	81.2	39.92	-105.79	\N	\N
512	Ski Mystic SD	South Dakota	4	44	300	0.4	120	0.4	120	0.2	60	44.08	-103.63	\N	\N
513	Ski Santa Fe NM	New Mexico	7	74	660	0.2	132	0.4	264	0.4	264	35.72	-105.89	\N	\N
514	Ski Sawmill PA	Pennsylvania	5	12	15	0.33	4.95	0.34	5.1	0.33	4.95	41.52	-77.29	\N	\N
515	Ski Sundown CT	Connecticut	5	15	65	0.5	32.5	0.25	16.25	0.25	16.25	41.6	-73.09	\N	\N
516	Ski Ward MA 	Massachusetts 	6	9	45	0.3	13.5	0.6	27	0.1	4.5	42.4	-71.39	\N	\N
517	Sleeping Giant WY	Wyoming	3	49	184	0.15	27.6	0.41	75.44	0.44	80.96	44.52	-109.84	\N	\N
518	Smugglers Notch VT	Vermont	8	78	1000	0.19	190	0.5	500	0.31	310	44.55	-72.79	\N	\N
519	Snow Creek MO	Missouri	6	12	25	0.3	7.5	0.6	15	0.1	2.5	36.98	-90.36	\N	\N
520	Snow King WY	Wyoming	5	31	400	0.15	60	0.25	100	0.6	240	43.46	-110.76	\N	\N
521	Snow Ridge NY	New York	6	22	130	0.2	26	0.55	71.5	0.25	32.5	42.03	-74.09	\N	\N
522	Snow Snake MI	Michigan	6	12	40	0.3	12	0.5	20	0.2	8	44.32	-85.6	\N	\N
523	Snow Trails OH	Ohio	7	17	80	0.2	16	0.6	48	0.2	16	40.67	-82.51	\N	\N
524	Snowbasin MT UT	Utah	10	113	3000	0.2	600	0.5	1500	0.3	900	39.32	-111.09	\N	\N
525	Snowbird UT	Utah	12	89	2500	0.27	675	0.38	950	0.35	875	40.58	-111.65	\N	\N
526	Snowhaven ID	Idaho	2	9	40	0.75	30	0.25	10	0	0	45.87	-116.09	\N	\N
527	Snowmass CO	Colorado	21	91	3362	0.06	201.72	0.5	1681	0.44	1479.28	39.18	-106.94	\N	\N
528	Snowshoe Mountain WV	West Virginia 	15	60	230	0.42	96.6	0.3	69	0.28	64.4	38.61	-80.45	\N	\N
529	Snowstar IL	Illinois	6	14	28	0.25	7	0.5	14	0.25	7	40.63	-89.39	\N	\N
530	Snowy Range WY	Wyoming	5	27	250	0.3	75	0.4	100	0.3	75	41.17	-106.24	\N	\N
531	Soldier Mountain ID	Idaho	3	36	1150	0.25	287.5	0.6	690	0.15	172.5	44.71	-115.09	\N	\N
532	Solitude UT	Utah	7	65	1200	0.2	240	0.5	600	0.3	360	40.63	-111.59	\N	\N
533	Song Mountain NY	New York	5	24	100	0.58	58	0.29	29	0.13	13	42.78	-76.18	\N	\N
534	Spirit Mountain MN	Minnesota	8	22	175	0.32	56	0.32	56	0.36	63	46.71	-92.23	\N	\N
535	Spout Springs OR	Oregon	2	16	250	0.45	112.5	0.35	87.5	0.2	50	45.75	-118.05	\N	\N
536	Spring Mountain PA	Pennsylvania	6	8	100	0.4	40	0.4	40	0.2	20	40.26	-75.45	\N	\N
537	Squaw Valley CA	California	30	170	3600	0.25	900	0.45	1620	0.3	1080	36.74	-119.25	\N	\N
538	Standing Rocks WI	Wisconsin	3	5	300	0.25	75	0.5	150	0.25	75	44.43	-89.41	\N	\N
539	Steamboat CO	Colorado	18	165	2965	0.14	415.1	0.42	1245.3	0.44	1304.6	40.8	-106.95	\N	\N
540	Stevens Pass WA	Washington	10	37	1125	0.11	123.75	0.54	607.5	0.35	393.75	47.75	-121.09	\N	\N
541	Stowe Mountain VT	Vermont	13	116	485	0.16	77.6	0.59	286.15	0.25	121.25	42.75	-72.74	\N	\N
542	Stratton Mountain VT	Vermont	11	95	625	0.41	256.25	0.33	206.25	0.26	162.5	43.12	-72.9	\N	\N
543	Sugar Bowl CA	California	13	103	1650	0.17	280.5	0.45	742.5	0.38	627	39.27	-120.3	\N	\N
544	Sugar Mountain NC	North Carolina	8	20	115	0.4	46	0.4	46	0.2	23	36.12	-81.86	\N	\N
545	Sugarbush VT	Vermont	16	111	578	0.2	115.6	0.45	260.1	0.35	202.3	44.12	-72.83	\N	\N
546	Sugarloaf ME	Maine	15	145	1670	0.23	384.1	0.33	551.1	0.44	734.8	44.56	-70.43	\N	\N
547	Suicide Six VT	Vermont	3	23	100	0.3	30	0.4	40	0.3	30	44.57	-72.57	\N	\N
548	Summit OR	Oregon	2	6	70	0.75	52.5	0.25	17.5	0	0	44.63	-123.58	\N	\N
549	Sun Valley ID	Idaho	20	75	2054	0.36	739.44	0.42	862.68	0.22	451.88	43.69	-114.36	\N	\N
550	Sunburst WI	Wisconsin	9	10	35	0.2	7	0.35	12.25	0.45	15.75	43.18	-89.3	\N	\N
551	Sundance UT	Utah	5	42	450	0.2	90	0.4	180	0.4	180	40.41	-111.58	\N	\N
552	Sunday River ME	Maine	16	132	667	0.33	220.11	0.36	240.12	0.31	206.77	44.46	-70.8	\N	\N
553	Sundown Mountain IA	Iowa	6	21	55	0.4	22	0.4	22	0.2	11	41.89	-93.1	\N	\N
554	Sunlight CO 	Colorado	3	67	470	0.2	94	0.55	258.5	0.25	117.5	39.4	-107.34	\N	\N
555	Sunrise Park AZ	Arizona 	8	65	800	0.4	320	0.4	320	0.2	160	34.02	-109.53	\N	\N
556	Swain NY	New York	5	30	100	0.39	39	0.28	28	0.33	33	42.49	-77.87	\N	\N
557	Swiss Valley MI	Michigan	7	11	60	0.2	12	0.6	36	0.2	12	44.32	-85.6	\N	\N
558	Tamarack ID	Idaho	7	32	900	0.15	135	0.44	396	0.41	369	44.95	-116.39	\N	\N
559	Taos Ski NM	New Mexico	13	110	1294	0.24	310.56	0.25	323.5	0.51	659.94	36.44	-105.61	\N	\N
560	Telluride CO	Colorado	18	118	2000	0.23	460	0.36	720	0.41	820	37.94	-107.82	\N	\N
561	Terry Peak SD	South Dakota	5	30	450	0.2	90	0.6	270	0.2	90	44.33	-103.83	\N	\N
562	Teton Pass MT	Montana	3	36	114	0.45	51.3	0.35	39.9	0.2	22.8	47.97	-112.9	\N	\N
563	The Homestead MI	Michigan	5	15	16	0.25	4	0.55	8.8	0.2	3.2	42.73	-85.65	\N	\N
564	The Homestead VA	Virginia	5	9	45	0.34	15.3	0.33	14.85	0.33	14.85	38.15	-78.57	\N	\N
565	The Rock WI	Wisconsin	5	8	75	0.2	15	0.5	37.5	0.3	22.5	42.62	-89.01	\N	\N
566	The Summit at Snoqualmie WA	Washington	25	96	1981	0.14	277.34	0.45	891.45	0.41	812.21	47.75	-120.74	\N	\N
567	Thunder Ridge NY	New York	7	30	100	0.4	40	0.4	40	0.2	20	41.39	-73.23	\N	\N
568	Timber Ridge MI 	Michigan	10	15	50	0.2	10	0.7	35	0.1	5	45.08	-85.11	\N	\N
569	Timberline Four Seasons WV	West Virginia 	4	37	100	0.34	34	0.32	32	0.34	34	38.61	-80.45	\N	\N
570	Timberline OR	Oregon	9	41	1415	0.25	353.75	0.5	707.5	0.25	353.75	45.31	-121.74	\N	\N
571	Titcomb Mountain ME	Maine	2	16	45	0.3	13.5	0.4	18	0.3	13.5	44.65	-70.17	\N	\N
572	Titus Mountain NY	New York	10	42	80	0.35	28	0.36	28.8	0.29	23.2	44.76	-74.23	\N	\N
573	Toggenburg NY	New York	5	21	83	0.2	16.6	0.5	41.5	0.3	24.9	42.82	-75.96	\N	\N
574	Treetops MI	Michigan	5	23	80	0.3	24	0.5	40	0.2	16	45	-84.62	\N	\N
575	Trollhaugem WI	Wisconsin	10	22	90	0.29	26.1	0.43	38.7	0.28	25.2	43.79	-88.79	\N	\N
576	Turner Mountain MT	Montana	1	25	1000	0.1	100	0.3	300	0.6	600	48.61	-115.67	\N	\N
577	Tussey Mountain PA	Pennsylvania	5	7	50	0.3	15	0.45	22.5	0.25	12.5	39.8	-78.55	\N	\N
578	Tuxedo Ridge NY	New York	4	7	100	0.2	20	0.7	70	0.1	10	41.33	-74.12	\N	\N
579	Tyrol Basin WI	Wisconsin	6	16	24	\N	0	\N	0	\N	0	43.79	-88.79	\N	\N
580	Vail CO	Colorado	31	193	5289	0.18	952.02	0.29	1533.81	0.53	2803.17	39.64	-106.36	\N	\N
581	Villa Olivia IL	Illinois	7	7	15	0.4	6	0.5	7.5	0.1	1.5	40.63	-89.39	\N	\N
582	Wachusett Mountain MA	Massachusetts 	8	22	110	0.3	33	0.4	44	0.3	33	42.49	-71.88	\N	\N
583	Warner Canyon OR	Oregon	1	22	200	0.51	102	0.46	92	0.03	6	42.25	-120.37	\N	\N
584	Waterville Valley NH	New Hampshire 	10	52	220	0.2	44	0.6	132	0.2	44	43.96	-71.5	\N	\N
585	Welch Village MN	Minnesota	10	60	140	0.31	43.4	0.5	70	0.19	26.6	44.56	-92.74	\N	\N
586	West Mountain NY	New York	8	40	124	0.36	44.64	0.55	68.2	0.09	11.16	43.38	-73.96	\N	\N
587	Whaleback NH	New Hampshire 	4	30	85	0.28	23.8	0.39	33.15	0.33	28.05	44.82	-71.05	\N	\N
588	White Pass WA	Washington	8	47	1402	0.15	210.3	0.65	911.3	0.2	280.4	46.64	-121.39	\N	\N
589	White Pine WY	Wyoming	2	25	370	0.25	92.5	0.45	166.5	0.3	111	43.7	-121.59	\N	\N
590	Whitecap Mountains WI	Wisconsin	9	43	500	0.33	165	0.33	165	0.34	170	43.79	-88.79	\N	\N
591	Whiteface Mountain NY	New York	11	86	283	0.2	56.6	0.43	121.69	0.37	104.71	44.37	-73.89	\N	\N
592	Whitefish Mountain MT	Montana	13	98	3000	0.15	450	0.35	1050	0.5	1500	48.76	-114.59	\N	\N
593	Whitetail Mountain PA	Pennsylvania	9	23	109	0.22	23.98	0.53	57.77	0.25	27.25	41.33	-75.98	\N	\N
594	Wild Mountain MN	Minnesota	7	25	100	0.33	33	0.34	34	0.33	33	45.48	-92.72	\N	\N
595	Wildcat Mountain NH	New Hampshire 	5	49	225	0.25	56.25	0.45	101.25	0.3	67.5	44.27	-71.21	\N	\N
596	Willamette Pass OR	Oregon	6	29	555	0.21	116.55	0.45	249.75	0.34	188.7	43.61	-122.03	\N	\N
597	Willard Mountain NY	New York	4	14	85	0.3	25.5	0.4	34	0.3	25.5	43.02	-73.52	\N	\N
598	Wilmot Mountain WI	Wisconsin	8	25	120	0.3	36	0.3	36	0.4	48	43.79	-88.79	\N	\N
599	Windham Mountain NY	New York	10	49	269	0.3	80.7	0.45	121.05	0.25	67.25	42.36	-74.29	\N	\N
600	Winter Park CO	Colorado	24	142	3078	0.08	246.24	0.37	1138.86	0.55	1692.9	39.88	-105.75	\N	\N
601	Wintergreen VA	Virginia	7	26	129	0.23	29.67	0.35	45.15	0.42	54.18	37.89	-78.9	\N	\N
602	Winterplace WV	West Virginia 	11	28	90	0.41	36.9	0.44	39.6	0.15	13.5	37.88	-81.12	\N	\N
603	Wisp MD	Maryland	14	32	132	0.41	54.12	0.28	36.96	0.31	40.92	39.14	-76.7	\N	\N
604	Wolf Creek CO	Colorado	7	77	1600	0.2	320	0.45	720	0.35	560	37.4	-106.6	\N	\N
605	Wolf Mt UT	Utah	4	22	110	0.35	38.5	0.45	49.5	0.2	22	40.48	-111.02	\N	\N
606	Wolf Ridge NC	North Carolina	5	22	72	0.55	39.6	0.36	25.92	0.09	6.48	5.95	-82.5	\N	\N
607	Woodbury CT	Connecticut	6	15	100	0.33	33	0.34	34	0.33	33	41.55	-73.22	\N	\N
608	Woods Valley NY	New York	3	11	25	0.2	5	0.6	15	0.2	5	43.59	-73.67	\N	\N
609	Yawgoo RI	Rhode Island	4	12	36	0.5	18	0.3	10.8	0.2	7.2	41.52	-71.57	\N	\N
\.


--
-- Data for Name: search; Type: TABLE DATA; Schema: public; Owner: rhaast
--

COPY public.search (id, "timestamp", user_id, resort_id) FROM stdin;
1	2022-04-09 17:32:37.628944	10	540
2	2022-04-09 17:32:43.854333	10	255
3	2022-04-09 17:32:49.616301	10	255
4	2022-04-09 17:32:59.352375	10	262
5	2022-04-09 17:33:04.357194	10	354
6	2022-04-09 17:33:08.089926	10	442
7	2022-04-09 17:33:10.203621	10	429
8	2022-04-09 17:33:12.518088	10	380
9	2022-04-09 17:33:18.887944	10	249
10	2022-04-09 17:33:21.815942	10	294
11	2022-04-09 17:33:23.843419	10	350
12	2022-04-09 17:33:25.858275	10	398
13	2022-04-09 17:33:27.898219	10	438
14	2022-04-09 17:33:30.168061	10	500
15	2022-04-09 17:33:32.187999	10	270
16	2022-04-09 17:33:33.606791	10	328
17	2022-04-09 17:33:36.674334	10	374
18	2022-04-09 17:33:38.429235	10	416
19	2022-04-09 17:33:40.538161	10	439
20	2022-04-09 17:33:42.520021	10	537
21	2022-04-09 17:33:44.52702	10	272
22	2022-04-09 17:33:47.282119	10	349
23	2022-04-09 17:33:49.183484	10	385
24	2022-04-09 17:33:51.562143	10	434
25	2022-04-09 17:33:53.646482	10	464
26	2022-04-09 17:33:55.404024	10	543
27	2022-04-09 17:34:07.91777	10	248
28	2022-04-09 17:34:10.570104	10	312
29	2022-04-09 17:34:12.417878	10	362
30	2022-04-09 17:34:14.286233	10	256
31	2022-04-09 17:34:16.725394	10	311
32	2022-04-09 17:34:18.734285	10	334
33	2022-04-09 17:34:20.850764	10	534
34	2022-04-09 17:34:22.432887	10	411
35	2022-04-09 17:34:24.518045	10	594
36	2022-04-09 17:34:26.311954	10	585
37	2022-04-09 17:34:28.361357	10	482
38	2022-04-09 17:34:31.249402	10	432
39	2022-04-09 17:34:40.41023	10	302
40	2022-04-09 17:34:43.012317	10	265
41	2022-04-09 17:34:45.040596	10	264
42	2022-04-09 17:34:47.173313	10	502
43	2022-04-09 17:34:48.984656	10	511
44	2022-04-09 17:34:51.239399	10	509
45	2022-04-09 17:34:53.263235	10	539
46	2022-04-09 17:34:58.856791	10	580
47	2022-04-09 17:35:02.429325	10	604
48	2022-04-09 17:35:09.79887	10	255
49	2022-04-09 21:41:22.156662	1	332
50	2022-04-09 21:41:24.217689	1	332
51	2022-04-09 21:41:29.479547	1	332
52	2022-04-09 21:42:20.493155	1	294
53	2022-04-09 21:42:22.4897	1	294
54	2022-04-09 21:42:56.015254	1	268
55	2022-04-09 21:42:58.052938	1	268
56	2022-04-09 21:43:05.119753	1	332
57	2022-04-09 21:44:07.972035	1	332
58	2022-04-09 21:44:09.968455	1	332
59	2022-04-09 21:44:19.241754	1	247
60	2022-04-09 21:45:20.41205	1	255
61	2022-04-09 21:45:22.442709	1	255
62	2022-04-10 00:27:00.172008	1	332
63	2022-04-10 00:27:02.260898	1	332
64	2022-04-10 00:51:44.542494	1	332
65	2022-04-10 00:54:10.010265	1	408
66	2022-04-10 00:54:31.582105	1	247
67	2022-04-10 00:54:33.703749	1	247
68	2022-04-10 14:29:43.152349	1	566
69	2022-04-10 14:29:52.475502	1	540
70	2022-04-10 14:30:06.965561	1	332
71	2022-04-10 14:30:52.091833	1	332
72	2022-04-10 14:31:29.893398	1	247
73	2022-04-10 14:35:23.033835	11	566
74	2022-04-10 14:35:25.067301	11	566
75	2022-04-10 22:13:52.201957	11	566
76	2022-04-10 22:14:49.378363	11	540
77	2022-04-10 22:16:25.561764	11	540
78	2022-04-10 22:17:55.129223	11	540
79	2022-04-10 22:18:11.606118	11	332
80	2022-04-10 22:18:27.583386	11	540
81	2022-04-10 22:18:38.743263	11	253
82	2022-04-10 22:18:50.876687	11	329
83	2022-04-10 22:18:55.372948	11	365
84	2022-04-10 22:18:57.649337	11	379
85	2022-04-10 22:19:00.31889	11	379
86	2022-04-10 22:20:50.137306	11	379
87	2022-04-10 22:25:05.965173	11	261
88	2022-04-10 22:32:08.088395	11	261
89	2022-04-10 22:32:54.583941	11	261
90	2022-04-10 22:33:35.842584	11	261
91	2022-04-10 22:37:34.429919	11	261
92	2022-04-10 22:37:42.529792	11	255
93	2022-04-10 22:37:47.804777	11	262
94	2022-04-10 22:37:51.673779	11	442
95	2022-04-10 22:37:55.342564	11	255
96	2022-04-10 22:37:58.850594	11	255
97	2022-04-11 10:54:37.152548	11	540
98	2022-04-11 10:54:43.597363	11	255
99	2022-04-11 21:34:44.029567	11	249
100	2022-04-11 21:45:09.652213	11	253
101	2022-04-11 21:47:13.695127	11	332
102	2022-04-11 21:51:37.038106	11	566
103	2022-04-11 21:51:41.474698	11	255
104	2022-04-13 23:43:35.552703	11	255
105	2022-04-13 23:43:47.341575	11	566
106	2022-04-13 23:46:02.870813	11	566
107	2022-04-13 23:48:08.786545	11	566
108	2022-04-18 21:45:04.770209	11	566
109	2022-04-18 21:45:29.729603	11	566
110	2022-04-18 21:45:42.725469	11	255
111	2022-04-18 21:50:59.200333	1	500
112	2022-04-18 21:51:29.083991	1	500
113	2022-04-18 21:51:31.768577	1	332
114	2022-04-18 21:51:34.438393	1	294
115	2022-04-18 21:51:36.670829	1	268
116	2022-04-18 21:51:46.542123	1	500
117	2022-04-18 22:03:32.646667	1	540
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: rhaast
--

COPY public.state (id, name, abbr) FROM stdin;
1	Alabama	AL
2	Alaska	AK
3	Arizona	AZ
4	Arkansas	AR
5	California	CA
6	Colorado	CO
7	Connecticut	CT
8	Delaware	DE
9	District of Columbia	DC
10	Florida	FL
11	Georgia	GA
12	Hawaii	HI
13	Idaho	ID
14	Illinois	IL
15	Indiana	IN
16	Iowa	IA
17	Kansas	KS
18	Kentucky	KY
19	Louisiana	LA
20	Maine	ME
21	Montana	MT
22	Nebraska	NE
23	Nevada	NV
24	New Hampshire	NH
25	New Jersey	NJ
26	New Mexico	NM
27	New York	NY
28	North Carolina	NC
29	North Dakota	ND
30	Ohio	OH
31	Oklahoma	OK
32	Oregon	OR
33	Maryland	MD
34	Massachusetts	MA
35	Michigan	MI
36	Minnesota	MN
37	Mississippi	MS
38	Missouri	MO
39	Pennsylvania	PA
40	Rhode Island	RI
41	South Carolina	SC
42	South Dakota	SD
43	Tennessee	TN
44	Texas	TX
45	Utah	UT
46	Vermont	VT
47	Virginia	VA
48	Washington	WA
49	West Virginia	WV
50	Wisconsin	WI
51	Wyoming	WY
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: rhaast
--

COPY public."user" (id, username, name, email, state, password, created_at, updated_at) FROM stdin;
1	karl	karl	karl@gmail.com	Washington	$2b$12$wH0.5dOwvOV5ufh2Bhwh3OkBXhM54H2xOoPNlp7I61u4y0JeP17DO	2022-03-14 21:48:51.238082	2022-03-14 21:48:51.238087
2	bob	bob	bob@gmail.com	Florida	$2b$12$spQ1Wgq0VbqJIXzV2FWSNu2trmZcGGt.u8A7JjmcG2WK.MtaSR5Fi	2022-03-15 00:22:03.548333	2022-03-15 00:22:03.548337
3	porg	porg	porg@gmail.com	Florida	$2b$12$mS0wghe1bgp.RSzcfdxgvePOqJSEzSrTyg19uC.8TldAy2qyyRUUG	2022-03-17 01:05:52.412229	2022-03-17 01:05:52.412236
4	hello	hello	hello@gmail.com	Washington	$2b$12$bnN2bNvlOWULiEK.f81RWOvoipAeYQM6zjozfnb/t7ZCMBPQW1Cgi	2022-03-21 21:35:54.751295	2022-03-21 21:35:54.751301
9	karl	karl	penis@gmail.com	Washington	$2b$12$7rx9TXiIKiDjawEQmu7nj.WTCVG4Dw9HoL6JEOvUqVuzuBKdKVHkS	2022-04-01 18:53:20.937878	2022-04-01 18:53:20.937885
10	karl	karl	bigdick@gmail.com	Alabama	$2b$12$4nrJxQhtXG5UDaoKBG2HO.5UTDDNxSL1nAeyiSYV9sgIQga5smE2K	2022-04-01 18:53:45.281141	2022-04-01 18:53:45.281147
11	karl	karl	abc@abc.com	Washington	\\x2432622431322475533451516d7663727842452e573379414c58424f7562466b34384b6d42524e414c4b382f54446b43564165447665715041786136	2022-04-10 14:35:04.805548	2022-04-18 21:48:50.478107
\.


--
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhaast
--

SELECT pg_catalog.setval('public.favorite_id_seq', 23, true);


--
-- Name: resort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhaast
--

SELECT pg_catalog.setval('public.resort_id_seq', 609, true);


--
-- Name: search_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhaast
--

SELECT pg_catalog.setval('public.search_id_seq', 117, true);


--
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhaast
--

SELECT pg_catalog.setval('public.state_id_seq', 51, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rhaast
--

SELECT pg_catalog.setval('public.user_id_seq', 11, true);


--
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);


--
-- Name: resort resort_pkey; Type: CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.resort
    ADD CONSTRAINT resort_pkey PRIMARY KEY (id);


--
-- Name: search search_pkey; Type: CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_pkey PRIMARY KEY (id);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: favorite favorite_resort_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_resort_id_fkey FOREIGN KEY (resort_id) REFERENCES public.resort(id);


--
-- Name: favorite favorite_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: search search_resort_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_resort_id_fkey FOREIGN KEY (resort_id) REFERENCES public.resort(id);


--
-- Name: search search_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhaast
--

ALTER TABLE ONLY public.search
    ADD CONSTRAINT search_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

