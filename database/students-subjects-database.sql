--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3

-- Started on 2023-11-24 14:16:41

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

DROP DATABASE "ControlApp";
--
-- TOC entry 3370 (class 1262 OID 24585)
-- Name: ControlApp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ControlApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "ControlApp" OWNER TO postgres;

\connect "ControlApp"

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
-- TOC entry 215 (class 1259 OID 24587)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(25) NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24599)
-- Name: student_subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_subject (
    student_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.student_subject OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24612)
-- Name: student_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.student_subject ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.student_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 24586)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.student ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_id_seq
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 1000
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 24593)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24598)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.subject ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3360 (class 0 OID 24587)
-- Dependencies: 215
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1003, 'Moss, Deirdre A.', 'suscipit.nonummy@yahoo.edu', '16562478680');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1005, 'Todd, Jason F.', 'convallis.est.vitae@hotmail.couk', '16426272241');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1006, 'Morgan, Kenneth K.', 'condimentum.eget.volutpat@icloud.couk', '11487423757');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1007, 'Montgomery, Zoe P.', 'congue.turpis@aol.org', '13048850784');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1008, 'Klein, Maxwell F.', 'proin.eget.odio@google.org', '15794517335');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1009, 'Rodriguez, Tallulah R.', 'metus@aol.edu', '15253809836');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1010, 'Mueller, Lynn X.', 'nulla.dignissim.maecenas@icloud.edu', '13174645021');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1011, 'Waters, Geraldine D.', 'iaculis@outlook.ca', '11314042887');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1012, 'Burks, Willow X.', 'cursus@outlook.edu', '13285118037');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1013, 'Mosley, Lunea W.', 'risus@google.net', '15412607783');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1014, 'Scott, Alan I.', 'fusce@outlook.com', '14286383366');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1015, 'Levine, Keely D.', 'euismod@icloud.edu', '17216960277');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1016, 'Mcpherson, Jacob F.', 'tempor@icloud.couk', '18532202348');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1017, 'Mcclure, Julie O.', 'ac@icloud.couk', '14117560886');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1018, 'Buckley, Summer E.', 'elit@aol.net', '14766744466');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1019, 'Wood, Marvin Q.', 'tellus.suspendisse@icloud.ca', '16642684223');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1020, 'Sheppard, Kirsten Z.', 'lorem@icloud.net', '17809526681');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1021, 'Mathews, Vivien V.', 'a.scelerisque@protonmail.ca', '16457473455');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1022, 'Neal, Conan D.', 'nulla.semper.tellus@google.edu', '15583426742');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1023, 'Hood, Quamar Q.', 'morbi.metus@outlook.ca', '14723183395');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1000, 'Little, Hanna S.', 'nunc.mauris@google.com', '13447514013');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1031, 'Iradier, Javier A.', 'iradier@gmail.com', '667983928392');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1002, 'Carver, Zelenia B.', 'id.ante@yahoo.edu', '15699471748');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1032, 'Sergio, Armando F. ', 'sergiofelix7283@gmail.com', '6672707795');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1001, 'Mcpherson, Macaulay M.', 'amet.diam@yahoo.org', '14363594444');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1034, 'Angel, Nahum M.', 'angelo@gmail.com', '66798493844');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1024, 'Hurley, Rooney S.', 'lobortis.augue@outlook.com', '17183473743');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1025, 'Magdiel, Moreno U.', 'magmo@gmail.com', '66737538288');


--
-- TOC entry 3363 (class 0 OID 24599)
-- Dependencies: 218
-- Data for Name: student_subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1025, 7, 1);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1025, 3, 2);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1001, 2, 12);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1003, 10, 14);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1003, 5, 15);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1002, 18, 16);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1001, 10, 18);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1001, 6, 19);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1032, 14, 21);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1032, 7, 22);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1034, 3, 23);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1031, 6, 25);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1034, 7, 27);
INSERT INTO public.student_subject OVERRIDING SYSTEM VALUE VALUES (1002, 11, 28);


--
-- TOC entry 3361 (class 0 OID 24593)
-- Dependencies: 216
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (3, 'Music');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (4, 'Geography');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (5, 'Chemistry');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (6, 'Art');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (7, 'Engineering');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (8, 'Biology');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (10, 'Computer Science');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (11, 'Archaeology');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (9, 'Maths');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (14, 'Science');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (15, 'Business');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (18, 'History');
INSERT INTO public.subject OVERRIDING SYSTEM VALUE VALUES (2, 'Economics');


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 219
-- Name: student_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_subject_id_seq', 28, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 214
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1034, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 217
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 20, true);


--
-- TOC entry 3214 (class 2606 OID 24617)
-- Name: student_subject student_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_subject
    ADD CONSTRAINT student_subject_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 24591)
-- Name: student students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 24597)
-- Name: subject subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 24602)
-- Name: student_subject studentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_subject
    ADD CONSTRAINT "studentId" FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- TOC entry 3216 (class 2606 OID 24607)
-- Name: student_subject subjectId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_subject
    ADD CONSTRAINT "subjectId" FOREIGN KEY (subject_id) REFERENCES public.subject(id) NOT VALID;


-- Completed on 2023-11-24 14:16:41

--
-- PostgreSQL database dump complete
--

