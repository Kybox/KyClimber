--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: avatar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avatar (
    id integer NOT NULL,
    url character varying(150)
);


ALTER TABLE public.avatar OWNER TO postgres;

--
-- Name: avatar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avatar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avatar_id_seq OWNER TO postgres;

--
-- Name: avatar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avatar_id_seq OWNED BY public.avatar.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer NOT NULL,
    post text NOT NULL,
    post_date timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level (
    id integer NOT NULL,
    label character varying(7)
);


ALTER TABLE public.level OWNER TO postgres;

--
-- Name: level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_id_seq OWNER TO postgres;

--
-- Name: level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.level_id_seq OWNED BY public.level.id;


--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- Name: site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site (
    id integer NOT NULL,
    region_id integer NOT NULL,
    name character varying(60) NOT NULL,
    department character varying(5) NOT NULL,
    type character varying(60),
    height character varying(60),
    orientation character varying(60),
    route character varying(60),
    quotation character varying(30),
    description text,
    type_description text,
    access text,
    topo text,
    map character varying(300),
    picture character varying(200)
);


ALTER TABLE public.site OWNER TO postgres;

--
-- Name: site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_id_seq OWNER TO postgres;

--
-- Name: site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_id_seq OWNED BY public.site.id;


--
-- Name: topo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topo (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    publisher character varying(100),
    cover character varying(200),
    available boolean DEFAULT true,
    lent_to integer,
    user_id integer,
    site_id integer,
    region_id integer
);


ALTER TABLE public.topo OWNER TO postgres;

--
-- Name: topo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topo_id_seq OWNER TO postgres;

