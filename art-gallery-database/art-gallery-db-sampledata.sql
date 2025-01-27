PGDMP                         {           art_gallery_db    15.1    15.1 '    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            @           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            A           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            B           1262    16764    art_gallery_db    DATABASE     �   CREATE DATABASE art_gallery_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Australia.1252';
    DROP DATABASE art_gallery_db;
                postgres    false            C           0    0    DATABASE art_gallery_db    COMMENT     R   COMMENT ON DATABASE art_gallery_db IS 'The DDGCIT art gallery project database.';
                   postgres    false    3394            �            1259    16765    account    TABLE     �  CREATE TABLE public.account (
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
       public         heap    postgres    false            �            1259    16775    account_account_id_seq    SEQUENCE     �   ALTER TABLE public.account ALTER COLUMN account_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16776    artist    TABLE       CREATE TABLE public.artist (
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
       public         heap    postgres    false            �            1259    16786    artist_artist_id_seq    SEQUENCE     �   ALTER TABLE public.artist ALTER COLUMN artist_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.artist_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16787    artist_artwork    TABLE     �   CREATE TABLE public.artist_artwork (
    artist_id integer NOT NULL,
    artwork_id integer NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 "   DROP TABLE public.artist_artwork;
       public         heap    postgres    false            �            1259    16790    artwork    TABLE     �  CREATE TABLE public.artwork (
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
       public         heap    postgres    false            �            1259    16799    artwork_artwork_id_seq    SEQUENCE     �   ALTER TABLE public.artwork ALTER COLUMN artwork_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.artwork_artwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16800    artwork_exhibition    TABLE     �   CREATE TABLE public.artwork_exhibition (
    artwork_id integer NOT NULL,
    exhibition_id integer NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 &   DROP TABLE public.artwork_exhibition;
       public         heap    postgres    false            �            1259    16803 
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
       public         heap    postgres    false            �            1259    16811    exhibition_exhibition_id_seq    SEQUENCE     �   ALTER TABLE public.exhibition ALTER COLUMN exhibition_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exhibition_exhibition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16812    media    TABLE     x  CREATE TABLE public.media (
    media_id integer NOT NULL,
    media_type text NOT NULL,
    description text NOT NULL,
    modified_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT chk_description CHECK ((char_length(description) <= 2500)),
    CONSTRAINT chk_media_type CHECK ((char_length(media_type) <= 150))
);
    DROP TABLE public.media;
       public         heap    postgres    false            �            1259    16819    media_media_id_seq    SEQUENCE     �   ALTER TABLE public.media ALTER COLUMN media_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.media_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            1          0    16765    account 
   TABLE DATA                 public          postgres    false    214   �3       3          0    16776    artist 
   TABLE DATA                 public          postgres    false    216   
5       5          0    16787    artist_artwork 
   TABLE DATA                 public          postgres    false    218   27       6          0    16790    artwork 
   TABLE DATA                 public          postgres    false    219   8       8          0    16800    artwork_exhibition 
   TABLE DATA                 public          postgres    false    221   ?       9          0    16803 
   exhibition 
   TABLE DATA                 public          postgres    false    222   �?       ;          0    16812    media 
   TABLE DATA                 public          postgres    false    224   �A       D           0    0    account_account_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.account_account_id_seq', 2, true);
          public          postgres    false    215            E           0    0    artist_artist_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.artist_artist_id_seq', 5, true);
          public          postgres    false    217            F           0    0    artwork_artwork_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.artwork_artwork_id_seq', 5, true);
          public          postgres    false    220            G           0    0    exhibition_exhibition_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.exhibition_exhibition_id_seq', 2, true);
          public          postgres    false    223            H           0    0    media_media_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.media_media_id_seq', 3, true);
          public          postgres    false    225            �           2606    16821    account account_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    214            �           2606    16823    artist artist_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artist_id);
 <   ALTER TABLE ONLY public.artist DROP CONSTRAINT artist_pkey;
       public            postgres    false    216            �           2606    16825    artwork artwork_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.artwork
    ADD CONSTRAINT artwork_pkey PRIMARY KEY (artwork_id);
 >   ALTER TABLE ONLY public.artwork DROP CONSTRAINT artwork_pkey;
       public            postgres    false    219            �           2606    16827    exhibition exhibition_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.exhibition
    ADD CONSTRAINT exhibition_pkey PRIMARY KEY (exhibition_id);
 D   ALTER TABLE ONLY public.exhibition DROP CONSTRAINT exhibition_pkey;
       public            postgres    false    222            �           2606    16829    media media_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (media_id);
 :   ALTER TABLE ONLY public.media DROP CONSTRAINT media_pkey;
       public            postgres    false    224            �           2606    16830    artist_artwork fk_artist    FK CONSTRAINT     �   ALTER TABLE ONLY public.artist_artwork
    ADD CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.artist_artwork DROP CONSTRAINT fk_artist;
       public          postgres    false    218    3223    216            �           2606    16835    artist_artwork fk_artwork    FK CONSTRAINT     �   ALTER TABLE ONLY public.artist_artwork
    ADD CONSTRAINT fk_artwork FOREIGN KEY (artwork_id) REFERENCES public.artwork(artwork_id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.artist_artwork DROP CONSTRAINT fk_artwork;
       public          postgres    false    218    3225    219            �           2606    16840    artwork_exhibition fk_artwork    FK CONSTRAINT     �   ALTER TABLE ONLY public.artwork_exhibition
    ADD CONSTRAINT fk_artwork FOREIGN KEY (artwork_id) REFERENCES public.artwork(artwork_id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.artwork_exhibition DROP CONSTRAINT fk_artwork;
       public          postgres    false    3225    219    221            �           2606    16845     artwork_exhibition fk_exhibition    FK CONSTRAINT     �   ALTER TABLE ONLY public.artwork_exhibition
    ADD CONSTRAINT fk_exhibition FOREIGN KEY (exhibition_id) REFERENCES public.exhibition(exhibition_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.artwork_exhibition DROP CONSTRAINT fk_exhibition;
       public          postgres    false    221    222    3227            �           2606    16850    artwork fk_media    FK CONSTRAINT     �   ALTER TABLE ONLY public.artwork
    ADD CONSTRAINT fk_media FOREIGN KEY (media_id) REFERENCES public.media(media_id) ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.artwork DROP CONSTRAINT fk_media;
       public          postgres    false    219    224    3229            1   c  x�͐�n�0 �|�H���!$���7(,͆���m�(�iJ��%�ꩈk%�o�ѻ�5s����7�|r"cBDg��N%��I�mb1	��Y�y(�N�����	$"�:L2~f�I ��8��$g%7�<:�5�fc�\o8A�����u$��Ǭv�}��/x$7~a�B&�U��V9������m����#_� /������H�Wě�^�dA~֗�~��,)&R��TPSQD��v=rKE��߷��kl�b��ް�-e�(��`w:��}1�M�XC���Ϲ���~pd[;��4w�8)?�m��:-��4���`G��a���zϚ�e���R��      3     x�ݕMo�0�����J4�|��t�]��JI�'�����hpZ���@�K6٪Ro���c�g�'��|I�dyO��'��!C�kE.�w�s�u�b0�`�9����߬-ʂH���!ݡВ`��H�8��${`x�́5�F����L�$C-��Kr������8�%���rzGV׳�i�.�5�q�07t溺T)���NF�ȊU�@/����h$d�D)k4tG���Qz=�0OD)E8��]7�BV�U&�J@����:�B[����1�e;W�}e9Ķ"D�������� >*:��'�	�N"�e��N$=�s4�y�ۼw�C=�$?�UY�/:viӆ�Q�m;r�&є��p�=�s���3�d�)ť�FO'}�k�q���D&Q+&��o�"p�~�]�G�~��z^`{���B�5Ch7��W���ѓIO���$��(�I�7�<c+$����;~s9�M�@���9&n$V ��n�p�O%�Dg�;ɿ����D��E�ZG��8[<� �F��C?��1���3�-�q      5   �   x���=�0ཿ�6bH�.��ɡCA�ZK�
A�R+�}��
F�@ �������E6_B>]��|��V�Mk/m�[���|�J���1������*�V��ٕ�c��z<Ye�j�tP!����S�������?퍢<��w?��$i�z��}�au$�|�Ȓ�1*�ս��:��'�$�Ʒ��4��ь��X�[�ՙ_:#9Q4`��:]�#�$      6   �  x��V�n�8��+�K
؊_�lw��t:�)�I[�J�$JbM�*I�pW��f~�_2璒�A1]A��s�9�qyu������y��.U2��q;m6�Id>bN:%F,63�uR7#�Ys�O�,E�5bVd�ɿ���$��	X�E.��Y�\R�	w#֯��1{����7��^^�`�]�<��={��yx^��鈝�T����Lw��J�*m�'�8�X�e�dS2[�e��Fw-���S�ۍl����2����&g�QZo����2��P{�a;83"s�);��s�
7���ov<U"b��0��D^
���"3�j��J	Ŝ�K�vN�wvn�<0+Dm:�و]ý���Ou����ֱ���h���ۗ�[��[�3�[iǩ��k�el���sN��k�{��ލ+ųqۙ�$@�jm��4�Kn`�YV�&)m�
�r��0>�F
�j,��Q<52c�+K��YG�Jn�J0�+�p�n���X!<!����4��x��\��A�� ���K#o�4��"�Φ�o�J����b$��B��;Ô(� �!8V�wy���*���&��:�1Ka�Ȇ[���$�rF����o� -��Ւ"-���3�-����M8t�� ��~���)|�TBH�E�o�ףg�A�X���R����S��"����r�K�]e'7cr�H-�5�����T��:$'N)������U�(q)���gD*܎4�?J��)Z9�M��6����#�Ko>�P�S���FY���F�Z�ە��!�|���8�I��e�<�]h��INh���R�X�l��B��x��އRP
�k�
��2��Ў�u��Ҿ!�3�l����Vεv}v�t�U��[�����u{�7{�SI�p2�L��|M�m	Wo_����l�'L�&��x2O�l:_��d��e���|���G��K���i�l@߅�vޓ ^a��̑v����]J[t��+)U�^�}�
��x"5�N�*�UT�lg<��r�b�4ot�)
�y�E�8	Ja��m�����Bڂ�"I|��ˢ�2��q^�>,5��:���,��Z�ǥB2�ˢ�Y�I��ХW�w(:ɵ�A��?(�ل��j���MȺL+m|ʡg�:�/���C�s]ˆ袸���>�O�裂���5z���v����"����-�
�'=��}� �Q*�P]�^S�FiP"(�S ��\�����ܝ�j��r�s�P'�}+S���|�f����9��J-}h�}�o��y��B+�?����_G2$wl��K�S�)tx�BI������dX�R֙-<�p�3]uk%�%)�!d�����?L��$��(x�<HBBড��P#0���T�C�,�fb�u/EGc��*�@u$cRj�u?��d�{h�8=�ءp�}4wp��aֵ���� /�����O�;I�#;
�gܼP����!ǎ�4��,i}���
���ʃ�TC�
�c;|��"b���.����� %
d"��'DkB'^��tO�i��i(��꫆�@�YOf��*�.�i�|��64ғ?x�H����L޾��n/ɾ�����-*��0�XM_�~�#��À#9���	 ���h~��8����[J���"����v��P	[�����g��I�$�i1 9���_����<Z�f�Ofߒvg�����&�3��m���r?�.>`H>���<�x��l� W�oؘc���x���"����%V'����ѣ� �(�      8   �   x���;�0���6+��K�4��C��(Xu-}��G�D��+��u������p�,�K�g�9����4k�nviuݚ�XS�}�LI�}���4S�if	M���<��d��p}H`�<�<6� �B�LR�4�`��N�%�R*���v����ٷC�\Q�$�E�Y�Q��𨯴Bݪ|�~��K�T)_ʶ���w��� ��      9   �  x�Ւ�k�0���Wܛ[�����{
,C���kٓ��k,�HF�������t��v ��������z�_��7��������[�$\�閳$9b�|��:B�%k�����X�mˈu�ѕ.���ZbC�]��k�ޭv��k�����f������幇�4����G'����7�GI0�9x$P%��(��Ҟ˃�jzd�=Cm��D�k��#S'N��uF���ڹ��O	�1��큢��~�}�����S�(�2�*��lz^���W�[x��mF�u4B�W�9��$I��I��_�%Y%�;/��]�jY���UVTI��|��T�*���|�Ep�eR��3ϗQ�1�������k�Ui�N����x�k����7�F T+���j"^���,\�E�9r�y>��Qu\'�ߕ6      ;      x��SMk1��W��	l��p�
5����vSz
����JB��u}G��!�c.�#���齙�z���a��o���<�@7���"�!
+3�s�6���J��B�IR|���v���Z����~��>~���;�)3�nP�7�:�>Nǵ��5�`�F���X��w��=��c�x�|��B�xR�K�Q�<֨���+�����^�.�y�p_��@o'�wQ�"^���Q�1��4�0��B�QرS��3\z�n���PK���>~	��I����cT+�$n`�"�Iz'�BZ��6n�rXi��,m��($tL�h	��rn��.���P��������ц����t>�5
}KT�����%�)$-�te ��h$�Z�Ag�t��]ø|����E1[�m]�����{M�~P��zIc���t�H�+B�8pt��i�}���=�v�� v@�%阵���C��6m�㍐:�:���/wYF�?&�)�8	�M���ٸS���ߒ�a�В�����90ϋ�.?<���;��_k+�$     