PGDMP     2    1                {            portal-academico-universidad    15.2    15.2 k    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    portal-academico-universidad    DATABASE     �   CREATE DATABASE "portal-academico-universidad" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
 .   DROP DATABASE "portal-academico-universidad";
                postgres    false                        3079    16674 	   tablefunc 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;
    DROP EXTENSION tablefunc;
                   false            �           0    0    EXTENSION tablefunc    COMMENT     `   COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';
                        false    2            �            1259    16494    actividades    TABLE     +  CREATE TABLE public.actividades (
    id_actividad bigint NOT NULL,
    id_asig integer NOT NULL,
    id_semestre integer NOT NULL,
    numero_grupo smallint NOT NULL,
    descripcion character varying(255) NOT NULL,
    porcentaje numeric(4,2) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.actividades;
       public         heap    postgres    false            �           0    0    COLUMN actividades.porcentaje    COMMENT     c   COMMENT ON COLUMN public.actividades.porcentaje IS 'Valor entero entre 1 y 100 (ambos incluidos)';
          public          postgres    false    233            �            1259    16493    actividades_id_actividad_seq    SEQUENCE     �   ALTER TABLE public.actividades ALTER COLUMN id_actividad ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.actividades_id_actividad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    16594    administradores    TABLE     y   CREATE TABLE public.administradores (
    codigo_dni character(15) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
 #   DROP TABLE public.administradores;
       public         heap    postgres    false            �            1259    16432    asignaturas    TABLE     �   CREATE TABLE public.asignaturas (
    id_asig integer NOT NULL,
    codigo_asig character(4) NOT NULL,
    id_prog integer NOT NULL,
    nombre character varying(50) NOT NULL,
    creditos smallint NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.asignaturas;
       public         heap    postgres    false            �            1259    16431    asignaturas_id_asig_seq    SEQUENCE     �   ALTER TABLE public.asignaturas ALTER COLUMN id_asig ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asignaturas_id_asig_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16462    dias_semana    TABLE     �   CREATE TABLE public.dias_semana (
    id_dia smallint NOT NULL,
    dia character varying(15) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.dias_semana;
       public         heap    postgres    false            �            1259    16461    dias_semana_id_dia_seq    SEQUENCE     �   ALTER TABLE public.dias_semana ALTER COLUMN id_dia ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dias_semana_id_dia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    16523    docentes    TABLE     r   CREATE TABLE public.docentes (
    codigo_dni character(15) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.docentes;
       public         heap    postgres    false            �            1259    16538    estudiantes    TABLE     u   CREATE TABLE public.estudiantes (
    codigo_dni character(15) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.estudiantes;
       public         heap    postgres    false            �            1259    16548    estudiantes_grupos    TABLE       CREATE TABLE public.estudiantes_grupos (
    codigo_estudiante character(15) NOT NULL,
    id_asig integer NOT NULL,
    id_semestre integer NOT NULL,
    numero_grupo smallint NOT NULL,
    promedio numeric(4,2),
    estado boolean DEFAULT true NOT NULL
);
 &   DROP TABLE public.estudiantes_grupos;
       public         heap    postgres    false            �            1259    16407 
   facultades    TABLE     �   CREATE TABLE public.facultades (
    id_fac smallint NOT NULL,
    nombre character varying(30) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.facultades;
       public         heap    postgres    false            �            1259    16406    facultades_id_fac_seq    SEQUENCE     �   ALTER TABLE public.facultades ALTER COLUMN id_fac ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facultades_id_fac_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16478    grupos_asignaturas    TABLE     �   CREATE TABLE public.grupos_asignaturas (
    id_asig integer NOT NULL,
    id_semestre integer NOT NULL,
    numero smallint NOT NULL,
    codigo_docente character(15),
    estado boolean DEFAULT true NOT NULL
);
 &   DROP TABLE public.grupos_asignaturas;
       public         heap    postgres    false            �            1259    16604    grupos_asignaturas_horarios    TABLE     �   CREATE TABLE public.grupos_asignaturas_horarios (
    id_horario integer NOT NULL,
    id_asig integer NOT NULL,
    id_semestre integer NOT NULL,
    numero_grupo smallint NOT NULL,
    id_salon integer,
    estado boolean DEFAULT true NOT NULL
);
 /   DROP TABLE public.grupos_asignaturas_horarios;
       public         heap    postgres    false            �            1259    16468    horarios    TABLE     �   CREATE TABLE public.horarios (
    id_horario integer NOT NULL,
    id_dia smallint NOT NULL,
    hora_inicio time without time zone,
    hora_fin time without time zone,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.horarios;
       public         heap    postgres    false            �            1259    16467    horarios_id_horario_seq    SEQUENCE     �   ALTER TABLE public.horarios ALTER COLUMN id_horario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.horarios_id_horario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    16563    notas_actividades    TABLE       CREATE TABLE public.notas_actividades (
    codigo_estudiante character(15) NOT NULL,
    id_asig integer NOT NULL,
    id_semestre integer NOT NULL,
    id_actividad bigint NOT NULL,
    nota numeric(4,2) DEFAULT 0.00,
    estado boolean DEFAULT true NOT NULL
);
 %   DROP TABLE public.notas_actividades;
       public         heap    postgres    false            �            1259    16504    personas    TABLE     �  CREATE TABLE public.personas (
    codigo_dni character(15) NOT NULL,
    nombre1 character varying(20) NOT NULL,
    nombre2 character varying(20),
    apellido1 character varying(20) NOT NULL,
    apellido2 character varying(20),
    telefono character(10),
    celular character(10) NOT NULL,
    correo_pers character varying(100) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.personas;
       public         heap    postgres    false            �            1259    16412    programas_academicos    TABLE     �   CREATE TABLE public.programas_academicos (
    id_prog integer NOT NULL,
    codigo character(4) NOT NULL,
    id_fac smallint NOT NULL,
    nombre character varying(30) NOT NULL,
    id_tipo smallint NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
 (   DROP TABLE public.programas_academicos;
       public         heap    postgres    false            �            1259    16424     programas_academicos_id_prog_seq    SEQUENCE     �   ALTER TABLE public.programas_academicos ALTER COLUMN id_prog ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.programas_academicos_id_prog_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16579    programas_estudiantes    TABLE     �   CREATE TABLE public.programas_estudiantes (
    codigo_estudiante character(15) NOT NULL,
    id_prog integer NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
 )   DROP TABLE public.programas_estudiantes;
       public         heap    postgres    false            �            1259    16456    salones    TABLE     �   CREATE TABLE public.salones (
    id_salon integer NOT NULL,
    edificio character varying(20) NOT NULL,
    piso smallint NOT NULL,
    numero smallint NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.salones;
       public         heap    postgres    false            �            1259    16455    salones_id_salon_seq    SEQUENCE     �   ALTER TABLE public.salones ALTER COLUMN id_salon ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.salones_id_salon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16450 	   semestres    TABLE     �   CREATE TABLE public.semestres (
    id_semestre integer NOT NULL,
    year integer NOT NULL,
    numero smallint NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.semestres;
       public         heap    postgres    false            �            1259    16449    semestres_id_semestre_seq    SEQUENCE     �   ALTER TABLE public.semestres ALTER COLUMN id_semestre ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.semestres_id_semestre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16425    tipos_programas    TABLE     �   CREATE TABLE public.tipos_programas (
    id_tipo smallint NOT NULL,
    nombre character varying(30) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
 #   DROP TABLE public.tipos_programas;
       public         heap    postgres    false            �            1259    16430    tipos_programas_id_tipo_seq    SEQUENCE     �   ALTER TABLE public.tipos_programas ALTER COLUMN id_tipo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipos_programas_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16511    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    codigo_dni character(15) NOT NULL,
    correo_inst character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �          0    16494    actividades 
   TABLE DATA           x   COPY public.actividades (id_actividad, id_asig, id_semestre, numero_grupo, descripcion, porcentaje, estado) FROM stdin;
    public          postgres    false    233   Ց       �          0    16594    administradores 
   TABLE DATA           =   COPY public.administradores (codigo_dni, estado) FROM stdin;
    public          postgres    false    241   C�       �          0    16432    asignaturas 
   TABLE DATA           ^   COPY public.asignaturas (id_asig, codigo_asig, id_prog, nombre, creditos, estado) FROM stdin;
    public          postgres    false    222   o�       �          0    16462    dias_semana 
   TABLE DATA           :   COPY public.dias_semana (id_dia, dia, estado) FROM stdin;
    public          postgres    false    228   (�       �          0    16523    docentes 
   TABLE DATA           6   COPY public.docentes (codigo_dni, estado) FROM stdin;
    public          postgres    false    236   ��       �          0    16538    estudiantes 
   TABLE DATA           9   COPY public.estudiantes (codigo_dni, estado) FROM stdin;
    public          postgres    false    237   ��       �          0    16548    estudiantes_grupos 
   TABLE DATA           u   COPY public.estudiantes_grupos (codigo_estudiante, id_asig, id_semestre, numero_grupo, promedio, estado) FROM stdin;
    public          postgres    false    238   �       �          0    16407 
   facultades 
   TABLE DATA           <   COPY public.facultades (id_fac, nombre, estado) FROM stdin;
    public          postgres    false    216   g�       �          0    16478    grupos_asignaturas 
   TABLE DATA           b   COPY public.grupos_asignaturas (id_asig, id_semestre, numero, codigo_docente, estado) FROM stdin;
    public          postgres    false    231   ٔ       �          0    16604    grupos_asignaturas_horarios 
   TABLE DATA           w   COPY public.grupos_asignaturas_horarios (id_horario, id_asig, id_semestre, numero_grupo, id_salon, estado) FROM stdin;
    public          postgres    false    242   2�       �          0    16468    horarios 
   TABLE DATA           U   COPY public.horarios (id_horario, id_dia, hora_inicio, hora_fin, estado) FROM stdin;
    public          postgres    false    230   ��       �          0    16563    notas_actividades 
   TABLE DATA           p   COPY public.notas_actividades (codigo_estudiante, id_asig, id_semestre, id_actividad, nota, estado) FROM stdin;
    public          postgres    false    239   ܕ       �          0    16504    personas 
   TABLE DATA           ~   COPY public.personas (codigo_dni, nombre1, nombre2, apellido1, apellido2, telefono, celular, correo_pers, estado) FROM stdin;
    public          postgres    false    234   b�       �          0    16412    programas_academicos 
   TABLE DATA           `   COPY public.programas_academicos (id_prog, codigo, id_fac, nombre, id_tipo, estado) FROM stdin;
    public          postgres    false    217   �       �          0    16579    programas_estudiantes 
   TABLE DATA           S   COPY public.programas_estudiantes (codigo_estudiante, id_prog, estado) FROM stdin;
    public          postgres    false    240   ��       �          0    16456    salones 
   TABLE DATA           K   COPY public.salones (id_salon, edificio, piso, numero, estado) FROM stdin;
    public          postgres    false    226   ��       �          0    16450 	   semestres 
   TABLE DATA           _   COPY public.semestres (id_semestre, year, numero, fecha_inicio, fecha_fin, estado) FROM stdin;
    public          postgres    false    224   �       �          0    16425    tipos_programas 
   TABLE DATA           B   COPY public.tipos_programas (id_tipo, nombre, estado) FROM stdin;
    public          postgres    false    219   =�       �          0    16511    usuarios 
   TABLE DATA           M   COPY public.usuarios (codigo_dni, correo_inst, password, estado) FROM stdin;
    public          postgres    false    235   ��       �           0    0    actividades_id_actividad_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.actividades_id_actividad_seq', 10, true);
          public          postgres    false    232            �           0    0    asignaturas_id_asig_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.asignaturas_id_asig_seq', 7, true);
          public          postgres    false    221            �           0    0    dias_semana_id_dia_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dias_semana_id_dia_seq', 7, true);
          public          postgres    false    227            �           0    0    facultades_id_fac_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.facultades_id_fac_seq', 6, true);
          public          postgres    false    215            �           0    0    horarios_id_horario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.horarios_id_horario_seq', 5, true);
          public          postgres    false    229            �           0    0     programas_academicos_id_prog_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.programas_academicos_id_prog_seq', 7, true);
          public          postgres    false    218            �           0    0    salones_id_salon_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.salones_id_salon_seq', 1, true);
          public          postgres    false    225            �           0    0    semestres_id_semestre_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.semestres_id_semestre_seq', 11, true);
          public          postgres    false    223            �           0    0    tipos_programas_id_tipo_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipos_programas_id_tipo_seq', 3, true);
          public          postgres    false    220            �           2606    16498    actividades actividades_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id_actividad);
 F   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividades_pkey;
       public            postgres    false    233                       2606    16598 $   administradores administradores_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.administradores
    ADD CONSTRAINT administradores_pkey PRIMARY KEY (codigo_dni);
 N   ALTER TABLE ONLY public.administradores DROP CONSTRAINT administradores_pkey;
       public            postgres    false    241            �           2606    16438 '   asignaturas asignaturas_codigo_asig_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_codigo_asig_key UNIQUE (codigo_asig);
 Q   ALTER TABLE ONLY public.asignaturas DROP CONSTRAINT asignaturas_codigo_asig_key;
       public            postgres    false    222            �           2606    16436    asignaturas asignaturas_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (id_asig);
 F   ALTER TABLE ONLY public.asignaturas DROP CONSTRAINT asignaturas_pkey;
       public            postgres    false    222            �           2606    16466    dias_semana dias_semana_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.dias_semana
    ADD CONSTRAINT dias_semana_pkey PRIMARY KEY (id_dia);
 F   ALTER TABLE ONLY public.dias_semana DROP CONSTRAINT dias_semana_pkey;
       public            postgres    false    228                       2606    16527    docentes docentes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docentes_pkey PRIMARY KEY (codigo_dni);
 @   ALTER TABLE ONLY public.docentes DROP CONSTRAINT docentes_pkey;
       public            postgres    false    236                       2606    16552 *   estudiantes_grupos estudiantes_grupos_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes_grupos
    ADD CONSTRAINT estudiantes_grupos_pkey PRIMARY KEY (codigo_estudiante, id_asig, id_semestre);
 T   ALTER TABLE ONLY public.estudiantes_grupos DROP CONSTRAINT estudiantes_grupos_pkey;
       public            postgres    false    238    238    238                       2606    16542    estudiantes estudiantes_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (codigo_dni);
 F   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pkey;
       public            postgres    false    237            �           2606    16411    facultades facultades_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.facultades
    ADD CONSTRAINT facultades_pkey PRIMARY KEY (id_fac);
 D   ALTER TABLE ONLY public.facultades DROP CONSTRAINT facultades_pkey;
       public            postgres    false    216                       2606    16608 <   grupos_asignaturas_horarios grupos_asignaturas_horarios_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.grupos_asignaturas_horarios
    ADD CONSTRAINT grupos_asignaturas_horarios_pkey PRIMARY KEY (id_horario, id_asig, id_semestre, numero_grupo);
 f   ALTER TABLE ONLY public.grupos_asignaturas_horarios DROP CONSTRAINT grupos_asignaturas_horarios_pkey;
       public            postgres    false    242    242    242    242            �           2606    16482 *   grupos_asignaturas grupos_asignaturas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.grupos_asignaturas
    ADD CONSTRAINT grupos_asignaturas_pkey PRIMARY KEY (id_asig, id_semestre, numero);
 T   ALTER TABLE ONLY public.grupos_asignaturas DROP CONSTRAINT grupos_asignaturas_pkey;
       public            postgres    false    231    231    231            �           2606    16472    horarios horarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id_horario);
 @   ALTER TABLE ONLY public.horarios DROP CONSTRAINT horarios_pkey;
       public            postgres    false    230                       2606    16568 (   notas_actividades notas_actividades_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.notas_actividades
    ADD CONSTRAINT notas_actividades_pkey PRIMARY KEY (codigo_estudiante, id_asig, id_semestre, id_actividad);
 R   ALTER TABLE ONLY public.notas_actividades DROP CONSTRAINT notas_actividades_pkey;
       public            postgres    false    239    239    239    239            �           2606    16510 !   personas personas_correo_pers_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_correo_pers_key UNIQUE (correo_pers);
 K   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_correo_pers_key;
       public            postgres    false    234            �           2606    16508    personas personas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (codigo_dni);
 @   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_pkey;
       public            postgres    false    234            �           2606    16418 4   programas_academicos programas_academicos_codigo_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.programas_academicos
    ADD CONSTRAINT programas_academicos_codigo_key UNIQUE (codigo);
 ^   ALTER TABLE ONLY public.programas_academicos DROP CONSTRAINT programas_academicos_codigo_key;
       public            postgres    false    217            �           2606    16416 .   programas_academicos programas_academicos_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.programas_academicos
    ADD CONSTRAINT programas_academicos_pkey PRIMARY KEY (id_prog);
 X   ALTER TABLE ONLY public.programas_academicos DROP CONSTRAINT programas_academicos_pkey;
       public            postgres    false    217            
           2606    16583 0   programas_estudiantes programas_estudiantes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.programas_estudiantes
    ADD CONSTRAINT programas_estudiantes_pkey PRIMARY KEY (codigo_estudiante, id_prog);
 Z   ALTER TABLE ONLY public.programas_estudiantes DROP CONSTRAINT programas_estudiantes_pkey;
       public            postgres    false    240    240            �           2606    16460    salones salones_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.salones
    ADD CONSTRAINT salones_pkey PRIMARY KEY (id_salon);
 >   ALTER TABLE ONLY public.salones DROP CONSTRAINT salones_pkey;
       public            postgres    false    226            �           2606    16454    semestres semestres_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.semestres
    ADD CONSTRAINT semestres_pkey PRIMARY KEY (id_semestre);
 B   ALTER TABLE ONLY public.semestres DROP CONSTRAINT semestres_pkey;
       public            postgres    false    224            �           2606    16429 $   tipos_programas tipos_programas_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipos_programas
    ADD CONSTRAINT tipos_programas_pkey PRIMARY KEY (id_tipo);
 N   ALTER TABLE ONLY public.tipos_programas DROP CONSTRAINT tipos_programas_pkey;
       public            postgres    false    219            �           2606    16517 !   usuarios usuarios_correo_inst_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_inst_key UNIQUE (correo_inst);
 K   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_correo_inst_key;
       public            postgres    false    235                        2606    16515    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (codigo_dni);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    235                       2606    16669 =   actividades actividades_id_asig_id_semestre_numero_grupo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_id_asig_id_semestre_numero_grupo_fkey FOREIGN KEY (id_asig, id_semestre, numero_grupo) REFERENCES public.grupos_asignaturas(id_asig, id_semestre, numero) ON UPDATE CASCADE NOT VALID;
 g   ALTER TABLE ONLY public.actividades DROP CONSTRAINT actividades_id_asig_id_semestre_numero_grupo_fkey;
       public          postgres    false    233    233    231    231    231    3318    233                        2606    16599 /   administradores administradores_codigo_dni_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.administradores
    ADD CONSTRAINT administradores_codigo_dni_fkey FOREIGN KEY (codigo_dni) REFERENCES public.usuarios(codigo_dni);
 Y   ALTER TABLE ONLY public.administradores DROP CONSTRAINT administradores_codigo_dni_fkey;
       public          postgres    false    3328    241    235                       2606    16439 $   asignaturas asignaturas_id_prog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_id_prog_fkey FOREIGN KEY (id_prog) REFERENCES public.programas_academicos(id_prog);
 N   ALTER TABLE ONLY public.asignaturas DROP CONSTRAINT asignaturas_id_prog_fkey;
       public          postgres    false    222    217    3302                       2606    16528 !   docentes docentes_codigo_dni_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docentes_codigo_dni_fkey FOREIGN KEY (codigo_dni) REFERENCES public.usuarios(codigo_dni);
 K   ALTER TABLE ONLY public.docentes DROP CONSTRAINT docentes_codigo_dni_fkey;
       public          postgres    false    236    3328    235                       2606    16543 '   estudiantes estudiantes_codigo_dni_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_codigo_dni_fkey FOREIGN KEY (codigo_dni) REFERENCES public.usuarios(codigo_dni);
 Q   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_codigo_dni_fkey;
       public          postgres    false    235    237    3328                       2606    16553 <   estudiantes_grupos estudiantes_grupos_codigo_estudiante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes_grupos
    ADD CONSTRAINT estudiantes_grupos_codigo_estudiante_fkey FOREIGN KEY (codigo_estudiante) REFERENCES public.estudiantes(codigo_dni);
 f   ALTER TABLE ONLY public.estudiantes_grupos DROP CONSTRAINT estudiantes_grupos_codigo_estudiante_fkey;
       public          postgres    false    3332    238    237                       2606    16558 K   estudiantes_grupos estudiantes_grupos_id_asig_id_semestre_numero_grupo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes_grupos
    ADD CONSTRAINT estudiantes_grupos_id_asig_id_semestre_numero_grupo_fkey FOREIGN KEY (id_asig, id_semestre, numero_grupo) REFERENCES public.grupos_asignaturas(id_asig, id_semestre, numero);
 u   ALTER TABLE ONLY public.estudiantes_grupos DROP CONSTRAINT estudiantes_grupos_id_asig_id_semestre_numero_grupo_fkey;
       public          postgres    false    238    231    231    231    238    238    3318                       2606    16533 9   grupos_asignaturas grupos_asignaturas_codigo_docente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grupos_asignaturas
    ADD CONSTRAINT grupos_asignaturas_codigo_docente_fkey FOREIGN KEY (codigo_docente) REFERENCES public.docentes(codigo_dni) NOT VALID;
 c   ALTER TABLE ONLY public.grupos_asignaturas DROP CONSTRAINT grupos_asignaturas_codigo_docente_fkey;
       public          postgres    false    236    231    3330            !           2606    16664 [   grupos_asignaturas_horarios grupos_asignaturas_horarios_id_asig_id_semestre_numero_gru_fkey    FK CONSTRAINT       ALTER TABLE ONLY public.grupos_asignaturas_horarios
    ADD CONSTRAINT grupos_asignaturas_horarios_id_asig_id_semestre_numero_gru_fkey FOREIGN KEY (id_asig, id_semestre, numero_grupo) REFERENCES public.grupos_asignaturas(id_asig, id_semestre, numero) ON UPDATE CASCADE NOT VALID;
 �   ALTER TABLE ONLY public.grupos_asignaturas_horarios DROP CONSTRAINT grupos_asignaturas_horarios_id_asig_id_semestre_numero_gru_fkey;
       public          postgres    false    231    231    242    231    3318    242    242            "           2606    16609 G   grupos_asignaturas_horarios grupos_asignaturas_horarios_id_horario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grupos_asignaturas_horarios
    ADD CONSTRAINT grupos_asignaturas_horarios_id_horario_fkey FOREIGN KEY (id_horario) REFERENCES public.horarios(id_horario);
 q   ALTER TABLE ONLY public.grupos_asignaturas_horarios DROP CONSTRAINT grupos_asignaturas_horarios_id_horario_fkey;
       public          postgres    false    242    230    3316            #           2606    16619 E   grupos_asignaturas_horarios grupos_asignaturas_horarios_id_salon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grupos_asignaturas_horarios
    ADD CONSTRAINT grupos_asignaturas_horarios_id_salon_fkey FOREIGN KEY (id_salon) REFERENCES public.salones(id_salon);
 o   ALTER TABLE ONLY public.grupos_asignaturas_horarios DROP CONSTRAINT grupos_asignaturas_horarios_id_salon_fkey;
       public          postgres    false    242    3312    226                       2606    16483 2   grupos_asignaturas grupos_asignaturas_id_asig_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grupos_asignaturas
    ADD CONSTRAINT grupos_asignaturas_id_asig_fkey FOREIGN KEY (id_asig) REFERENCES public.asignaturas(id_asig);
 \   ALTER TABLE ONLY public.grupos_asignaturas DROP CONSTRAINT grupos_asignaturas_id_asig_fkey;
       public          postgres    false    231    3308    222                       2606    16488 6   grupos_asignaturas grupos_asignaturas_id_semestre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grupos_asignaturas
    ADD CONSTRAINT grupos_asignaturas_id_semestre_fkey FOREIGN KEY (id_semestre) REFERENCES public.semestres(id_semestre);
 `   ALTER TABLE ONLY public.grupos_asignaturas DROP CONSTRAINT grupos_asignaturas_id_semestre_fkey;
       public          postgres    false    224    3310    231                       2606    16473    horarios horarios_id_dia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_id_dia_fkey FOREIGN KEY (id_dia) REFERENCES public.dias_semana(id_dia);
 G   ALTER TABLE ONLY public.horarios DROP CONSTRAINT horarios_id_dia_fkey;
       public          postgres    false    3314    230    228                       2606    16569 N   notas_actividades notas_actividades_codigo_estudiante_id_asig_id_semestre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notas_actividades
    ADD CONSTRAINT notas_actividades_codigo_estudiante_id_asig_id_semestre_fkey FOREIGN KEY (codigo_estudiante, id_asig, id_semestre) REFERENCES public.estudiantes_grupos(codigo_estudiante, id_asig, id_semestre);
 x   ALTER TABLE ONLY public.notas_actividades DROP CONSTRAINT notas_actividades_codigo_estudiante_id_asig_id_semestre_fkey;
       public          postgres    false    238    3334    239    238    238    239    239                       2606    16574 5   notas_actividades notas_actividades_id_actividad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notas_actividades
    ADD CONSTRAINT notas_actividades_id_actividad_fkey FOREIGN KEY (id_actividad) REFERENCES public.actividades(id_actividad);
 _   ALTER TABLE ONLY public.notas_actividades DROP CONSTRAINT notas_actividades_id_actividad_fkey;
       public          postgres    false    233    239    3320                       2606    16419 5   programas_academicos programas_academicos_id_fac_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programas_academicos
    ADD CONSTRAINT programas_academicos_id_fac_fkey FOREIGN KEY (id_fac) REFERENCES public.facultades(id_fac);
 _   ALTER TABLE ONLY public.programas_academicos DROP CONSTRAINT programas_academicos_id_fac_fkey;
       public          postgres    false    216    3298    217                       2606    16444 6   programas_academicos programas_academicos_id_tipo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programas_academicos
    ADD CONSTRAINT programas_academicos_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipos_programas(id_tipo) NOT VALID;
 `   ALTER TABLE ONLY public.programas_academicos DROP CONSTRAINT programas_academicos_id_tipo_fkey;
       public          postgres    false    217    219    3304                       2606    16584 B   programas_estudiantes programas_estudiantes_codigo_estudiante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programas_estudiantes
    ADD CONSTRAINT programas_estudiantes_codigo_estudiante_fkey FOREIGN KEY (codigo_estudiante) REFERENCES public.estudiantes(codigo_dni);
 l   ALTER TABLE ONLY public.programas_estudiantes DROP CONSTRAINT programas_estudiantes_codigo_estudiante_fkey;
       public          postgres    false    3332    240    237                       2606    16589 8   programas_estudiantes programas_estudiantes_id_prog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.programas_estudiantes
    ADD CONSTRAINT programas_estudiantes_id_prog_fkey FOREIGN KEY (id_prog) REFERENCES public.programas_academicos(id_prog);
 b   ALTER TABLE ONLY public.programas_estudiantes DROP CONSTRAINT programas_estudiantes_id_prog_fkey;
       public          postgres    false    3302    240    217                       2606    16518 !   usuarios usuarios_codigo_dni_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_codigo_dni_fkey FOREIGN KEY (codigo_dni) REFERENCES public.personas(codigo_dni);
 K   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_codigo_dni_fkey;
       public          postgres    false    235    234    3324            �   ^   x�]�1
� ����@�Wqnh� -��Q�t������4
�lG��J�R�Z
)QUu���+P3�a�gH>W���@�%;�0�f���+ �      �      x�3426153��4P ��=... 32�      �   �   x�-���0���7�ف�����h�Ċ91���q����;���H�k]�7�G�` +T�b�9ل�ŚsHP�WJQ<��O}@��k ���K9D�R��J@K`#��e�$���]�	�x�c7q/�c�{��T@�@������k��垲<F��m��� �c7�      �   O   x�3�t����K��,�2�>�0)1�6��L-�K-�M8�JS��LSN���+���s�\3N�Ģ0Ӝӧ�<F��� ���      �   (   x�34005�420�T �.C#B1� �H� 6�	�      �   2   x�3400� �,��M I���D� I���"F����� V�$      �   V   x�m��� ��3L�	P�t�N��jޥ&�������#�NF���3PE�*:m�S���$Хe1
4y�Љ������r3�%      �   b   x�3���KO��L-:�6����˘�1%73/���(19���<��	�SjNNb��cQI*H�)�sfj^r&H(7	�,I�K�!$RRr�sJS�1z\\\ #�      �   I   x�3�44�BSK#3K�,�2�4�4�"nǦ���L��`��0qcB���z#�{����qqq I�b      �   J   x�M���0�3&v>[t����+Jn<� ���|�03Q3�+�+� ��u��A4E��]�����2E      �   @   x�3�4�40�20 "NK(��ˈӘ���54��s�c7�4Ch74���r� �o����� g�      �   v   x�}���0��N@�B��8��G*5��ؼ�^�{LĞ�=`�����L�/����u���R����	�d�&���ý���֦D]������g+��8X+�v߃*�dd���z�#t`J��uK(      �   s  x�e�An�0EדS��qBvP�*Q��U�� R9ve'�r�.��)�X=v�J:�/���;�i���I�b*�ɭ0�=����Ni��:e��0���������rVr6.�Ek�J�hv�J�FXbb���٦�[N��yA��3GSk����t�,w6��3)<(P��D��k!��>����c�(
���)�v�9he5�/�F�{V���=���.�v\5� l*)��(Oh�pL��'��l��o�^���VH��ft��yVz�i�k�΃�B�O�A �ע��#�w'� EP����-�Rj��2�c��HVN�
8SG�����k�"�-ڦ�|)���^�ga�O�����d�L
�����طQE�}ƚ      �   �   x�u�A
�0EדS�	m��
�fS�U7iʀf��Cu�G��t)]͇y��JP"��ܛ�O���p�i1!����OP��������1B>l�Y6q���p䰚���d�%� ��]���r�:�ˋ�E3�X�k�4�ew��@g�u��t��U���n7���>c��=!�R�M�      �      x������ � �      �      x�3�44�4�4�,����� ^L      �   E   x�-���0߰�+p�0������:;��%^#,7��i��X6�c�����E̯�>�����      �   ;   x�3�(JM/JL��,�2��ML-.):�6�3�t-.HM�L�ɬJL�<�9(���� �Jz      �   i  x���A�[!���=����]ҍ1�}U&�^�.z���Y�۠_��'l��2�
_��͎-�kJ_o��w역[�����,h�"&�X�uw�-Fl�J7�Fn�Me�|8�]�Ȳ.�ۋMPt9?ov��*)�,i܎v:�H��%����S����c(��y�n�����/�c�q�㓔=3���B�E�H[��R�fi���Ue)��c!JK*+K��8=A��IFhv(��QI���w�Qݒ�!Q3bĬłdeA�m���dE��]�h:+ԡad�.1oC�KiJ���vI�Ҩw+}�|��)�UPR�U�}BcUL���s�,��OG�JTz���з������*�     