--
-- Name: topo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topo_id_seq OWNED BY public.topo.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(60) NOT NULL,
    password character varying(32) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30),
    avatar_id integer,
    road character varying(200),
    postal_code character varying(5),
    city character varying(163),
    country character varying(100),
    level_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: avatar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar ALTER COLUMN id SET DEFAULT nextval('public.avatar_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level ALTER COLUMN id SET DEFAULT nextval('public.level_id_seq'::regclass);


--
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- Name: site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site ALTER COLUMN id SET DEFAULT nextval('public.site_id_seq'::regclass);


--
-- Name: topo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo ALTER COLUMN id SET DEFAULT nextval('public.topo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: avatar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avatar (id, url) FROM stdin;
1	https://image.flaticon.com/icons/svg/180/180644.svg
2	https://image.flaticon.com/icons/svg/180/180675.svg
3	https://image.flaticon.com/icons/svg/180/180658.svg
4	https://image.flaticon.com/icons/svg/180/180679.svg
5	https://image.flaticon.com/icons/svg/180/180677.svg
6	https://image.flaticon.com/icons/svg/180/180680.svg
7	https://image.flaticon.com/icons/svg/180/180655.svg
8	https://image.flaticon.com/icons/svg/180/180678.svg
9	https://image.flaticon.com/icons/svg/180/180691.svg
10	https://image.flaticon.com/icons/svg/180/180687.svg
11	https://image.flaticon.com/icons/svg/180/180663.svg
12	https://image.flaticon.com/icons/svg/180/180665.svg
13	https://image.flaticon.com/icons/svg/180/180650.svg
14	https://image.flaticon.com/icons/svg/180/180666.svg
15	https://image.flaticon.com/icons/svg/180/180674.svg
16	https://image.flaticon.com/icons/svg/180/180660.svg
17	https://image.flaticon.com/icons/svg/180/180645.svg
18	https://image.flaticon.com/icons/svg/180/180690.svg
\.


--
-- Name: avatar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avatar_id_seq', 1, false);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, site_id, user_id, post, post_date) FROM stdin;
1	1	2	Excellent lieu pour l'escalade	2018-03-14 16:22:14.871+00
3	1	1	Je recommande pour les débutants	2018-04-08 17:35:27.871+00
34	1	30	pppiopiopio	2018-04-27 13:12:15.194+00
35	1	30	encore 111	2018-04-27 13:17:00.721+00
36	1	30	YUHU !!	2018-04-27 13:19:51.666+00
37	1	30	NEXT ONE ->	2018-04-27 13:23:29.583+00
38	1	30	Encore 1	2018-04-27 13:32:29.875+00
2	1	30	C'est super !!! !3	2018-04-02 11:25:24.871+00
30	1	30	un autre ? ou pas... 2 et 3	2018-04-11 22:47:42.871+00
39	1	30	Encoffdhfhsf vf	2018-04-27 13:33:39.279+00
40	1	30	new !!!! ddd	2018-05-01 15:08:51.286+00
41	1	30	add new 2	2018-05-01 15:11:13.777+00
42	1	30	test145 -2	2018-05-01 15:17:31.23+00
43	1	30	tteess -2	2018-05-01 15:21:33.8+00
44	1	30	dsdssqdssqdsq	2018-05-01 15:25:42.76+00
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 44, true);


--
-- Data for Name: level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level (id, label) FROM stdin;
1	ADMIN
2	DEFAULT
\.


--
-- Name: level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.level_id_seq', 2, true);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, name) FROM stdin;
1	Auvergne-Rhône-Alpes
2	Bougogne-Franche-Comté
3	Bretagne
4	Centre-Val de Loire
5	Corse
6	Grand Est
7	Hauts-de-France
8	Ile-de-France
9	Normandie
10	Nouvelle-Aquitaine
11	Occitanie
12	Pays de la Loire
13	Provence-Alpes-Côte d'Azur
14	Guadeloupe
15	Martinique
16	Guyane
17	La Réunion
18	Mayotte
\.


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 1, false);


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site (id, region_id, name, department, type, height, orientation, route, quotation, description, type_description, access, topo, map, picture) FROM stdin;
4	10	Arudy	64	Falaise	55m	Sud-ouest	230 voies	3c à 8b	La vallée d’Ossau est l’une des trois grandes vallées de montagne de la région béarnaise. Elle s’étire du nord au sud depuis Pau jusqu’au col du Pourtalet, à la frontière espagnole, sous le regard bienveillant du pic du Midi d’Ossau (2884 mètres), à la silhouette bicéphale si caractéristique. En partie basse se trouve le site d’escalade d’Arudy, lieu historique de la grimpe en vallée d’Ossau. «On ne sait pas exactement à quand remonte la pratique de l’escalade arudienne. En 1958, de jeunes grimpeurs ont tenté d’escalader la Pointe centrale de Sesto (la grande pointe blanche) et en 1959, sont apparus les premiers tracés. Dans les années 1970, quelques voies furent pré-équipées depuis le haut des sommets», lit-on dans un texte publié par Ville d’Arudy - Maison d’Ossau, en 1999. «Depuis, des gens viennent du monde entier s’entraîner sur ce rocher-école», lit-on ensuite sur le site Internet de la mairie d’Arudy. Si nous osons relayer telle quelle cette information sans chercher à la vérifier, ajoutons une possible explication à ce succès planétaire: un rocher calcaire très varié où quelque 230 voies offrent un panel de difficultés allant de l’initiation au haut niveau. De quoi drainer toute la planète grimpe dans la région, ou au moins tous les Palois, qui en ont fait leur falaise…	Falaise de rocher calcaire, doté de grosses écailles qui séparent de petites dalles. Les voies mesurent jusqu’à 55 mètres de hauteur, avec des possibilités de combiner les voies pour enchaîner deux longueurs. Les couennes sont réparties sur plusieurs falaises, constituant autant de secteurs. Au cœur du cirque d’Anglas, un nouveau secteur d’initiation. Les autres: Houn de Laa (17 voies du 4c au 7b+), Sirène (15 voies du 5a au 7b+), Vénus (13 voies du 4b au 5c), Soleil (une vingtaine de voies dans toutes les nuances de 5 et de 6, et un secteur très apprécié et fréquenté), Gaufrette (une quinzaine de voies du 4c au 6b+), Sesto (une bonne vingtaine de voies, du 5a au 7b+) et La Fonderie (25 voies, 5b à 8b+) – ce dernier un cran au-dessus en termes de difficulté (avec une moyenne dans le septième degré), sur une falaise calcaire déversante à surplombante. L’équipement est partout moderne, et récent dans certains secteurs.	Depuis Pau, suivre la N134 en direction d’Oloron sur environ 8km. Ensuite, emprunter la D934 sur 15km, puis prendre la direction Arudy par la D287. À Arudy, sur l’axe Laruns – OloronSainte-Marie, se trouve LA grande surface Champion. Tourner devant ce magasin, quelques centaines de mètres plus loin, prendre à droite à l’embranchement et se garer 200 mètres après sur le parking à gauche. À pied, passer devant la ferme d’Anglas et continuer jusqu’à la falaise (secteur Houn de Laa).\r\nQuand y aller? La falaise est praticable toute l’année s’il fait beau. Reste souvent humide après une pluie. Au secteur Sesto, réputé le plus ensoleillé, le soleil arrive vers 9h et s’en va vers 14-15h en hiver. Attention donc, en cette saison, à commencer tôt les jours où il fait frisquet. 	Arudy, Escalades dans les Pyrénées-Atlantiques, Le topo, Rando Éditions, 2010. La vallée d’Ossau, L.Alfonso et X. Buxo, 2d. Supercrack, 2011.	43.100555,-0.454444	http://www.grimper.com/media/guide_falaises/sites/falaise__crop_995x516.jpg
1	1	Ablon	74	Falaise	80 m	Sud-Est	400 voies	4b à 8b	Ablon, c’est la falaise d’alpages, nichée à l’écart, dans un recoin sauvage et préservé en plein cœur du massif des Bornes. On est loin de la montagne à touristes, il n’y a plus aucun bruit de moteur... Là, sur le plateau des Glières, lieu célèbre pour la page d’histoire qui s’y est écrite au cours de la dernière guerre mondiale, où les résistants ont fui les occupants allemands, se trouve le Val d’Ablon, un joyau de falaise haut-savoyard encore inconnu il y a une vingtaine d’années. Sur ses fantastiques dalles grises très sculptées, où le rocher est beau partout, l’escalade présente une variété de styles avec prédominance de grandes envolées en 6b, 6c ou 7a, tout en continuité. On doit plus des deux tiers de ces fabuleuses lignes à Robert Durieux, équipeur motivé et amoureux des lieux depuis au moins trente ans. Autre atout de poids : le pied des voies s’ancre dans un alpage ombragé, moelleux et confortable, idéal pour un assurage serein ou des bambins remuants. Ablon, c’est le site majeur de Haute Savoie pour le cadre, la qualité des lignes et du rocher. Ambiance épicéas, oxygène, clarines et reblochon !	La falaise appartient à un vallon de calcaire urgonien, parvenu jusqu’à nous sous forme de murs verticaux ou légèrement déversants, compacts et finement ciselés d’une multitude de cannelures et de picots, qui sont d’ailleurs la marque de fabrique d’Ablon. Quasiment aucun voie n’y échappe, et vos doigts s’en souviendront. Le style dominant reste les voies de continuité, et vous trouverez quelques grandes longueurs avec des prises à profusion, mais pas toutes dans le bon sens ce qui complique la lecture. Plus de 230 voies, du 4b au 8b. Pour les grimpeurs de niveau 5+ à 6b, ce sont dans les secteurs "Ligne du temps" et "Résistance et liberté" les plus adaptés. Corde de 70 m suffisante. Quelques rares voies où une corde de 80 m est nécessaire. Voies assez bien équipées, prévoir un bon jeu de dégaines.\r\nBest of "Ingrat Nadelgrat", LE 7a de la falaise, secteur "Terre Mythe".\r\n"Picothérapie", deux longueurs en 6a, une des plus parcourues.\r\n"La ligne du temps", 7b, la première voie difficile de la falaise.\r\n"Dublabla", 7b puis 6b, grande longueur variée. 	Se rendre à Thorens les Glières au Nord d’Annecy. Depuis Thorens, aller jusqu’au col des Glières. Une fois au col, redescendre de trois cent mètres pour prendre une route sur la droite, le chemin du Collet. Continuer jusqu’en bas de la descente et au niveau de la ferme, prendre à nouveau à droite. Suivre le chemin des Eaux-Noires jusqu’au parking. Un sentier part sur la droite dans la forêt au niveau de la barrière. Attention, il est strictement interdit d’utiliser votre véhicule au-delà de cette barrière. Continuer à pied. Prévoir 40 mn de marche, juste de quoi s’imprégner de l’ambiance en mouillant un peu le tee-shirt.\r\nQuand y aller? Période idéale : mai à novembre. En général, la neige sonne le début et la fin de la période de grimpe. En été, il est possible de grimper sur certaines voies à l’ombre des arbres. Sinon, le soleil arrive tôt et la falaise passe à l’ombre vers 15 h. Il peut même faire frais en fin de journée. Attention aux orages de montagne pouvant être très violents dans ce secteur. 	40 Falaises - Escalade choisie aux environs du lac d’Annecy - R. Durieux, 2007.	45.932999,6.280513	http://www.grimper.com/media/guide_falaises/sites/marc_daviet_ablon__crop_995x516.jpg
11	1	Cirque d’Archiane	26	Falaise	200 à 400m	Sud-ouest, Sud, Est	50 voies	5b à 7b	Archiane est un superbe cirque de falaises calcaires dont les hautes parois (400m), qui se rangent parmi les plus hautes du Vercors, marquent la limite méridionale du plateau. Niché au cœur du massif du Glandasse, qui s’avance légèrement dans le Diois à la pointe sud du Vercors, le cirque d’Archiane est un magnifique morceau de nature sauvage et grandiose. Un site d’envergure qui a très tôt attiré le grimpeur… Période phare de l’escalade en ces lieux, les années 1960 ont vu l’ouverture de la plupart des itinéraires classiques. Tout comme aux Trois Becs et au Glandasse d’ailleurs, où les ouvertures allaient également bon train à cette époque sixties. Parmi ces voies devenues les grandes classiques d’aujourd’hui, on citera «La Paroi rouge», «La Voie du Levant» ou «Le Pilier Livanos» qui sont toujours aussi prisées et top mode dans la catégorie Grands itinéraires historiques d’envergure sur grande face majestueuse et aérienne. L’équipement de ces voies, qui n’a rien perdu de son petit côté rétro, appelle à la pose de coinceurs en complément. Mais attention, n’allez pas vous imaginer qu’Archiane est un musée, au contraire. Ses grandes parois sont plus que jamais tendance, en témoignent des ouvertures de voies sportives dans les années 1990, et aujourd’hui, un regain d’intérêt pour les voies d’artif modernes, domaine dans lequel Archiane s’impose comme une référence.	En réalité, Archiane n’est pas vraiment un cirque, car la paroi du fond s’avance vers le milieu: c’est le rocher du Jardin du Roy, là où la face prend toute sa hauteur, mais tout le pourtour du cirque comporte des voies, jusqu’aux aiguilles de Bénevise, à l’extrémité sud-est. En tout, plus de cinquante grandes voies de 200 à 400m parcourent cette belle paroi calcaire. Il y a des itinéraires modernes de difficulté plus ou moins soutenue, et de nombreuses voies de terrain d’aventure, sauvages et peu fréquentées, pour de grands voyages à la journée. On retrouve en général dans les grandes classiques un style de grimpe «en fissures». Il n’est pas ridicule de préférer avoir un peu de marge pour ce type d’escalade et d’itinéraires, toujours un peu sérieux ne serait-ce que par leur longueur et leurs cotations parfois surprenantes. Voici d’ailleurs ce que dit Manu Ibarra, grand connaisseur des falaises du Diois, sur son blog au sujet de «La Voie du Levant»: «Cette voie reste un beau morceau d’escalade alpine qu’il vaut mieux regarder avec des yeux d’aventurier que de sportif du gratton si l’on ne veut pas être pris à contrepied!»	Rejoindre Châtillon-en-Diois: depuis Valence, en passant par Crest puis Die / depuis Grenoble, en passant par le col de Grimone ou par le col de Menée (dans ce dernier cas, s’arrêter à Menée). Ensuite, Archiane se trouve à 10km au nord-est de Châtillon-en-Diois en empruntant successivement la D120 et la D224 à gauche au niveau du village de Menée (panneau: cirque d’Archiane, 5km). Se garer au parking obligatoire avant le village d’Archiane. Prendre le GR93 en direction du nord-ouest. Après 1,4km, prendre à droite le sentier de découverte qui monte en direction du nord-est, passe sous le pilier sud et rejoint la falaise au niveau du couloir pierreux (grand couloir est) qui sert d’itinéraire de descente pour les voies du Rocher d’Archiane. Une grosse heure d’approche. On distingue bien une vire médiane qui peut servir d’échappatoire aux voies du Rocher d’Archiane.	Escalades dans le Diois, Dominique Duhaut, Manu Ibarra, Promo Grimpe, édition 2012. (24 voies décrites).	44.750479,5.498324	http://www.grimper.com/media/guide_falaises/sites/falaise.jpg
2	13	Ailefroide	05	Bloc, falaise	De 4m (bloc) à 400m (voies)	Toutes	500 voies	3a à 8a	Situé presque au fond de la vallée de la Vallouise, au Nord de L’Argentière la Bessée, existe-t-il meilleur endroit pour grimper en été ? Peut-être, mais Ailefroide a quand même de quoi convaincre. Ici, à 1.500 m d’altitude, on est en pleine ambiance montagne, entourés de sommets, les vrais, comme sur les cartes postales avec de la neige dessus. Ailefroide c’est beau, et c’est d’ailleurs un site naturel majeur, en partie dans le Parc national des Écrins. Autour, le rocher est partout. D’abord, à portée de bras, il y a ce chaos de gravillons de granit géants, dégringolés des montagnes autour, et aménagés en parcours de bloc pour tous les niveaux. Ailefroide a connu une frénésie d’ouverture dans les années 2000 sous l’impulsion d’Anthony Lamiche et de quelques locaux (les Olivier Fourbet, Yann Ghesquiers, François Lombard et consort...), ce qui en fait aujourd’hui un haut lieu du bloc en France, bien placé dans le best of des sites les plus paradisiaques. Ensuite, à deux pas des blocs, il y a ces dalles granitiques d’excellente qualité parcourues de très nombreuses grandes voies disséminées de part et d’autre d’Ailefroide. Et pour compléter, il y a des sites de couennes sur plusieurs secteurs sportifs en dalles lisses et dévers accessibles. Grandes voies, blocs, couennes, tout est accessible depuis le centre du hameau d’Ailefroide. Dans chaque spécialité, il y en a pour tout le monde, du débutant au sur-confirmé, et la diversité d’orientation permet de grimper avec le soleil ou de le fuir, selon la saison. Tout cela donne de quoi s’occuper plusieurs jours. Voire, plusieurs années. Le tout sous le regard bienveillant de sommets mythiques comme Le Pelvoux et La Barre des Écrins...	Préparez-vous à plonger dans un océan de granit d’une qualité constante, caractérisé par son grain féroce, qui le rend agréablement adhérent quand il s’agit de se tenir sur les prises, mais quelque peu abrasif pour la peau des doigts. Tout est là, des blocs dépassant rarement 4 m de haut, aux grandes parois dalleuses où vous embarquez pour des voyages de 400 m d’escalade. Quand aux préhensions, registre complet du granit avec en tête les fissures, réglettes et plats. En bloc, plus de 300 passages du 4c au 8b, du facile à l’extrême, sans oublier les débutants et les enfants avec des circuits créés pour eux. Idéal pour grimper en famille et faire découvrir l’activité aux plus petits. Tout autour, plus de 500 voies en plusieurs secteurs, du 3a au 8a, en couennes ou GV, sur équipement sportif impeccable ou terrain d’aventure complet.	Depuis Briançon : suivre la N94 en direction de Gap. Avant L’Argentière la Bessée, prendre la D994E en direction de Vallouise, puis continuer dans la vallée jusqu’à Ailefroide. Depuis Gap : prendre la N94 en direction de Briançon. Passer Guillestre puis L’Argentière la Bessée, et prendre à gauche la D994 vers Vallouise jusqu’à Ailefroide. Les secteurs de blocs et de voies se trouvent partout autour du village (entre 2 et 30 mn de marche). Topo indispensable pour faire son choix et s’y retrouver.\r\nQuand y aller? Meilleure période : à Ailefroide, on grimpe aux beaux jours (de mai à septembre). En hiver, c’est un congélo. En été, on supporte bien la polaire en soirée. 	Pour les grandes voies : Oisans sauvage, Livre Est - 420 itinéraires Jean-Michel Cambon, édition 2011. Pour les blocs : Topo des Blocs Ailefroide Team Les Collets Production. (www.teamlescolletsproduction.com/Divers/ Topo-Ailefroide.html). Escalades autour d’Ailefroide Jean-Michel Cambon, 2012. Pour les environs : Escalade en Briançonnais, Haut Val Durance, Queyras - Yann, Martine et Jean-Jacques Rolland, édition 2012.	44.888055,6.439444	http://www.grimper.com/media/guide_falaises/sites/ailefroide_escalade_2__crop_670x378.jpg
3	13	Annot	04	Bloc, falaise	25m	Toutes	400 voies	4c à 8c+	À mi-chemin entre Dignes les Bains et Nice, un peu perché dans l’arrière-pays montagnard, Annot est l’un des plus beaux spots de grimpe du Sud. Il y a là une forêt à champignons, de ceux que l’on mange en omelette, et que l’on cherche dans les sous-bois panier au bras, et de ceux sur lesquels on grimpe. Avec ses grosses boules de grès unique, ses blocs par centaines et ses voies si particulières, son sous-bois ombragé, son soleil du Sud et cette ambiance qui mêle le calme et la douceur de vivre provençale, Annot est un petit paradis de l’escalade. Dans une relative discrétion, une dynamique d’ouverture exceptionnelle a propulsé le site parmi les grands d’Europe. Et en plus, les choses ont été bien faites dès le départ, ce qui mérite d’être souligné. Le développement s’est inscrit dans une démarche de respect des lieux et de concertation avec les autres "utilisateurs" de la forêt (propriétaires, riverains, randonneurs, chasseurs, ramasseurs de champignons, lutins et elfes). La volonté des ouvreurs-découvreurs était d’épargner le site du "star system" attirant les foules, les mauvaises fréquentations et les ennuis, et au contraire, de le laisser prendre sa place en douceur, sans crier son existence sur tous les toits, mais sans rétention d’information non plus... La preuve, le topo est gratuit et téléchargeable sur Internet. Apparemment, et espérons que ça dure, leur volonté a été exaucée, et Annot a habilement échappé à la destinée du Disneyland du bloc. Déjà, le lieu est un peu excentré par rapport au gros des troupes dans le Sud-Est. Et puis rien n’est donné pour atteindre le pied des blocs, et encore moins leur sommet ! Grimper ici, cela se mérite. Et l’excellente réputation d’Annot n’a rien du surfait ni de l’effet de mode. À savoir au passage, si Annot est maintenant associé dans l’esprit de tous aux blocs de la vallée d’Argenton, il existe aussi les blocs d’Annot, si hauts qu’on y grimpe avec une corde. Ce sont d’ailleurs ces voies qui ont fait venir l’escalade à Annot, avant qu’elle ne migre sur les blocs. L’escalade y est largement artificielle, et ces murs de grès archi-lisses sont devenus grimpables à grand renfort de prises taillées (une centaine de voies, du 4c au 8c+, environ 25 m de hauteur). Et il y a aussi les grandes voies de "trad" (une centaine de voies, du 5b au 8a) qui remontent des lignes de fissures dans la plus pure tradition américaine. Une autre spécialité d’Annot.	La particularité du grès du coin, c’est qu’il ne présente que peu de prises : des trous, des plats, peu de réglettes... D’où des passages aussi physiques que limpides, et quelques mouvements morphologiques (on a la taille ou pas !). La particularité du site est dans les méthodes complexes, les réta ardus et les blocs hauts où se trouvent généralement les plus beaux passages. Et si vous en redemandez, ça tombe bien, avec environ 1.600 passages, et encore du potentiel, il y en a pour tous les goûts et tous les niveaux. Un conseil : il est bon de repérer la descente au préalable, laquelle passera parfois par un arbre, parfois par un saut, mais encore faut-il avoir quelqu’un en bas pour bouger les pads.	Annot se trouve au Nord-Est du Verdon, à environ 90 km de Nice et 200 km de Marseille. Il faut rejoindre la N202 puis la D908 pour traverser le village d’Annot en direction du Fugeret. Après environ 3 km, dans une grande ligne droite, prenez la piste d’Argenton (attention au train). Le site commence au menhir planté à l’extérieur de la 4e épingle, et se finit 12 km plus loin, après le col d’Argenton. Les secteurs s’étalent le long de la piste, de 800 à 1.600 m d’altitude, au rythme des lacets qui servent de point de repère dans le topo.\r\nQuand y aller? Meilleure période : grimpable en toute saison (sauf l’hiver, souvent trop froid et humide). Attention, le rocher devient fragile après la pluie. Évitez alors de grimper, au risque de de détruire définitivement un passage. 	Pour les blocs de la piste d’Argenton : le topo par secteur, les cotations, les nouveautés, les recommandations, les interdictions, les statistiques, tout est en ligne sur : http://abloc.org. À lire absolument (plus important que les cotations) : l’encadré " Recommandations " en page d’accueil. À bon entendeur...	43.990833,6.659444	http://www.grimper.com/media/guide_falaises/sites/annot-fred-oddo-dans-6c__crop_995x516.jpg
5	11	Autoire	46	Falaise	5 à 25m	Est, Sud-est	271	5a à 8b	Un quart des voies d’escalade dans le Lot se trouve à Autoire. Cela devrait suffire pour parler d’un site majeur, avec 271 lignes tracées sur un superbe calcaire, et pas mal de nouveautés venues enrichir et redynamiser les lieux au cours de la dernière décennie (après une longue période de léthargie). À site majeur, cadre majeur, avec la cascade de trente mètres qui tombe au fond de la gorge entaillant le causse, et le vieux village d’Autoire, avec ses belles pierres, sorti tout droit et intact de l’époque médiévale... Si ça c’est pas du décor de cinéma ! C’est donc dans ce décor que se déroule, émergeant des chênes, longue d’un kilomètre, la barre rocheuse d’Autoire. Elle démarre sous le belvédère de Siran, par lequel se fait l’accès, et tous les secteurs se succèdent, à mi-hauteur, avec un accès aisé de barre en barre. Le rocher prend plus ou moins de dévers, change de couleur et de forme, au gré de l’inspiration des éléments et de l’usure du temps. Grimpeurs ou non, tant d’esthétique fait forcément vibrer une corde sensible. Pour l’escalade, le premier à avoir vibré est Patrick Moissinac, qui, en 1983, a équipé les premières voies au secteur Bolivaria, le plus court. Le site est donc suffisamment âgé pour avoir connu la grande époque du fluo et des imprimés flashy et improbables, mais il est toujours resté au goût du jour et en phase avec son époque (heureusement, car celle des années 80 était assez fatigante pour les yeux), sans bien sûr passer à côté de l’actuel engouement pour les colonnes et les jolies voies dures en dévers. Le tout dans une région assez tranquille et un brin sauvage, ce qui garantit la quasi-absence de patine sur les voies. En contrepartie, pour les soirées qui déchirent et les after animés, ce n’est pas... majeur.	Dalle, de léger à gros dévers, réglettes, trous, énormes colos, et quelques souvenirs de l’époque du bricolage qui a aussi laissé des traces ici. Une escalade qui fait la fête aux avant-bras. Force et rési courte de rigueur. Pour venir grimper, choisissez, pour les doigts, un modèle en titane, prenez un rouleau de peau de rechange, la technique que vous réservez aux grandes occasions, une panoplie de crochetages en tous genres (genoux, talons, pintes, tête, dos...) pour ruser dans les nombreuses colonnes. Les voies ne sont pas homogènes, il y a toujours un crux qui durcit la cotation. Au menu : 271 voies, de 5 à 25 m, du 5a au 8b. Prévoir 12 dégaines + corde de 60 m.\r\nBest of Après mûres concertations et débats participatifs, les grimpeurs locaux vous révèlent, non sans quelque réticence, le "Best Of" des bouses, daubes et autres nullités extrêmes: “Projet à Nicky“, “Variante de la tristesse“, “L’entre deux“, “Gare aux gorets“. 	La falaise d’Autoire se situe à 70 km de Brive. Aller à Gramat et prendre direction St Céré. Après 10 km, prendre direction Autoire (D38), puis encore 2 km plus loin, se garer au parking à droite, juste à côté de la cascade d’Autoire. Prendre le chemin qui monte au-dessus de la falaise, un GR balisé, qui mène aux escaliers d’accès. Compter un quart d’heure depuis le parking. Vous arriverez donc à la falaise par le dessus. Une fois descendu le second escalier, vous pouvez passer dessous pour accéder au secteur classique, ou continuer en direction du château des Anglais vers les autres secteurs.\r\nQuand y aller? Meilleure période : d’avril à octobre. En plein été, la falaise est à l’ombre à partir de 13 h. 	Escalade dans le Lot - Très nature, très actif, très Lot CD FFME du Lot, 2011. Mises à jour du topo et lieux de vente : http://escalade-dans-le-lot.com. Club d’escalade de Saint-Céré http://stceregrimpe.over-blog.com.	44.855277,1.814167	http://www.grimper.com/media/guide_falaises/sites/dr_autoire__crop_995x516.jpg
6	1	Balme de Yenne	73	Falaise	20 à 60m	Nord	70 voies	6b à 9a	Dans l’avant-pays savoyard, à la limite entre la Savoie et l’Ain, le Rhône a creusé sur 1 km le défilé de PierreChâtel. En rive gauche et rive droite, les gorges sont bordées de falaises qui surplombent les eaux vertes du fleuve. Parmi elles, il devait bien y avoir quelque chose de grimpable à se mettre sous les doigts... C’est bien ce que pensaient David Szumillo, Benoit Robert et Michel Piola, quand ils l’ont exploré en 1995. Et leurs trois regards expérimentés ont tout de suite vu le potentiel de la Balme de Yenne. Même s’ils avaient vu juste, le spot est resté secret pendant de nombreuses années, jusqu’à ce qu’une convention régularise sa situation en 2006 et le libère de cet anonymat forcé... pour le projeter à l’opposé, en quelques années, sur le devant de la scène et le rendre parfois marqué d’une certaine affluence. On vient grimper là pour les murs déversants de part et d’autre de la grotte, car c’est là que se trouvent les plus belles voies, celles qui remontent des colonnettes à grands coups de fermeture de bras. Les profils sont variés, mais ils restent typés haute difficulté, et les ténors de la discipline comme Adam Ondra ou Patxi Usobiaga sont venus user leurs chaussons sur les colos de la Balme.	Le rocher est rayé de colos qui n’en finissent pas, mais reste assez fragile. Les dernières coulées ont formé des plaques qui sonnent souvent creux. Dans le petit secteur de gauche, le caillou à trous est assez exceptionnel et peu fréquent dans la région. Au menu, plus de 70 voies de 6b à 9a, de 20 à 60 m.\r\nBest of . "Colonnette" ou "Banana Spit", deux 7a de 15 m . . "Cathédrale", 7b+, qui remonte des colos à gogo, l’incontournable de la Balme, voie d’échauffement des grimpeurs confirmés... . "Andromède", 8a+ et sa belle colo unique, la voie majeure dela Balme. . "Vénus", 8a, et "Cannibale", 8a+, belles lignes de continuité qui permettent d’user d’autre chose que de la force pour naviguer dans le huitième degré. . "Déclic", 8b+, et "Déclac", 8c/c+, autres morceaux de choix, un cran au-dessus. 	De Chambéry, passer au Bourget du Lac et prendre la direction de Yenne par le tunnel du Chat (D1504). À la sortie de Yenne, traverser les gorges de la Balme et se garer sur le grand parking juste avant le pont sur le Rhône. La falaise est sur la gauche, il suffit de traverser la route et de remonter un chemin évident (2 mn).\r\nQuand y aller? Meilleure période : de juin à septembre, car les nombreuses colos résurgentes à souhait rendent le site impraticable durant les autres saisons. L’hiver, la Balme peut être carrément glaciale. Le site permet de grimper à l’abri de la pluie. Par contre, il ne permet pas de grimper à l’abri du bruit de la circulation routière, dont il faudra faire abstraction. 	Escalades autour du Lac du Bourget Philippe Mussatto, 2008. Descriptifs complémentaires, infos utiles et additifs : topos de Mathieu Bouyoud sur jegrimpe.com. www.jegrimpe.com/topo.php?topo_item=2	45.708055,5.724722	http://www.grimper.com/media/guide_falaises/sites/dr_balme_yenne__crop_995x516.jpg
7	5	Bavella	2A	Falaise	600m	Toutes	200 voies	3c à 8b	Dans le massif de Bavella poussent des aiguilles de granit rouge moucheté de lichen jaune dont la base se perd dans des vallons touffus. Avec leurs parois vermoulues de tafonis délirants, elles composent un décor extravagant, avec parfois un peu de brume façon baie d’Along, ou des pins suspendus façon Japon... Dépaysement assuré. Les tours sont parcourues de voies rocheuses de plusieurs décennies d’âges, dont l’un des premiers ouvreurs fut Jean-Paul Quilici, guide de haute montagne, et de bon nombre d’itinéraires sportifs modernes sur spits ou goujons, parfois à compléter d’un jeu de friends, qui s’y sont ajoutés au fil du temps, attrayants, plus ou moins audacieux, plus ou moins engagés (plutôt plus que moins), et où il est vraiment question de grimpe. Plus tard (en 1992 pour être précis), Arnaud et François Petit ouvrent avec “Jeef“ l’un des monuments de l’escalade granitique en libre. Au même moment, une flopée de grimpeurs haut de gamme, marseillais et locaux, découvrent ce paradis de l’aventure et mettent en valeur de nouveaux secteurs, dénichant des voies inoubliables qu’ils ouvrent du bas sur un rocher excellent. Sur cette autre planète, le potentiel est si vaste que l’ouverture de nouvelles voies continue sur ces aiguilles magiques, supports de rêves à venir, ou existants, comme l’improbable “Delicatessen“, aussi invraisemblable en difficulté qu’en esthétique avec son granit rouge orné de lichen vert et grignoté d’alvéoles géantes. Les possibilités sont innombrables et le niveau très abordable. Il y a également une école d’escalade à proximité du col de Bavella avec plusieurs secteurs et une centaine de couennes de tous niveaux pour prendre l’ambiance des lieux avant de jeter son dévolu sur l’une des tours. Là, un grand choix d’itinéraires de grande ampleur, classiques et modernes, de F à TD, pour 200 m d’escalade, sur des falaises tout droit sorties d’un décor de BD de science-fiction, vous fera voyager bien plus loin que la Corse...	À Bavella, on grimpe sur des dômes de granit aux dalles compactes, avec comme spécificité ces extraordinaires tafonis. Pour la "minute géologique", sachez que ces formes chimériques proviennent d’une érosion du granite en nid d’abeille, due à l’alternance de la pluie et du vent, une spécialité artisanale "made in Corsica". L’escalade se pratique sur des fissures techniques, bossettes, dalles en adhérence avec les mains bien à plat, et dans des surplombs et trous improbables au cœur des tafonis si ludiques à grimper.\r\nBest of . Punta Rossa : “Alexandra“ (TD, 220 m), “La Célébration du lézard“ (ED-, 220 m). “Esperanza“ (ED). . Punta di Ferriate : “U Companieru“ (D+, 150 m), “Alta manera“ (6a+ max). . Teghie Lisce : “Aqua in bocca“ (ED-). . Punta di Malanda : “Sisyphe“ (TD+, 250 m). . Punta di u Corbu : “Le dos d’éléphant“, la classique de Bavella, 9 longueurs pour un grand voyage de 280 m explorant toutes les nuances du 6a+ dalle. “Jeef“, une ligne exceptionnelle en fissures, dalles et murs en dévers de tafonis (400 m en 14 longueurs, entre le 6b et le 7b). “Delicatessen“, 180 m de granit parfait aux sculptures psychédéliques pour une escalade classée extrême que la plupart se contenteront donc d’admirer de loin, sans modération, car très beau, au demeurant ! 	De Solenzara (côte Est), on prend sur la D268 jusqu’au Col de Bavella (30 km). De Porto-Vecchio (Sud est), on atteint aussi le col par la D368 puis la D268 (50 km). Sur la hauteur du col on gare la voiture sur la grande surface de parking. Les premiers rochers sont à 10 mn.\r\nQuand y aller? La Corse, île méditerranéenne, est assez connue pour son climat agréable. Privilégiez les intersaisons, mais l’été convient aussi. 	Falaises de Corse, 1.700 voies sur 55 sites B.Maurin, T.Souchard, CR-FFME, 2012. Grandes voies de Corse B.Maurin, T.Souchard, 2012. Bavedda, Aiguilles entre ciel et torrents Escalade-Rando-Canyon , J.-L. Fenouil, J.-P. Quilici, FFME, 2010.	41.8741246,9.1002434	http://www.grimper.com/media/guide_falaises/sites/marc_daviet_bavella__crop_995x516.jpg
8	1	Bionnassay	74	Falaise	40m	Ouest, Sud-ouest	50 voies	5c à 9a	La falaise de Bionnassay se trouve dans le massif du MontBlanc. Avec un détail comme ça, on se trouve forcément dans un spot d’altitude. Et pas n’importe lequel. Bionnassay est un site qui se mérite, où rien n’est donné, où il faut forcer pour tout, même pour la marche d’approche qui est raide et fatigante. Pour apprécier les voies à leur juste valeur, il faut être bien installé dans le septième degré, et pas totalement étranger au huitième. Bref, d’aucuns qualifieraient la falaise d’un peu élitiste. Disons plus modérément que le site n’est pas accessible à tout le monde, mais que, pour qui en a les moyens, il vaut certainement une visite.	Ce qui rend cette falaise de gneiss si exigeante, ce n’est pas tant son inclinaison, puisqu’elle présente un profil pas très déversant, mais plutôt la taille réduite, voire nanoscopique, des prises. Il faut les serrer, ces petites prises, au palmarès desquelles viennent en tête les arquées, marque de fabrique des falaises made in La Yaute, agrémentées de quelques plats et bidoigts. On attaquera les voies avec une bonne dose de continuité car certaines atteignent les 40m. Le site comporte une cinquantaine de voies, du 5c (bon, dans ce niveau, il n’y en a qu’une…) au 9a, dont une petite poignée en 6 et le reste dans la gamme au-dessus, avec un gros tiers dans le septième degré, réparties sur deux falaises.\r\nBest of « Les coudes au Zénith»: c’est parti pour plus de 40m de 8a+. 	De Saint-Gervais, suivre la direction Les Contamines-Montjoie et environ deux kilomètres après avoir quitté Saint-Gervais, tourner à gauche en suivant le petit panneau en bois qui indique Bionnassay (soyez attentif). Deux cents mètres plus loin, tourner à nouveau à gauche, toujours en suivant le panneau en bois «Bionnassay». Rouler jusqu’à trouver, sur votre gauche, un autre panneau en bois numéroté46 - Les Toïlles, qui indique les chemins de randonnée et l’altitude 1122m. Se garer un peu plus haut dans l’épingle, de façon à ne pas gêner la circulation. Suivre le chemin au niveau du panneau n°46 et rester sur ce chemin principal jusqu’à la deuxième épingle très marquée à gauche. Là, prendre une petite sente pile dans le virage qui part à droite et qui va encore se redresser pour rejoindre le pied de la falaise. Compter une bonne demi-heure, sur un sentier bien raide. Échauffement et réveil musculaire garantis.\r\nQuand y aller? Pied des voies dangereux pour jeunes enfants. 	Vallée de l’Arve, Gilles Brunot, éditions Ekiproc, 2009.	45.866388,6.7425	http://www.grimper.com/media/guide_falaises/sites/fred_labreveux_bionnassay__crop_670x378.jpg
9	13	Buoux	84	Falaise	70m	Toutes	500 voies	4b à 8c+	Buoux, c’est un terreau où ont poussé des voies d’exception, où ont grandi des grimpeurs hors norme, où s’est écrit le grand feuilleton à suspense de l’escalade. Il y a quelque chose de magique et d’initiatique dans ce caillou. Peut-être même d’envoûtant... Dans les années 1970, tandis que le libre prend déjà forme outre-Atlantique, où les varappeurs de l’époque s’essayent à l’escalade engagée sur coinceurs du Camp 4, Buoux n’est même pas encore née, et ses "ouvreurs" sont des locaux qui se cantonnent aux boyaux et fissures. Les dalles à trous qui la rendront célèbre ont encore devant elles quelques années de tranquillité... Ce n’est qu’à la fin des années 1980 qu’explose à Buoux un baby-boom de nouvelles voies, et ce regain de naissances est directement lié à l’évolution des techniques d’ouverture par le haut. Jean-Claude Droyer, Jean-Pierre Bouvier ou encore Patrick Edlinger élisent domicile sur la falaise et tentent de libérer les plus gros ventres à trous. Suivra un chapitre clé, quand la falaise tombe aux mains de ceux que l’on appelle "les Parisiens" durant les décennies 80 et 90. Ils se nomment "Jibé" Tribout, Antoine et Marc Lemenestrel et Laurent Jacob, et se permettent la transgression de tabous inavouables : les bords des trous si douloureux passent sous la lime, les prises sont soigneusement brossées, et parfois renforcées avec le Sikadur qui fait merveille. La façon d’envisager une voie évolue aussi beaucoup. Patrick Edlinger avait défini une sorte de norme qui consistait à essayer la voie à vue. En cas d’échec, le grimpeur n’avait pas le niveau, et basta. Pour les Parisiens, au contraire, seul le résultat compte. Cette démarche sera le fondement de l’escalade contemporaine, et les deux, pas si éloignées dans le temps, partagent la même éthique. Avec toutes ces nouveautés, forcément, l’échelle des cotations s’en ressent et explose : Patrick Edlinger sera l’homme des premiers 7c à vue de Buoux, après quoi les frères Lemenestrel et leur acolyte Jibé Tribout hausseront le ton en annonçant ouvertures et répétitions en 8a, 8a+, 8b et 8b+, avec “le Minimum“, qui deviendra 8c suite au bris d’une prise. C’est là, dans le vallon de l’Aiguebrun, que s’affrontent les cadors du haut niveau mondial. C’est là qu’il faut grimper, être, et être vu. Aujourd’hui, la falaise n’est plus cantonnée au top niveau d’une époque désormais lointaine, et coule des jours heureux comme temple du plaisir de la grimpe avec environ 500 longueurs d’escalade pour sexto et septogradistes. La "grande époque" de Buoux restera à jamais dans les annales... Place à la "belle époque" !	La molasse calcaire buouxienne se présente sous la forme d’une croûte de surface relativement solide, mais truffée d’orifices de taille diverse. Les voies sont ici très exigeantes et techniques, à base de trous qui agressent les doigts et de bossettes fuyantes "made in molasse", et combinent physique efficace et jeux de pied subtils. Les cotations ne sont pas très clémentes et il sera sage, en arrivant, de revoir ses ambitions de croix légèrement à la baisse. Dernier ingrédient du cocktail savoureux de Buoux : un petit engagement entre les points qui pique un peu le cerveau. Par contre, si minimaliste qu’il soit, l’équipement reste de top qualité. En grimpant certaines voies, il est possible d’observer les traces (Sikadur, lime, casse de prises) des différents âges de l’escalade libre qui a grandi ici.\r\nBest of Une sélection très très resserrée, mais il y en aurait des pages à conseiller... . “Le pilier des fourmis“, 4 longueurs en 6a/6b+. . “La Rose des Sables“, 7a. . “Les diamants sont éternels“, 7a. . “Viol de Corbeau“, 7b+. . “TCF“, 7a. . “Azincourt“, 8c (le premier 8c de Buoux et de France, par Ben Moon). . “La ouate“, 8a. . “Rêve de papillon“, 8a. . “La diagonale du fou“, 8a. . “Bout’chou“, 8b+. 	Apt se situe à environ 60 km à l’Est d’Avignon. Depuis Apt, prendre la D943 (Buoux est indiqué). Dépasser le village et poursuivre vers le Sud (Bonnieux et Lourmarin), prendre à gauche dans le vallon de l’Aiguebrun (indications Fort de Buoux). Il est impératif de se garer sur les parkings aménagés. Peu de marche d’approche : de 5 à 10 mn (ce qui a sans doute contribué, avec l’originalité et la qualité du rocher, à l’essor transgénérationnel de Buoux).\r\nQuand y aller? Toute l'année 	Buoux, Topo-Guide d’escalade FFME CD84, 2004. Topo de la face Ouest en complément du topo papier, sur le Web : www.escalade.pro/blog/ buoux-escalade-topo-Ouest.htm. Toutes les infos grimpe de la falaise sur le site Internet du Club Aptitudes : www.aptitudes-escalade.com/buoux.	43.822499,5.3825	http://www.grimper.com/media/guide_falaises/sites/buoux-escalade-manu-dans-meurtre-dans-un-jardin-anglais-7b.jpg
10	1	Cantobre	12	Falaise	20 à 40m	Sud, Sud-est, Est	55 voies	5c à 9a	Cantobre est un village perché, petit détail qui est, à lui seul, de très bon augure. Ensuite, il est très beau, et même parmi les plus beaux de France, parfaitement restauré là-haut, sur son promontoire rocheux. Eh oui, vous avez bien lu, et qui dit promontoire rocheux dit falaise quelque part. Elle est là, juste en face, et c’est en la contemplant ainsi que son nom, la Brocante, prendra tout son sens. En effet, "Brocante" n’est autre que l’anagramme de Cantobre, et il est vrai que depuis le village, celle-ci ressemble à un étal de marché avec ses nombreuses lignes colorées. Comme dans toutes les brocantes, c’est en chinant dans les moindres recoins que l’on trouve son bonheur. Et ici, pour un grimpeur averti, il y a de quoi repartir satisfait de ses trouvailles. Le secteur principal, fut, on s’en doute avec un nom comme ça, le premier équipé, tellement agréable avec sa vire spacieuse et son point de vue sur Cantobre. Il resta secret pendant des années, terrain de jeu haut de gamme des grimpeurs locaux, non dénués de flair, il faut l’admettre, avec en particulier Yvan Sorro, le fin limier qui dénicha cette falaise. C’est plus tard, notamment avec le Roc Trip (2004), que de nouvelles voies ont vu le jour, permettant aujourd’hui de grimper à tous les étages. Et non à tous les niveaux... car celui de Cantobre est dans l’ensemble assez élevé.	La marque de fabrique de ce calcaire magnifique, c’est toute la petite famille Trou (et les fermetures de bras qui s’en suivent) : mono, bi, tri, ils sont tous là. Mais on pourra quand même aussi arpenter de jolies colonnes, crisper des réglettes en tout genre ainsi que des plats redoutables. Plus de 50 voies, du 5c au 9a, réparties sur plusieurs falaises. La hauteur des voies est généralement de 20 m, mais certaines envolées culminent à 40 m maximum. Secteur "Roi du pad" (premier étage) : voies de 6c à 8a, assez courtes et souvent résistantes dans un profil vertical ou un peu déversant. Mieux vaut savoir arquer les prises. Secteur "Barre Principale" : c’est celui des gros muscles, avec une trentaine de voies alignées et des difficultés croissantes, du 7a+ au 8c. Les premiers mètres sont souvent les plus déversants (et cela s’intensifie du bord droit au bord gauche de la falaise), et vous manquerez peut-être un peu de décontraction pour fredonner la chanson de Gainsbourg "Le poinçonneur des lilas", même si cela serait de circonstance (pour les p’tits trous...). Secteur "Jo Barre Team" : on y trouve les voies plus faciles qui manquaient à Cantobre dans un mur vertical d’environ 40 m de hauteur, criblé de trous. Du 5c au 7b+.\r\nBest of . “Soirée mousse“, 5c+. . “Jo barre team“, 6c. . “Les mains savonneuses“, 7b. . “Turbulence“, 7b+, 35 m de continuité sur trous, très "Made in Cantobre". . “Gazoline“, 7c+. . “VO2 max", 8a+. . “Mission impossible“, 8a/a+, et son jeté rendu célèbre par Gérôme Pouvreau lors du Roc Trip. . “La Breloque“, 8b+, en 15 mouvements, ultra physique et court. 	Cantobre se trouve à 35 km de Millau. Le Trèvezel (au pied de la falaise) permet de se rafraichir en été, mais il est parfois capricieux au printemps et sa traversée (normalement à gué) peut mouiller jusqu’en haut des cuisses en période de crue. Et en plus, l’eau est gelée. Compter 15 à 20 mn de marche.\r\nQuand y aller? Meilleure période : on peut grimper à Cantobre toute l’année. L’hiver, quand il fait beau, la falaise est au soleil. L’été, le secteur Jo Barre Team passe à l’ombre le premier à partir de 15 h, suivi des autres secteurs, une à deux heures après. Le mieux, c’est le printemps et l’automne. 	Le site de Cantobre se trouve dans le topo : L a D o u r b i e CAF Millau, éditions Causses et Cévennes, 2007. Couleur Caillou, le club d’escalade de Millau, vous tient au courant des actualisations, événements, interdictions, nouveautés, etc... www.topo-tarn-jonte-dourbie.info/fr/.	44.060555,3.304444	http://www.grimper.com/media/guide_falaises/sites/sam_bie_cantobre__crop_995x516.jpg
12	11	Claret	34	Falaise	30m	Sud	100 voies	5c à 8c	À 30 km au nord de Montpellier, Claret est une falaise mythique du sud de la France. Pour plein de raisons. Parce qu’elle a du caractère et qu’elle ne fait pas dans la dentelle. Parce qu’elle souhaite la bienvenue en annonçant «mort aux cons» sur le chemin d’accès. Parce que ce sont des personnages hauts en couleur et forts en gueule qui ont fait son histoire, son ambiance, son état d’esprit, son éthique particulière. Parce que tout ici reflète l’esprit et la mémoire de ces grands messieurs de la montagne qui l’ont forgée au début des années 1990, dont Hugues Beauzile, Pierre Rouzo, Lucien Bérardini et François Fromager. Parce que les voies sont magnifiques mais physiques, et l’escalade très atypique. Parce que les 5 sont les plus durs du monde, et qu’aucune croix n’est cadeau. Parce que l’équipement est espacé et qu’il le restera. Alors, si l’histoire et l’originalité de Claret vous interpellent, allez donc vous frotter à ces voies qui remontent une face barrée de deux avancées plafonesques et vous y faire des souvenirs. On y trouve quand même aussi de jolies dalles, et la majorité des voies se situent entre 6b+ et 7b+.	Ici, à la falaise des Embruscalles, puisque c’est son nom, le rocher est un calcaire plutôt blanc. Il paraît très fissuré avec ses gros cubes imbriqués, mais il est excellent. Ces formes en cubes rendent le rocher difficile à lire, mais font de bonnes prises dans cette falaise surplombante avec des plafonds, des stalactites, des dévers, où les voies sont souvent bloc avec des repos totaux, plein d’astuces, de ruses et de coincements de genoux. Pour résumer le «Claret staïle» en quelques mots: entre 3 et 5m entre les points, des départs bien bloc, des plats en pagaille, et une escalade très physique, et technique, parfois déroutante, et toujours engagée. Les voies font de 20m à 30m de hauteur. Le site propose plus de 200 couennes du 5b au 8c, mais soyons clairs, le niveau moyen est élevé. En effet, on trouve quelques lignes dans le 5 / 6a, mais la majorité se situe dans le 7a / 7b+. Descente des voies en moulinette. Une corde de 60m est suffisante. On ne peut parler de Claret sans parler de l’équipement à Claret. Hugues Beauzile, ouvreur principal de la falaise, a observé une éthique propre et unique pour l’époque: l’équipement était souvent aéré, et aucun point de renvoi «artificiel» ne fut utilisé pour ouvrir toutes les voies, puisque tout se fit au crochet goutte d’eau et au coinceur. Cette éthique a des conséquences en termes d’assurage, qui se doit d’être dynamique compte tenu du profil des voies, d’autant plus que l’équipement est espacé. Si l’engagement rend vos émois difficiles à maîtriser, rassurez-vous en pensant que les points sont intelligemment placés (à quoi bon s’arrêter mousquetonner quand la chute n’est pas risquée?…)	Le site se trouve à 30 kilomètres au nord de Montpellier. De Montpellier, suivre la direction Alès jusqu’à trouver les panneaux indiquant Claret. Traverser Claret en restant sur la route principale qui semble aller pile en direction de la falaise, bien visible en face. À la sortie de Claret, prendre direction Les Embruscalles en restant sur la D107, traverser le hameau des Embruscalles en continuant vers la falaise. Se garer sur le bascôté de la route au niveau d’un ancien transformateur (environ cinq minutes depuis Claret), le mieux possible pour ne pas gêner la circulation et laisser de la place pour les autres. Le sentier d’accès démarre juste à côté du transfo, au niveau du panneau «Feux interdits». Compter environ dix minutes, en montée.	Claret, P.Rouzo, 2011. Le topo est en vente dans les magasins d’escalade autour de Montpellier. Vous le trouverez facilement au magasin le Yéti (situé au nord de Montpellier à Jacou) ou bien à Expé (situé boulevard Gambetta à Montpellier).	43.871666,3.869722	http://www.grimper.com/media/guide_falaises/sites/sam_bie4_claret__crop_995x516.jpg
13	2	Clemont	25	Falaise	10 à 25m	Plein sud	70 voies	4c à 8c	La falaise de Clémont est une petite jeune qui a récemment rejoint la longue liste des falaises du département grâce au travail du comité départemental FFME du Doubs. En effet, elle n’était pas vraiment passée inaperçue, mais d’anciens conflits avec les ornithologues avaient jusqu’ici entravé le développement du site. Pour éviter de reproduire ces erreurs, les maîtres-mots auront été concertation, conciliation et patience. Pour enfin aboutir à l’autorisation d’équiper une bonne partie de la falaise. Depuis le temps que les chercheurs de falaises locaux louchaient dessus! Forcément, un magnifique calcaire, une hauteur de 10 à 25 m, un beau potentiel, un cadre sympa et tranquille… Tout cela était très prometteur. Aujourd’hui, la falaise de Clémont a tenu ses promesses, et compte quasiment 80 voies, du 4c au projet non répertorié, avec une quarantaine de voies dans le 6edegré qui valent pour beaucoup le détour, et plus de 25 dans le 7e degré… Et avec son sentier d’accès et les pieds des voies bien aménagés (merci Verticool), des panneaux d’information et de fléchage, de petits galets originaux au pied de chaque voie, tout est fait pour augmenter les joies de l’escalade dans ce site qui a tout pour plaire aux amateurs de nouveauté, de beau rocher, de tranquillité et de cadres agréables.	En guise de rocher, vous trouverez un beau calcaire allant de l’ocre jaune au gris-bleu, quelques rares colos, des trous en tous genres, mais surtout des strates à gogo… De la bien profonde les unes au-dessus des autres, à de la toute fine où les doigts ont bien du mal à s’immiscer! Sur ce support ont été équipées plus de 70 voies, d’une hauteur maximum de 25m. Le profil majoritaire est plutôt vertical, même si dans certaines le dévers est bien prononcé. L’équipement a été réalisé en broches scellées avec relais reliés, le tout inox, et plutôt rapproché, au dire des grimpeurs qui fréquentent le site. Un choix assumé des équipeurs pour une garantie «plaisir avant tout».	Depuis Montbéliard, prendre la D437 direction Pontarlier. Traverser Pont-de-Roide et au rond-point à la sortie de Noirefontaine, prendre la D36 à gauche direction Montécheroux. Dans Montécheroux, à l’intersection à la fin de la ligne droite, prendre tout droit vers l’usine FMX, puis au rond-point à gauche dans la voie sans issue. Continuer sur la piste en suivant le fléchage sur 2km jusqu’au parking. Ajouter dix minutes de marche pour accéder aux premiers secteurs.	\N	47.357777,6.778056	http://www.grimper.com/media/guide_falaises/sites/falaise__crop_995x516.jpg
14	12	Clisson	44	Bloc	2 à 5m	Toutes	100 passages	3a à 7a	Rien à grimper dans l’ouest? Archifaux. La preuve, avec ce bon petit spot de bloc bien connu des grimpeurs nantais. Située au carrefour des trois anciennes provinces que formaient l’Anjou, le Poitou et la Bretagne, la vallée de Clisson se situe à vingt-cinq minutes au sud de Nantes. On trouve là de nombreux blocs, bordés d’une frange de forêt le long de la Sèvre, au pied du château de Clisson. Un petit spot pour les amoureux du granit et du bloc. Mieux encore, le site de Clisson est loin de se faire élitiste, bien au contraire. Accueillant sous tous rapports, il est même une bonne façon de sortir grimper entre potes ou en famille. Clisson est vraiment sorti de l’ombre en 2003, lorsque Loïc Fossard et Simon Lelardoux, tombés sous le charme, décident de dynamiser le site. Aidés de quelques acharnés, ils brossent l’ensemble des blocs, dévoilent la plupart des passages et mettent en place un nouveau topo qui attire rapidement bon nombre de grimpeurs. Avec ses jolis problèmes made on granit, Clisson offre des passages de tous niveaux dans un cadre très agréable	Clisson étant somme toute encore assez proche de la Bretagne, la principale roche que l’on trouve ici reste le bon vieux granit breton. Moins agressif que celui qui règne sur la côte nord de la Bretagne, il faudra cependant apprendre à l’apprivoiser afin de taper un maximum d’essais sur les nombreux passages du site. On dénombre douze secteurs différents et une centaine de passages, en dalle et vertical, dans des niveaux accessibles à tous, du 3a au 7a. La hauteur des blocs varie de 2 à 5 mètres. Il y a même, pour les blocs les plus élevés, des points scellés au sommet qui vous permettront, si la ligne vous impressionne, de mettre en place une corde.	De Nantes, prendre la direction de l’autoroute de Bordeaux. Juste avant le péage, sortir en direction d’Aigrefeuille. Traverser le village, puis tourner à gauche vers SaintLumine, puis Clisson. Une fois dans le village, il faut se diriger vers la gare SNCF, puis le village vacances Henri IV. Deux parkings sont à votre disposition. Soit au niveau du village vacances et du cimetière (cinq minutes de marche), soit en contrebas du château (dix minutes de marche).\r\nQuand y aller? Spot ombragé et agréable par beau temps. En début de saison, une brosse est utile. 	Escalade en Loire-Atlantique - Clisson, La Montagne, Le Pallet, Le Croisic, Pierres Meslières, Pont-Caffino, RocheBallue, CAF, FFME, 2012.	47.084166,-1.275833	http://www.grimper.com/media/guide_falaises/sites/falaise__crop_995x516.jpg
\.


