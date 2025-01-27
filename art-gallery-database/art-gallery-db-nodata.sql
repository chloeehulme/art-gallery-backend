PGDMP     0                    {           art-gallery-db    15.1    15.1     3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    16490    art-gallery-db    DATABASE     �   CREATE DATABASE "art-gallery-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Australia.1252';
     DROP DATABASE "art-gallery-db";
                postgres    false            7           0    0    DATABASE "art-gallery-db"    COMMENT     T   COMMENT ON DATABASE "art-gallery-db" IS 'The DDGCIT art gallery project database.';
                   postgres    false    3382            �            1259    16492    account    TABLE     �  CREATE TABLE public.account (
    account_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    password_hash text NOT NULL,
    role text NOT NULL,
    active_at timestamp without time zone,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT chk_email CHECK ((char_length(email) <= 255)),
    CONSTRAINT chk_first_name CHECK ((char_length(first_name) <= 100)),
    CONSTRAINT chk_last_name CHECK ((char_length(last_name) <= 100)),
    CONSTRAINT chk_password CHECK ((char_length(password_hash) <= 550)),
    CONSTRAINT chk_role CHECK ((char_length(role) <= 50))
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    16491    account_account_id_seq    SEQUENCE     �   ALTER TABLE public.account ALTER COLUMN account_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16505    artist    TABLE       CREATE TABLE public.artist (
    artist_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    display_name text NOT NULL,
    profile_image_url text NOT NULL,
    place_of_birth text,
    year_of_birth integer NOT NULL,
    year_of_death integer,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT chk_display_name CHECK ((char_length(display_name) <= 255)),
    CONSTRAINT chk_first_name CHECK ((char_length(first_name) <= 100)),
    CONSTRAINT chk_last_name CHECK ((char_length(last_name) <= 100)),
    CONSTRAINT chk_place_of_birth CHECK ((char_length(place_of_birth) <= 100)),
    CONSTRAINT chk_primary_image_url CHECK ((char_length(profile_image_url) <= 255))
);
    DROP TABLE public.artist;
       public         heap    postgres    false            �            1259    16504    artist_artist_id_seq    SEQUENCE     �   ALTER TABLE public.artist ALTER COLUMN artist_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.artist_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16555    artist_artwork    TABLE     �   CREATE TABLE public.artist_artwork (
    artist_id integer NOT NULL,
    artwork_id integer NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 "   DROP TABLE public.artist_artwork;
       public         heap    postgres    false            �            1259    16528    artwork    TABLE     �  CREATE TABLE public.artwork (
    artwork_id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    primary_image_url text NOT NULL,
    secondary_image_url text,
    year_created integer,
    media_id integer,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT check_description CHECK ((char_length(description) <= 2500)),
    CONSTRAINT chk_primary_image_url CHECK ((char_length(primary_image_url) <= 255)),
    CONSTRAINT chk_secondary_image_url CHECK ((char_length(secondary_image_url) <= 255)),
    CONSTRAINT chk_title CHECK ((char_length(title) <= 255))
);
    DROP TABLE public.artwork;
       public         heap    postgres    false            �            1259    16527    artwork_artwork_id_seq    SEQUENCE     �   ALTER TABLE public.artwork ALTER COLUMN artwork_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.artwork_artwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16568    artwork_exhibition    TABLE     �   CREATE TABLE public.artwork_exhibition (
    artwork_id integer NOT NULL,
    exhibition_id integer NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 &   DROP TABLE public.artwork_exhibition;
       public         heap    postgres    false            �            1259    16545 
   exhibition    TABLE     1  CREATE TABLE public.exhibition (
    exhibition_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    background_image_url text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT check_description CHECK ((char_length(description) <= 2500)),
    CONSTRAINT chk_background_image_url CHECK ((char_length(background_image_url) <= 255)),
    CONSTRAINT chk_name CHECK ((char_length(name) <= 1000))
);
    DROP TABLE public.exhibition;
       public         heap    postgres    false            �            1259    16544    exhibition_exhibition_id_seq    SEQUENCE     �   ALTER TABLE public.exhibition ALTER COLUMN exhibition_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exhibition_exhibition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16518    media    TABLE     x  CREATE TABLE public.media (
    media_id integer NOT NULL,
    media_type text NOT NULL,
    description text NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT chk_description CHECK ((char_length(description) <= 2500)),
    CONSTRAINT chk_media_type CHECK ((char_length(media_type) <= 150))
);
    DROP TABLE public.media;
       public         heap    postgres    false            �            1259    16517    media_media_id_seq    SEQUENCE     �   ALTER TABLE public.media ALTER COLUMN media_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.media_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �           2606    16503    account account_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    215            �           2606    16516    artist artist_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artist_id);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public            postgres    false    217            �           2606    16538    artwork artwork_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.artwork
    ADD CONSTRAINT artwork_pkey PRIMARY KEY (artwork_id);
 >   ALTER TABLE ONLY public.artwork DROP CONSTRAINT artwork_pkey;
       public            postgres    false    221            �           2606    16554    exhibition exhibition_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.exhibition
    ADD CONSTRAINT exhibition_pkey PRIMARY KEY (exhibition_id);
 D   ALTER TABLE ONLY public.exhibition DROP CONSTRAINT exhibition_pkey;
       public            postgres    false    223            �           2606    16526    media media_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (media_id);
 :   ALTER TABLE ONLY public.media DROP CONSTRAINT media_pkey;
       public            postgres    false    219            �           2606    16558    artist_artwork fk_artist    FK CONSTRAINT     �   ALTER TABLE ONLY public.artist_artwork
    ADD CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.artist_artwork DROP CONSTRAINT fk_artist;
       public          postgres    false    217    3223    224            �           2606    16563    artist_artwork fk_artwork    FK CONSTRAINT     �   ALTER TABLE ONLY public.artist_artwork
    ADD CONSTRAINT fk_artwork FOREIGN KEY (artwork_id) REFERENCES public.artwork(artwork_id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.artist_artwork DROP CONSTRAINT fk_artwork;
       public          postgres    false    224    3227    221            �           2606    16571    artwork_exhibition fk_artwork    FK CONSTRAINT     �   ALTER TABLE ONLY public.artwork_exhibition
    ADD CONSTRAINT fk_artwork FOREIGN KEY (artwork_id) REFERENCES public.artwork(artwork_id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.artwork_exhibition DROP CONSTRAINT fk_artwork;
       public          postgres    false    225    221    3227            �           2606    16576     artwork_exhibition fk_exhibition    FK CONSTRAINT     �   ALTER TABLE ONLY public.artwork_exhibition
    ADD CONSTRAINT fk_exhibition FOREIGN KEY (exhibition_id) REFERENCES public.exhibition(exhibition_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.artwork_exhibition DROP CONSTRAINT fk_exhibition;
       public          postgres    false    225    223    3229            �           2606    16539    artwork fk_media    FK CONSTRAINT     �   ALTER TABLE ONLY public.artwork
    ADD CONSTRAINT fk_media FOREIGN KEY (media_id) REFERENCES public.media(media_id) ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.artwork DROP CONSTRAINT fk_media;
       public          postgres    false    219    3225    221           