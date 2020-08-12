--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12rc1

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

--
-- Name: Odev; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Odev" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Turkish_Turkey.1254' LC_CTYPE = 'Turkish_Turkey.1254';


ALTER DATABASE "Odev" OWNER TO postgres;

\connect "Odev"

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

--
-- Name: deletekullanici(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deletekullanici() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
         Delete from kullanici where kullanici.id = old.id ;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.deletekullanici() OWNER TO postgres;

--
-- Name: deletemesaj(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deletemesaj() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
         Delete from mesaj where aliciid=old.arkadasid and gonderenid=old.kullaniciid;
 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.deletemesaj() OWNER TO postgres;

--
-- Name: deleteonerilenarkadas(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deleteonerilenarkadas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
         Delete from filmoneri where arkadasid=old.arkadasid and kullaniciid=old.kullaniciid;
 
    RETURN old;
END;
$$;


ALTER FUNCTION public.deleteonerilenarkadas() OWNER TO postgres;

--
-- Name: filmicındataekle(character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."filmicındataekle"(yonetmen character varying, senarist character varying, kategori character varying, dil character varying, odul character varying)
    LANGUAGE plpgsql
    AS $_$

BEGIN

Insert into yonetmen (yonetmen)values($1);
Insert into senarist (senarist)values($2);
Insert into kategori (kategori)values($3);
Insert into dil (dil)values($4);
Insert into odul (odul)values($5);
COMMIT;

END;
$_$;


ALTER PROCEDURE public."filmicındataekle"(yonetmen character varying, senarist character varying, kategori character varying, dil character varying, odul character varying) OWNER TO postgres;

--
-- Name: kullanıcısil(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public."kullanıcısil"("adı" character varying)
    LANGUAGE plpgsql
    AS $_$

BEGIN

DELETE FROM kullanicihakkinda where adi=$1;
COMMIT;

END;
$_$;


ALTER PROCEDURE public."kullanıcısil"("adı" character varying) OWNER TO postgres;

--
-- Name: sistemmesaji(integer, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.sistemmesaji(integer, character varying)
    LANGUAGE plpgsql
    AS $_$

BEGIN

INSERT INTO mesaj(gonderenid,aliciid,mesaj) values(29,$1,$2);
COMMIT;

END;
$_$;


ALTER PROCEDURE public.sistemmesaji(integer, character varying) OWNER TO postgres;

--
-- Name: updatekullanici(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.updatekullanici() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
         update kullanici set adi=new.adi where kullanici.id=new.id;
 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.updatekullanici() OWNER TO postgres;

--
-- Name: yoneticiekle(character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.yoneticiekle(character varying, character varying)
    LANGUAGE plpgsql
    AS $_$

BEGIN

INSERT INTO yonetici(yoneticiid,sifre) values($1,$2);
COMMIT;

END;
$_$;


ALTER PROCEDURE public.yoneticiekle(character varying, character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alıntı; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."alıntı" (
    kullaniciid integer,
    filmid integer,
    "alıntı" character varying
);


ALTER TABLE public."alıntı" OWNER TO postgres;

--
-- Name: arkadaslik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arkadaslik (
    arkadaslikid integer NOT NULL,
    kullaniciid integer,
    arkadasid integer
);


ALTER TABLE public.arkadaslik OWNER TO postgres;

--
-- Name: arkadaslik_arkadaslikid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arkadaslik_arkadaslikid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arkadaslik_arkadaslikid_seq OWNER TO postgres;

--
-- Name: arkadaslik_arkadaslikid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arkadaslik_arkadaslikid_seq OWNED BY public.arkadaslik.arkadaslikid;


--
-- Name: dil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dil (
    dilid integer NOT NULL,
    dil character varying
);


ALTER TABLE public.dil OWNER TO postgres;

--
-- Name: dil_dilid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dil_dilid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dil_dilid_seq OWNER TO postgres;

--
-- Name: dil_dilid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dil_dilid_seq OWNED BY public.dil.dilid;


--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    filmid integer NOT NULL,
    filmadi character varying,
    yonetmenid integer,
    senaristid integer,
    kategoriid integer,
    odulid integer,
    dilid integer,
    filmdakikasi integer
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_filmid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_filmid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_filmid_seq OWNER TO postgres;

--
-- Name: film_filmid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_filmid_seq OWNED BY public.film.filmid;


--
-- Name: filmoneri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmoneri (
    kullaniciid integer,
    arkadasid integer,
    filmid integer
);


ALTER TABLE public.filmoneri OWNER TO postgres;

--
-- Name: inceleme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inceleme (
    kullaniciid integer,
    filmid integer,
    inceleme character varying
);


ALTER TABLE public.inceleme OWNER TO postgres;

--
-- Name: izlenme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.izlenme (
    kullaniciid integer,
    filmid integer
);


ALTER TABLE public.izlenme OWNER TO postgres;

--
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    kategoriid integer NOT NULL,
    kategori character varying
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- Name: kategori_kategoriid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_kategoriid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kategori_kategoriid_seq OWNER TO postgres;

--
-- Name: kategori_kategoriid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_kategoriid_seq OWNED BY public.kategori.kategoriid;


--
-- Name: kullanici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanici (
    id integer NOT NULL,
    eposta character varying,
    kullaniciadi character varying,
    sifre character varying,
    adi text
);


ALTER TABLE public.kullanici OWNER TO postgres;

--
-- Name: kullanici_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kullanici_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kullanici_id_seq OWNER TO postgres;

--
-- Name: kullanici_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kullanici_id_seq OWNED BY public.kullanici.id;


--
-- Name: kullanicihakkinda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanicihakkinda (
    id integer,
    adi character varying,
    egitim character varying,
    sehir character varying,
    dogumtarihi character varying,
    cinsiyet character varying
);


ALTER TABLE public.kullanicihakkinda OWNER TO postgres;

--
-- Name: mesaj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesaj (
    mesajid integer NOT NULL,
    gonderenid integer,
    aliciid integer,
    mesaj character varying
);


ALTER TABLE public.mesaj OWNER TO postgres;

--
-- Name: mesaj_mesajid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mesaj_mesajid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mesaj_mesajid_seq OWNER TO postgres;

--
-- Name: mesaj_mesajid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mesaj_mesajid_seq OWNED BY public.mesaj.mesajid;


--
-- Name: odul; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.odul (
    odulid integer NOT NULL,
    odul character varying
);


ALTER TABLE public.odul OWNER TO postgres;

--
-- Name: odul_odulid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.odul_odulid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.odul_odulid_seq OWNER TO postgres;

--
-- Name: odul_odulid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.odul_odulid_seq OWNED BY public.odul.odulid;


--
-- Name: puanlama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puanlama (
    kullaniciid integer,
    filmid integer,
    puan numeric
);


ALTER TABLE public.puanlama OWNER TO postgres;

--
-- Name: senarist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.senarist (
    senaristid integer NOT NULL,
    senarist character varying
);


ALTER TABLE public.senarist OWNER TO postgres;

--
-- Name: senarist_senaristid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.senarist_senaristid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senarist_senaristid_seq OWNER TO postgres;

--
-- Name: senarist_senaristid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.senarist_senaristid_seq OWNED BY public.senarist.senaristid;


--
-- Name: yonetici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yonetici (
    yoneticiid character varying,
    sifre character varying
);


ALTER TABLE public.yonetici OWNER TO postgres;

--
-- Name: yonetmen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yonetmen (
    yonetmenid integer NOT NULL,
    yonetmen character varying
);


ALTER TABLE public.yonetmen OWNER TO postgres;

--
-- Name: yonetmen_yonetmenid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yonetmen_yonetmenid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yonetmen_yonetmenid_seq OWNER TO postgres;

--
-- Name: yonetmen_yonetmenid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yonetmen_yonetmenid_seq OWNED BY public.yonetmen.yonetmenid;


--
-- Name: arkadaslik arkadaslikid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arkadaslik ALTER COLUMN arkadaslikid SET DEFAULT nextval('public.arkadaslik_arkadaslikid_seq'::regclass);


--
-- Name: dil dilid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dil ALTER COLUMN dilid SET DEFAULT nextval('public.dil_dilid_seq'::regclass);


--
-- Name: film filmid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film ALTER COLUMN filmid SET DEFAULT nextval('public.film_filmid_seq'::regclass);


--
-- Name: kategori kategoriid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori ALTER COLUMN kategoriid SET DEFAULT nextval('public.kategori_kategoriid_seq'::regclass);


--
-- Name: kullanici id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanici ALTER COLUMN id SET DEFAULT nextval('public.kullanici_id_seq'::regclass);


--
-- Name: mesaj mesajid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesaj ALTER COLUMN mesajid SET DEFAULT nextval('public.mesaj_mesajid_seq'::regclass);


--
-- Name: odul odulid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odul ALTER COLUMN odulid SET DEFAULT nextval('public.odul_odulid_seq'::regclass);


--
-- Name: senarist senaristid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.senarist ALTER COLUMN senaristid SET DEFAULT nextval('public.senarist_senaristid_seq'::regclass);


--
-- Name: yonetmen yonetmenid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yonetmen ALTER COLUMN yonetmenid SET DEFAULT nextval('public.yonetmen_yonetmenid_seq'::regclass);


--
-- Data for Name: alıntı; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."alıntı" VALUES
	(26, 16, 'denemeler denemesi'),
	(27, 1, 'film'),
	(27, 12, 'harry potter'),
	(28, 1, 'FilmmiNe'),
	(28, 15, 'you shall not pass');


--
-- Data for Name: arkadaslik; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.arkadaslik VALUES
	(9, 27, 26),
	(10, 28, 26);


--
-- Data for Name: dil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dil VALUES
	(1, 'Türkçe'),
	(2, 'İngilizce'),
	(3, 'Fransızca'),
	(4, 'Çince'),
	(5, 'Rusça'),
	(6, 'İspanyolca'),
	(7, 'test'),
	(8, '');


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film VALUES
	(1, 'FilmmiNe', 5, 7, 3, 1, 2, 130),
	(12, 'Harry Potter', 11, 8, 5, 3, 2, 120),
	(13, 'Gora', 1, 2, 2, 1, 1, 100),
	(14, 'Arog', 1, 2, 2, 2, 1, 102),
	(15, 'Yuzuklerin Efendisi', 4, 6, 5, 3, 1, 300),
	(2, 'Film Filmoglu', 1, 1, 1, 1, 1, 130),
	(16, 'DENEMELER', 10, 5, 3, 5, 4, 100);


--
-- Data for Name: filmoneri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmoneri VALUES
	(27, 26, 1),
	(27, 26, 12),
	(28, 26, 15);


--
-- Data for Name: inceleme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inceleme VALUES
	(26, 16, 'Mükemmel bir filmdi çok beğendim.'),
	(27, 1, 'başarısız bir film'),
	(27, 12, 'güzel film'),
	(28, 1, 'film gibi film'),
	(28, 15, 'yüzüklerin efendisi çok güzel');


--
-- Data for Name: izlenme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.izlenme VALUES
	(26, 1),
	(26, 1),
	(26, 1),
	(26, 1),
	(26, 1),
	(26, 1),
	(26, 12),
	(26, 12),
	(26, 12),
	(26, 12),
	(26, 12),
	(26, 15),
	(26, 15),
	(26, 15),
	(26, 15),
	(26, 15),
	(26, 15),
	(26, 16),
	(26, 16),
	(26, 16),
	(26, 16),
	(27, 1),
	(27, 1),
	(27, 1),
	(27, 12),
	(27, 12),
	(27, 15),
	(27, 15),
	(27, 15),
	(27, 15),
	(27, 15),
	(27, 16),
	(27, 16),
	(27, 15),
	(28, 1),
	(28, 1),
	(28, 1),
	(28, 15);


--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kategori VALUES
	(1, 'Korku'),
	(2, 'Bilim Kurgu'),
	(3, 'Aksiyon'),
	(4, 'Tarih'),
	(5, 'Fantastik'),
	(6, 'test'),
	(7, '');


--
-- Data for Name: kullanici; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kullanici VALUES
	(26, 'kursatsayhan20@gmail.com', 'kursatsayhan', '9683fa4f54655a92b48cb3b2ead040df4ea786404e1f6c2c6add90f5d8b2c5c2', 'Kursat Fevzican Sayhan'),
	(27, 'frknymn@gmail.com', 'furkanyaman', '312ea8d1cf6dfbf8e0437d77cb3494d24da4ef6ae250227de2c4836db5684b85', 'Furkan Yaman'),
	(28, 'ahmetinepostası@gmail.com', 'ahmetkisisi', 'bd176c2a52a6e722f26e3546f1d712d5fe8f1d2585e2d5520773562e17141af5', 'Ahmet Benim'),
	(29, 'sistem@gmail.com', 'sistem', 'e61227c5734d20585afef477f39e482ba891efb921d71f11dd90f8b6eb0ee78c', 'Sistem');


--
-- Data for Name: kullanicihakkinda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kullanicihakkinda VALUES
	(26, 'Kursat Fevzican Sayhan', 'Ankara', 'Bilgisayar Mühendisi', '18.07.1998', 'Erkek'),
	(27, 'Furkan Yaman', 'Ankara', 'Elektrik Mühendisi', '20.11.1998', 'Erkek'),
	(28, 'Ahmet Benim', 'Adana', 'Elektrik Mühendisi', '01.01.1995', 'Erkek'),
	(29, 'Sistem', 'Sistem', 'Sistem', 'Sistem', 'Belirtmek istemiyorum');


--
-- Data for Name: mesaj; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mesaj VALUES
	(9, 27, 26, 'naber kanka'),
	(10, 28, 26, 'ahmet ben'),
	(11, 29, 26, 'Sistem Mesajı'),
	(12, 29, 26, 'test');


--
-- Data for Name: odul; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.odul VALUES
	(1, 'En iyi Erkek Ödülü'),
	(2, 'En iyi Kadın Ödülü'),
	(3, 'En iyi Film Ödülü'),
	(4, 'En iyi Erkek Oyuncu Ödülü'),
	(5, 'En iyi Kadın Oyuncu Ödülü'),
	(6, 'En iyi Yönetmen Ödülü'),
	(7, 'En iyi Senarist Ödülü'),
	(8, 'En iyi mekan Ödülü'),
	(9, 'En iyi müzik ödülü'),
	(10, 'test'),
	(11, '');


--
-- Data for Name: puanlama; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puanlama VALUES
	(26, 16, 15),
	(26, 16, 100),
	(27, 1, 20),
	(27, 1, 10),
	(27, 12, 100),
	(27, 16, 0),
	(27, 16, 0),
	(27, 16, 0),
	(27, 16, 0),
	(28, 1, 100),
	(28, 1, 100),
	(28, 1, 100),
	(28, 15, 34);


--
-- Data for Name: senarist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.senarist VALUES
	(1, 'Onur Ünlü'),
	(2, 'Cem Yılmaz'),
	(3, 'Yılmaz Güney'),
	(4, 'Yılmaz Erdoğan'),
	(5, 'Nuri Bilge Ceylan'),
	(6, 'Gani Müjde'),
	(7, 'Burak Aksak'),
	(8, 'JK Rowling'),
	(9, 'test'),
	(10, '');


--
-- Data for Name: yonetici; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yonetici VALUES
	('admin', 'admin'),
	('yonetici', 'yonetici');


--
-- Data for Name: yonetmen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yonetmen VALUES
	(1, 'Steven Spilberg'),
	(2, 'Alfred Hitchcock'),
	(3, 'Francis Ford Coppola'),
	(4, 'Frank Capra'),
	(5, 'Ingmar Bergman'),
	(6, 'Sergei Eisenstein'),
	(7, 'Andrey Tarkovski'),
	(8, 'Akira Kurosawa'),
	(9, 'Stanley Kubrick'),
	(10, 'Orson Welles'),
	(11, 'Chris Columbus'),
	(12, NULL),
	(13, 'test'),
	(14, 'kursat');


--
-- Name: arkadaslik_arkadaslikid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arkadaslik_arkadaslikid_seq', 10, true);


--
-- Name: dil_dilid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dil_dilid_seq', 8, true);


--
-- Name: film_filmid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_filmid_seq', 16, true);


--
-- Name: kategori_kategoriid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_kategoriid_seq', 7, true);


--
-- Name: kullanici_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kullanici_id_seq', 30, true);


--
-- Name: mesaj_mesajid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mesaj_mesajid_seq', 12, true);


--
-- Name: odul_odulid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.odul_odulid_seq', 11, true);


--
-- Name: senarist_senaristid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.senarist_senaristid_seq', 10, true);


--
-- Name: yonetmen_yonetmenid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yonetmen_yonetmenid_seq', 14, true);


--
-- Name: arkadaslik arkadaslik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arkadaslik
    ADD CONSTRAINT arkadaslik_pkey PRIMARY KEY (arkadaslikid);


--
-- Name: dil dil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dil
    ADD CONSTRAINT dil_pkey PRIMARY KEY (dilid);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (filmid);


--
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (kategoriid);


--
-- Name: kullanici kullanici_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanici
    ADD CONSTRAINT kullanici_pkey PRIMARY KEY (id);


--
-- Name: mesaj mesaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesaj
    ADD CONSTRAINT mesaj_pkey PRIMARY KEY (mesajid);


--
-- Name: odul odul_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odul
    ADD CONSTRAINT odul_pkey PRIMARY KEY (odulid);


--
-- Name: senarist senarist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.senarist
    ADD CONSTRAINT senarist_pkey PRIMARY KEY (senaristid);


--
-- Name: yonetmen yonetmen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yonetmen
    ADD CONSTRAINT yonetmen_pkey PRIMARY KEY (yonetmenid);


--
-- Name: kullanicihakkinda deletekul; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER deletekul AFTER DELETE ON public.kullanicihakkinda FOR EACH ROW EXECUTE FUNCTION public.deletekullanici();


--
-- Name: arkadaslik deletemesaj; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER deletemesaj AFTER DELETE ON public.arkadaslik FOR EACH ROW EXECUTE FUNCTION public.deletemesaj();


--
-- Name: arkadaslik deleteonerilenarkadas; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER deleteonerilenarkadas AFTER DELETE ON public.arkadaslik FOR EACH ROW EXECUTE FUNCTION public.deleteonerilenarkadas();


--
-- Name: kullanicihakkinda updatekullanici; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER updatekullanici AFTER UPDATE ON public.kullanicihakkinda FOR EACH ROW EXECUTE FUNCTION public.updatekullanici();


--
-- Name: arkadaslik fk_arkadasid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arkadaslik
    ADD CONSTRAINT fk_arkadasid FOREIGN KEY (arkadasid) REFERENCES public.kullanici(id);


--
-- Name: filmoneri fk_arkadasid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmoneri
    ADD CONSTRAINT fk_arkadasid FOREIGN KEY (arkadasid) REFERENCES public.kullanici(id);


--
-- Name: puanlama fk_arkadasid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puanlama
    ADD CONSTRAINT fk_arkadasid FOREIGN KEY (filmid) REFERENCES public.film(filmid);


--
-- Name: inceleme fk_arkadasid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inceleme
    ADD CONSTRAINT fk_arkadasid FOREIGN KEY (filmid) REFERENCES public.film(filmid);


--
-- Name: izlenme fk_arkadasid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.izlenme
    ADD CONSTRAINT fk_arkadasid FOREIGN KEY (filmid) REFERENCES public.film(filmid);


--
-- Name: film fk_dil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_dil FOREIGN KEY (dilid) REFERENCES public.dil(dilid);


--
-- Name: filmoneri fk_filmid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmoneri
    ADD CONSTRAINT fk_filmid FOREIGN KEY (filmid) REFERENCES public.film(filmid);


--
-- Name: alıntı fk_filmid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."alıntı"
    ADD CONSTRAINT fk_filmid FOREIGN KEY (filmid) REFERENCES public.film(filmid);


--
-- Name: kullanicihakkinda fk_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanicihakkinda
    ADD CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES public.kullanici(id);


--
-- Name: film fk_kategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_kategori FOREIGN KEY (kategoriid) REFERENCES public.kategori(kategoriid);


--
-- Name: arkadaslik fk_kullaniciid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arkadaslik
    ADD CONSTRAINT fk_kullaniciid FOREIGN KEY (kullaniciid) REFERENCES public.kullanici(id);


--
-- Name: filmoneri fk_kullaniciid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmoneri
    ADD CONSTRAINT fk_kullaniciid FOREIGN KEY (kullaniciid) REFERENCES public.kullanici(id);


--
-- Name: puanlama fk_kullaniciid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puanlama
    ADD CONSTRAINT fk_kullaniciid FOREIGN KEY (kullaniciid) REFERENCES public.kullanici(id);


--
-- Name: inceleme fk_kullaniciid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inceleme
    ADD CONSTRAINT fk_kullaniciid FOREIGN KEY (kullaniciid) REFERENCES public.kullanici(id);


--
-- Name: izlenme fk_kullaniciid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.izlenme
    ADD CONSTRAINT fk_kullaniciid FOREIGN KEY (kullaniciid) REFERENCES public.kullanici(id);


--
-- Name: alıntı fk_kullaniciid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."alıntı"
    ADD CONSTRAINT fk_kullaniciid FOREIGN KEY (kullaniciid) REFERENCES public.kullanici(id);


--
-- Name: film fk_odul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_odul FOREIGN KEY (odulid) REFERENCES public.odul(odulid);


--
-- Name: film fk_senarist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_senarist FOREIGN KEY (senaristid) REFERENCES public.senarist(senaristid);


--
-- Name: film fk_yonetmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_yonetmen FOREIGN KEY (yonetmenid) REFERENCES public.yonetmen(yonetmenid);


--
-- Name: mesaj mesaj_aliciid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesaj
    ADD CONSTRAINT mesaj_aliciid_fkey FOREIGN KEY (aliciid) REFERENCES public.kullanici(id);


--
-- Name: mesaj mesaj_gonderenid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesaj
    ADD CONSTRAINT mesaj_gonderenid_fkey FOREIGN KEY (gonderenid) REFERENCES public.kullanici(id);


--
-- PostgreSQL database dump complete
--