--
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_id_seq', 1, false);


--
-- Data for Name: topo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topo (id, name, description, publisher, cover, available, lent_to, user_id, site_id, region_id) FROM stdin;
1	Escalade les calanques	Ce topo est une sélection élargie des escalades dans le massif des Calanques. Il s’inscrit dans la lignée des précédents topos publiés par le CD 13 FFME. Un magnifique ouvrage, une nouvelle référence pour l'un des plus beaux sites d'escalade ....	FFME 2017	http://blog.approach-outdoor.com/wp-content/uploads/2017/05/Capture-d%E2%80%99%C3%A9cran-2017-05-30-%C3%A0-09.56.05-203x300.png	t	\N	30	13	2
3	Escalades dans le Diois : 92 voies dans la vallée de la Drôme	Trois Becs Glandasse Archiane Aiguille de Bénevise Paroi de Tussac Rocher du Combeau Claps Gorges des Gâts Rochers de Chironne Vallée de la Roanne Valcroissant 72 voies décrites. Tracé des voies sur croquis noir et blanc. 	Promo grimpe 2012	https://images-na.ssl-images-amazon.com/images/I/51dqYMDBSML._SX360_BO1,204,203,200_.jpg	f	30	7	11	1
2	40 Falaises aux environs du lac d'Annecy	Escalade choisie aux environs du lac d'Annecy 1497 longueurs du 3a au 9a Allonzier la Caille La Balme de Sillingy Lesvaux Rampon Mont Baret Mont Veyrier Chapeau de Napoléon Rocher des Moillats Roche de Roux Lars Balmettes Pérouses Duingt Falaise de Taillefer Dalle Rousse Quintal Eau Vive Grande Jeanne Sainte Catherine Nonglard Angon Tours St Jacques Pont de la Caille Béard Parmelan Malpas Vovray Chaumont Pierre Taillée Chapelle Col des Glières Commanderie Ablon Dalle des Vorets Falaise du Bouton Roc de Viuz Cons Ste Colombe Lanfonnet Biclop	Robert Durieux 2017	https://images-na.ssl-images-amazon.com/images/I/51bn8F223ZL._SX336_BO1,204,203,200_.jpg	t	\N	30	1	1
5	Oisans nouveau Oisans sauvage : Livre Est	Ce recueil s'efforce de présenter deux aspects d'une même activité. D'abord l'Oisans nouveau : une grosse majorité de voies ouvertes assez récemment, où la progression est rendue plus rapide et plus sereine par la présence d'un équipement correct laissé le plus souvent en place.	Jean-Michel Cambon 2004	https://images-na.ssl-images-amazon.com/images/I/51QAXFT2DYL._SX339_BO1,204,203,200_.jpg	f	3	3	2	13
4	Escalades autour du Lac du Bourget	Plus qu'un topo, une oeuvre d'art : tracés des voies sur aquarelles ! Val de Fier, Chindrieux, Cessens, Chambotte, Brison, Yenne, Peney, Semnoz et beaucoup d'autres sites dans les Bauges, au dessus de Chambéry et autour du lac d'Aix les Bains.	Entre Prises 2008	https://images-na.ssl-images-amazon.com/images/I/512QSNY9MHL._SX334_BO1,204,203,200_.jpg	t	\N	7	6	1
\.


