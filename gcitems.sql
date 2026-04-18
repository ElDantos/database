--
-- PostgreSQL database dump
--

\restrict O4ABhyK9hQeKzJyCNSIrcUENGANA7bbVwZOcwQtgs3HtQApI1gIk4KSV7uWW9ge

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-03-08 00:41:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 16620)
-- Name: etiquetas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etiquetas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.etiquetas OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16628)
-- Name: etiquetas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etiquetas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etiquetas_id_seq OWNER TO postgres;

--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 220
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etiquetas_id_seq OWNED BY public.etiquetas.id;


--
-- TOC entry 221 (class 1259 OID 16629)
-- Name: imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagenes (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    url character varying(500) NOT NULL,
    orden integer NOT NULL,
    tipo text,
    CONSTRAINT imagenes_orden_check CHECK (((orden >= 1) AND (orden <= 5)))
);


ALTER TABLE public.imagenes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16639)
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.imagenes_id_seq OWNER TO postgres;

--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 222
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagenes_id_seq OWNED BY public.imagenes.id;


--
-- TOC entry 223 (class 1259 OID 16640)
-- Name: producto_etiqueta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_etiqueta (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    etiqueta_id integer NOT NULL
);


ALTER TABLE public.producto_etiqueta OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16646)
-- Name: producto_etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_etiqueta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_etiqueta_id_seq OWNER TO postgres;

--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 224
-- Name: producto_etiqueta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_etiqueta_id_seq OWNED BY public.producto_etiqueta.id;