--
-- Name: topo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topo_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, first_name, last_name, avatar_id, road, postal_code, city, country, level_id) FROM stdin;
5	luc@gmail.com	2e6fdbc573b2975790d504991183519e	Luc		8	\N	\N	\N	\N	2
1	nslr@riseup.net	5e293ea5c348663ddd8c32169353dae1	Yann	Kybox	3	\N	\N	\N	\N	1
7	donald@duck.com	e48e2c48a51fcc8d7f727ff57337de15	Donald	Duck	11	\N	\N	\N	\N	2
12	mickey@mouse.com	4d5257e5acc7fcac2f5dcd66c4e78f9a	Mickey	Mouse	5	\N	\N	\N	\N	2
2	john@doe.com	527bd5b5d689e2c32ae974c6229ff785	John	Doe	10	\N	\N	\N	\N	2
3	rob@flynn.com	760061f6bfde75c29af12f252d4d3345	Rob	Flynn	16	\N	\N	\N	\N	2
6	alex@gmail.com	534b44a19bf18d20b71ecc4eb77c572f	Alex	Lessieur	18	\N	\N	\N	\N	2
31	admin@root.com	63a9f0ea7bb98050796b649e85481845	Admin		17	\N	\N	\N	\N	1
4	alfred@gmail.com	d41d8cd98f00b204e9800998ecf8427e	Alfred	Doe	4	\N	\N	\N	\N	2
32	san@goku.com	4658f151aa7c96dc0171420a64103bd9	Goku		\N	\N	\N	\N	\N	2
33	spider@man.com	47db3d98db54945470598f2dad42bdb2	Spiderman		\N	\N	\N	\N	\N	2
30	lou@lou.fr	737ac27d104556512c9277c2766e9fc0	Lou	lou	10	12 rue d'ici	91660	Tonneins	France	1
34	user@lambda.com	0d8d5cd06832b29560745fe4e1b941cf	User	Lambda	\N	\N	\N	\N	\N	2
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 34, true);


--
-- Name: avatar avatar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar
    ADD CONSTRAINT avatar_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: level level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_pkey PRIMARY KEY (id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);


--
-- Name: topo topo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT topo_pkey PRIMARY KEY (id);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: users fk_avatar_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_avatar_id FOREIGN KEY (avatar_id) REFERENCES public.avatar(id);


--
-- Name: users fk_level_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_level_id FOREIGN KEY (level_id) REFERENCES public.level(id);


--
-- Name: site fk_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT fk_region_id FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: comment fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_site_id FOREIGN KEY (site_id) REFERENCES public.site(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comment fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: topo lent_to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT lent_to FOREIGN KEY (lent_to) REFERENCES public.users(id);


--
-- Name: topo region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT region_id FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: topo site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT site_id FOREIGN KEY (site_id) REFERENCES public.site(id);


--
-- Name: topo user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