--
-- TOC entry 225 (class 1259 OID 16647)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    codigo character varying(30) NOT NULL,
    descripcion character varying(200) NOT NULL,
    codigo_de_linea character varying(6) NOT NULL,
    codigo_de_categoria character varying(6) DEFAULT ''::character varying,
    codigo_de_sublinea character varying(6),
    codigo_de_color character varying(6) DEFAULT ''::character varying,
    referencia character varying(20) DEFAULT ''::character varying,
    modelo character varying(20) DEFAULT ''::character varying,
    tipo character(1) DEFAULT 'V'::bpchar,
    garantia character varying(30) DEFAULT ''::character varying,
    precio1 numeric(18,2) DEFAULT 0,
    precio2 numeric(18,2) DEFAULT 0,
    precio3 numeric(18,2) DEFAULT 0,
    precio4 numeric(18,2) DEFAULT 0,
    precio5 numeric(18,2) DEFAULT 0,
    anulado boolean DEFAULT false,
    cbl integer DEFAULT 0,
    mgta integer DEFAULT 0,
    etg integer DEFAULT 0,
    pzo integer DEFAULT 0,
    ccs integer DEFAULT 0,
    val integer DEFAULT 0,
    mcy integer DEFAULT 0,
    mcb integer DEFAULT 0,
    mat integer DEFAULT 0,
    plc integer DEFAULT 0,
    suc1 integer DEFAULT 0,
    suc2 integer DEFAULT 0,
    suc3 integer DEFAULT 0,
    suc4 integer DEFAULT 0,
    suc5 integer DEFAULT 0,
    last_updated timestamp without time zone,
    slug character varying(255)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16683)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 226
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 4871 (class 2604 OID 16684)
-- Name: etiquetas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiquetas ALTER COLUMN id SET DEFAULT nextval('public.etiquetas_id_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 16685)
-- Name: imagenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes ALTER COLUMN id SET DEFAULT nextval('public.imagenes_id_seq'::regclass);


--
-- TOC entry 4874 (class 2604 OID 16686)
-- Name: producto_etiqueta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_etiqueta ALTER COLUMN id SET DEFAULT nextval('public.producto_etiqueta_id_seq'::regclass);


--
-- TOC entry 4875 (class 2604 OID 16687)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 5068 (class 0 OID 16620)
-- Dependencies: 219
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etiquetas (id, nombre, descripcion, created_at) FROM stdin;
1	laptop	\N	2026-02-26 13:17:08.470489
2	impresora	\N	2026-02-26 13:17:08.470489
3	toner	\N	2026-02-26 13:17:08.470489
4	tinta	\N	2026-02-26 13:17:08.470489
5	router	\N	2026-02-26 13:17:08.470489
6	wifi	\N	2026-02-26 13:17:08.470489
7	redes	\N	2026-02-26 13:17:08.470489
8	seguridad	\N	2026-02-26 13:17:08.470489
9	vigilancia	\N	2026-02-26 13:17:08.470489
10	ssd	\N	2026-02-26 13:17:08.470489
11	almacenamiento	\N	2026-02-26 13:17:08.470489
12	monitor	\N	2026-02-26 13:17:08.470489
13	gaming	\N	2026-02-26 13:17:08.470489
14	empresarial	\N	2026-02-26 13:17:08.470489
15	oficina	\N	2026-02-26 13:17:08.470489
16	papeleria	\N	2026-02-26 13:17:08.470489
17	telefonia	\N	2026-02-26 13:17:08.470489
18	ethernet	\N	2026-02-26 13:17:08.470489
19	ups	\N	2026-02-26 13:17:08.470489
20	periferico	\N	2026-02-26 13:17:08.470489
21	camara	\N	2026-02-26 13:17:08.470489
22	switch	\N	2026-02-26 13:17:08.470489
23	access_point	\N	2026-02-26 13:17:08.470489
24	scanner	\N	2026-02-26 13:17:08.470489
25	proyector	\N	2026-02-26 13:17:08.470489
26	tablet	\N	2026-02-26 13:17:08.470489
27	servidor	\N	2026-02-26 13:17:08.470489
28	nas	\N	2026-02-26 13:17:08.470489
29	firewall	\N	2026-02-26 13:17:08.470489
30	multifuncional	\N	2026-02-26 13:17:08.470489
\.


--
-- TOC entry 5070 (class 0 OID 16629)
-- Dependencies: 221
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagenes (id, producto_id, url, orden, tipo) FROM stdin;
11	11	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax6-1.jpg	1	principal
12	12	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k507-1.jpg	1	principal
13	13	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
14	14	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-1.jpg	1	principal
15	15	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3010-1.jpg	1	principal
16	16	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k511-1.jpg	1	principal
17	17	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax12-1.jpg	1	principal
18	18	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k513-1.jpg	1	principal
19	19	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k514-1.jpg	1	principal
20	20	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3015-1.jpg	1	principal
21	21	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
22	22	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k517-1.jpg	1	principal
23	23	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax18-1.jpg	1	principal
24	24	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k519-1.jpg	1	principal
25	25	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3020-1.jpg	1	principal
26	26	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-1.jpg	1	principal
27	27	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k522-1.jpg	1	principal
28	28	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k523-1.jpg	1	principal
29	29	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax24-1.jpg	1	principal
30	30	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3025-1.jpg	1	principal
31	31	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k526-1.jpg	1	principal
32	32	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-1.jpg	1	principal
33	33	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
34	34	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k529-1.jpg	1	principal
35	35	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax30-1.jpg	1	principal
36	36	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k531-1.jpg	1	principal
37	37	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
38	38	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-1.jpg	1	principal
39	39	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k534-1.jpg	1	principal
40	40	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3035-1.jpg	1	principal
41	41	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax36-1.jpg	1	principal
42	42	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k537-1.jpg	1	principal
43	43	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k538-1.jpg	1	principal
44	44	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-1.jpg	1	principal
45	45	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3040-1.jpg	1	principal
46	46	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k541-1.jpg	1	principal
47	47	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax42-1.jpg	1	principal
48	48	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k543-1.jpg	1	principal
49	49	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
50	50	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3045-1.jpg	1	principal
51	51	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k546-1.jpg	1	principal
52	52	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k547-1.jpg	1	principal
53	53	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax48-1.jpg	1	principal
54	54	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k549-1.jpg	1	principal
55	55	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3050-1.jpg	1	principal
56	56	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-1.jpg	1	principal
57	57	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
58	58	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k553-1.jpg	1	principal
59	59	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax54-1.jpg	1	principal
60	60	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3055-1.jpg	1	principal
61	61	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
2	2	/Laptop-Dell-Inspiron-15-3520-i5-16GB-512GB-SSD/Laptop-Dell-Inspiron-15-3520-i5-16GB-512GB-SSD1.jpg	1	principal
3	3	/Laptop-Lenovo-ThinkPad-E14-Gen-4-Ryzen-7-16GB/Laptop-Lenovo-ThinkPad-E14-Gen-4-Ryzen-7-16GB1.jpg	1	principal
4	4	/Laptop-ASUS-VivoBook-15-X1502ZA-i5-8GB-512GB/Laptop-ASUS-VivoBook-15-X1502ZA-i5-8GB-512GB1.jpg	1	principal
5	5	/Laptop-Acer-Aspire-5-A515-Ryzen-5-16GB-SSD/Laptop-Acer-Aspire-5-A515-Ryzen-5-16GB-SSD1.jpg	1	principal
6	6	/Teclado-Mecanico-Redragon-K501/Teclado-Mecanico-Redragon-K5011.jpg	1	principal
7	7	/Teclado-Mecanico-Redragon-K502/Teclado-Mecanico-Redragon-K5021.jpg	1	principal
8	8	/Monitor-LG-25-pulgadas-Full-HD/Monitor-LG-25-pulgadas-Full-HD1.jpg	1	principal
9	9	/Disco-SSD-Kingston-NV2-256GB/Disco-SSD-Kingston-NV2-256GB1.jpg	1	principal
10	10	/Impresora-Epson-EcoTank-L3005/Impresora-Epson-EcoTank-L30051.jpg	1	principal
62	62	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-1.jpg	1	principal
63	63	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k558-1.jpg	1	principal
64	64	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k559-1.jpg	1	principal
65	65	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax60-1.jpg	1	principal
66	66	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k561-1.jpg	1	principal
67	67	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k562-1.jpg	1	principal
68	68	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-1.jpg	1	principal
69	69	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
70	70	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3065-1.jpg	1	principal
71	71	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax66-1.jpg	1	principal
72	72	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k567-1.jpg	1	principal
73	73	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
74	74	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-1.jpg	1	principal
75	75	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3070-1.jpg	1	principal
76	76	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k571-1.jpg	1	principal
77	77	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax72-1.jpg	1	principal
78	78	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k573-1.jpg	1	principal
79	79	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k574-1.jpg	1	principal
80	80	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3075-1.jpg	1	principal
81	81	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
82	82	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k577-1.jpg	1	principal
83	83	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax78-1.jpg	1	principal
84	84	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k579-1.jpg	1	principal
85	85	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3080-1.jpg	1	principal
86	86	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-1.jpg	1	principal
87	87	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k582-1.jpg	1	principal
88	88	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k583-1.jpg	1	principal
89	89	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax84-1.jpg	1	principal
90	90	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3085-1.jpg	1	principal
91	91	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k586-1.jpg	1	principal
92	92	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-1.jpg	1	principal
93	93	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
94	94	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k589-1.jpg	1	principal
95	95	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax90-1.jpg	1	principal
96	96	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k591-1.jpg	1	principal
97	97	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-1.jpg	1	principal
98	98	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-1.jpg	1	principal
99	99	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k594-1.jpg	1	principal
100	100	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3095-1.jpg	1	principal
111	11	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax6-2.jpg	2	galeria
112	12	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k507-2.jpg	2	galeria
113	13	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
114	14	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-2.jpg	2	galeria
115	15	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3010-2.jpg	2	galeria
116	16	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k511-2.jpg	2	galeria
117	17	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax12-2.jpg	2	galeria
118	18	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k513-2.jpg	2	galeria
119	19	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k514-2.jpg	2	galeria
120	20	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3015-2.jpg	2	galeria
121	21	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
122	22	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k517-2.jpg	2	galeria
102	2	/Laptop-Dell-Inspiron-15-3520-i5-16GB-512GB-SSD/Laptop-Dell-Inspiron-15-3520-i5-16GB-512GB-SSD2.jpg	2	galeria
103	3	/Laptop-Lenovo-ThinkPad-E14-Gen-4-Ryzen-7-16GB/Laptop-Lenovo-ThinkPad-E14-Gen-4-Ryzen-7-16GB2.jpg	2	galeria
105	5	/Laptop-Acer-Aspire-5-A515-Ryzen-5-16GB-SSD/Laptop-Acer-Aspire-5-A515-Ryzen-5-16GB-SSD2.jpg	2	galeria
104	4	/Laptop-ASUS-VivoBook-15-X1502ZA-i5-8GB-512GB/Laptop-ASUS-VivoBook-15-X1502ZA-i5-8GB-512GB2.jpg	2	galeria
106	6	/Teclado-Mecanico-Redragon-K501/Teclado-Mecanico-Redragon-K5012.jpg	2	galeria
107	7	/Teclado-Mecanico-Redragon-K502/Teclado-Mecanico-Redragon-K5022.jpg	2	galeria
108	8	/Monitor-LG-25-pulgadas-Full-HD/Monitor-LG-25-pulgadas-Full-HD2.jpg	2	galeria
109	9	/Disco-SSD-Kingston-NV2-256GB/Disco-SSD-Kingston-NV2-256GB2.jpg	2	galeria
110	10	/Impresora-Epson-EcoTank-L3005/Impresora-Epson-EcoTank-L30052.jpg	2	galeria
123	23	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax18-2.jpg	2	galeria
124	24	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k519-2.jpg	2	galeria
125	25	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3020-2.jpg	2	galeria
126	26	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-2.jpg	2	galeria
127	27	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k522-2.jpg	2	galeria
128	28	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k523-2.jpg	2	galeria
129	29	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax24-2.jpg	2	galeria
130	30	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3025-2.jpg	2	galeria
131	31	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k526-2.jpg	2	galeria
132	32	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-2.jpg	2	galeria
133	33	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
134	34	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k529-2.jpg	2	galeria
135	35	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax30-2.jpg	2	galeria
136	36	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k531-2.jpg	2	galeria
137	37	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
138	38	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-2.jpg	2	galeria
139	39	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k534-2.jpg	2	galeria
140	40	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3035-2.jpg	2	galeria
141	41	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax36-2.jpg	2	galeria
142	42	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k537-2.jpg	2	galeria
143	43	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k538-2.jpg	2	galeria
144	44	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-2.jpg	2	galeria
145	45	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3040-2.jpg	2	galeria
146	46	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k541-2.jpg	2	galeria
147	47	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax42-2.jpg	2	galeria
148	48	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k543-2.jpg	2	galeria
149	49	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
150	50	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3045-2.jpg	2	galeria
151	51	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k546-2.jpg	2	galeria
152	52	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k547-2.jpg	2	galeria
153	53	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax48-2.jpg	2	galeria
154	54	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k549-2.jpg	2	galeria
155	55	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3050-2.jpg	2	galeria
156	56	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-2.jpg	2	galeria
157	57	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
158	58	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k553-2.jpg	2	galeria
159	59	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax54-2.jpg	2	galeria
160	60	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3055-2.jpg	2	galeria
161	61	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
162	62	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-2.jpg	2	galeria
163	63	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k558-2.jpg	2	galeria
164	64	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k559-2.jpg	2	galeria
165	65	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax60-2.jpg	2	galeria
166	66	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k561-2.jpg	2	galeria
167	67	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k562-2.jpg	2	galeria
168	68	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-2.jpg	2	galeria
169	69	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
170	70	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3065-2.jpg	2	galeria
171	71	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax66-2.jpg	2	galeria
172	72	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k567-2.jpg	2	galeria
173	73	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
174	74	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-2.jpg	2	galeria
175	75	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3070-2.jpg	2	galeria
176	76	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k571-2.jpg	2	galeria
177	77	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax72-2.jpg	2	galeria
178	78	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k573-2.jpg	2	galeria
179	79	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k574-2.jpg	2	galeria
180	80	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3075-2.jpg	2	galeria
181	81	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
182	82	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k577-2.jpg	2	galeria
183	83	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax78-2.jpg	2	galeria
184	84	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k579-2.jpg	2	galeria
185	85	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3080-2.jpg	2	galeria
186	86	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-2.jpg	2	galeria
187	87	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k582-2.jpg	2	galeria
188	88	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k583-2.jpg	2	galeria
189	89	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax84-2.jpg	2	galeria
190	90	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3085-2.jpg	2	galeria
191	91	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k586-2.jpg	2	galeria
192	92	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-2.jpg	2	galeria
193	93	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
194	94	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k589-2.jpg	2	galeria
195	95	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax90-2.jpg	2	galeria
196	96	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k591-2.jpg	2	galeria
197	97	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-2.jpg	2	galeria
198	98	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-2.jpg	2	galeria
199	99	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k594-2.jpg	2	galeria
200	100	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3095-2.jpg	2	galeria
211	11	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax6-3.jpg	3	detalle
212	12	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k507-3.jpg	3	detalle
213	13	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
214	14	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-3.jpg	3	detalle
215	15	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3010-3.jpg	3	detalle
216	16	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k511-3.jpg	3	detalle
217	17	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax12-3.jpg	3	detalle
218	18	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k513-3.jpg	3	detalle
219	19	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k514-3.jpg	3	detalle
220	20	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3015-3.jpg	3	detalle
221	21	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
222	22	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k517-3.jpg	3	detalle
223	23	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax18-3.jpg	3	detalle
224	24	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k519-3.jpg	3	detalle
225	25	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3020-3.jpg	3	detalle
226	26	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-3.jpg	3	detalle
227	27	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k522-3.jpg	3	detalle
228	28	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k523-3.jpg	3	detalle
229	29	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax24-3.jpg	3	detalle
230	30	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3025-3.jpg	3	detalle
231	31	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k526-3.jpg	3	detalle
232	32	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-3.jpg	3	detalle
233	33	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
234	34	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k529-3.jpg	3	detalle
235	35	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax30-3.jpg	3	detalle
236	36	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k531-3.jpg	3	detalle
237	37	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
238	38	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-3.jpg	3	detalle
239	39	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k534-3.jpg	3	detalle
240	40	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3035-3.jpg	3	detalle
241	41	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax36-3.jpg	3	detalle
242	42	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k537-3.jpg	3	detalle
243	43	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k538-3.jpg	3	detalle
244	44	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-3.jpg	3	detalle
245	45	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3040-3.jpg	3	detalle
202	2	/Laptop-Dell-Inspiron-15-3520-i5-16GB-512GB-SSD/Laptop-Dell-Inspiron-15-3520-i5-16GB-512GB-SSD3.jpg	3	detalle
203	3	/Laptop-Lenovo-ThinkPad-E14-Gen-4-Ryzen-7-16GB/Laptop-Lenovo-ThinkPad-E14-Gen-4-Ryzen-7-16GB3.jpg	3	detalle
204	4	/Laptop-ASUS-VivoBook-15-X1502ZA-i5-8GB-512GB/Laptop-ASUS-VivoBook-15-X1502ZA-i5-8GB-512GB3.jpg	3	detalle
205	5	/Laptop-Acer-Aspire-5-A515-Ryzen-5-16GB-SSD/Laptop-Acer-Aspire-5-A515-Ryzen-5-16GB-SSD3.jpg	3	detalle
207	7	/Teclado-Mecanico-Redragon-K502/Teclado-Mecanico-Redragon-K5023.jpg	3	detalle
206	6	/Teclado-Mecanico-Redragon-K501/Teclado-Mecanico-Redragon-K5013.jpg	3	detalle
208	8	/Monitor-LG-25-pulgadas-Full-HD/Monitor-LG-25-pulgadas-Full-HD3.jpg	3	detalle
209	9	/Disco-SSD-Kingston-NV2-256GB/Disco-SSD-Kingston-NV2-256GB3.jpg	3	detalle
210	10	/Impresora-Epson-EcoTank-L3005/Impresora-Epson-EcoTank-L30053.jpg	3	detalle
246	46	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k541-3.jpg	3	detalle
247	47	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax42-3.jpg	3	detalle
248	48	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k543-3.jpg	3	detalle
249	49	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
250	50	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3045-3.jpg	3	detalle
251	51	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k546-3.jpg	3	detalle
252	52	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k547-3.jpg	3	detalle
253	53	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax48-3.jpg	3	detalle
254	54	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k549-3.jpg	3	detalle
255	55	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3050-3.jpg	3	detalle
256	56	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-3.jpg	3	detalle
257	57	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
258	58	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k553-3.jpg	3	detalle
259	59	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax54-3.jpg	3	detalle
260	60	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3055-3.jpg	3	detalle
261	61	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
262	62	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-3.jpg	3	detalle
263	63	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k558-3.jpg	3	detalle
264	64	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k559-3.jpg	3	detalle
265	65	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax60-3.jpg	3	detalle
266	66	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k561-3.jpg	3	detalle
267	67	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k562-3.jpg	3	detalle
268	68	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-3.jpg	3	detalle
269	69	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
270	70	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3065-3.jpg	3	detalle
271	71	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax66-3.jpg	3	detalle
272	72	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k567-3.jpg	3	detalle
273	73	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
274	74	https://cdn.gallerycomputer.com/productos/monitor-lg-26-pulgadas-full-hd-3.jpg	3	detalle
275	75	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3070-3.jpg	3	detalle
276	76	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k571-3.jpg	3	detalle
277	77	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax72-3.jpg	3	detalle
278	78	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k573-3.jpg	3	detalle
279	79	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k574-3.jpg	3	detalle
280	80	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3075-3.jpg	3	detalle
281	81	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
282	82	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k577-3.jpg	3	detalle
283	83	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax78-3.jpg	3	detalle
284	84	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k579-3.jpg	3	detalle
285	85	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3080-3.jpg	3	detalle
286	86	https://cdn.gallerycomputer.com/productos/monitor-lg-23-pulgadas-full-hd-3.jpg	3	detalle
287	87	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k582-3.jpg	3	detalle
288	88	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k583-3.jpg	3	detalle
289	89	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax84-3.jpg	3	detalle
290	90	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3085-3.jpg	3	detalle
291	91	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k586-3.jpg	3	detalle
292	92	https://cdn.gallerycomputer.com/productos/monitor-lg-24-pulgadas-full-hd-3.jpg	3	detalle
293	93	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
294	94	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k589-3.jpg	3	detalle
295	95	https://cdn.gallerycomputer.com/productos/router-tp-link-archer-ax90-3.jpg	3	detalle
296	96	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k591-3.jpg	3	detalle
297	97	https://cdn.gallerycomputer.com/productos/disco-ssd-kingston-nv2-256gb-3.jpg	3	detalle
298	98	https://cdn.gallerycomputer.com/productos/monitor-lg-25-pulgadas-full-hd-3.jpg	3	detalle
299	99	https://cdn.gallerycomputer.com/productos/teclado-mecanico-redragon-k594-3.jpg	3	detalle
300	100	https://cdn.gallerycomputer.com/productos/impresora-epson-ecotank-l3095-3.jpg	3	detalle
1	1	/Laptop-HP-EliteBook-840-G8-i7-32GB-1TB-SSD/Laptop-HP-EliteBook-840-G8-i7-32GB-1TB-SSD1.jpg	1	principal
101	1	/Laptop-HP-EliteBook-840-G8-i7-32GB-1TB-SSD/Laptop-HP-EliteBook-840-G8-i7-32GB-1TB-SSD2.jpg	2	galeria
201	1	/Laptop-HP-EliteBook-840-G8-i7-32GB-1TB-SSD/Laptop-HP-EliteBook-840-G8-i7-32GB-1TB-SSD3.jpg	3	detalle
\.


--
-- TOC entry 5072 (class 0 OID 16640)
-- Dependencies: 223
-- Data for Name: producto_etiqueta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto_etiqueta (id, producto_id, etiqueta_id) FROM stdin;
723	3	10
724	4	10
725	3	13
726	4	13
727	3	14
728	4	14
729	3	15
730	4	15
731	10	3
732	10	15
733	10	30
734	15	3
735	15	15
736	15	30
737	20	3
738	20	15
739	20	30
740	25	3
741	25	15
742	25	30
743	30	3
744	30	15
745	30	30
746	40	3
747	40	15
748	40	30
749	45	3
750	45	15
751	45	30
752	50	3
753	50	15
754	50	30
755	55	3
756	55	15
757	55	30
758	60	3
759	60	15
760	60	30
761	70	3
762	70	15
763	70	30
764	75	3
765	75	15
766	75	30
767	80	3
768	80	15
769	80	30
770	85	3
771	85	15
772	85	30
773	90	3
774	90	15
775	90	30
776	100	3
777	100	15
778	100	30
779	11	6
780	17	6
781	23	6
782	29	6
783	35	6
784	41	6
785	47	6
786	53	6
787	59	6
788	65	6
789	71	6
790	77	6
791	83	6
792	89	6
793	95	6
794	11	7
795	17	7
796	23	7
797	29	7
798	35	7
799	41	7
800	47	7
801	53	7
802	59	7
803	65	7
804	71	7
805	77	7
806	83	7
807	89	7
808	95	7
809	11	18
810	17	18
811	23	18
812	29	18
813	35	18
814	41	18
815	47	18
816	53	18
817	59	18
818	65	18
819	71	18
820	77	18
821	83	18
822	89	18
823	95	18
824	11	22
825	17	22
826	23	22
827	29	22
828	35	22
829	41	22
830	47	22
831	53	22
832	59	22
833	65	22
834	71	22
835	77	22
836	83	22
837	89	22
838	95	22
839	11	23
840	17	23
841	23	23
842	29	23
843	35	23
844	41	23
845	47	23
846	53	23
847	59	23
848	65	23
849	71	23
850	77	23
851	83	23
852	89	23
853	95	23
854	11	29
855	17	29
856	23	29
857	29	29
858	35	29
859	41	29
860	47	29
861	53	29
862	59	29
863	65	29
864	71	29
865	77	29
866	83	29
867	89	29
868	95	29
869	94	20
870	28	20
871	48	20
872	99	20
873	82	20
874	27	20
875	67	20
876	39	20
877	31	20
878	76	20
879	51	20
880	66	20
626	25	2
627	60	4
628	57	11
629	62	12
630	85	4
631	40	2
632	61	10
633	32	12
634	49	10
635	38	12
636	73	10
637	30	2
638	21	11
639	13	11
640	1	10
641	1	1
642	89	5
643	55	2
644	5	1
645	44	12
646	17	5
647	25	4
648	29	5
649	56	12
650	30	4
651	1	11
652	81	10
653	5	10
654	4	1
655	37	11
656	33	10
657	53	5
658	8	12
659	98	12
660	90	4
661	90	2
662	35	5
663	83	5
664	68	12
665	74	12
666	70	4
667	69	11
668	20	4
669	100	2
670	9	11
671	100	4
672	60	2
673	2	10
674	10	2
675	3	1
676	70	2
677	55	4
678	5	11
679	45	4
680	23	5
681	40	4
682	92	12
683	71	5
684	57	10
685	73	11
686	80	2
687	9	10
688	2	11
689	80	4
690	33	11
691	95	5
692	50	4
693	13	10
694	15	2
695	47	5
696	97	10
697	50	2
698	2	1
699	81	11
700	14	12
701	11	5
702	26	12
703	93	10
704	75	4
705	85	2
706	41	5
707	93	11
708	86	12
709	49	11
710	65	5
711	21	10
712	97	11
713	69	10
714	20	2
715	61	11
716	15	4
717	10	4
718	77	5
719	45	2
720	75	2
721	59	5
722	37	10
881	42	20
882	18	20
883	12	20
884	79	20
885	34	20
886	72	20
887	6	20
888	84	20
889	64	20
890	54	20
891	16	20
892	36	20
893	46	20
894	22	20
895	91	20
896	58	20
897	87	20
898	96	20
899	43	20
900	52	20
901	19	20
902	63	20
903	24	20
904	78	20
905	7	20
906	88	20
\.


--
-- TOC entry 5074 (class 0 OID 16647)
-- Dependencies: 225
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, codigo, descripcion, codigo_de_linea, codigo_de_categoria, codigo_de_sublinea, codigo_de_color, referencia, modelo, tipo, garantia, precio1, precio2, precio3, precio4, precio5, anulado, cbl, mgta, etg, pzo, ccs, val, mcy, mcb, mat, plc, suc1, suc2, suc3, suc4, suc5, last_updated, slug) FROM stdin;
1	TEC001	Laptop HP EliteBook 840 G8 i7 32GB 1TB SSD	LAP	COM	HP		HP-840G8	840 G8	V	12 Meses	1200.00	1150.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	4	2	2	1	0	2026-02-26 13:17:08.484745	laptop-hp-elitebook-840-g8-i7-32gb-1tb-ssd
2	TEC002	Laptop Dell Inspiron 15 3520 i5 16GB 512GB SSD	LAP	COM	DELL		DELL-3520	Inspiron 3520	V	12 Meses	820.00	790.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	8	5	3	2	1	2026-02-26 13:17:08.484745	laptop-dell-inspiron-15-3520-i5-16gb-512gb-ssd
3	TEC003	Laptop Lenovo ThinkPad E14 Gen 4 Ryzen 7 16GB	LAP	COM	LEN		LEN-E14	ThinkPad E14	V	12 Meses	950.00	910.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	6	4	3	2	1	2026-02-26 13:17:08.484745	laptop-lenovo-thinkpad-e14-gen-4-ryzen-7-16gb
4	TEC004	Laptop ASUS VivoBook 15 X1502ZA i5 8GB 512GB	LAP	COM	ASUS		ASUS-X1502	VivoBook 15	V	12 Meses	730.00	700.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	7	5	4	2	1	2026-02-26 13:17:08.484745	laptop-asus-vivobook-15-x1502za-i5-8gb-512gb
5	TEC005	Laptop Acer Aspire 5 A515 Ryzen 5 16GB SSD	LAP	COM	ACER		ACER-A515	Aspire A515	V	12 Meses	780.00	750.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	6	4	3	2	1	2026-02-26 13:17:08.484745	laptop-acer-aspire-5-a515-ryzen-5-16gb-ssd
6	TEC006	Teclado Mecanico Redragon K501	ACC	COM	SUB1		REF-1	Modelo-1	V	12 Meses	64.00	59.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	6	4	3	2	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k501
7	TEC007	Teclado Mecanico Redragon K502	ACC	COM	SUB2		REF-2	Modelo-2	V	12 Meses	68.00	63.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	7	5	4	3	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k502
8	TEC008	Monitor LG 25 pulgadas Full HD	MON	COM	SUB3		REF-3	Modelo-3	V	12 Meses	72.00	67.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	8	6	5	4	3	2026-02-26 13:17:08.507234	monitor-lg-25-pulgadas-full-hd
9	TEC009	Disco SSD Kingston NV2 256GB	ALM	COM	SUB4		REF-4	Modelo-4	V	12 Meses	76.00	71.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	9	7	6	5	4	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
10	TEC010	Impresora Epson EcoTank L3005	IMP	COM	SUB5		REF-5	Modelo-5	V	12 Meses	80.00	75.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	10	8	7	6	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3005
11	TEC011	Router TP-Link Archer AX6	RED	COM	SUB6		REF-6	Modelo-6	V	12 Meses	84.00	79.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	11	9	8	7	1	2026-02-26 13:17:08.507234	router-tplink-archer-ax6
12	TEC012	Teclado Mecanico Redragon K507	ACC	COM	SUB7		REF-7	Modelo-7	V	12 Meses	88.00	83.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	12	10	9	8	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k507
13	TEC013	Disco SSD Kingston NV2 256GB	ALM	COM	SUB8		REF-8	Modelo-8	V	12 Meses	92.00	87.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	13	11	10	1	3	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
14	TEC014	Monitor LG 26 pulgadas Full HD	MON	COM	SUB9		REF-9	Modelo-9	V	12 Meses	96.00	91.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	14	12	11	2	4	2026-02-26 13:17:08.507234	monitor-lg-26-pulgadas-full-hd
15	TEC015	Impresora Epson EcoTank L3010	IMP	COM	SUB0		REF-10	Modelo-10	V	12 Meses	100.00	95.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	15	13	2	3	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3010
83	TEC083	Router TP-Link Archer AX78	RED	COM	SUB8		REF-78	Modelo-78	V	12 Meses	372.00	367.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	23	6	10	7	3	2026-02-26 13:17:08.507234	router-tplink-archer-ax78
16	TEC016	Teclado Mecanico Redragon K511	ACC	COM	SUB1		REF-11	Modelo-11	V	12 Meses	104.00	99.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	16	14	3	4	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k511
17	TEC017	Router TP-Link Archer AX12	RED	COM	SUB2		REF-12	Modelo-12	V	12 Meses	108.00	103.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	17	15	4	5	2	2026-02-26 13:17:08.507234	router-tplink-archer-ax12
18	TEC018	Teclado Mecanico Redragon K513	ACC	COM	SUB3		REF-13	Modelo-13	V	12 Meses	112.00	107.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	18	16	5	6	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k513
19	TEC019	Teclado Mecanico Redragon K514	ACC	COM	SUB4		REF-14	Modelo-14	V	12 Meses	116.00	111.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	19	17	6	7	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k514
20	TEC020	Impresora Epson EcoTank L3015	IMP	COM	SUB5		REF-15	Modelo-15	V	12 Meses	120.00	115.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	20	3	7	8	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3015
21	TEC021	Disco SSD Kingston NV2 256GB	ALM	COM	SUB6		REF-16	Modelo-16	V	12 Meses	124.00	119.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	21	4	8	1	1	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
22	TEC022	Teclado Mecanico Redragon K517	ACC	COM	SUB7		REF-17	Modelo-17	V	12 Meses	128.00	123.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	22	5	9	2	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k517
23	TEC023	Router TP-Link Archer AX18	RED	COM	SUB8		REF-18	Modelo-18	V	12 Meses	132.00	127.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	23	6	10	3	3	2026-02-26 13:17:08.507234	router-tplink-archer-ax18
24	TEC024	Teclado Mecanico Redragon K519	ACC	COM	SUB9		REF-19	Modelo-19	V	12 Meses	136.00	131.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	24	7	11	4	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k519
25	TEC025	Impresora Epson EcoTank L3020	IMP	COM	SUB0		REF-20	Modelo-20	V	12 Meses	140.00	135.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	5	8	2	5	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3020
26	TEC026	Monitor LG 23 pulgadas Full HD	MON	COM	SUB1		REF-21	Modelo-21	V	12 Meses	144.00	139.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	6	9	3	6	1	2026-02-26 13:17:08.507234	monitor-lg-23-pulgadas-full-hd
27	TEC027	Teclado Mecanico Redragon K522	ACC	COM	SUB2		REF-22	Modelo-22	V	12 Meses	148.00	143.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	7	10	4	7	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k522
28	TEC028	Teclado Mecanico Redragon K523	ACC	COM	SUB3		REF-23	Modelo-23	V	12 Meses	152.00	147.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	8	11	5	8	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k523
29	TEC029	Router TP-Link Archer AX24	RED	COM	SUB4		REF-24	Modelo-24	V	12 Meses	156.00	151.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	9	12	6	1	4	2026-02-26 13:17:08.507234	router-tplink-archer-ax24
30	TEC030	Impresora Epson EcoTank L3025	IMP	COM	SUB5		REF-25	Modelo-25	V	12 Meses	160.00	155.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	10	13	7	2	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3025
31	TEC031	Teclado Mecanico Redragon K526	ACC	COM	SUB6		REF-26	Modelo-26	V	12 Meses	164.00	159.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	11	14	8	3	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k526
32	TEC032	Monitor LG 24 pulgadas Full HD	MON	COM	SUB7		REF-27	Modelo-27	V	12 Meses	168.00	163.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	12	15	9	4	2	2026-02-26 13:17:08.507234	monitor-lg-24-pulgadas-full-hd
33	TEC033	Disco SSD Kingston NV2 256GB	ALM	COM	SUB8		REF-28	Modelo-28	V	12 Meses	172.00	167.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	13	16	10	5	3	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
34	TEC034	Teclado Mecanico Redragon K529	ACC	COM	SUB9		REF-29	Modelo-29	V	12 Meses	176.00	171.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	14	17	11	6	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k529
35	TEC035	Router TP-Link Archer AX30	RED	COM	SUB0		REF-30	Modelo-30	V	12 Meses	180.00	175.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	15	3	2	7	0	2026-02-26 13:17:08.507234	router-tplink-archer-ax30
36	TEC036	Teclado Mecanico Redragon K531	ACC	COM	SUB1		REF-31	Modelo-31	V	12 Meses	184.00	179.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	16	4	3	8	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k531
37	TEC037	Disco SSD Kingston NV2 256GB	ALM	COM	SUB2		REF-32	Modelo-32	V	12 Meses	188.00	183.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	17	5	4	1	2	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
38	TEC038	Monitor LG 25 pulgadas Full HD	MON	COM	SUB3		REF-33	Modelo-33	V	12 Meses	192.00	187.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	18	6	5	2	3	2026-02-26 13:17:08.507234	monitor-lg-25-pulgadas-full-hd
39	TEC039	Teclado Mecanico Redragon K534	ACC	COM	SUB4		REF-34	Modelo-34	V	12 Meses	196.00	191.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	19	7	6	3	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k534
40	TEC040	Impresora Epson EcoTank L3035	IMP	COM	SUB5		REF-35	Modelo-35	V	12 Meses	200.00	195.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	20	8	7	4	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3035
41	TEC041	Router TP-Link Archer AX36	RED	COM	SUB6		REF-36	Modelo-36	V	12 Meses	204.00	199.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	21	9	8	5	1	2026-02-26 13:17:08.507234	router-tplink-archer-ax36
42	TEC042	Teclado Mecanico Redragon K537	ACC	COM	SUB7		REF-37	Modelo-37	V	12 Meses	208.00	203.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	22	10	9	6	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k537
43	TEC043	Teclado Mecanico Redragon K538	ACC	COM	SUB8		REF-38	Modelo-38	V	12 Meses	212.00	207.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	23	11	10	7	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k538
44	TEC044	Monitor LG 26 pulgadas Full HD	MON	COM	SUB9		REF-39	Modelo-39	V	12 Meses	216.00	211.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	24	12	11	8	4	2026-02-26 13:17:08.507234	monitor-lg-26-pulgadas-full-hd
45	TEC045	Impresora Epson EcoTank L3040	IMP	COM	SUB0		REF-40	Modelo-40	V	12 Meses	220.00	215.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	5	13	2	1	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3040
46	TEC046	Teclado Mecanico Redragon K541	ACC	COM	SUB1		REF-41	Modelo-41	V	12 Meses	224.00	219.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	6	14	3	2	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k541
47	TEC047	Router TP-Link Archer AX42	RED	COM	SUB2		REF-42	Modelo-42	V	12 Meses	228.00	223.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	7	15	4	3	2	2026-02-26 13:17:08.507234	router-tplink-archer-ax42
48	TEC048	Teclado Mecanico Redragon K543	ACC	COM	SUB3		REF-43	Modelo-43	V	12 Meses	232.00	227.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	8	16	5	4	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k543
49	TEC049	Disco SSD Kingston NV2 256GB	ALM	COM	SUB4		REF-44	Modelo-44	V	12 Meses	236.00	231.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	9	17	6	5	4	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
50	TEC050	Impresora Epson EcoTank L3045	IMP	COM	SUB5		REF-45	Modelo-45	V	12 Meses	240.00	235.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	10	3	7	6	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3045
51	TEC051	Teclado Mecanico Redragon K546	ACC	COM	SUB6		REF-46	Modelo-46	V	12 Meses	244.00	239.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	11	4	8	7	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k546
52	TEC052	Teclado Mecanico Redragon K547	ACC	COM	SUB7		REF-47	Modelo-47	V	12 Meses	248.00	243.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	12	5	9	8	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k547
53	TEC053	Router TP-Link Archer AX48	RED	COM	SUB8		REF-48	Modelo-48	V	12 Meses	252.00	247.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	13	6	10	1	3	2026-02-26 13:17:08.507234	router-tplink-archer-ax48
54	TEC054	Teclado Mecanico Redragon K549	ACC	COM	SUB9		REF-49	Modelo-49	V	12 Meses	256.00	251.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	14	7	11	2	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k549
55	TEC055	Impresora Epson EcoTank L3050	IMP	COM	SUB0		REF-50	Modelo-50	V	12 Meses	260.00	255.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	15	8	2	3	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3050
56	TEC056	Monitor LG 23 pulgadas Full HD	MON	COM	SUB1		REF-51	Modelo-51	V	12 Meses	264.00	259.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	16	9	3	4	1	2026-02-26 13:17:08.507234	monitor-lg-23-pulgadas-full-hd
57	TEC057	Disco SSD Kingston NV2 256GB	ALM	COM	SUB2		REF-52	Modelo-52	V	12 Meses	268.00	263.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	17	10	4	5	2	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
58	TEC058	Teclado Mecanico Redragon K553	ACC	COM	SUB3		REF-53	Modelo-53	V	12 Meses	272.00	267.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	18	11	5	6	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k553
59	TEC059	Router TP-Link Archer AX54	RED	COM	SUB4		REF-54	Modelo-54	V	12 Meses	276.00	271.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	19	12	6	7	4	2026-02-26 13:17:08.507234	router-tplink-archer-ax54
60	TEC060	Impresora Epson EcoTank L3055	IMP	COM	SUB5		REF-55	Modelo-55	V	12 Meses	280.00	275.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	20	13	7	8	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3055
61	TEC061	Disco SSD Kingston NV2 256GB	ALM	COM	SUB6		REF-56	Modelo-56	V	12 Meses	284.00	279.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	21	14	8	1	1	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
62	TEC062	Monitor LG 24 pulgadas Full HD	MON	COM	SUB7		REF-57	Modelo-57	V	12 Meses	288.00	283.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	22	15	9	2	2	2026-02-26 13:17:08.507234	monitor-lg-24-pulgadas-full-hd
63	TEC063	Teclado Mecanico Redragon K558	ACC	COM	SUB8		REF-58	Modelo-58	V	12 Meses	292.00	287.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	23	16	10	3	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k558
64	TEC064	Teclado Mecanico Redragon K559	ACC	COM	SUB9		REF-59	Modelo-59	V	12 Meses	296.00	291.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	24	17	11	4	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k559
65	TEC065	Router TP-Link Archer AX60	RED	COM	SUB0		REF-60	Modelo-60	V	12 Meses	300.00	295.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	5	3	2	5	0	2026-02-26 13:17:08.507234	router-tplink-archer-ax60
66	TEC066	Teclado Mecanico Redragon K561	ACC	COM	SUB1		REF-61	Modelo-61	V	12 Meses	304.00	299.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	6	4	3	6	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k561
67	TEC067	Teclado Mecanico Redragon K562	ACC	COM	SUB2		REF-62	Modelo-62	V	12 Meses	308.00	303.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	7	5	4	7	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k562
68	TEC068	Monitor LG 25 pulgadas Full HD	MON	COM	SUB3		REF-63	Modelo-63	V	12 Meses	312.00	307.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	8	6	5	8	3	2026-02-26 13:17:08.507234	monitor-lg-25-pulgadas-full-hd
69	TEC069	Disco SSD Kingston NV2 256GB	ALM	COM	SUB4		REF-64	Modelo-64	V	12 Meses	316.00	311.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	9	7	6	1	4	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
70	TEC070	Impresora Epson EcoTank L3065	IMP	COM	SUB5		REF-65	Modelo-65	V	12 Meses	320.00	315.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	10	8	7	2	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3065
71	TEC071	Router TP-Link Archer AX66	RED	COM	SUB6		REF-66	Modelo-66	V	12 Meses	324.00	319.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	11	9	8	3	1	2026-02-26 13:17:08.507234	router-tplink-archer-ax66
72	TEC072	Teclado Mecanico Redragon K567	ACC	COM	SUB7		REF-67	Modelo-67	V	12 Meses	328.00	323.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	12	10	9	4	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k567
73	TEC073	Disco SSD Kingston NV2 256GB	ALM	COM	SUB8		REF-68	Modelo-68	V	12 Meses	332.00	327.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	13	11	10	5	3	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
74	TEC074	Monitor LG 26 pulgadas Full HD	MON	COM	SUB9		REF-69	Modelo-69	V	12 Meses	336.00	331.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	14	12	11	6	4	2026-02-26 13:17:08.507234	monitor-lg-26-pulgadas-full-hd
75	TEC075	Impresora Epson EcoTank L3070	IMP	COM	SUB0		REF-70	Modelo-70	V	12 Meses	340.00	335.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	15	13	2	7	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3070
76	TEC076	Teclado Mecanico Redragon K571	ACC	COM	SUB1		REF-71	Modelo-71	V	12 Meses	344.00	339.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	16	14	3	8	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k571
77	TEC077	Router TP-Link Archer AX72	RED	COM	SUB2		REF-72	Modelo-72	V	12 Meses	348.00	343.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	17	15	4	1	2	2026-02-26 13:17:08.507234	router-tplink-archer-ax72
78	TEC078	Teclado Mecanico Redragon K573	ACC	COM	SUB3		REF-73	Modelo-73	V	12 Meses	352.00	347.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	18	16	5	2	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k573
79	TEC079	Teclado Mecanico Redragon K574	ACC	COM	SUB4		REF-74	Modelo-74	V	12 Meses	356.00	351.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	19	17	6	3	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k574
80	TEC080	Impresora Epson EcoTank L3075	IMP	COM	SUB5		REF-75	Modelo-75	V	12 Meses	360.00	355.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	20	3	7	4	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3075
81	TEC081	Disco SSD Kingston NV2 256GB	ALM	COM	SUB6		REF-76	Modelo-76	V	12 Meses	364.00	359.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	21	4	8	5	1	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
82	TEC082	Teclado Mecanico Redragon K577	ACC	COM	SUB7		REF-77	Modelo-77	V	12 Meses	368.00	363.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	22	5	9	6	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k577
84	TEC084	Teclado Mecanico Redragon K579	ACC	COM	SUB9		REF-79	Modelo-79	V	12 Meses	376.00	371.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	24	7	11	8	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k579
85	TEC085	Impresora Epson EcoTank L3080	IMP	COM	SUB0		REF-80	Modelo-80	V	12 Meses	380.00	375.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	5	8	2	1	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3080
86	TEC086	Monitor LG 23 pulgadas Full HD	MON	COM	SUB1		REF-81	Modelo-81	V	12 Meses	384.00	379.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	6	9	3	2	1	2026-02-26 13:17:08.507234	monitor-lg-23-pulgadas-full-hd
87	TEC087	Teclado Mecanico Redragon K582	ACC	COM	SUB2		REF-82	Modelo-82	V	12 Meses	388.00	383.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	7	10	4	3	2	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k582
88	TEC088	Teclado Mecanico Redragon K583	ACC	COM	SUB3		REF-83	Modelo-83	V	12 Meses	392.00	387.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	8	11	5	4	3	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k583
89	TEC089	Router TP-Link Archer AX84	RED	COM	SUB4		REF-84	Modelo-84	V	12 Meses	396.00	391.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	9	12	6	5	4	2026-02-26 13:17:08.507234	router-tplink-archer-ax84
90	TEC090	Impresora Epson EcoTank L3085	IMP	COM	SUB5		REF-85	Modelo-85	V	12 Meses	400.00	395.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	10	13	7	6	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3085
91	TEC091	Teclado Mecanico Redragon K586	ACC	COM	SUB6		REF-86	Modelo-86	V	12 Meses	404.00	399.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	11	14	8	7	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k586
92	TEC092	Monitor LG 24 pulgadas Full HD	MON	COM	SUB7		REF-87	Modelo-87	V	12 Meses	408.00	403.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	12	15	9	8	2	2026-02-26 13:17:08.507234	monitor-lg-24-pulgadas-full-hd
93	TEC093	Disco SSD Kingston NV2 256GB	ALM	COM	SUB8		REF-88	Modelo-88	V	12 Meses	412.00	407.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	13	16	10	1	3	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
94	TEC094	Teclado Mecanico Redragon K589	ACC	COM	SUB9		REF-89	Modelo-89	V	12 Meses	416.00	411.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	14	17	11	2	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k589
95	TEC095	Router TP-Link Archer AX90	RED	COM	SUB0		REF-90	Modelo-90	V	12 Meses	420.00	415.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	15	3	2	3	0	2026-02-26 13:17:08.507234	router-tplink-archer-ax90
96	TEC096	Teclado Mecanico Redragon K591	ACC	COM	SUB1		REF-91	Modelo-91	V	12 Meses	424.00	419.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	16	4	3	4	1	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k591
97	TEC097	Disco SSD Kingston NV2 256GB	ALM	COM	SUB2		REF-92	Modelo-92	V	12 Meses	428.00	423.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	17	5	4	5	2	2026-02-26 13:17:08.507234	disco-ssd-kingston-nv2-256gb
98	TEC098	Monitor LG 25 pulgadas Full HD	MON	COM	SUB3		REF-93	Modelo-93	V	12 Meses	432.00	427.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	18	6	5	6	3	2026-02-26 13:17:08.507234	monitor-lg-25-pulgadas-full-hd
99	TEC099	Teclado Mecanico Redragon K594	ACC	COM	SUB4		REF-94	Modelo-94	V	12 Meses	436.00	431.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	19	7	6	7	4	2026-02-26 13:17:08.507234	teclado-mecanico-redragon-k594
100	TEC100	Impresora Epson EcoTank L3095	IMP	COM	SUB5		REF-95	Modelo-95	V	12 Meses	440.00	435.00	0.00	0.00	0.00	f	0	0	0	0	0	0	0	0	0	0	20	8	7	8	0	2026-02-26 13:17:08.507234	impresora-epson-ecotank-l3095
\.


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 220
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etiquetas_id_seq', 30, true);


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 222
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_id_seq', 300, true);


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 224
-- Name: producto_etiqueta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_etiqueta_id_seq', 906, true);


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 226
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 100, true);


--
-- TOC entry 4905 (class 2606 OID 16689)
-- Name: etiquetas etiquetas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key UNIQUE (nombre);


--
-- TOC entry 4907 (class 2606 OID 16691)
-- Name: etiquetas etiquetas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (id);


--
-- TOC entry 4909 (class 2606 OID 16693)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 4911 (class 2606 OID 16695)
-- Name: producto_etiqueta producto_etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_etiqueta
    ADD CONSTRAINT producto_etiqueta_pkey PRIMARY KEY (id);


--
-- TOC entry 4915 (class 2606 OID 16697)
-- Name: productos productos_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_codigo_key UNIQUE (codigo);


--
-- TOC entry 4917 (class 2606 OID 16699)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4913 (class 2606 OID 16701)
-- Name: producto_etiqueta unique_producto_etiqueta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_etiqueta
    ADD CONSTRAINT unique_producto_etiqueta UNIQUE (producto_id, etiqueta_id);


--
-- TOC entry 4918 (class 2606 OID 16702)
-- Name: imagenes imagenes_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE CASCADE;


--
-- TOC entry 4919 (class 2606 OID 16707)
-- Name: producto_etiqueta producto_etiqueta_etiqueta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_etiqueta
    ADD CONSTRAINT producto_etiqueta_etiqueta_id_fkey FOREIGN KEY (etiqueta_id) REFERENCES public.etiquetas(id) ON DELETE CASCADE;


--
-- TOC entry 4920 (class 2606 OID 16712)
-- Name: producto_etiqueta producto_etiqueta_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_etiqueta
    ADD CONSTRAINT producto_etiqueta_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE CASCADE;


-- Completed on 2026-03-08 00:41:25

--
-- PostgreSQL database dump complete
--

\unrestrict O4ABhyK9hQeKzJyCNSIrcUENGANA7bbVwZOcwQtgs3HtQApI1gIk4KSV7uWW9ge

