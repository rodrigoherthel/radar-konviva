PGDMP             
            {            lc    15.2 (Debian 15.2-1.pgdg110+1)    15.2 '   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16392    lc    DATABASE     m   CREATE DATABASE lc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE lc;
                postgres    false            �           0    0    lc    DATABASE PROPERTIES     9   ALTER DATABASE lc SET "TimeZone" TO 'America/Sao_Paulo';
                     postgres    false                        2615    19215    consultancy    SCHEMA        CREATE SCHEMA consultancy;
    DROP SCHEMA consultancy;
                postgres    false            �           0    0    SCHEMA public    ACL     y   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   pg_database_owner    false    6                        2615    19071 
   regulation    SCHEMA        CREATE SCHEMA regulation;
    DROP SCHEMA regulation;
                postgres    false                        3079    17083    pg_trgm 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;
    DROP EXTENSION pg_trgm;
                   false            �           0    0    EXTENSION pg_trgm    COMMENT     e   COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';
                        false    2            c           1255    17164    primeiro_nome(character)    FUNCTION     �   CREATE FUNCTION public.primeiro_nome(nome character) RETURNS character
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
RETURN substring(TRIM(nome) FROM '^([^ ]+)');
END; 
$$;
 4   DROP FUNCTION public.primeiro_nome(nome character);
       public          postgres    false            C           1259    19223    ConsultingCategories    TABLE     v   CREATE TABLE consultancy."ConsultingCategories" (
    "Id" smallint NOT NULL,
    "Category" character varying(50)
);
 /   DROP TABLE consultancy."ConsultingCategories";
       consultancy         heap    postgres    false    8            B           1259    19222    ConsultingCategories_Id_seq    SEQUENCE     �   CREATE SEQUENCE consultancy."ConsultingCategories_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE consultancy."ConsultingCategories_Id_seq";
       consultancy          postgres    false    323    8            �           0    0    ConsultingCategories_Id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE consultancy."ConsultingCategories_Id_seq" OWNED BY consultancy."ConsultingCategories"."Id";
          consultancy          postgres    false    322            �            1259    17165     MonitoringProtocolFlows    TABLE     �   CREATE TABLE public." MonitoringProtocolFlows" (
    "Id" integer NOT NULL,
    "ProtocolId" integer NOT NULL,
    "Order" smallint NOT NULL,
    "Frequency" smallint NOT NULL,
    "Days" smallint NOT NULL
);
 .   DROP TABLE public." MonitoringProtocolFlows";
       public         heap    postgres    false            �           0    0     TABLE " MonitoringProtocolFlows"    COMMENT     M   COMMENT ON TABLE public." MonitoringProtocolFlows" IS 'Fluxos de protocolo';
          public          postgres    false    217            �           0    0 .   COLUMN " MonitoringProtocolFlows"."ProtocolId"    COMMENT     W   COMMENT ON COLUMN public." MonitoringProtocolFlows"."ProtocolId" IS 'Id do protocolo';
          public          postgres    false    217            �           0    0 )   COLUMN " MonitoringProtocolFlows"."Order"    COMMENT     Q   COMMENT ON COLUMN public." MonitoringProtocolFlows"."Order" IS 'Order no fluxo';
          public          postgres    false    217            �           0    0 -   COLUMN " MonitoringProtocolFlows"."Frequency"    COMMENT     �   COMMENT ON COLUMN public." MonitoringProtocolFlows"."Frequency" IS 'Frequencia de envio, 0 a N, onde 0 é repetido indefinidamente';
          public          postgres    false    217            �           0    0 (   COLUMN " MonitoringProtocolFlows"."Days"    COMMENT     h   COMMENT ON COLUMN public." MonitoringProtocolFlows"."Days" IS 'Intervalo de dias entre as frequencias';
          public          postgres    false    217            �            1259    17168    AttendanceHistories    TABLE     `  CREATE TABLE public."AttendanceHistories" (
    "Id" bigint NOT NULL,
    "PatientId" integer,
    "CareLineId" integer,
    "UserId" bigint,
    "CreateAt" timestamp without time zone,
    "SubStageId" smallint,
    "StageId" smallint,
    "AttendanceParentId" integer,
    "PriorityId" integer,
    "StatusId" smallint,
    "UpdatedAt" timestamp without time zone,
    "Disease" character varying(50),
    "Started" timestamp without time zone,
    "Finished" timestamp without time zone,
    "SentToFastMedic" timestamp without time zone,
    "DefinitionMedicalRecordId" integer,
    "Meeting" boolean
);
 )   DROP TABLE public."AttendanceHistories";
       public         heap    postgres    false            �           0    0    TABLE "AttendanceHistories"    COMMENT     O   COMMENT ON TABLE public."AttendanceHistories" IS 'Histórico de Atendimentos';
          public          postgres    false    218            �           0    0 (   COLUMN "AttendanceHistories"."PatientId"    COMMENT     P   COMMENT ON COLUMN public."AttendanceHistories"."PatientId" IS 'Id do paciente';
          public          postgres    false    218            �           0    0 )   COLUMN "AttendanceHistories"."CareLineId"    COMMENT     Y   COMMENT ON COLUMN public."AttendanceHistories"."CareLineId" IS 'Id da linha de cuidado';
          public          postgres    false    218            �           0    0 %   COLUMN "AttendanceHistories"."UserId"    COMMENT     L   COMMENT ON COLUMN public."AttendanceHistories"."UserId" IS 'Id do usuario';
          public          postgres    false    218            �           0    0 '   COLUMN "AttendanceHistories"."CreateAt"    COMMENT     e   COMMENT ON COLUMN public."AttendanceHistories"."CreateAt" IS 'Data e hora da criação do registro';
          public          postgres    false    218            �           0    0 )   COLUMN "AttendanceHistories"."SubStageId"    COMMENT     Z   COMMENT ON COLUMN public."AttendanceHistories"."SubStageId" IS 'Enumerador do substagio';
          public          postgres    false    218            �           0    0 &   COLUMN "AttendanceHistories"."StageId"    COMMENT     [   COMMENT ON COLUMN public."AttendanceHistories"."StageId" IS 'Id do indicaçao de estagio';
          public          postgres    false    218            �           0    0 1   COLUMN "AttendanceHistories"."AttendanceParentId"    COMMENT     �   COMMENT ON COLUMN public."AttendanceHistories"."AttendanceParentId" IS 'Id do atendimento pai, preenchido apenas quando um paciente monitorado entra no PA pela triagem';
          public          postgres    false    218            �           0    0 )   COLUMN "AttendanceHistories"."PriorityId"    COMMENT     S   COMMENT ON COLUMN public."AttendanceHistories"."PriorityId" IS 'Id da prioridade';
          public          postgres    false    218            �           0    0 &   COLUMN "AttendanceHistories"."Started"    COMMENT     e   COMMENT ON COLUMN public."AttendanceHistories"."Started" IS 'Data e hora do início do atendimento';
          public          postgres    false    218            �           0    0 '   COLUMN "AttendanceHistories"."Finished"    COMMENT     l   COMMENT ON COLUMN public."AttendanceHistories"."Finished" IS 'Data e hora da finalização do atendimento';
          public          postgres    false    218            �           0    0 8   COLUMN "AttendanceHistories"."DefinitionMedicalRecordId"    COMMENT     y   COMMENT ON COLUMN public."AttendanceHistories"."DefinitionMedicalRecordId" IS 'ID da última evolução do atendimento';
          public          postgres    false    218            �           0    0 &   COLUMN "AttendanceHistories"."Meeting"    COMMENT     v   COMMENT ON COLUMN public."AttendanceHistories"."Meeting" IS 'Informa se o atendimento teve uma teleconsulta ou não';
          public          postgres    false    218            �            1259    17171 "   AttendanceMedicalRecordAttachments    TABLE     �   CREATE TABLE public."AttendanceMedicalRecordAttachments" (
    "Id" integer NOT NULL,
    "AttendanceMedicalRecordId" integer NOT NULL,
    "Uri" text NOT NULL
);
 8   DROP TABLE public."AttendanceMedicalRecordAttachments";
       public         heap    postgres    false            �           0    0 *   TABLE "AttendanceMedicalRecordAttachments"    COMMENT     W   COMMENT ON TABLE public."AttendanceMedicalRecordAttachments" IS 'Anexos do protuario';
          public          postgres    false    219            �            1259    17176 )   AttendanceMedicalRecordAttachments_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."AttendanceMedicalRecordAttachments_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public."AttendanceMedicalRecordAttachments_Id_seq";
       public          postgres    false    219            �           0    0 )   AttendanceMedicalRecordAttachments_Id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."AttendanceMedicalRecordAttachments_Id_seq" OWNED BY public."AttendanceMedicalRecordAttachments"."Id";
          public          postgres    false    220            �            1259    17177    AttendanceMedicalRecords    TABLE     �  CREATE TABLE public."AttendanceMedicalRecords" (
    "Id" integer NOT NULL,
    "AttendanceId" integer NOT NULL,
    "IsSOAP" boolean DEFAULT false NOT NULL,
    "Subjective" text NOT NULL,
    "Objetctive" text,
    "Avaliation" text,
    "Plan" text,
    "UserId" integer NOT NULL,
    "CreateAt" timestamp without time zone DEFAULT now() NOT NULL,
    "CIAPId" character varying(5),
    "CIDId" character varying(5)
);
 .   DROP TABLE public."AttendanceMedicalRecords";
       public         heap    postgres    false            �           0    0     TABLE "AttendanceMedicalRecords"    COMMENT     [   COMMENT ON TABLE public."AttendanceMedicalRecords" IS 'Registro de evolução/prontuario';
          public          postgres    false    221            �           0    0 0   COLUMN "AttendanceMedicalRecords"."AttendanceId"    COMMENT     [   COMMENT ON COLUMN public."AttendanceMedicalRecords"."AttendanceId" IS 'Id do atendimento';
          public          postgres    false    221            �           0    0 *   COLUMN "AttendanceMedicalRecords"."IsSOAP"    COMMENT     [   COMMENT ON COLUMN public."AttendanceMedicalRecords"."IsSOAP" IS 'Indica um registro SOAP';
          public          postgres    false    221            �           0    0 .   COLUMN "AttendanceMedicalRecords"."Subjective"    COMMENT     k   COMMENT ON COLUMN public."AttendanceMedicalRecords"."Subjective" IS 'Subjetivo ou utilizado para padrão';
          public          postgres    false    221            �           0    0 .   COLUMN "AttendanceMedicalRecords"."Objetctive"    COMMENT     P   COMMENT ON COLUMN public."AttendanceMedicalRecords"."Objetctive" IS 'Objetivo';
          public          postgres    false    221            �           0    0 .   COLUMN "AttendanceMedicalRecords"."Avaliation"    COMMENT     S   COMMENT ON COLUMN public."AttendanceMedicalRecords"."Avaliation" IS 'Avaliação';
          public          postgres    false    221            �           0    0 (   COLUMN "AttendanceMedicalRecords"."Plan"    COMMENT     G   COMMENT ON COLUMN public."AttendanceMedicalRecords"."Plan" IS 'Plano';
          public          postgres    false    221            �            1259    17184    AttendanceMedicalRecord_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."AttendanceMedicalRecord_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."AttendanceMedicalRecord_Id_seq";
       public          postgres    false    221            �           0    0    AttendanceMedicalRecord_Id_seq    SEQUENCE OWNED BY     h   ALTER SEQUENCE public."AttendanceMedicalRecord_Id_seq" OWNED BY public."AttendanceMedicalRecords"."Id";
          public          postgres    false    222            �            1259    17185    AttendanceMeeting    TABLE     �  CREATE TABLE public."AttendanceMeeting" (
    "Id" integer NOT NULL,
    "Code" character varying(15) NOT NULL,
    "UrlPatient" character varying(100) NOT NULL,
    "UrlProfessional" character varying(100) NOT NULL,
    "AttendanceId" integer NOT NULL,
    "Created" timestamp without time zone,
    "CheckinPatient" timestamp without time zone,
    "CheckinProfessional" timestamp without time zone,
    "Finished" timestamp without time zone,
    "Expired" timestamp without time zone
);
 '   DROP TABLE public."AttendanceMeeting";
       public         heap    postgres    false            �           0    0 !   COLUMN "AttendanceMeeting"."Code"    COMMENT     Z   COMMENT ON COLUMN public."AttendanceMeeting"."Code" IS 'Código da sala de teleconsulta';
          public          postgres    false    223            �           0    0 '   COLUMN "AttendanceMeeting"."UrlPatient"    COMMENT     h   COMMENT ON COLUMN public."AttendanceMeeting"."UrlPatient" IS 'URL da sala de teleconsulta do paciente';
          public          postgres    false    223            �           0    0 ,   COLUMN "AttendanceMeeting"."UrlProfessional"    COMMENT     l   COMMENT ON COLUMN public."AttendanceMeeting"."UrlProfessional" IS 'URL da sala de teleconsulta do médico';
          public          postgres    false    223            �           0    0 )   COLUMN "AttendanceMeeting"."AttendanceId"    COMMENT     `   COMMENT ON COLUMN public."AttendanceMeeting"."AttendanceId" IS 'ID do atendimento do paciente';
          public          postgres    false    223            �            1259    17188    AttendanceMeeting_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."AttendanceMeeting_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."AttendanceMeeting_Id_seq";
       public          postgres    false    223            �           0    0    AttendanceMeeting_Id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."AttendanceMeeting_Id_seq" OWNED BY public."AttendanceMeeting"."Id";
          public          postgres    false    224            �            1259    17189    AttendanceProtocols    TABLE     �   CREATE TABLE public."AttendanceProtocols" (
    "Id" integer NOT NULL,
    "AttendanceId" integer NOT NULL,
    "ProtocolId" integer NOT NULL
);
 )   DROP TABLE public."AttendanceProtocols";
       public         heap    postgres    false            �           0    0    TABLE "AttendanceProtocols"    COMMENT     N   COMMENT ON TABLE public."AttendanceProtocols" IS 'Protocolos do atendimento';
          public          postgres    false    225            �           0    0 +   COLUMN "AttendanceProtocols"."AttendanceId"    COMMENT     V   COMMENT ON COLUMN public."AttendanceProtocols"."AttendanceId" IS 'Id do atendimento';
          public          postgres    false    225            �           0    0 )   COLUMN "AttendanceProtocols"."ProtocolId"    COMMENT     R   COMMENT ON COLUMN public."AttendanceProtocols"."ProtocolId" IS 'Id do protocolo';
          public          postgres    false    225            �            1259    17192    AttendanceProtocols_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."AttendanceProtocols_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."AttendanceProtocols_Id_seq";
       public          postgres    false    225            �           0    0    AttendanceProtocols_Id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."AttendanceProtocols_Id_seq" OWNED BY public."AttendanceProtocols"."Id";
          public          postgres    false    226            �            1259    17193    AttendanceTags    TABLE     t   CREATE TABLE public."AttendanceTags" (
    "Id" bigint NOT NULL,
    "AttendanceId" integer,
    "TagId" integer
);
 $   DROP TABLE public."AttendanceTags";
       public         heap    postgres    false            �           0    0    TABLE "AttendanceTags"    COMMENT     C   COMMENT ON TABLE public."AttendanceTags" IS 'Tags do atendimento';
          public          postgres    false    227            �           0    0 &   COLUMN "AttendanceTags"."AttendanceId"    COMMENT     Q   COMMENT ON COLUMN public."AttendanceTags"."AttendanceId" IS 'Id do atendimento';
          public          postgres    false    227            �           0    0    COLUMN "AttendanceTags"."TagId"    COMMENT     B   COMMENT ON COLUMN public."AttendanceTags"."TagId" IS 'Id da TAG';
          public          postgres    false    227            �            1259    17196    AttendanceTags_id_seq    SEQUENCE     �   CREATE SEQUENCE public."AttendanceTags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."AttendanceTags_id_seq";
       public          postgres    false    227            �           0    0    AttendanceTags_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."AttendanceTags_id_seq" OWNED BY public."AttendanceTags"."Id";
          public          postgres    false    228            �            1259    17197    Attendances_id_seq    SEQUENCE     }   CREATE SEQUENCE public."Attendances_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Attendances_id_seq";
       public          postgres    false            �            1259    17198    Attendances    TABLE     �  CREATE TABLE public."Attendances" (
    "Id" bigint DEFAULT nextval('public."Attendances_id_seq"'::regclass) NOT NULL,
    "PatientId" integer,
    "CareLineId" integer,
    "UserId" integer,
    "CreateAt" timestamp without time zone DEFAULT now(),
    "SubStageId" smallint,
    "StageId" smallint,
    "AttendanceParentId" integer,
    "PriorityId" integer,
    "StatusId" smallint DEFAULT 1,
    "UpdatedAt" timestamp without time zone DEFAULT now(),
    "Disease" character varying(50),
    "Started" timestamp without time zone,
    "Finished" timestamp without time zone,
    "SentToFastMedic" timestamp without time zone,
    "DefinitionMedicalRecordId" integer,
    "Meeting" boolean
);
 !   DROP TABLE public."Attendances";
       public         heap    postgres    false    229            �           0    0    TABLE "Attendances"    COMMENT     9   COMMENT ON TABLE public."Attendances" IS 'Atendimentos';
          public          postgres    false    230            �           0    0     COLUMN "Attendances"."PatientId"    COMMENT     H   COMMENT ON COLUMN public."Attendances"."PatientId" IS 'Id do paciente';
          public          postgres    false    230            �           0    0 !   COLUMN "Attendances"."CareLineId"    COMMENT     Q   COMMENT ON COLUMN public."Attendances"."CareLineId" IS 'Id da linha de cuidado';
          public          postgres    false    230            �           0    0    COLUMN "Attendances"."UserId"    COMMENT     D   COMMENT ON COLUMN public."Attendances"."UserId" IS 'Id do usuario';
          public          postgres    false    230            �           0    0    COLUMN "Attendances"."CreateAt"    COMMENT     ]   COMMENT ON COLUMN public."Attendances"."CreateAt" IS 'Data e hora da criação do registro';
          public          postgres    false    230            �           0    0 !   COLUMN "Attendances"."SubStageId"    COMMENT     R   COMMENT ON COLUMN public."Attendances"."SubStageId" IS 'Enumerador do substagio';
          public          postgres    false    230            �           0    0    COLUMN "Attendances"."StageId"    COMMENT     S   COMMENT ON COLUMN public."Attendances"."StageId" IS 'Id do indicaçao de estagio';
          public          postgres    false    230            �           0    0 )   COLUMN "Attendances"."AttendanceParentId"    COMMENT     �   COMMENT ON COLUMN public."Attendances"."AttendanceParentId" IS 'Id do atendimento pai, preenchido apenas quando um paciente monitorado entra no PA pela triagem';
          public          postgres    false    230            �           0    0 !   COLUMN "Attendances"."PriorityId"    COMMENT     K   COMMENT ON COLUMN public."Attendances"."PriorityId" IS 'Id da prioridade';
          public          postgres    false    230            �           0    0     COLUMN "Attendances"."UpdatedAt"    COMMENT     �   COMMENT ON COLUMN public."Attendances"."UpdatedAt" IS 'Data e hora de atualização de qualquer interação relacionada ao atendimento';
          public          postgres    false    230            �           0    0    COLUMN "Attendances"."Disease"    COMMENT     H   COMMENT ON COLUMN public."Attendances"."Disease" IS 'Queixa principal';
          public          postgres    false    230            �           0    0    COLUMN "Attendances"."Started"    COMMENT     ]   COMMENT ON COLUMN public."Attendances"."Started" IS 'Data e hora do início do atendimento';
          public          postgres    false    230            �           0    0    COLUMN "Attendances"."Finished"    COMMENT     d   COMMENT ON COLUMN public."Attendances"."Finished" IS 'Data e hora da finalização do atendimento';
          public          postgres    false    230            �           0    0 0   COLUMN "Attendances"."DefinitionMedicalRecordId"    COMMENT     q   COMMENT ON COLUMN public."Attendances"."DefinitionMedicalRecordId" IS 'ID da última evolução do atendimento';
          public          postgres    false    230            �           0    0    COLUMN "Attendances"."Meeting"    COMMENT     n   COMMENT ON COLUMN public."Attendances"."Meeting" IS 'Informa se o atendimento teve uma teleconsulta ou não';
          public          postgres    false    230            �            1259    17205 	   CareLines    TABLE     �   CREATE TABLE public."CareLines" (
    "Id" smallint NOT NULL,
    "CareLine" character varying(30),
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreateAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public."CareLines";
       public         heap    postgres    false            �           0    0    TABLE "CareLines"    COMMENT     <   COMMENT ON TABLE public."CareLines" IS 'Linhas de cuidado';
          public          postgres    false    231            �           0    0    COLUMN "CareLines"."CareLine"    COMMENT     O   COMMENT ON COLUMN public."CareLines"."CareLine" IS 'Nome da linha de cuidado';
          public          postgres    false    231            �           0    0    COLUMN "CareLines"."IsActive"    COMMENT     _   COMMENT ON COLUMN public."CareLines"."IsActive" IS 'Indica que a linha de cuidado esta ativa';
          public          postgres    false    231            �           0    0    COLUMN "CareLines"."CreateAt"    COMMENT     O   COMMENT ON COLUMN public."CareLines"."CreateAt" IS 'Data e hora de criação';
          public          postgres    false    231            �            1259    17210    CareLine_id_seq    SEQUENCE     �   CREATE SEQUENCE public."CareLine_id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."CareLine_id_seq";
       public          postgres    false    231            �           0    0    CareLine_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public."CareLine_id_seq" OWNED BY public."CareLines"."Id";
          public          postgres    false    232            �            1259    17211    ChatMessages_Id_seq    SEQUENCE     ~   CREATE SEQUENCE public."ChatMessages_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."ChatMessages_Id_seq";
       public          postgres    false            �            1259    17212    ChatMessages    TABLE     �  CREATE TABLE public."ChatMessages" (
    "PatientId" integer,
    "UserId" integer,
    "Message" character varying(500),
    "Visualized" boolean DEFAULT false NOT NULL,
    "CreateAt" timestamp without time zone DEFAULT now(),
    "SourceChanel" smallint,
    "DestinationChanel" smallint,
    "Id" bigint DEFAULT nextval('public."ChatMessages_Id_seq"'::regclass) NOT NULL,
    "Delivered" timestamp without time zone,
    "Read" timestamp without time zone,
    "WhatsAppMsgId" bigint
);
 "   DROP TABLE public."ChatMessages";
       public         heap    postgres    false    233            �           0    0    TABLE "ChatMessages"    COMMENT     8   COMMENT ON TABLE public."ChatMessages" IS 'Mensagens ';
          public          postgres    false    234            �           0    0 !   COLUMN "ChatMessages"."PatientId"    COMMENT     I   COMMENT ON COLUMN public."ChatMessages"."PatientId" IS 'Id do paciente';
          public          postgres    false    234            �           0    0    COLUMN "ChatMessages"."UserId"    COMMENT     e   COMMENT ON COLUMN public."ChatMessages"."UserId" IS 'Id do usuario, caso o UserId seja nulo é BOT';
          public          postgres    false    234            �           0    0    COLUMN "ChatMessages"."Message"    COMMENT     A   COMMENT ON COLUMN public."ChatMessages"."Message" IS 'Mensagem';
          public          postgres    false    234            �           0    0 "   COLUMN "ChatMessages"."Visualized"    COMMENT     i   COMMENT ON COLUMN public."ChatMessages"."Visualized" IS 'Indica que a msg foi visualizada dentro do LC';
          public          postgres    false    234            �           0    0 $   COLUMN "ChatMessages"."SourceChanel"    COMMENT     u   COMMENT ON COLUMN public."ChatMessages"."SourceChanel" IS 'Canal de origem da msg
0 - LC
1 - WhatsApp
2 - Partners';
          public          postgres    false    234            �           0    0 )   COLUMN "ChatMessages"."DestinationChanel"    COMMENT     o   COMMENT ON COLUMN public."ChatMessages"."DestinationChanel" IS 'Canal de destino
0 - LC
1 - WhatsApp
2 - SMS';
          public          postgres    false    234            �           0    0 !   COLUMN "ChatMessages"."Delivered"    COMMENT     S   COMMENT ON COLUMN public."ChatMessages"."Delivered" IS 'Msg entregue ao paciente';
          public          postgres    false    234            �           0    0    COLUMN "ChatMessages"."Read"    COMMENT     L   COMMENT ON COLUMN public."ChatMessages"."Read" IS 'Msg lida pelo paciente';
          public          postgres    false    234            �           0    0 %   COLUMN "ChatMessages"."WhatsAppMsgId"    COMMENT     r   COMMENT ON COLUMN public."ChatMessages"."WhatsAppMsgId" IS 'Id da msg do WhatsApp, vide b4s.message.ChatMessage';
          public          postgres    false    234            �            1259    17220    ChatTemplates    TABLE     p  CREATE TABLE public."ChatTemplates" (
    "Id" smallint NOT NULL,
    "Template" character varying(500),
    "CurrentStatus" smallint,
    "StatusUpdeted" smallint,
    "Title" character varying(50),
    "CurrentStageId" smallint,
    "StageUpdetedId" smallint,
    "SubStageUpdetedId" smallint,
    "Default" boolean DEFAULT false,
    "WhatsAppTemplateId" bigint
);
 #   DROP TABLE public."ChatTemplates";
       public         heap    postgres    false            �           0    0 &   COLUMN "ChatTemplates"."CurrentStatus"    COMMENT     [   COMMENT ON COLUMN public."ChatTemplates"."CurrentStatus" IS 'Status atual do atendimento';
          public          postgres    false    235            �           0    0 &   COLUMN "ChatTemplates"."StatusUpdeted"    COMMENT     Z   COMMENT ON COLUMN public."ChatTemplates"."StatusUpdeted" IS 'Novo status do atendimento';
          public          postgres    false    235            �           0    0     COLUMN "ChatTemplates"."Default"    COMMENT     �   COMMENT ON COLUMN public."ChatTemplates"."Default" IS 'Template default, são utilizados para informar o paciente sobre qualquer movimentação do atendimento dele no sistema';
          public          postgres    false    235            �            1259    17226    ChatTemplates_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."ChatTemplates_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."ChatTemplates_Id_seq";
       public          postgres    false    235            �           0    0    ChatTemplates_Id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."ChatTemplates_Id_seq" OWNED BY public."ChatTemplates"."Id";
          public          postgres    false    236            �            1259    17227    Ciap    TABLE     �   CREATE TABLE public."Ciap" (
    "Id" character varying(5) NOT NULL,
    "Component" smallint,
    "OriginalDescription" character varying(80),
    "LayDescription" character varying(80)
);
    DROP TABLE public."Ciap";
       public         heap    postgres    false            �            1259    17230    Cid10    TABLE     �   CREATE TABLE public."Cid10" (
    "Id" character varying(5) NOT NULL,
    "CodGroup" smallint,
    "ParentCategory" character varying(5),
    "Description" character varying(300)
);
    DROP TABLE public."Cid10";
       public         heap    postgres    false            �            1259    17233 	   Countries    TABLE     f   CREATE TABLE public."Countries" (
    "Id" smallint NOT NULL,
    "Country" character varying(200)
);
    DROP TABLE public."Countries";
       public         heap    postgres    false            �            1259    17236    Country_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Country_id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Country_id_seq";
       public          postgres    false    239            �           0    0    Country_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Country_id_seq" OWNED BY public."Countries"."Id";
          public          postgres    false    240            �            1259    17237    FlowMesageOptions    TABLE       CREATE TABLE public."FlowMesageOptions" (
    "Id" integer NOT NULL,
    "ProtocolMessageId" integer NOT NULL,
    "Order" smallint NOT NULL,
    "Option" character varying(30) NOT NULL,
    "OptionContend" character varying(500) NOT NULL,
    "OptionContendType" smallint NOT NULL
);
 '   DROP TABLE public."FlowMesageOptions";
       public         heap    postgres    false            �           0    0    TABLE "FlowMesageOptions"    COMMENT     X   COMMENT ON TABLE public."FlowMesageOptions" IS 'Opções para a mensagem do protocolo';
          public          postgres    false    241            �           0    0 .   COLUMN "FlowMesageOptions"."ProtocolMessageId"    COMMENT     b   COMMENT ON COLUMN public."FlowMesageOptions"."ProtocolMessageId" IS 'Id da mesagem do protocolo';
          public          postgres    false    241            �           0    0 "   COLUMN "FlowMesageOptions"."Order"    COMMENT     A   COMMENT ON COLUMN public."FlowMesageOptions"."Order" IS 'Ordem';
          public          postgres    false    241            �           0    0 #   COLUMN "FlowMesageOptions"."Option"    COMMENT     P   COMMENT ON COLUMN public."FlowMesageOptions"."Option" IS 'Opção da mensagem';
          public          postgres    false    241            �           0    0 *   COLUMN "FlowMesageOptions"."OptionContend"    COMMENT     �   COMMENT ON COLUMN public."FlowMesageOptions"."OptionContend" IS 'Conteudo da opção, como texto, link ou telefone (O limite de 500 é para links longos, vide link do teams)';
          public          postgres    false    241            �           0    0 .   COLUMN "FlowMesageOptions"."OptionContendType"    COMMENT     �   COMMENT ON COLUMN public."FlowMesageOptions"."OptionContendType" IS '0-Texto, 1-Telefone e 2-Link, 1 e 2 somente serão habilitados caso o tipo da mensagem do protocolo seja chamada para ação (CallToAction).
Permite chamar outra msg apenas no tipo 0';
          public          postgres    false    241            �            1259    17242    FlowMesages    TABLE     �   CREATE TABLE public."FlowMesages" (
    "Id" integer NOT NULL,
    "Node" character varying(50) NOT NULL,
    "Mesage" character varying(120) NOT NULL,
    "Type" smallint NOT NULL
);
 !   DROP TABLE public."FlowMesages";
       public         heap    postgres    false            �           0    0    TABLE "FlowMesages"    COMMENT     B   COMMENT ON TABLE public."FlowMesages" IS 'Mensagem do protocolo';
          public          postgres    false    242            �           0    0    COLUMN "FlowMesages"."Node"    COMMENT     Q   COMMENT ON COLUMN public."FlowMesages"."Node" IS 'Nome do nó do monitoramento';
          public          postgres    false    242            �           0    0    COLUMN "FlowMesages"."Mesage"    COMMENT     K   COMMENT ON COLUMN public."FlowMesages"."Mesage" IS 'Mensagem ao paciente';
          public          postgres    false    242            �           0    0    COLUMN "FlowMesages"."Type"    COMMENT     p   COMMENT ON COLUMN public."FlowMesages"."Type" IS 'Tipo da mensagem, 0-Resposta rapida e 1-Chamada para ação';
          public          postgres    false    242            �            1259    17245    InvalidPatientsImport    TABLE     �  CREATE TABLE public."InvalidPatientsImport" (
    "Id" bigint NOT NULL,
    "Name" character varying(200),
    "MotherName" character varying(200),
    "BiologicalSex" character varying(15),
    "BirthDate" character varying(20),
    "Cpf" character varying(15),
    "CellPhone" character varying(20),
    "Cep" character varying(10),
    "Address" character varying(100),
    "AddressNumber" character varying(5),
    "District" character varying(80),
    "Complement" character varying(100),
    "State" character varying(50),
    "City" character varying(50),
    "Email" character varying(100),
    "UserId" integer,
    "CreateAt" timestamp without time zone,
    "Validation" character varying(150)
);
 +   DROP TABLE public."InvalidPatientsImport";
       public         heap    postgres    false            �            1259    17250    InvalidPatientsImport_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."InvalidPatientsImport_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."InvalidPatientsImport_Id_seq";
       public          postgres    false    243            �           0    0    InvalidPatientsImport_Id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."InvalidPatientsImport_Id_seq" OWNED BY public."InvalidPatientsImport"."Id";
          public          postgres    false    244            �            1259    17251    MedicalSpecialties    TABLE     �   CREATE TABLE public."MedicalSpecialties" (
    "Id" bigint NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Group" character varying(50) NOT NULL,
    "CBO" character varying(15)
);
 (   DROP TABLE public."MedicalSpecialties";
       public         heap    postgres    false            �           0    0    TABLE "MedicalSpecialties"    COMMENT     K   COMMENT ON TABLE public."MedicalSpecialties" IS 'Especialidades médicas';
          public          postgres    false    245            �            1259    17254    MonitoringData    TABLE     �   CREATE TABLE public."MonitoringData" (
    "Id" smallint NOT NULL,
    "Description" character varying(50),
    "Endpoint" character varying(200),
    "Auth" character varying(100)
);
 $   DROP TABLE public."MonitoringData";
       public         heap    postgres    false            �           0    0    COLUMN "MonitoringData"."Id"    COMMENT     I   COMMENT ON COLUMN public."MonitoringData"."Id" IS 'ID do monitoramento';
          public          postgres    false    246            �           0    0 %   COLUMN "MonitoringData"."Description"    COMMENT     h   COMMENT ON COLUMN public."MonitoringData"."Description" IS 'Descrição/Nome do tipo do monitoramento';
          public          postgres    false    246            �           0    0 "   COLUMN "MonitoringData"."Endpoint"    COMMENT     [   COMMENT ON COLUMN public."MonitoringData"."Endpoint" IS 'URL da chamada do monitoramento';
          public          postgres    false    246            �           0    0    COLUMN "MonitoringData"."Auth"    COMMENT     N   COMMENT ON COLUMN public."MonitoringData"."Auth" IS 'Chave de autorização';
          public          postgres    false    246            �            1259    17257    MonitoringData_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."MonitoringData_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."MonitoringData_Id_seq";
       public          postgres    false    246            �           0    0    MonitoringData_Id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."MonitoringData_Id_seq" OWNED BY public."MonitoringData"."Id";
          public          postgres    false    247            �            1259    17258    MonitoringProtocolFlowMesages    TABLE       CREATE TABLE public."MonitoringProtocolFlowMesages" (
    "Id" integer NOT NULL,
    "FlowMessageId" integer NOT NULL,
    "Order" smallint NOT NULL,
    "MonitoringProtocolFlowMesageParentId" integer,
    "MonitoringProtocolFlowMesageOptionParentId" integer
);
 3   DROP TABLE public."MonitoringProtocolFlowMesages";
       public         heap    postgres    false            �           0    0 %   TABLE "MonitoringProtocolFlowMesages"    COMMENT     b   COMMENT ON TABLE public."MonitoringProtocolFlowMesages" IS 'Mensagens do fluxo de monitoramento';
          public          postgres    false    248            �           0    0 6   COLUMN "MonitoringProtocolFlowMesages"."FlowMessageId"    COMMENT     g   COMMENT ON COLUMN public."MonitoringProtocolFlowMesages"."FlowMessageId" IS 'Id da mensagem de fluxo';
          public          postgres    false    248            �           0    0 .   COLUMN "MonitoringProtocolFlowMesages"."Order"    COMMENT     b   COMMENT ON COLUMN public."MonitoringProtocolFlowMesages"."Order" IS 'Ordem da mensagem no fluxo';
          public          postgres    false    248            �            1259    17261 $   MonitoringProtocolFlowMesages_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."MonitoringProtocolFlowMesages_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."MonitoringProtocolFlowMesages_Id_seq";
       public          postgres    false    248            �           0    0 $   MonitoringProtocolFlowMesages_Id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."MonitoringProtocolFlowMesages_Id_seq" OWNED BY public."MonitoringProtocolFlowMesages"."Id";
          public          postgres    false    249            �            1259    17262    MonitoringProtocolNodes_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."MonitoringProtocolNodes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."MonitoringProtocolNodes_Id_seq";
       public          postgres    false    242            �           0    0    MonitoringProtocolNodes_Id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."MonitoringProtocolNodes_Id_seq" OWNED BY public."FlowMesages"."Id";
          public          postgres    false    250            �            1259    17263    MonitoringProtocols    TABLE     �   CREATE TABLE public."MonitoringProtocols" (
    "Id" integer NOT NULL,
    "Protocol" character varying(50),
    "CreateAt" timestamp without time zone DEFAULT now() NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL
);
 )   DROP TABLE public."MonitoringProtocols";
       public         heap    postgres    false            �           0    0    TABLE "MonitoringProtocols"    COMMENT     N   COMMENT ON TABLE public."MonitoringProtocols" IS 'Protocolos de atendimento';
          public          postgres    false    251            �            1259    17268    Patients_Id_seq    SEQUENCE     z   CREATE SEQUENCE public."Patients_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Patients_Id_seq";
       public          postgres    false            �            1259    17269    Patients    TABLE     K  CREATE TABLE public."Patients" (
    "Id" bigint DEFAULT nextval('public."Patients_Id_seq"'::regclass) NOT NULL,
    "Name" character varying(200),
    "MotherName" character varying(200),
    "BiologicalSex" character varying(15),
    "BirthDate" date,
    "Cpf" character varying(11),
    "CellPhone" character varying(15),
    "Cep" character varying(8),
    "Address" character varying(100),
    "AddressNumber" character varying(5),
    "District" character varying(80),
    "Complement" character varying(100),
    "CountryId" character varying(50),
    "State" character varying(50),
    "City" character varying(50),
    "Latitude" character varying(30),
    "Longitude" character varying(30),
    "CreateAt" timestamp without time zone DEFAULT now(),
    "Email" character varying(100),
    "DeletedAt" timestamp without time zone
);
    DROP TABLE public."Patients";
       public         heap    postgres    false    252            �           0    0    TABLE "Patients"    COMMENT     3   COMMENT ON TABLE public."Patients" IS 'Pacientes';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."Name"    COMMENT     7   COMMENT ON COLUMN public."Patients"."Name" IS 'Nome ';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."MotherName"    COMMENT     D   COMMENT ON COLUMN public."Patients"."MotherName" IS 'Nome da mãe';
          public          postgres    false    253            �           0    0 !   COLUMN "Patients"."BiologicalSex"    COMMENT     I   COMMENT ON COLUMN public."Patients"."BiologicalSex" IS 'Sexo biologico';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."BirthDate"    COMMENT     I   COMMENT ON COLUMN public."Patients"."BirthDate" IS 'Data de nascimento';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."Cpf"    COMMENT     4   COMMENT ON COLUMN public."Patients"."Cpf" IS 'CPF';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."CellPhone"    COMMENT     G   COMMENT ON COLUMN public."Patients"."CellPhone" IS 'Telefone celular';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."Cep"    COMMENT     4   COMMENT ON COLUMN public."Patients"."Cep" IS 'CEP';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."Address"    COMMENT     >   COMMENT ON COLUMN public."Patients"."Address" IS 'Endereço';
          public          postgres    false    253            �           0    0 !   COLUMN "Patients"."AddressNumber"    COMMENT     N   COMMENT ON COLUMN public."Patients"."AddressNumber" IS 'Numero do endereço';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."District"    COMMENT     <   COMMENT ON COLUMN public."Patients"."District" IS 'Bairro';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."Complement"    COMMENT     P   COMMENT ON COLUMN public."Patients"."Complement" IS 'Complemento do endereço';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."CountryId"    COMMENT     A   COMMENT ON COLUMN public."Patients"."CountryId" IS 'Id do pais';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."State"    COMMENT     >   COMMENT ON COLUMN public."Patients"."State" IS 'Estado (UF)';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."City"    COMMENT     8   COMMENT ON COLUMN public."Patients"."City" IS 'Cidade';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."Latitude"    COMMENT     I   COMMENT ON COLUMN public."Patients"."Latitude" IS 'Latitude geografica';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."Longitude"    COMMENT     K   COMMENT ON COLUMN public."Patients"."Longitude" IS 'Longitude geografica';
          public          postgres    false    253            �           0    0    COLUMN "Patients"."CreateAt"    COMMENT     G   COMMENT ON COLUMN public."Patients"."CreateAt" IS 'Data da criação';
          public          postgres    false    253            �            1259    17276    Prescriptions    TABLE     �   CREATE TABLE public."Prescriptions" (
    id integer NOT NULL,
    "PatientId" integer,
    "Prescription" json NOT NULL,
    "PrescriptionIdMevo" character varying(12),
    "InsertAt" timestamp without time zone DEFAULT now()
);
 #   DROP TABLE public."Prescriptions";
       public         heap    postgres    false            �            1259    17282    PrescriptionsDocs    TABLE       CREATE TABLE public."PrescriptionsDocs" (
    id bigint NOT NULL,
    "PrescriptionId" integer NOT NULL,
    "URL" character varying(200) NOT NULL,
    "ContentType" character varying(50) NOT NULL,
    "Signed" boolean NOT NULL,
    "Category" character varying(30) NOT NULL
);
 '   DROP TABLE public."PrescriptionsDocs";
       public         heap    postgres    false                        1259    17285    PrescriptionsDocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."PrescriptionsDocs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."PrescriptionsDocs_id_seq";
       public          postgres    false    255                        0    0    PrescriptionsDocs_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."PrescriptionsDocs_id_seq" OWNED BY public."PrescriptionsDocs".id;
          public          postgres    false    256                       1259    17286    Prescriptions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Prescriptions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Prescriptions_id_seq";
       public          postgres    false    254                       0    0    Prescriptions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Prescriptions_id_seq" OWNED BY public."Prescriptions".id;
          public          postgres    false    257                       1259    17287 
   Priorities    TABLE     �   CREATE TABLE public."Priorities" (
    "Id" smallint NOT NULL,
    "Priority" character varying(30) NOT NULL,
    "Order" smallint,
    "Color" character varying(30)
);
     DROP TABLE public."Priorities";
       public         heap    postgres    false                       0    0    TABLE "Priorities"    COMMENT     A   COMMENT ON TABLE public."Priorities" IS 'Tabela de prioridades';
          public          postgres    false    258                       1259    17290    Priorities_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Priorities_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Priorities_Id_seq";
       public          postgres    false    258                       0    0    Priorities_Id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Priorities_Id_seq" OWNED BY public."Priorities"."Id";
          public          postgres    false    259                       1259    17291    ProtocolFlows_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."ProtocolFlows_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."ProtocolFlows_Id_seq";
       public          postgres    false    217                       0    0    ProtocolFlows_Id_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public."ProtocolFlows_Id_seq" OWNED BY public." MonitoringProtocolFlows"."Id";
          public          postgres    false    260                       1259    17292     ProtocolQuestionResponses_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."ProtocolQuestionResponses_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."ProtocolQuestionResponses_Id_seq";
       public          postgres    false    241                       0    0     ProtocolQuestionResponses_Id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."ProtocolQuestionResponses_Id_seq" OWNED BY public."FlowMesageOptions"."Id";
          public          postgres    false    261                       1259    17293    Protocols_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Protocols_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Protocols_Id_seq";
       public          postgres    false    251                       0    0    Protocols_Id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Protocols_Id_seq" OWNED BY public."MonitoringProtocols"."Id";
          public          postgres    false    262                       1259    17294    ScreeningAnswers    TABLE     �   CREATE TABLE public."ScreeningAnswers" (
    "Id" integer NOT NULL,
    "ScreeningId" bigint NOT NULL,
    "ScreeningProtocolId" bigint NOT NULL,
    "ScreeningQuestionId" bigint NOT NULL,
    "ScreeningAnswerId" bigint NOT NULL
);
 &   DROP TABLE public."ScreeningAnswers";
       public         heap    postgres    false                       0    0    TABLE "ScreeningAnswers"    COMMENT     E   COMMENT ON TABLE public."ScreeningAnswers" IS 'Respostas a triagem';
          public          postgres    false    263                       1259    17297    ScreeningProtocolAnswers    TABLE     �   CREATE TABLE public."ScreeningProtocolAnswers" (
    "Id" integer NOT NULL,
    "ScreeningProtocolQuestionId" bigint NOT NULL,
    "Answer" character varying(200) NOT NULL,
    "Color" character varying(30) NOT NULL
);
 .   DROP TABLE public."ScreeningProtocolAnswers";
       public         heap    postgres    false                       0    0     TABLE "ScreeningProtocolAnswers"    COMMENT     N   COMMENT ON TABLE public."ScreeningProtocolAnswers" IS 'Respostas da triagem';
          public          postgres    false    264            	           1259    17300    ScreeningAnswers_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."ScreeningAnswers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."ScreeningAnswers_Id_seq";
       public          postgres    false    264            	           0    0    ScreeningAnswers_Id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."ScreeningAnswers_Id_seq" OWNED BY public."ScreeningProtocolAnswers"."Id";
          public          postgres    false    265            
           1259    17301    ScreeningAnswers_Id_seq1    SEQUENCE     �   CREATE SEQUENCE public."ScreeningAnswers_Id_seq1"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ScreeningAnswers_Id_seq1";
       public          postgres    false    263            
           0    0    ScreeningAnswers_Id_seq1    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public."ScreeningAnswers_Id_seq1" OWNED BY public."ScreeningAnswers"."Id";
          public          postgres    false    266                       1259    17302    ScreeningProtocolQuestions    TABLE     �   CREATE TABLE public."ScreeningProtocolQuestions" (
    "Id" integer NOT NULL,
    "ScreeningProtocolId" bigint NOT NULL,
    "Key" character varying(30) NOT NULL,
    "Group" character varying(200) NOT NULL,
    "Question" character varying(200)
);
 0   DROP TABLE public."ScreeningProtocolQuestions";
       public         heap    postgres    false                       0    0 "   TABLE "ScreeningProtocolQuestions"    COMMENT     [   COMMENT ON TABLE public."ScreeningProtocolQuestions" IS 'Grupos e questões do protocolo';
          public          postgres    false    267                       1259    17305    ScreeningProtocolGroups_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."ScreeningProtocolGroups_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."ScreeningProtocolGroups_Id_seq";
       public          postgres    false    267                       0    0    ScreeningProtocolGroups_Id_seq    SEQUENCE OWNED BY     j   ALTER SEQUENCE public."ScreeningProtocolGroups_Id_seq" OWNED BY public."ScreeningProtocolQuestions"."Id";
          public          postgres    false    268                       1259    17306    ScreeningProtocols    TABLE     �   CREATE TABLE public."ScreeningProtocols" (
    "Id" integer NOT NULL,
    "ScreeningProtocol" character varying(100) NOT NULL
);
 (   DROP TABLE public."ScreeningProtocols";
       public         heap    postgres    false                       0    0    TABLE "ScreeningProtocols"    COMMENT     Q   COMMENT ON TABLE public."ScreeningProtocols" IS 'Tabela de protocolos triagens';
          public          postgres    false    269                       1259    17309 
   Screenings    TABLE     �   CREATE TABLE public."Screenings" (
    "Id" integer NOT NULL,
    "CreateAt" timestamp without time zone DEFAULT now() NOT NULL,
    "PatientId" bigint NOT NULL,
    "Color" character varying(30) NOT NULL
);
     DROP TABLE public."Screenings";
       public         heap    postgres    false                       0    0    TABLE "Screenings"    COMMENT     4   COMMENT ON TABLE public."Screenings" IS 'Triagens';
          public          postgres    false    270                       1259    17313    Screenings_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Screenings_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Screenings_Id_seq";
       public          postgres    false    269                       0    0    Screenings_Id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Screenings_Id_seq" OWNED BY public."ScreeningProtocols"."Id";
          public          postgres    false    271                       1259    17314    Screenings_Id_seq1    SEQUENCE     �   CREATE SEQUENCE public."Screenings_Id_seq1"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Screenings_Id_seq1";
       public          postgres    false    270                       0    0    Screenings_Id_seq1    SEQUENCE OWNED BY     N   ALTER SEQUENCE public."Screenings_Id_seq1" OWNED BY public."Screenings"."Id";
          public          postgres    false    272                       1259    17315    Stages    TABLE     `   CREATE TABLE public."Stages" (
    "Id" smallint NOT NULL,
    "Stage" character varying(30)
);
    DROP TABLE public."Stages";
       public         heap    postgres    false                       0    0    TABLE "Stages"    COMMENT     ?   COMMENT ON TABLE public."Stages" IS 'Estagios do atendimento';
          public          postgres    false    273                       0    0    COLUMN "Stages"."Stage"    COMMENT     G   COMMENT ON COLUMN public."Stages"."Stage" IS 'Estagio do atendimento';
          public          postgres    false    273                       1259    17318    Stage_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Stage_id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Stage_id_seq";
       public          postgres    false    273                       0    0    Stage_id_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE public."Stage_id_seq" OWNED BY public."Stages"."Id";
          public          postgres    false    274                       1259    17319    State    TABLE     Y   CREATE TABLE public."State" (
    id integer NOT NULL,
    state character varying(2)
);
    DROP TABLE public."State";
       public         heap    postgres    false                       1259    17322    Statuses    TABLE     l   CREATE TABLE public."Statuses" (
    "Id" smallint NOT NULL,
    "Status" character varying(30) NOT NULL
);
    DROP TABLE public."Statuses";
       public         heap    postgres    false                       0    0    TABLE "Statuses"    COMMENT     A   COMMENT ON TABLE public."Statuses" IS 'Status dos atendimentos';
          public          postgres    false    276                       1259    17325    Statuses_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Statuses_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Statuses_Id_seq";
       public          postgres    false    276                       0    0    Statuses_Id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Statuses_Id_seq" OWNED BY public."Statuses"."Id";
          public          postgres    false    277                       1259    17326 	   SubStages    TABLE     �   CREATE TABLE public."SubStages" (
    "Id" smallint NOT NULL,
    "StageId" smallint NOT NULL,
    "SubStage" character varying(30) NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL
);
    DROP TABLE public."SubStages";
       public         heap    postgres    false                       0    0    TABLE "SubStages"    COMMENT     F   COMMENT ON TABLE public."SubStages" IS 'Sub estagios de atendimento';
          public          postgres    false    278                       1259    17330    SubStages_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."SubStages_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."SubStages_Id_seq";
       public          postgres    false    278                       0    0    SubStages_Id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."SubStages_Id_seq" OWNED BY public."SubStages"."Id";
          public          postgres    false    279                       1259    17331    Tags    TABLE     �   CREATE TABLE public."Tags" (
    "Id" smallint NOT NULL,
    "Tag" character varying(50),
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreateAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public."Tags";
       public         heap    postgres    false                       0    0    TABLE "Tags"    COMMENT     9   COMMENT ON TABLE public."Tags" IS 'Tags do atendimento';
          public          postgres    false    280                       0    0    COLUMN "Tags"."Tag"    COMMENT     0   COMMENT ON COLUMN public."Tags"."Tag" IS 'Tag';
          public          postgres    false    280                       0    0    COLUMN "Tags"."IsActive"    COMMENT     ;   COMMENT ON COLUMN public."Tags"."IsActive" IS 'Tag ativa';
          public          postgres    false    280                       0    0    COLUMN "Tags"."CreateAt"    COMMENT     J   COMMENT ON COLUMN public."Tags"."CreateAt" IS 'Data e hora da criação';
          public          postgres    false    280                       1259    17336    Tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Tags_id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Tags_id_seq";
       public          postgres    false    280                       0    0    Tags_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Tags_id_seq" OWNED BY public."Tags"."Id";
          public          postgres    false    281                       1259    17337    TimeLineEvent    TABLE     y   CREATE TABLE public."TimeLineEvent" (
    "Id" smallint NOT NULL,
    "TimeLineEvent" character varying(100) NOT NULL
);
 #   DROP TABLE public."TimeLineEvent";
       public         heap    postgres    false                       1259    17340    TimeLineEvent_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."TimeLineEvent_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."TimeLineEvent_Id_seq";
       public          postgres    false    282                       0    0    TimeLineEvent_Id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."TimeLineEvent_Id_seq" OWNED BY public."TimeLineEvent"."Id";
          public          postgres    false    283                       1259    17341    TimeLinePatients_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."TimeLinePatients_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."TimeLinePatients_Id_seq";
       public          postgres    false                       1259    17342    TimeLinePatients    TABLE     =  CREATE TABLE public."TimeLinePatients" (
    "Id" bigint DEFAULT nextval('public."TimeLinePatients_Id_seq"'::regclass) NOT NULL,
    "PatientId" integer NOT NULL,
    "UserId" integer,
    "TimeLineEventId" integer NOT NULL,
    "Description" text NOT NULL,
    "CreatAt" timestamp without time zone DEFAULT now()
);
 &   DROP TABLE public."TimeLinePatients";
       public         heap    postgres    false    284                       1259    17349    UserAttendanceRecords    TABLE     �   CREATE TABLE public."UserAttendanceRecords" (
    "Id" bigint NOT NULL,
    "AttendanceId" integer,
    "UserId" integer,
    "Type" character varying(50),
    "CreateAt" timestamp without time zone DEFAULT now()
);
 +   DROP TABLE public."UserAttendanceRecords";
       public         heap    postgres    false                       0    0 -   COLUMN "UserAttendanceRecords"."AttendanceId"    COMMENT     X   COMMENT ON COLUMN public."UserAttendanceRecords"."AttendanceId" IS 'ID do atendimento';
          public          postgres    false    286                       0    0 '   COLUMN "UserAttendanceRecords"."UserId"    COMMENT     O   COMMENT ON COLUMN public."UserAttendanceRecords"."UserId" IS 'ID do usuário';
          public          postgres    false    286                        0    0 %   COLUMN "UserAttendanceRecords"."Type"    COMMENT     �   COMMENT ON COLUMN public."UserAttendanceRecords"."Type" IS 'Tipo do registro
- Teleconsulta
Obs: inicialmente será utilizado para registrar os profissionais que realizaram uma teleconsulta com o paciente';
          public          postgres    false    286                       1259    17353    UserAttendanceRecords_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserAttendanceRecords_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."UserAttendanceRecords_Id_seq";
       public          postgres    false    286            !           0    0    UserAttendanceRecords_Id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."UserAttendanceRecords_Id_seq" OWNED BY public."UserAttendanceRecords"."Id";
          public          postgres    false    287                        1259    17354    UserMedicalSpecialties    TABLE     �   CREATE TABLE public."UserMedicalSpecialties" (
    "Id" smallint NOT NULL,
    "UserId" smallint NOT NULL,
    "MedicalSpecialtiesId" smallint NOT NULL
);
 ,   DROP TABLE public."UserMedicalSpecialties";
       public         heap    postgres    false            !           1259    17357    UserMedicalSpecialties_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserMedicalSpecialties_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."UserMedicalSpecialties_Id_seq";
       public          postgres    false    288            "           0    0    UserMedicalSpecialties_Id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."UserMedicalSpecialties_Id_seq" OWNED BY public."UserMedicalSpecialties"."Id";
          public          postgres    false    289            "           1259    17358 	   UserTypes    TABLE     b   CREATE TABLE public."UserTypes" (
    "Id" smallint NOT NULL,
    "Type" character varying(30)
);
    DROP TABLE public."UserTypes";
       public         heap    postgres    false            #           0    0    TABLE "UserTypes"    COMMENT     ;   COMMENT ON TABLE public."UserTypes" IS 'Tipos de usuario';
          public          postgres    false    290            $           0    0    COLUMN "UserTypes"."Type"    COMMENT     B   COMMENT ON COLUMN public."UserTypes"."Type" IS 'Tipo do usuario';
          public          postgres    false    290            #           1259    17361    UserTypes_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserTypes_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."UserTypes_Id_seq";
       public          postgres    false    290            %           0    0    UserTypes_Id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."UserTypes_Id_seq" OWNED BY public."UserTypes"."Id";
          public          postgres    false    291            ,           1259    17392    users_Id_seq    SEQUENCE     w   CREATE SEQUENCE public."users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."users_Id_seq";
       public          postgres    false            -           1259    17393    users    TABLE     �  CREATE TABLE public.users (
    login character varying(255) NOT NULL,
    pswd character varying(255) NOT NULL,
    name character varying(64),
    email character varying(64),
    active character varying(1),
    activation_code character varying(32),
    priv_admin character varying(1),
    mfa character varying(255),
    "Id" bigint DEFAULT nextval('public."users_Id_seq"'::regclass) NOT NULL,
    "UserTypeId" smallint,
    "ProfessionalRecord" character varying(30),
    "ProfessionalRecordState" character varying(2),
    "Cpf" character varying(11),
    "CellPhone" character varying(15),
    "VideoCall" boolean DEFAULT false,
    "BiologicalSex" character varying(1),
    "BirthDate" date,
    "ClientId" smallint
);
    DROP TABLE public.users;
       public         heap    postgres    false    300            &           0    0    COLUMN users."UserTypeId"    COMMENT     H   COMMENT ON COLUMN public.users."UserTypeId" IS 'Id do tipo de usuario';
          public          postgres    false    301            '           0    0 !   COLUMN users."ProfessionalRecord"    COMMENT     n   COMMENT ON COLUMN public.users."ProfessionalRecord" IS 'Numero de identificação do documento profissional';
          public          postgres    false    301            (           0    0 &   COLUMN users."ProfessionalRecordState"    COMMENT     d   COMMENT ON COLUMN public.users."ProfessionalRecordState" IS 'Estado (UF) de registro profissional';
          public          postgres    false    301            )           0    0    COLUMN users."Cpf"    COMMENT     :   COMMENT ON COLUMN public.users."Cpf" IS 'CPF do usuario';
          public          postgres    false    301            .           1259    18952    VWFastMedic    VIEW     �  CREATE VIEW public."VWFastMedic" AS
 SELECT ah."Id",
    'CRM'::text AS "sgOrgaoProfissional",
    '0301010250'::text AS "procedimentoBPA",
    'D'::text AS "tipoCidAtendimento",
    u."ProfessionalRecord" AS "numConsRegistroProfissional",
    u."ProfessionalRecordState" AS "ufConsProfissional",
    u.name AS "nomeProfissionalSolicitante",
    u."Cpf" AS "numeroCPFProfissional",
    concat(to_char(ah."Started", 'YYYY-MM-DD'::text), 'T', to_char(ah."Started", 'HH24:MI:SS'::text), 'Z') AS datconsulta,
    ms."CBO" AS "numCboProfissional",
    person."Name" AS "nomeUsuario",
    person."Cpf" AS "numeroCPF",
    replace((amr."CIDId")::text, '.'::text, ''::text) AS "cidAtendimento",
    ah."Meeting",
    ah."SentToFastMedic",
    amr."Subjective" AS "MotivoAtendimento"
   FROM (((((public."AttendanceHistories" ah
     JOIN public.users u ON ((ah."UserId" = u."Id")))
     JOIN public."UserMedicalSpecialties" ums ON ((ah."UserId" = ums."UserId")))
     JOIN public."MedicalSpecialties" ms ON ((ums."MedicalSpecialtiesId" = ms."Id")))
     JOIN public."Patients" person ON ((person."Id" = ah."PatientId")))
     JOIN public."AttendanceMedicalRecords" amr ON ((amr."Id" = ah."DefinitionMedicalRecordId")))
  WHERE ((ah."SentToFastMedic" IS NULL) AND (ah."Meeting" = true))
  GROUP BY ah."Id", u."ProfessionalRecord", u."ProfessionalRecordState", u.name, u."Cpf", ah."Started", ms."CBO", person."Name", person."Cpf", amr."CIDId", ah."Meeting", ah."SentToFastMedic", amr."Subjective";
     DROP VIEW public."VWFastMedic";
       public          postgres    false    301    218    221    221    221    245    245    253    253    253    288    288    301    301    301    301    218    218    218    218    218    218            $           1259    17362    WhatsAppTemplateLogs    TABLE       CREATE TABLE public."WhatsAppTemplateLogs" (
    "Id" bigint NOT NULL,
    "WhatsAppTemplateId" bigint NOT NULL,
    "DateTime" timestamp without time zone DEFAULT now() NOT NULL,
    "ResponseStatus" character varying(20) NOT NULL,
    "Log" text NOT NULL
);
 *   DROP TABLE public."WhatsAppTemplateLogs";
       public         heap    postgres    false            %           1259    17368    WhatsAppTemplateLogs_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."WhatsAppTemplateLogs_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."WhatsAppTemplateLogs_Id_seq";
       public          postgres    false    292            *           0    0    WhatsAppTemplateLogs_Id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."WhatsAppTemplateLogs_Id_seq" OWNED BY public."WhatsAppTemplateLogs"."Id";
          public          postgres    false    293            &           1259    17369    WhatsAppTemplates    TABLE     �  CREATE TABLE public."WhatsAppTemplates" (
    "Id" bigint NOT NULL,
    "Template" character varying(1024) NOT NULL,
    "Samples" character varying(1024),
    "Name" character varying(512),
    "IsActive" boolean DEFAULT false,
    "TemplateId" character varying(20),
    "TemplateStatus" character varying(20),
    "Type" smallint DEFAULT 0,
    "Button1" character varying(25),
    "Button2" character varying(25),
    "Button3" character varying(25),
    "CallToAction" character varying(2000)
);
 '   DROP TABLE public."WhatsAppTemplates";
       public         heap    postgres    false            +           0    0 $   COLUMN "WhatsAppTemplates"."Samples"    COMMENT     �   COMMENT ON COLUMN public."WhatsAppTemplates"."Samples" IS 'Informar os exemples de campos do template separados por virgula: {{1}} e {{2}} => "Maria","Jose" ';
          public          postgres    false    294            ,           0    0 !   COLUMN "WhatsAppTemplates"."Type"    COMMENT     �   COMMENT ON COLUMN public."WhatsAppTemplates"."Type" IS '0-Text, 1-Quick Reply Button (Button1 a Button3) , 2-Call to action (Link, apenas Button1)
Preencher o valor para Buttons quando tipo 1 ou 2';
          public          postgres    false    294            -           0    0 )   COLUMN "WhatsAppTemplates"."CallToAction"    COMMENT     g   COMMENT ON COLUMN public."WhatsAppTemplates"."CallToAction" IS 'Link ou telefone para call to action';
          public          postgres    false    294            '           1259    17376    WhatsAppTemplates_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."WhatsAppTemplates_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."WhatsAppTemplates_Id_seq";
       public          postgres    false    294            .           0    0    WhatsAppTemplates_Id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."WhatsAppTemplates_Id_seq" OWNED BY public."WhatsAppTemplates"."Id";
          public          postgres    false    295            (           1259    17377    logged    TABLE     �   CREATE TABLE public.logged (
    login character varying(255) NOT NULL,
    date_login character varying(128),
    sc_session character varying(32),
    ip character varying(32)
);
    DROP TABLE public.logged;
       public         heap    postgres    false            )           1259    17380    sc_log    TABLE     y  CREATE TABLE public.sc_log (
    id integer NOT NULL,
    inserted_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    username character varying(90) NOT NULL,
    application character varying(255) NOT NULL,
    creator character varying(30) NOT NULL,
    ip_user character varying(255) NOT NULL,
    action character varying(30) NOT NULL,
    description text
);
    DROP TABLE public.sc_log;
       public         heap    postgres    false            *           1259    17386    sc_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sc_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.sc_log_id_seq;
       public          postgres    false    297            /           0    0    sc_log_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.sc_log_id_seq OWNED BY public.sc_log.id;
          public          postgres    false    298            +           1259    17387    settings    TABLE     u   CREATE TABLE public.settings (
    set_name character varying(255) NOT NULL,
    set_value character varying(255)
);
    DROP TABLE public.settings;
       public         heap    postgres    false            ;           1259    19151    Cities    TABLE     �   CREATE TABLE regulation."Cities" (
    "Id" smallint NOT NULL,
    "UfCode" character varying(2),
    "IbgeCode" integer,
    "City" character varying(100)
);
     DROP TABLE regulation."Cities";
    
   regulation         heap    postgres    false    7            8           1259    19133    Entitys    TABLE     �  CREATE TABLE regulation."Entitys" (
    "Id" integer NOT NULL,
    "CompanyName" character varying(150),
    "Name" character varying(150),
    "CNES" character varying(7),
    "CorporateType" character varying(30),
    "CpfCnpj" character varying(14),
    "Phone" character varying(15),
    "ContactName" character varying(100),
    "UfCode" character varying(2),
    "IbgeCode" character varying(50),
    "CEP" character varying(8),
    "Address" character varying(100),
    "AddresNumber" character varying(5),
    "District" character varying(50),
    "Complement" character varying(50),
    "Email" character varying(100),
    "Latitude" character varying(30),
    "Longitude" character varying(30),
    "EntityId" integer
);
 !   DROP TABLE regulation."Entitys";
    
   regulation         heap    postgres    false    7            0           0    0    COLUMN "Entitys"."CompanyName"    COMMENT     I   COMMENT ON COLUMN regulation."Entitys"."CompanyName" IS 'Razão social';
       
   regulation          postgres    false    312            1           0    0    COLUMN "Entitys"."Name"    COMMENT     B   COMMENT ON COLUMN regulation."Entitys"."Name" IS 'Nome fantasia';
       
   regulation          postgres    false    312            2           0    0    COLUMN "Entitys"."CNES"    COMMENT     m   COMMENT ON COLUMN regulation."Entitys"."CNES" IS 'Codigo do cadastro nacional de estabelecimento de saúde';
       
   regulation          postgres    false    312            3           0    0     COLUMN "Entitys"."CorporateType"    COMMENT     f   COMMENT ON COLUMN regulation."Entitys"."CorporateType" IS 'Tipo de pessoa jurídica, pessoa física';
       
   regulation          postgres    false    312            4           0    0    COLUMN "Entitys"."CpfCnpj"    COMMENT     C   COMMENT ON COLUMN regulation."Entitys"."CpfCnpj" IS 'CPF ou CNPJ';
       
   regulation          postgres    false    312            5           0    0    COLUMN "Entitys"."Phone"    COMMENT     I   COMMENT ON COLUMN regulation."Entitys"."Phone" IS 'Telefone de contato';
       
   regulation          postgres    false    312            6           0    0    COLUMN "Entitys"."ContactName"    COMMENT     K   COMMENT ON COLUMN regulation."Entitys"."ContactName" IS 'Nome do contato';
       
   regulation          postgres    false    312            7           0    0    COLUMN "Entitys"."UfCode"    COMMENT     A   COMMENT ON COLUMN regulation."Entitys"."UfCode" IS 'Código UF';
       
   regulation          postgres    false    312            8           0    0    COLUMN "Entitys"."IbgeCode"    COMMENT     O   COMMENT ON COLUMN regulation."Entitys"."IbgeCode" IS 'Código IBGE da cidade';
       
   regulation          postgres    false    312            9           0    0    COLUMN "Entitys"."Address"    COMMENT     ;   COMMENT ON COLUMN regulation."Entitys"."Address" IS 'Rua';
       
   regulation          postgres    false    312            :           0    0    COLUMN "Entitys"."AddresNumber"    COMMENT     Q   COMMENT ON COLUMN regulation."Entitys"."AddresNumber" IS 'Número do endereço';
       
   regulation          postgres    false    312            ;           0    0    COLUMN "Entitys"."District"    COMMENT     ?   COMMENT ON COLUMN regulation."Entitys"."District" IS 'Bairro';
       
   regulation          postgres    false    312            <           0    0    COLUMN "Entitys"."Complement"    COMMENT     F   COMMENT ON COLUMN regulation."Entitys"."Complement" IS 'Complemento';
       
   regulation          postgres    false    312            =           0    0    COLUMN "Entitys"."Email"    COMMENT     F   COMMENT ON COLUMN regulation."Entitys"."Email" IS 'Email de contato';
       
   regulation          postgres    false    312            >           0    0    COLUMN "Entitys"."EntityId"    COMMENT     r   COMMENT ON COLUMN regulation."Entitys"."EntityId" IS 'Relação hierárquica, a qual unidade (pai) ela pertence';
       
   regulation          postgres    false    312            7           1259    19132    Entitys_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."Entitys_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE regulation."Entitys_Id_seq";
    
   regulation          postgres    false    312    7            ?           0    0    Entitys_Id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE regulation."Entitys_Id_seq" OWNED BY regulation."Entitys"."Id";
       
   regulation          postgres    false    311            0           1259    19101    PatientQueues    TABLE     5  CREATE TABLE regulation."PatientQueues" (
    "Id" bigint NOT NULL,
    "PatientId" integer,
    "CategoryId" integer,
    "EntityId" integer,
    "UserId" integer,
    "Status" smallint DEFAULT 0,
    "Description" text,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "VideoLink" character varying(100),
    "UserIdApproved" integer,
    "UserIdScheduled" integer,
    "VideoLinkPatient" character varying(100),
    "DocumentTCLE" bytea,
    "DocumentRequest" bytea,
    "TCLEName" character varying(50),
    "RequestName" character varying(50)
);
 '   DROP TABLE regulation."PatientQueues";
    
   regulation         heap    postgres    false    7            @           0    0 #   COLUMN "PatientQueues"."CategoryId"    COMMENT     Z   COMMENT ON COLUMN regulation."PatientQueues"."CategoryId" IS 'Categoria consulta, exame';
       
   regulation          postgres    false    304            A           0    0 !   COLUMN "PatientQueues"."EntityId"    COMMENT     [   COMMENT ON COLUMN regulation."PatientQueues"."EntityId" IS 'Entidade / Unidade de saúde';
       
   regulation          postgres    false    304            B           0    0    COLUMN "PatientQueues"."UserId"    COMMENT     e   COMMENT ON COLUMN regulation."PatientQueues"."UserId" IS 'Usuário responsável pela solicitação';
       
   regulation          postgres    false    304            C           0    0    COLUMN "PatientQueues"."Status"    COMMENT        COMMENT ON COLUMN regulation."PatientQueues"."Status" IS '0 - aguardando aprovação
1 - aguardando agendamento
2 - agendado';
       
   regulation          postgres    false    304            D           0    0 $   COLUMN "PatientQueues"."Description"    COMMENT     N   COMMENT ON COLUMN regulation."PatientQueues"."Description" IS 'Observação';
       
   regulation          postgres    false    304            E           0    0 "   COLUMN "PatientQueues"."VideoLink"    COMMENT     j   COMMENT ON COLUMN regulation."PatientQueues"."VideoLink" IS 'Coluna provisória, mudar para schedulings';
       
   regulation          postgres    false    304            F           0    0 '   COLUMN "PatientQueues"."UserIdApproved"    COMMENT     o   COMMENT ON COLUMN regulation."PatientQueues"."UserIdApproved" IS 'ID do usuário que aprovou a solicitação';
       
   regulation          postgres    false    304            G           0    0 (   COLUMN "PatientQueues"."UserIdScheduled"    COMMENT     k   COMMENT ON COLUMN regulation."PatientQueues"."UserIdScheduled" IS 'ID do usuário que agendou o paciente';
       
   regulation          postgres    false    304            /           1259    19100    PatientQueues_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."PatientQueues_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE regulation."PatientQueues_Id_seq";
    
   regulation          postgres    false    304    7            H           0    0    PatientQueues_Id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE regulation."PatientQueues_Id_seq" OWNED BY regulation."PatientQueues"."Id";
       
   regulation          postgres    false    303            2           1259    19108    ScheduleAvailabilitys    TABLE     �  CREATE TABLE regulation."ScheduleAvailabilitys" (
    "Id" bigint NOT NULL,
    "CategoryId" integer,
    "Monday" boolean,
    "Tuesday" boolean,
    "Wednesday" boolean,
    "Thursday" boolean,
    "Friday" boolean,
    "Saturday" boolean,
    "Sunday" boolean,
    "StartDate" date,
    "EndDate" date,
    "StartHour" time without time zone,
    "EndHour" time without time zone,
    "UserId" integer,
    "Interval" smallint,
    "Scheduled" boolean DEFAULT false,
    "EntitieId" integer
);
 /   DROP TABLE regulation."ScheduleAvailabilitys";
    
   regulation         heap    postgres    false    7            I           0    0 +   COLUMN "ScheduleAvailabilitys"."CategoryId"    COMMENT     W   COMMENT ON COLUMN regulation."ScheduleAvailabilitys"."CategoryId" IS 'Consulta/exame';
       
   regulation          postgres    false    306            J           0    0 )   COLUMN "ScheduleAvailabilitys"."Interval"    COMMENT     W   COMMENT ON COLUMN regulation."ScheduleAvailabilitys"."Interval" IS 'Tempo em minutos';
       
   regulation          postgres    false    306            1           1259    19107    ScheduleAvailabilitys_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."ScheduleAvailabilitys_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE regulation."ScheduleAvailabilitys_Id_seq";
    
   regulation          postgres    false    7    306            K           0    0    ScheduleAvailabilitys_Id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE regulation."ScheduleAvailabilitys_Id_seq" OWNED BY regulation."ScheduleAvailabilitys"."Id";
       
   regulation          postgres    false    305            6           1259    19124    ScheduleCategories    TABLE     �   CREATE TABLE regulation."ScheduleCategories" (
    "Id" bigint NOT NULL,
    "Category" character varying(60),
    "Type" smallint
);
 ,   DROP TABLE regulation."ScheduleCategories";
    
   regulation         heap    postgres    false    7            L           0    0 "   COLUMN "ScheduleCategories"."Type"    COMMENT     _   COMMENT ON COLUMN regulation."ScheduleCategories"."Type" IS '1 - Presencial
2 - Teleconsulta';
       
   regulation          postgres    false    310            5           1259    19123    ScheduleCategories_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."ScheduleCategories_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE regulation."ScheduleCategories_Id_seq";
    
   regulation          postgres    false    310    7            M           0    0    ScheduleCategories_Id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE regulation."ScheduleCategories_Id_seq" OWNED BY regulation."ScheduleCategories"."Id";
       
   regulation          postgres    false    309            =           1259    19166    ScheduleCategoryEtitys    TABLE     �   CREATE TABLE regulation."ScheduleCategoryEtitys" (
    id integer NOT NULL,
    "ScheduleCategoryId" integer,
    "EntityId" integer
);
 0   DROP TABLE regulation."ScheduleCategoryEtitys";
    
   regulation         heap    postgres    false    7            <           1259    19165    ScheduleCategoryEtitys_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."ScheduleCategoryEtitys_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE regulation."ScheduleCategoryEtitys_Id_seq";
    
   regulation          postgres    false    7    317            N           0    0    ScheduleCategoryEtitys_Id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE regulation."ScheduleCategoryEtitys_Id_seq" OWNED BY regulation."ScheduleCategoryEtitys".id;
       
   regulation          postgres    false    316            :           1259    19145    Ufs    TABLE     �   CREATE TABLE regulation."Ufs" (
    "Id" smallint NOT NULL,
    "CodUf" integer,
    "Uf" character varying(2),
    "State" character varying(50)
);
    DROP TABLE regulation."Ufs";
    
   regulation         heap    postgres    false    7            9           1259    19144 	   Uf_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."Uf_Id_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE regulation."Uf_Id_seq";
    
   regulation          postgres    false    314    7            O           0    0 	   Uf_Id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE regulation."Uf_Id_seq" OWNED BY regulation."Ufs"."Id";
       
   regulation          postgres    false    313            A           1259    19183    WaitingConfirmation    TABLE     �   CREATE TABLE regulation."WaitingConfirmation" (
    "Id" integer NOT NULL,
    "ScheduleId" integer,
    "PatientId" integer,
    "DateTime" timestamp without time zone DEFAULT now(),
    "Status" smallint
);
 -   DROP TABLE regulation."WaitingConfirmation";
    
   regulation         heap    postgres    false    7            @           1259    19182    WaitingConfirmation_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."WaitingConfirmation_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE regulation."WaitingConfirmation_Id_seq";
    
   regulation          postgres    false    7    321            P           0    0    WaitingConfirmation_Id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE regulation."WaitingConfirmation_Id_seq" OWNED BY regulation."WaitingConfirmation"."Id";
       
   regulation          postgres    false    320            ?           1259    19174    schedule_category_etitys    TABLE     �   CREATE TABLE regulation.schedule_category_etitys (
    id integer NOT NULL,
    schedule_category_id integer,
    entity_id integer
);
 0   DROP TABLE regulation.schedule_category_etitys;
    
   regulation         heap    postgres    false    7            >           1259    19173    schedule_category_etitys_id_seq    SEQUENCE     �   CREATE SEQUENCE regulation.schedule_category_etitys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE regulation.schedule_category_etitys_id_seq;
    
   regulation          postgres    false    7    319            Q           0    0    schedule_category_etitys_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE regulation.schedule_category_etitys_id_seq OWNED BY regulation.schedule_category_etitys.id;
       
   regulation          postgres    false    318            4           1259    19115    schedulings    TABLE     t  CREATE TABLE regulation.schedulings (
    id bigint NOT NULL,
    title character varying(300),
    description text,
    start_date date,
    start_time time without time zone,
    end_date date,
    end_time time without time zone,
    recurrence character varying(1),
    period character varying(1),
    category integer,
    id_api character varying(255),
    id_event_google character varying(255),
    recur_info character varying(255),
    event_color character varying(2555),
    creator character varying(255),
    reminder character varying(255),
    "ScheduleAvailabilityId" integer,
    "PatientQueueId" integer
);
 #   DROP TABLE regulation.schedulings;
    
   regulation         heap    postgres    false    7            3           1259    19114    schedulings_Id_seq    SEQUENCE     �   CREATE SEQUENCE regulation."schedulings_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE regulation."schedulings_Id_seq";
    
   regulation          postgres    false    308    7            R           0    0    schedulings_Id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE regulation."schedulings_Id_seq" OWNED BY regulation.schedulings.id;
       
   regulation          postgres    false    307            �           2604    19226    ConsultingCategories Id    DEFAULT     �   ALTER TABLE ONLY consultancy."ConsultingCategories" ALTER COLUMN "Id" SET DEFAULT nextval('consultancy."ConsultingCategories_Id_seq"'::regclass);
 O   ALTER TABLE consultancy."ConsultingCategories" ALTER COLUMN "Id" DROP DEFAULT;
       consultancy          postgres    false    323    322    323            �           2604    17400     MonitoringProtocolFlows Id    DEFAULT     �   ALTER TABLE ONLY public." MonitoringProtocolFlows" ALTER COLUMN "Id" SET DEFAULT nextval('public."ProtocolFlows_Id_seq"'::regclass);
 N   ALTER TABLE public." MonitoringProtocolFlows" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    260    217            �           2604    17401 %   AttendanceMedicalRecordAttachments Id    DEFAULT     �   ALTER TABLE ONLY public."AttendanceMedicalRecordAttachments" ALTER COLUMN "Id" SET DEFAULT nextval('public."AttendanceMedicalRecordAttachments_Id_seq"'::regclass);
 X   ALTER TABLE public."AttendanceMedicalRecordAttachments" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    220    219            �           2604    17402    AttendanceMedicalRecords Id    DEFAULT     �   ALTER TABLE ONLY public."AttendanceMedicalRecords" ALTER COLUMN "Id" SET DEFAULT nextval('public."AttendanceMedicalRecord_Id_seq"'::regclass);
 N   ALTER TABLE public."AttendanceMedicalRecords" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    222    221            �           2604    17403    AttendanceMeeting Id    DEFAULT     �   ALTER TABLE ONLY public."AttendanceMeeting" ALTER COLUMN "Id" SET DEFAULT nextval('public."AttendanceMeeting_Id_seq"'::regclass);
 G   ALTER TABLE public."AttendanceMeeting" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    224    223            �           2604    17404    AttendanceProtocols Id    DEFAULT     �   ALTER TABLE ONLY public."AttendanceProtocols" ALTER COLUMN "Id" SET DEFAULT nextval('public."AttendanceProtocols_Id_seq"'::regclass);
 I   ALTER TABLE public."AttendanceProtocols" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    226    225            �           2604    17405    AttendanceTags Id    DEFAULT     |   ALTER TABLE ONLY public."AttendanceTags" ALTER COLUMN "Id" SET DEFAULT nextval('public."AttendanceTags_id_seq"'::regclass);
 D   ALTER TABLE public."AttendanceTags" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    228    227            �           2604    17406    CareLines Id    DEFAULT     q   ALTER TABLE ONLY public."CareLines" ALTER COLUMN "Id" SET DEFAULT nextval('public."CareLine_id_seq"'::regclass);
 ?   ALTER TABLE public."CareLines" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    232    231            �           2604    17407    ChatTemplates Id    DEFAULT     z   ALTER TABLE ONLY public."ChatTemplates" ALTER COLUMN "Id" SET DEFAULT nextval('public."ChatTemplates_Id_seq"'::regclass);
 C   ALTER TABLE public."ChatTemplates" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    236    235            �           2604    17408    Countries Id    DEFAULT     p   ALTER TABLE ONLY public."Countries" ALTER COLUMN "Id" SET DEFAULT nextval('public."Country_id_seq"'::regclass);
 ?   ALTER TABLE public."Countries" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    240    239            �           2604    17409    FlowMesageOptions Id    DEFAULT     �   ALTER TABLE ONLY public."FlowMesageOptions" ALTER COLUMN "Id" SET DEFAULT nextval('public."ProtocolQuestionResponses_Id_seq"'::regclass);
 G   ALTER TABLE public."FlowMesageOptions" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    261    241            �           2604    17410    FlowMesages Id    DEFAULT     �   ALTER TABLE ONLY public."FlowMesages" ALTER COLUMN "Id" SET DEFAULT nextval('public."MonitoringProtocolNodes_Id_seq"'::regclass);
 A   ALTER TABLE public."FlowMesages" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    250    242            �           2604    17411    InvalidPatientsImport Id    DEFAULT     �   ALTER TABLE ONLY public."InvalidPatientsImport" ALTER COLUMN "Id" SET DEFAULT nextval('public."InvalidPatientsImport_Id_seq"'::regclass);
 K   ALTER TABLE public."InvalidPatientsImport" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    244    243            �           2604    17412    MonitoringData Id    DEFAULT     |   ALTER TABLE ONLY public."MonitoringData" ALTER COLUMN "Id" SET DEFAULT nextval('public."MonitoringData_Id_seq"'::regclass);
 D   ALTER TABLE public."MonitoringData" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    247    246            �           2604    17413     MonitoringProtocolFlowMesages Id    DEFAULT     �   ALTER TABLE ONLY public."MonitoringProtocolFlowMesages" ALTER COLUMN "Id" SET DEFAULT nextval('public."MonitoringProtocolFlowMesages_Id_seq"'::regclass);
 S   ALTER TABLE public."MonitoringProtocolFlowMesages" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    249    248            �           2604    17414    MonitoringProtocols Id    DEFAULT     |   ALTER TABLE ONLY public."MonitoringProtocols" ALTER COLUMN "Id" SET DEFAULT nextval('public."Protocols_Id_seq"'::regclass);
 I   ALTER TABLE public."MonitoringProtocols" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    262    251            �           2604    17415    Prescriptions id    DEFAULT     x   ALTER TABLE ONLY public."Prescriptions" ALTER COLUMN id SET DEFAULT nextval('public."Prescriptions_id_seq"'::regclass);
 A   ALTER TABLE public."Prescriptions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    254            �           2604    17416    PrescriptionsDocs id    DEFAULT     �   ALTER TABLE ONLY public."PrescriptionsDocs" ALTER COLUMN id SET DEFAULT nextval('public."PrescriptionsDocs_id_seq"'::regclass);
 E   ALTER TABLE public."PrescriptionsDocs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255            �           2604    17417    Priorities Id    DEFAULT     t   ALTER TABLE ONLY public."Priorities" ALTER COLUMN "Id" SET DEFAULT nextval('public."Priorities_Id_seq"'::regclass);
 @   ALTER TABLE public."Priorities" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    259    258            �           2604    17418    ScreeningAnswers Id    DEFAULT     �   ALTER TABLE ONLY public."ScreeningAnswers" ALTER COLUMN "Id" SET DEFAULT nextval('public."ScreeningAnswers_Id_seq1"'::regclass);
 F   ALTER TABLE public."ScreeningAnswers" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    266    263            �           2604    17419    ScreeningProtocolAnswers Id    DEFAULT     �   ALTER TABLE ONLY public."ScreeningProtocolAnswers" ALTER COLUMN "Id" SET DEFAULT nextval('public."ScreeningAnswers_Id_seq"'::regclass);
 N   ALTER TABLE public."ScreeningProtocolAnswers" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    265    264            �           2604    17420    ScreeningProtocolQuestions Id    DEFAULT     �   ALTER TABLE ONLY public."ScreeningProtocolQuestions" ALTER COLUMN "Id" SET DEFAULT nextval('public."ScreeningProtocolGroups_Id_seq"'::regclass);
 P   ALTER TABLE public."ScreeningProtocolQuestions" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    268    267            �           2604    17421    ScreeningProtocols Id    DEFAULT     |   ALTER TABLE ONLY public."ScreeningProtocols" ALTER COLUMN "Id" SET DEFAULT nextval('public."Screenings_Id_seq"'::regclass);
 H   ALTER TABLE public."ScreeningProtocols" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    271    269            �           2604    17422    Screenings Id    DEFAULT     u   ALTER TABLE ONLY public."Screenings" ALTER COLUMN "Id" SET DEFAULT nextval('public."Screenings_Id_seq1"'::regclass);
 @   ALTER TABLE public."Screenings" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    272    270            �           2604    17423 	   Stages Id    DEFAULT     k   ALTER TABLE ONLY public."Stages" ALTER COLUMN "Id" SET DEFAULT nextval('public."Stage_id_seq"'::regclass);
 <   ALTER TABLE public."Stages" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    274    273            �           2604    17424    Statuses Id    DEFAULT     p   ALTER TABLE ONLY public."Statuses" ALTER COLUMN "Id" SET DEFAULT nextval('public."Statuses_Id_seq"'::regclass);
 >   ALTER TABLE public."Statuses" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    277    276            �           2604    17425    SubStages Id    DEFAULT     r   ALTER TABLE ONLY public."SubStages" ALTER COLUMN "Id" SET DEFAULT nextval('public."SubStages_Id_seq"'::regclass);
 ?   ALTER TABLE public."SubStages" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    279    278            �           2604    17426    Tags Id    DEFAULT     h   ALTER TABLE ONLY public."Tags" ALTER COLUMN "Id" SET DEFAULT nextval('public."Tags_id_seq"'::regclass);
 :   ALTER TABLE public."Tags" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    281    280            �           2604    17427    TimeLineEvent Id    DEFAULT     z   ALTER TABLE ONLY public."TimeLineEvent" ALTER COLUMN "Id" SET DEFAULT nextval('public."TimeLineEvent_Id_seq"'::regclass);
 C   ALTER TABLE public."TimeLineEvent" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    283    282            �           2604    17428    UserAttendanceRecords Id    DEFAULT     �   ALTER TABLE ONLY public."UserAttendanceRecords" ALTER COLUMN "Id" SET DEFAULT nextval('public."UserAttendanceRecords_Id_seq"'::regclass);
 K   ALTER TABLE public."UserAttendanceRecords" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    287    286            �           2604    17429    UserMedicalSpecialties Id    DEFAULT     �   ALTER TABLE ONLY public."UserMedicalSpecialties" ALTER COLUMN "Id" SET DEFAULT nextval('public."UserMedicalSpecialties_Id_seq"'::regclass);
 L   ALTER TABLE public."UserMedicalSpecialties" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    289    288            �           2604    17430    UserTypes Id    DEFAULT     r   ALTER TABLE ONLY public."UserTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."UserTypes_Id_seq"'::regclass);
 ?   ALTER TABLE public."UserTypes" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    291    290            �           2604    17431    WhatsAppTemplateLogs Id    DEFAULT     �   ALTER TABLE ONLY public."WhatsAppTemplateLogs" ALTER COLUMN "Id" SET DEFAULT nextval('public."WhatsAppTemplateLogs_Id_seq"'::regclass);
 J   ALTER TABLE public."WhatsAppTemplateLogs" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    293    292            �           2604    17432    WhatsAppTemplates Id    DEFAULT     �   ALTER TABLE ONLY public."WhatsAppTemplates" ALTER COLUMN "Id" SET DEFAULT nextval('public."WhatsAppTemplates_Id_seq"'::regclass);
 G   ALTER TABLE public."WhatsAppTemplates" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    295    294            �           2604    17433 	   sc_log id    DEFAULT     f   ALTER TABLE ONLY public.sc_log ALTER COLUMN id SET DEFAULT nextval('public.sc_log_id_seq'::regclass);
 8   ALTER TABLE public.sc_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    298    297            �           2604    19136 
   Entitys Id    DEFAULT     v   ALTER TABLE ONLY regulation."Entitys" ALTER COLUMN "Id" SET DEFAULT nextval('regulation."Entitys_Id_seq"'::regclass);
 A   ALTER TABLE regulation."Entitys" ALTER COLUMN "Id" DROP DEFAULT;
    
   regulation          postgres    false    311    312    312            �           2604    19104    PatientQueues Id    DEFAULT     �   ALTER TABLE ONLY regulation."PatientQueues" ALTER COLUMN "Id" SET DEFAULT nextval('regulation."PatientQueues_Id_seq"'::regclass);
 G   ALTER TABLE regulation."PatientQueues" ALTER COLUMN "Id" DROP DEFAULT;
    
   regulation          postgres    false    304    303    304            �           2604    19111    ScheduleAvailabilitys Id    DEFAULT     �   ALTER TABLE ONLY regulation."ScheduleAvailabilitys" ALTER COLUMN "Id" SET DEFAULT nextval('regulation."ScheduleAvailabilitys_Id_seq"'::regclass);
 O   ALTER TABLE regulation."ScheduleAvailabilitys" ALTER COLUMN "Id" DROP DEFAULT;
    
   regulation          postgres    false    305    306    306            �           2604    19127    ScheduleCategories Id    DEFAULT     �   ALTER TABLE ONLY regulation."ScheduleCategories" ALTER COLUMN "Id" SET DEFAULT nextval('regulation."ScheduleCategories_Id_seq"'::regclass);
 L   ALTER TABLE regulation."ScheduleCategories" ALTER COLUMN "Id" DROP DEFAULT;
    
   regulation          postgres    false    310    309    310            �           2604    19169    ScheduleCategoryEtitys id    DEFAULT     �   ALTER TABLE ONLY regulation."ScheduleCategoryEtitys" ALTER COLUMN id SET DEFAULT nextval('regulation."ScheduleCategoryEtitys_Id_seq"'::regclass);
 N   ALTER TABLE regulation."ScheduleCategoryEtitys" ALTER COLUMN id DROP DEFAULT;
    
   regulation          postgres    false    316    317    317            �           2604    19148    Ufs Id    DEFAULT     m   ALTER TABLE ONLY regulation."Ufs" ALTER COLUMN "Id" SET DEFAULT nextval('regulation."Uf_Id_seq"'::regclass);
 =   ALTER TABLE regulation."Ufs" ALTER COLUMN "Id" DROP DEFAULT;
    
   regulation          postgres    false    313    314    314            �           2604    19186    WaitingConfirmation Id    DEFAULT     �   ALTER TABLE ONLY regulation."WaitingConfirmation" ALTER COLUMN "Id" SET DEFAULT nextval('regulation."WaitingConfirmation_Id_seq"'::regclass);
 M   ALTER TABLE regulation."WaitingConfirmation" ALTER COLUMN "Id" DROP DEFAULT;
    
   regulation          postgres    false    321    320    321            �           2604    19177    schedule_category_etitys id    DEFAULT     �   ALTER TABLE ONLY regulation.schedule_category_etitys ALTER COLUMN id SET DEFAULT nextval('regulation.schedule_category_etitys_id_seq'::regclass);
 N   ALTER TABLE regulation.schedule_category_etitys ALTER COLUMN id DROP DEFAULT;
    
   regulation          postgres    false    318    319    319            �           2604    19118    schedulings id    DEFAULT     z   ALTER TABLE ONLY regulation.schedulings ALTER COLUMN id SET DEFAULT nextval('regulation."schedulings_Id_seq"'::regclass);
 A   ALTER TABLE regulation.schedulings ALTER COLUMN id DROP DEFAULT;
    
   regulation          postgres    false    307    308    308            �          0    19223    ConsultingCategories 
   TABLE DATA           G   COPY consultancy."ConsultingCategories" ("Id", "Category") FROM stdin;
    consultancy          postgres    false    323   �                0    17165     MonitoringProtocolFlows 
   TABLE DATA           f   COPY public." MonitoringProtocolFlows" ("Id", "ProtocolId", "Order", "Frequency", "Days") FROM stdin;
    public          postgres    false    217   w�                0    17168    AttendanceHistories 
   TABLE DATA             COPY public."AttendanceHistories" ("Id", "PatientId", "CareLineId", "UserId", "CreateAt", "SubStageId", "StageId", "AttendanceParentId", "PriorityId", "StatusId", "UpdatedAt", "Disease", "Started", "Finished", "SentToFastMedic", "DefinitionMedicalRecordId", "Meeting") FROM stdin;
    public          postgres    false    218   ��                0    17171 "   AttendanceMedicalRecordAttachments 
   TABLE DATA           h   COPY public."AttendanceMedicalRecordAttachments" ("Id", "AttendanceMedicalRecordId", "Uri") FROM stdin;
    public          postgres    false    219   ސ                0    17177    AttendanceMedicalRecords 
   TABLE DATA           �   COPY public."AttendanceMedicalRecords" ("Id", "AttendanceId", "IsSOAP", "Subjective", "Objetctive", "Avaliation", "Plan", "UserId", "CreateAt", "CIAPId", "CIDId") FROM stdin;
    public          postgres    false    221   ��                0    17185    AttendanceMeeting 
   TABLE DATA           �   COPY public."AttendanceMeeting" ("Id", "Code", "UrlPatient", "UrlProfessional", "AttendanceId", "Created", "CheckinPatient", "CheckinProfessional", "Finished", "Expired") FROM stdin;
    public          postgres    false    223   (�                0    17189    AttendanceProtocols 
   TABLE DATA           S   COPY public."AttendanceProtocols" ("Id", "AttendanceId", "ProtocolId") FROM stdin;
    public          postgres    false    225   ��      !          0    17193    AttendanceTags 
   TABLE DATA           I   COPY public."AttendanceTags" ("Id", "AttendanceId", "TagId") FROM stdin;
    public          postgres    false    227   j�      $          0    17198    Attendances 
   TABLE DATA             COPY public."Attendances" ("Id", "PatientId", "CareLineId", "UserId", "CreateAt", "SubStageId", "StageId", "AttendanceParentId", "PriorityId", "StatusId", "UpdatedAt", "Disease", "Started", "Finished", "SentToFastMedic", "DefinitionMedicalRecordId", "Meeting") FROM stdin;
    public          postgres    false    230   v�      %          0    17205 	   CareLines 
   TABLE DATA           O   COPY public."CareLines" ("Id", "CareLine", "IsActive", "CreateAt") FROM stdin;
    public          postgres    false    231   2�      (          0    17212    ChatMessages 
   TABLE DATA           �   COPY public."ChatMessages" ("PatientId", "UserId", "Message", "Visualized", "CreateAt", "SourceChanel", "DestinationChanel", "Id", "Delivered", "Read", "WhatsAppMsgId") FROM stdin;
    public          postgres    false    234   ��      )          0    17220    ChatTemplates 
   TABLE DATA           �   COPY public."ChatTemplates" ("Id", "Template", "CurrentStatus", "StatusUpdeted", "Title", "CurrentStageId", "StageUpdetedId", "SubStageUpdetedId", "Default", "WhatsAppTemplateId") FROM stdin;
    public          postgres    false    235   
�      +          0    17227    Ciap 
   TABLE DATA           \   COPY public."Ciap" ("Id", "Component", "OriginalDescription", "LayDescription") FROM stdin;
    public          postgres    false    237   C�      ,          0    17230    Cid10 
   TABLE DATA           T   COPY public."Cid10" ("Id", "CodGroup", "ParentCategory", "Description") FROM stdin;
    public          postgres    false    238   �      -          0    17233 	   Countries 
   TABLE DATA           6   COPY public."Countries" ("Id", "Country") FROM stdin;
    public          postgres    false    239   ,�      /          0    17237    FlowMesageOptions 
   TABLE DATA           �   COPY public."FlowMesageOptions" ("Id", "ProtocolMessageId", "Order", "Option", "OptionContend", "OptionContendType") FROM stdin;
    public          postgres    false    241   ��      0          0    17242    FlowMesages 
   TABLE DATA           G   COPY public."FlowMesages" ("Id", "Node", "Mesage", "Type") FROM stdin;
    public          postgres    false    242   ǥ      1          0    17245    InvalidPatientsImport 
   TABLE DATA           �   COPY public."InvalidPatientsImport" ("Id", "Name", "MotherName", "BiologicalSex", "BirthDate", "Cpf", "CellPhone", "Cep", "Address", "AddressNumber", "District", "Complement", "State", "City", "Email", "UserId", "CreateAt", "Validation") FROM stdin;
    public          postgres    false    243   �      3          0    17251    MedicalSpecialties 
   TABLE DATA           L   COPY public."MedicalSpecialties" ("Id", "Name", "Group", "CBO") FROM stdin;
    public          postgres    false    245   ��      4          0    17254    MonitoringData 
   TABLE DATA           S   COPY public."MonitoringData" ("Id", "Description", "Endpoint", "Auth") FROM stdin;
    public          postgres    false    246   g�      6          0    17258    MonitoringProtocolFlowMesages 
   TABLE DATA           �   COPY public."MonitoringProtocolFlowMesages" ("Id", "FlowMessageId", "Order", "MonitoringProtocolFlowMesageParentId", "MonitoringProtocolFlowMesageOptionParentId") FROM stdin;
    public          postgres    false    248   ��      9          0    17263    MonitoringProtocols 
   TABLE DATA           Y   COPY public."MonitoringProtocols" ("Id", "Protocol", "CreateAt", "IsActive") FROM stdin;
    public          postgres    false    251   �      ;          0    17269    Patients 
   TABLE DATA             COPY public."Patients" ("Id", "Name", "MotherName", "BiologicalSex", "BirthDate", "Cpf", "CellPhone", "Cep", "Address", "AddressNumber", "District", "Complement", "CountryId", "State", "City", "Latitude", "Longitude", "CreateAt", "Email", "DeletedAt") FROM stdin;
    public          postgres    false    253   5�      <          0    17276    Prescriptions 
   TABLE DATA           l   COPY public."Prescriptions" (id, "PatientId", "Prescription", "PrescriptionIdMevo", "InsertAt") FROM stdin;
    public          postgres    false    254   :�      =          0    17282    PrescriptionsDocs 
   TABLE DATA           o   COPY public."PrescriptionsDocs" (id, "PrescriptionId", "URL", "ContentType", "Signed", "Category") FROM stdin;
    public          postgres    false    255   ��      @          0    17287 
   Priorities 
   TABLE DATA           J   COPY public."Priorities" ("Id", "Priority", "Order", "Color") FROM stdin;
    public          postgres    false    258   4�      E          0    17294    ScreeningAnswers 
   TABLE DATA           �   COPY public."ScreeningAnswers" ("Id", "ScreeningId", "ScreeningProtocolId", "ScreeningQuestionId", "ScreeningAnswerId") FROM stdin;
    public          postgres    false    263   ��      F          0    17297    ScreeningProtocolAnswers 
   TABLE DATA           l   COPY public."ScreeningProtocolAnswers" ("Id", "ScreeningProtocolQuestionId", "Answer", "Color") FROM stdin;
    public          postgres    false    264   I
      I          0    17302    ScreeningProtocolQuestions 
   TABLE DATA           o   COPY public."ScreeningProtocolQuestions" ("Id", "ScreeningProtocolId", "Key", "Group", "Question") FROM stdin;
    public          postgres    false    267   .      K          0    17306    ScreeningProtocols 
   TABLE DATA           I   COPY public."ScreeningProtocols" ("Id", "ScreeningProtocol") FROM stdin;
    public          postgres    false    269   �      L          0    17309 
   Screenings 
   TABLE DATA           N   COPY public."Screenings" ("Id", "CreateAt", "PatientId", "Color") FROM stdin;
    public          postgres    false    270   �      O          0    17315    Stages 
   TABLE DATA           1   COPY public."Stages" ("Id", "Stage") FROM stdin;
    public          postgres    false    273   $      Q          0    17319    State 
   TABLE DATA           ,   COPY public."State" (id, state) FROM stdin;
    public          postgres    false    275   �      R          0    17322    Statuses 
   TABLE DATA           4   COPY public."Statuses" ("Id", "Status") FROM stdin;
    public          postgres    false    276          T          0    17326 	   SubStages 
   TABLE DATA           N   COPY public."SubStages" ("Id", "StageId", "SubStage", "IsActive") FROM stdin;
    public          postgres    false    278   �       V          0    17331    Tags 
   TABLE DATA           E   COPY public."Tags" ("Id", "Tag", "IsActive", "CreateAt") FROM stdin;
    public          postgres    false    280   4!      X          0    17337    TimeLineEvent 
   TABLE DATA           @   COPY public."TimeLineEvent" ("Id", "TimeLineEvent") FROM stdin;
    public          postgres    false    282   H#      [          0    17342    TimeLinePatients 
   TABLE DATA           v   COPY public."TimeLinePatients" ("Id", "PatientId", "UserId", "TimeLineEventId", "Description", "CreatAt") FROM stdin;
    public          postgres    false    285   ,$      \          0    17349    UserAttendanceRecords 
   TABLE DATA           e   COPY public."UserAttendanceRecords" ("Id", "AttendanceId", "UserId", "Type", "CreateAt") FROM stdin;
    public          postgres    false    286   �H      ^          0    17354    UserMedicalSpecialties 
   TABLE DATA           Z   COPY public."UserMedicalSpecialties" ("Id", "UserId", "MedicalSpecialtiesId") FROM stdin;
    public          postgres    false    288   <J      `          0    17358 	   UserTypes 
   TABLE DATA           3   COPY public."UserTypes" ("Id", "Type") FROM stdin;
    public          postgres    false    290   mJ      b          0    17362    WhatsAppTemplateLogs 
   TABLE DATA           q   COPY public."WhatsAppTemplateLogs" ("Id", "WhatsAppTemplateId", "DateTime", "ResponseStatus", "Log") FROM stdin;
    public          postgres    false    292   �J      d          0    17369    WhatsAppTemplates 
   TABLE DATA           �   COPY public."WhatsAppTemplates" ("Id", "Template", "Samples", "Name", "IsActive", "TemplateId", "TemplateStatus", "Type", "Button1", "Button2", "Button3", "CallToAction") FROM stdin;
    public          postgres    false    294   �V      f          0    17377    logged 
   TABLE DATA           C   COPY public.logged (login, date_login, sc_session, ip) FROM stdin;
    public          postgres    false    296   a]      g          0    17380    sc_log 
   TABLE DATA           q   COPY public.sc_log (id, inserted_date, username, application, creator, ip_user, action, description) FROM stdin;
    public          postgres    false    297   �`      i          0    17387    settings 
   TABLE DATA           7   COPY public.settings (set_name, set_value) FROM stdin;
    public          postgres    false    299   1�      k          0    17393    users 
   TABLE DATA           �   COPY public.users (login, pswd, name, email, active, activation_code, priv_admin, mfa, "Id", "UserTypeId", "ProfessionalRecord", "ProfessionalRecordState", "Cpf", "CellPhone", "VideoCall", "BiologicalSex", "BirthDate", "ClientId") FROM stdin;
    public          postgres    false    301   ��      x          0    19151    Cities 
   TABLE DATA           J   COPY regulation."Cities" ("Id", "UfCode", "IbgeCode", "City") FROM stdin;
 
   regulation          postgres    false    315   =	      u          0    19133    Entitys 
   TABLE DATA              COPY regulation."Entitys" ("Id", "CompanyName", "Name", "CNES", "CorporateType", "CpfCnpj", "Phone", "ContactName", "UfCode", "IbgeCode", "CEP", "Address", "AddresNumber", "District", "Complement", "Email", "Latitude", "Longitude", "EntityId") FROM stdin;
 
   regulation          postgres    false    312   |�	      m          0    19101    PatientQueues 
   TABLE DATA             COPY regulation."PatientQueues" ("Id", "PatientId", "CategoryId", "EntityId", "UserId", "Status", "Description", "CreatedAt", "VideoLink", "UserIdApproved", "UserIdScheduled", "VideoLinkPatient", "DocumentTCLE", "DocumentRequest", "TCLEName", "RequestName") FROM stdin;
 
   regulation          postgres    false    304   � 
      o          0    19108    ScheduleAvailabilitys 
   TABLE DATA           �   COPY regulation."ScheduleAvailabilitys" ("Id", "CategoryId", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "StartDate", "EndDate", "StartHour", "EndHour", "UserId", "Interval", "Scheduled", "EntitieId") FROM stdin;
 
   regulation          postgres    false    306   PE
      s          0    19124    ScheduleCategories 
   TABLE DATA           L   COPY regulation."ScheduleCategories" ("Id", "Category", "Type") FROM stdin;
 
   regulation          postgres    false    310   �E
      z          0    19166    ScheduleCategoryEtitys 
   TABLE DATA           \   COPY regulation."ScheduleCategoryEtitys" (id, "ScheduleCategoryId", "EntityId") FROM stdin;
 
   regulation          postgres    false    317   VF
      w          0    19145    Ufs 
   TABLE DATA           A   COPY regulation."Ufs" ("Id", "CodUf", "Uf", "State") FROM stdin;
 
   regulation          postgres    false    314   sF
      ~          0    19183    WaitingConfirmation 
   TABLE DATA           j   COPY regulation."WaitingConfirmation" ("Id", "ScheduleId", "PatientId", "DateTime", "Status") FROM stdin;
 
   regulation          postgres    false    321   �G
      |          0    19174    schedule_category_etitys 
   TABLE DATA           [   COPY regulation.schedule_category_etitys (id, schedule_category_id, entity_id) FROM stdin;
 
   regulation          postgres    false    319   VH
      q          0    19115    schedulings 
   TABLE DATA           �   COPY regulation.schedulings (id, title, description, start_date, start_time, end_date, end_time, recurrence, period, category, id_api, id_event_google, recur_info, event_color, creator, reminder, "ScheduleAvailabilityId", "PatientQueueId") FROM stdin;
 
   regulation          postgres    false    308   �H
      S           0    0    ConsultingCategories_Id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('consultancy."ConsultingCategories_Id_seq"', 3, true);
          consultancy          postgres    false    322            T           0    0 )   AttendanceMedicalRecordAttachments_Id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."AttendanceMedicalRecordAttachments_Id_seq"', 1, false);
          public          postgres    false    220            U           0    0    AttendanceMedicalRecord_Id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."AttendanceMedicalRecord_Id_seq"', 23, true);
          public          postgres    false    222            V           0    0    AttendanceMeeting_Id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."AttendanceMeeting_Id_seq"', 81, true);
          public          postgres    false    224            W           0    0    AttendanceProtocols_Id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."AttendanceProtocols_Id_seq"', 65, true);
          public          postgres    false    226            X           0    0    AttendanceTags_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."AttendanceTags_id_seq"', 105, true);
          public          postgres    false    228            Y           0    0    Attendances_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Attendances_id_seq"', 173, true);
          public          postgres    false    229            Z           0    0    CareLine_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."CareLine_id_seq"', 3, true);
          public          postgres    false    232            [           0    0    ChatMessages_Id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."ChatMessages_Id_seq"', 511, true);
          public          postgres    false    233            \           0    0    ChatTemplates_Id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."ChatTemplates_Id_seq"', 25, true);
          public          postgres    false    236            ]           0    0    Country_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Country_id_seq"', 1, false);
          public          postgres    false    240            ^           0    0    InvalidPatientsImport_Id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."InvalidPatientsImport_Id_seq"', 28564, true);
          public          postgres    false    244            _           0    0    MonitoringData_Id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."MonitoringData_Id_seq"', 1, true);
          public          postgres    false    247            `           0    0 $   MonitoringProtocolFlowMesages_Id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."MonitoringProtocolFlowMesages_Id_seq"', 1, false);
          public          postgres    false    249            a           0    0    MonitoringProtocolNodes_Id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."MonitoringProtocolNodes_Id_seq"', 1, false);
          public          postgres    false    250            b           0    0    Patients_Id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Patients_Id_seq"', 92, true);
          public          postgres    false    252            c           0    0    PrescriptionsDocs_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."PrescriptionsDocs_id_seq"', 23, true);
          public          postgres    false    256            d           0    0    Prescriptions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Prescriptions_id_seq"', 71, true);
          public          postgres    false    257            e           0    0    Priorities_Id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Priorities_Id_seq"', 5, true);
          public          postgres    false    259            f           0    0    ProtocolFlows_Id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."ProtocolFlows_Id_seq"', 1, false);
          public          postgres    false    260            g           0    0     ProtocolQuestionResponses_Id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."ProtocolQuestionResponses_Id_seq"', 1, false);
          public          postgres    false    261            h           0    0    Protocols_Id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Protocols_Id_seq"', 16, true);
          public          postgres    false    262            i           0    0    ScreeningAnswers_Id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."ScreeningAnswers_Id_seq"', 69, true);
          public          postgres    false    265            j           0    0    ScreeningAnswers_Id_seq1    SEQUENCE SET     K   SELECT pg_catalog.setval('public."ScreeningAnswers_Id_seq1"', 1489, true);
          public          postgres    false    266            k           0    0    ScreeningProtocolGroups_Id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."ScreeningProtocolGroups_Id_seq"', 1, false);
          public          postgres    false    268            l           0    0    Screenings_Id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Screenings_Id_seq"', 1, true);
          public          postgres    false    271            m           0    0    Screenings_Id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Screenings_Id_seq1"', 328, true);
          public          postgres    false    272            n           0    0    Stage_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Stage_id_seq"', 6, true);
          public          postgres    false    274            o           0    0    Statuses_Id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Statuses_Id_seq"', 1, false);
          public          postgres    false    277            p           0    0    SubStages_Id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."SubStages_Id_seq"', 9, true);
          public          postgres    false    279            q           0    0    Tags_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Tags_id_seq"', 37, true);
          public          postgres    false    281            r           0    0    TimeLineEvent_Id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."TimeLineEvent_Id_seq"', 12, true);
          public          postgres    false    283            s           0    0    TimeLinePatients_Id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."TimeLinePatients_Id_seq"', 378, true);
          public          postgres    false    284            t           0    0    UserAttendanceRecords_Id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."UserAttendanceRecords_Id_seq"', 25, true);
          public          postgres    false    287            u           0    0    UserMedicalSpecialties_Id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."UserMedicalSpecialties_Id_seq"', 16, true);
          public          postgres    false    289            v           0    0    UserTypes_Id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."UserTypes_Id_seq"', 3, true);
          public          postgres    false    291            w           0    0    WhatsAppTemplateLogs_Id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."WhatsAppTemplateLogs_Id_seq"', 36, true);
          public          postgres    false    293            x           0    0    WhatsAppTemplates_Id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."WhatsAppTemplates_Id_seq"', 43, true);
          public          postgres    false    295            y           0    0    sc_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sc_log_id_seq', 21575, true);
          public          postgres    false    298            z           0    0    users_Id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."users_Id_seq"', 14, true);
          public          postgres    false    300            {           0    0    Entitys_Id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('regulation."Entitys_Id_seq"', 3, true);
       
   regulation          postgres    false    311            |           0    0    PatientQueues_Id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('regulation."PatientQueues_Id_seq"', 28, true);
       
   regulation          postgres    false    303            }           0    0    ScheduleAvailabilitys_Id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('regulation."ScheduleAvailabilitys_Id_seq"', 9, true);
       
   regulation          postgres    false    305            ~           0    0    ScheduleCategories_Id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('regulation."ScheduleCategories_Id_seq"', 3, true);
       
   regulation          postgres    false    309                       0    0    ScheduleCategoryEtitys_Id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('regulation."ScheduleCategoryEtitys_Id_seq"', 1, false);
       
   regulation          postgres    false    316            �           0    0 	   Uf_Id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('regulation."Uf_Id_seq"', 1, false);
       
   regulation          postgres    false    313            �           0    0    WaitingConfirmation_Id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('regulation."WaitingConfirmation_Id_seq"', 3, true);
       
   regulation          postgres    false    320            �           0    0    schedule_category_etitys_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('regulation.schedule_category_etitys_id_seq', 4, true);
       
   regulation          postgres    false    318            �           0    0    schedulings_Id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('regulation."schedulings_Id_seq"', 273, true);
       
   regulation          postgres    false    307            �           2606    19228 .   ConsultingCategories ConsultingCategories_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY consultancy."ConsultingCategories"
    ADD CONSTRAINT "ConsultingCategories_pkey" PRIMARY KEY ("Id");
 a   ALTER TABLE ONLY consultancy."ConsultingCategories" DROP CONSTRAINT "ConsultingCategories_pkey";
       consultancy            postgres    false    323                       2606    17456 ,   AttendanceHistories AttendanceHistories_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."AttendanceHistories"
    ADD CONSTRAINT "AttendanceHistories_pkey" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."AttendanceHistories" DROP CONSTRAINT "AttendanceHistories_pkey";
       public            postgres    false    218            	           2606    17458 J   AttendanceMedicalRecordAttachments AttendanceMedicalRecordAttachments_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."AttendanceMedicalRecordAttachments"
    ADD CONSTRAINT "AttendanceMedicalRecordAttachments_pkey" PRIMARY KEY ("Id");
 x   ALTER TABLE ONLY public."AttendanceMedicalRecordAttachments" DROP CONSTRAINT "AttendanceMedicalRecordAttachments_pkey";
       public            postgres    false    219                       2606    17460 5   AttendanceMedicalRecords AttendanceMedicalRecord_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."AttendanceMedicalRecords"
    ADD CONSTRAINT "AttendanceMedicalRecord_pkey" PRIMARY KEY ("Id");
 c   ALTER TABLE ONLY public."AttendanceMedicalRecords" DROP CONSTRAINT "AttendanceMedicalRecord_pkey";
       public            postgres    false    221                       2606    17462 (   AttendanceMeeting AttendanceMeeting_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."AttendanceMeeting"
    ADD CONSTRAINT "AttendanceMeeting_pkey" PRIMARY KEY ("Id");
 V   ALTER TABLE ONLY public."AttendanceMeeting" DROP CONSTRAINT "AttendanceMeeting_pkey";
       public            postgres    false    223                       2606    17464 ,   AttendanceProtocols AttendanceProtocols_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."AttendanceProtocols"
    ADD CONSTRAINT "AttendanceProtocols_pkey" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."AttendanceProtocols" DROP CONSTRAINT "AttendanceProtocols_pkey";
       public            postgres    false    225                       2606    17466 "   AttendanceTags AttendanceTags_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."AttendanceTags"
    ADD CONSTRAINT "AttendanceTags_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."AttendanceTags" DROP CONSTRAINT "AttendanceTags_pkey";
       public            postgres    false    227                       2606    17468    Attendances Attendance_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Attendances"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY ("Id");
 I   ALTER TABLE ONLY public."Attendances" DROP CONSTRAINT "Attendance_pkey";
       public            postgres    false    230                       2606    17470    CareLines CareLine_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."CareLines"
    ADD CONSTRAINT "CareLine_pkey" PRIMARY KEY ("Id");
 E   ALTER TABLE ONLY public."CareLines" DROP CONSTRAINT "CareLine_pkey";
       public            postgres    false    231                       2606    17472    ChatMessages ChatMessages_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."ChatMessages"
    ADD CONSTRAINT "ChatMessages_pkey" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."ChatMessages" DROP CONSTRAINT "ChatMessages_pkey";
       public            postgres    false    234            $           2606    17474     ChatTemplates ChatTemplates_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."ChatTemplates"
    ADD CONSTRAINT "ChatTemplates_pkey" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."ChatTemplates" DROP CONSTRAINT "ChatTemplates_pkey";
       public            postgres    false    235            &           2606    17476    Ciap Ciap_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Ciap"
    ADD CONSTRAINT "Ciap_pkey" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Ciap" DROP CONSTRAINT "Ciap_pkey";
       public            postgres    false    237            (           2606    17478    Cid10 Cid10_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Cid10"
    ADD CONSTRAINT "Cid10_pkey" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."Cid10" DROP CONSTRAINT "Cid10_pkey";
       public            postgres    false    238            *           2606    17480    Countries Country_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Countries" DROP CONSTRAINT "Country_pkey";
       public            postgres    false    239            0           2606    17482 0   InvalidPatientsImport InvalidPatientsImport_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."InvalidPatientsImport"
    ADD CONSTRAINT "InvalidPatientsImport_pkey" PRIMARY KEY ("Id");
 ^   ALTER TABLE ONLY public."InvalidPatientsImport" DROP CONSTRAINT "InvalidPatientsImport_pkey";
       public            postgres    false    243            2           2606    17484 *   MedicalSpecialties MedicalSpecialties_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."MedicalSpecialties"
    ADD CONSTRAINT "MedicalSpecialties_pkey" PRIMARY KEY ("Id");
 X   ALTER TABLE ONLY public."MedicalSpecialties" DROP CONSTRAINT "MedicalSpecialties_pkey";
       public            postgres    false    245            4           2606    17486 "   MonitoringData MonitoringData_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."MonitoringData"
    ADD CONSTRAINT "MonitoringData_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."MonitoringData" DROP CONSTRAINT "MonitoringData_pkey";
       public            postgres    false    246            6           2606    17488 @   MonitoringProtocolFlowMesages MonitoringProtocolFlowMesages_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."MonitoringProtocolFlowMesages"
    ADD CONSTRAINT "MonitoringProtocolFlowMesages_pkey" PRIMARY KEY ("Id");
 n   ALTER TABLE ONLY public."MonitoringProtocolFlowMesages" DROP CONSTRAINT "MonitoringProtocolFlowMesages_pkey";
       public            postgres    false    248            .           2606    17490 (   FlowMesages MonitoringProtocolNodes_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."FlowMesages"
    ADD CONSTRAINT "MonitoringProtocolNodes_pkey" PRIMARY KEY ("Id");
 V   ALTER TABLE ONLY public."FlowMesages" DROP CONSTRAINT "MonitoringProtocolNodes_pkey";
       public            postgres    false    242            :           2606    17492    Patients Patient_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Patients"
    ADD CONSTRAINT "Patient_pkey" PRIMARY KEY ("Id");
 C   ALTER TABLE ONLY public."Patients" DROP CONSTRAINT "Patient_pkey";
       public            postgres    false    253            D           2606    17494 (   PrescriptionsDocs PrescriptionsDocs_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."PrescriptionsDocs"
    ADD CONSTRAINT "PrescriptionsDocs_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."PrescriptionsDocs" DROP CONSTRAINT "PrescriptionsDocs_pkey";
       public            postgres    false    255            B           2606    17496     Prescriptions Prescriptions_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Prescriptions"
    ADD CONSTRAINT "Prescriptions_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Prescriptions" DROP CONSTRAINT "Prescriptions_pkey";
       public            postgres    false    254            G           2606    17498    Priorities Priorities_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Priorities"
    ADD CONSTRAINT "Priorities_pkey" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."Priorities" DROP CONSTRAINT "Priorities_pkey";
       public            postgres    false    258            �           2606    17500 +    MonitoringProtocolFlows ProtocolFlows_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public." MonitoringProtocolFlows"
    ADD CONSTRAINT "ProtocolFlows_pkey" PRIMARY KEY ("Id");
 Y   ALTER TABLE ONLY public." MonitoringProtocolFlows" DROP CONSTRAINT "ProtocolFlows_pkey";
       public            postgres    false    217            ,           2606    17502 0   FlowMesageOptions ProtocolQuestionResponses_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."FlowMesageOptions"
    ADD CONSTRAINT "ProtocolQuestionResponses_pkey" PRIMARY KEY ("Id");
 ^   ALTER TABLE ONLY public."FlowMesageOptions" DROP CONSTRAINT "ProtocolQuestionResponses_pkey";
       public            postgres    false    241            8           2606    17504 "   MonitoringProtocols Protocols_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."MonitoringProtocols"
    ADD CONSTRAINT "Protocols_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."MonitoringProtocols" DROP CONSTRAINT "Protocols_pkey";
       public            postgres    false    251            K           2606    17506 .   ScreeningProtocolAnswers ScreeningAnswers_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."ScreeningProtocolAnswers"
    ADD CONSTRAINT "ScreeningAnswers_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."ScreeningProtocolAnswers" DROP CONSTRAINT "ScreeningAnswers_pkey";
       public            postgres    false    264            I           2606    17508 '   ScreeningAnswers ScreeningAnswers_pkey1 
   CONSTRAINT     k   ALTER TABLE ONLY public."ScreeningAnswers"
    ADD CONSTRAINT "ScreeningAnswers_pkey1" PRIMARY KEY ("Id");
 U   ALTER TABLE ONLY public."ScreeningAnswers" DROP CONSTRAINT "ScreeningAnswers_pkey1";
       public            postgres    false    263            M           2606    17510 7   ScreeningProtocolQuestions ScreeningProtocolGroups_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public."ScreeningProtocolQuestions"
    ADD CONSTRAINT "ScreeningProtocolGroups_pkey" PRIMARY KEY ("Id");
 e   ALTER TABLE ONLY public."ScreeningProtocolQuestions" DROP CONSTRAINT "ScreeningProtocolGroups_pkey";
       public            postgres    false    267            O           2606    17512 "   ScreeningProtocols Screenings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."ScreeningProtocols"
    ADD CONSTRAINT "Screenings_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."ScreeningProtocols" DROP CONSTRAINT "Screenings_pkey";
       public            postgres    false    269            Q           2606    17514    Screenings Screenings_pkey1 
   CONSTRAINT     _   ALTER TABLE ONLY public."Screenings"
    ADD CONSTRAINT "Screenings_pkey1" PRIMARY KEY ("Id");
 I   ALTER TABLE ONLY public."Screenings" DROP CONSTRAINT "Screenings_pkey1";
       public            postgres    false    270            S           2606    17516    Stages Stage_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."Stages"
    ADD CONSTRAINT "Stage_pkey" PRIMARY KEY ("Id");
 ?   ALTER TABLE ONLY public."Stages" DROP CONSTRAINT "Stage_pkey";
       public            postgres    false    273            U           2606    17518    State State_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."State"
    ADD CONSTRAINT "State_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."State" DROP CONSTRAINT "State_pkey";
       public            postgres    false    275            W           2606    17520    Statuses Statuses_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Statuses"
    ADD CONSTRAINT "Statuses_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Statuses" DROP CONSTRAINT "Statuses_pkey";
       public            postgres    false    276            Y           2606    17522    SubStages SubStages_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."SubStages"
    ADD CONSTRAINT "SubStages_pkey" PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY public."SubStages" DROP CONSTRAINT "SubStages_pkey";
       public            postgres    false    278            [           2606    17524    Tags Tag_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tag_pkey" PRIMARY KEY ("Id");
 ;   ALTER TABLE ONLY public."Tags" DROP CONSTRAINT "Tag_pkey";
       public            postgres    false    280            ]           2606    17526     TimeLineEvent TimeLineEvent_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."TimeLineEvent"
    ADD CONSTRAINT "TimeLineEvent_pkey" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."TimeLineEvent" DROP CONSTRAINT "TimeLineEvent_pkey";
       public            postgres    false    282            _           2606    17528 &   TimeLinePatients TimeLinePatients_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."TimeLinePatients"
    ADD CONSTRAINT "TimeLinePatients_pkey" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."TimeLinePatients" DROP CONSTRAINT "TimeLinePatients_pkey";
       public            postgres    false    285            b           2606    17530 0   UserAttendanceRecords UserAttendanceRecords_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."UserAttendanceRecords"
    ADD CONSTRAINT "UserAttendanceRecords_pkey" PRIMARY KEY ("Id");
 ^   ALTER TABLE ONLY public."UserAttendanceRecords" DROP CONSTRAINT "UserAttendanceRecords_pkey";
       public            postgres    false    286            d           2606    17532 2   UserMedicalSpecialties UserMedicalSpecialties_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."UserMedicalSpecialties"
    ADD CONSTRAINT "UserMedicalSpecialties_pkey" PRIMARY KEY ("Id");
 `   ALTER TABLE ONLY public."UserMedicalSpecialties" DROP CONSTRAINT "UserMedicalSpecialties_pkey";
       public            postgres    false    288            f           2606    17534    UserTypes UserTypes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."UserTypes"
    ADD CONSTRAINT "UserTypes_pkey" PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY public."UserTypes" DROP CONSTRAINT "UserTypes_pkey";
       public            postgres    false    290            h           2606    17536 .   WhatsAppTemplateLogs WhatsAppTemplateLogs_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."WhatsAppTemplateLogs"
    ADD CONSTRAINT "WhatsAppTemplateLogs_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."WhatsAppTemplateLogs" DROP CONSTRAINT "WhatsAppTemplateLogs_pkey";
       public            postgres    false    292            j           2606    17538 (   WhatsAppTemplates WhatsAppTemplates_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."WhatsAppTemplates"
    ADD CONSTRAINT "WhatsAppTemplates_pkey" PRIMARY KEY ("Id");
 V   ALTER TABLE ONLY public."WhatsAppTemplates" DROP CONSTRAINT "WhatsAppTemplates_pkey";
       public            postgres    false    294            l           2606    17540    sc_log sc_log_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.sc_log
    ADD CONSTRAINT sc_log_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.sc_log DROP CONSTRAINT sc_log_pkey;
       public            postgres    false    297            n           2606    17542    settings settings_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (set_name);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    299            p           2606    17544    users users_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("Id");
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    301            ~           2606    19155    Cities City_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY regulation."Cities"
    ADD CONSTRAINT "City_pkey" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY regulation."Cities" DROP CONSTRAINT "City_pkey";
    
   regulation            postgres    false    315            z           2606    19140    Entitys Entitys_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY regulation."Entitys"
    ADD CONSTRAINT "Entitys_pkey" PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY regulation."Entitys" DROP CONSTRAINT "Entitys_pkey";
    
   regulation            postgres    false    312            r           2606    19106     PatientQueues PatientQueues_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY regulation."PatientQueues"
    ADD CONSTRAINT "PatientQueues_pkey" PRIMARY KEY ("Id");
 R   ALTER TABLE ONLY regulation."PatientQueues" DROP CONSTRAINT "PatientQueues_pkey";
    
   regulation            postgres    false    304            t           2606    19113 0   ScheduleAvailabilitys ScheduleAvailabilitys_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY regulation."ScheduleAvailabilitys"
    ADD CONSTRAINT "ScheduleAvailabilitys_pkey" PRIMARY KEY ("Id");
 b   ALTER TABLE ONLY regulation."ScheduleAvailabilitys" DROP CONSTRAINT "ScheduleAvailabilitys_pkey";
    
   regulation            postgres    false    306            x           2606    19129 *   ScheduleCategories ScheduleCategories_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY regulation."ScheduleCategories"
    ADD CONSTRAINT "ScheduleCategories_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY regulation."ScheduleCategories" DROP CONSTRAINT "ScheduleCategories_pkey";
    
   regulation            postgres    false    310            �           2606    19171 2   ScheduleCategoryEtitys ScheduleCategoryEtitys_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY regulation."ScheduleCategoryEtitys"
    ADD CONSTRAINT "ScheduleCategoryEtitys_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY regulation."ScheduleCategoryEtitys" DROP CONSTRAINT "ScheduleCategoryEtitys_pkey";
    
   regulation            postgres    false    317            |           2606    19150    Ufs Uf_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY regulation."Ufs"
    ADD CONSTRAINT "Uf_pkey" PRIMARY KEY ("Id");
 =   ALTER TABLE ONLY regulation."Ufs" DROP CONSTRAINT "Uf_pkey";
    
   regulation            postgres    false    314            �           2606    19189 ,   WaitingConfirmation WaitingConfirmation_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY regulation."WaitingConfirmation"
    ADD CONSTRAINT "WaitingConfirmation_pkey" PRIMARY KEY ("Id");
 ^   ALTER TABLE ONLY regulation."WaitingConfirmation" DROP CONSTRAINT "WaitingConfirmation_pkey";
    
   regulation            postgres    false    321            �           2606    19179 6   schedule_category_etitys schedule_category_etitys_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY regulation.schedule_category_etitys
    ADD CONSTRAINT schedule_category_etitys_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY regulation.schedule_category_etitys DROP CONSTRAINT schedule_category_etitys_pkey;
    
   regulation            postgres    false    319            v           2606    19122    schedulings schedulings_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY regulation.schedulings
    ADD CONSTRAINT schedulings_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY regulation.schedulings DROP CONSTRAINT schedulings_pkey;
    
   regulation            postgres    false    308            E           1259    17545    fki_PrescriptionsDocs    INDEX     c   CREATE INDEX "fki_PrescriptionsDocs" ON public."PrescriptionsDocs" USING btree ("PrescriptionId");
 +   DROP INDEX public."fki_PrescriptionsDocs";
       public            postgres    false    255                       1259    17546 "   idx_attendance_order_createat_desc    INDEX     g   CREATE INDEX idx_attendance_order_createat_desc ON public."Attendances" USING btree ("CreateAt" DESC);
 6   DROP INDEX public.idx_attendance_order_createat_desc;
       public            postgres    false    230                       1259    17547 #   idx_attendance_order_updatedat_desc    INDEX     i   CREATE INDEX idx_attendance_order_updatedat_desc ON public."Attendances" USING btree ("UpdatedAt" DESC);
 7   DROP INDEX public.idx_attendance_order_updatedat_desc;
       public            postgres    false    230                       1259    17548 "   idx_attendancehistories_carelineid    INDEX     l   CREATE INDEX idx_attendancehistories_carelineid ON public."AttendanceHistories" USING btree ("CareLineId");
 6   DROP INDEX public.idx_attendancehistories_carelineid;
       public            postgres    false    218                       1259    17549     idx_attendancehistories_createat    INDEX     h   CREATE INDEX idx_attendancehistories_createat ON public."AttendanceHistories" USING btree ("CreateAt");
 4   DROP INDEX public.idx_attendancehistories_createat;
       public            postgres    false    218                       1259    17550 +   idx_attendancehistories_order_createat_desc    INDEX     x   CREATE INDEX idx_attendancehistories_order_createat_desc ON public."AttendanceHistories" USING btree ("CreateAt" DESC);
 ?   DROP INDEX public.idx_attendancehistories_order_createat_desc;
       public            postgres    false    218                       1259    17551 !   idx_attendancehistories_patientid    INDEX     j   CREATE INDEX idx_attendancehistories_patientid ON public."AttendanceHistories" USING btree ("PatientId");
 5   DROP INDEX public.idx_attendancehistories_patientid;
       public            postgres    false    218                       1259    18555    idx_attendancehistories_userid    INDEX     d   CREATE INDEX idx_attendancehistories_userid ON public."AttendanceHistories" USING btree ("UserId");
 2   DROP INDEX public.idx_attendancehistories_userid;
       public            postgres    false    218                       1259    17553    idx_attendancehistoriesstageid    INDEX     e   CREATE INDEX idx_attendancehistoriesstageid ON public."AttendanceHistories" USING btree ("StageId");
 2   DROP INDEX public.idx_attendancehistoriesstageid;
       public            postgres    false    218                       1259    17554    idx_attendances_carelineid    INDEX     \   CREATE INDEX idx_attendances_carelineid ON public."Attendances" USING btree ("CareLineId");
 .   DROP INDEX public.idx_attendances_carelineid;
       public            postgres    false    230                       1259    17555    idx_attendances_createat    INDEX     X   CREATE INDEX idx_attendances_createat ON public."Attendances" USING btree ("CreateAt");
 ,   DROP INDEX public.idx_attendances_createat;
       public            postgres    false    230                       1259    17556    idx_attendances_patientid    INDEX     Z   CREATE INDEX idx_attendances_patientid ON public."Attendances" USING btree ("PatientId");
 -   DROP INDEX public.idx_attendances_patientid;
       public            postgres    false    230                       1259    17557    idx_attendances_userid    INDEX     T   CREATE INDEX idx_attendances_userid ON public."Attendances" USING btree ("UserId");
 *   DROP INDEX public.idx_attendances_userid;
       public            postgres    false    230                       1259    17558    idx_attendancesstageid    INDEX     U   CREATE INDEX idx_attendancesstageid ON public."Attendances" USING btree ("StageId");
 *   DROP INDEX public.idx_attendancesstageid;
       public            postgres    false    230                       1259    17559    idx_chatmessages_createat    INDEX     Z   CREATE INDEX idx_chatmessages_createat ON public."ChatMessages" USING btree ("CreateAt");
 -   DROP INDEX public.idx_chatmessages_createat;
       public            postgres    false    234                        1259    17560    idx_chatmessages_user_id    INDEX     W   CREATE INDEX idx_chatmessages_user_id ON public."ChatMessages" USING btree ("UserId");
 ,   DROP INDEX public.idx_chatmessages_user_id;
       public            postgres    false    234            !           1259    17561    idx_chatmessages_whatsappmsgid    INDEX     d   CREATE INDEX idx_chatmessages_whatsappmsgid ON public."ChatMessages" USING btree ("WhatsAppMsgId");
 2   DROP INDEX public.idx_chatmessages_whatsappmsgid;
       public            postgres    false    234            "           1259    17562    idx_chatmessagespatientid    INDEX     [   CREATE INDEX idx_chatmessagespatientid ON public."ChatMessages" USING btree ("PatientId");
 -   DROP INDEX public.idx_chatmessagespatientid;
       public            postgres    false    234            ;           1259    17563    idx_cpf_patients    INDEX     H   CREATE INDEX idx_cpf_patients ON public."Patients" USING btree ("Cpf");
 $   DROP INDEX public.idx_cpf_patients;
       public            postgres    false    253            `           1259    17564    idx_timelinepatients_patientid    INDEX     d   CREATE INDEX idx_timelinepatients_patientid ON public."TimeLinePatients" USING btree ("PatientId");
 2   DROP INDEX public.idx_timelinepatients_patientid;
       public            postgres    false    285            <           1259    17565     trgm_idx_patients_biological_sex    INDEX     t   CREATE INDEX trgm_idx_patients_biological_sex ON public."Patients" USING gin ("BiologicalSex" public.gin_trgm_ops);
 4   DROP INDEX public.trgm_idx_patients_biological_sex;
       public            postgres    false    253    2    2    2    2    2    2    2    2    2    2    2    2            =           1259    17566    trgm_idx_patients_cell_phone    INDEX     l   CREATE INDEX trgm_idx_patients_cell_phone ON public."Patients" USING gin ("CellPhone" public.gin_trgm_ops);
 0   DROP INDEX public.trgm_idx_patients_cell_phone;
       public            postgres    false    253    2    2    2    2    2    2    2    2    2    2    2    2            >           1259    17567    trgm_idx_patients_cpf    INDEX     _   CREATE INDEX trgm_idx_patients_cpf ON public."Patients" USING gin ("Cpf" public.gin_trgm_ops);
 )   DROP INDEX public.trgm_idx_patients_cpf;
       public            postgres    false    253    2    2    2    2    2    2    2    2    2    2    2    2            ?           1259    17568    trgm_idx_patients_district    INDEX     i   CREATE INDEX trgm_idx_patients_district ON public."Patients" USING gin ("District" public.gin_trgm_ops);
 .   DROP INDEX public.trgm_idx_patients_district;
       public            postgres    false    253    2    2    2    2    2    2    2    2    2    2    2    2            @           1259    17569    trgm_idx_patients_name    INDEX     a   CREATE INDEX trgm_idx_patients_name ON public."Patients" USING gin ("Name" public.gin_trgm_ops);
 *   DROP INDEX public.trgm_idx_patients_name;
       public            postgres    false    253    2    2    2    2    2    2    2    2    2    2    2    2            �           2606    17570 4   PrescriptionsDocs PrescriptionsDocs_FK_Prescriptions    FK CONSTRAINT     �   ALTER TABLE ONLY public."PrescriptionsDocs"
    ADD CONSTRAINT "PrescriptionsDocs_FK_Prescriptions" FOREIGN KEY ("PrescriptionId") REFERENCES public."Prescriptions"(id) NOT VALID;
 b   ALTER TABLE ONLY public."PrescriptionsDocs" DROP CONSTRAINT "PrescriptionsDocs_FK_Prescriptions";
       public          postgres    false    254    255    3650            �   L   x�3�NM/�KIT�/���<�8_�-�(7�$�,�ˈ3$5'5%31=������|.c�Pr~^qiNI~Qf"W� ��^            x������ � �         :  x�u�;n�0Dk���~%Ru�`�-�$���?���N��#g�4$1!�^A��eA[�g�n֍���T��ǀ�.j3�n�-J��N��Ο��>�o���0�aȝ[i�:>�DG,$Lu3�$��d�͌�ӈ��Om�4���L��p�=���P��%��S)^�|M� ���L�	�d|�(vȋ������ ua�I��.Q$L�.�^P��)dh��$�d����-v��Y�����ډ�J�3�mr~�
#�ƥ�X����b۞����q�H�Ii����<��9~�
�s"���R����pI�d8�2M���            x������ � �           x��WMo�8=ӿbn{iR��[��!@v4m/�-�m�D*Y���!�Co9�1�c�(;��f��e�!��f��<3���3��WO�
�8y��ϲ|'�*�7�q����s�,×�_y�G�?���Dz�����sl[ b�F���_�'>8e0���.�1qA�L��d�%g"G�w��B+���*�����쨰�5ۿK]�c�@7���)x��ɱ�����N[RԨ����ݤ�DĦ���`�犛~�	4V\���b����t�"|�Csb>K�9g|�#�0��Q�#2���@5�G��������A��,Kf(��x���4�X��Z�r�������&�q����3Z�V���V�d�U��|A���]ZIm%��b���s�C�����n��-�v�Ŵ�N~�p���b|W�ġ��k�N��os� z��>�Vǳ=J��'�eyxva;��y���馭7T�M�!���d� +m�6K��$�i�S~xצ��6�����Rf�>���xٕ�ԍ��j����V@KC�Y{kv`�]����k�؁����l�*I{�Q#�8؝�����9������}��H� �^����N+����d����V�E2p�jU��]����HmBY�s��r��J��*����ڶ���.��I�c��V�jx�B:�P�ã'W)�n���(�%o�srH�b48���
nK��޶��֮
xg�V²֨�Y�>�%����u`V�}��!��q�o1��|N�9��$��|N������#�n�{/x�Gx����Fb��:�FRi;��B���N>3�f�ńD2K1�b�|���ȟ�8㘂��s����Zb�7�>^���l��J$����־$��1cW�ӣ����䏮c��x1D�DX/&�#�c�.�ޜ����� F�eE����'�'>L|��À/���wq�~B�`58�5�f	��t����!�O��	{
�p� ftI6�ŝ����7��3��G�F�����m�z긭�9�Fvn4z:�	�ţ|t�F��)5         |  x��Y[v���G�	��R�$����Ɂ@pd��d�`��OV���U�z���\��V�]�n�ݡ~|��m�6������n>��g���}�8���{+���;���� ���U0!�*� (�]��B��@��A�AvV,I���˧n���F�2�~u�j�}0+Ajg>�9�������	K����^����e�d���� �����3�LuT!��٣%�bd�[����(�&����ko���Q�@����C��\P9�5@L ��TI�x���_6���8ʓ���D��W���p'�bƉ%[u�_G��2a2�o1�A@5��N�ha� ��� ��3�"�ĔC���T����TZ�_���b=oFy2��:�1�"�5��7���!kd��1��"���m�C�B� �>�bv���ix�:��<�L�s�[,��v�A�aYX���;�ߐ}�Xp��x#�� ��*-!���y:к����w���"_F�!N��"CC��!䈤Dш�Iֱ�G�l����y��+W�S����`�R{��DB67�#݃��8�!��Vl������g���>����(W&�/�C�*-��3ԓR��*4�CZ#TAM8�J�� 6�{e�;˗V@=�|~��dz�y�,�8����<��!����&�r�R:TN���}�I���*���Urj��\�L���5�`
5tj���Lꃢ�B��{�/Ո�h�@�U�+x`w��F��p*���<r|���.p�d��� I3��	�b���dg��P,�0?}5��v2�nȃ�s�j�r�L�"TB����d i�OTo���z���}V���j7NCN����[��,�&��S����;�/]| ������6G<�g���7k�/F�2����5QEz[l� L�N�4�sH�<�B�c^!M� �_1;ʆ�:��Y���d��q�[ĝ����V�ϕt�Y�[�'��.�j��3�8�,m˸M��6mQ1��.Qb����Y֛�X�4�����������U
��=h�s�j��5�ac�T����.����L���z��Ǘ�g+Z�q��T�_1�4n��z�'�A柀Ø$�H�I�!V�^4s�{V)�X�>Q�έ>F�2�~��KAN�1��V]�!>ɥ��Q ��߶�������Y�%j�s����>˒?_g'������L�_c�Yڭ���!4CL���;ͣ���iEv��}
,3v��gg�R�PX�~�r�yS�>7���������md�4�U�2%��S	W��-�-[Q�;9�Һ��R�@�/W'8�~��͓�W�glH����:k B�##���)_��)�՘{�{�-����6��è��L��o�ńvtjM�@���+<n�@�S����l���v�W�L���}@ۦh�x�] h�b4��w�!������Y�/�{zn����.���T���x3�ߥ�:��nP��+^׾�Xo�O���Y�]��<o��{f��'�nM͚W6����=N(%�F�_���׸)<�~� ��'6j���@���I3wzg�U?��>�d�ݯ�ܵ�*���}��*���u��_�ϣl�LԬ<�?���;�ع&��� Vꎊ?��x����)H�Љ����YV6�aϴ8��(W&�/��g��ƝTbB�+�.alo"��n� 6ϑ�����3����λ#���L�L�I�nM��Ȋq�����9�ɡ�5�K���KG�a2�b2��9ik��2!0��B&N�)3�GH������p󼙿�|ٕL�L�E{�j��q��~��P{��+��@&�A<��.��Y{�9�_�h�W*S魋]7�u��R��� 9DIxu8x�ڻMg�)��o<����}�OU���ώn         �   x�P� :�0}�c�]���^B�@�2U#YH$[5�Q(��a,A2BP�\F	,��F�	��<�u��O�.�Jذ[��,�2� �x�f��ˑ2�؁�Ö,�܊z<7�)�דH��ͩ���Ͽ�~�~������s�腾`Y2>7w�6kd^n��?�s,L      !   �   x�%�˕@!Cפ�9
��e��c�7o(�n�.�ka,��\>��$Q�A������;D�]b���T.��W��5�J���cŒdSnH'�e�i�E���A2��&
9���(�"���Ҕ�O��I+_"}��b�Q�A�����.�-��!2�{�M�H_�N�-ҏ8�5vh�s��0��O���ށ��|��?QX�X,ot���}"6�U`�v�k�~����m*�*���/�
���+�Ӄ#e~������L�      $   �  x��YK��6]�N�K0Eď?��ۙx�=��I`��Ȫ���0|���#�L��(���F<㟈a@~���?�:!�G '�HFĉC�����/o��׻����JX��'���	q%/�q����|^�����+#���q
!�]M[�c�7��t�r�0
�\�.z��w�혺��C��	
��.�b�]jq���"\��y'H������t�R���E��OO�G52��N�G���z��{���C�\�A���* 3n�FZ�D�z�w>/
k�ݔy�8��
~C��\��˒z[Aߊ]Vw��u��/�����?������X��]I�#��D�v�����`g�k\LhMT��S�~W�Ƽw����-������˧����O�}>�>�o�������9��.����^nח�;�� 5������#�{�i�A0���B���ܭC]�%u�*��a�,�Ғ!a�|rI0�a�G]u��	;e难�vL-<��擃Z�.e �+�z|+� ����98���@�l� ����~�!S��.��K@]����_���K%��O���F�b���*O�to_�&����+3y{_uJ/�gn���V��&�%�E�9a�;y���FQP�����
q5<@�W�>h�@3����}��*������sX�(�ٰ��M�;��[n�g�<�����0�J�cn ��s�@@Tl� Z��N�y?�#��)s�v�X���(�3>��u@t��R)k�7�Xth����ڣ��-P�	ϛ4i��~���em�9�$����F�9�� X��F�DӋQ�y����3���������N�B��,�ĸW-�l���-;eZ]Q����$a̹�����:���"���,Z��4Z�ynl��\�S3��Y{�	��8������Bm���:��T��^,q��&�A��jغl���yp�y8���v�p���Ӫ+����9��k��a>I�{���*e$K�k��e�����0Y��1s1&�;3E�혺������,YMd�Ho�vL]��^�NG�i5�{s��1�p�M�=|���k�;@6\�����_��#^��w �(�Ul߀�U�>]�du��䪽h����؎�����=�d�D�<Бޖ혺��M`�?�A�I}-�[W��^��w���#h���`f���V�}�]�����o���wD��{=��g �c�+۾�JԪ}'%��͢�3�<q�{nQ�� j��V��������������z�|<k�z9���f�/Gg+L�'�F�	���ʘ�Z��do�!�7�K]�d������k^S�};:����߳̕��^=*��j�ٶ^��"��o�H4�W����m�y\ ��06�U��Z��Q翷'� ��E��1��]Y�-ɥ���C��Ri�T��D�'�$�ϋx�AȌAՃ&k�����X�k��%@Gw�9�O}�	���
���>;��i%?��M��x_?Ly���d����1�?�Ȳj��x�8m&�Q0W���xs�k_������L�S�[�hP=�U.n+�0
L�d����O�2h���T�MI��b}���D�y}4<�*�ا.*�(���!�5=)���W�A꟱�P��A+K�Bw��p��d���l�ʁ��)*t_�mxQ�Qxu�F���~�K8�z�+N���GNU�K�אt�E����d3�=���fAU\gJ�,C�:�o�煤l/5aa[=�l��RiN~�X�T��w��l
=:�@y*,��H�£l�Q���e_�j�8Ta�s+ks̸��J�,h.�H0i5�V�y5m�]d���@^֎�����`�F��bз�������[���ϡ(t����0.g5�b�^5��B޵�$�az&f¦ᏽ}@�8���D�\�Ҁh�� ^��z�����i����J���$9u����q�X�O����O�[��      %   X   x�3����K�,)M��K��,�4202�50�5�P0��25�24�3�0�42�2�tO�K-J��,.IįԘӵ 3%573?'?=���=... k!      (      x��}YocG��s�`�S���}I���Zf��F-=@c%����$��~��a��Sϼ�k��9߉���A�RV9����v�	ވ'�g���z��o��g�gJ(}"̉4_*�R�N��y&��g�6 Bg��Q�C��Н�V�L:�\�g���}w���?�'R�4񥠟1:xK��B ,��y�(�Ke:�v>-�\Ah�9�����NEZ�~.�g�f	`ھ�SF���p ��&xK/&��������o���b�M�~}��|���t����z�b���N��͒6r��O�,����e7��jr����On�&7��bI0����d6�l����ߛ�rr��~3_o�k���ɛ����
����v&�F<F褢�A�zH¢sR>���Z'���p� ���������j=������0�5cB7�k���+��a�L��ֆ��Qhް�m�0��(JI�)F�Q���HY����u	����8¬0�_V�������f3�nW_�����
�b�v>��$HC�nkT�*�Ƕ@g���k�mtLH��`ӌ!�iymM&B�Fל.���{F� ��kbՐԝ��C�Ħoͯ�,WU|)�4{(���))�U����K�_Z�	bu��y�f�z��ɝ�oڐfꂈA[5P�0��'�X��VS|�OM�,n�QR�4�<��.�s6���y��Gwڒ��:��ϊ�����j�-�8����wB8��>�`25�u�SuHU	�_J�9m���P��U�th����9e�K�D	A�%B��!K�BG2R:y����3RE�eڑh@؎�����#�i!�',F��;'뎥wڕ�!�cփ$�!B���-B�S���#n~\%v���|��j�EO��J� �y��Q�1$;��d�P,��Di�!��
��W�Z!���ʒ>�3B���!�)�It�CSB�Nb�	}V��,��
�7y�,'�b��&jR�,U͒�Y��Yguպ�^��ؑvh]b��B]��R^I[�'}��p�с�Õ%��W)�Ik��ʒk��2COK3��A���(��Fꄐ�>%}��� �F
���d�6[���6�J�$�Hgh���Lkm�K	��C�JM�
)�Ҹ�_u�K�֮C(�>�l��K���� ��� \� �\�.a�M������a�L��҈��[�3G�UB���I�j�<����D�-�*��={h��tV�U+e_cRƻ����W�/B��ֹJ��/��V�����s:� C�E���Y��Y�ouj�)���7S��cH8�Lc���JԻ�+� ���+Y�7o�d4Y��Q6n24&�	+�2}�i����#�3��Di|���q$�OgȔi~"h��`�Hj	�_НVJ�&�ʨf����`��&E
&I���ɑ=]\K�%��s�˧M��c�������k���:qc���N
?q��ia�BL��7�M҂o�x�O�D5H��)��k��1]���7��I���26����d1DOi�)'5]-MI�[Nj2W�8��\9�ɓh�iY�_Ω92�8b��N=M��I���8b��lu�G�p��!#A�4�G��A�?��:���(��U�RC;o*��~��݂<���Aj���g��U�as���'��U��y����r��,��yÄ����:[�ڰ��
�C�*\�Wj4��`I�Cfrrm�,��lAj�U��4��Ro�.���nXh�$\�� A������X�U�A�Q�����B������{��AY]��IZօ�M\ȕ��w��>'�ۍ2���	WC�'��z���H��`wW��y�m�����j�X-'�%ݦ��l:���3�������jr3]ӽ�l�s�b����LK7d�	㳿����P^�#GHe���ϻ�P�DL6�2�����kb���ie?�¥|)��l�y�  ����,h�n�vd%?Y�����v>YM.�ׯ&��Ͽ�\l�7��_}��I���l�����ܻ[�ϿZ/fn\��^4��;�[��%���;a��m����qA:��M!d!m���؀p�T9���$�%Co{�]�'�S�^�Ӵ�}��Y�d�]O�|���d��s�+�k">��N�t�|ѥc��h�uL�/��_a`G[�$&�KN,�wn�pQ�CD�HE�T��|�&@�������V­lƦ�0�	��ﱮ��y�:ݘ���_/��*�/wf�y� F�N�ed���[�F��^C�ɨ��0�4D�ѹ��}=�X�`Z,��ߓ<�615�u�DX
�<�Lh�tv?�d̰X>��7����_'�9��u������8�u*�od�{ի<A�2[�Fy�i��8����3��֩�D�4�6����dԇ_�$�Hݔں,x�g�v,�����ZɤM��9�R��\
�w�=�Õ�!���F|�if�c���e0{�H���F�� op�+��.��juv{Eǿ*&[�r�H�KK�澓���N��\���'�=@G)�JށX���\���^c��[��Ҍ���f�w~}6�Z^_Lۚ����/���5݀�6�'����zFiM���u��� Pz.�0l��*V�����oAu�Z�Y�+��b���J?����%$[J��Xj -���3��R�$Ybh@88i��Ŷ�P�Ņ�����L�,$$�Y���xd�y��ǐu<�<��؇�d��X��<��<*)2��_Џ���d����3�7�/(�"m���m�0f�=��d~&n E�w���9)�I��JR�q��9�e}�s<��2��T|V��/�f��P���eLlJ� d�	��Cl��N)m��Q2�`B\��>�����l��-$Mv��Ø>9��c	L�]�ϧ��?}���|��D/#�B��,��1�#�r��?&7��|MX'
����t ��X�F*QN�Ji';K፤����������AQ�
�Gw4D���BЅ��$TLƖ��L`u���֨w3�\�#1�p��oB4F�³s�kh���GM

iF�U��N�8 ���2��I��{&G��B{��%��L��Cd�+�!<�y�?�X��{��z���_,�ڢ���-��7Jf�f@8yF�8 �S���Ymz�!^�lՈ��5D�^����޶��d`	����JAOV�Zۼ�ϙm�u�5�8:vu��ǂ������I�m�����M��`#T��DB )�p܋�r5޼�񍿲o���$90�e��a� �x�t�T�ӂ���c/�3�
+$5�V���
Ⱦ�_�6�r|��w�+���r��σ�Y�L	d�>���ҿ%�4ݴvC��d�� 	/T=��#�QICw]b��)��S����,�)cU��ڂ��~�-��މ�+��a�"�Hۊ��'�r�B
���*U�jڄ�}6�L$��͉!6� �	;���q0wg�5���V�'���ĳt&G\��}HKp�b(]?�Z��),���|�ff�Z#r`�jN{�)�gy�'�/�U|z���o����M7ē������\|?���L��&3��ݞ��_�?Jz�r�<�B}��Ğ��Ư���K���6��~��+:o�0�_�|�I�������&�;��znX7���jt���'�r��"�7ɊSc����b�
�Dޛ��V_��i�����p��P�"��˳��)�ܠK����+�&��Y�[�[�R�1I�V���+��wW��L�����n�����#&��_o~9!!����xs>��^����NO������n3=��d8���j���ӷ��ѯ�s��O�y�O�:�'��rv���TM�?v���e�wG�{��<��Q;$?gI(�ƍR]b���3~R�1Li�m�}�z�Us:]��������b���Zf{}>�@���?�CVw. V�����P�v~��x�o_]T��v$�buR�D�mg��b�!��ȡX�tF�E=>6��N�t�������������CM�`f��R�ٽԆ�v�iy5�!���{�I��ɯ>��L�V4P� ��\�%F�S��J�'�
��W�}4���T��{���N��5���m�    I�Oz����@2�SjȈCX�|43�.���,����i���;�iʕ���e���/b��פ!Y~�L[�-�&���$�,��pޢ�I?����%S���"�5�j��M��]6��\������IJx7��A�9�����NÓ���<_�����
��n}��|���D|m2C��m��n��#d)d$ޓ�o����(k��^!B�D���ʾZ�mđ�g�-��tg=o�'H�:G%߿�2���������&�Az'Z8�(��}�W4� �[�\!T/��cA#9�:���%��ğxp������Ó�)_�~�F,|V����ү�(�x����S�Mh�x��K�����$3��J�	�?����s�-K�y<5�$�y<1S�O������;u��{��-y�Bt�
�#AgU����G���#��a"�8��@��+q��K#�CH"Z�>O�|e���u�i#��ǞS1V�5�ݗ���+>��ޚA��X�H�!\۴�`�����cw@˫�w��E��sƈ(��ӯ�!E��r�y;�:�@P�Y|1d�a�3�5��u�y@(}��;�H5@,��U��`�VxaÇb��P�@U�K%�He2:���=��1z.�:�m�����s���C$o�N�i���Y}p���l$v���BO�!�$�a\����N�abV����҆�����H�v��uy}dR����ɴ;��#Җ�
����Bn+�N��X�H���aUN����SU*��o*ʂy��K{�����Kdn�=<�����Z5/B_K�u�t��<]�[)���j�V1?P�����:��������BVl�(A�D����z����:e�U��)։xYS*�S��;��4n.b�7ޔ��pp2'9W����>	�m3�Y��CY��ߗ�l9 (j-Bc�mDh�j�;��X:{b���Q�� lT-�]�EF����.�3����&��qv!WVȯf�*�xf�#o���;a��0*�c�&ԍ9�_|���L�!c�Ӷ�B{"U^U*��{Z:P^pM�)6�������ģj�)V�G��z�7����\��d۫\�B��y���_V�D�O#�EȘ'V1���FzL�QJ�{Σ�	RK�R����<I�Y���U[s�0�눮R�*��9��C�k�`���~��BeŜs5\a��޿T��	� ���5���Fm$2�\9�8}j)j:�c*���\yR��su����7�������w����w�<�շ����￞��?��ד�~��?����?eUB4MW��T�z��GwvJ�B��y�^�����Z8Z�}�sp�<ث�/p}9�N�|Z�
rA��z��ʡd�NDhl��=V��@]��C�Qa���r~M�%�[���.g?
/d~�?} p�:4*j5Y��]I���Z��W��f�H�DyۻX�@��29�߬nS�H~X���-��z�������G��;�o?���r�PZ�Ѧ^LVdU�=4?;K�a����D%.|��K�l�-|��?Kk�óA����G߀ 5Jɔ��ɈC�H�Hv�h}qN�f�?�xO�j�^m�o޶pnQћ�f%VY1#�U���W[�	��y���
�#��9xB�ޱ�Ξ��At��&��U�M,+��l���/R����Ο��7���+��x2R� ]�B˥�H+7�(*&A��� �߾ݾ�nof��?�"�1JQ��J3�Y�2(������;O��ӳ%� �E���P0�Z�\/�d����%�C��X�Y �����:O���1k�x��K4��Cx�q^ڜ���yp�&������}�j�Rǋ}��,_���8Pt�:���.�������	T�ڍ���zH\R=}��=�6Uh����2���O�q�/s�&#�����R��ڌ-.@lJ�@��[WKeW�ŕ�˕�(UIă��C�U�gy�׊���s��$��%��p��|kIq��w�D�K����6�<�.� r��Y���M;0ς�!���s��d?%4��K,(���D�� ����7Z_��?6wFv���k~�;�T&�{�M~~�K)w��6Z��)��� 9�����L���]�H�Τ����9d�I$�DĻ�+d��#y�
A\���� ���n'2"���9�-fK,Tk�+B(��`T��K����X��@����R��(#�������,�V<�k�k�\.PA��Ҏ3�2l�����ͫo/�>�_SW�&�շ���@�Ɠ�p�!<cY����<�X�*|gTt�'�@��|ċh�d�g'�9�4�NϪ\��x�ͬv�3��b���r�$��3����1�[��
gX��J�]=JUFBZ��L.FK�j����q�����	nhAH&��@ƙ4�϶�թ���{L��4Q���d�;Ӟ��G(��~��=W�G�TRM�<���9��Q�����w�p%2F�#�)��)l��Hixw�W$6�}��y�[�0���ɟ�h�b�$ 1�y� ȡ"�E�پ:V�*k��5�Da�z�c�:����	� �Bs���<����n������o����h�������9$J�Q����T7Q���lEj&��!C/l�	e���C�5�3�\�R����V����÷o����\-�*L��Rif��d�9E5G H�t��
�Z,Z{h-�
��<������]���~�0un�3�x�!��P!'?��#	��K����v��p�?�:T:�H���2Y���<��URz��]qoQ54�$�ho�V�1S�S@,���5�p�+�oni��Y�oH#_�+�e�dY/�ty~{���"�z��$��9z�����}*�Ȗ���<Ǽ�}L�4M+7z�{�����M��Zꉲ��B�t{"g��!�IB$u����`6M�
A�?��� j��ЍFy[�H��Ov�(ًMa(AE����ϒ(��I�x�/���������R���O�}�^�,�� h�ћ�^4@�IU�p�q@�4��Gy�l�!�&WTA4@p�d��r(rY��K�����!y��ж'�r2=FH�JI�5�;o")Nt��yR�G]��υ��*�
�C�Jm��{ UM�J��6wdx����IQ��2�+;�"�ע��lb0�H���O}:,�������܁OyW���礔���hH�r�b��%@�%�A�}>[����Qq�A�Q�Kdn����A�4!UXV\�/�#s+:B�=�rZ����;5!AKdy-ۻ2$�h�����Qdqe��������!�!�r�.������}iO5���szʗ6{6�''K�vp%b���PG�&��Γ.��H�^�ˉ�E.���=�m�%�Am�SMn'I�B.Z���I+$��t���{9������t������=ݠ�a�\݅���Y�|?*(�P�h0b�������rU��Ǔ/��R��!�8Jo�mL��ǩ�O4{r�<�fu�J��|���i�|4���Cl� �CUR���H���v����R���c領}!�~��j�N�͵���q<�/��es�5a����R4O�d��� ��++�����m���Ȧ��q9b������:����ct/��H�!%��l}kǆ8,A��NkDKdA���&YQĎ�x]9�=z�B,�p0�����y�tƁ�d��.�'�`�KADE���G�t���L���˞������q��7��	S��f�����?���.�y�z�Zc�q�<v}��.W$�b��?��l�*�E���}�nQ��I���um�cK _x������u8{}6Sg��::]a]n���l�Σ=n�J�#�,�]/�+���N���>����e�iy�i�\p�_�[�"���+�v�(���1mm��k��;Q�+��,8��Ǔb^��T��;�CǾqi$Zz��qR�%���D����΄8��3��:5&awz�L@Z ��"��1{��B�������/!�ޭv���C�1"�1������o^M�)�r�2{D�x    /�z��e�Q%�C��Bp��ָ�ܿx��;_q�B�컕��*��E���0D:��hHC�&qǩI���s�������t#�q갌�(��hy�"�H�*Bc(vd�#{���`9��8����ZZVy��'�zlV��m-�$��k����k~ ��,�H��%.u����2"��8��룗�H�m�^��B�y�����Ƹ���8���$�Bp:�4��<�kM�\�&z���_�5�&����Ύ�?���5��B
Is=t�KN$�`�	��ol�;���i{����@#�{!?)���ǉ��
�>|R"r�R�ro-cb�$�ϗC).	e��3��O�̧Mm���&�4- :�Q��\uŒ�eS�_�p-mv$j�Y�T��,|�	{����1�2�����m�}p(����~zn.Dsy�#���?^� AoX�]c�
%б�����$�럧HCT��"/i��݁�̦���ѻ{?�,��WO*������������(�U)���"7B�ƂE�#IB�,?��o��UI ��!T�P�F��U�y�8�(9��k�w�DC.ᮕ.E�?�ia�7�mdM�X��e���0���r¤6��5%�h�:)tX#�
�y�~��.t���Ԫ�� �;m}kY��G�:�r�S��6f�>�36#V����-tU�m�I���L=d�X@�W"MԱ{�	U5�`J��-1�*EA2���H�/��;:�X��D��c�JnݛW¶V(,�������� t�4�T����a=$uKo�x&���C��
&���<�
��	'*�HW���ZޏA/5!�A	/{T����7�F����V8"y/�X���)&Y��R6TLi�i�dA�U�a)GAz�j�`e��Ņ<{�ak��L=���k��f2a׋��x(� ��F<��!9B�2�H+*���>RY�!�Z!�V��̽�8�����Mk��.\�Y×彖:��C�(LKd1����L'OF�S�,���'kEޕ<8�ʖ(��U=
�p6x�ԑ�Y������� v9�c%Ȓqd,��<�~���3�n�h1C�Ը�~T��j~�(;������Ӧ�?ϵ��ˮ����N�׎�D<:�=���{�2"���@��`���#Z-���c�=2��W˭\42����葮Vg�>�� ��h�Ƴ ���ڲ��1��;�i��F[�l�V�w�&ܷ�35�U��q��0���Hj"��YnIfz�����S�^���,�a��rE�Uv�
�z}?��2˹�������GIwm*��V��n\�ig�#�I;[�-����d��v�mYj����G�[.%�c����A[��L5�֮���2�OL >d#¨�B�ک�C�P����$E�fr���^X3?��\M~���o�r\\�n8ڗ�}S㾸�]�o��?�Ԍ�c E��f����yTk�n��(3h !�lUP�|C�ܢ: %���oW�,��q�����=_2&��Ǎ��_�^#�pu[��!u�Z�_�ݸ�G_��A����͎���(v�:@�ֳuǾd.N��_�q�-�a��F!}od����he��\�F�~ks`��0߁��&w}{�Gw�~��=�t�k]�L��tc��"t�G���e)Z������>F=���1�O֞���bf��?�#fB�����(�w;���C�#�����!�)�����}-2��~uJ_�W	��/��O���$݃�~���T�-bGU�ƨ@K#܏�8�(��vyE���h�����I��ሧ}8W֐��;0}uȀ�߭!vdK��:���t=�1W�_o�rz 	:'��ٟ2J&@���.�8ىlJ���)K��
4ψ�#���ƄE�4y�YͶ~������(�z�	�Ԝ�MO����)���!�6i���S =*�1� ��؁(T��P!E0 �{�w�=��ʌ��+�'���M �5��j�т\��C*�P.A�_9.+�[E�Mv���W�7J���~6�9�ܝ�fRB�$�s�H�IEFF��呄	Z���S>�H|�
�,��f�N�i�o��9�:�H@�A�) ~X��:<����R~qP�w4����!��;O�j���@̝ter'
��Lt�_��i2��<�c��D�$!C��䡤A����|�c���r@�%)f��KQ��<>������4H'�����?X��!����}�`m$t�J_1_��/m��`L����|�����(�F�<ү�&K�D$AF'�듴tb���1�s�D]	��;QGǌ+�>��E�$� ^�aE��'��u�ב�n�p�;)}=��(4��'l.�2٨��t�2^�6q5�G1mcI{	�N�a�E��.����j��^Y��`�ESm�'�8Jܧ�H۵�oߣ��tW�/�pW��B�������Iv(��<�}� �����˂�6,�p�ˠ�ξQ�ۣK��K��~һܾ"��7��%�mx�~�D������u�k�P��PR��ws��ĥx��֝�P��~%�lh��Kh%�G�H!;���Y��d�{���I�;D��q�n�V"��ռS]�W��@|Щ�WiHX�)Ӛ�=R��=�ͨf�ģ�u�B���[Z��L^�t�f���0���Y�e��n�w��w���i���tz�X^�7�Fw���|�ٞ�nz5�@����8�
�B�i��_����t�'�3#μ>��Y��e�+-8L��`$l��N~r6o��[��2��P�!����P?m	�d8i�2�rqs��?�?;�BC̥c�h,�V�416WH�&��\��?}��?}[}�8�$�M+��	Q�7����*ƒ�1�1�=}���x��) �B�	�B�gvp6�}���%�����\���:�5#r�v?Lϧ�s�}7n�U.�a����e��N��(���7����A��z��)ǅ��'C�H�WV3"� ��帨�0D���$߈��x���}G��-�������_�}�=K�H��M��k2���횿DƓ��ލ&k$�*�l�=�R�t�O?Q�P�Fq������{ewPh&<��)����ܜ-����7?6WB��
��+чV-��:���/�?�W�d#����2JO@��g�n� >��*����ȭ9"Ǟ�݌��@p�1�}ˈ�̤�?J���m� }��\5ӌ#1C˲j,�G�"l,˵#hW�(����R�����c�e[������&��ä�J���b}���]��؜e1�Z5�r����� �z/�.I����>�}��ќ��������t^�ldh���
�B.�v�8Z>�5V�ZϦ�߫�����K<kO��=@��Y�F�e�cq����
Mӗ*�|��������$��D[���dl��t�cd*��)�N���f��XکhR}y�F
V��:0�I�y⸊B(C�l��D�b��"d��G9�%ߊi.|���g =�n�O r{���J.n�ѿ�^�-���;�_l����*ܠ�$�@�:�r��Cx��}I�q�!>�J�q��,<�>��]���m]$�.���P�'���7�z����qTN���������ν���[���\��\��R>��s�"�0~�me[����Q���?e ���ck1�H�rF�^�7�!䡡H��m@hT��1�Pf�k�;��]nPJ��f&���z�D��G�r��|ͽZ�Y7��R3*��A';)FG���F� 8VP��\�
�	�Hh�WH����=���n�!�Lx��;~c�����앫�uHў1��2Z7���:E^�!�O���;i)p����hi?��1B�Q��C��Ǹk�����vB�2���[e�ݖǰ��IF�Oݪ41r��&L/�½&*�ꂑ�e7ϸ�]sa� 3�8��w�Ę|Q&��G#�5Qs���Li���Dn�L��W� �ǰؘ��)��p�l+0iHs)��l���	�s�2U�=͞u��G+��`����Ͻ5����R1] Q	  ���E5��!G���l�@/g�M0#o~|}���������-�V���,D�4V�ь�,g�O�w��K�X��B����I ��d9��`!h�ِ	���uC�9��s��������W���Oc��3�s���}�#c+��o~�mw3[|��l�0��k�91��ӓ�Zؓ���ta�ܑ�J����}���3i�B
���l��y����S�f����������$��8	����MќN�ô0�b%�p���3:���[�����@���͈��pq��+�U[�a�=#��bےy���=C��e�p�mTƒط9�b������Ĭ]D���j�5�mdh��s�0D���_�g6��@,��Hș
�t�H�4ްC-�� $՗t#g�0x�6KvVo:�R�X�x�ڹTY��*�5�#V@�|<T�G�L���ĝ�����H_ɤ�.�2��V�tI"?Z<�&P��_����Y�L����{��G�n�OjxΞ6�>�;�ii��2������ΙG\�π����B�������uA�rjH����x�BB���.Ρ�B���ĕ�'N�r��`����O�{��P`7�@R�ݲo�R����;d���Z�v���]�J��PD��#��y&T�ܯ���fz�����,듽���Γ��d�ʅ�-e�4��;����My��|�r�?����E��W��t2��7���~-���I�iS��t����_�#�r��?��k���q��_V��)�u����P+�p���aY�d�e�����}�]fC?T��������T��7��+WY�Y�vrI�Y��wKli��n�G�q�������v�
�
9��xS��)�zQo,�1�e�O�j����4ŭ-$aO�W�Q�� "uSL}5Dl�(�2��i�΂����-Gu=3��fC��F4���:��m��%T�ٽ������@����@i�PQg�h��!)��e-C�P��w�Λ߮��.�����|�(CFA�%�����F��!�:���D�=�g��	Xvҙ����bQ�&��ª������
�l~�:Z~D��|��侓BꊾL"�� z�Ο�~6�zK|������o�@�	�B�
ZjK��5��(A��;��yE���)�_^�I�E.$�f���Rڕ%��?�R*v,y���p`FXDo\0�&�S�,�èd-I���T5|���m@�e�o�є�w�n��E2�U�3��I�K��=zdOq��{?V���MA[�s��k~�r֔C�՛��/��������ԋ�3�'F��ɩ���fggB������t'Dvw"�f߲����Z�K.J��R����馦���1�CxB +
�D��O�\�����;���ʥ�Mh� ��k~
5$h,���il6�^�!!Zs�5eTp��e�{-j��O���V·��Ό}7�@�����A��x�bc 	�y�$#3f�i
Ń��uFpɫ472�5ō�b˃��d��4�2!��=�M.�|m�VJE�
#
-�T��+]�4	�k���d���q�nܙ��ۅ��!<.)etAq=Ɵ��sη�:�����)A�q����l�R2)��������5�RQ����M)�	��;|c(vRڨ��^~^�+����'�̼����:��1�"<��6$�,}If�>����ȍ���#��g��<Q\�^���]a�PpUZlo�^M�to�J�3�rf|>�(j�-(�\�Dn��$�t�d�|��l��)�4P޽�}�DC��ۢ��!M�bK�̷�o����|����蟳[ݿ�:�o��?�^N�_���������z�}3��_�������,���zB�w����O�On�$��i�r�پ��g��������|����j�"�dE�_-��l���n?�ϯ�k��{����|�>J�ӿ���� i�:J��DiD��zv1?'���춚��?�U��5�s��Q�
��AE4g%��.%��o�g����Ihw7�矍�}w���z>k��lQ�n-x���VyvI�i�<�K���F�Q�J]j����	�*���u&s�R2�5��w�j}nFhE�|�$"T�����:��H�r՝���b��W�81n�8	^�N���3a��l�ں�ͱn�k��\U��F�f>���^��|ki���4�
�A
��z�4CH�0�C�-���&!L�sN3��H�Z��3�gfcɴ�0�\���oH�B<��~�]�g���p��o�������ѿ����zY`1/:���P+���g���2&ͯ2�0�O��]��k<���J�����a�����^��p"qX�瑦^;�Q�腟����=�:{vr��.�u� M��)4{��L�8h�;l��wϟ?��n�Q      )   )  x��VMo�F=s� 9��l���ZmZ4mN�5��%��.)�7F�����+�X��R�HIN��`��Y�]�Ǜ7o6I����nF�jS���2תnԳ��x�j��I�7��rF��$�Ӯ��Ѷie�󊮭�(j+Z[��8cjYR�����m����e���U���ݟq���]�:��h+9��~s��H��f:
s�T��Fa.�j��Q��KՒ��BW�ohe4Uf�Cki%}y+R)�VV�/.�`S�s�\~�ɽ3���_�dy`|�{��EZ#ca�+[9��{C|ս-�٥8#��jC���ӆ�"y�J[����B�\�@kS(��*��(KN���d�Q�%
YJ.h�B���B�\[6[����Z]p2"M����5��J�+�7YL��&�Y��K�����[S��X�wg�KgH�J7H�g�g$R��X�I'o�E6���e���l��ҹdxZF�Qއ���B���w�;��H`)��h�Ε�;R|�>�,�I2T u�M0���&��D:�([�*o�v�O0�x��bi� o���}���&�Nm�q�>�x���MЖ�jԠ����Ȉ7u�-Ȅ�)\<�sY��E�GFO�U�d"=�$�s����O'u�@ؼtD�Bl��U���bV���τ�)yc�]Kp��s[�V1}����v�+Q�U��ſ��dc�*��&x�*M��*��
�0uwg�l��E�7�W���9@� ��%.���� G����g@O�������^ݽ��P��眹f���|�͕s,{�1J� j�������T��@�	�}*p�^ 9Bփ��b~��&��Ҷb|�|t�2X����V�(�j��Vm�+�:�-�{֏Z���]�jP�A��,�w�s.'2�#�X��Vu�+Ӷ�y.��0���|�D?�c�hW)�;֡���v!�?>ܱp�����}����\o��+D�b�:S56�����R\|*�Ox<�R\�����꧹�Y��v�j�'��ܡ@K� 1���k��B��xP�,\�Sgb��d�F5�iK�z-��"��
r��ױ��ʙ#      +      x��}K��6��Z�\�DX���~�]�e)F�飗퉻A�P%���2�S�N׋r�V��h[�~� � ɖ��.f~��H$�D����'��,��Tf"Qwb-�hw��j��1^p����Y&�J�Q�Dl2�tр>��\e���J�+���X�(i.���Q"ʋ6b��b =K�y-�Bes�5~��s./�	����)��^�] �X����%�_��{*����7�^%r'�p-ü\�L��M�O��;�6;ܓ��˝�2�U"��I��d:;~�U�qЀ�w�J���O��xa�����s I��q�Dz��,S���A&.З����=���w�z��Ȏ�����zA��F��ZGk��e�L��������V�	<=�� M?v��۔��8N��V ���W�62�v|)�5n�	��||�i,3*jH����%>Wbz�-�>r�=^��*�ߔx�:EcQi�7�c��Y(h�:�/��0W�Py����M�P�������ޔ+��e��6Z��=��@����?�P߉L�F���)����jc��3�_���G|��%�u��2N$
U��16>:��!�O�[ӱ�A��8��_ �D��R�����g��LS��@�%t=����]��VY�}����E�_��G�[�c6�2�3��׊*�����T��UB��%}���[.��������U�8ʆ�#7:Q���w�[6e���êOB�3�TÞn�*t�˸L�t�ܬ����B/��(���������X�Q.4,�;��r.l�bw�,���LL!�p��@���Q\?���VyA�/�;�AcN��~j�1��y�����5�>�G��,�]�_����SN�&��r�h�1�g����CRp}��1/�WX�X��L%�b���3a�y�� ��J���.�B�����$�f⠕��u"3�Q&-��#(1��\h S
G��q�����Q+�U+�L{�;c���L�G�J����aA֘���M�Ĺ���/(T�^�]e�ڿ��:�O['��D�iY��>:��/ky(t_�n�m_M/G���	�����6��H`��\���T�98:��E�Lt�������z9x�qa޽x��_��^�xr��/���A�����j���������z{�J$�"��n$�By���Ea���� ZΞBs#Q��!��1A>xĮ�K�pO�=2�r-� Oz�F/���C�Y�'ֿ��~����V)E��1�O��/c���V� ��jGa*5YIt&�)MU�F@ٓk�
�@<��<Y�W�L�{mz��R�x��h�?u��u����F/ADF�%PY��^W���������`�
��N𡥶W��ܝ�z�2�_�W&xĎ���=��6��f��ݲ�Я� ̍�?��Rx�R(3TJ�b��^8��9�EB�������� IU���%ۣZ�B��a�5ZVb^�4�����?�h��2��(�>�(?�T���D���[�ѻ����ƭtY�it5�\:�9|�V�����Mb��;r;�KQ|�L~a>m�zN�ª��P����!/�J�Zh���R�_�T��[�oȳ��C �:�]C]��"��{I'@����ێ��A�V�j����Q��D�{���C��V[8��<N*$�S|��Q&��D[�$�Hfe\X} =�!�x�P�RT��'<����aϻ��D�J`X���?���{�e�:�ӗz2;~����'x�m���z�cg>:?�x�fz�.����-B{�h�F_5g�vC�X�Nօ��\��BG2�-[L�A�^�u����Bp��������`�^�x�>��߶��}���l��Mmag�9��	O���]Q�"t?x���Ê�g���?���ۤ,�5�>$O���a�+�ع�*�?E���!�ɳ	إi6��yD_s�D�=�0Mm��=������
Q�8�����B���{��M�Ez�D���a��@�����'<�u[�V"�3�B��}�m_���3ʅr���L�u/����.����F�9<�O���5SY�����V^->'��?wb�<���M���'I]�N��ȶȐ>�I�I"�0-ٚ��䰶Qkiq����;�ʬޔ���G���<ͩ�=�AxT���P����O~���!'<w?̽PNg���#<H���=�}�-g�{��=���J��Mu��|6�K�����-���qOo��v��!u�3e����mp��&7��&��eJSF�l������G>���d�'O�M�Ȱ����0Z+��[QM7O�礥���C�~$;uD�^T�qJ�l�Z���Ʒ_g�rc�^1gCՔ��`�QL3�2,�{�2M�MT���<��;��a�G�e����	>�P�z�w�L��	#m:1�3X)��1�/���ts���iۈi�tH]��JdG��<���a*��9�h#2<��e�~��op�-'T��v��8�x����\a� �+�9M~0g���&%���1Z�%$�"�6�ܞ�J[6�+|��VU?���/���ىy2;`�y���r��<q���1!O�p]��׫ )����Q&�ϝ�;��!����*��=�A@ͅC*�`CI����yU�Zy�B��ք�)3������"����]5[O�d�|;��٘�\}�)~�����:����
2���lR'}�z)�C�u��d{��:[Ӛ��bZt�Sz�	���a��_���M"v��2	�]zm�T$Ry���c@ni�BQ�p.zߌ�m5�A�|�P�r*$��]��Ï��g�]���N�rO���)j���b�Ӂ�ǐP{���n���a6��� ���i�5ϣ�v{Ȑ1����4���o)�t�y��0�I�}��֗�d�C
���d"��/�?x�~��,c��ɍ-�AB����&�ޫ=��h�|)hA׆#@�������<�LD��W?@�G~,��Đ��:G	P�[���O��AS��v2���.O2�Z��K@��Q�]S752<��x�߅w����BT�OkP\2g��˂����A�
ߓ���;���]��y���]7���\���;&��ƽ�&7��|h��ً����r �����}���Qn����T���{�й�FP��0��NeL��k��E#M�$"��`�A��;���=���~��Tz��z�]�k�D� ��f��tGT��>��+j�|���Ff��2�Tk���q���4����
���֨/inx
M�aҶ��AZ--����e/B���ض0}����]QcB�CU��87
3tv\�G��Eg`���-Q��
	��
�1�
);�S����W
�Znbj��M����_r�B���j�����������)#4���Y��4"�G��WdjE&͒�Y�c�� �X\�?egL��L{�~�J<m�kLN�z�+�RxB���C���Q�S7"٫j�,�]�r_5�<\��۱_,�E��2(�5�UY&i�9c���u_�C�w�������h�A���7:K��Lx�
�5��ג�,'��b1�˦ٖ��-)}����C���ыV�(�H���ϳ�CN"��8����A߷���1֋w���L���ܳWӇ� �3��i)�C?l�?߻6�aFcL�/����f`��t��~W������z]/C��V?Һ����ˍ����֥�YL]�O����4�����c�-C���-�rx�:C�Xh�����V�N�:}�]�,�*S6�&�$e���aGl�EB;�T�3�Pp�6-9�F��xv�t"���=~2]�����BUE4/��r]TH�6���ڈ^0�o�� ��sT�2��+��!�^�9���s��{�BC��Z��!��K��/�z�ȃX?�T����,ק�QޒO
�'�Pz�WJ��J�p(�4Ju���'x�m/l���j<K��M�+Ns��@�M�i���nc�y��F*+��ͮ��bתUV^�{�o�(�*O:���ˁ$���Z�6Z�Ѵ�9~�ج{@����S<f    BA�U����J�,�+��,��l̕�
	��ƹ9�F$�J�6��fo�}m^=2�	��"\�|W�����^��=����� =��ND�8�ʸ�Yn��F�Ps:�&�eS�Vc�P�
i���L�Ð!�t�.n���:�Bȵ�A��D
#�*�⮅r�i��L����e�hh⒴���3��s]�y�C�qw5��^��]��Aw%��T�F�Y�|�5�J���J�F�;���Ag� ��VD��r��YCt���v��A��s�L�f[3lVɊag������5l�m.�\֣�]Y;�}p�Z� ������������d�ԡ"'
�B�v�/t��D�%��G�Αq	����3�)ӹ�(�ۍ�^���M���^v��x+�da�B�����1w9�(2_�W<�h����0;~����/+
;��!uږ*`�������D@�Y[����.hBm�ˁ�-	gfWf�k���ac�y��N�>Y�ٵ���C5Fk�.G�Y�9���=N�rp���/.o�//WIu�!C�;�ݫ�lu����m�/�j���(r1��c��0�o��h&̫�h�Y&%Z%��Aō?���9�iХ0��X������Ղ(w�k��-Jb��8M`6Ⓚ��F!/H+���l�?b�цo4q3yޙ�7C2�u�O5��h�Y��'�]xd�5Gd��r�����C�h�K�)��V�0�T����(I��4�����!e�k큛�V��nar'��*
�8��ֻdGx�>�2����r���yЦ�f�}ĲB�u�7��=o�_(D�Y�l��q6ttC�m@t��wc��(�f�sg�^��˰܅;I/g�ƣ
���=���<^},7m�D��fQ����^�c���н�C��L�^�8:h4�oCmm�Z.���9��f�Ҍa����/��Z��D;��v��cSUf�Y �3���C�p��B���.З��C�����P�?�@�y(ԉ��0ʵm�x�(��hD˞x���P+�b�$`9����]��N8H�r
�n�&W�Dx���Ρ	m[�{�SYf:9~޺$����iA��z��n����=��|;�����y,A�W�NQ���\�ϛ `�8F#�x����&��S�F���P��֮�Λ�B�w��<���M�>}Ɣ��u��xpT{Rr�����{H�4�M&����Sƙ�'�q�����v�0N���/5ru�_���9 �[�z�#,�r�jF9l��9h@s����[��N9ʮs��*፵�/p̰����~?��T�ylZ��9�����0���A�ֽ�	�>�I2]f�� �֮}ejK�r�A�d�vz�/�LL\i�G_�������b����Ւ(�4Ԓc�C�?����s;k��FI�*H�?�*I�J�G��%-;߄ƜlD]4�=3��J=�n�,~'��r$'>L1܂+�JU�н�t����ާ0Ab2�?�gA�|�7����N�kY�̀@�	ܤ����Q�����3�Ѷ�Ew"��Z�=�(e�y���	6�K���8:λ~��H����0[�w*-U�Z�\�JJoK�L<�ˁJ>T�|cs�qb�����ϱ�Ut��8����&�W�E+��J���P�z9����u�F�s����`й`7y/��V�wD�	8�THPm~Jy>����.O����_e�ΝU��*ޓ:�X��ρ�y-i�+b}2d.jF^	X��5P�Jڼsf��E����ݢ��]G��}�k	׽����l�e@ε�����u��Zە���E���	�4U��p-TM(�1����ԳA�V����7��Dmh����|/c"�����՝���l �.��cZvf@�ˤ�s0����v�q�U�:�݀��9��SJ@����0g*�1�m��&�m������ζ9TYzG����(��Ju�7�H��ug"2��H���]œ�舏_�����\G��ź�(̄A�C�h�����m_qn�;�m���s?��ίT����T�YL�IK�@ϥu-(��.�lϴ]�iu��˄�e��� h�(T�s��jN�夫����{|䰲1&�v�yg�����_L�9�\��U"[����M�K<d�З�Nu&oi��]K�]�*�'s
2'���~�w4��m��gZmQ�6�v0�+O$z=+���WY}:�������k��S��hm&C7s͗�J��$�D�Ϛ�����b>Ň�%�c���A��9�T�in�V�9�$����g�D�6���y����uğQ�p��C�Ke7�[E���>"x�p�ňp+��@+�U�z���+]�~�y�˂��U����e��>Oo�k�V�hW���Ĩv{�4�<���f0	�c������ �����|S����z��+����4M�åd���v{��Ew�������cN2)�h�N��2��Jj�*�nµImm���%�
k���1�Ϻ�Y�S�߄��`A�������Q��nƵy'��hڦ���!��Nm�<kl��	����R��Q��OM�T/�ԕ=�4� �2�t��1&����#8HQ���_���.��ذ����f��q�u�;$?dp�_PعHe	)�'V��*�Mb'�l,o�'�=�9��;�w��	w�m�����#
�%����wk�\lh[�w���X�`Q�I뙱��D{5m�}4Ω����LnTQb�j�,��S>(�~T53�z�.d����4���`$[����F�d�-���5D�G�_���y(h����~�N��>��V�z��ջr�����{6=^��w����>�+�vsk�	�]v'��~1�<^%�gC�k����ו�u��
a��9]& �ZW�A=5�Y�5˼�t�}��fe��4)L���e%��A"o���Z�/z��v?e\�iR�Ҩ�s��­���v�-�ԟ��կ~�We8�(���x�.q{�/�a&xͳ��j�vЭ�o2'�;���N"m�`30�ƕ
$rxJ:BwJٻx�5�D��\h8��#RJ}�/�ꄏ)��&0�)��Hȋw�_rDF��u�!s�+*u!��L�7fnM��6g��~�4g��r Ɏ����(�Jg)(@V!�uoR�\75x��E�j�_�uxH�3�*�-�[�����!+�&A�X�xKk<�3�Ty���+�mŁ���f�2+i�(}��s �ٔR!u�ً��/0����L�z�6j��3iރ�)�~���r��ۍ�^�GZ�$����^��s��a��4��w��8i���9�{���y1�`��N�'#�c<H��*-|�TD�c��::�&UQF�%m(%<�Oy�e�R�9�I�&�X�k�6�ʀ��@[+8�u�~d;a�y�87�#<H�3�R�)a���U�i�;�^D�H���DJd|�'g7?�\�V��j�l��B��R;ڇ�7�/��2dl���L�A��4$jC[��Rg뜁�6����P[]� �cT^�;U��s�>mA�<tH��Փ\�\��(rZ]D:�1ߓ�E[,��2�_��^$/;6����_gC�UW�����^K'5xͣ�U(��C�\i{q�$�sm��/p:	S�}��®�ss����������s��?�R�.��O�E`e�wDw/�1F$))���--�8H��h%N%��5}�*an}�KU�[�?ӎSƣ���Ü@���ӵA}z�����ͧC�0�K`��Q��EC�C
��&hîL�� �Yg�
0�̂M"�b�SP�^�u�ኪ�-��v}�z|��5P���eL�*xÎ�]�!'��&��M��%\7�KgF�����T �L���x%�h�l��F�_S�D���X��?���o���qz=(X�T�Ʀ|��ﴤ�FLFi�ct��~����THx���W���TG�64�ugc�(ז\o��#�L#6�v�m��>.4\�v��~�M4'�p�eo�9ú�`����U1�(�4���@�4t+�� ��8�����o��e=��GUk�G��'H�S9ʅ�-C� ;uk�/y萲�0�
�9��}>w�
�J��w	GI?\Kʈ�0cL h  �*.�^9	�p?]ˤf�̈V��z�'f�X�2�ϸ;~�	��Y%�@�G������W\�ɚ�y:�j��
��W���9��L\�ɾi𣓈�q��ÉXK]m�٬7�^�gH:��cG�^2xkfU~���U��S2Ӄ#,�r�^E�d�9}�2�ڷ_�&ر�½��)�5S���Tl�w[�>{08���2 W%W�,��@��	���b�Ea���	ޅY����*�.9��>²y>1x�N�@6�Vm��@���&�\I�0�AC��N&�o
�E�:&����܆�N�ax����o��%1̓������'�󤡙�/�5/d]H�OZ� �{:M�v�OA	�v@�W�,z��fd�ϡ���"�A��y4M��	��_oĉ"��޳�do��]GG:nn>��c~�[���(�����ɬ�+$ό�%.�?s��,T�]��dE?�����"�Y�)/���N�C�Pj��h�vH֜�IۢL$l�>j��1&�]]vݾ�}r�
~�N��JO�kJt���AQNWR��-��������!s��@N�Yh?��S�3��a�bN���a{ �((������?uT^7����E?+���21��:���'��i��Ez1D+�zX|Ru��f��_�p48/��Y��;�TI�ۻ�lp�v���
��]������R�sɝ������}P7*$\�Zb~d=;��A�0���$$�ɞ98��vO�{��WUU�{�QJ���&�(��@׷�B~�-�T��y{}L���i�#�Q/떴8C�i����Cp���k[�9 �[8��f��zZk}\ջ3: h<u��
�@s�M�n5� Q����{_ǽ�(�|��o˵�N�xP���|�#
)��j}�U,3��]p4��&?�87˔�YS�&$�ς�[��X���^�85���5�I�R�A���©8�jΐ�Y��y/��P�|?]��i�Usb�Y����,�fxS�͠�B�ɤ�B���硠qQk�N���4zO'�v�t�g�zx`Բl
�Udbw{��jߦj/K��d��A�q�_E�j��(���kp�b&0�v�y��l!���V��LUuZ��ns|�N�egC�;���0�@g �Q!q�3 U:g�y�	]C��+��2���x�F6%����� oʪb�c:S8pbS���υ��z��C���@�����a�h��n����9�t�ˎv?���������;�ڦ����z��4���"������E3m�
f#�y��rk���S����ɐ�kt[>�sH֓�� {Vb�� �C�RD��'U.,FrPt9�خR� ���L�y�Ul���_U1�4��?�y�B_x��Np�k[��~қ> �|��]�'�NE��h]x�%���z~O<J9}�8@J���;��-�	���q*�أmSGX�m�Q��V���)�|�yXR�9a�9�(�C��ۍ�~�ܰd��>c=��2%��B�,��g3p;~�`x�j�
�'�ܕR&�U�4���vM�Z�h1ʄ<�oo(��N��l�h��a��[�A��:�G��A蜱�k�=����kki��0=����k�o7�>���0��B;�� {��:���i����_�?� nXF�Ի��~ٍV�<mTO�{Z
��3�l"�v������@���/FB�壪1�Fu�u�4�M��M�����b�`�����Iy�o�;*`�n`(�H"J:J{�cU Χ����go��~�(��Z��\su�+��M��e�ٸ
��X����s�᪻���n⹧�7���?_������G��=qwׁ� cZ��9�Zt�	��~�=�v�P@�Z	/rW�������q�{��y�
�E�� '�efȋ�'s����a��r���ߛ��&*첡Ɠ��q^�#X��Q�>�p�"�9&���n�붡)w/�q�7!CE�dLA1���^���Ğ����C��E�Fl
K--^$9b3���&�ِ[�DV?�(<_�;��~4�H�RI:�7��~��~[�瀠o���l��4>���z�~(t����T�0�� ��u�BW[��@��v~�/.���,���u���7$�s����bЙ�.�95�&��eN�ML@���;�\h��ِ֙.�
�6�-�M��#���k����s촇�sw���hȖkܲ��Ȍ�[<�i�8��PG��qz��(��w�(c}iN�j����#G��M���e�}ҭ�6�~�v��e�����z��5奧��6�3���"�\����E�+/4���3�/4U�5E�pՊ��K�(�l�4U����О�%�pJ��&���<o�r��f�n�Ub��!"��k����\x�1퍨�8����O���vCQ w�b'��i�r�'̎q��{�{7]x��-E���x/0��>�%�|/V�A��N��� = �k��sK�C�sڞ���^��rC��׹��
���E˘;4έ��!u��Tt<���(h�l���w��2��---��)m��I�īv�4{���.L0vL|����c�*Q�Pz��P�>�m��!)FԶQи�=c7^'I�EK�i
�N-�O?K%��G']�9P��a�H)���J괜�Κ�^ݹ5G)s�(aY�R�%���v��H	�A�����2��5�����7h������	�+�s���L �/��~�j�ç��DB��X-�5v���4���BC�/꽍F�Φ��[=��
9��9�X���҉�I7�Nf�v_�Z���!��B�^\�{G�:$O��x����@�׊�>��nT�}�8��q?8�8�*���&�8��}�(c�2�锦�j��&C洹/��j/^�ve�1o�Π�	��t[J	�e�Q�C
��=�Fޡ�(@^ �������¥4F�{�+��I �\BOu:�-&�Ҵ�FJ��z��t��"����)�Ӵ}������N������6%��$pr�!E��X+��)RTo���f�D�mFs�
���͘(�X��StZ;I9}���6�R:6I�);g�:�����vCx[�yDd�r���g��<��Hh�ڇ~�tz{	��`�v�7�'�s��cU�q|J��I��tX:0kiqs�=����5Rs��Qs_<J��}��=��k<\~���,|��h���c7�L��Jp��_���}�(�����րQ\r$�,��i�}&Z���֠�v�6i�Z��1�Nc�^���J=E��E![TtfEi�!�� }�W�2-n^�H/�r�K��O��@@Ӓߩ}�&�WHa�*)��:Ρ�ښ�Q��QffFp����1	�����l�5�x��:�j�=���Kh��6kT�����L��f��$����Y�[8J&�1g��+/����y�_,xx���3J�L-�$.k:���m
O��l��G]��6��=�_�U:y���9�ɨ.�[���-,�A��8kZ��lb���y�>�tmG��bS�X�����{����9ʏ���Q㷢x<0��(�U���C�rZ?Gz�;��bgC���_�Ǒ���ǉ$�d�hX�2�-�9�z*� ����E���8Վn�����nH�a�M���D��(�zmY��X���gA���6ݧ��Ϻ��y���� �?��""      ,      x���Y��F�&|��<��H3Ra!�K�b�ݖ����gF����k���^ɿ��5�	$@V��n��|"2"r��"߿{���WM]��?����rS>V�bY,�n۪Y��{�|�Y�V͡���A�7��s�y��fYv�r]�U�b�2r���-�塺k�M�,���-�_U��S6��=���闔M�_Qz<��ч3?m�-��]�^7�پi����ٕuMHQ)\��e[J�t�aH �_���Z�۪��4�Lfu�.��/���)m]|���(?4���m-~}��e�tXd�hn�~C-7ߺ�,S0Qp�]]~�Q��P�6�6���z�]�ە��/��YG������p��ǥQ��ݡ�U��-�d�]��c1`ܗ��[? h� �d��Ւ���Cs_� ?"�@zh�Vi��j�Xt�#FO |(�M����Y���#�P;m�����`�f���mW�%K��*ZjSq�Ey%~h�Mu�.7�xU�D�M�d����0�E>����_}c���̱������,�rX�VR�V�� k��L�]�N�f묤�����XWݶ���,���e{�V;�����_e�]�N����ȅ�8ִ���5���pY@A��n�.�RH��uT�+)�)拕kp�x�-o����D�,Y\Wڕ.J���	��zR�.��F�"E��h��pi�n4�F�f[X,)9���n]v]�̚�Y�U�Ŧ!�j�?�[0ī��E��_A2G�v�Ňw��ӡ���ؕ�D&����a�o��u�Ţ&�|��SX�k��eӔ�u1������Pa�w*�..����pA�R���CU��u��.��5��;!BA\����t��!�$�S�mvZα�0�:.�Dn�.��0�g2˻���Z�y����q%.b��	 �X�C]LcF�JtD5ԁ{L��S��WQ�A���{�)wM�>�X��*A������MD,�j6D�r����C�p��Mm[�X���M�����}��P4`�ю�걄6�����x[��#y;���X���������vK=��gM��Xy>T�A�����,��7���C��_��.��Zݺ�C?�*��� ���9.;PX�-�<)���R%�<m.ᓸ����ﶬFNxC�b�M�A���k(=�T20������+p�v]�P����<r}¼����y���["�}��cU�`rm��-�Y�����؏=B�T��ȜI.�� �)��M���F��ߔ�F2({?kjiӬ�-xK�O��$�f޹�GHh�=�܏8��4o?K�-y	q��:�A���O���G<�f��g���̢ �N���~ԁ.���7�D��a%8�x�iV�����oP��X�#�
�>���Kr�$�gu/�8��;HK�%��1�A^v *aJ�+[h�؎Ri���c��ʃ�U����4d�'0�Q���A*&6��e�nJ��#��B�:�8��՘�
P������(}]`�u%���hqZZˬ"�D�lh��e��,q����@�"��c#G�=Yۮ0���d�d���P�Z�t�Cs�f9菠G�����NtI����fe5h�.��-O�X��_����d"�N2#R����xۖ�������һ8��_5�z�;D�
�^-&JQ��eV�I$T��G�A�K�g�g��ףy)����=�|.ɽ툩���<��w�h���5��_8_���[Ywq�N��Ҙi:��N�~W�=q�$JW�I�����f�:��F��f��!>mY� l���hl}]�5�8�an��o��.��
G uB(9%���^�X:�����NA2�xF.[�|�i�8,{��*���uÏb����a(fq�-�Ë1W�Ρ��l��IG���X�+r>�sFm.�hq�ײ1F�����y��G:\y�u�XFb�Itq۴�#C�yhw�#�\ܺ�	0��V񜚏�xL(^|�p��5�y�-b��$ӗ@��t]��

uw`�p���E�fQ3�Ea����Qr<f��dE����l�]���.�m�vSn����D_iD����J��J��χj%��}bn�dg���͒�d�KaB���zи�E۩a"R�	V�K��$�=ɛ��m���� G�f��2�H�y��KZĬZ�K*RK_V��~R��P�X�z�3�d�+}�WI�����f��/ۭa��̢i���Kܔ����:���Y0��"�ʑ�Z*�2�v�����9�^���l!;X(|��y�t�����w�{�R&we�敆�Ǭ�;���[|u�mZ�fᰴ����/Plm�;�/|�N즄\��`�`�I��r�zF�a��]�b�k�j�d�4٦�Zyǒ��0��)�����YT�:��#Z��Ӭ=�8�����0��ey{9���w����.=8����a3���],J�����y,���I��Ƹ�Q(��ּU}L���]Q�^�2&�TȬ.T��\�BQ��u�F��c	=��U1Z|.�֖��[�M¾@�+E�js�����CKk^W;^�l:^�$, ���*�����;^%��`�
R5""j;5��E��=���0�0�!�Z��j�<�$d����n�g�����k�93�a�E�h;�/�¥��4��Erb�+,6D��	=�1�\pi���ʴ��*�5�^���\tϭ�/>`VnV�b���^;��Q��Q.���B}M��]@<4Ǯ|�]�*��~Ț�G�����v$�ڀ�&��L<���(�7G�~�ͺW��\J*� ��L,�����V�Q���g/b	]@3�������#���&x�%фO��&���ų:���A+C�������ϰ�~��Ţ�X�b��V��#	�e��Z�u^f��b��K6t��4�~_�#����
���X��uq��`L�$�Ϸ��]�*D���B�ã>�x�K�	����pG:�-	77O������5.P���b,�� �Z!�e�"��M�e�8/|���#�u�2���D-�籌�g</���l=�sAG���5�HL���g[�Hw��xG"g4�s�f���xd�/.a6��B�:!�ﲰ���EL�~��������Ʊ���{8{D'G&�����+��ř��'Mv����S�G&���.���}���DL�IŜ�Ё�~t�����ݡ*ֿ�H��C/�?aI��Bł�����WQ��K0AU���8��5�Y�B]�,��tؔ��C_Y��1 :1"��aMw�~����o�������ǅ��9�5�2�3�`��|46�L2p����(�b2�����8���B���.���Y���
=�S��$C3��8睮�8��B��@��$���#`�(?����N���#$�4i�sp���r��Y!�|�	qI&Ul����^��T8�[`�bxL�ZЧ1���hȠ��(=|3q�rH�4]�>�6rd�l+�j�	L�hP�F\���nA �c<�d=C5�/K�I<�>�|��uV��1�P���������8��R�<�J��1%�k/� 1Xޡ#�?�i5.��F&�`|�aI' �t��9����=��\��C������V�H�M��o\�ww�_9<T�)f�u��P�(&j�;�PԄ᥵U,�晹��g�J������C`T+sӴ���03��U� ��b� ��#6��m��bHy gK���Ѣ�+5�y��\4���g&$�A|�c>��S�X��h`���30�q��l^�Ժ�V\�Y�d,Ǻ8v�̶x�����#NvV����Z�u�O�0�8<�+2,�`_��!�{�C�����\'{sZ%R	-�Z����#"���Ag����"y3=`2O�b�:�yn��J�/>�.����h�K�	K/d�'L&�����J�/3�����W�b'�(�����;���l� �"�]���e�;r�p�P������O�T_>�6���h��$9�K=5c�[>�ft�]��s���D�Y��lw֥��E��غ֝�S�D�R�䷲m���[(��    �k�f~�C�y�CjD��k��	�����Y-����ߊ���Pj��l���oP���Xv|a�ZW�����S���Quz�
W����圢]��`_����NR�kb
mB��T#�Q��{��%�]��j���a�����\�])����
D���K40z6z"�-�|RW�m���p^ν���l���a��0v����L��'�;af�ƻظQ��Rz�ʬ
�{�pB.
w��m	���P��9���@�>!�#�G'6G�gG���M��%���+�k�DK]�鱣!b_�s�Qp.���ua�˧�<Z0vbۃN��ҁf.j�xą�����֮�� #
׋\�0�F�[�C�p���)��m�E6�b|m$����j����}�n�.�?��+ܗ��:@+��$ � �Ih5[d��m�����.����`�& r��gY-�	�n���E�xq����l�?p`^}D�s��g|:���S.���7O)������k�R�1��)��S��W��Y4v[�n��/����p��>@�_�_�A ų[Gh1�qSv<��ή\�U�+H)��03�������Fs����/�ǵ�s�)��Si��BN�i�)��M��EO�z#6�p����(8�hS�V(B?��,������i*6;�j�qq� Žv&�ucr?sOdnډ�O�´�+r���b�\H64�^ڂ� ~�h��0��a����ү�F�Hs�1��p����J�ܗ�X���"_�?50zm��/���|��'O=�z-!��̃����>BWIS��0asʂ.�n���%d���,���`e"����1����]�pAz�h��c8:�E�m���t�{��<w[��j�܁Z`��Wmy<�uW֛��4��Ӭ>�/۟��n�.�����Y\���<��Ԕ,�o}G;A���C;�"n&3���x�^�c�*��A���O�(\�R����N� �����(-pҎ�-e�BL<��5/ZܸG�Xk�C�ݟǊ��,���,�ͮ숳H夗�����#RԄ�qm��<�B��p�����瀉���$�V�l��UA��P" =#kM���/ ~C�L`�:���V,|V���xc���x���ɲ9�Y,e��{խ6�X����>B�����b)�!���,����M�X�?њ&�X�'��a�5e�GcF�^��Vb�հ\88����;9���Ė#|
�~���A((�\Jߔ#[I!�(=u��$v������oiS�Nv��L��ީ�iw�ԣCA_A��lI�k�����wY*��� �Y*�l��Oa�牦!֜YΩ\�M�Ck~R���ESi���y�;���oe{�:�!.N�0X��*�p��C�v����"x����rwę������Ѩ{�%��Z+�� �B&λ�9י�������2W�G`��V"!~�o�o���-��0�����:�5d9n�:�������O)`� Cй������@�lVe�XN ws�f19h���\���}�vF��#-��*����y�eY�������lI�HK(�z��M[l��!%���C�γu�(𒂍gM=���+桗��-��5� �v<�ZjR4_i�"<�$�L<�5�ْDB�χ����:f�������o�H\��zD�i�%�R��u>!�sU��d�����p��gj��gp��j��6^Q���7��(�!����� X�0��a,ͦ�%|���[S�cK�h�Ųho��=%ǃd���m��R��)��B����5Q�c��j����f�����8��K��,�ǚ9��y��w��f�������K�˩�e+���:y��,6����4T�0�U����Bz)��M���7:���H���$A�!el���u3���"�JI߫Y����_�ԘMj_�u%_�;�h���sM��ӝe�����V0�@
<X��Ku~�J|aY�+l���p�`��ȁV�`�N�@)��?1�����t+�L��#Z:�9Г�
��}���+�_���.���fW`	U��Q�׼���.T[ط�NЪË	�p{dO�i�d���I�A9�MG�"?���P�[n���!��������$�$��9#*��j�4�X?�Q	���K�|lv����W,,i��ůE[l��p��g>�e�j->XE�Ң����xV����&�̭!�f���&ɚ�\���W�'=a�!t
��H���_r+-�<.��!���m�e����ǱX�:��\.�_�D���c��:����>D$/
\��<�瞸O��H�rbp���޶t�]����/]r��	���8�_�A�������n�e�;����.9�'���T�;��Lh��+���D���g��+��	p����#����{E@"�$�c�<�s��,��d)�>�L���e�I��v��+/n&�z�����|_�ل��Ӱ6R�k�A�l��Jq��&� �%��.1M���![#{]�<#ԼU���T4:�ߛ!C��X�'��c��_��lx�#D�̊݃�1������L�~=������8K��Z
p�r]�@Y佢�p"��R��DN ��z�\���%����x��Ȃ�0���,<�����#}gU���9�!_B�I|P���X�U��&2�
t�t!�-�ǳ�]���k6%�T��[�R���~��T<��w�\ �>f��M��u���;��#�p�gqI���b2:�?���G��aܖ�EM��B�=O�N!M,�a��?$
:R���1_�����({��$�T����G�b��*�>�05l�gOR��
�?�L�(���f�i��T��oh-��nFV4骫{���6����]���Vž�*"��7&��$�_9�T�Q��Q7��4�On|�l���v�.:�iۃ�h:��\h,}�Z:����7���(-]_Rp����HNE�R�K~C�Ծ�'%>���7��PNQ	=Y��vN�ap�v0~�����N|j933��`�T���h�FQ�b�v�+���+���=z�@�j�ȉc�@�`G�O���vN��n�j���::�޽&��y|�]���\'l�2��I�����R�ų�d��{��Ȩ?�x<���x�?V0:����
�S_�=Xk͆� 
�qܼ$��B�|0�P9G��eJ58�<�M>��{@eL�0Y��*���`�O�r�HBf��wD�����-n��J���-_���I�D����O�0Kma��L�ͧy�����	&}�$Z>���D�Z^�<�:�L�.>6�fw\�%��4�B�� �y�J�}�e��O�9���?�b9���{�r�
D������G�5���m�YY�O�|���)Ң�������B��Yn��h�����(a_w\�У�Gk^��f��g�L=[3�w(�i��l-�n��g$�C�hD�"-�h���{�pe��`r����/M�-�˖�"4���4�0:7^�"xs��ل�S[��Q��}?k�T� S��쫗g��/�UA&�B/����� ���t`�����	�}�8�]�t3'�ϱn>����c�Z�ol7wx\k�����=�)�ۢ��B�v�/�ܖ���"r\|�<�%�#fۂɢA
�.�(&a��l�U����k&��0����d��U�V�!��$>�I6�MJ^��W����"LM	�ku�(d)��tu�"P��+�[�A���Z-���9)$�D��]N��)d9�Y�֝��)Ҭ�P�M�nm�Н4���k����z �V�V�T1�>�G~�c���ǯ~�{M��5Q�>*���V}����u�DA��x�I�.�5��_[�(���%A��� t�m��l�	�{������|l(��D���Z���>0_Atpڬ�G���,�'���P#�!,V���YE�ia��['Y�qI7n�t,�类��@!v3f?I�s>��� ����s>���Z`��Aaq�4���=�R��qKL�Lt������l�_��g/:�!�sx� �	�T��mS��K
${V�������@SK(h�'e�    )R�,дA
;��'1�1-/~'mh�p�E��8"�P����#������.���Q��9�5 Ł*2�u5
T#O8���8�|��B|��Y��B�B�m�ԗ�y���"�z�|kÔf�F�\�CU���ə�Yz���Ӡ�٪Q�>�]�a\D�\|�M�ZG����0�;C^�
����H�]���2�w��H��}�zl�������=�6rIQZ�	}a�'�/)\�@E����	:q�z�l��*�=GP��u"V[x��U�}�<���~��d
��t�2H����V�-��~��@:w"�u8JO��etN{^]˽=�a�~�Ou��3�����G�K��9��m�k,��d�=ۄ�ȇ썘�P< �6Jd��|z�5���/c����e|���R��:k�������@��@�}Z>�4�p���`�v��X�s�����K[�p��e=$~��i�k
�ך�HS>�VO�N4|�Tbt�Z�����L3<�s�Q�BLh7���b�\'��rY���>5�r��>9Q��]���ˠ�F�pυ�OfJ��9��Nn+�)�#j�T妻=K�|(������)�����85�<�, #��Nt[�ط"W�Lb�>�a=��xI2a8E(V.�J������M_
��Z����y��Gӈi=���$}��?⧕�ć<uL��є ^M$d�C��H�tƜ��))����|�9�*�\��V�cV�˪{�c���V���U�èU5A/�J+�'&�=s/�#p��c+�莻fKk1��\��QX.��o�ǐ�b{[�;��_r�=\�_�7CG�iv��K<���>��E扄�)�}Z�L�ڡG�{��W�j�.��`�rT�W�`s2�*�l8�2T���ٍ��f�^��)�*U=�୭�ǛX�SJ`�@�0�~���3��oc,
�r���8|U٭��n�l��J��l��j-K�2����j��
s�� �8�*����^6nz�B���g���`��mmLrO`.'0h���K�pɻ�&]��845f��~6Q��^�eWINb}��~��1��-�g&��Ԑ�SQ����%d�#���\�M���zC���&��G�Vאq��V�C���Z����뚞<�N�w��U[m5�'+����!�K9 ����9xg7:hac��d���O�Kq��5z�	MW����J��e��ӧ	�F��I܌�O�1��I�X'��^���-YuC�&�U�{���b:�t�����Y)��\��F[MS"M���k��Xp��̴5I�M��LZv�:��.)n�PO_Ku� U�40���Hf9�"�J�"D��y���N_�����S��1���N�bZ�8I)�pD�SY������a�$�ud�ZwN�ՓLJ�|�b��`�j�';[��Y
zd��_��$�l9
�R��^�OD�̩�8f��)��O@��i��2�ғH�>0�܃��H"���þ�kr;�UB7e.��%�ʝ ��.)�1��K�o}�>9e���#n7���S�j: |�TK�]L )-д�H>S=�C T\�2՝�4������j�r_1.��]W�ou��*�b3���L�(�'��Q��{B���=|�����������RWR��绪.dɍ�?S>��P9-=rzK�q�*�~�e{����7���>m��H�?6��_i?���]R``I�u ��Qr>��S	����mE#1��~��h���ȸ��k�	�Z$Y�T�a�lM�	��������	�}0���X��K�c��p�z�=��ʻƔj�; ��)��2L�p��]�'ui�ާڣ��f�$�d`�u�T{]ң���9��i&G-`��2=a�@֐+5F���̋2�l��>P�#�P0T��cFG��k齲͘S���'��p����t8�f"oH�nǇ�zA<��`�BcIv�(rFb�ȧ&���Ǣ}����k�E=
�*�;�Je��|*IP��0�Ēĥ�o�` N}�����ΗU��Z���x(�|��j��jgL��H5-0�r�B��z�cr�͠�����TԚ
��B��F�^[��'���)���,�_�D��2[�=�>Т�Ζ:�U�� �%��-?	�-���RN�=7ᛪ5�[߁Q�K7�|�%U�L:{Ӕ��� ��iȳa��E��4��p�<���Lz�I4���f񥲜-��{ZV-ڒ�:�L���ԉ��p.���S~��]�(1j/�Ze֏��̋�e1�e���_K|���8�[p�����ςfg 9����ΛkD�"�I8�`}��?�5���.sڤ<AE
|���K��ǜ�[��Y��{+F:`D���<@�_r����!�iDd� Ͼx-��P�X��e}�G;� � N/!C��	x@��ڌt�}�q�<_-�w���_������0~���h�Rj#CV&� ��ɢ����q�_��{8���e�#���a�K<&�A�2�����&J��_��[mF����Hz���o��F���B�ӱi��ڞY�1,�Vˈ]����X�D^V��6�da�����嗏�?Y^�������`�����j^�c>�{5t���_n.0q��"�`��/�_X�|af�f��m%����xs�/�q��U��e�2�t�q�oH��qQ�Գs*꺬��=C��/��T��b]�h�;�R��	~��0�x�S��
�ZZuħw��݇	闫��/�.;�n]��%ىn��7Y�\F����օΗ0��}��%C�xe_}	�H9�b.߾�a�HW��|��_4,��XQ�J|P}��>�X4��9z?����l���u��%z�=C~��o��)�A��'I��;_���ǎ����wи���4
�v�q)Q�#~⻜ę6c�/?;���H��3�#�o�wź_��x�ެ=ȕ���[}�0���$Js��۵x�-��+
.�G���_>�֣��/����5�sF�Ē�n&w�-sg���f��UK:\|�f�4m�O:�@!�M����С�WQ\L���_���%4�B+-�ް��#r���{�A�D5�f�:,G�ܠ$?ON"m�/�{
�N8�]$��Se)5����15�zE�cs�g�
:؇�@e��/���v`���J�T��q]�f���J��H�\����a���o�ͱ�`��m�BM���c]ЧL?�u���=bK���--QL���|G�RZ�؉�,~�=�[�P�߷e��;�
EK��&u~������+bRF���.v�cMk��)D�l֢J��=�X'w ��]�v�4��x����G6S�&v1}�]�v��H�1o�1�kA����tT���wM���:L4�nDZ�L��_����ǿ�*S�q_�dn��٧M�"^��nx �+�rMm7PW#xǃ�ݡ��꾆	)�B��kX�i��Kd�� ll2/w���gkJ�4ql��\�?��^s��~��A�X�W��O̓XG�!8�-[�� j���)vl�!47���Q�����<�^.�E܉����[R��_���Nuo׸g_mʂ�">��=�mUR)��
y�S�	��(�"d
�l��}�൙Tj�g�c�9_�ա��v��S�&7n��� ��P����9��>�H�J�d��ޔ�ʖR3M�p��DX�4s��(���D����S��c�e�X��Yv�-_����H�)̶�5���Jbäဴ��+���lM*GJ�}l�3p5�]>��1+cfwX�0߬���
��>���0Q4�pE1�JA�
���&sH<n0J�4�=�`�èl�k�'���V�n����c�X��Ge��޴���`0���O�͕�f
����:a�9P��M�{�P����c�ko�1Џ�,��(�B��C]�Ȑb�9�8��,��eM�L!��'7��������f�(�2[\�T����-��a����~Jly�xM��!�6�fpG~G��g����+�"�V�`���\�����.z�y� �I>�k�����e�)]�R7���8`Q�1Ը z    +���2�Be��&$����C�~8� �h q��^��N���/��HJ6�Ss�(y��°�riC��oV-�uC�=Y��3M�e~3%���pM�*��K�����u��Z}:d�����1P ��벦釋���y���\#t
J�4�O%� ��b�ʧ��,��*�`Sb@��aO_���N�>�#���1�������p��f���)���Lb-Kp��{z��\���8%f�8r}��V���5�D�����E��&���-�������$�=9ݹ$G}26��Ʈ;TO��oao�5F��tF���0�Li}F.���z��gV�̹����)����~�U�.R�7�q!�?C;����V(���gПsn(��ơ����|��P��Ě���a�H�=�{9�;���"����ASZ�i?�T��?�t4���0��!\3�Sh�Bo���)E�Eऔ )wk���_��%���3d�&�
�'Y_͌Do��;2s�B�6\|�%�(T5C�Ô�-d�K�p���#M���uA�l3�x��-Xn`��S�#�nb�� |y�ND1�+�ЩB��y���6�
�X
O,��Z�[�~�S9�j����X�\ʓ����!x����Nb#�o�M�3ר9󡆝2n<OXc^)SLLG�&�D�I���:z���0��%8�H�vG����1Џ{*]�"@���BDc�j����x�B����s�gc{����tN�k���A��C]��r��¹)m_��M���+���Xgn��`���4J��o�x3��3Y�������F@Di(����y����_�2�ߗ�����n���d6�aC�c{�']O�At2�A����)V�1�{A!4�4���G���l��Z�&ګ���XxG<���V(���Ȍ�oK/�O������9�����٦�`�"��B��85��qpa��;X�9��`���3��Q�=L��T��jtPˎb��jp���(�A1��o�uKp,����bg�ČňG��7Y| -��|v�����ވA;N���
�9Ǭ��h�7�Ӻ>V;���3;|�3��C�Osk��1��w�#�x��T���geb�"6�e�];�W+�o���������j�,�j�/�	.��I���ޢ����/�s��Xlڪ&�$��n5��l�(ow#�4�����\b������*`�P�����k�D	άW��+�|�ֿT��"�3_�b�B=��6�V�>팪kUQ�W�X��g��/�\1޹��@%p0��c���a�I� ��?���� h��:4;�� 2��aK�0���+
�:�{+y��+<�xE1`��-+%��V�g�NG�p�С��3@|yiw_W����?���o4Z�����*�}�+�;E⵶��ur��+�Z�c����~�ƈ��Q��	����ti5�TK�O�u?}�4��<ɧw2�7���D{�_	�i��$�j�<��09��vf�����3�0�ɺ�#I�s��mx�{�6��.��2�MMw�M�$c�;vY��|62{��d��r��r#������}mu�-�<�x=��fZV��:���-W�>���v�k�;��i��6�3�L�̵U�iim��6�s�6�k��-Exk��~<��x������z[|H��BQ�c��jdӢ���@�Is
�0�?��q	�?�������o���f����@G^jw �B�N�����W/?L���g�%"8>�ѱs�Q����C'1�ī�:P܋+��-_���y�
�?y������.��"��i	��B�2�OQ�a���=0߿ڟ3��?c�����`�t��N5�p��bf5q~���*j��Ƌ��v�h�������~�Xٟ#�l���2M����}��|�Պ���B7�ʺJ�|�U�X�v)ü��pCR�/[�a8�jgvƑ�(R����6�=��_��|��[��{M���qb[n`~�ɑ&c�SR�������+�VB9)Ѩ��;�x+3��̈�Y�̍ Tm@�Z �y=9�V��Cy'`m�K��#5{ȫCԅ�}j��q���h��Χ��-�o����i�gW܀r�~�H���-���?�cr���0�P�����
�{��s��6� �SR�Q*���u��1�'&�}�dK�p�oJI��@�����=t�H�5�v#��w��!���>�����"�ɔ����3"�����~���h�0$�~[m߀��O��/���JVL��<�6a���ćK�E��SFN�i�-�Bg�0,/~n���}+9��#n
RCM���P� ����a� �1�p+#RS�M4��K�[l�fԱr���|���؏�犺�oV�7/�8s;����h�QeZH�#HA��������?(�"��-�dO�p��Dou,4�db"�A]�姱Ѩ��[�}��-�'�o�~�<y	��z�Lp���~-����I��N)a��H&�ɘ�~no����1V˘�gH�*e�S�|	g������G�j��sE!h��;�{��|��s�Sa2qXU�8������ Fc�0��U����hFak���s��Bi e�)�r���i E�I{���T���[y�J�V������#}):���3M�]���7�`&W܍|���<1�ٖ\/��7����;=O7:�7g�v�%׏n�h"�^,1mA)����:�F?�ZB&m��vjiJ�>v&m�i2|{t��xi�1>B��3L�+�_� o)��0J��Wk�r�ڒ;�4f��������-���Na��z�C��CH�)[$W�O>�a��gN�k�z`��ʉa���fnK�]�fǧҕ��r)�T+Uɂ��
�'�(��5aC�^��!�9��Ra�q��,zM�qπ��+�+7�hZz���(�n���#�'�'`� ��!�m񏫜��d@->�����(R��U�r-��y���k�����Q��HuSV��!�O篁?�\�D����Z2E��g^vMq�L>���w���'^,M�"�|��n�R�j�؇+Hq�L�(6V#S����e�1���tw����P�Aϻ˓�i[�~����T��'�MKS-��[��W1E4G�+������`i�E<���Q�;O�JS�	3��<��͚��ߡ���j$�|@��F��7	�����H]s��i58��9�J�ϣ��r]x]Z ʹ.��΀�z���Lk�iE<W��L+�S�1tv'�u|�+�[lg�9��GQ��d�������J5{=�g_�ھ�ܘ���A�k�<ŀ�A�������ZSOq�I��%+i&��x.>��Z�O�d;�֌Ι��Z�϶�G;@8�ՙۧu¯8#��\�uah�3��E1^i�!7��k�=�V}u��W��3����r�����8��	�����Q�0Q�;H��K�8.����+�3B�+�[�eK�Gs��$��nF�|��#�_��
*D	�-�9� U9;�N���-u>��oz��x��Nt~kϼ._�N��FM�u����\c4��5�D(�G�T{������6�i.F�.��*N&�0���_�jI��y��&3)��G�ݱ#��/���^,����\|������?̡bE��=�t�Ӹ��c?&1|v<ITb��@��>��N\./����@����QĶ���E�-ZQ=V�ξ��Y_`���z:
{�,��%���'�Y�E[�����F�� Sl���ϔ�I�&�x�R�J���:�E蕢Ů�WݩŝL�W~��g���h
���R�	/��MI�0K�Ko���>��3����?D���lJ��Y"�ξ��̎�pցmī���#^s���[ܘ��=���]��\�d	b�-Z��b���� dx
yO�R�]9y��25�y�bs����L��>�rY��嚲�3�r ]*���R_�>��b���j�{=�iqEoZ�al�=�b-.������P���#X��ńg���V��ru3l(X���j�t6�jW��ò��%&���0h��\��<�TMg�f���]|    �-ʇ=��+���Kօ�\�/����^�e�P���֎D�A��zN+��f7Ʀ��W���Oj�mO�Ld�M��x��L�z+��2�쬞Ay46!��^����1k��ko�����@}�V��--�� �b* ��<�{���ǖ��==s4Zd����8���)���+ �OŎ
�+-+M��﮺m��t�6��j.�V�,d26a�(s�m2��<�`D,�<�<�k�;�>Uz_�9M����TNv��d�Ɨ?��s`�,m�Y>�����������{��$Z0��9�X�8J����J
�_l�ZW�`���u�ͩ������Z��|,[�DWx��^28�*�1r�o�RÓ{�"P,]��O~����2�e�r/�`�������\����
���@L�:�H&M�[�&�_���u��]8QL�n:��5g�ܣ�a���`��oz�	U��c��'�ퟞ�_AB������%�/�9��A�cM�y��׻���|���It�A��� ,�v��F��<�k�<7�C�yfJ���$����6\-���)��p��ԅP%İ�����K+҇nv\S�v��>��4�}��uWt�4Uh��_���X듰���H��u��L��a|���s��ݿE���\�A\2�;�.rI��2��dg��1��p�D�:'V���2mY\S,}�����)~��t���Zɞx)#��y���Q<Tg���ZF��1-��[Ob�'�Su#ֺ1�Š>�Z��߉r+�C����F�CEk�S+�.7ms\�Yg�*t�І�'��Vm)��?�8�o�����)�*��7|�������������^�7T�]��	��wĜ7�:�|T�Ծ���NW��Sh>�-)�鷉3����IbeB�!���|қ�59��si`";1v>mA�������r9�M���Ji����Mm�|�K�_>�16� ����OWs�ܴ�|u3 [�k�!�[(� yi���=�a����?LsMOȷ��)�i꠱�\��G�(_}���&�Y� 01*[��1!�+�<%�0��:>K�?�qMo�}
����T�>�p���S/t\R\�O	��F"��:�~�LC�!�(��%�/�(�1���Pcj�Z��15vS�ј�r�M�fLK�4�=��w�G�L<�B�|hc�m$�D�:2�M�~��h����73dz��|�2�� _50:~4�.��b�d++��ҷ�~����D�����ïVh�kz*B�ό�g[O�����	+�!��H�o�^9�)�/8���V��v�����v�XK+�v��ht��5�ZMW�f"r��B�N��x��^��/��މ��}TJ�����ge�::����K�K&ԗ�~VD�m��U������esF��kz�!��xMOC��a@�O0�kzB�S�A���I��ԴOՠ~�`(q�pqф����5���(��5�1aK�/Co���#�58�ۙ��8-�y��ƹ�p���~43絯�銧e���Oy�ً���#a^ӳ/�����(@|� �DVd�z��;2I�cB�������z7�^@�����>�q���e��Kh����O�迀ǟǢ���uNG^��$c�9|����@���]�T��ć�~&W�L|�>�:���`h�Fl:��*��"����E!Kz�k��M�G�g���n�M�[}O$i��?�u�s$��C���3�{j���P'E���G5�y�C)O�w� =���'�	�@:֧�(VH?�\�Y!��9��1��<y��4Py[��q��q�f�u(����G*\q�b��:���n-��:���N���:��>oy=�i���3��C�nO�`v�=�����$�N�'��6G���ds������[1���l_�2���è�:��Z����*�N�-�3����s����{�N�]�Le�u �:'��� ]-����.v]Kj�Q(�zWt�%��Hx2�V�B�;���/>�ܸ�`�$�s{l�顡�i��JL�i�[��wL��5���}J
�$'����|����+�?&�6�Ģ_O����s�=�q��T�� ���L�~.~���0�r�$�XGn����!4U��M��4��=7t�u(4^?{vWiU�\w�B����-
s�@�ǩbt����Q�96�%&~L���'����t�B���l!Ņ����҇@?|�n:bB�	�A���[��t�*ҝ���-�o;Y��T��H��nl��\G�cx�>��u��7}�0>ב��Q�a|�#�s��z����)+M��o�Q�&E�i0���K��||�z��%��!{�#ܻYb�칎�u�B_Ȟ�H]F;��s�b�{��y������Ȇ.f�Wj+Ac��CT8Fy���)����XS��k01������*���� 0בH5����\GRugV�g����G#�(��7��^��_6a��+	G��F�����x�%_��U��������i��n"�
��J2�7��92a��4j���H���NE��=��.|F�jg_̊Wtf�@����A/�S±#i����)c��Y���t�[\;���L���L\��=�Kp���xE`xy鼼e���p�^2�q��u����T#\K���ǝ)9�d����~��he��xW9µd�r�������z�E��I��q��g��gu2��pQ�����(��'ug��ʟ�ңx����<�fo8�kwʕ�(�"�ێ�L��yj�5��ϳ�\��kz�N��Ϛ�\-��~�\m��C��_S�<1� �Q�?����t�Ku/��v���:a��0�!:�jf�9��gL�6��?i�%����Z�<��&LiVA��gVA/�I��*�5��
z0M��L#�<���(���U�"L��~����Pm����PM����P��=#l,������.���I�IF�7��6B=nz�m��Fta)7����5Iy��֙$��j�̕�	>v,r�ϭ5������0�0���i�a�OM����OMϗ!>5�P&�)��%e)>5�Jf|jz|�N<�Sӻc�d�9��ǆ��:Ǳ(�Z|�)Ձ�0>��1�	T���ɛ���@G��5/���hm������O�s��׆	�i�Y�p� ���riSEO���t䑢��FU�h����4�26�z7o�|h�!̛�d�z��4�=�F�u�<H@�B˧�k_]�7�����hr��,�F�л�ױ�b��m�x��O��N
b~V��*5���@�ڃ��=�|M$3�,r�?�{�U,��D��k��ˮױ�Mϛ��`����>���u�� ��wMTa��y�YQy�>R��q�X�<�;f�y����X'8qF�ї�h~z9 δ�<��&7�W`�`�?�+�)�����Y�%Z�^��C��m���;�0TKSM<�y]uw�\8���1'�����ퟕ5?W�qsX�L��#�xhmy�H��9����$�b$Nzi_�:�@�H=����u�>PU� �w4����jw�X:��2��x�fC�꺹-j����G
?]DNָ��1�I�<&D�?�B�R�ù��� ��>��u�$� /���"A����U�V
�i����YFJ7f�;�� 8�ᄐ��t.R�
&&8c���Z�c���(�?���&b��>��=�'��v���^z��e��k������^�Ik��͛��wU[	FX4��h`?�P` ���ۻ����-����4X.�|��O׿�`�����@��x(n�)������x 	1��
74�ЊJ�4�X�Z��ns��a F	�^�%ν*1U�|������OKa���7a��s�U��W-B�;�����x˽B��u7e}(�H��h��Jc�o �94Tcʶ��m�^1ƴ�n���A�LIŠ�5\�&s���%e:���z�אW�FJ��}:�C0��J�@tgz`x"[PWq����C~���zCNhժ=�g������	2VJ��4�0�D��A���h�F���j|�l苚�P��S����ֆL�'    uj���e�,6��b���<B���	K�IāϨ�s�&��#M�f�"�`���G������,^|�x��%�Jɾ7���w�Zq<�]s8�в�|,��CU���ۏ�����߉K2��t�,EW�z2���cWtr�Q���1��)��S��Z�@e���^�=�c����J�X?o,._8�/�L��]�Y�t&hِ9Q'��s�w\�8d�A��+{z�7�}>/�xn���H9�$���I��2>�I�y7�q8�D�`�m1	M1&(�n
.J���G�����b	���v��%�Z���SCE�\s�}ӽ�V� '"����h���Mx���"-�������ݻ��q�?^8�72��bf��)*I�̭��`@�`��tD�O�,��̵��-�;�D�ȯ̀%c�A����N�ר��%��	�Úk�2�=�	��x�?WT���x���#��[��a���.L��e��#!���K�W�L����5��~��|�2Az�������f��+%�cwj�G ����kv�Wu��������_I������x�kx�Lβ'��d&����oG�H���o�wWԵb��=�R��ڵ�M�b�4��a�0i�A���s+K�py{�
����-/f}��������:�k��4E]����Z����ѥ��P��)��@����#�.T�e��t�_��$J0���B�e!y��7v���T��.��y�x�eڻP>�:����{$(���)��Y-��=>Bp�e)����ӕ~6k������ �����*���$�M���-��`�I8��(D�1�N�=%t�%�ƴ�Q����W�M���&���s�h��%W�F���#��L�y�	n�\��jF��x��i���O;��&������*t:w�,�S��v�%E��W�2���ҤvwE;H�4qL������,b��3���z�q"�h�X�2�v ��Or�41�ʣ�lY8g�=6�n�¯8��������bo���=�(�����~S�0ل���牞+��<�U�������$�Iw�M��ޥ�f�s�m[��2fN�6v�a�A�<�r�
[��i����̲�:��0�x�6g�Y1 �^���m���=l	�5��
:��le��GJ;:Q0�2OSFzם�*gn1k��
�!�л2�r3o��/���^)��A>�vw����|�3�h:=�Ƣ�P��{n;O��=Y�<�������N��)Z�AK������9�O��#�~d�լ��#����H|�;%A�\�|��Q.wx*��=bD>�����K��l�LV;(��Z(3���^�\��Iۍ:����Z�lt���
�n+~x��^&_)2_{z,�_~����w��k��t��ܨV�s����`�p[T_���@��8�C��R9y0��c72.FE���x�)i����_SC��}�	$?��XM��өط���u�<�UՔç�>q�����O�Vq_������X}�憝o�`v�7���JO�:�Y��t�>���O���36�Ԅp\��
�L-�����HW�E.Z�C���]u4��������|��j�����$ȴLt�o���
��8IY���C�~F��á��+x~}0�G��,�X�G��7�7��^m�|us�����z���X�`}�;eS�u���S�^>����+E/;���Ly��]�5�j�jٟ�;߂�j<Q?#1�8H���]R����=&*.�5q�C���}&�>%7���\[v�5�e�,�F�#��»�bђ>-�x*�I��'�D��f�/
54(�ռ�B)ͣV��ˏ߽�N��yz���Cj��N	5�b5B|z����	?������ITO�;ѐ�MY�z�'��q�c��1�|�4�I����t�V�G��G��u<��r+����ص���:��庠�~$j�ӭ�3�ȵPr^����Ƥ}�\(_\A5�����R-���5�ߩ����"�yY���X1]�ϯ���WȪ	M(�]xȊy2
,C�+�Ƕ�\�&V��Ym��冦��
_��IL�'3񜅾y'z���r�n�ඒ.��C��|��ܖA�E,.��Y����x��<��;4g��Ibz�H�	�eN�V�7�|2��iGO6�Y��!MC�36��W;܂�4bj�T�ˤC��I4�B����d1y���ޚ9I�g����)����|���l�`�C!��W>�G�)���̋OU#�Ɗ}O+�^������V�]�z0F�W����b#-�I���z�eB��&��;�<�K����+��7�*���.��}!�ZH�q�-���$�n\���bXCuT�1o�}��wb�?� �,�&��~G�Za���ؕc�3�JMs�l`����!)�#!� l��r}h�<Ь��Y�kp���0�`Wx,]p��� �/��lJ�5�dJ��m�ArΞA#ad�/W`|�zIe�]�t���TƩ�M���Q�[n�\֊QG���I6����XBW
��E�������/q;�Q�fL����u[��d��0��͎x�ISig�J`�������j�{3m�;b�Ji�^�( ɳ�\W�mI��u]�M��;�o����i$˷|n羡E�C]�b��z��y"�k�X�#=^����X�Rf�ݡ��\��!��2�}Ya�z1K9�A��s�����S��_�_�ٸ3�z~奢��+�_�r�!o�5�'�S�_�"�;����ߢmQO s[Up��-+Ж�,Q<�+���B�N����頕��^�v���Ҟ��9�-���B�h�{��=�.�V�4ޞ�'�6��&rf����ARmO&v[a����|��^<W��j��[�:�2�v���vZ�wt>7	�z7�x��f��cQKGj�[�kơ6���tNc�1�-��M:�&����a�ڰ����yK�5�y\Zy�%�Ӄ��T������i�~6�yGڼ_ ��yG�5���i��[X�H����|��F�v���9m7Ҷ���c��H���S
��i�}N��+�&��%zg�l��Bcm�O!ue���i�{�a��𹜜�_<��g��X[�s��5�X���ӦbmS��nF�6�g[��rbm9g2�4(�|qC�m9|^S�r����RQ�06�X�2�P{~UQ.��%I�Ɔ�������é�Lع:"rz��:^`����^�ZRS,�㺸ov���"��!��0�l�.���VʕۉE�yF�����,V�8:RC�6M��!���+���a�e�0����s9���Prx�sHPz�7X����y7��?��B_�gm���7��{�7���03��$\4���@PYm�'��eV��Dݛ� �,�9�d�"D�.ޯ[s��Tu�gnPE�K)�Z
���^{���$���6��~��$G|����l�c+�[j�5�dT��_�r��}��/8TR���'$S��&S�1�����%R�S�om�z�G̨Q��j_m�_�'w"%mgR�#�a���u�y���p�K{��YDR�c��ձ{�v�������΀��2ȭ;�XM����)
c��M�,�_}������N{�pߎs(k����ij"Δ�G�n�,����13�a���0���4F��{ן��=���@3��j���"��X
6:"�����pC.�>��wܼ���G�D+����k���9�m�-M�"�{��"�*i�$�(�8TÞ����B(���h�ⵑ��Q$	��7���Jb�`N���苢�Ա�H�{)��c�KE�q��u��`�:=<�oK��S-��O�fϕ�����I���A�Tl�Lf}0�Vl!��q�,<KB�H	����+>�HAV�]�X��T(���#=wU������J�?H`v*�\��;�9���C2���f�h�|���m���-�ܔ�V�D���cP�\���\DG�G�Y3}����HC�|,����T�`�S��&R@n�r��ٍH}�(p
x�:Sذ ������b�f?���>�p���#+1k4>    ١t����K�&5���%]��]Y4�'6w�Q���$�6v��V��C��v�4�ԇ��~��QQ���Nh �ԻB�
g,��®����u?#u��%>,<�O�"����}}�`��‡�}�ـ�Yg�p��H�S��e�b����l�AG2�jљ�bo"��F�ǏR=�k0%o?�UO�3�r<�ֹ�c�B����W�s���@w�9X|�91yg}TLH99���[��:K1�]���]7o��i��R��8f��=._��#Bo����T��U��}!�\/��h$��Wx��NmSv|!��+nr�w3�x%�+9���VP?V��*MP���8��گxK��K�5Q�Qo����.avt���>I� GO$"mt��^C���O|�oZ��+��%�?�Uk��mr&-�.T��ʎd7;R�!3`���ޞ7B$����:8��H6��\.�O��zҀNj�8,uED\�e�V��U�5ԯ���+�WX�vW��(	�)̯�H+;��'�O��H�
����p�:ٗu����˫��%�o��fy�TڦGt`��.Y�H�6��� EQ#Xv���$�P���l�#�4�xt�N��Ɩ����d�F��f�����X�j,������dVH�*���vn:
���(f����!Xp
�/�e�a�8��{�|���φ��6�|8���J��C$���9ЄM��:�������Q��R�J8o
�Tb�1ݺ�mKBLq��n�>ƈmq�aM�v��N����i�HD����\�v��#X2{,v�F0�+ު��Z�tk��D��1/����M"6����	@�h_��:'� �#��X�"�)����'J�<�Ѥ�C�`�-��5�n�mv���e�D{ȳ�o�C8o��XJ�#�y��+��X��f��C���lvħ@�O �"�hL�,[�U&�)p��_��K�i����<��K���!F�Pp[r:~D�>/M�[�=+68U�4�%�O����C+W�i���n�! ���lh(�DHi
�8b�c����2���V����P�J@�-d�Y�����8��[)�I���βn��^CB�h*�kJ��2�ޅ�h ��S�Ƹ��s]u���R��[$��Z���n�]��P�*�ͳwl�)���l�"�Lv!�����!�HI�׷�l٤4��D.�T0I�Y[=���"8����6%�h�Ϻ�6~�[
�'���N`�~��S���Ce�|���M�i^/_},�u����1�K�3\t�k�jtx�i}��pd��y�ut����§���j�p�%�5�X��(����ҙ�2�0"C���ܡۘ��9�p�^7\!J��PM5KX,��A�i��n��x�g�h`n{P��Y$x�L)���FG�3 ��G���z#6b9Xzh�-d�O��S��*ۣr�? �t�C[Q��L�f�������?�J��g�o����EQ�>���D�� ��s��D���|}�k��Q�5��}�[!������ϓ���ګY|F��U��Rkr�+
���d���Wh�H�H�s��i���^�������jSZ��ڶt�Z���֊��D#� @>��h�T�{��Ėǀ"ݸ��j��]-~���n����J C%ﰥ������QL���L�-?�'���_�.
�,�ũ��u�[�]n`k�EQ��el�X]����Z~���H�]$gt;�Z�#��������*�oD�?(x�|j&��ʟ7�����)�m��2����K������nS��^�F��H�)�9���>�N�2b$bd�V���R�!g�)�|!S�f2��U�`V�A��mA��A����������l(�#"��2X$�-��/ʹ�Ȝy�@��D>���i_�lv#�4��>U�c�|T(�퐏p��v/sZ��Vv�r-L9���#�g�w�h-����-�E�%�8�$�c�}���,���۟�=;e
:m�bR���-8�-cKd'��0���Z�c\׶=�
����ܘ�γ1�F���P�J|ԯ�T
��`�����m��R��}�Rb	�aC�+E�
�|>T����ܻ6Ǎ���{E��)��]�]���=3�M�̻�T���[�5�n�J�>���C� ś.�8�o�n9�@\H$A���� ��%<M_u���	{DX�ZclΆ��2G�KlgR!٣�/&q�V_�K�i��r^䑖Id��� V]BO3~	�\�Xbċ0���<bc�	��6��3¬U�b�*�ff�9��X��M}#���;v��-�|��T�o���#y��f������`���#V1���49�%Y]�ĬF�"sэߥi�>^O��^��`��.j�᛻��'+���3\{��u��U�dB�ɯ�(���P��GN	3'�=��i�%�3���v��,Pο��״euqS�x��s���nr+zu�5n��Pd_�~;*��H	��lȰ�|i6�X�����ט�ގx�$r�O���aS�W�����'�z�N�Ԣ1ܝ�9�}����}s"����o�k>�ʗ(��Ty�y8��
�5�,p"�*��k�*�Utҝ�x�Om_ n�(Dә'�2'�f�����VB��ȓQ7գE�Ee_���N����P�`t�C;}����-��>v����m���^�ԃc�yvA�4��)�La&!wҨH�~�9v���e ��� �4{�͕�����+H8�	<�����v_	6��������ߟ��b,<�&�R��s%�|(�U\���'8k#&c6�`����A+���p!��Tқ �jd�[RˉZ�f�;M�@2$Y0�+�#+��Y�`��R���Z>X��,�ӆr�|�@�qPT̋��|U9�9#ӭ
���xN��X�3_k��[��V7קz�/�T�=���ˮ:��V��x��W{�~v��.��;����۽h4`�h�S��Kxv�	'��Q/y��������w���e��'��M$��63 f�OrE�cG � �M�r˶���U���+�Y�]n�(��;�\�b^W�l�¹>�t���Hrײ��'"!�,�B�j(��[�5<Hҋy��"���1���9��[�[��o��#�ys�J o�
�Ψ)e��û���S���F��n:t���֘o������DlE����P����V+.�C&yE0PXx<V��?�i@Ջ(��BÏ_�@�� Pta���m���~Q�zD��hp���+\������Z�n�L�R�T�䇑�ji�s	W�@�F桱i��T[4�w, ,_`g��[z݌�c:�/<�ac��뵺����H�}�yE)k�A�z?��$_h���p mq�6��^(��V#`�� ̫d��|>�B/��։����
��1��K�WR�pm�MS�{�z.caoq{j�h��ݷ"`���#�h��{�_��{�O�IQ�(��$]��?|�Ő���u*���V?	���T|��:Y�V�~*���b���6}y�~������YvY��5����|�R��}�������PZ+�A:��XQ���F�I���,���Rq,���*^�ݞ�K������7�)����T<x��0�|
T'�m?B~�QV��R%o���hu�� v�*�ODm�C�O�羅
�G=I;�^*`/�������ԓ6��TO�舯
�W=�d��
�[�01�����Փpq��
�c=���Y46�G��)�b}��%@�����P�]!��'ke���O��)�qg�zc�Ȣ4-�����`	��������L8����5<�Cv�O/��Cv�?T�%�0dg�d���Cv�?B�8EOѣ��-�/���|��[>o����=�(#v�?��q�����������2��G��BO�ƈ}�`a�KF�%�Ԛ���_�E".�{��ӹ>4b�c�s�7�a?�!��R)��k OCl�_��/���q��|�f�=b��I�w���S�z�ϋ��=E�#N.f'��ri^-f����X��bvcO�Ĺ~+f���8�Qa͇�M    )���b��Ĥ���3:��SL�r�H���S������9���{m��O���]��om�G&�#�Ɲh�N�/�c��&�e�Z>��p�n�/W̄�N.��Q2��v��f4O������a�T��T�py�\��\�W�𜨗:Z�hK��#KԾ��y���oOٷ?Y+��;e��dm���}�ӷ5�S��?D�	_���}��G�iz���|�g��3�8K�b�~��89���G7�	��A��@������H&����i�t�~������n��~/c���m������ӵ1��2�sO*Є�ؿ}w�#~-c��ti�,�|���~,c?����e쏞R�s�	�?~{�m�a��}��X�X9{���;�r�QO�ָ���c=q���+g���Z�f9{�(�o�ٷ=q�#�.gO�����^�~�/m��/�3x�O��'�8���!����̨�u��+d�+者;A��������-�����w�;��k�^�`/�_gm������<N���->�H��x�J�ި�k��JU��%�I�S�����>��+��U��}AI��K,��]�]�7��$W�$��b��ٰ��oN@��6�Eoؗ�Z���;BR'^5�|BG.�e{#���W7��:)i�~0uSSBE~(ѱ�۪C���1C������ބ�/mJ��O�� ¤~�������KU�S�� ���{�,$�/bA� �!��I��j�?�͇l.a�G��!|ec&(S���=�lj&�(_���ב�Z ԰(ߧ�15'�x�r��n�\W.�����<z0�M���Vk�m���~s/��p�]䢩�U=G�J[9J{1���C�FDb�9�|(Hh��: ���{��<l�I䞽a�.��l�yB�l�%h[�U���wXD$�V���b��VKr�<9�6�&��M��v)<�Ɗ�'��u�.�R����_��y}���(U��\��wX	=�|�U�����*��C��5��3(�M�̒+�8��1"N�Z�2aq�����к<BTr�:Ae��rh0��*X���;�o�Pv6ݡ��m�[C9"���h��%���<ESZI�myW%�{_�؈$=����A`��9��ޜ'�Ƅ*�p1ߤodP�
�0�5=�� b���)(�s��N��>��:�>nؐU��Ŗ��jȣJb,2g.�������*�X���N7#�G��G����=Af�X��b����d�Nf	�ѡq�F=Z����֋���~���E-"�=��u�4�]˗�%�Kx��X�p2��3ȇԯ9��/�8�\�2�"~���#b��x� t)�Z��ߧ��LdӺ���NQG���bFm���eg�h2/�߶����m"��I�뻶+������ԯ�P-qB���v�~&X��4gP�|�.��OZb�?���60���@5�JU�PB�mY�\ʦ��4Tc�
^!��m8�	=��
�,E����-�AҐ��K��'��p6�ِ7,5p�y1�P������f/K���֝��|������Z��c
9�9�7o�ޡ��S����v*˙���GD�U,T�O�d�h�[%E ��������lUY��Z���|lN ��%>w�I!d��T�L�2�3�3I�!��1�B�P�/�MɃ�ŴSzJc��c�jMrZe�~�7��b�(�j�|�]b]��t�c�0ěӝ�sȟ��Nx�Qk!"��I�a�(,�W2B��ϜPٷ���'a��B8ѯ�j���R%�^���-1�na1���q�ƃ���ߤ���6gLߴ8g�b�Y�7�H-�M�Ŗ�*L�q�= �|=�	O-�r��� �h���%����]p���
>N�{PX������RV�!ĉ}<�Mہ{ֹ�"%D��cG3Ō��}o$�BQ@��|�+T���%~����)h�ꬡQ.�/4�D��Ɲ�.gAs�#E�1���&1�&�Nڃ��󥂻޷]�6ܫNt��c_�B/B���	��$���������m	��J9�d-~��8�}��N+��
"�O1W�,����%r&����
W�8�`>��B��/�n%�Nщ��k}����jT���$`�P׻������g\��P�#@����"�C}�-\hiY۬I��V�>w7'�x��M,��GI���b?U�D�9���E�|~!��y��MB:�g"�4��|y�Kz�X;X��Q�W���������'��0��?�<�
^�,|=Qt>& svW~�:O1��l�FUm˵|uR�E�l�n�c~cx�g	����XX�'���b���F&�+����P%�%=��Q]Ĕ�Oc����GB����B�������ML��^�c�h͓��&!/����1��SՉ�Q�^.mp�Z�쥍6����18��&snr���R�.k�p��ā��Pyh�4�D(O�H��<��,ǽ�d��~N�����3�<	xWx�C�ݞ���z�WB��T�y4��~�C�KAe���X]�_�0j��U6���0Gə۪�^]*�OFa\J� �b���3ʚH�~(^4�\��6Pp��<n�i$�[��7]jJI1򁕰}Qʧ� ,��R焘�Q�B�Q����R9CM�����h����$+Y��ps�W�ؓ��!JFW�QN\������S�MX-�n�� ��WS�P�:�j����]򥘦��v�|�
��R��6�ǞG��~FD b9�w\����8�M�)kG��^��#f\�ոOQY�^�Շ�rf��:�c�?��ڧ��h�[{�ё֟7Mu8J�/��G/�F'�o�Pu����Bapߤ��n��S��%s���s�H��F�ox���#%6{"f���m����c��r�&l>$� w�!��%�c�0!ü�Z��<
=�O�l�#��������bVL�.$ە}+F��>��/���W�V�6��vbּ	jDs��@�mC�y�rC�	��j]��l���vW��^9��0�?E�_+�y-eӦ�
���d�7D�q��і
U�k���A�6��'��nK����Y�[!-V,n:��_��Ĳ��'tD
S���|��o�仔u�w����˭p��<�3}�W���qhF��gmAt[n�0�`�SʰN�T����b>�eB�b�,��VAZ���e�A�A�(����4��ʥ2���ԇvb�̯�jb3�t36���ۣ��gP|!Ƌ��;xM�피� �7�O7Kq��z����� ��l�<I%�Mo���6�(Г�(���燙)`3M5}��6����J��M��Ų�m�x2C�l��v~��B��h�g�(d�;�>�$��X��p��D�@Of���4�ԏ1TĆ�j�[El�)zg��x��T��S��l+?ē*gC���c��_Nj�<�l�Qbgۇ��=1F���~2�l�%M�l�%,�a��r��a�\X*Z��ѝFwm��]��Ŀ�zw*����Ө�c'�E%!�|�_U�嶲Z
=�]��҈6c�_ߖ��Qn������P7�~��_a���o����Mu{���/H)gJ�L�QeA���*<2���pi����)�d��7�p�l�`̢�.U�`���oٿo��q���6�½�s,�O}����Etz���*g�e��i�Yq�*�%S�Km�
(�I�F{�z�ޢ pc�k��5�^M�bp��W�'�w��d�u�_�k�W�m�&���k�_����b_�u%���~m�\�8��![`S�l3=ÚaH�ya]E���
�<%�!����5���UB��f�Qh1e�Eo/j~,/ڻI�[�91`'5O y��B�x��zV\����
�1$ܫ!�e�i4j�����D8SؔM�r��oO�}Z�ǖmx8*f�{�%�C���%�@4HZ8�[��5)~;V_��״�����&t|�2�gs��,� ���k�6V����[�9�d�d{ha�L���uj�j2�z%�WT� l����Y��q ��R����W�"xS��S���
�K��#h>YI��V�Qt��O��0+��w����KS��a���B��v_��4e�]�@���*    }k�2��ǆD}ٻ4����S?�������u�+q\Fl$�I��%���������3I,��3�����y)�}���j�a:�h��>e1.^}�	�j*��\�l�X�uW�$X���^�5�l$��m��A�Z�GM�l8g|�|�������0�;c�D�JV�be�#a��o��s���1Z<��\���"a]1q��Dĩ�#1���z���g:pZ}[7M��I���'^�/H;gڬǁ��d�#5!{'u����x��.�-�9+7_��qz9t�XsX�mEΚ�M{��z*�T�H9��|�	.��.$����&�C������3*����_��6��#���ݩ�;��P�i[}�� )���K-���x�_䗏6�͍�jo�ȶP��q�a7�|d��dܜ1gd%i��=+]����^(�!o��`���Y+=��
p\�������#X��W'��7�&ta *�l	*�B���ѡr��D�5%kŬ���W$K�s������<'E��	�������6ȟ��p�b��<'�s� F[��JॲÚ=B�?V2y��W���&G�?����'(�FtR�5���'b�u 9E�ϡ�Y��|#~���Ƕ����Dʗ��0]x���e,�b��խp�p'{WW�Ct�kK� kCG��r�jX�DI�U�>	��
�R��e�p�-ܺh4dP�m[�+�̄1Xlo��1�1V%��^	ۻ���\��!��I!YHAl3�%l�G�>��$l�G4��]$l�3Zx2G�p�x|�3-��~����� �T��	���ާX�u����v��EW��To�7 ��^D�y�����*� �M��t#���Dy{�I��)�C-#��}�l���4Ս��p$�����[o����#�b�;�a��J�JM	7���������b���:W �����+��xw���:�{�=�߃��������j+�%|����oڽ� #'�����ڦ�������(����[|�~5�������I}����PΫ_�;fl�����\r�M�:\��Ÿ=�6 �C�ȥX����� ���^�]� k�m�l�	d�(��p�ן���ۊ���]{{�+�_�N�t�pH�W��䀺�%qx�D�>E�+�5���ǒ�hC�Y�n�_̊�Q8u���z-���b��Q��k�/OF�rW��S�p-V���P�6*L�^��Z(�	<!^�x�<�����8�ۜ���Zh����]ʯ��={����X����ߟck�S�v�T
��Uy�;D��UýP�9���I�qì�6���������Y�NL�Òm�����*��q-]�a�U�ם�J+�
��hR>@yWa�M1QVx��D~2Xٔcؼ��l�����ُz�x���x̅$��R�h�J�k�El�Lw��������Gd�l�ϗe�@�����w1f�!d��=
��ҌҟRl�J�%m~\��XUMu�[��S����M������_�b��&^7�ye�o���Z�K$4�[����/�����0�T�2\���X�ïܩK�SǬK���"$B?��4C�1舡�h��,�.�`�ƃ]�`+�R�;���Aj� �Z"��r�6\�EjR��ǵ�D"��v� � �);��ZUOծ��@��� *��J������w4	k:�F�կ� �(�|��MC� a'��mWy{���nf�x�*��F:s�Ĵ�k�A���F��$~�τ}��_�k,�Jt_=��g����H.����8�
����v_	J|�����X�u
G�Xĕ0�~�a��j�i���N�1����`�:�7|�q��;1���ND���=���n����FC%��;'�fӶ"��a�(6m$U(>���M"�e�x���zM����l��T?���T~Cۆb�QmOM9���h%_,����x�Uv��?�{�tPǙ�������*�W=����כ��RY�&��x��3r��=�Z;�|%������Ku��ۦ�0ot%\����jP��w��?J
�#����#��Fd^��e��#�N�I��#1���c��5�i��ַ��`ee����l�� uS9��DB��mS�
��=�	x�P�<Ҵ��Q��GK�ĕ1���/IW�v����$$����R�Ϲ&��B阻�Am��ba�`^s�/�x��llr���#nBaf��X{����m ��z��[����gb�C@�7��|��� �L
��sA����[ݫ7-�b���p`�T_K�I�����a%$3!>�az�2�H$a"�{dW�"V �2�K����[�|p���(��Bf�"�ΌP�ʘ֧�{ʗ.��54�4�Q���Ѵw�P�z���RC0<�t���CRS��1@]��$�rF�b�C=HO#�\#���oc�����k) ��@��P%ԋ�\������\�P��-�e$�g��'�.]&�����*r#�ʐ�p(��T�~��S��a�a����a�!k�3�����޳?V��}%x��WPD�-�	%��@�"ƭf7w�/�#j�+�u��ЉYg�w:�7˳�;��}�e|�S��0y+v��K%�����rؤ���i�^3(�^FO4�^'���y��w-�� �^ܔ}�l��ҝ��m%��=Tj�� �x����g��J��Y����'#;�6�P�N �_nOw�7��� L�o4}��3y�RiVS�٥�,��{IE[|j��0M.�6ym[�-��3�#�j(�ާW��v������L�e��O�*1X���PN'q��B]?9$�hR#��.��F[�[�N㌮\Z8��Ӕ��^ ����<���N!��}x�9΀�]+�(�β��/�q�A����}��-˦�OG��H�*?�����D��Fd|)����\6QL��� �����E@:b��þ��x��_E�Ѫh�UA���"c�g�*�~[��Z$B���]���KѵaôB�K�k����*{�0�+,����}�c�?���h��� �+�_0���X2@���q~��Y�y+O@����t�S�.���V|�����X�`^�����IE�I�A��3H��5P��!�b6�S
��W�S�$�� o����ZK����>&�6Xc�v����+��nˮ��U��#<�w,��2ݒ6g#B9�^9��tc��c�T��L2�o��xn}7�ѥ;�X���o8���tʹ��+3�yd��������OEA<�g�G��g��!A�U.&0"}�@Z����K�䫘��L�o�G�����܄]��_�	�[�%�p��B`���ε#�]�`�:���=�@6[�C�gxs�C���s�mF�A �A�/"7�1M���x��[:����	�g �af��q��U;�!UKL	#�`؀���;��� #II�L�[Dm����NJV��?�J�+�~�^
\�*��4�턤88	��Iܽ��;ç%������NxT�O�>�,��yGk\�>&W��������~[7��>����(F�@�(c�0'���/��\4!�&�`?����nl��i����"������e�e��� �N�C�x�W�|��-�G����Bp\��ս��hs��z��ϧF,�� p��Z֕[�S�Z��%ܟ���-�v˥.��A���&䣲Ie�t���Xٙ-+����oƊt+D`�x���D8B�QekՁ9�-�w���88�F�J؄a��E�2�#�ـ��&g��4Y��?��5 ����l0��5��j�4�1����9�/gZ������m�<bh����SE�r�D�w.o��������u�7��}���fJ%��ח�s$�3�1����
Ƣ���g�WFb�h�F���j�B��ц��ߪ���ï���^��\���.��i��38iMט�xn�#jq��<�(%����m��ׇ� ��5W�oOuӔ��⧲�*�S5��J�m����lF�֭�(p蓌L��,T����hb�t?�L#�2����q)P�I    >�_e�4VQ����X:�ߚG%�-#t���XeS4}�k�ϒN�4��1����2c�gP�n���*Ӯ:�7�zL��x}�A����!V|�ߢ�����O��z*����Y"t����X�Hc���+P��3��!�P���D�����H��QB�i-XK,�7i��+�>
|�ſ���拕;�iHkc%4�4���DL�+����
�|��6,��٤��A8 p9J��U_w�3P�3-�N66���[v=��Xx���vTC�FVYvXS��o3���T�;*�q���֌,wd�U��^z����I'�7��*�H�ȆX�sn� a3 �E���G��.��e,��)���ʨդ�ō��;aybR����2t��NAY�
�#\m�l�aК��5��]��/��s�����6�����)��_W��O}XҘ��Bw4R7fl;L�؈;���_�R�n��(&��z����ǋ#��M�YtͲ|���"6~4X�)f�'�qB�)Xm�E��|�ع�|��?ÐPު*�[��:���"d���j�.~��;1U��T4��ɒz�X<�K���w�mR�b�w��$}�I�����׷>#��=x��fĀ�0@��{�":��c@��N�M��v|�9��F[��l,�xZ��<F����y�
��^:���G���8o������LAc��W6%�i��$\B�KD�'�<��Q�=�+�B���������$�{��'!� ��8"57� '!���k����uS���U��/�2��N�ׅ
tDZ����W�Z `΀��kC��Ֆ� ~�� ��bȄF`,`��_p�f�cmOT{#"��x��y����u���z��A��kf,�zN���\!��e+��x��!E�ޅ�|'nGSES ��^�*�	��U��������$_bUK"�OCBhٚ�@���+���[n�;�s�\� d̐�&<:�X�$�c�Qmh#U���z��e.W�m�)b>�s�v��f��3�EC"��V��<��R�D��}O�̀U7g��l����Y�V�W���喫���s�ֹO��z���T5-y;����ܠ�HX{	^5��ӐZ�0!�hݹ#).'���5#��Ҧ�ۤ����k���������@�_���}j�s���R'�A�,�����cǔ5�ep�֢�n��hZh��̭�0�ë3�w}�f���o��C�Ji�A^�^��f�i:؃� QZ��;C�	l��f��;!l�}�WW��궂Z�@�A^��JE�ʼ�8��A���%���҂�Q�3=z�m��b�Y�
6z1�z��f7�	��#��X���󝅟O��d׏�]	��N-����)Xwn�����^����Ejx���~*��:���^�$P�X�[H� y�`_U����������'�;Ӏ�Y0�{B��;R(Q�7�MH�D�X����� q_9Ё��������ke%�=�ߩ�	X�·��}:��F�	q��[%��.]�R����6��f�dS*3k���p�r[W��wX�u�����C6x8���O�u�lF�FZ/�pq����qb���GY��{��7�L�Vܩ���6�ǵ1��N
k	�E�=��s�`Y����ږ[8e��S�����)���BFz}��Z��#�Q�\����
-�(�(�e�G��l�à����I�������B�eIT�1�|Jgc6(\�yCC6�缛�v�| l��վ	�Hi�< ���o�2�5��)�J��!�D�-�(�I%f��{B��+_b��V���N�]�^��l-b��5zZ��n�4��`΄�\�,\�x=�B����µ��.*e�.i��Sw���5d���[`�c�Um-� H�H0W�#�������|^r�C-��~Y�N��p�N�G��'��x��B�#����U1 �&:{W�{��9@$�Q�-l>�B�F<��>�W�ʁ2²�3�!yq0̥_�Vt+S�+x��2�K����U>����q��A�xB���P1�*|��X$w��6��;�L4��	��3�D�F1'����1�� ��,�K���O��D�Vd!~�R
�T�o�4QÅ5���� T��7י	�O�egN�dٟ��81K8YH�T����Cm|����U�|���g&݄I�M�tʬ����l��T�p_!s�r�7�J��ka]��b�%���l��Ӂ�]���O^+#x��V��5W�*u��1��ka����t5���v�ΉZ�X�������*|c��U�)*z=+�Xn��p	{�ͱ�>�a`�|Ejl�0
O
��w���]���+��sӊ �� ��4�X��Dt���%\c�y>fxc2a��lVr�	��|�)��um�)mz&�W0���A(�`�?iz�J�3&���\��d��Y�&�F\%Ǥ�D0������J܂��"B�^p��#8��?o�*����,�)���~�=CiM��}'VSPԡ��_z�8�4���@5�"��C�#�
o�eB�o%gޒ�0{�(�D]�c���,��q�A�^�;�|N���[�}�)jzŔI�!���N�8/�s� ���� �PK�*� ��)|T��p:�� ]6����j#o���v��9.�	�8>n�N�tf|�(	Rqhd~�3�L��"4{�S�a���%~��C���>�w�!YA�"�.�l����/|�~[����:��*�#L8�O~|�"�w�!s����z���k�u�Mr��%LB�&�b����bZ�k%eq5�!�B@�- ��U7e c�����:~��䲲� �p��(*�@��ح��3V\���:,�[����z(y�_5ܟظ�p%��zN�\��D^�c>���qg�a4j0��Eb��1�rV����7���H(p9����¼qd��p�Y��s=Vc�З����� ��;�'����\ G�d�a5w/t�C��N�8/�s�zk�9�Ϟ�V��
�V���8�#��$ߵC$ d�m��KE�(�n���_V��#��v�8ްa��~�6�:>Ӂ�	�}-�X0��J�pHR3�0�vF�;��N'��S�X������;d {F���f�m�{��F,q��T��{g��V!f�����m��S��}"k̈́�fz(��Z��6Ǹ���( B<#��G�J<�'N����y!���P����E� �j$P8����q�ZeN�	l�d���h�*��Z�ˇ���&��cb�[������D�ֱ�R���u�P��rP�tٴ����V�AO�;�X�7�2�+I\n�Љ��_�@���-+��R����5f��{ab.+�k� J_[]x�����M�\f���&!��;�Z����r���W0���E#�I�{�vZ(c,wl)���4�#b3|�hy��ߍs�
��mJ�m��.կ���Z�ʉ���7\j������i%\_l>\/f�{T?����wцUԋ�4%�9?�Uӣ��L#��t�vF�t��WX� �x�>���)cRb8 -7t�F�c/���}�������
�X�'x��>v(c 	�Ix��з^���4��:~����(Ny���SZ0�ݾ�.\xW�b,ќ�.(�����5/bo)��C6Vx'��@{�.���SF�$�s=L*i0���dl�g�L�N�L�J�� �)$�c`<�Ss�&�;�:��%O�$�)�y$*\�{{��H�K�Ƙt�3�M�}̘���9^+�n��]�
9S�|�%��\�������'�%�_�v���|JC��ѝ�˶ﰼ7��cw���;��M�>��^`��5p�� ���A�Sa�F�
���1+{WꠉTe�;�IGH����*��,Cd�t�t�ۈ��F���J���ڻ���
�%�|�:���W
�_<v>����r�8g��wX�:�EvV���9I�Q�������$��d��|���dC���fъ�C!�nS�B�?��n���    �	�8�#��$|�﫯^�lO� �$|���K���^>����4���^(�s~�7vH/��v�]+`�������P�^�_/�w���?T���W�Z����;���"l�q���`k�nM�H�	T�8±v��&��<�tb]\��▎(���I�Vn�$�;���M����aA�Q�Y���a1��� ���"��M����Yi��B��f�WI�K�opG�/U����D�=�2��L�g1X��2:-�A��a��q��C�1a
&2���U爷�n�9iܔݰ�ʭ7,�OHx/}WɎ���$c`�M�q݋��V��%R_�u�2!��+�u�D"f�Ob�����-�S�Ժ�l���_kHB�t�>p����}���2k��b�P��0��-+\�I׻�F.`��ܷ�<�;,�?����Y��A��А�pq&��@�*ͮ�;�DHm��V��Ъ0"��X5��S$7]�ǳ	T
 ��b�3�����b/���[W� V8� ~|>����+�L��jU��j�܋u	u���?ȩC����[�v�Vu�7d�ZP���61��Y��)���dk��Gl�($c�Xp�r6t��E���O N�����v�p��J]w��D��Dew,�&��{(�`f�p�����J)��jԠ�������_0����1�ٱ�� _Ab�f"<���L��Ρ3%��h��Q�+��s�}~e������\�ݸ��ݩ��5t�,,M�KLn��#	�x�͡��w��%_����LÇK������H<=����C�/$�˪954z�BoS�$V�y�5��6e�;������ė�`�H�yu��b ���4/S�i��o))i,�u�X�8�Z���|�EHK�*�O�W-X��A.��z��/��$�t�;��#N�i��	�k����'H<-��~{:B%�m��suA�	����*�p��u�Drނ2�;,�M$M�k$n�<�k���䠶S��R8J	_����4d3z��*�;yP�72K)W��3�(\A��?�C��$���#�}��v]8�005BB
�p�^�7�����K�C�x�'�.\˄�&0�� ���*�#�.M%^jʠpF�Ҕ������!e���Ӎ�Ox)��59h$e[m�>�E)�� F
ѧJM{J��ϨçA�}j�ކ�$\f�-��k|���+c��[�0���9�Y�|�{�����j"KR��p!��`��X���&���b�N���y�dY�7��At� �d����}?|��u�ag5-X�K
��sPLn�x�3�?q/n���(��R{���w���w�������'�e�y�X�~��Sؽ�
�� ���k�H���͌��"Q�֠b7���0p��:�=|tj̺1���ch�M�@R��ʨN�iW���IL�'L�f���|��Qgc�_#H�X(��ј�>���C��X�%�-�(������y&;>�;�����t��ǫ?$AyW���Hu!��.�/��eb�ڹ?����:���u���kYo^QB�.
Lr���K�2��$��iZ/������!c,��I�dd��؏�.��3bE+�3~��,a�.�R|q�Uq��?�8j��λ��؆�I��̟�^8�u�P6�^�7�a�Ƀ8�H6�D�#�y�p@� ���RA�P�h��NN��1	��=�����;�XX���g�>V���*����N���ۯ5�VW�2dH,���VSC�����ȸE��ir ��!�:Xgc�5�>��2!��$f�=!�D�s��sR�X^y��<�*Z�R��$$+O`�y��e^�P�H�HԐ!^�=ֳaC����L��M'��)��bl����/s�
U`A��j��
M\�e`�m��W�I�Ut1<v�я���]��?m���9��q�^�e	x۲C$fR�LoT��B�F[��Ō���h�
|����l!�%g2ڀE��HV��kgQ/̞�6["�jgi muYS�PG��|+/ti��a��ىJ�÷O���	O���1
=�|�?�� ��Oݶ�؝�շ���������&|L�`nb	p�v0�#��`榫p%��A���� ��`���kh�ZJ`R�̼0(�)3�PO>���:C��0v�����_C�=��Mu������ZbD^.85:�L`��e�M�p���E
y������� ��PH�=��C��?����b��:I�Lm�-�T1�s�<u��	�*17F�X��A5(7�\6B#����b�K��O4�w1U��~ؽѱ�	�s�F������e��_	U�+�����%�?v՞&��]s�1e��U i�ܚƼ�b\<q,��̕e
r�=��&@�U��c=	�39��U�0ȂQ/v�د������q�Ն��P�k���U'��"j1�*˾�������+�
S&_��>��{,gK��hV��G3�QB��q���j�F���an��x,L��YC&R*Q�I5�mG짬�T;��_1SVIj�����'e���z��(L��vlpO���*��٤����� �P�5�BZ �*���	2^%e��l�YM�t��@�fr����F}/z cM���	�����r�rw�Q� ����f��9"/����zl+�h�0��L�E$�bjD�R��(��B���	�b�-��g�l�bd�� �煰JF�"&þ��e1��W�G0��{I���1.��@º��=����=V"^ ���>C��: [�P�	p�P�g/�X��,��G
B�b�e��#�9"W~n#�v���U�wQV2]�?�G穁����|_�H
�1D�u�`͛0�����P�4%�)y8E��QDg�����{�fL�N|?.Q1ݜOS�Ђ�ş���_��R�cmK�0ر|���`b�gX�S�9a�[��~��*	ɑ���_�4ᕄ��v����RM�B�B�p�ܝ�,�	@�d���Hk^*�ЫK%����hB�4���͢� ��,J�s�hx�ؑf�ٟn�T��(��7�{��}H���0� (q�cK���W���ǚ�K��L��ј�Y?Z]7w���^�r�r{�����|�j|�D�bYB���0x��c.�	S�t�Y�I��nJ:げjr�������h�=MS���\��:��a��J�n�]�������o۲�}���*�K���������ČCIes����ۂ\�<Kh£�'iP��f�>�Bsn�f��]d��^8Խ���q���bc�� ����h2�����k�R]ςt�����
.Y7U��Ţ��x���LN�5�shԩ{x�Jk.a�$F̨B�5��C�XH��5�DL�ޕ{�>�����k�2��� ���]D"�8)�
�N_��տC�Rq����Ëa����P�bM�\*�`�n�A��{,
L���1Aq��|6ܦ+��z�����f2�70��+ƛ��xǟ���"~1�oo���3����IkLg�tfD�a^�#h��/5s
��X�/���"�&+�;�l�;���=��4�x�؅tw�Z,���M8K���ه��,��-`4���5��c,ٻ-#�>�g�Ō�`�
��[Ct�Es�>k��Vc���h� .�8=��e�gƵqD���-��������1,��:15m����`�>U��cU\�}Uu]��"V'��қz��9��#�:�u��jk��($Xhha���{�r;M`�5 �{�_�T�&f�M#�P�yT�=���@���q��K�عL�۴�����yR�a�����~~��������`%`�x��R���pp��$�,"�NV�-!���պ. �;�²��:Rk����M@�qS��.Қ~���X	�'�v(g���5i�.E6�h���)+�[v�"��)�ߏ3I,���%��D@;
��g����vی5�/��m���:�o5dj,7-���|-�U��xP�@yk�~Z�~-H�A
���h���$Au    �z�p��6x�!MU������{�{���^���ˉ����v�LaA���U�c�-�^��D"��|�P��Gn���{������4����!�(��2�~�֒{��� v&���^'�n��vo�Nd�Ǽ^p�x�8�Wa� J�t�Lp���?B��"_�ŌNI����;Z����;�[H:����zH^xƵ�<5�����Z�-M�qA�1-}�H�NzV�}��1�1b�xS�tm�@�#�:��$+�+2Y^V' �tDܲٴX���1��Y�|�BU�ɽ[� !�ʧyC�b�%�H&F6�����I�^�a��Y��cGﱈ�,�^]q�q��u�x�S���T�����kR<xӕPr�$;�ыyy6�	�+]��"�w]yB�`׽Uh�<�FE����ݞ�	1K_u��XU�n[pv[�yH����$�H�E+��iL��W�=��11�_�i7��Ǽ��?y8��\�C�@'ꗉy#�q�xɩ7{S#H�+[0����#���(�_k�Kl8��6nb��}��M},Y���|�&)S˦�/9y,N<�X�u;���'6���Fp�u����p-�	R�7`܏PT��-=S7R�+j�qj�cxf��b��3$�~�@X�lu݉�LG�8\1�*�)+I�&��t0z
B�>H����'u�|����?o��Q��/1DnE\ y,�w���Ԁʩ,IL���Qċ8GMr&ۼBЯo���9e�CD%�#���8�����a#��Ԏ�L
mܡ<����۵��N�T*�)�z(+c��6�i�����d�K�Q���!���ܘ��l ����	(֢��c�Fu>&��xD�KVu���5�+�Vp-]U���!���ݑ�rJ �R5T��s�ʹ	�>�5�I�18c��	�$�4S�n	���hk#����&�3���aR�=���͔]e�Y�A�S���'���0�q����O2y�3��1��a�w4��A����䖯�^=Α~����Tg68��p%����8���c���X�t�� �L��y[ҍ=����z���T�gX���Á����"gH*|,)Jo�l&��%T����r�{,��8�7���d��WG�m�ʐJz��I�z�i"̔�)��L�̘A�㍰�,��N�Z�&$#�#�6��-5�x���x�ս,�mnZzy�=��=�@�B��ǽyj�J���:�E�T���A'�����汱�[ X�v��H��xܣ�h��M�6C6hu�-f�?���2gb�|�����
���� F��0G�ݐO`2z���4�F,��U���G�TQ��fխ�|S�*��&�j�Vxa����~��Q��HnR�'�I$��M�gHKif�(�8ԭ.eόx��j�&k7Z�6�nC���xu�&�2�{�,ӓ�ޠ�8o��j��o5�o�ؙ�;=X>	?y�ě�H�Cf�����W%���}83�T�4g�V#(J�n8P�R�bǳ`O�/�s�ζg�����=S6�bL-�Lټ����2eC/�G��\L,�|�_����{�5�wJ/�1�<@�x:9��*� ,[9��n�X;��e��XkJ� f��Z
��&��k0T�C�;\6���n���,0\ݖ�(ߧ��H1#�6��{�i�s����	���;����w�Ga�y�|Vؕr>h��C
��~��;V��&w8�V�B�9 �>�ĳp|}��3o�{�Z���Ů�$ܯ�s5�wu#�-�ם'��h�Bs������D�[��J9��@ߡ#�S����4�����+�D����J�f0�U\��31�%+���"(x��<�K�Cׄ,G��󃝂��kbx�����LآX�Í��K�'��Ĳ�D�`��:]Z���#�ږv1�fcAcD�G��.��r�Rd0�ٷ��H�@s�<��S� y���a%d�{2 ������;<	"_�Ӑ�8�i��r�����yKGMjn��7�����[�/�o0�c��𵛞�6�|>Ag�0s���\]�Ŀ|.SN�����x�6.�����D��^v)�44r_����5��wA����z��v`Z�6��6x����F�yΕ���p��ʉ�܋ho^ڎ.d�Xx���3'�C͹�%��c�|B�S ~+��/O[@Ff����w������[��t�GU�/���Ŏ�����
@#�U��bu?�vH��R���㐮#A�`
EY|(=� ��Ol1��1�Ü3��c��g��z���d�a����ç�����:M|9�ܱ��b'3ʷGb̝jF��$s7�a�׋2��9g[F�$�̸Ke#7&ջ0�kw�� !h�������#e�B�D+�ᶴn:fh}�c�B����A-qY�*[�Zm:�)W�O�l=W��Ρ���?��՞2I巈[](#Z�8XZpy `+��]Ŋ��Q�C��\!N�8�V�/�U�F��8�/U��۷f�͡g��B"�F����*1B��|)������C'Pt �8'>+xp��w��"�3)�M��������՛���1��n���,�v��Ȕ��|F�|c�&l��/���b��X*�.\w�-$�N2-�E���'8rY�W�y���qX���RnX��&�Y�t�e*���
U���i��xy_��P�����xW�ux][���O���|���h
��P)��XNȗ�J�^t҈jգz�6Z��~)��cz��T6����n�c��qv�X[� R,%k4"�3:��h�t��ʴ�<Vj1�Гe��(<�9Z����Ө\M����8�a�;���w�4���T�����ݩ<���Uma�z{��GY�&4��K�af"�!|����t?��D���ooa�r/��^�X�"��գ.��!���z�zN�0��S�� ܟ��uGfHUN��E�{����P5r=���Kj�wjЃ����J�`�D�
��{�
���,�])P5�@��!�Ȕ2L���t��=Tߝ�]X�<� �h�
����ڪX��Ou;c_�\��i��p�=��YI�����V{y�S����JNlW��pz
�乒�D"y^��� �W'�xO��f@��z�/��xf1�Ƣ{��o��yy�]�Lwb�4���+-�H��s���,y�%�J|>?�g0��܇|���d��V(��+���>�����:�?�����-<0-���d�kD�\��<W��Y+|�nVd�ٯ��P밹��`K����⭍'C�_�(�YnH&��g= ,P`$�6R�0�-]�p�����θ�PdJ��q��Q���%�gE '��?.����x:�x|h�by�UG�Z��-re�\(��Vn?
�8�6 �'MS/r�ro�q���Zt^��^�r��oK��_�jz���(\��_K��x w�Y��V�S��v_F@��S?�X����8w��w��­�[�����B�:� $ա"T[�m�X�}�r���w��F�u�����Ew}�+�?\�1�
ߔ���p�mZ8E�|��0��ʮ�Iۉi��w��އ�P1���p�z�V׻�N�Rg?R���#ſK�l"%���G�x��e�0��ʈ@8V��,k�z+�ґ�kh�G(!�D#��n����N��$�껦�7@?\%��%؈(�׊��%��P�7ʹ-��u�UՃ��$c�_��������Tq��Znͦ�w�ws��	I��e��n��ۉ#Z�_A���7��>��Wv���������4��@�����a_�vbY1�mϢ�Х�r'F�-\Y���CMf?F����Kh0�En����4��74�p�%7��#�m'D;K(�D7\}R]����@~B�L[�	��F�`
V���/o�\�Al�
";�q<W��:�Y�H���[�="�����jnۜ��@M1��>�w%T<����7� �BJ4��^��$�8��ݟ�ꦯ��)Mfe'/ڧ�:m[(�#p8���<���!� |4�������'Č�0)F�"�V��S��z�o�as��<65b�s��[�%��)��Ƌ}uW�J    E@*�"��?<��9���w���[�w��|��XK�#1,��Tѐ��&����(O�d���)����]��l �YDn.e+eZ�K�[KI7���26�
�i-)�dB?ȳ����4��@,�;'��C�Dr�;1������@��'�:�T^���T�����<�������q�!.�;�_kut��<ȕ�pA�
���}�B�PƟޯ�+�A��5�5<υ2G`���� �A�!���k_n�U˶�hVD^�L�U�-F8�4�yb�1Sx�3Ȝn6�B>��l=��?-O��>0p�o	���a>��*���d�(�%2rO�ű[�ZG���+N���%U��|�]�Wp����=%5D�mS�8\ͥk������(qW;s0��;��z�7�A+���� ��r�j�?�0��y���_�aSN��Z�I,p�xOR�4�v%u��7�Kꐱ��w&u�\A8{����bǯ�9�C��C� s+��EJe��V{�} �^��(�|��s�k�\a���D�G�/��aƇ�魁������AC�j	GC�ĎW�7��������ԝ�Xb	K�t�7E
q���.��$f����&]�b՗b(,� �/�RL�`ީ���~�FVɃ$%A>��$bF!	'��&��쐏����ɇ(Q�L��ڡS'Jq�)�N��q8��h���OR����r�Go�8��(%�ꊘ�JD���(#����n�mh�Gd�.:�`�L�%s��0�RnHu�`Rl7���G�K��f��(W��XK��{��8]D4vV�8������Cv�E
������
�5�$[�&�g~>�H5��z���3��qt���,e�b�u]cERn錕�q�-��E������R��+.Rp�U%]&�Q���񛺑��£_�Ç�P#��ƽx0��A��ԏ�2�W�
�ѩC��ʘ�=�0Ymy���ݡ���%NH1�5�N/�]^�c"�T.�|
ZL�pCP�e���z�]����?�u/��3o�},7�T�!Qt�X�c2X��Z(��@�r*|V:C�K̍\☠��"�7߆#?=�c%�z�Q=����*)�X��ë�G��ܩWO�~�c����U_�r�M9��y+�ڕ��B��f�^q���L��L���OP
F^���|j��O�А�f|���8D�C� ڼ��o�(���H] �d4����>� E���r?	vLq��5���r}ԇR�JBlu���4�����旵JW��g��+eҐ��c�-<ՉEq�71ޗ;x�����`�� B>���gB��X������rgj)���P�|1I�Y��&P0���	!,r�p��)O_�#�u*���8�,�
�S��:&`�0��]ħK������s~�Vt�ػ5)7[���23�*B�vSӬ�>�n�*^S�I��U���.(���W�4U�LW?�}_�:Re�T��L6!#�&���E�P�ˮ��J��U�Ӎq��a�^^\�V�Z :JrA	;P�-�U�-x	�O�<�T�ϡ�	���2R�����keC����Tb��(�L�Z��G	���a�3�n��;����N���U-ūЇ�Ct��kP�=�䎞���T,}/_��b-�j}��2�ƾb����3�1�
���"~���M���~s�@?�{�f��>���.��Wu�|	�=�`�K�C'�jG�]����weI����*�~(2�Ns�Os-�����Q��Lʁ�,�y���8W,<�n��W����9�0_�8�'��l�R�9>����\��~1��<��|�`���)�e��å�p+�92�TߊQ��ZP��k��I��e��Xc>����"R0��6�#��x�G6�O��m���f�BT�G�>dW���FV���r:kW��	�T_�H���Pӓ�5Rx���+��C5�~=}CA|��>�\t9�'&Q��œ�tj��_LԢ�/3c?nG;6̮xd-!�P���U�|�k ��K���+9�<�������܀X�� �*-)������7\�V��&�3��
S�F' ��+���W6U�%���:��D����0�������M�������XM�OD��.&Þ�Zɓ,�*H��:]S�o�i�׻�"'����m#���)p��j�G^p��Tq;ܥ$`�)\hL��Fp������:yRD�+���pW�/?L����G2b���*�Pw���\P��k@�b��Ǐ�װ�N��oŗ�w��\�C�=��~'xg_���rK�ǧ!��=X)�M���"&�؉{XQ �č�5����\�?k��B�@�����5��"~�gy�o+	cO�}�\Y��� X�ߑ)��M����Nt	D�cyR�e���;%m/�~��<	��m�J���~[��""��HaEP�\4G�wD��$C��B56�a����a�,�^B!���%W(�3k}
��	���1}!A�%�Et'�7&h5�s�IU��$D�SE���$���.R%�,�� a]{o*`%��8��g-C��1_��šo�g�?�ۘ�Y��S;�D.ԥ OL�cE�z�W�!�@�D�E��	v�`�"b]�dn��n���\�z�[���zfx��ΌUL�ŉ�E��C�Da]5�1���G����E��>Á�*,w�j��QȄ�O�����a�$���y�N��.�����j�{.W���mh��g�Uw:lh��'�@�r�q�o�"�����pܟvU�Eb(ԑw�"�S���=����jdS�{�$�9�	�'Z!Z�;ܙ���M�&����	h�^%k�$j�)�aB��[?�cCK���ʳ��,��[8`�{xM 7@�ݡ����$(~u	���G��ҕ*��J]��#���{� ؐ[i�z/)9�@)q9����A'6�O�P�ȫ�y��0���O����Y��W�"��k0���|��9Uh���j�u�P��R_������b=x�+�	88�4�b�t�^��ׁ�ߪ�Ǫ�b|ۦ�I�zό�#��FF�+����蠑�rZ[����R�a�I?H4P�W��"��Q&��3�w�!f������S\'lc���?_�Ҍ��C�JJ�dj�rw�1��gyO�?��C��%V���R�D?�CkZ��)�7�s�=���KM]���8H�	pF� �ܨ�yz���&]Ūk�9��TA�����5 t6	�o; t��e�,�ʪ �P_�|�k��������V���A�
�-)V��x�,��˸�gy���:�.Q�O,-+�@�10lo�ټ�
��3�L9D�K�uN��;ȕA7�Uxܩ�����RX*��Qvu�o�{���â��H�@~�z�����C@�o���0�r�Χd��ϔ�P���"�Q��8��R�>�!B���~eCϱ=\e[p���>ە��s=�������#5Sf38���<���8�4!�c�7�dp O��$ʺӔ��.'|~������f�=f��J'�!S�	��/x�j*M!N�p�0GL	&��@b%#T�*�t��+T��aGffrds+#�XW2��?��L����	6q�LM�$� �z�b-p]�ڝ_H-�r�(�O�7��Y������$�oOP����T��臊���'13lsգ��oe�mX�t�: �j�oU�J�Uh�(�>�,�Lٟ�r~��vW�ޜ6��}Ϛ�PVWT� �!.�Km�{+p�v������6�H+T�� �\N���((�m}^�'��v��ӻV�9 �W�e]@�������Y����B}�M���2t�Thf}W��Ҫ�*�KNu�� �i&Ppi���{>&�ۛ����
d�o,y`���5�;�ȽpԎZSh�*̰9�5��@�
�wዩ�'~������X���c����A�K���O��*��ڰ��3�|��������%Swa��ʔqY�!#��ɫM2�M�0���!�}+~C�Q�v��KDC��զ�P2F��W� ���K@��R�Q�5-D��    س��nʛ�6��C_�� $�pd�5�=
ࣘ��-�):�x��}��/�z��*�_���яE�[��Nsa���Ά r�-����v$@������4���y�h%QD8Y=u����* }�Pw]}ĺ,>m%�F�5�KA-�x�VȌk� 7�w�ql�j����ѯU�i r:��@����%��_��!� ����[X-�Uv��yb�B�	�T��ZV΄���W}�w�ms���2�-��� ����$z[��Rl�D�	7�_	��C�`6��q�����(��#K�[����	%�� �����+=0��yU��&];M%<�\���H�5$�S�o�7pa9П�1�)%��ThO����$���}����";Nbٖf	ʨ��y�����5�q��s�������.�N��
Z?�)�TB�0|�!T��M��q�x��dr��/h3o@�D)X�tP���3[�3�B4K:�FA�-�	NcX���F�����U�$\�
�НUY1Ad���s����r��v�����Tu��w�Tu�i$��E��dk<U]t�*T��8�����>���ը�������NѝUY1A䉺(�q��	Js�����"�w�Lu��i�����i[;S����YI��G�p������-Y2��L���嗏�L��G��D��ܘ��?�?Or�������\��&Sj(�զm�\�2s:R�j��Y�'W����,�ҧ��Ub�����9JOԩ��b��5yb���\��Sk �ʍ��B�aU����3 ���2}�ȅF�z�0�3����Cw;6���p���K�BuW"���d=�z��j�ꕡYK����W�#�|1�1�)"�G�NjK�wt#E6�����zUÞ�V�~@Cȁ�ʽ�=:�Wr�MW�~���l4zʡ>R�;\��N�}ut��4|�j�ʆ�Z���ǚ�Î�Kdɠ9}�DWS�@���V3�E����1�yv9�h��3f��Y��x�^�Idյ���g룼�)3���)�Ө���s���9�!��6��+�W���?˂hc��%M	)uw�KEE�e�i�'O�zbx�ڙ4Ε6sc�ن
��v(x�NB��K�#0kc� )(���;}�@+��ՖLt8�P$+�����0�
����ѯ�pV+��<ne[wt��K�X�,�K�1�$�Q�=����H�D�w6H�&5%;�<`��-�QeT��r��cL�4P&�B��JYԡp�A=���CؠT<�Ҕ䬹���v7X�,*���g�!GP�bv�y6Z�h2�>)��3�G�q/�Y�AN1�"��y{�%��$Q���.}
�f�v��$�KWD����w�Up���f��<��|�Gޡ>��������="Gz	�CUMMUm�E!q��q�%f� ��@��@��i���D�}L�"��H	��������������g��h��Ә�F,��J���#�T@�T���#fy, �D�&���	DХx���ۦ�zX�z��^�����7��&B�0�n[T;�Hoʮ�'m�H�Ω��)������F�5���T2<�+�V�y@����#��UJ�}��(H�&a���A����O���<�����Q���BE6�i�y�>Hk��"`6.͉�g���['�Z 8p��:�ت�:��ɝW�i�S��x�,ީ�F>����B���b�U�N��oKq�F��~�f1W��Y�zX�r��@��
��O�F1Vs�<�{�2��9D�a3@���A�F۲Շ4eʴ>��w�K��3F����8�Tb*Qt��֐�s]�"%���6v��_=��p�ڶ���l���~��'�-���\�"z��/�%w�P6�I�o�ECٟt' &ᡁt<��%q�~C�l����p��. tw�x��|[>����,�yp���.�gA$�O��h��oR��S��s���lz3��7P�	BO![Ŷ�v�n�$�b���54ӥt��^��0^�t*{ɦ&��:�ZI�p�^�OEp<*&!�_b-m�'���2��1M!9K\��{C7c&3��?����V�d;L�B �@�E�Ȩ��k�(�!���up	^�x��<W,���A�	EK�XŌ����<c)R���R�.���NtW�c ��@
N���D^VǷJ%} ~�o�Rz ���Vi���?�d|��l|�|F4����IӍ���ڀ�\x7Z�w!|p����,�&t��]�u�>�Y���Zs��
r�A"?t- s�|�\"��s���bƿ�m��|a�`�M#��Q�� fT�	����1Ӕ|>u���]t`��� ��> P:q��7��2F6��-���d���
80=%��f�8�c��X/����h��H��%��FaS�|ji�!C�	�HY(ϸ�J>�j/O����n/c<-�%�w�4�+���_��g�p��nt�ϒQ���"@���|������Os�v��Yt~�+� � ��	�Vsf��@�6b�[6�MfJډDM�*�?�v�ıo&���8��xOS�rI�P�p�R��z����M�̇�� �*�V��M��}0���53�\��@B�=81m&u�� />���{ �ǒ��(Ӯ��i0ME�(�1���:��(�,�L���	aSa�w�����M(�>�&�2��1m<[ �	;NT9,�ۡ�# a�ɼ��́�1�n��"�JV��!���++���c	/���E��߇�^DEU�
�E�mB"�����d	�G��M�@[$�.!R;�{���)SU�Ꮝ�yY�lʣD��C'�G,o����}�\;eƁ����?���t���7-o��4�et�q:�n}	�����3r�/���r3e|j^�i�5PBր�4�����3�Z5, _F:��R�ݗ��M��DZIx�A�Ŧ;l.����\��Xۡ�F/J�� �P?�_O+���@-[����*�I^ϩt;�n$�=�v��,��'BCh+�x�)F��Hޝ�r� �\O,i��G��ĜR�Rk�8˱b�Al�S�,c;�@41k,��l,j,�c�B����g�Vh�b�5a�����1ohSj|����U��.�ad�T�뚢�	VK�B�1-7�9(�cbb�1���I?�S�gqtj���mZj�c�z��٪D��ͤ�͜�
E���}+����"ţ��"��]%��=-^k�SnyKH�blDS<B,%P�HU!)"--�u5p�P��ׅ��S8�R��hK�G-aHA�D�$��Ҋ��R%S|�70=V������81�~-��m�=@b�0ʆ4&FX��6�����Vܽ�c��mS���Tsa^��a��27`Ȁo��W@�Q�U"x:&�A.v��:�CnJ�S�[�\֪"�怵`�o5*y`jǴo��ʔ� L�d�����cD*��8 |�nK�4Ϙ�Ҡ����/z�,2Ff�������Vsp5���T�d��AĲr�Ɋ>�Q�PRFQ��S���s�i$��M�jb1A7/����[\pU\ ���g ����	���gxj�e��/���~�7H(8�������F��.�Z]�f�h�s7t	�P���V��>��D��U@n4��æ������b6h��I���Fb���̋"Lh�C2�)�N�Ĕ��Y�G��	���.�A�k�=�h6ez���~\Tٌ<'�6S���z�WE�DK8k@��A!��-�#_�*��oX��5���K�Oލ�K)хEz�X�%���{�v3X�xm���BD����e��j���8���R3�:I<�U�Ѡ���y�8T�k�����9b��VI�?eJ���!@`�����qé#����}Q�os���&�z6�[Д��,�o�n�3&`�c�?΄��^r�B�C	V,t i�3�,�>uY�Ԩ�l���?��x�W���]Rkㅋ*g�M�ӳ��`�
g�+�Wf�D�����z�&��f�hŪ�ͩ�E�XV�q�7�������\��$o���X���xs    ;�y��]^���Rý�����+��_p��v=�;��O���x��@��_�W��掊P������D�ۢ�;;�󽃺����M�Р�i#�<����u���2Y���O�M��ޙ�`��PZ����
���98��C��o�JI��3d�o�� �x�|�H9<�����m����$�3I�.�k�&��y�&#.�n���r�����A�z���` `F�-��U2�#2��(�::4�yz ����c�
n��6�����$ʒ�ˆp�(�c��G�bV��(���5�f� �M�Pl(�2�����4z�DF� �qijD	���%���(n[Y�#h3�I�H!s�AL�|c��ZA�����n��nr7�������\//��q��r��.�ʞ0ߖ�V���t�^�Ģ�}��/k����y����)�t��5��;ȟ�+���8<�BI���_�O]����?����?�NI��>C���*Ja�����WO���A�p���6���h 1���"dʐ�S����'��ٽ� ���p�,�]��2cKطx(:�
���d�9�j����n��DI�?���OE�1�e����(���|�F>v�yJѾ�R����C-�ܨ0��h�fΉ����CK �w'
���Fx,a�
�ۂ�L)�,+G��ݛ����T��@��Z��	�~)�P<*�zG��@��\�b^@Bd Ng�.�n=�:�	5��֚���=d2��������A��F�(��0��6�+�CY4�2�s�K��D�E�l�%W� �2�{|%-����9o�I~��o]S��_u`>�qbd���Bؔa�=�8-�f�t���%�o��j8K�@B����x1r8	�,�4Kl��{�}����(��y�PN��ퟋ��[���H|G?����M�����ہ)��s�P�|���Ŗ�#$ǂ�91���w�ٲ�T���&��X��������$��KN�X�Xj�2���q\�B).4M�` �4%���Cs�ah)o���`2��dPU��.rGɉ�Km]=i��ˈXc+�qt�t�GX�c�L�#%�r&����x9S�S�&�Qs����ND6�Ŀ�e���8rjZ?M!KkWҫ�no��r�����T��ܤ\<�k�c�l:3�񈼀C^"�gS�0�����T�?�9S�����Gl��JB/�BZ���� V�x�EG�;_M�՜������S��h�����9�+aCO�8��t�ϭl�C��)�����)���t��ޔ��R�KXN4y�4#�l�]�У��IWw�?��n����i/�Ҏ �JG ���y�Po1���˯�&��:�	<Ad�:�J!�w�Z���k��QN��秮zB�2�ZL�|}rF%�Q�V���t�A-��
�7�z��ke�=	4�U]�|��>&��������������&��8�%xQ�Ť4���=�	yp��� ��N��up�ܪ�O },O%���0x 
�x��'��v������آ�t?��K;����J�	p3be)�������-f����P�IJJ�[�х�fvj;���8�H��s�'V,���{(�z}����{���?^!^�xC�4�[wU��[}̛� �`=C�N
xm%���+��Q/��q
O9q�QJFn�H���-�B^89��* 
�-P�E�p��6���}#z,oO{�iX��9�.&B�c�h��z���������w��<7�A��K��E�֍\�͍����W����Y����MV��dN��i8T��{G4��-<��e.�;J�(1�v֓�a��BŀXJj���� Su)�a��W ]�� +���F�m�"ȴ�%�E���~�/�?@�ө�~8�$��#���JY+��]w��$��k�H�nW�l3�tG������x�r[�2�@|o�����<F4����AL��l� {*�{�D18����FJ>(A��;����Ab8�DJTv!�޾nň-������
PXIC`#<P��q`�g@��7��(J�j���U��S�L)�n F6��kz��>#�m,q��c����A����0�Raa�m�T>v;��p|G�����X�����z�����Q����71�3F�F��iY>9�̫�}N|��G&���(�9�6mk��)���g�׋C<Ɗ	�Cxo�-v�ak����b'��ɧ/��Fk	o���&��c@F@י5t^��s�"[#I�Z��&;H yG	%�_DCbm�̨�Z�ߜ��)[��o�-`������Au?�Y��B�ES�BH_?`|=#*]c���� �DlT���΋j�Xps���,���^����PA��?��[�e~u�@�	%U~��7��C�X��M ,��-�	�k�	�$S[���k'���X�}TY�s	�a�=�I2��U�7H4}�'D��'?��䒛R*�|i]���^F��[ժ����7���5���cQ�J��1���9�����Kʴ��j��9H�nR9��eד����n�kڸarA��YC��.w�2���;�8��W-�7��S�n��_�	�-<|��7�/ⷵX Ŵ�:��w������}���؃��S��ޕ���v]Wl��N~�+�	rR�����ɏ���v-�
�}�/ԑ�a`Af�		�e�z�;0��E(#�$�13:ՠ�a��"菈�x�idT����tk,]ջ�~���O���(��$�g�wb�2�K�j��^��l �N_Opa����Gq�T������E�l3b�H�C�)M��ߑ�^�1N]sL�L-4���0a&p�� �@C�J��BnM�a���|�Q���a-��U�ɢ��z���[*�V�����?V���)���k��>燜����9�wHK�L�zl3�l��[�)�3&�q�A�!�X�uG���Q6^�p_�SEcq2�O2o��eQ�(����H/1��D{�8�3�dk��r��8�^҈��v�q��[Hp�����1>�,OBʔ7!C���"�5h�chK�ۦndh�U�Z��'CHX��)��)�t��fX���7ع�%1�ƕ���<-b��Խ
)6ea/,4��f�R�OM��}�<'����\Ӎ3N�.�����PCA�K$H��������Μm��'��K��P�7�O�6��E}g�]U?����N������9��.ᭊ��=ީ�o� 7�+��*�x����8���2�p�NfQ�hTo��/B��c阾��]�n4a���R�y�Tc����:YS��)���.ڳ�Z����2���ܱ"�����.i6�����۾yrʜ�7eW �*ȀĪQ�cU�{)�Vc-�$	y�	o� ���/����;v��]�[�i���O�{�ĸ�3�sV�FLh�Kwb��}pX؊q���Ŧ)���W��/�|p����@m��<�?�8���5����ӂ��z#ǟS��u֘�^v�\�V�N��R�
�o�w�dŽ�m��������"��S��\,6O��;��S2��)[���ĩ�B�?����=o.7t"����i��dn�MCxM�mUSSJo�맼!���~��8�m����!�*�.&��g��pA����^���#��h¾+����� �񔜰PM����+e.!�M��Z|$LM���9I�/�T��N5ݫ0TX��f��z�I��|}MiF,�J[0=C$�=�;���T�)��W������6��D�/-���UE��K���E��6'�9g��d���/W��3֫�Z��p&���=��w��U����R�Iv�)w.�g�h��PN�)#�%�Ҿ�Ȥ�.Id�
m�O?0�%q��Q:;����P��#��q�`�N��M׌2׌�[Wx�n��A�DX�aߋN�z�-N�l�&��ddޛ�p��4�Sa�3�SU�#NUC��m���3)�̸�Su�yo`7�=.(U*�    سo�̨#I
=o�6_�[l�����������1��k믇�E%K���1��(�<�����؛<�ඳgɥ�"p��o��;&UR��ydf�jF��>�h�%��S�>�vtJ8[�
�)�ёf�w�^��ꡱ5�x�ȆA��4����W`ܵZ�^�2�1^��)3��gtrx(ɇ�Ud����b�-<�t�����F��������Z�� ������G�!B}��/�왒�I�O��`u'J��*�ʌ|�q�'SXi.@�^����g��ۀ�� ��$��+�e�����G q�8ﴜ�?���]�}"xc��^��{�	٢4	xU�<!Yx�;�.�$���s@�Hد�\�ИC����<|���cz��^f����8�͓qM(�k��7�����XƅF�p3��n�G��J����`g��x����9[t�����xC���I�n�ɖ�W2�ʙL!݂��1��2�F�I7����w��:=�5y��S�sjL��R�]C�!���#�;�g)���8�Mv@��r�wQ�� N�8�y��o�y�/��h�`R����XW�v:/��2-)j#�VЌ�yP���Ny�Φ<�Z�,��|=g���f\��<�#��I-|dw/�����'YƖ����K������89]�p����顰��{�-x+��x�\��T����;B����O+�X�H���9�1��0|�P�&���lq�ROr:Ӝv��8�~�UQ:��$�q�8��oU�=�����r��\��z��O�~Oi�d���=stu� ��P��3�<��t+A���	���{�&�n|���
,�%=]4�_q�^_}ws��M?���϶�ha�h������0���ڽ\�J��UsYs@X�� T��b?%f�^��{JL7��bD y���>]��;�j���E��+�?����#��\M*��5�T�%$y�k^7tQ=�{��f4E�����hX��@��,�4Ug��o( q}�uHmн��|���E|�w�=�.��UR�(y��l릾�F�级dfܼ4���N�����dP�����#��όb� �g�O�XL1Iuz���;��^[�	�L��Ni­�}B���e��Ď��8�s<�Ρ��R-1�=6��'q�ê*���N5���]״I�,�x�3D����!�(Wfi���@�K��;t ^6�s�L	��3�X���X��K���3�ؠC��VN|�\_aP'�񄅞�[��*�� }|��öD7�@M耡]S��/+tu�N~��_�ϔ9ź�9����Ob準��B�_��K��.�<F�����_�Fʒ�[��>������հ �c@S�4��C��?�(� �Q^�r���#����؇*�+k�B�p��c.ej� �C���Đ�c4(�l �|��XC*%��g�'���Y�l�0c]9�MZb�Ru���ѓr�O9�pc�dF(�S�H�頺���j�'�d��=e�4�t2����9�θ-�D�mi��v�=e~4�@���޷@���u�0o��N)�D�k� �+8/|+s,�������ְ���m�c��r# �������A:ż}��JƄ����S��c綹��QVI	��k�E�N����`�m� �ǈz��S�~-����#��El��'O�Y��y�����+��j����v|89z>[�;��-��x�����ى�#L�LXûFǘU��I���kFw�/`��{!*�����01P}�Ʀ�%v��Ck�s��� LB0Y`@��������r�
���6��aSl�q�{.�z���q�`2*>�*ͳ]�]�m����R�����^������"�q��;<6t��M�
iLK� +Ӡg>�ؽOR:z�K�2��Z��>Z����NT�p�3�)$;Y(�F/G!��l���8#x��/Z�m��\}ۨ���T�S;�x�B�|i��x(�mqX_a��
Q|�wu���7[7J�(o$G�i��Db*1w�[O[�	Heтh"s��5�c	�4�)�����&�v۔L�1؂f�>��D)V�1,/�
�e�A}Y�&6��8��rkQ^1K�ي��v��v`��,�9�	������[n�$�d!g�~8���&b�up)�o5�j�&�[ةۄuˇ��غMX�6YKr=��$�֪~T�	�v�3W7"WC3��j
�����Jp���g|�f-h��
�}V�l5Qx,Pm���d����3����(�L��8��x;�nا��1����n6q��@��||gT�>������d%��%��@��4Z�.ra
��!�m2��۽����8��o}��l��pHCb� \�c�spɑ!\�Yۢc�h�{ʽ>$E[�t��_��8���WU�m��W;Ȉ%ۭ_!��k�]��F��P�խ����0�dN$C�[����CV���<Dv3��Nk�vؐQ쒑���B�5�T��<'#=�IW@cyV�i�B��~����c$�e�1
�U��|�5
aBǮj�Ws��[|����B��Gq���9O���]@GV���.o���'�v���/����/�Z�A"�ĐB[�:�KV�FJ��8��cKO��R���l2�S�I�]�����75V��,NE�P�>($Ђ�����IE�&"x��{C8���1p73�ŞNk��d���1\H���=��J7gbj �T�'xr�A3���A~�+v��y2/-i���л����ૉ1�x�D%z_�?'����H�z�!�
Qe
o��	�(�Z	IB����HD3�Cؐaߢ��c՝:
"P�x���'A*��h���eA��N��Ȁ�H�"��wd�r�5h�S�04a�d.�IXGT�����>�fk��a�����UX��={V+���c�!V���3�5�!\�p֠� M�bp֐�C1���Ȼ���m�t�Y����A%<�g����K�7��U� ����)u	=���j�r����Zr:�$]��t4�̂�#6�K��+J�/?����"��h�׿���U^Vb(��"����b���mFl�����E�=��wP����_`�Y�ޓ�-Fl�W��z��{JD�LԶ��=块��<2�WȒD+�+����RF��r��d�$ʞ=�����N(p�����k��?��m� �M��)��1}`0�12yXj��ٮ?�)����^������p!}h���G�C�V�ﷺ�=@hʉҌ��<�'��]!�`hg3EXM�j�?�@~7��	<��g��`���������!0�V>����`Lii����~�����?��������Ib�Ǌ!�}�X�cD���TW�@��[1DI��A��Ж��3�,4�	8P2��1/m��B'��{�����,.��h���,aG�a�T�v�XʄUQ��ޗ�C'`)3��h��/�g"�E ��>���62��Ũ��=m��-���vB@z������#��P�з�\���W��O�7��kcP14�� @1җl�y�x��1̌�h#�Z�Eg�@�f9�H����~�n��-fNm�gP���]�Ul��s��?��eO�b'��`Wf8�86��]K����Ch��̥���;�	�z�용����^��~��2�=O��QϾ6V��u-��ɂ���D��L��ގRr�o\�T�K�m,��
b�!�����Ji���D�G�������w!>C1�Xl������.B_���e�z���b8�]��_q�U��w�h3�%���&�loJ���f�qd�i��pz����b%A���o1��rs5[<]P��3��٨h����C�w�N�J܀b��]{O�K$����j^(� dSW��m>�7���ߚ�э����]C�3�cX-Q������	��,/�T_D�J���(-����"M�JQy�zV�V�Ǩ��h��
i�h�Zk�!����Pª�>��    ���:J�Y�}x�2��ǡ���g�G�]r�R���M���1��n*�"���/e���r(�o�>��v�2�y�
n4_��n~���:�V�C�^a��/��G
a�Eu�CY4%H�m]����Yq�B��׺�@:�O�y0��X���p�Z��tG|�L,ab=t��$[f0�B�%��f%/��h9$�O�8P���i�n$��O2��lnZ��F��\���#
�j��2��.d�wĽo��eN6*pҳ�9�2y�H�Z����D"����V���aS��jL	��@.*��ǘr���s�z�C���4&��d��V���A���� S�>�#R:���K.a)R鈚 ��b������� d�N��ڌ}��=��ʢ��>c�����'q.�5Ⱦ���0e�N��`z��)�r��^�Go�_{[��_�Q���7�3�'?��v>s
����SVʠ�(ج{FT^���կ��ԝ�f�����]�m�
e������pO6*>�o��7��DFz9�zA��h%k��K�:������5M�V�
�Z�FuK3���@�5*g5 �ӿ��z�1�Q���$��	�}F����|_"/M��
�T�ƕ�P��n��W�%���5<t;Tqg��欵�X^��O�T���1�H7�	�y7���W�Ǌe!��%Z��'�{��<V��P���ǹi��(DD_�O����!�tJg�������0�����m�|������L�	��GվF�'�z�a=�<F�T�K"����NVl�vE�䱓�����VR0	n���d�,!D8���_Yj�yG(�v%������%�"���t6B����~����BfG�&T���R�u%
o4�w��;*�1 "�r����}���V�()ɑe	$
�!O��"N���^��SE�W2��D��喝���w��}=LXU�*�H��p���i�q��bߣ�c�Ī��y�EJ7���+`�Ě;�ػ�&��W��cQM�[a�����,X��ї���8�BoH.drd6�h���nA�3�t�M���$�.��|V�/��9�`6C>�_�ثI�Z_AY,Ù��jF����V���-��Y9���P�H���Ǫ��g"2��J��>b�m�������DЉ9�Y�����-ze�}ָ�gqg�a�JVAעlb�
Ib��Ǌ�	��&�8%+�K޵�+�����J�	eA{��=��gQF�8�	!�-��w�LrD��$����L�_�_�
���� �
#�7P��mk*S�|Y#�cH9r���+E�w�D5�$¯H=n�,�%�À7;�2�Jt'���RSЌ�BVR�A,�VA-���;�|AԴϭ�'b6���1j!Z��E:�j�L���9��A���H��zx��0�#l��s�I���0 mbf�o0��4Q�,�94png�pI�h$.�D�f���BD�;�[�4W��݄因���R��u^k��XOՈ��r�̬R���a���#g$�S���U��mu��Rfʉz��!?���N��3ȼo�a��0a�O��Uc�uIQX�1Lp�ܕ�����x��h��	�d
 �b�O�wE��nq��� k��뮭_���u�;U��Kq�|�i�X6Mq,)���J� �S��p=�Uٝ?�Ï�Z�	�[�BN��R�ǩ~**��D�e(BDS��;y�QG=J'H��y�H2EJ�G#`j�_B;�C�.��緥t陽�**%�����[=C!���p9O<6O�Z�n��7z�Z�.�;�,$_�ROn~B�~g&��mn(�h���TGkT�����iI�ﺉ+�D���.UP���U哿�v�}_�\����;v�<�Y����<�VR2�G�:�:�����rnJV�@�*�1�?�NRG,y��.��#p�5�:&>S�˗b*(&!��!�̡�qBJ�(��}�����v�A'���*8PA�$�<IH�&��)C.���}�2T�B�z�[y��E�0z���:*K%M�������8�	�6�3�>&<�\�*�|�8ȵ��M�LF�hЈA�U�?��Yy;����@�a�0�PC+�����F#u�k���/J!�2�Y��!�]՝����,Iz�o���YC���f�=�5'�է�֘e�3B�G|������J���(ןNe����$fٚ��=@|;��Cǻ�$�݄@Y�mN��di�[�R�,US�,�̥�k�W<&.�;�,Y�?�~��`�
!<7g�H�l��eU�!c{��V�|,���IX	+3Y�P4�肋���N?�-	�T��v�v�j���K��*�l�d�$�,�X����1�g��lu_*1e��l�s����=���\$+&3�@\feց���ʽX �m�e���I6�M�7bܷ�]��I�m�Q���bF��  #�ŷ���oH!�RM���Wк����P1P(0�V�}����b�򰮣2�ƍ s;��0��o�@]?�yza�|'L���5i�K�u��֍�n�)�����%t�s$��"��h��	�T��Rk��f�Fk�(�E��o�1p�o�n�M�o �;A�&����F��ȡٙA�JN�����T]�dV�+��������!2'�ጘ*q���]v��^S��!-����-T���t�Z��C0p�2#�����^�B���a���N�1��Teq��i�����9�"�;=����Ӏms�)�	"��:�0sJ\(1CƔ�M��X`�]u{��#�H7a�l�5�R��ڶ�B~3�g��kc�X�'a?�\#C�U��G��Yk���4�rhkx�TUZirB��tP!��'0֟�(~-ڿ 	_� ):�,�&��r^����eZ�V����y>o�9=�."�2����3�z���#��9���K��ʄ@XjS���"`�`�+<�7_J�(�?
a���_�;�k4U����W��=ൻ*���6#�������l�)��b�!��BI#VJ$����z&��D%r���m),�Ŷ��B��tJ��G�%B͘�b���
��n��U7���ꀹ�cSB)��Ihc�1q�w�U	&pè�~3"3���4l�ڢ���ٷh�[�:�c� �	@��L;���L��!�����OtA�omq��1�3�:a-�Ԍ,�j�HXSc��S�* �h,[�F�'�$s�␖"�a��]qRRX_�rJ�A;0��,M'��\�L�lbF��	�n���d�f��/xj:���'C��<���3�\�zS�j�=����c��y#]`7b�۔\���l�ܘ�q��S���8<�ՓB'!jzjz��\��?NP�=��R��Q�Vi\ĉ4 S\\�� ����2����n�i_���F�c�1LbdR/٭��W�TGZR0�,hK�+�����4!��z�P���ϥ�4�`�b˵Ǘ7p*��l��W��;��d�F�I�wU�P�+;F`ǡďF?�CլJ��3���B�3z�%j�Hj]��.��LG�j���YU��޼V�5�s��m|C
Z�0K ��w�뷹 q-,����tE�7-HE��{9~��G<&@>k�ޣ2݊c�Q�p���g3}p���T�iV ���46����ݤ��s��Z��k�i���Uxݠ����ҵ��s/����@p��C�LK���=�Π�S�����8�t
?�� P�y�|r �t�Lz��TW|�)W�q�48ZS/5T<\������+<9��_��x"�iW���Po�n^PEq����#����<XT���^V� ��)+[�T�YX����7*<$���X��eq�n �8�D�l5�g#^�|�җⷠ���4T2|���%wh��#�8��&��tu�knO�ԕ���H�d��}�3T$\w'���)G`Os��W\�6�׏�%tc��Y�� Z0φ�A�p"f��)��DL[-�Fs�zm��E��vkif�̻��T��[6e����G1Z�m)���2��m    #�K���[���X"uG�շ��"��F��h����A�d�^�e1Rl$��F_l���b��l�B�RczoY�&YO�iQ7�xT�Tb�@��|]�T��c��7�k(̴���2���W������N�D氇i+��!E&��Gy6X1�eE��V�$�ŵ�����UXU���d�7��MV�?��X�W��3�NT`g��(H�/�GY���X��wB��6�i��ȑ�;�Ə�X��S����Ԛ���.:�{�d�$m�%�Bв!��0��~��a���<o�ǆ|���g�#?��^�8��0,q{r4}15�e�g�,?OF�L�h�zC��ؖ�)�K(*R5}����P������"ZGب<���BX;�2	�/@_$�c	5HG��t��ԅ=�oq 
�E,���+4�#��%�輏����@�39���J�k��愋�SW�r�\e���h#���@};U��9q�H�n.�輱���:��E�����\�������M9G��#��R���3����������3����xd�I���)��11��Tb^U��oN�0@��<�a,�>�����Y\:d}����>��j�9H}������yt.�=1,}�3��>�ǥ�y �<��:F����5��+���o
p�xx��:c�<�fh.]���\4�T�#�K���02�B3$'FN�#�\��&�3C��I��d�1<��B��1��yX� �����3�A��`��"����R�5��fJ��{�澼�#f�����0��{)n�٬G�9�l�#�3V��\��v�c��Gl�K)�a�[�R⋆B�C�b��c#��Bm8Kts��5z"=KiO����Ō��W��k)ap�����dc��<�f�l�JUP}�}�<*�>	��Y0Nc��h䌡��}F{F�'<k�b�,�e�``�P�$�8�� b� ��f�sB�s��J~d��o�;�g��g���{2�y2yF[<��<�<��c�Q� ��G]T�)��Px�R��s)�SN�S�39c�Ix�yF{�6	O)/��̔��;g�J�k��><U�CbW���D��:'��'����������&&��湃m�����x�Ix�y5��xL-�kx.u<DxZF�t>'�:��Ւ����Y����:0�Y6x�(6���T!���
�ɳ/��<u1��^��B�zn�4 ��tw����
���\�e���Br%�l��<ϤH������l���=a`��
��,Gߩ�Ҽ�f�_��yڛ���S�%�G��UC������R�E�e���[�T<7�!�NZ�*H���-�C'�q�sz� <_�'	O����;�/�$���f(��������Տ�A9�$�'C9�3e�P����d�,j	�l+���d��?����z�3����
%�mj%�������W��hi2�m�*~��˯�^���D�a�f��3���������S!&����g��gǑ8�Z�	d�M�e�JJ��*M��+�8�+2�fD��(v'�vSe�E�J" Q;"x�j��f_c��Z`��|(UM@$�ϒ>����B6��Vb
]H����s�G��g��*�Q�{4�Nd6�a�A��������
^�`�ŉ�����@��4�)��L�_O�Wv���;4/f�]D����".j�ڿy1����-��y1����W^�C�R�[,/��,�M��j}�}���_�K(������`�����C�	��r9�hQ{8�ۘ�ÅY�� q�3q7XG�j�?��r�ܔq)��<�N���p��E�ġK�hz���DS{�*pτ�^���P!��Ja�.�M��.\�+�̉8D�b�*���MD��{rV[&]G@���l�����)�c)s up3�#��g_��٭��j������D9���[�C�7��"n�|:|�W��V��k8�Gx��#%���$�/�����Y6��sI�c̿��{h��CY}͛������s���_!B~��.�hv�}��4��Έ~ ����t����5`|������趫N4�C�::;�\lZ+ع��� 9N@8�1�;uy!���+ 0F���&7�9��l��~,���/8P!���y0���D�b�Zf�!�0�2\�m!����b ���Hb/��V�7�`f�P�v�pL���%�����JYhFE�=Je*j�5G��5�� g�p�NY �\��!�B�Hї���%c)e�O����(�-���w9o���eF�g�W�@���[4��~����6���7�8t%���g`y��y`���)w�A����, �X�5�p-ځ꒧"Ȱ��Y���ђ<�((���wKW����P>���������J�m!��#�%/�(eB���r�%7-5������)��� �_��kH8|Uu�c��!b��
��xI3e��� �u��|6o��An%m�,6B���8�;ڬ����,a�FC#NN��b?����a����G�����6L�A�=�h���N�8\���T��U~F��B�2�WN�go@��"��p|�*��s��?��p�R����ل��k@���[ˀ"���^��x�ʊT�mE�ʺ�~e�1bS4X��#�%g�)����֜�,���&��o�F�\}
��`�gC�n4�)���Aƈ3�q���GA�1p�_b�3�SF���$�4�vF�A�p=Ɲ��[��}�2����"2#@�h����S>rD2�,`�Rzr�TYm�N_�H�%܅�-_b.���u�,IZ.4E�lYk����HA�$����}�w�U��ix�hPl9@�j	�#�l�YC�?>�WH�"0+ZM}�F�C���޻�4�Y���s3d�+�9�P��zp,}�҇�4D}��"<JB^��ɡ2@A7�F���A����R���2MY��9(��w�MQ��*$H��X
���C-X
&.��3�s_~uq2�!=����K����堥I|��wȌ#N鸇)��V�Ϟ�1�2�k�@��k�����L���Q��ȵ��X�q��C�1��� & �H��_;���NlJ^�K���4��@T&7v�r�k�;�(]�b���4�� �A!��X�ឲ82�p�ـ�>�~�,��{ȿ��?��AM�����f�˹
�|$�_�M����m�AA�
�R?@"�3S줸�n#c������ՠ'��	�E<�-�D��$���Z�lG��`'��^I�=�'�f+{�P�����/"Ob��w駼�	�N�a�6c%5鯱����"B�Pj2���z�H��K!=^�:$�J�sݽFR��hE�q� �F���ݘ��[��ȮE�����f�)6��^f�e��5'	��y��lS:]�S�xw�o@/�gQcW���$yU8����y�:=e���py;14^�_N����~�w���a��4���SZ�}�PC����`p��^�1ݧ2��`R��n���Ä�^lmZZk�8Q/jb>e8����n6���T��Q���MOܲJ
��?��J��g��X�N9&�X�"�o�5�����A�������ྫྷ�+2�����UnQ��̀��u�~�d�B MA�kÝ�F{�vu7Ѐ�������Xh�T��-B����r����`��ь�P8�u��d?�ձ<�h#�E�p�E���`�x�"�7����$�ë.Q��i��W�X���4�x�x�7&y�(|D�n��"�(�$�+A���%�?�/�0��D�Ϲҿ��l��qv�B�����V�}���r�<��f:�-Cs)��r ���Tt��3G���,�h|�,/f�7[�ZnX֒g[��2��䐙�n=cR�/+�D����y��[�0'!�Xh%��[��Ґ�la=���H��X�	/v$��^�Kr�]��Ҩ��!ڒ��w��.퐜^�v��&6܉�J��9�:!��ػmqy,��	��b�s `V���3	�1�y    /7�2�p5��z=p�������kp�GD�
��U�0�
�J��w��2�Y �GUTgm\aR�\)H�T���"!�����F��n�~��Ǯ�=�KJ
�}'�V")$F���Մy�W5���V-��7��6�2_c�0i�{���4��-��?�0���}�ָ��U%�t|26T�tF��OTs�	�����#�����>%�Z5�|8
e��a�T�6MčFq�+F���F솃�S!Z�_��7�)?D6ep���n�7<Z�JĞ~�TW:r�=V�G|ty��n**!p�k��o5�dOO�k�D3�p8<<[P-P��]9�+<QQP	�Kat$����8)�l^�.���ؕ�x�t��bz�'��ϪᷖG7m~�Z�$�u�6,�X������: H8��Q3�ކ5�Yy�:���a�����w_��P	�S�$	%����y=�1���s������ɸ�*ovH���m�#��K�19��@�pn�hv%�	�����-���x�_�gYwT]TX�����l�)z���bs(����E�e
3��.Uw�h�L�8�mKW ~Mz_���vҾHO�d����A�J]T��XO�����'�3������zP� �XkC6E�3���j�k��2�Y��!�z��Y]��gީ/���!���+����Tui�� W���l��%1{>��m�����S�PB�?�L�aB��X��F�Pl0-��OE���ĺ��P�Y7�B�� #W���i��)�;QM�s�0x�ԬdLiv�IE���P�z7�罁
��S�c�qy�c�0���	=R��@(o
j_oe���5�S1x�zRE���|S�8�K�S�}��,�����Ӡ�:�x�:�}�o����щ0�O�.�˾8d�7b��j�
��fқ3e70�!Ō)�������O�r:�94k���43�I����g�L�a�k����3V�I��vZwƺ�l۴:1L��r������PT�P�\
�B�R�Se&�J��#�L��B��~N����e\F��L�:s�̻턮fԹ�P �M��2^BI������-&��R���>¢�����d|%!P,{)�~'㛇��|Aԟc��{#� 	���A]�e|��TC�p�&c��N,#$�"��}q�8�ʻ�n���F����1�Y=P�R��1t��)�!<��t�0�ƩU���R�b/^�4�A��F���+.}KP��Ģ��h�zP��Q|��c��θI]n*�4���(�\�t ��x΄�0§��kTb�\�����2���A� hr���k�1G/���(2{%������J
.��w�;{�xNU���ٳ՜�r�]ꝩ}e��͂��d"b��r�����prF�tY��������ĀlL.Jw����������DKY���?�D7 "MO���VX`��4�dU�O����t*�v�u_4�AxO�%���):t����+�� �f|��
��w��?���l�9��l�=k	��zP��%KW������5�"_X�Z��"�Tj�����q{�:jx��2�)qF}:�T��4'>�L��a��pý��z@6B�p6�o3>�T��HG���P��Ps�t�e($������2�"�9�d�:��Jʐ��Rا:<���6;I��\_'g|�����	K�$|����ܧ�A�@>z/A�� �,GSy����#l���LLc��l��ђ�qL, Rz	R6��XUC)��?�Mp�͢i�|������Iy �q�ǘ���=/��^�'�Yl
����8�p2��9���m�w�p�-{�5١�`W�a�T
�W�fpY�8���������HS�Z�_ �����L>N�e+���Nv��]P��g�8+�p�9����
�J�����M>��3���%@�#�}��� J�(:U�l�Qz�H�
 	rUY��g�E;l��t>�o���y��]�����آct{�M4�Mb��{(G?�٤"���c���'�T��\�1 ��!��ɂw���C�?���w�᭏�P�����ۚ�N>P}�>�Z>P���g��E�S��@a������l�a�i�í�O���-A�����>r����0�f��q2�= S��BS�l<�Ձ��T��OeG�,�3�y;l�#,��ȡ�y�Ǖ=��vo}�O�t�49���9���
>P�9I�#��3���8
}��r�(��w8��-��)7�}}m8h��|K�q�A��z���L�I��ּK[3�M��^4Dyy��)m�nՕ$2!�!u���6H�\��߆~���¶�HeD�h]!?}��e�z	�Pf�r,Po�r��
O�G��&�=�u�Q(�
9J��{����^��bYv?P��/>�<<��Y
y~x~c�~B�0.��,�	o�����򔲐�>Ǆ<��-���l޴���y�]e/Ɏ�Ҕ�E�59��= �i��磈�˚�������񼳜ҳl"�fa�.�������9%�9奸X��䅛4-!}�ϴ��,8�Ei)Vs��p�$1
��D̳ąmΚK��ą-h�y�8�Գ�!�bi�.��L1E��*�Y#|�"����4�!}	��4���<8LFI-Y}�W_U4}[����TNSǦ~�Yn���%掄�g�m���L,�d���iIO�s�$�e2	�)��2�[�f��HŦט��E�l��W���v�6��w���<�l(��0�+�C�{��e/ϔe�x߬z�{��ԇV�?�˖4y�>����#�Uj�Ԇ�,�:L�lp���h���~�4�1��}��'c��P������	�:ʠ\F4b�� �y �I�4T���	�a�\i��](=䶀�ZI�׃����SO'�_J5{Ć�cb�r������g�}��o*���^���k��\��Ǯh����7n�b��	VϦ�1}��`�y��x���6������m�])���B�f�[ݳ�T�_�ݎ2 O�C���'-n;�/��q��Ҳ�z�-��mm�b2YU����CHs�f��kY�{ty(ʚV��=����"A��3��;&��=��M�Ϻ����%�rw@�p��)�	�'=P@�4�*���0G̾�>PqK'F3 D61|p�����+0��91~�]���x.ܽ<��g�-dr3 ����=G̸ݪ�4�fF_c�g��z	�5"bli-]f�jY�௱�B�(Ό�b��T�L�����:����A�墧w���l1.��S����z_b�Q��C'(�-�{�I϶}Ѫu�G��@uʦ����<��M���poIn�7)C\^�$�{6D�l�Δ����+�|{�v;��|����M,��Ĥ{�[.�V�"�(�A5K�6��.?V���rT�Im��q���	[��a� ��@&Vc��>T�cEP$ɀ�i��88Iej������S�U�y^���匦Vi�/�A=�Q:Ȇ����#����h��ho��ܕa}�J4+΁��!g�����,#�3�.l�/�J(�oA!��k�w^c�L�
{�-��a�1c@�[N����d��d��n�3(ְ;�x���l�x꽮��͔���v���b��uO��2�;�V&���.��K�x�FG���l���Hu�wOMAΖ��}1`?f��W?䇯:��v E;`�-@a(8]U���,$����e��l8w�0 �������t�Yy�Dl3_��)�����Oy5�-d�?�~����~�#=6���X�{%����_?�J�M�㉽���D��=T�7���SF	���݃P�+��"g�J��d`�k����2�>�8�t�:��t�f���=�˩)��?C�MS�����9	�	�D��掔MVS����X��{�b����ܿu@}S����zW����P�P�K4���/ևh(���B�^��+�?�-m��I?!#�^����r�Df�a�<@Z�}qB�1�ӸV���S�α��b
l.!�I���(�n��9������@����81�0�C�ۧ�������_
�}O�7<�A�ݖ_M�f-���y�n�M.��-�:`d��΁�    �H;�Jĭ����N��У%<��vF���d�@˗�D���
K��չbAI�X����p# ��E�c����ڽl;��~<a8_���T��.��@)I�О_}%/�*v|�Y׽G���lAi(
�qt��{���g�K�[���$u�:�_�-^�R������G�=���.�"��U��ɱF��L�e^������B)*R���,|�#�R����eۉ��^_��R~~�ҭ�Z;�\c����OE�4��4,>e.l����6��������*�m#��"��y#@�
豩�Ic�rX�b �Z��+ �׊���fO�����	�MZ1K�}q�D�v�݁��.#Q�o
ݜV�]�]��s
R��Q��x�?6��_:�P�1s>M��H�3�P�{��,r}�Y�hIJ�飡M��������m[��hY7vs�+c�9u�k7>�9Ͽ�����
����G���-ނ��nM��s�R�jCVN�Y	)'ϧ���k[�����3�o&' j٥Ԝӂ2�pv¡9{7���v��������n�x)�+�-�C�:��*����S��Gf�T#{Γ��;R� �M�t<����/��1h,֋J?d�Ǒ_HF�%I	����/�#s �H.�1L���gv��5�<����sC���,�&��M`����w�Ё���l� �N�i�������:c\7�Mc�����M�$ �w����D��D��+��y� [~*�_�61���8ȥ�Q|զ�+H�&Ylf�--�MS��/Jn/�C5�x
x�5�B0�t��vM=I�6�!��lԼț��4���#(Zc�E�}m�t/�	��*�8"�PsFm�(���Y�e[��� ������3���.������j��{Y�&,��E$\J�qI��Ų�qj,ڍ��Z���~oDB�RB8�<�p߁gyGn� ��u�I��܃���,IEK�s��J�!�>XK�?��](�5tqͥ3M~���-6��[q��n�B��e~T��݄�<���
f�3C�t��A�gN��콙΢�FB9B��_�#&[���*�m�m�,0Y(�2�����o?\�ـ��� R]%,V[K{Nm[h
p:SaFP*�Xt'��Jh��2�3_j0W9�����S{���u�,��Y5���qon{tS�r�(8s�j�|9B9)��%H�	������u$�R�#0�4"�7�z�����O�8z�|�RSVG֟�F���b-� �w�k,�u��w27$�K����E��.�J�S�N�pB&s�K^.Y#$��΋P(}/�v=��&�t�.�p�9�:��Ä�2
����k��i���g\��z�D���%&Ki�iF+*��|��S�J©~Q��ePC��ʡ����1�`��Z^�C�m���������1ƴ���PH�8�Ds%&����@�ο��;���i��Ar���ؗ�0o:c�����^����[�?6���JF�ޥ�~�돢�p�#N쳐}��) �_�ٟP�a ���D����<m�#�W6t�VU�qT��5^�Ս�>��D[o���>��2�gg��y��U�g�%����Ku�t�L�n���W۲�q
y���8n[���@-���U�����`\xY�bi���Ɨ~Z�R�u�5��J���` �"}]�ϯ՛)>
^�/��6(Y��i75Q1rJ�f�| ��8d�/��~.�C�Å��;/�
�OJ>�������!niEϣE�F�JϦ5x��[NaX����i�g%�h�P��%U~[���[�r��ӭ6ʈ�{9���8b����%�/D��[�l�6B9�ʶ�,7�x0�#Y��k)_� �y�5L�����������82��˘wPu�X�7�d��˃#^�#싶X���&j.�yh���k;�ۧ��M��E$�������=��3fs�G��,���l��\e���F��wqO�����o��^��K��Ж�f���ܻ$9ql{�_�(g�O/��'�a�x��nb�k"3g�8a�%�XQM	a����Q��3��֏�}!���s���eI(|�W�������7�q�#�b�l�zgY.`&���#5h<9�s���\c�4F={rVE8�ئ��dG��CY��G����C�+�3Q$�]@jS6��w!I��Eb��J����Nq���*�%��K8&)n:�j2^h�!�p���q��*sz���2�ѵ�B���-�������<�HkuiZ�U�N���%�7N�B��Bl8:'o�_&���gI�ۇ1�,�t(�Q
�ŵEI�,�'�N�i����=
T�F��oC�zb-y�\O�j!o��f؍�3ꠦ�K�0d��Z2�GMb�	8�dn^�r��ȃ��S5M$Y��Kzlh0^rxz	�X7O���֜ �F�1��k��(%LI��E�܄�����xM�f9��\�d�V�D��7wj�����1���EbW����"Lz]��X��b����e�7���Gn5`�wz���X�G
!0☍��+��ޛ 4��c4�ψ	_�Z�M0p�a������o������Bm_p�`��^��.��r�̙�oC������T篅 $y��S���=&��b!������v|�H���g�FD~^t�j�A�&9
�TD�T�.��H:�p�BG+���Z7O�z� 2ry[	�匎��At��t9�KIf��#�	���B#7�nz[���H?�ZH��X4�I������Y�/��:�Q�!�A'��'�3���db�!�{b-D#�����}��_��Se�cP`mg��7���ZQ����[�5	��^I�p�W	���s݄��c�کY�_K�X����G��J�3j�H/Ӷt��;GP
�-�J�Cw@_8��YJ� �(��ÌR:���-#��֯vp�!�aԵ�KC������fU�߾Z,��31��Ҿ�S7��%)*��qH�����0�[bf�Z�r^L���g����&8z��Y'���?9��b�f#<~�����bvC�:�/����>6�d�1�sR�HS69�F6՘��*]�-Qp���,�`���|����4`	��TuEm���e��[s��}+���w�CyT��ip���Q>�hi�g�i$f�V#~��o՚��g�wݨ��|#Z�#��k��ន�D��=�l��%���O���Gq���ě��Z��f��&���7E�4֐�JgI���՝l��C00a�+��.�2K\���7
�HSz�$H�;O+|$���Y���C���8Ҕ������(�'�'-o����S��#��Q/�25��������S�m$5~�D��A"�����V^�4a�%S�3�H��Ν����J��z�]�3�8)�L���e��ޅ�vu��OY�t��ЫQo����?�n\��7MtU�v]�h� ��dxTK�X������KI�:���q?�l�%[Yp")����&��,�n���nb�k'�v�W*�=v�ҧjn�EV��9*����~��_�Ŧ3mvP��8��N�D��- I�Ʉkk�I��C�[p���hB�j��a8��mEv���ZbJJ�bس[e�٭~9p""p���٫�e}���>d��<�����ʶ�uW�H#�Z6�XR`@�5r���Ϭ����䫤������=#A�>��.R2��nss�y�S;.O��U��l�Л��)kr�������>;iYQ��5]���N4���Ѝ������������]�E��-L��� ��<F��lۮ���Lz��r;^�h�d�$��r�&�J3�Mه���)�O� ���2B��a~@T�Y*$zbuNK�h�)�ۄ,X���'��c,�J����������݇���_�����y������	��ˀ���w>1����qu/�����<�m��r�o��BN C���U��w�B8�3����ݵwO����5��r��T�ڽ�pe���-�
��O$�E����K��/��p��D�    	�5.����J0�H4sn~�Xe�C���	�Ct�����5ݧjNds�����,R��Jh�~�ޖR��J�T�Q���x>�[Jpa������(��+�L:�yU�k��zKFlb��� ��=��LF�n��I0Y�c��h�L��@��*S��ߣ� ��r\=���ŚH��m�t��22?�pb�=�|RQ�?[i5@�"9���6�'�T�^C��K�'=�p�`M�s-d��M�ԯ�3�?�����07ly���1�,Ogw,�d�:N��ۓj9�wt+�O��^�&�Mn��m�Ԑ���������0d���k�� % ?�2+��ծ;�Q�'�~���YM��g_ c�~2�o!�7i(Ԉed��BW����2��2+�cVK�@�b���n,�Ptog�mT�P^B<�$��Vr!�x�����i�{>�dH'*�GY�n7�|�;���>^?�}��������@�6X���!Gy��L����Wu�����!R��8�Ӟk'-�F��00�Q���/�NP��*w%^�e��qA�;嘜��<+�2)�A��^�t��m��P�W���T��?��nYnY���;�D��
�T��n��ݲ���}�}�UŵD7�XMV����SL��y�y���� 	�����K.f~ 2	 ��6���x�Yc�#�Vsycm���2�ӷb�AC��:;_F�6�����#v��V/S���>�ט	D�w��d}V�Ɍl#BF �$y^�������{I@N6 ��h�(��{Z۰����6�~���6D�M�"�F���nt�q:�:O�,6
��Mb.�K�WQPj�]}���@�־X{���{�zC g8ظKh#�q�A4����2��m�߰�Wd\�x^o��d�ň����E�^DȞ��1�!߀pҧ:�.6p[C��c��%6�/�����uZe������3	���*�ڍ��F��[�Hj��b!�]�PR�m�_$0�:��ٵ��P��X��
��2��p;�)�,����$j0�"�t���]��,�e�E�^���f��3$�e7��S��&��I�V?���k#��Qm���k��=}�J�S���i�B�@�R�hfѰ���7�v�q�$sY��!���X���]��
ś��]�B�-
���Z��=�:��!�gAN����m��IB��`	5�T�`�g��[�Pb���ZQ�L����Ҡ�Cw���b��7�_��ʣ?u�x�5-/}�P�!�N��D�=��2ܖ���pʎ6�-�,�+�[��U�ל���B)��U\p��h{��z%y
�7q���P�pr���n�QZ�ث�g�������|�ց�T�A+�1���7 �B*�������"(�c�U,��h�fXtmg�r'~n����y�
�_���Et�)��-�"��-�{��ި�P>�ܴxI���d��w��!����ɿ��_I����P�t��fa�F��$h��r	=�\D�~�������(�?Me����m���C7	��$;��
y6C�'�`]3]`�F@=�Z%d��A^o0�jdN1s��y�}BL�bc�I &��|����e�Ȧ��JXM�<�K+$.�ei�K˼�'#�rmDC戙�� R�!�,�y���rt�*M)^����
_�|�����:�n�i7��V"j�� Gy'�v��?����u��ƏM�%�Ъ�$k8��B��s/&�: $eu3�T�6�)%s���#Z�/$)��!j�,�o!�&Hˢm��I{�^�0�S�{w|f��{��3+Ps|	1�q�"�.�a�ʾ�G��7b3#*�rAy�)�t��Q+A��^��*:��p�����XL�:|�ٞ?��+?�m6s�V�2����b�����U�l1]����7YW�#f�w������>����W �T���p�ύh��o.-��I��x��(�6�x+���JN]x�2��)�ޜ��d ������81[��ղ�l־Y��b�g��5�N	����� uP8�O2]�-)���Cs��OP�]2g���Du�R��ҥjX>�\ P.Ѩ.!�k��#Z} US8-�-c��C������[<������~U8)�Ɍ��u���M @l�ah���:L�0�����R�rZ�`�̢x�pCJ�t�9ƍ���)1�Q��� Ӻj�XT��{_�T���q��I�eN��Ӵ�u�X��$���Cƣ���F�E�]f+a�ؓ��@r��Rs��Ss�0l]�o��%���)cS�kxv�+fZ��ۻ���_�
_|R�hN�%�ܭ���o��d�Aa� 6�辏i���]�.�UU�����T�%0}�h3�Z���8޸=��f�X4��]��ֻ8��1e�9?`��pT���Ƹ)���9��Hq̍�9��=#�֍ b�_`����9z�[W�\���ԆѨ�h���7.G��s�D�$���R��w��b��#�I�F:�Ea|o����'��C�����m�������@�������i����&����k�7�}76bUodGd���䚐�S�uiO'lIa(0��q�D���l�tJL��],7O;�����_/��##m�BkK7w��9^a����4Y+��>#=���Q�K@�E`���l���Ўx������ґ�:�ǗD��e���-ݹ�@!�
>���X�.d�ѻ!"� c�H�)�1�1bQ�`�Nf���q��=K���*���[���Y��{������1 ��^o���?�>�!@��&���S2�%���?@6�!�uZ��WkWH�B��1&a��<5�`�FO�m7��oj��^�颩�v�t5l�@+�>\������6o������`��E�]Ī�����]�c�R.w��b3����X�v,J��T�ĺ\�8o2�%�=��� �6ܛS�U�.�N���ZM��0�2����Tc�v�1���9Yޅjf�KYBUSK�bo��E��0_��b�k�Dﴓ����ɄShk��-��>9�ד�2f�?�g�B�b�W�wb��)�Zݲ���u-j
*(���X�aum_�
+[B�g�.P�W���	Xj�����߀�e�T�=���I����;cː�B�h9P´���W�Xw=��D�x�I>���T5\Dk�6���k��f_��ի�������������?��dz�KYCJ�L��:X�$gG�|������*�fc�r}ɴ7�w>�}�Jܠ!�%k��w��}~������ށ͍���V�7������[AJ߾C�z���%s��}�m���=�?����:G)$�b�y�d�M��=���a�6'h�O=,�NK���~�h�-����ű�ZW'� }��?���uwhE]o�t:o�8�ɘ�M}>��B�R��%���&)X��曀���WT��J�!f)ϰ����� �"�DQ�z�E�*�|b��*�d��D�a�� ��ο�����v��� �����Z�)f&�0d�L�Me[�p�n����\һ�9R=�E�2D��9���O�ղH�d屘EZIv�W�� �!�FZp��PF>n�4~�L9�F%#/��Q�u��5��pN[�	r&̩o?�Ɣ��;�4#P�<�L�8�)U�#��s��CC-^duB�)����=���3����dѸRJ�7Ө�l�"� �t4XYKf��Dk�ò��XW۞%S�/.��u�[����qb9Bc	��H{a�~Cy���k��g�ǫ�na��'������J�ʁP���R�N��E)+u�l�������+�X�@��q�4�^Ų��KpeY�n�̊W�_�w���Me0�Z�p�׺�����rme���_S
�(�Zcі�����Ob�>���X�Wrhx��_�Śg����p9�ڀImō��X�P�E�:�Q��t�2�Q��e�kM>{m�5_�f)��Q�H��D$S��t���U{�X���@=�v���k��������Z2�l�?�{\è<m�m��XJ����Q,�v�D;΋ 6�����E�L�:S��ˉ����7��ja�z�    ߹�Ɨi�5�a������f;�����ˋ!��-w?�v��ک��xj4���Wrs�(�R����'
�U�@WN�+�j�Y� �p{�.�K��\򽗘� \�y��O=�=5^�|�#�J��cw�422?�ʻ���K6(?���l#�ªB�'�C:�X��g�[��x=rG̭�Ų����
�b�Um�eÏ��M'��5�^�$H�tt�j�4�X�d���W3KM�R�9�(攃�J����3�;��Ryd;\����nd7 ��r����N�Ks��V��yt7�n��&I�$2��q
�*�S������Gj|�y3Y�����V�;y��������'剫�瑴.�r�o��|��y{�:T ���#��B�F��g{z�C��%�龇�8�^�S�_�P�_Y�4f��[y[|L+����l2�Q��5~��Ee���)�SӉ��m��A�|%!F���p[%�yI�����Xc3v�s&b����zE��E�z���/P�#�`<��k�x����:z	�+�%�Z��~|�?%�1��y�jD��)K��ʊ�d�H��l���Ī�yg�TFL!3�fc�fl3�t�-F��(
܌�R���O�'r�Fk6Y�6�W��]�/V�J���i*N���6(��x��*�>.#�-�JK,�A7W�������[{��5A����n�m1k������"�\?��rۤ��:��=� {#�m�ZSVk�{����(�2�m�JY�)܏��MM�K�x��b������v��@�����: �  aX�nF��[be���bƖ�\��+���Y��H�R ��$5��X���rH�(����f�+�1�[����߅D?��=d�2D��Cט��O��j��j�=s�W�q�D�e`��.{��T"��($D�{�c{�Ԁ��x�;>8�TsJ�hu��Y��t%k��s��6��#�t�&����ɿdŕ���]���6r%�WBA�OJ2����ν��+'���.@īO�����q���6C�|��R�Y��seX�=�4I�j%��#h�%S��e-�r�"cd��Z�vi�i=��̵E^'��e�qiq+mEϴ\��1�1t��@�D��[g흁�{����F/f�<���ҫJ���kz̩�qJ����zb�ޤ��j�`�^�siS.U�� x7�J�+�M�lz(Ū���|���>�/�6'��$Hk���kW�Jz�C�[���y�����2�P�Q�kd��ꪰ��-p���LM�%�05���֩��s�H�9��\;OaC,w����N�=��(!�$|#J��vX/ˏb�6�G��2tI�1W�ձ���d�� ,�c;y���5�d�̦��Fo�h8rIt1ɷ��������ݻ����V>�r��)՘�{��dQ̛�v����6����ZO�c=`�OO�<n��5K���U�����&j+1���sy{%֒Y��Q�7ȰZ�ޢ�U%��`R0#�4�L�2�$/���gq�#G���N���~}��M�Cn�cna�a ��/���K��-��Y"f��~��JقRZ�X(J���|C�^Yn]���)S��!�+��;Hv��bvY}T�,�ܚ0RU�����!˽�u=q�F�~T(�Z�Y�7�qtR,��Ks�3iˀ�s���+�4����'��l�K5)�R��E�������Y�p��1�����e4�����S�?���N�j6!J��u��X��~�4%b�_�� T�Ĵ���xlO-N��pge�/y�Q��2��$����s��*�Hl~�W\��.��$�8=�����H�Z{�,���
+LD��H;=o6\z�Q49[K�u�_�
�b|<�5��'��WIS����\K��t��v�M�(�ه���ۈs����o�)Z��G1�}�GM�GL�؜������m�d4��Gw��f�d�J��dX�v�xT��X�)�C?\�)ޏĕ�K;6�+���h!I9�J%Ω��+UAODz=�M�9�G�ɦ:�s+���~}�K�)��jDO0e�����TK���l{@5&�Li����Ì�1��z�]�5ꦃl����g+[�b���}=ؙ��+�<��gy������%=����krq�~�8�J�dLU�h�jN��Ǘa[���NmC5��xr:ѣ.	���=M4	3�w�H�x�j���b=���v&�T���&�2vև�M�,�'[`���,Bp�R����Ų�;~��c[-ҕ��,F/[���b�[��s�n�]`D_>�^E�d�����O��%�wW�=��20/}}{�+0�Tm��$8[	&X5M��Ț2���HKs��'9�-��|�T'��A��>%�7�+Iа�00��j�jQ,�e(]W�3�u�Ī�Ԋ!��-�_����xXu��ϔB����i��<�O}6@b�����'�'�h�{�1���y�P��+�ވu=���s��ݏ�OsY-�*�����.�&z��qgE�����Ј"~*�S�
�,�ZJg���ډ���=᫳����;�:фS�[Q~��3�+a�9���	3Mu��r��R�u��=75Ҧ
��2f�z�Y�~��s��#�j)��yʍ���Y�3��G�2]+`A��v�`b�#�h�ߦ�@])A�O=m��d��:����%�+�.�j�\�vl�ʦ��n�XX#��?���Ɯ�qkWQ�.�b��AD2��+����o�s�|�#���u"�_"79���>.�S�}u�o���z��_�?Z���r{߸�f�>�� j���/dH�o8^Vv�)��{�թ�R43K�@�- �Ą�)��
I��s�Z���0cg⪂���X�FY_N�b�	Ll���;�=;�Ǹo݁*b*\>\[b���[��d^��a��2�k����e��h�	���6������b���Si���]ՠ��<Y���UR�>4m�r� Gn�u�e!
�G�)�$w���>H��}9bo]��છ�0�;�����#U=�oh'#�lQ(���LE���<��5m'?&��)X�Eۅ^i�չ	b��v�׷��iL=y��vV�~�j��	��H�_>���DL�u��<���x�t5fK��K�3�q���Ø���˘0�Us8Re�o�t���a�1a)�|���E9�_B��YK��[#̬���~ŀ9�}��8�:�$��6�������fR��J�ga@�zf쑑M*2d�Rp_y|� �.RR1R�V*T�0a�_!hx��:�����$���p�HW2���D���~�nW8F5޳�|���A�'	�j�X�.�)���NJ�k��:f�ē?�X�[X����%̷>�Y�Ӡ��ĐMb�Vo�B{F��)�WA��n��Q�rȒ��X��2�X�T���`R2���Z��a[��O-t�gCI�b���1Ǫ�u�xYUCw�P�m+��8eb��x�1՗���~�UK���n@՜��Cj$p��u�'����?E����I��7b��/�� )k!���������a��:gz�.�!�l��������êK���{�5"}���p�6��j�(C��]�(ղ��+��jU��*��\uA3�d�N�t����j������ŇZ�k@�5�L�����?O�տ��}}l��2k�To�V2��|i��*6�2���j���nAR��x^4ƧFr�q���H�O5RGL=�L�t�'W��3f��.5�:C�J�_{�^�lMa|�z��u��q@U���;�����׎}W����/� "�B��v
 �'%}���b�	YyQ|����0� �p9[�I�M���BV��2�'��]���r� -����\bY�z�4����#D�v�U\x�9��ظ��Ht��C��f����
8���H�]s/C�c�`+��'�.�W�&���1U]��G�a��VH�S����"Z)1|4=���[���쑷�̿�C
�VoX��,��r�⫬��Ձ��*��u:~a��;��M����C�O� ���y3z�3��    ܥ�WL���{�cBn��������Q2Ǻ�N��V$b���V���=�=����,�h�l�����~���Z8�X��~�g��0͏���I��k�K�&��26Q�9����?�[���\��I�Ga��j)��=�įD�s|�'t-J�\��6
I̪��
���h2�Y?!{wU2N5��N��	S�f�E�����XU9��?m�`{�$,�d�TwB���$a�$���i��8�I���|7BJ�P[}'��TE\�:�L�l����K4a�Mv�4���p�/Pu��n�3���Q������Z�~u�av��M>Oz&6�`u��g"7b�E��	�:��g�R*!mZ%����`ŘϘ�fh`��~�s�E�<��@�!��x��%�5Dn4D;ɩǱ���&�(iF�7���g�(ͳ�T�Q����D�+G�,�MU\.i��}����	��srIىd������-���S�4p��0�J�5+�ZѸ,U.�ʡ�fEqd����
O6r�
O�VKZ�E�\�YuJgk������R	�BM��bA���Xb��b:���� ��?�6'�;���A��yx���&���5L�]/�o���֥�;Ƨds��-]o�:�ٿut�w;�����1%x$�*�� )�Z�A�����w#k�>n����JrU��5c�P?��[�ETӶ�Qt�_�e����Q��?0��$��K'�{����'!ٿw�M�:�KOȝ0�e�5�C�(�fŤȘ�;��-�N�k�O���f�IT2���F�(y�5��O��Ӑ��soLAc�C`�& �G|�;��ΰ3��a�╵���a�'M�*H_)�X�����q��U��n�� ���_��zy �T#��������Ŧ�]�i�z݂t����L�ϩ�o�o7�?�!]C��ff~܉��E�v!U_B�4�M%�W���6A��G���C��g�een���9l#R�l$}��Hl��e��g#��TnF����Ť��A,x��m��l)AB/^o����Wg~�csI�y������tHM4H|�c;����e���(�WA�� �J ڬ��U���nj�����~R�2�f�So���F�1�k��|%�-�ojM�0l��s��B�]!R��Ռ{B�j)���CGP�>�xj�7Fo�	)�t�(p8��b����K9��̣�<�G�p[��O�k^|��H�0�]|���mD���6j��y���3��f䅬g/�K��T�BlX�	F�t��i�I�C�(i�*�v���Ї�b��3)T�:w���0��d��BF�2���3T1�3�z�+���m��'�D��^n��~'�'�c�NX��b"$��q�:'K��Kap$���4���3Ezi�S�=�3	�����~//��IN��$a�Ӑ�-�է9A��3E���HI S�c�'1���%��V(��n�!܌�r`�䟀�M��F�r*�# ���n�O3%�!Cܐ��!H� �d�
Kf�ݷ��>���p�d����h)��9�*]2̰���[��~�y(I�)��z�W--`u�p�?��� U:
:-�G��K?�'����:c���:<h��y���� �*����oUz,�@���I�N��h/��n�4ipK�zdS=nc�k���ӭ��BJ-'霷�5#�bKu� �*C���Ϛ��[L��Tg��� P�P��%����4��:K�N /�|���8���j�|y.SfD���K}��f��n�e_w5������-)0�əbA?��=�u��># 3QLu|on�V#1F�Iٖ��rF���,���p«S�2M6�0}U�Gꈩ�;�����!����*��%S��A�>6B���)�X�!+�?�i.-$�>�r�$�+�&�$ËSҞ~�֨��.�	t���$-�*:q��\�C��**F��1��T-��`+{l0���J�/cs;��~?�Co��h;g��۬]MO�s��1�r=���kxj��K��,�\�vm�mh�4Ze����� ����qC[�F�6�'`�� L�N-	�mt��F�ԜvD��;D��39m&��a�&�V!gz=dһ�* �jw$7����S�#c�����g�t|ߞd�@���r������>_�����x�`�|bvR��D,�H�'�!Sn0�=�j��Q2�z��O5�"�L�A�I5}z�f}��I��Y��a��������b
vnD�4#D�1�kz����M���Y�>讑<f%�b��yd�Nu��i�^V�$�*[ˡ��I�7��SO%l��r��l��弅!�Pb	q��u$���}~�/OXsD�����Q|�u�dTp����Ep�,OX��3-���.1>�y�|�'���>�;�<a	l�$��U���$^e���ɝ343e��������y��>�A���∑����_��	S�^�ɑi�: [2�0֖yq;�]����[�E�'���d�K��'�)��Աo&4ZRiȖ3�~c\W��Q��Y`
�v}ʭ��	�|jH �|=~������F�a��\o�\�����{�l��y��p��6�4�3:+�����3����X=��SC�K�l�9��V�|�M��R��u��f(�.��Q�R��3x�{����O�>7M�4?5�_FHf ?&�qUI/�1s�+�{$�L':|����Ϫ��/���~-�1��+�bVԊ����Q�{s���9ЕG�	�B�u���!j�' g#(v�Ş���n���y�&`/	0<4ƀ�� HO��[�#��[C�{�Տ��-�o�"���=��F�SM�	.�Km&%��&�9s���>�����]1�x�+��c��	J��������aS�bƫ[���5b�%��+Dϻ!J����4^/��Hqy��.!�mx�]6�ۀ��*u-�]�����
r�����J�1�UH�O�:�;���~����E��w��'��+L�t�W��W��Jȓ|t$�يZ|@�HG���E#X�1Ӿ�-T��Ij��e�^�����ʭ,����N���$�������m T�+K��yK��)��$�.�Z&��_&p¼�����wh���FU���� Y����R��R���n"%�|��0�]sU�`�ZD�>�D>Q�=��ս��&�For�R�a/�A�G���F:o�(�HvG	�M��n2���v���b�Uc��"R�<��p���ݺ3�E����{(�р'�bN�3R�L�g�+Ϧ�jQ�Y��͹X(E��&5T�wX�m1)!M*f�rn�O�@|�d�F���.^� �F�t�����ddE5iȖ�ee�4	9� _�L�|_o���X-$�XWb� T:�]��;ӆV�W-j�H�d�I͖�2�@��Q<�M��*��sv�j�&���yA‗l%�y%�^eU�Q����r��{#�z{>t��}�>vhϐ�	ע�F)�e9�#x����ϫ�2	g��[�G��yZ��^<<pƪ/O���^:�.C�4s�h�C�j)��宰	�Ƃ��_\C�ND�(;�(��EI�`]�EG����ڑ~�8j�U�#��T�׮��`OI���1�F�1��Ψ�V+ ��+�7R������z�Ti�?�@�a�!i���Wn�
v��<��	�	� 1ry7��ֵ�)����L�>��x;Xn^���`	B����w�p��	L�ܼ�P��J�2���8��Ȉ�0�Pe=c�7����=�9/�F�,�
\�&����dWp�R�� ������.P��y��	'�	v�Ô�w�����(�O#�yME��'���?�^'���\_{�(<A)�/S��i4�����Ղ�4��ͬ1�$�R��FD��2������ir��ϑrG#ea�lTGj.B=#]>,�	S���he����Z*����ӿH������@�vSR�j�}��/����Y���tF,]!9-�&⥁UV���P��\�yWa�DH)��=S�!����,X'�w��]�		�O4��^�5HaB3�1d����X�(�{cv�p��.�o$��[Q�P?��y����F    E�{Z�AΘ9�x�j�Q����`�V�,��UZ�T��#��(��V��FT�������4Jl�������_�!~������pL�*J�|^E��Q��ۏ]3��~W�;\�Wl!"��Q,Z��6C��e���?���fDI.3�;\���)�	�1���%�Ѓ,�I_���&����E��!t�Y=�Dʜ��ïz�����J�&EJx3�hIN6GK-]�T����
+)Q�+w��$�����-�2����W�!a�'�|�jj+#n<_�i4�QqQ*?�E�.!W�/꫌Y(��G����>6��J<W.c�F��kCv  �Gz�A$S�?�!¡��ٌ ���&<���"Q�D�L>���b�r��K� C�j���Q�����2f�o�,�I�Қ�L2��{�f�jZ˄�aw�!-8�ܪ<�pg�LXUPک6�TB�,���^a�q/vQb� cHX�!)��Y�R����4Bn�\�Ǜ|JU�,�t�����R�M D<��C���b� ǧ�2��e2.St��H"#c2U�ܟ[JW�w�$~ln�e֤�i���%�N4<��U6�q�V*-���V��-�<J�gC\A58�}_�:1HA�G&Ɛ�^-4�/`@������m%S����v����X �y�Z����8�469Fyh�P�ƽL�$���}2���
_T�,2ͯ��;a_����/���<�/s�܂��[H���S�2�yg	
��4�tJ�����A⒉���/&�_H�b�?o�ǁoZ���n�*Ѣ�Y�E�k$׺��ײg�*{!�:'�WY�܃�|;�"��L>��`�5/yY���L��X��E)p�� enFtF��yJ�o2�E=MG�B,IR��Ѝa3�w��cu�����ݪ���Ͳb[�PC�a5���MMY�y�8n��L����H� ��Ml(�Obw��)|��ĎOx�����X�;��^U�̡PVw�je���s�*w�W�����y��w��_�vb=G/�_;�v;Ä+��=ś�hic��0���Ō����yE�J?5�p=���=���y�RՊ�]����|b��T���7���GZe�����.r�h��4NynaD,�9�LtW��<�<к؉�m���Ym�`��ֶ��l-S2��U����J��}hi]C�Bpou�*fӈ���U���*�80��{����=C��]l)B&�#�op2_�lCV��,�R�R/Q`�y�l�b��iZ>�_=��H��|u�ӠP������o�j�)�`��b��x���� ��p1N�.�y��`K��=�>��򿐬�Y������,2ԘY��c KiC�z�s?�Q�8U�F�M�juT:@�`�	�l�3,6a�M4�C���*��V�4��M�~ �!f��w��w +��B���@�BTL�)2�ۘ2dʘ�/pJ�L6��r���ޓ�EkL�}'a_Vpiol�Z�hh3>%�L,����Ėo�6zgm�M�^-��ZL6c�� �>����<��{�k�Հ0�~��I�
�$b�p�W��⊗m���3���:B�A$���t���@)}�_i@��p����~�W�]f��kk�hZ*�d�?/��T��d䬬��bYޓ �s�w~�gxVX�l������l���C�*g5_s�r8�_���� Y�$�hݜ4���B?�&V�X?���T?��+��_��@F�pg���"b1/:y�������*� 9P)�X_MΕG�U��x��H�ZG�"t���L�w�ķMb�@��� ���G���[���BO����w��O<񸴡�b8��A8VGy?�lb���4��D��-��&NĭwzumփAUU�������쒕]�oC���\'/uy��'2F�ŏ'�:�}�����#k�^BH��k��Z��>X�p_�{��Lr��ǩ�����\������u��-��GV��l�E�!���,\GU�ժ��q�f\�~��p�&��#@�[��S �� ��Zz2��-�������mi���Y����nj=�q1VK�{�
�W���k2��	}W�Y�҂�n�����f�F���Ɇ�4f�wuwi��=�/%��U��;��^U�h����BS|��'���[qc��?��s��zqE��V�!�Y�cy��1���YE���>?�7ua�s�}�*�L	D��P	_ir.X�,J�a�O�ōW�bw�����@����ރ`4���Ov8CP��J�Tt�S?@w��j~jW�u��	��SK�Gvx��#j$���.4�凌����7j�U6{rg@&���
���_r�K>�ĵb>�r�]ΐ�~��g��������
���.@wG��I�t�	�t\���� @2��C���Wh5l�Z�Ɗ��6<[��2p���%񙥹 į���`�9!Հd�A��X��;���GFTCB��Z�%M��W��*5Έ-�p�ntX?$]z_�O������L�% Yb��OhU�ڽ�Lb�(���k����	S��08L[j�Z�7�|���fE�T����h�2!8$�#��n�zM���١��D{�|��
}l��B�8��hsZFۗ��C. H��E��J��uu����W��nO=8 ᣪ}�{��%����+��!M�L�����u��9Hـ
�"3I�i7ɀ^�@r�b�]��Nbp�dl����VW{��9G[�k����#��ds�(�\l�+$X�(!u�u���L���C����)p���E*�@)�o�9���z;��r��h�?0���^V�pE����G�X7CӫA&��bIV�c f����=��T�C�dBk�c�vU���]�#�����$�83d��s�Pe�r��c��eI��\�{8[UA
�v��;&<`�^p �uY��)n��Z�1��&��gxc��1����~6��)�����bD�Di~*��z�9U��X�pW{Tm#��W]y���9�f�Q/V��w�(k}	�α�,�y����B�F��=��(Ky#,EsA��9�~�� ��6H�)k!yB�x+P�3����� U<�V�އ��G�*qaA/�B���h�����$�7�< F�8a�'�Q�������{�Ar7�n��D|)���2�vVl.��'�!�+�@[z*>ٻ��(���O�L}��v�=^:ׇ�O�����xH$i`Ce�f�x($���p�1���<&��"�q?�ي�$G��Z#��K,�fN\>�P
�^�e�����HTÞ�� ���`�Q�c��T���	D��G�C�Ś"�Y�����n�($ba���5g���EP�^C�mk���j���UTI������?�n?���G`q���/p/'��u'�G͹=?�mK���	G�z��\!R�h8|�k�_U@��B�q�i-�*s>B�vX%�p���G��$>��+�x'���^l�n�|U�boA9��Sk	�W��ܯ����D�=�%���D-e�_#��xy�9�&|���O$f@��8Z�ى��R�Z*d�G�x��Q�3l<���k wVͱ �k*��,UH�ke#3�5��F��\�a�CC�����y3��)�S�T��J�zT/"D��(&�i�uR� ��.F{h&�R\$(?��N�ĠU����s��u�g��^ޘ����F�"���ט}#,�W����Fa�8���xn1;K��W#b^Su�������U,���
�>Q�cK����`JAb�A ~+����Q�<r�������\/C�P��i�MUc�$���C���A��#��Pҋ�|<a9	�
�h��s��\?6�Q~(��eβ�6�Tb�A�2ⶉ�p8OÝ��6E�̀s嬓����A� A};���&�҈m�M��F�pɄH�X!,K�4e�y��1�ն&g=�s\���*^��1]c�,.xd����M~x��^�"����͕�9��M�]�k�{�?'量�p��h�<�� ��F��Alvkmv�o���KA©}����d+����dť��    \���r�k���� nN⡏�����I���"cU�ܯە�/Q�!W�/VU��F��IDgW�b� �	*�՗�
$�����a��.f�7z�x6_�?�қOx�}Ri���$�������~��#����k�fL
96A\d�m���.a�|���1x[�]�>��1T ��+�A����Ǭ�b'�1�\0�_��^�r�e�A0Rrp�� |�;�p�/Fx1$v�=���4�c��-6h\�?T2��_�7� F��[���dj����#���uY}�"I�$���9�+f��!v	���8jb��=<�z�"и]n����'���x��2Ԋv��=s��J�W3-=���W�+~�qg�V\�j�z�1�����r��H�5���%�[u#j�T$��������"�Xd=�A;x��C �������~����)��AqQ	tA_�B��ޞ����%,L!BPM8%������^F[n�$�T����9�Gə�F�{�U�e��8��q�����&j:%����)Q�$��G%)~�ՙ5"��F'���qGH����Tl��<IBv0��Q����bL�<L���ӭ�&��Q"�+j�$Y��c�a"s����L����kY�)ׄ��2
����Y��a
�=Ob�pR%S��ќQ�VHU٪g.2�T�/L��KA���{Np֝(��c}~��FpC��܂�*n���}���Ёy ���������7��l�m���։�o1�Ǫ9�<>1�$��>�MD��R�Z
#����`QK)��_4�:Y���Ye%[�Y0��x 8�݋�b
����<�鼰����J�#I}c�\^���Z�C��aݞᴑ��
˵ D�'�w��(��c���Q~���� e��������墵����.=�j�0�"�S9pI�2^�d��!I��d�єL�u��h�MU.ݽ��xHBS%���ޕrHj8��R'P����õ9�n�ǧ{�u1[�y+�p���ה.�@�eM��?�~�!�l�RJ�(���F�{-���?_��sTB��A_|�=l/�x4�C�����߿4bԡ�"�ہ���Q�@� ���G$O�(|$8g� mP���b�+���Г��42��(��
yA�q��gT0�@��>�B�h�I�)PLb�ߠ;��BK
�@�m����Pˣ ��yj�u�<8~+<�iA�f$M7�G��������:�؄ W,��n��K������G���8�5FTCѿ��?~��%#��P����2��&���&��D4F�l���=Ҏ��Ŷ�.�al�v�����۹?6��|��7;������_~`��=x}���cd�9Fk�ߏ=\Ф8�����
�Hh-#�B�n���PW�o���暲��1����)f���j�a'��Ӟإ����=�t�	ܵT^�.ӫhme�@�a�y݀3n�M��7����"P�:s��-b�S�:=4�`Y��.&��ۉV��ld¥WE y���Z�����d�iŤ�,�PTu��;L7p�ٜ6�4���qh��G=��x7�%�XI��"�Z�)�ь4�����>�%5�8��ѵ�F�����!���ѧ��H�IS4�W��h�	�0_��Q�k���[��D�]悯L��^�G>Fp��C3���D�Y�/�S�u��T�nk0M�A��mT�&��~���
���C����D�jO8,u ��j>qL/�e��Lk'�,@w5fْ�*5��5,JƉ�6*B�˪ܽ/cg�ε:[�h����[���7��?����]ߞ��T�ZuXNa-���������A�Ӈ�?��_�3��E�8�Y���N��@���V)D���[��p��V+/$t?
9��X:�m-��j�L�t. t&6����<�/�aA)y��4^�HU�ΝY��YU;�����|��cp2���;�D#z��[��h���x=K�;?�� �#74�LP�[�F�m�ՠb~5H��'�D�=�4�)2�j̖���;y�W������6��>�l���Π�φ����|6vo ����9Y�%e#�����Q,m��hh�x�{�9�TV����+@�����T�e�Jy��Je~����B������+��:�0��<�}��=�]���W+�1�<~��]�eʃ�/�=��<�~����Zebٳ��R*�JM�g�W`*���~3~�z���8������Cr�C򿲲��3��bu׆���k���;��_P�Н���/��k�x���p��_]��]C��JP�dy�CA�rɿ���y���.��\��_%;���X��x:�য়q�+���G��G��Z�g�9�_�~kcv�c��(�3H�w_�_���9��_�P�0��0�%Ku��9��_����Vɶ��RUtAp���q�~����8��o8L6�5(M/y)?����.x����Y����_���pp�f�=�<�~����_�P�h[�h��u��ݗ�ڂ��/X�{�-x���m􍴪�jC����~9Ŭz9=�nd`h[�C��+�?�V<��j`^+^����[��������Z�A��A�_R�0]�0�/��c�x�����5�W<��j����돳!�}�J��_�����-�k"����C=^*<��*��r�(�):"fwRE�،*t��-M|�yƔd�y[�887�W�[$ˉ:x�����$�X�-����ɜ��D�Y�~[>]�U1����X�X1�/¼A;��������-cXQ���H=F9� ��/P�����d�[x�����c2�/����u��kq����D�~��ٗk��<���������Si�������f�_�Y*C�{Ld��aOx����4�vԱ�W��W�+e�s��7�M��� w�p6�ؙr�<D0��R�7=�=���Ҏ�J����d`d�� �������fM�wۥ���~�����_��T)w���vh0ٙ �g(͟�P�g��3�HJ��}_�Т��rT@�6�+a{@	���\U.��1Ҏ������v���8Bx�s��91�������8���q
;>xkp��	�-�W9��˽z;|�a��{`�Rɂ8��� L��xtF ��#D��������d��W�`[��I����H��	��D,���读Ks?�@{07�2�:���NAq��u*x�Jn�P�$�0����iy���H�Џ�dI��N{?��a�Z;%f6UT���%�`�gV^)�iqF9��AaQ~t��Z�U�ڟ���2g����7+��?��Ae���T,��T��^*Ю���gc��Y�^�yR�4��\���s:����E;ԗ�=�d������%O-�p���jO�H�H��9�Ig��*���t;�ն�XE���;�L=�b|�罰���⿑�d�~]��^�I�#d��3yT���~�}�����al(��Hq�p�!0(�+E���D�A�i�f\	��q��RH-	 `��j��\аFs�z�X0�iKE.��9+����{8 J�E�K�lG�'�פf�}BO��_��Y�ʩ1�BY���K�3���99Q�[J��B/RV������! u�s�kj�M�h[L>����JZ���a&!$����f�C�|�p��>@[��BD��%��N�kM��*������T��y��8h���|��A̘0t�o��
�	A�eO��ŤE�F��я�1�8b�i����W/˗}By�z�3��B�ʷ2�.8�I |�9P� �.*$�O���&T�ڄ�2�4^�3��=_uiS�Z,�"�lf&3o�Dɷ�8�R0�k��T���ג���;C�*�*��{�R���{u�ٜ1�蹘��`��!A�NG}��(������6e�|��	S&�B15��xS��lb��B>���׺ܑ-w��B8g|"�d-��*M�����H�M���[�����Z/��h��+U����j"����^�
��B��-�rAU�98i��c�-vR��� {�^�    Օ��B�{}��(�	��և��KI�w��Ʃdq�С�6�G]��[%c�!��n���C����m�Z?`�-1_@=հ������1�V�>`/2�k��g��	����Ь���i�{w��ܾ�7�k�.���t����i.Y�)z%o�z��v퇈\>Ġ�n8?܇��;D��r��� "Ȣ�n�Y�r���L�&N�AT�1"Rҙ9��"��N�=-�7���X�Wx�	A*��
^�;V9y$�׊y�b��C��S�& �b��RDU+v��h7���!�
V6� �����I�1�pC\��V��	�y��Ik_��4x���v>�X,�`�R�bi�6�P�����n�Y�����-y�<��9�l_�1��'a�$�7�JQ6(1v�V��h�))a%�|\=�S""-Քe61e��XN�ϪYrdx���R;�����,�ӄ�?�	zCU3�d��>58�[��G�|EW��Ƨl��a����b�D�b�=�s�+��Dȼn�ͩ�K�2ވ����#|I��䆘�>��fq���Xs��L��˶�����1�IZVj�k����v������!H<RGk�<L y�"s����#9=>]!v6r$A8"I����hSb�0J��M0P�Z ,5l�Tf���R��6�e���D��-�l�]ٴ:���e�#4���CfLU	�V�.bU�c��M�Es����v%����&ke+ʲ�иb�l�����4E
�Ӿ���}^��Ӟ�>��9��)��N���I6����8�P�s�.p�h�U�D��&M��6�e��0��R�t4��JD����E*9��x��*�<VAF,H�������Uڊ����r*�D�#J��d,�В�~1~��{����1K�`�u�A�I�[��R�^�	O�� ��ʴ#gL�J�A���D�E?ZL�ҕKP�n��]JK1k�v���@��k�2g��%�bäꔰ7m���zD���r�A�*�o�ֺr7I�q(�������4�=P����6������U��hC�8�&S֤�� �lR֡}���vO~)k۾���N��Rֱk�7��Lr��Tc4�1_��371O�-k���qG��[_Nk%f���n.��"�X�Ν$���'J�ў1���7�S��M���h��1�����U�3V��~S�i����[��gw�B� �g<uoك�*] ����]�j>qY��
EY�l�����E��b�����z2����Y�Tk�X:�R@ᐟ��M	����1 7�ؽ;77��"��~$�i
<f����ō�0�k�Ey�6�7W��=d�����tӎU
�䗮�=�X%m�S����|��ک�8 `���Eգto�դ\�U�T�͔��,$��d�vbRmun�UM�\q������Zz�#E��A[�U�v߾�+�j��O�����q+��e;���ѫw>�:��ɥ����@����4��N�Ay��u� �����vӋ��v�kM+p}���V�K�}J��D;?��3��flVZkV�E��ř�f���}[��0�*�0dր�U�������Bmÿo�S�ę�x>R.��9$���tM֥�N��Ʒ��J�J��Q�\�w��nN�Y�v?� a�$���P~���á������k�;�}�͵�'UǬ=��v���*���J��7k&�~�����n3Q�2��ݭIX�v�Bo�*��ִq{|i	�\'�U^��n��Ⱪb!��ۏ+WĐz� �u���>�Ёj�1�ߵ�� _caqԽ.d.��_FJΣE��!t'�K����Y��%��jg��-h'�f#��j�H\��&��?�K\��w��=�g.�Ã��V����wO��OR6�y�/�o�1y^��S�*v<n	J����l]�����ز<^�饗$�ذ�g�]b�>A�+nÑ7�y��MH�kΊ)��Hs,�b��JU��Q�G�¯�i}�E�4�${�
l�b�^��\��n}���2'\T�l|��=�:g�[P� 0��I�8� ��8/��045� qQ�ep/��T��E��X/����*Or�)�C���H�Fs ��%�ɾ|�-��X:.漕W�3K������Ï�9Z��dm��`�X`�u<D.��b3 Ml���|�,�@��h g ��UV�T�c��`�[�W�������]�乳��Ib�؀!���f��ੜ<�sIkӵ*��
�H����M����z)J6'�3���*�\��e����:����Ҿ�����ʊr���.<&��f�ӋV������d�OD,�-��k���:��*k[m�E/R
:�w���p�!�y��=󔼌ĩ{�����ЊR2J���
Q���&AT$��A,�,(-8�&�bI�.���9�-��u��{3�=Mc�l��,u���O�?aI�$���?�������rEbK�5�Cs��� ��Ε)9�lǶF�A����0&[1g�_�QM~�h�~V�rY�]��+���jt_�I��֮�9�,擰Y^.�Y�u��-�I;�S۳���x�M�s��-Z��dmoʘ_��홟3D��L����AE����ѷ��O٨������։�ů��A �-��3�~�>��KLo��U�9���!(�"��7��Eؙ�cj���������}����U��w��7��
ի��e�tj������T^���E,�J_yؐ��.4����I;=�I3�d���`��b0%v�F�{��Y�-+\P��@���4čfE��-��;� ��e}�.~�GZbY8����	�)V�C�}��p �6MA��q���h�eD�8ǲ�р�p ��Ì�K��Qi/��S�U	�.XiV����U��q�i)!x^�X�T].;�;ނc�S�ٹ���$ v���Z�ܩ�^H�����9/��NV�[#QUl��;IV��_���+[ၛ����WBX�:�U{���+� tW¤��.*�I����R[������ك�"�U�Ę�3&�����/Z�Wx�m��Uٸ��Y���KV�^���惶��i��+�G[�a�M�Z*fx�%+vj��ȴ{GA�Z�`�E�1��odr^�qf/�Mݕ�RW�)fk����%�)|�K�X��Y�F\�hBN�֌��
j�E��lh��@\/8��,�f���y s�&l��ȏ�Pm�F\Wo��|����@�]�	�,;q�?Yk	�g���p�ӻ�51J�{/kT^����kHj|�x�DG`+q_������	���žgu�.����V�Ђ.xPU��V�i�j�Y�q9X�N���5��K�5��qj�U�/p5t����%��7`⨯�K��r����zedQkU*骾TϔK敋�1�k�k�.\��q���+��G���7T�=�i��;�/$�4l�[Bp�%V��W��{������0� J��T.�� Z=�:��J�D �KY��F�8�0i�q�_�*�u߆_�C��z�@~uW�J�_��rPY�����*�W^d���n�ӷ�j\��]#�s�<���i,yb+�2"Ͳ���e�x�K��1B\ �jU�� 0s %��۞�e��)&����5�|=q��+�%��3bQze��`�ʒ���>-
�Y���q�N%�N�x��E���FKVm�y��PC�8`YVjE�a?C�p�0�9�+�%hQ7��s����A+iD��Z3Z� A���+�KkC�҅���Ш�g{�v���~9C�	ۆ��_c��<V�$��nj�=�	�X�Wu2���b�� k	I-L���=ԝ�{@tE���~��2.�ᥘ䔯�j�X�/��nx�"�dB�$+H�
��)��E~4��Ă�Q,[iH�9���tENcDz��Km�d�HY�[�+��ޥ��a��T^��Yp�7l�,a�؞�p��Ekx!����-2'�䇬�dr�CȔ�0]��XQ1�O���Q�T#!fv����yf���m�Y��fl��k��ƫ|U�ð������0l�k�r`���$������V��5t�+&���3��T>]Ç��ylϒ|�,�-X��Q*�Yw,YЋU    t��+�t�],� V��r[oW���y]�p��qIKjlJ)�@��v�:*�ȳ^n��ۤ��Bl�/�X)�!�	��7�@4�������N�x�ط#>��l��H�Q6n�ď*��)ș�����h{K�+���~���Z��6� �J��%w$�jg��71WP[o-jU��W�d+�5(��V�zI����?o�qh;�;��j`��X��C�)"�P���y��(&�hǨV�`�ڰT�g�0+)��N�$V<�X~�Z�R33�<����XBΨ��t�#7v'��M�hA&� ik�AP�KΤo��dY�qsh*5�Q�o�LLŜiveg�,����nb���t�Q��U/���d�C3,0a������;�H��z��f�)W���iaJ��"?�~����~ ��;d�"&��֎U��ܮ;P孔	kC�$�6������#��D��E��PB����8�C}�;���X#�.q^q���.T�}���-ԁa��%�g�t��1�`l�[4G�Y�4H�l!�x��C��a���t�D�}�B۝r� c�A�.9�ni�\�����}���P=�W+��:#�Gk�t��:�.���X��%��g�.�]f���@�N�o}C)uM�jC���ΝX�����lҩ��|�1;g�GX���=D)T���_�W�g$�����)	"��W�Sy��z�}��Z2kP��V%b���U��Z�g��l�"��͞�*�V��,Q5'��SA�z��%������3������SsS���B���]jHD�+F6B}Gt�O퉌��޷X�;k�x˥S&k�-�Δ.� �П�~��������(Eu�q�l�t��N^�G�bN8�2������N��G�N�+�}�Gl�	ۇ��[�G��aܕЀb��n/�\!�1\��D�&wɂ��KQ�~lN�-�VT������b�YO�}��v�}3�Ϟ?�~�A�J�N[����^�-.t�`�ٺ�����`^%͠(��l:��/	�X%N���W�����}Ft���r�}��t���:s��o�4�(KH�1����K��kC���T���"^-P���wc�70�"HV�s���,�<��S�t�q�-]H�wt�*�(�[:�����\����5�8g\�f������|:e�&gߣ�!�,���~!f;j��E��~
�̳�-v�mc1���^J�eJ��9�sw�:V��{ȉ��T�k�4���O�ӌ�i٭3��
�61,�9c˵[��J��V��kp6��/�9�,{}}�P��Vj8���
c�>j{�mw��u��_����V�o�YAŢ����D�gwi��nb�elUүh?���e�-��
�h�y*Lka��C�W��]�M$+)]-�)&�׎Q=K;���҄yxj/8b�.���r�;��4e�t����6=G���7Ԓ���U�������ͧC3��7@�3����@Aժ��e�2[1
wDb)v��Z#�'Vr���D��J�Xw�O�9s��4�dŜl�##���ŷ�	T�_��M�	��w*�[x�*���"Y�d�7h�Um!�m��$e�)�ٸl�����ϲ�QT\Uۙ�dM|)kֵ���p)��b�_HG�7��1�`&G��Vޙ@���_��y@���g�v���XU���g�v��d�!�\�Tf��Pފ�v���C�l�:�8�5eNK�b������վ�Sv{KKj�#;d�SD�1�Z�B�]�Jx	+�8(8��	�bݲ^h��P�����b{q���vo~�p����qK����L���A�58w��E�j������6�*�b�.X�[�@��p���V.n���scW�G+썺�~;iKԒ�=�ƺd�7Y�o3J^{�5ֲ?S���.�M�w͕����_���+{����N����-�v�5mA�汕Qo=<Jw�8�f�����mH*91���b��,�l@Y�T���:f��;q��E#(!��%�6q	��0J���/@��b�-7*�z�|s�{K�ϭ�T kk鹵e@�7"Ԓ#�d��t����?�V#�U�f��8�H�k�[㗩����rM�v��9|X6CS�5�f��ٙ5�,f�3M�dR�U��6��	���A����nG�!��:�!d� ��/f3�\3�i���TMY���ȥ9����e���e��_^)+�"��#r��\����+�p?ڄ���b��6���{��J�q����w�O��~v9�u�����Mv��ϵ_��*ɤ�bf�p1p�H����������={���Ň�yA����Bf��mW���)����Ր:Z��K9C4���r�
o_p�J�k�͘�Y�Rl�.5�g� �L���UX��)s;@N�p,6��h,����G��7F, 
>����f 7�X�S����qH�hq����`�p�KCK.�ǂ�:\�4T����"F@G{�U���h3��=�*C�꠲�l�۾ֿzR��^���R�����_K�r�W,�t���\#���0�g�;�#�uF.�(�@s���U���<�J9w�e�>��F��Ɯ�����%h�]m	�8�	M������=�FΜ�z�q�Fx����.���]���o��[2��j�+\nV�Iv�WO��w7x;����\�D�c��?{��D�W��1�yMh�3fN���f~�C�Vaw'c�XFbm%��F�V4u�PW|�#j������[u���9�vD5!��<�YWQ�8G�^���@��5�HZ���?�2�?vi�⯣7m�R�I�yz���vF��3Dp��E���jc[��X��~�>u��\/x����U�z��%�\���nA+�6��Zre�H@�ݠ�^cKV�dOk��%+�9��s���� #4��n�����mUH�b����	��˝���M?���������`�Īhh%�]�����k7�6J"s�0"l+)��;�0���K>�8*�H<CB �R��j �ɗ­��y�r/N}�8)b$�����t�:�3aε�&�^�8)s!�B��.T��P��p�kG�R{?��婘��qL>A�����t�� � 3���!F♟o�=gJ0ע-v��Ĺ��,r�� z�
�������䏲2H�\����� �o�ᓳҕܕ��V�^�.�4��=�(�B"�=|��C/D�,[�ش ��U�|���fh�5��� {l�.��u]꡻BJ����3OSİ}��M��t*���ѕ�Bq���$}g��_"U��T.|�vl����]��,��^�-E�f��G��t���!�9�;�@�=R�/Y�6NyF��'���24WBt
+P��VXO1����v�؜[1��Ћ������7���F��Cv�|h$�=dO��	\oO�#����j��ML�{e�+��.�M�j)���sw�������b�8�GX��B\��uOAP�T��|�1��\��ē��%DH�Y澘�`.a�)���q v ��#>�Y�O�B���
���&�01d�Bȭ�"(�܁P
�\�3y2㈭Ơ��.	Ew�r�22J�<�`���2����2ϛE�}M�,|��VOs
+��1Jb�[���N��+u+|Cto�*�g*W867��-ǘM#^3�mE"�U �?:q@/��씱�XT��"�,�_F��������w��ż��+�Y���p� a�O֬�Rz������jm�M�ޔy�8��krf�kpn�hnae\o�jj궊)��&��&N�tҙ�<�-��+]�/-~���mJ�(c���("q�P�g�1)��U�[ }*�,�|Y�����:
k_NJD�g9jc�^��W��
ʸ�d��Tkb�b�g�N��՞�=e�7>a���Y ��[�Ú^Xy��;�k7��=�Wt��x�C�n�?�p�v�	�.�K�&�����NC���KN\���Sӭ�#\����]!��~��K��
�leX�Ǯ���j�Xkay+%�5>���(=�%F�:Dx��sUtŒ���+-5[ea�jA��u/=�q��Z��M���r �����%Sӓ�    [G˟�ͳX�(G=+�6�q\�u��8���gM=�#�������½��� K�eL���%��,�:ʙ��_N��+⒍����q�vP��A��,����`V ��prΚ�z
^�~O�,<���4�B�DHn!4�QX(�Q�Y�%Q9��$�)w�w���s�nK��V��s�#E,e��~S�n�q�-��VY�LV-z祔YY�Z����W�;� 1H� H�`f�쵴s�cL��Z�F��%_<��b4^m껸���]�h:6]���&��W4�mk�ꔿ��s.^�n]�px�%|󪅣C��:M�N>�;~�����!��:�Q��;��+�C;<��;��\&fl��N�����gP�eг	�'����:�S6�@��P�(#>0�Z�P~Tsr�!=H�)�;e�'MWԁ�8Y��~�-��D�0�Z��x����t.���JSX����lU
`�l��N���{�/������x���3���Ԅ��o�	F���q�8!�f�hND8�'�3XZxMNB8�'��Nj�Ɇp2�*q���fͩ���IO1�8��`I�0A��n��an��F�0-|Тb�>�1LA�1�>�b8t}�nĨ��%�V����H���Vj�C��I�?�{����2��/z�fO���֫7�v�^�����2oPّ	�&��S�Sh�/���q;�K�̫�@2�צ~E���S�w͍[ '6���	ơ�0����MY�E�խ?�4�Ԋ�Q7�g3C��Ȯ2C��Ho'g��Ρ�A�!"u줨a"lG"�b8D��t���J��ݣ@
|r���fxrz�:�[O!�G*�����MH��H�;�Q
>��:8���|뤽jR)�
"0e$PE�OV���2�L猯 ZwWuH}�W�7#A�"���\����?�tx;~a�L�m��@߯:��W���j�^��𭦪�Ł�厩����/����xfP��/>o�.߼�{t�����>4�[w6����4�s�"xWn�ʛ��'��n�M�O�߾e��/;C�-�����R>3�6���A��|a���?�����mu��;}F��+>��VN��i^3�Ѻ�6�JW��VS~�<����a�t�aӗ�#k�X����-?Q���c��Տ�����w)�O~����R���Ol��h�C��GC�>�팍x�+:�z)�����	�����x���޷+8d �jf��>�@�jt�]�|.vlߪ�O,�Ѽ�'vI�OU��KA���I�jϩ�"G�jg�����0����iO��=/UL�o�7�̿U�Qm+��/G��*O��P	RI��q�)2��a0)xiY�<t��t��<��8c�rg�B�]������x�3o4&�|!]�C�s����g���H+��31�'��/'η<`��?�-�n�U�VU�ж��Cy��������-����ux&��T���[	8jY���m�
[��#�>n6�C�O��u���C롍�O�ä9^�ⵢK��4`H�L����T�g� ���ߜ
�����Z�!��6[�Ȓ$�c�[���_~'c��'���֑�%��2�b�m��F��Tq�!
�f`L��{��*�M�pgx����dh�3,c�(�#ȩ�:���5����n/Gg5�ߓb��a�}�O��\�W2�-ϻ�U�����N���k��_ic;|�����4�t?>�%�M�:D�G�t��?��������5E.|���xvw\��>��������|u��7I����sq�Ǉ?����Ӓ�v;s�s,|g��lzRR$�+4&�t�Wq�_����������pE	���i�b����h�X�[�'�gV=,rۊx���������j{�?��-�����k)����6���߰Du86E�������P%���t�M��Y�۲U���Nf�t�)��o?^�%ȡ��y4o_H�XNd��r�h����'��_���~*����cC�#���s5���#�N�o��P�G>_yz_��t�t��J�;�"��Nӷo)��~-���=��v[���{��g'��>z�R~ݔ���:qS��Әa���*S�k�.@�|*Wh�ol)�.jS�!/�Č�nO5O喏�G�0��̉��?����D#%6���A|�G9���>�^�;����N����s<� �ƃ��b������Z�mr��>��M�)@���hw�o|���'���VG���G,3��n���W ��?�ߺ��ĵM�����])�n�]���	܉b�8ly����5!�2@�jA��S�h��|�����%s�U�X���qil��5��縈��u��a!������<�Sn��]عܿ�}��4�g�qz������uwd�/��u�kM�1�Xa�0�3m'v����P�U� ���0��}��5g���F�6�M^�+3���o��>~*�}��q��axz^4>�ᛷs<N��s�L�����o09n���u@�	c7*Q��b��z
�(��ϯC��Q��͇PrL��N�>�j���ۤ�񅔧3\��D |�L����b.Rp�A�V�Cq�g�UF)6�K���~>�����j��1@��~+������o��w�,�7ݏ­z%����J	��Xl#X�+�X(P��&V�ۢRQ`zx������Z]�<�[�q��7��F��H�es�n��I*�Ak�

���G@�B���y6�9�>o�X?�T��.Ep�Ħ<��\Ug�):��C�X����ų���5��,�w��1�� ْ��Mε� �m*|��^=�{�S����񄞁�5?��~6��>�=~�;J��P�O~��Lqtx/NU�˭%]����kG�����Z�x�������!�v�8�����"��y<o����`GA3=��D[F��{mS��9�S�ݥ�-�fH��Y��	���k%���V�3�rt�M�Idy�oX�Q5T}b#"L:R�7r�}q�{B�{z�ٸ��w�ݿ�m(#ֆa�'|7'�6������%l�7
4��������%���ĎD��Nv�?G��w���C\��dl�.>��K����~_�&ӖI%*�HY���+KB@���ްC��,��5)άϮ�Q]i�"b��9RM�qS���������/��A��#n�iK�i���e_����ϒ���z�3 &] �]��U;!�;؏���@i��o�rԃ��잟�To��-pv�1��u�M���+e-e�v��t{9�c�Wz�g���
����%�Y3���孤9�oLi��H���ȼ�`���$��A\��a�"r[�S�>b{��5�Q9�"�����T���!,�B��-��֙�YF���2��x� �~O7�����LS7�vr�7�=�;#��w-euK��>�������Ф��	����mu7� �r��dμreW�(���)��w/h(���ϗ2D�@��*W������ՉD�8E���N�e�?�Y��A��L�m��2��lkM��v���]�Jy��{a����3=��wʞrg�����G��st���a����y]��-=b�z��;F�'zx͟�mQ�Bp@�8�|c��<������n��_�쟪��D��Ǔ����+a�H�T�&6F�Abm�Cأ�h�+"�S:�~��s���a�,a�g�"/|��Q�F�;ZpoE���(�y_h>i�v�#m�Fb��j������֞�W���d�?���]���|9ⷴ����$�%w�]��-�HG2i�W�AY���D}�K^m*G>�䷷�_yxC1��s�kc<r�=�M4����0�_�cj��s"�����<���Ǫ��D�t�~.��*Kx�;"�QP��E!��9GP��\7�U�cb!Na �La���58>O�R����q�GF�]Q����C��;�yσ��)6w���S�߿��H�����ډ��I�& ��D��#g)�ƀx/R�E!V��f�%AmwU��XP<U�s�d+rC,u��V�46    Z�5�~ #z���|?�+�D��kd�3:�Ց��%J��J��{x��4��?��2�CU��A��% �4ǫ�>_�O���Q�9����6��t���$�+ku#���i֭x��6����-���D�T�i��ٿ�����J�
U��ˬ1Ko�A�"��J�]Mu'��q˥9�j%�oOg�H��	�+Y����$����f�/Tc�o��we~�D�� ���o�2���k�-E7�}_ch���S�z�Pw�1DZK5�΄�K�Ur���闂*M���u�>-����i�2��N�RV_C8�o՜�&���������T�>��C�n[��ţS�Q���.߰;�r��yF!O�}�)�1)��j�_I��:�����Ʉ�e�=7~Nt�hL#��i}��I�:k�S�I�G�j�ٟ��{��KQ�?��:����X�'r�ki>"~?-�y�~U*�^��Q~U֍y� �X��*�Ԥ�{�
��/G�7l�����e����Fwb9��uu;Q��}s<�/�^hCB�|�Tߗ��W�R-F���6���%��x���7g7��5�M�dV��1��cO�G);R�k�$�����T�]��M]c0Y�Vcm(JG5��E�LOSN��V���J�N ��2^a\]�\��QF�;���7�*����_?���e.:��Q�1�g �q|O���c�����7:ʆ$�P��`���, �q/�:����8k��Z���U|�؍qQ
_ӌB��n���E�i�ӱ�9�9�Ö�ݏyyp������ǃ��k�X�,��@L��h�[������T�/r����!�m�/U�>b��z�|J�;�q��JN���WC��'q����e��g���[C�x��_��!Z�g��o�7����6������.�{8�x�v�6o뫛si�6)���3ec�>6��Q���$<�+,��xE%��ڔ�#�S��ԥj�x5�`ڽ���ghn�Ob-�5E��~����-E�A�T=���Qz'�iw��Z���pܽ��9oE�;	�cB4��n,x�wJ�y��[�h�]^>�`�չ�,���B7�\�[hb��$*|��d,vGw�w�;�/�'NK��T�;F�c���?�r8��ɐk��1��b_�9�ۤh#_�1.R�,f��N���t�ǒ
$O{�U�%Xֱ��V�_��[�b{����g���EE�0E����C���e�]�����s�{��,�~���>�h�u�A5����{'�@�ǚ�O[���"۳�_�S�N�?���7꿮��'�O��X �7�Єq�r�i��@�B��}�m�;ڹ��ձɣd�3?x�/tQ���X�W���z��/�_����n���Q:��)��~��sx��Mb�Y��ف�I�Vߞ��/뉜��^��@�=t�L���A3.�������~=[�_����8�"��=�鰜	��ڈo��5	0�Agڋj�h�)nj���! �8��Zq� �K�H.���p���w�}1)�7 �p��Y<�IB�
���s��Bj���������I�������u��:cҜ'�v��Ci℞bR��E�1#Q3��rz�D��h����^�z��Oo|:"�TԌ�wJ�b�"L����N��]�p$X�B�'�|;�o�	�0�Ѡw'A�Ma&�R�ڨ�$����>�v�!��1q![1�nqwL���Q��$�,���T`�Y�m�%\�b5��u�l�bu�*��R=^�"6����������$]��15�nn3emdw���6Xџ������}��©�7U��L`��#&S\7����u�\<y�����׼��my<m/'mc��X0"�r�Ѻն][�'x�ﵱ�~�y�ʧ ���KH�c��7���� �,Uǩf�*f Ƨ�_~V�|��Z�����%��bj��R�&�<��R�1a�\��CQ�T[�Ƽ�-E��-=�\4����;مfL��jk!�W��wM��<�`c��Б"~2%����L_��k�s�\נ2ZrvCǧb�������j��^��q.` ��|Q�����t�Ǝ]����_���Q���7��0���x�+��W4W��
�e�Tm�
�Y3�uW.�|9�a�҄��r��`[=�!�������%������?7�;�ox*V���������磠}@�P��/�j�SQ����P��*���eoo'����yË��&ӵLy���J�Q�Sa��j��{ZĨ��Bn��K����*,g��]��^��`�^����T��~߸��+����h<g���?��O��p�D��8e}S�	�4Ne]�u
�����̄.G+�7vË��b� ߰���]���ސE=�,9�w�a[��eE)��Ey�(�,��U��,N�0#?ѳ���擳M ~kh{�R��b������_3Th9���o�ZU��t�G�TA���:R���b��V������������s��O8��&�Bt�����_�F�p����a��:*�� ��<7��5Y��|L:���D���Q��pi��{�_�������`�=��L�~"��`0B��O��EA��C�%�4 ��!��q<�Ag��?�i3�
?����3}����}���kN����3|��K��� �,k�o��&-^�jw�),:am;ȹ�L�j=���M�|XC8��G���T���dN��Y5��|�� �����ͥ�
v1&��4.&x��)<�] W=��h0:>K0Ԣ��,�tؾ��`d4m�k�Ly�Uz���/�Lbof���N\
����N���y	�ǘ��������I�z����rx��z����+6���h���s�v���d�S�]������r�n��s*8�?���{�)�-�4�D�W���Q_UEP�~�$G닔�}��	 Zk��_��53L�e�R؈m�
+u�6� 
�8Q��	��NaӉ`tÛiq��a�@�bƫ�w�ţ�����/��Pp��O����ī�Ȟy�]!^ز0�I0睼�Y�?k�M+�r�;����2x�����uwl@<�_SLcpu�#���=Jc�VuU]��7t0�D,�ѰYשƂv�Eܣ R�ՕJ�%m�w�䛧��!����VMx��H:��щ��x�ͥ��۩؋'���i����U���&��.�,t��@;�8s=MK�8�M�>�&�+Z��)䫷mԀ���?�4��T�P=o���T2"�>��\h��y�\�3�q�SC��T�R������'u�}�9�\>�4�М���%?��7�]�rh�v��~x�<q����R!�U�x�hh�۸��v��h�_o��L��~��jEy�x��}d=��8%�����V�O�q�����r���֮��NS�b:�N���ɷ��wc��ݙL칚��|))[��g��do��=+�K�y��Gģu�'��L/t����T.�3����S%�V�D���1�l�r7$ rj�����'J
�<�x�����E����6Ks��A�.5wT����w�'�m���>�יͼ�[}/��9��C����r��Q�+�ᘎ��{�6���CԌ����&�8�Y�B� d�;Aտ٠���C���í��G��}�����Q}*��z�dS����~�,�B�λ�qV3�x�w�[�?T��yM�KDe!�P�u��h�~wb-Xq��um"���UT=x�oT�����ꂳ�$�/��t 0���lu�����|.����6��ϫ���620[H��5S��A0f,ւYf/�屁ق��j�����?0��<S����"W"��ِȵ��v0��n�>���}&&ja�_[�#���y>�T���QEU_gٗ?ϐ][g×ٲòDk�D����UbOk�Xn��=��Yo�dP:�U,����ˍ����TW��%E�]�,㢮�iơ,q'�#P�rF���i��dRc�by��>�&��T�I[��bm�6&�'刽�6��T��@z7�?0���p���LNl�����J]>�VӾ&��`S��F��~��|�Ӫn���$rtC@H��;z5���(�{=��������J�    q-N�V�n%m�u���둅E������%����1Y�ϬIZ5IW_���k������������7^�55%:T�Mm�/��βk����a+��sz��2���[�u�m\/�m�Q��?��;8���w��I��7Q�ӧ�?ޣ��{\MG���U����(6�I�du[4���K�'�)Ny+��Z/�
�_}��|��[�Y{�4��� �- N���ZU���u�2y��c��L�DZ7:q�Fvٵ�_
:y�Z��,��ia�<��=u��#�H��?(�$=5���I�;<�1g.������D�-�"֗+�@�^����,�9�x9��sQ([4F��odQ���m�|-�;�]��=#�gW}���r���[H�G��П��{:T�?���b���OG��`�X{�������U���H�W7��
F�E_���Z��Mή�~�������k��_�W�7���#>�{��:/fż�V�*(3������� �<����G�6����hv<�O�z�XȆ9BD��+s������W?�����G[�����ӱ<�B����0�%��e�Xu���Վ���U����H�W7���������ե���V��yc��cS���/�O~�8��q,^���Bw�_�X��-zsyk6�����_?�������L�n;���Ʀ|����PR��zh[ߘ������8χ"��P[��V6=���}T��{�	��M�!�4�@Z��Fgs��������h�_��������@��!�7N��E4�5���b`d7]џ:���^��OzF�od�!�֩�5N9�1�$8oE�x�W���kI�EDg��Rwc��	�ybH�-&G�R+}��}in���)�����c��3=6��{u�Ss��r���3n=z���uo�uݒ�#,0��b�~�� ��`�e�HF�O�������OW��w���[nvz�W��(DBZ;�b�����S�r�D����������h��nd��lX9����ٛ�T�/O���Mq�����~�|H�Ї���������?��\^e���n|:��\��K
z�i�N<��<h���B�]�b��xP��cw!!$d�dL���T"�\��g��~gd<��%f��z��cO����g���fߕ@���l�f�Ќ+���;���F�ɡ���?M�h�p15�m����'��,��4�	 9�̒�	֋��D�	 ;W-� <W�,�K�]V��rCki��Wk�Xz!�g��B���i�����fʅ����n���Cx����G�ɩ�N��G9m�h��a�܋�@�@'�N�q��4���5.�ą�D��4AU"��5�����kNLՏ�q���w,�܊�<6Rk3�z� o�TĐ
7>LS�*�h&\D�p45�!�6,"���,,!&'�H�OI�Q2Z��O��O�=�_�%�k~B�@fbM�"0��4H  f������L ~�/�������ߟ��&����2�\�JP`�\��tOAwL�{
����OAx�2��)�dX"�_6*Ld��~��;Y�;n��F����������ٹ��3���ˠ*��R��w��Z�v�����ʻO�uɔAa�����{�������aq��
�����n풂���@x��P�����E\��&$T�R�p��LhDmd���g}ҟlE���s3򢭧�����](���՝���|Q��΋}c�%�/
`NO��8t��"�+�I/c}Q{�(19��0H�����Ԭ��`�D!��N�1Y<H�\�������d�=�~�p0�4�`4��g7	�~�dp��1���>�� �DA�!��4I&~�<����w"w����s���x">�����վ������R�|h�B�6A�|(ٕ��@g��Ճ��TvGA�琉���K�CZ� ������@��n�U �Z�?g���Ze,���,����0M�ew��˵'I�j^?��-dc�������&i!$m9Ϝ�Y1[p'�X�^8��	X�Iԙ��,��}�SYy:T��GP*���)�<	gN�+��#�K_�IP	r:UD'���d��D���cr%�y��{W���o��c��#̉C@��1M>bȇ;O��G�p8M�#�t\!l|�p\%jL�d7�~ߒʳ��2��f�O �&�E�p��4�H n�p&	D���L��p���x��9�G�P���m��\
�G�|�?O����pEq��op�sq��ad7���M+�R�W#�����p���GNLS����gҒBZ\M�mI�-K��!�!.�G�ɋ얁��t+3����S?��ܾ�� &��N]:���^��Ңx8�&���Fx��P���uI�/J�oCΥ�AaW��g��rR�<V�1��BǔÌ�Yx��V�]P��yqϦU-����}8�e�����>�W��k�UM=�ʿ%�c��:�:5}˿�ŧ ��%rGQƛ2�cx�ul����j�+�o��^Ye�ŷ��ɵ�c�Ru;� L���j��:��$� ��������!1-���DN�:�p�D�s���!}\�1�@�:aLN%��������'�������1�㚆'&����N�8����T*򑊮<��s��u�U�J^>�׽�ՠh�j��V��ɇ%�:����XR}�}�1�A��xE��c��x]_�e� ����.����s�� 7�d��Rc��x'L5H2����l�Qy�$����$h��w�+]A��xU�Sc��xmo�%���N�wlaʴ��o5�Kd�����Y8w��H���"{ߍ�4������n�q�%��l�������{S?��x:��_Lo;��5OJ<{����*�n|o���ˮ-c���$Zu.�<�i� ���]"�FȳW��i6B���*Ye�h}���d#$��a����Ò�=�)��رO��1Vs��<��u���tw���Y-5"8���d��n��*1��4�n3F�^ڻiI:F�^ܿ%�r�������i�J�`�wc�ݛq� 4�H���#�~ ���g�]���8ȯ=o�	��bV&��)hIϦ���gQߖH=	Rϒ�/�v��+̿U�I�rn�'�� �܈N&�W�%�L�4s�L��<�z��.���-nfƖ����Z����y
1��
X�y
5��~�����[q��[�A(���}:��o⻔�P�K�۴���Wz�w����=����;���s�T����v�[�N�5�����r|F�����G`���9й�w�jFH]������k(v?�d�4�=1#ȐWF��rn� �Z����6-h�b�9�"�Jx+�7U�:g�]��������[>x�K;FCq�Ĳn���:���[�J9gC,��P^644��Z�os���!�X-��wA*ձ�#Ju:�`dj�/�󾲵���!BY�9��������!�,��9�CNY�女��l���[�y�.��h2�i����7eTw�C���R�:����muBD�#�\Ϭ��#�\��ɩ�__���I>r�Uǲl����Ɋ��ܼ�o����P<���?����5C���l�}���f�"�H���z���2^G�������λ����_��ܫ[w�yd�[`r��o��y8X�,��p� ��p��rj���!��h"R�Ӻ�r$���+�7����>ό>�������A����/A�I�鼋<�9B�A{�F����v�\��.��듯B\\��%�B\\w0K_��qb�����!��%qUg��JZu �?a�c���yW�zD�Ϲ#���u�1#d̫z>9aFH���w�|!_^u,K����Kd�-����b~���,����:���s�=$D�w��<RW�H}:{#�V�o��'F����P�
�����2\#/807�7F�]����6F�]��%�k�����K����*�`�@3��3^�����C [��)?m��t~9�U���Wy���Ћ:����nGF�jw��)��ӊ�����S3q�L|�\V�> ��c�S�y�����    |�0A�[Ȇ��� �-���t� �-���.��W���v��e�מ/Ԇ	2�r�t�L�=_S�[�)������͹�:���.�����B���i�}��i���3�9l)#n�X�$�����X�,��wKܱ��7z�t�I�p��~���"����Aʹ=�Tϒ�*���1�= �~甎aPq��ꈎ0Crj��`�r'��M�dt�u����Qn��:�z�9��:5��f�׌*�qa�Lq��R]��>�T�S'�d�푭5R9l�{�z��4'�D�U���������C$�1Y��m@$N0Y�é7 �8�d9���QG����USGⴒ�g��{xW&t�+C��(�	F·�%[���OnMGէ�Ω���}���2���n���nr��^b�s�����ڣ�M*^�e)?�|�b(Z���M�<(��CWa*4�6a�z��mȪ�f�x��"K)Pk��{;���ȇH/lˍn����ݝ,���J��݄�����୅��r�u��2>��rO$$����`�8�:�}<��� C}��*�v����&�G�YK[ss�F k]���y+@޺��Kd�`}�@����� w]q-��W��u�,T�	�����|,���g�y�AHΩ��N�Klo8i��B���t��B䳫y=9��Hj��u��"�]m��p}]�M�q!r���SQ0$�{���g�i��!���l�DF��r��8���jO{�"��͹�w��U<����7��7����%���۩�˳(�c3������X���u�\!W^e��y�a�#����c~~���ʪ������!��������c0��ȃ˘p��b�ż�|o#W-���)F~Z��sR�����[�y�~�(�zYM��ob�{���s�a(��\ε��Un�9� J�S�û�'	��"N�%	r�2~-�G�E|^0�$�!KζU�H�?�:�j wܒ6�O�i�9#Aθo���N+��7P��4gD)��n2F������SF����c�s�Ohf���ě�����m�_ƎR��eƻ`�I�o]*���"��	��Aƹ)�T��{���p�18�v[:��`�z��X�eHN7}���ђT�,Is���f��9�{����
D2��k���ϋ9tV_ǶJ�g	Dr���%eH�@��R����W���ܘ�;T ���ō�h.�b��`E*g�nvz�����1��6"�\��w�8~�z~.�`*�\mC'(Y�Yx�ձ����1�K͖*��؁{���c��(����Sб=*)��+����9� ���4�&�y�kLʜ��!�-��y�C^[��+f4�:+b��<�{#��E�b�A<ջ�ÐN�<���k�G�_�c>nFc<�!��ɮo�M~��n2��Y/2��D�M^�^��&?s>'����<{�1]1��Ⱦ�\=���#'Q���%D�9�� q��SA�?j�-�K�S���W��\*�K���%���RG��!�R}�z�Ǽ�M�qMqu�n.)\R�b ��d����D��7���� 9��kg�����rE�������#��]|�4�O��� %��w�g�����}�H"!��7�9Dn��X&��i��#X"c���7��w���O��!��GEk��o�S�{��~k�]'����U��lR�s�5��{���Q*q�d�d�Y�V����#�����D^���o5�+&�	��kh�ɣ�M�g~
�������ɭ�v��#$�:��*N=1�ᵉz�K#C_ͪ��#+_��8�z.����6R�4չX"��H����y�t~���J�1R�]K���뫫��T#U0֪������\!�@�yC��'��˛s��$�x<�>8A����Kd���*c�bJL���:V�0A.�Oj*��$xO�T}���.�����M����jL�a��5���)���x)2�u\���R��+9�D�K��3�+&�I��c��Rd�;�"^H{w�M����R@�������������"gH�wu�9���۟����p���.Q��>pi�����\���r����; ���Y�q� �8Cʼ���9�,Q]�?R��Χ���4�8[kr��oWs:R","y뜁1Nޖ;�(G-��Ի�DB��G��$�H]��]"W%������$��-Zr��c�nG	՛�n�z��-ڞJ���0�O958�'��n �h��v;�9��A������{�sg~.�����|Zi��]�+܆z_;�U?�;x���������Nm�8۵��$>t|ysn4އ�_����ﯯ��K���*cX$o���\���#��'	}B��'�>&�|���#^��+<��O����&k�Z˺:9]HW;�@���ik��?��zL�HW�UV��,��#�Ed��%%�����o��Ϟd�gO���q�^z��|������_^w�����Ö��;�nʜOBv�Ip�E$7;�7�ݫiw7�'y$!R�������
�NN*!��5�\�(��F���O���&�y���(����N�0�P�S��>����8��;���gQ$��¶�d��jyw''���
N.��"���H������V�*Z_���U�Du7�SL>�T糏Ĵ��20:o��p�| C#-�w��b����xb$�%�Z"���4x�Hj��Z��c�\#��U�X/�S�E�lq�Q���mo��v^��Ӥ?  I�\��	�c�&�9��GK��w��"ڟ@���[+�O���������PB�f	UZB�h��Q��iZ��y��I��{�B�"�P��=���W�h³]A��|���V�9���0&'�I��KKd�Y������ia�ٵ�)���Y��Íx����/'TW���C�U�h��������{�I�r_�'��]�7�!#�;�V���ŝ�A���K���;�x����I����I�v(Ǳ�:�j��ad�ؽ�dk��M	��4�@�$htD����X���[�3��إ��-�u�.���V-G'
2��M�K^f��GAp�J.S��'Z��x�z�яy��{�_ы�;��xS����o����ky�)���~j��(�K�A�k@_H�rb_å�u"�x��6s��2g�k:�.�������q*�����-d���!w��מ�����K���4,�V�%��\s�ud�^�|�@��e1GR~��+X�"�`�������9��?�L�|`���>��p�A���=
89�"˪�[�շ�g��O��4.N�o�"�/.����s�&B����Y�M��7"2��f��tdK8�T�f;͂H�������!������C���E[����Y�m؇�3�\T�����`�ˈ��U�3���bўͻ���1x=��M�����
]Y�
v�S�vCX��#V�D
���xe�`6����H��#=�kOL��o�&��
��c�:g�.��{ɭG��n�piu���y��OX����%��������l���L�~�/�V��/�Bv��X��pRt;p��Hth�������П���ЛP���m�9�q�ѭSCQ�핂S�Br� ���]3H��gR3��m?zfnli�����9�W%� �ј�k�1HHe��.����ё��~�]Ձ(si=TGow�9�
7]+�4���-L:�ɕJ�Cvՠ�z ����0C�.��`�s*���~c��t�G���h�*�"��C�Ӽ?�^�vl����c�_l���i,�:@M������ۣ<�F�)�� ?J�0nx�R�HŻXA���ŽM(�Rj���u�c5�P]��=�34�rtǚ`+����d�z��3�zLه&ywDr����d)N&{+_�������g.�����3��j|��[��gK��V	�v�Ue#�ys�S�=�L{e��UK=|�����7��7=�DN��NN�\7����T�s�Ў�����D4�	���Ï'Y��=[�=Sdp#����a]�q��M��f�u]���
5x�9��+r�����W�n^�6�Ny��S9ci�͊�;����^M�?i�R
e��c�2��N�R2�3��    !GzC��SF��h���
��O�9I{�$�zHu���!k6*�������z?2K?����Qj��Qz�(��)]bq��~u����Z�������5��z"z�P��C����d���|s�;����F�������l�Ru3Z�xE����?�/F��3�;Ο�/UqWA�Y�ŉ������f�<|Ü{/�)����2��m�x%���}��T�S������� ه�W�?��Й��*��	�#�������*p���#�U�w9�3.�|>�����yϨ�Q�.��p��\�^7V(N+ Y�[���]�W������ ��]���u\��ߡ�����l�o�=�H'�=��L�(��sG`t����[=SNL�6��[���:����%玷h�0KV����h�&�0�a������H�#�.k؜u}d�ky�G^^֬&s���Gl�>ڷ�i�!�W��r�P΅�oVɿ�V�-�In*5�>�mm[�Į��]�"��^ɦNp�o �+!�W�AQ �מt ���� �W�	�p����� "~Ӏm
z A���]2(���	<͉<՞���r����!tց����P�fe׮ֵ+y!$��F�Bh��"B��O�Yf���BV\�Ĩ��Ɋ�l���ŉ]��xR]j��34y�	!q��b}.vl_�dL�Ӣ��r�&>=4�����Ю`��A���|-����9�#N�=����}��6��Tc�]�3a��1���c���G�����9&�=����CV�nf\!�-Dʧ@c��!8ۀO�.�1²ݟVr[��F	�C�����ף0S`ꔢ^�v>fYc,k�_]bs�6F�H*I�����E�,H���z�v#L����i�ݹJ���z���'a��b�/�Kϯ����-w��ٰ�g P�b��쳻�8����n����]pa���͹bT���T���.-�xa>�O�x"}�o廀�'�Q�ӎ�x�^�o�ۥ���^�&Fl�偭�8 L����`�e���]���Q����h���Cv©��/%�D�> �h��g���n�ӖT�����̱�Y�����k��M�\�A2]�N�D�Jev���%'��M�%�]w��o��!����l��S�Bw�̻W~�'?�	g�s����L��ns~!\P�)�J����o��z�������\��0��=�]�p�(R˃`-1b��y�el�σ๶^�Atm�,�ӵ�^A���+�I~���x(��-�SC�T�п�+���nH��S������?�F����)��C���e'|>���z+��C�܏�,z>Do	�f��!ynmׂ�C��Z0˝�sk�W�$U~����SG�:�U�=,��v�)�=�����(�B��b@��ъ] �skl���V�Z�����V�.�ع�Y�����b@��ڮ�.�ع�`� b��j��� ���;�^r^�s~����6zˆ]L�"Ƈ��X��zC���.���*u!�Ω�҅P:���
]�sꖝ΅k�!���2�|�f��r6�\�sj�ָ�ԀY�BH�S��
'�&�^=�7D�Eyʛ���ed�>݈���BQoӎ�?ނJ�hm�,������f"F �xܚeX6���B(4��r�4Ϛ�����߻�=cc-Ib�D�i.!b�k���L0�پ�Te�	��^;����7w�	��ׄ��e��t�3ベ�	�= b�q��ԴM@���f�&`i/@/)����~{h|*w<�R��Pc5rSD�N�#�Fs�ha�.�S���9T"<E�����)b}4�9�SD��:���� dB
&�����Ⱥ9���R�V%������]��/���e�A������?C�Oˇ|�dގ!2ɘʙ��컙EX4À�Wx5�DʹL�d�^����*�x�hCVzQX�գ�m�r�/gj��h��)%O#;����i$�Lvz(oiϊ�����g�J�,�3�C���aʖFb�R��F�4r�C��H�^��8��`(��h��J����%

xF �%	JrFز#�l�̟B�͌��LF3��-#�jB�XeD/3P~2��2�|���a���Z��v*P�1�I�(��<7�Q�1`�.�Q`14_J��`b�7�`G�($s���a �r(�08
Pz�[.mм���|O�-5/�<q�7�h�o�=��P.0E%�fAji�R�Y�sI���Y^�Q����I!$6�g��LWl�;�c&36�gY�����Yxf!�f�,�2!'������D�;��_UZc#\�TKW�gk�̥!����v���~�`��ײ���5�7�9�l�u�b�U����@���795Q��8|��jӯ8��j�a����6���in�a��.���7J�aC�`�|ؼ4"���=u bS���9��ӻ7��՟���e�Y��#<����qi��%���.�N�a��E,�D���b�T�bf��0-���	�\\(�C������E�6R�b��R^ԲC֖�e�¸��^i���(���UT���$��P�h��JFv֊�F�̕$C��g'0��;��\�L��;3�Q3a�h�2
(Fb��D5�Ȟf���b$Z/i�S��ښ�/�*UP!1�on��>bؔ]l�:b�ؕ�Fm�8���ʈ�`�`F]�0\Ǩ��da�D�F�D�;�t
L�D�2C���Rc��.ZQGI����HG�ъ]����<OJ|��a�sh�\a�9�Q�`D�����XF���/�}
PoE�i��oުC�d���?
�O�� >�Q����"XC(k8
|Qz0TG_�$��I'_�*��Êp�(ap�^mJ�����h���EɃ+KFZ��b�-�%�����҉�Vz�C��|uRk�B���_����O"DY����T%�[�u�O]<��3;s�ƃ�8s�Ns<h���U�ǃ�8�Y�<(�c�fQ� J�����A�����ʃT93ثZ�����jB6�kr5K�):5X+P���,8P&�4�;I�!I�O�"Z�fTf�!B����Ǉ�̷Wˎٙ�j�z3�R��ȰV߾�7~�Ũ�ٿ��}Y]m����8��@��D�C!>�	�	�7n U�	 ;���@}�ٙ+B���jYkQ -r���$�$�c4+S erl�,PʙY�S?4�ي��+��4_���B�����T�k'̲@֜�U7���#S��ãŮxg��x|�|A��Y}t�<�����л���
B��������*B%t�N7��ҁ�Q�J��<��5��.�YmC�킎�׉!tuAsf����Ы�2�����rK߶`,��ڳ������F���^Z��c��jQ-0d�'�dh�M��cVe�#�z����9 V�+���9�#0�q.�!n�f�@L��
��8|�w��>���1�~\gm���q s9����Q!FΧ���""F�#?�a�4�A�q=�l���qh����I�0�-JElB���B.��zb�A�~*���DK�d��K����kG�䲜o�d	Hfﭙl	�6�L�d=!J[�K@>;3	������ɴw����9D�����Y�2>���'K/�2�8C炩�MA[�Z.��s	�����c}
ֻXCE
RH��q��!�>83g����`�$��I�%��80ի9�FֲQyvy+�rG/MJ!+8v��Lw�l�����s��*��-�2��{xU�2��"��J�A��9O�~
�-�����LK��N3��2!��bY\l�f�� �:`��ҹ���f�E��5[/'}�*Ed6��s�r�ْ<�/��xOmף[+$P;��N������y���u�5+	P�:nۚ�Pu�gF�(G��326@��(D0@i�~F>( ��K�^���n�c�п杏Gӑ,
C'��dB)�D-�P�9y.�P�9�	;F��s�)DEI��q���"��f̴F��C5�Q�9�,(͜c�W$U�������ʜ
~L����&*�Q:��^�ZTD����    I:���c�s��	e�f�lA����("쇩#�����q���~��(����R>�
�8�<��'�H>?�ń=_ā�y�.��m��3���F8����i�5ySQ�xS����&���,T�����;���3af%*��9����PfF��m*|/�eh��R�Y����n�E�hE�����P�	�����11)Xџ�ևq��8���x�+�B��BP� '���ԡ�]lEVPj�`4fuA5�Kf�A��L[�֠&l&�YrP�5�J���ŎV���;R�/,(^�HC�|�n[:ʻ�[�*��Q]�Z�B�Qs�P�5ʚuQ�5n���k�gf����L6T��B�)�2�Q���A-�(�^zȩ�{A��Q��³0��FwRɂ�0-gPf�4�:(�1j� T�YͱB$����i�j��aʹB�p�.T��t7�%d6��\��K��^?<ms���vy��x�6����BT�3����w���(3s��Uhnmh�"5���r5lnݲS��9^kE7P�~�feA����ڃ�9��kuBy�[f�B��[��
'���Y�ܭ���Ъ���s�������k%�z���U3�9��N�P��n]C�����{�m��E|ά֢�J>g�f�B9�3{�R%�Cު�/z� xszB��� sSU\Pk7�O����?WP�6lʎ�(L1w
�Qd6�'33Q06�L9��\B!�p'3IP�5��a��OЬ��(�Щ�z\S%�C�V��E�����3�?DQհ)��QQ5b�����j�O��QK5��!
����!���;�?D	�0Po�����x.)r:j�T�A��{�Eb�#F�Ը*P5���(�3��ymю (p?�
OP�d塙.(]��4�uJ�Qk�(it_3�P�4��J2$�&Б�S)~stT��Ԩ���(4��5�(3�3`�(2�%�Qbd�o�i�!�!��>�:bQ\����(-����r��V`��O'q�x�ҡ�&jL�8���6*Q���on\���߄]d���07Jl�H��9:Q�3b�O�����R����E�L?@o��iW?��ZX>C�ף�]*�8�ߜ��{!6ū/�O�%�!���A"�]��L@��KZ�jƥ��lC�K������k�0�1��i� ˸7kVTθ4\��h\�	55.M�j���Hk��ĩ�
{,�]AЮ� �V�g�V�P�3y��xg�vڃ��Yk�hJ}�ì-� �oƬ%(�c���́3kʈ����������>�6��K!ް��e�󂾢罵O�]a�ʁ��h�����+�p蓝�`����*���ǣ4�� �[5k6+ڭ%
��͊����,"��W������d���DЛ{�/��i[P��?��f�YU�w�KIې�s�����zhE�"�����Eb�f{3�-�<��f�q��Zf��R�}���lT�H�;-h�(|�اZ�<�/�Z�1�`$��1ܫ�RJ��]I;�p��-��N�y�6SCU����>��;�窈0d�	4ah��{`��|���QPf�y`� X�%\�bf�f��ƹ%���H�Ol|���)'�����[�W0�_vo�6�l�����^��c=�gQd	n���kp�O>���%-��R瀷>x��sv\���%b@���и͚�CS3o�!:���v�Ю̘�·�-`�W#%��՟q��z���B�4��J@��b@l����E�6�К�(�3
k��ߺ�x�gB0s' w�u�}Ks�`}�� ��6���~��a����q#�^�(D\�뢆j�P�_�!�w4�܀УM��x��[M؇{+�L�KP39B�c4l͗|��L���*��0��Ƨ'l%U_�����=�@�8*�"�o���H9|.S#0u�v�@ߙ�p:Z;��QD�@t�L���:�a̱�=��8q�V��2�,3df��^�+��dGq*��'1���TU�
2�O�r1Db��\��������s��9�G�d&l���#3rR�ռ����NfjĠ� Po�K���\4��j�j˿��7��W�����-��h߼��p<s����ʦlr��e]�9�3��	���%;'`���U؞��N�hV���بY=��[��T&��87�Q5rf�W����w���-w��pW���#Q
��
�*S
e���բZ4y���P�N��M
���F�¤P���0kJ
M�mƬ")Td��Z7��\r*E
��a�W$v�����PjoN�+�H����2dP��Za� Ӂ��B]�,d��루BU�7
�(d��V̚�A�۩%!�$LG3+B���Z� ����0�1ß������_
<�>���_.Up�ڹ� �$Ĩ����ӄ�ps����ʷ9NX�B��YkԖ��ls�aԅuk���!F��CP��hs�����l��^m�!�*�|Y �n�DU5��^+!B������nXl~9(��5��16 ��>W��?��#;�����`Q���NGh�2l~:�i6�:�Z��N�a1%sl�W�Ė�s�UqT���J$6H'c���W�����@l�N_��bt��f���ϙ̬���MH
�䉧}Ɋ�M�Y�}�F�za�E'�FH���0�]�oN�e�\���&��\�h,<�з��7q��e�7>���	x���7�Z%��$n�̕����;���5��S���ntf5��#~�<Ő'76�K���٬A14ȍ�^Q�ӕn+^��<�$$��UQI *�:kE#�h��+
	Da�=;�' ���TH����3�6imͤL�Q�"]ҍ�i&UR�C�%�t*5rS\��p��T
N͇S)��rN���L�H'6�6a��c��|v��
�S�����j�B4�E
�pb�֒t펶�R�Bj��U"ie�SA�0�Ѻ��,��
���?k�RdP
+�v��A��Za~�[�jfx�O 639���k�fk��6�%����9Lɳ��*��ǵ[H�dɣ$�;|�GI@wvf�3y��t�q�GI\�k�&u�(I�v�F�'���� y�b��,�"y����1�'�R���U� "���*4a��V�_"J��o.���ڴy��ڐJ� $�䳙��8�L� ������\� f �5p/Y䲇}�T��#!���nj��R+-CC0�
k.;C��ʬ3õ�iX��־�����l�F+蚉!�h`faZ��2��%\џ?^�Y#��j�/�]�o�:o�a��ixb�{B_��b�{���b�{�\V��i���)v�'ο�O��=�k3I�>�t3S�&�4���b�z���b�zr/q��"?^�"�������U�Ơ�$-wcpw�\�� ��v���)k��7}'�m�o��l#	������	0f
Ǡ��^�Q'���,tY���*W���NΡ b!s:�'ܛ>��S��w�4����[N�$��|	�$Ђ��i�"�^,du��$Д��ӝ��TL(ڔ@��Y��ע.�5.Y/���&���L��2�V.d�WO��՟��*��?�{+.�//9-φ��4�UU.��w�
V
���=)�gؖ������(B
E留�)�=���<ƫ)��G�� {R�g��"�!���y��Ȳzn��/��@gN>U�@���1~kߎ����4q��I��y+���'ƙM��F��-%ݺ��o��56�����/;Y� �#D���~�f�� 7KX6KSirk�I�tf����A�J�؟=�*�g�l42}\/�\���R����Ӿ�Qj�g
`�(p	�T0}�*�H��0}�R�Ը�z�>J=\μQ�G)�K8 eL�2.a�(�飔�%L�j�� ��<Tǒ篧�\�������SIe�ǧ_���8p9� �3pT�����9"7|��yгy~�I�隹^�JyP���1�Araɬ=�g��Zf<��<D��xP�yVz�C�.*EN�Hq��X�:A+�wS�!�4Xah� �Xa�%~���=k���\+�@kk_�,��	�f� �t�    � �0S2 %�@{(�7�`;�t��~#������ Z� �x������6�(�-�D÷|���L�d�E53-����4A���������V�g�]y�,f������|�姙O<�,"N"�D�����j&�����j&�\��⪙NرVTY�]#�Ƣ���8̼uWN̘�.
�f��/*�f�@�d�4ѫr����C���u�*�wW� �L��*A%��9Wbh�$�v���ik��>�'�nf|��z#���L�,���I@f~���$�^f˱'-�.��aI]�k��*��z���	8=q.�0z�q;>'��5P؜���6s9�'Û����Fs��	x<���,� ��a�n��d�Z}h�x(��¨)8;�X�h
����d
N�@���a̎s)87f����H�̜J���pf�����3�zlr$GF@�rBbd-��#vwaAs<��[#���<��tp8=6fM~{��ت���4��Z��$�@2�&�l��F����6m]ze���v�Ίd�#5+F�po�,-�ť�Z�2h�K|�Xek;�g�OղJ�؟�= s�d�D����'5������U�(�j*�N��G�KSQgJP�(%h�Vj�=J���&ma�����ߨ!٣Ԑy&�r�=J��jʐ=Je�
e��Q��T�^�K�y-\�n����e_���z�}�@p{�����m{�v��@�	�0���ym&�2OE7�����k
{��=����k��K\�~�¦&�OŗMqf���T��9b�
aG�A�I*�}�x*����z�8���z`Gk���.
�}�{���A�y6�D�A��Vj����T,3�}�~*~/�e@*�3�2? � ��@��hZ���DԹ��sfٚ�X?uM� ��͜��Y&̔@��Fj�`�D(3�~"|/�eh��̓���OOy��V>x�����R�|>��υ���B0��!4`6�VB��l���Bf�b���Mh�"�V8�Y5B��#cf�����JBIf��5%���6ԫ.�B��b��3��B�{��v������U*��!��;��plD#B?=�����W�?]�;E���K�vd������{�����x;WҰ#��/;}Þ��Q��"�֬|�YĲY�3��v���ql�,��ql�G-z|�T�����"��ґ'�F�Tl�5��wJ<��q��ap�%��zIV�e�hS�,`m���c�2��(�O��N�܈�S��xy� ��i_�:�F�	
���h�i3I'���4m�N2�,c��|�G�0�'�͖1�+�R�A{���{��0ɨ]*��z���ɪY]��\y� �9h'��q��Pt҃N.8~�^z��E]0��\ȉZ?=��B��:�AG2߫�R
��ݩ��>4����>tӡ�V�k��@}�C��4ч&�\cE}��q��χ�97k�;z��p�q>4�!�Y�|�C��Z&YmM�.�i��Um�mX�j\ �[��\��K����м%b@Ѿ ڷи�@3o�� Z���&��̘�1�6.`�W#CٴmU�B��d<�f	Di2�\�	!=�]��p=o�H##!dd��bB,f1KBI�l�&~�O3�;�'�%�\��}���G�n*�#��
C�������2k�d�b+Yџ�1!�# ��}����_r��t1#s����h]0� ̤�@:+�^������IX`���S��I��`�L,��1(9X��<�o`.yc�w�/v�9Fnv�~J���7�2�B�v�#�"�R̷W�G���j֔�2�R������'o��ox<_���I�v���|f��o
���JM
�q��՚Z���\�I!6��S�j�b�I!7��e֛z�̜YpR����kW$�����T��H�§�w��'��̃R�&����ժM���?Wk2h�lW�&���_;Eg2茓1�U&��82f֘3�\�0f6�Y_�����{�n�[��O�S�% |\��������1jV�2�3!�[dO�7:�St�U���ub�bFwFf*�'j��c%;��?NW�o-�4��ky,4��BE�A����O�Q�<Q��ڢQ�<Q���&��E�"��Cw�z�L���2��\��	~;�Ey��� Zv]U}���\�"Rd�7Wu<���i�'���~�Y� �|6+��n&��[�׼��kk3�=P����2�}ݣ�]�륤4�+$�C�n���������}0q�E;� ��yUx�w6���nv�f��`�XԚ\>�5���S>85��J2@��{���a�q��?MV`�mg�`6I˵ \��8�v�z�Z30 ���B� d�跙�x9�L� �`�fk �N�17 q'@�rX�@�N�'����[��١�*GC0jDϹ
������N��!!2�/3#B0b4��!0���?��9�CD��ވ���1�"��t�!�QQ��U^���M����
C��"0�
k.w"p�ʬ�"��n�>Ek��Ŭ̚ l�X�YA�l��6+ 3�"��
���r��6�)���>����,�]�.���D���1�@ii��S �3;�X�#i�NZ��1�:�s3e�����̝b�&pO�1�8��`��Y<i��op���CNp��锋g��ܚ��yo�M@�pZj'��Tع�N@��Q<�'��B�4�33�P}�3ݓ�����9;�b�i���S�{���k#*�����Y�@��(��ٳ,�kơ�I���ޙ��6���O��0�hO��탱�"�ǡ�F���:0l.�O]�$�s����Z�}Q��E�0������/!�0��o�.ar.�3�}	��!�4,��d��Fn�����}�He�%<�%-��-a�,��z1�2ȥ�XUߴK'��
��a���'��/��x&o}Q�e�Q9_�[M@��/
�&�͔&_TPM0lW*��R)�9o�/ʛ&�k�
_�1M�6ʀ/
�&��ᾨL� a$�/J�&���RC��8���]��8�Ve��i��p70�c86lˎVh5b�&y`�8����@��hf�x��0^M�ef�V#�A�X_y(�!}h�����7��Ƽ�r�A��v��:�h�9D}�� �96}Ħ�JAihn�F�h��C� �-����}��~g��s���� Q9����t<�6f��x��!�-g�:����*��v^�I�$��f���xܚB(4���Q5��`r1��cx-J��/�̼�E3u|�<|-ɿ�	����1����G鑷b[�pb�F�O�f=��;qs.�CP�vr�D�F"BH����_�ВYJBH�<[�����y�f�	!9��ʐ\�v�D��c M�c��4C���3P{]A0���b1�;�� 3�G�h=3nF	D��k�,�a��Z"�t4�(D��zAN�Riq(�b�^w9�d����YyLC컫2C&ai �LK��dގ�1x?m-�Ǡ�d��l���Co$�c}����18>	�L�����l9�D+x�O��) *��{"���	�=u.�0|�vO��k��<�g�o�y��2afz���-�'��D(3��}"|/ߥ��6}RB����79���S T����D4-�S�}"�\����D�����S�D�{
������|�e���|�h��{��C�A����D�^�K�L{�p���t>Ĺ�7`�\f �,$U2(�\X�d����s5!�&���N2���uST"�J��Y.2ȅ[f�Ƞs���A@�b��$[;a�AR�lE� �Y���rb��uvj���HD �l�� �Q603)��(�V�D)�ռ�)�([�TD�=�����z�A�Q�d��H�@�9���RIF��Sy�2���tP��m�����F�̥��4h�",;�
�<���?3�<p�
�L!	Z3��Fv5��F���G�b�{Z��ogs'j���QY�%������8��.�۰�o�%�}D��s���!s\���~�:�}�rks����~�ހ���    �Z��+2��S^���j�QMKml�MM��A��Fe��Q7J������́ �4 u��8M3s�5M���S6���SA�H��4m5�BD[_smȅ��ns�.D��Y��pm�9M��@��0�fs,���>�: Cd_[sTFX٨ѿ8]^i}�/����883���C��V:�J�+a��xd^�+?�"`����0�g("��8��%�"n ���.?l>����'q؂V~~m�b��:��a�?�/�ŉ�UP�9*�do!�p���j�7A�3<��1����v�C�ENb�ɲ�`��o����5�P�^�ɣ�H���B��5�ǐ��<�o9�I�zb��:��e]&Q;F3A�B<��*�	Du\g�@&�q s�.�؍�g'\	�k�|*"�@��{g��I 6�fB'k�(k�39��4-�ơ��F:�6`�Å�,��&�*1R����
)���mn��>v�"�{�E	�n���)Bڌa�A܇R�m�6F�`��Ծ���);����CN���	�����&;@�BA���{�`���eEV�ƟK�����2�l��)��@H'c237s3S<�g��� ��5�F�v�}���L������A��J.����<�������<7�������j��[�Z�
q`k����Sq��o�s��k�o
b��n������59n#k���P�+;�ZQ�&/�vό�����>�q��/X��>�������7���^���?�[dx�!"E�JvČ��$@���h!����ɍ	�|v�xM�F��Ͼ�فAX�a9���ٟ��An�(��Cῲ�7��g��מ��Ǌ��bw�A:g3�g����u�����5��r���k�b]$}v zM�:�V��8#��&����^,���=�-���l��| ��`�X���š֏��OQ�6O�ܙuR��RX
8��RȔ�3��!�N`���v���;����t���u�Ʈ�L���02\|����mŁ����yCǁe��ݾq`����ZYI���u�춖[�w��N�M/��Žۦ�Ж#3����_����2�O���ja0�\�_7�SۖraK��F��]���N`帰rn�O�L&����m��?n���Ƅc�ָ�[.,���Z�],�Ý}�v�f�ǝ��3�bV�ֳ�?��&@[<�K��Tv_<��\���mD'��{A�x(������j/����θ�zXwo�˱����%)��zXqo���r�a��ϯ��ڛbٺ���q�5T����~�^�@�)n�N8����M�����ih����*�'��M��Sm�`�!��)߇�63m���� gƵ����]�}��7Йa �/nE�뽏���;���X�o�]�����|W+����ز��>��`�s��Z\ʣ��zYk��Eo4���`՚��q�	��L���u#��17À? �O2�-���\/� �ӵg�� �9E�� �)���+ zM�V'��	/��}�I���b�?�3�i�Pl3ˏ�N������~����ib��zl�/�*OF������X���ڍa��_WV[��_},��A�x}�鹌�XF^��j�	���*C��+����Lv�xzN��w;g7�	�`4�֭��Xb��'��3e�a����+A��`f��y<�b[��'�[#`�d��2ZL�M���s���U����N̉���gU:�JO��X����14L�c��T�H-������LTT|�&�jC�'j�~�7e��Yu���5ש�d�;��<b,�B�Y���_	L��`�m�$��W�ƈ�	����	���:0���k�d���+�������h_���d��$XO^����,^s]��W���*�|��5�3�e�H*�\�Z~����(�Ѭ�(�~'T��>��bJ�$�9� k|<��ƒ���=���r2,}�Lq0ɼ5Q6����S�Ȟ��i�i��'���h ȸ�)hZ�(��S��	)Zc�����ǩ(�g ��@ ���\�^;��Zc�Ձ�v40Lhaט��ˁrYڷ�������U� RI�	�(j\��Q�S�(��w�f0�	)����R�
2��!�S�y�T��$Ly�M�T�:�n[�]H�pBFw�j�w!����.���oi����k�2�P�K���̅��_��NŮ�.�s8�N��b��<��XG<(��{[=(���Q�<(���XE��V��1-��ݭۅރ��(�ۃ`�iT��Ax�%��A@͵;�Pj+�C2������C�N�_t�j�F�h�O��)�}.,%�_M���;-e�6�vZ�s�4K��윺��|��TF�J{%�F�{屸W�'��/���x�4�����!� ةt
1���g;9gAA1��k�*��Uk���L�(A�o0��%/�7;L����n������W;T�+�	�QT^�&]��NL��r��l0�N�Ԛ�q5�v� �����ֽ�ן�Q�(^Bc�.���os��%P���ҷ�6�K��%P��T횖@��ӭ�,����mױd1P+,
��x3���x(��n��	wb��$���S��]�J�-e�]�k�a��P�-�;#�'�w��� �
��ū�]Cy��Z#f��Pލ�oV@�]�kpX���k�`]ByW�|u.1a���`�^�K(H%ZY�B������Y��'�ku�����6vIv�$��Ga���`y�=��m*80~Ͻ:ov80;~����0L��sO+sȁ9�{�ݴr`Z����i��%�޹�s"��SVj-3[��A���{޶�\Xh7����r�"5�K.���0�ǅ�s�����0w�qa���v[-qW&���ز��.V�`�s�����qʜɡ��U9i��V��f˸TzX*_���뤷�	I�HzX$_���
�a�|m��/�����վ6zX_��ja��0�6O�U�ê��|v.�Z������+�:��&�.+�E�Ǣ��|WE���7vY��,�zW�����6��ta�aj����>���+��}7k�l8P��U���82����Xw_���^�0k_y}����n���Xz_�)���c�}uF;_�;�)�����=�%E�fu��0�2ٷR[e,h(�� K� Jc� �ĀF��y 82ƭI�:��0, �&kG� h3�p�pa@u���$;u-��\�N��r!T�E�6*ke}ƪy5v�D�xYjAKhy����R�x��ƞp�^��
C �4l���"�t�����<]�_� ~1�6.G��1$�pnǐ��Pt��18����E���=�CY(ߎ���h�h O�Cώ'�dL�0�;߱Uy"��b�6\Ā��d��2ƒ1`c,'à#t���|Ā�)zd��2M[v�#c[��$^L��g�$��m�Rt�e�@��]Y��d�ȼ''@:��R#�B�m�J _�Ì����05*�#��Й��f?h�O"Q��e�ҹݖyy,�T$ ����0xN ϯ$�-PO �7z�� �R������X-;	����ľX%�W\K,K\����_�},Ju�q'5j�t\����c�#�k6�Z�"��_�5�*!j�Z����#�_��A+A���D���^���3�^f��J�<n�����?�n��5�W�0s\ଋ@�P��`E���b0!��ZMYq:B�����b�\N�v����ȃ�=�¥�SkC,'!m�S�O��X�D�$�CJ��N3�M8BX�d=�C�K'lώ[��
�n9	];"!�q��:�G��ۿ�U��̹�ɵ�~�f��2M��dT�p��I�0���&mj,<!jnR����ߦ��\!�m��aiWh�_�,���
�"6)};�!�k�6;aM+� ��Zc�X�}J�Uz7_
mxȷ)i���\�<�eF��^��68"$륹0�'"�^�������f|
#���e���z��c9��^�5;�#X꥙�V�F�4�E�P/�V�    �UͿ�q�h<;Y�N�Gsz�v۫
b�^�	㢂 �ff욂h��{ؒ�Ф���֊�@�W-�����W�̾� �y�����0��w�Q2 �����@г=�+�s��ɫ��s��
c�ث��O����!nhr��E��6��5������(�i���O�h.[P�ȥ��fG`�4M٠X�4M�� j�vD��4�u"����g+�:�?7Bg��6V�!5���n�7.B@քd�Ȅ��i�0"��mk,R!�jZ��!�&��r!0j���P�h؎dt���
��4mvdC�Ҵ�v"�è?�r<k��Q�)���23�ŋ���8�nz�m�CH�u�2"b����XD�u�������,�aS��OuM��@��P!%"��Ӑ1�u��;�Sw9�`#^(�3��gی|�(yq��Ɉ�Q�\S�`�FuM�����A�mU��b�;��5�¦��0�D�ؤ���LĊM�O;R"ll�f����)�P�dS��c!�ʦl�u[��"�P�~
Jm�C��h�F�C �h�c�<S��d(!,j����N���?U��-;� �gtk�.
&�N���:�� o�])�.�i8n���SZγu���.�@�1�m&n�1bl&nl$l�����A #�f��n�H�6
��fo��4PSD��=�|�K�M�9˗ǵ`f�)�ԉ W;+\���J�V��K3q۰�b��L܂,cD�L�j'tj���h�M�r�nY竜M5Ʉq1w��Y_S���j��1�yA�p��dd,T#��y��yI�j��EP����:��\��F/�W�Cz��� ��^���BCԀ@��B$�LE��h��#�#�iʖƂ4�dj
#�i�9n�,����G�4}�v�D(ӔWH�H�)�ۡ�LS6ىeZ+&�����]޼��L�6���R>���Ӑ��!G��}Ư8SrхK������� ��8�H�������+�ЎE�ř�M;!�f�V+B��d���������-���emZ�7�X& ׶��2m#B!�d�6��bI�ag6!Dd��l"?����1e�vHB��4MVx���i���4։D�@�O�	��WW��:Ҟ�`��yj2�F<���2�d�Ä�$�0圶PI9L�?;.�0�ɛ�#�t���
�d�Ä���$�&l���4��v��EYR�Q T��8!g(#�������bH��0��ǽ�
!P����..���zBχR�:�B�a���;�n����FM��W ���Y��zT�VŨf��Vu�JEP)[+��'��Xǩ�*T�'v������U Z�����Gw[y�hGm�N1��f�8y'�!����<����o���ޛ�Xя!����1���ض�"�R�Ѯ!14d Q���P��d+݉�D��"�P��;�JSJ̔��ns�@�@���	��:��;�r_�ѱH� 	���0�H W���$�����H	 ���+z]��
�@�uZ��b��"�Y@4Q '~��۞�� �_\�x>�{��hɄ�ɽ��k�88�{��`nj&�5�"M�L�5d^��V�L�5^^�y+X&�,�� �2��Hy�f�0��k��Fӝ���1�9����&�%��@g1�]�� �&ha,�9��	��i0m�9la���_v�r�Y�5g�(5A�&9��	��1�M�T'�hUs�mt=(�� �A5�h�M��1B����?�����0Pp
�ǽ� .�����B�/�m�m�=�z��.y(�ֺ�ڡt;UTVG�ݹG7�z���zP�K�U׃�^Jv�
{�Q#=X�=�����Ri*=�v�����ڰ�����J�=�����*�A�/�ߩ�Z@���M	�{�K�� �+�ц�q�� �`���X�A��qH��+ˠ�|��uG�t>���\ء�^��
,}���Z�é8������'̚�[4�!�4�U��ɉ�!>��hɈ��7�F�cA���`n���*2ЂQ��^��v������'|U��@���[�F3v���5���H=��w����)YW�����w�6���u	#\��u��8��A����r�ou0�vH���t���A�+%����v턟� ��j�;���d�*O�΋��muPŶ���u(����u(��*ס�B���"�+�~��G��H����C�W	wڡ$�J	ۡd;�R���h�;�{gܑ�ں'��t��������7�zǳ2L���;�ܵ0 N���Ɏ
p��1;N�ix|sr��x<Q;���x|C��[�r׳�>O�]|�6��}�RjF���TǢ�/e`V����9i!\x��o���kp½��
�e{))��Í�R����:�j��Y���[_\R���DŹ��A���{����k����cjƿp�[It�?�E����H�cH����G��zJ$��H����&����K��X���5�J�-jA=/���Rg1��.eu�����t������սp>Z�@�/�ޮ�yLv}v�ϗ�Q������]�h�e�;�\�@��Ȋ�\H�r�\�����oz$��Wj�.��z�]\y4' �s=��`��|���x]w� ��ͅ]�������P^�5;�� ��q�	�Z�.y<�_�pF�B.�u!ձ��-ƌ�`��9���q�(H0�;Zx@�QMء�\�H����BRv%������P-�X�B�������U�m����Ս*�C�����>t�o�Ô�_�	�V���!��Ї�i�;zחj�h>�o]�f�Ь��:UI�Wg�}:�§�󽔫 �ԿZ[�(� F�
�Y�h�U� �5��a:@ǆ�uKт���m���v��r�HWz@��+_ �D�S����˞���|QD�C�][.}�*$��'�+�X��ۏY^��N��{!���˻gˋ����(z���M�$ۊ�ԕ�;1zE�tJ&I��W��k��f?H��A+��(o��~.�|��0�gK�9 � �5z �J^\�tEw�������Џ�m6"�F?Z�Ӣyj]L[^�e1=�k�W��?��q��1�CH�]gbŐV�-31��A��Zeb�2C9�/21��t�kL�5f�j������
C���\`41í�)w�(��W��p	�w}��%ж�tƪZU���0=K�g�Ƕ�d	�l�vK�a���+�z�&[�V��]ٮX�b�.X��!	f����9�f[?�>�����&�|�(ݦ�'�-b���?�./�t�l=��7evܤ�/��7�.O���o*[�E:d�b�	G�Z�?-<p���0gG:���#�̑�&�ӟA0ʻ�d&~�}{�J��@��U�D��������\;ґ�v�;�8�?��8�.4�t�����9қ�v8�.��tR�n;�_��8��$���5%�gO����l���s��Nh�Jp�L�}�w��P�VZ�� �b��[�ێ�,�t�{6_
��È���ש@:�2��]w�m&��.����q`/�qƯmv8�?��tY/��?T_�A��?԰�u��8m;ˁ�����yś�����s`�����эuݸ� �5���a��0�C�ݾu`���:�i&k����mZ.X��U��=]_���x�D_>��z���rٶ-]ؖ�̲�Tt7/X~�I�t/�r.�[�S�.sa��2���,f����n5���n�'����P�e~�v�����iFh0�2�л�
�#��Z�Z�p*�/(��)�<��_B��φ<\�Ŧ�Z,�[d�m<x0n�[����n�Q�ǚ�▥��+���
-��r����7�B�?��b�g����s*FǍ�J���`o�(��M��Mw�nex�2n�������QV�����F��4+4����*�'�M��՛3$���<��
�߉[�ݭƇ]q���ŭ�k�,|X���X�iq�=v�/nZsV���V9>o�0n�v���]p�������j��]�\�}1���yjr�=��&7>��V�F�`���eQ����☜z�Z`-\�)�J`    ��F�cW� ��5���Xa�"��1X\M�{�lV��o_��J��ZQ�(�hǾ��k��	�zjÁ8�/��2mQ>�[��|��/���r�ڏ階��I����^f����O���� �o�G#��@���u�bI��n[KB�%7Չ�"b�)6ϯ^��� ��bٻ)֫�2�zyS���M1ݹBk�.�&��Y�u7���[)AT!�L����-(J����4���k3�^�#��/вq���ƾ cW�+�0;l=�����V�����}튰v�;�)Z�5֙��4k_="�/�J皠�#��N�z���ݬ���k4����}�֌x����X����Wbp.���k�D�c`��o���{U옋(�k1Q�l��&�����z��;�4���eL,��rj�@{��� }���	 ���^,7����%��r������v�Z�,h7���ŭ�XRW-�.�'��������q��@�<ʇ�97�:k����E��ț�@�&kf��"�dZl\䅚n^�+���N���
�.r3Mܦ�]dW���*���&�mE=�&k����;����S�ꃘ��\B����A�p.�eD�����XxAj�˚�%H�r�\���J.�ݎH	2�;$ ��eMT��4��+;�=\F�S���K����/���h$ NǨ��
0��XMFX�C�R,Ě_�?ͮT ���]��=�|�L�NĮH�_N�S�4�{u�������|
1�r��r��,ԗKl�\lH������CX�h+%{�מQy�{�v�*9�k���%q�W��:!2��c`G1Ė^�	;�!:�zlT�����5fGODh^��N��b��[�	!���4����b-B%��Pq�x�V�����k�>}xmF�a0��.3-$F4�K�����2��Q�y�f��f��]�I;B#��ltⴖȠ��q�R2Q#��[���~h��d��8�q4����q���#"�Ʊ1��5r�Z؆X��}�#���hȎK���T�:�GЎ)���H'b��g�jws�Ǎ��;Vˏ����"j�6n |i4Y#t �h4��� �ќ������ g��a�3�eG��n�Ĩ��i����n�R��D�ؑ�5��(ڑ�Ŕ9��P��?ǬXA�S�n��4�А	�����m�]�7�bfI����9c�ܫ�6�yE��o��'�w ��#�hr�o�k.�EC�6+�8�5w˻Z��!"";�!d-�D ǕzmGM�m\�u;�"L�
�WȊ��+�b�Za\��N�՝�$�?�p?%�6�"�b2�FCa�53��C��d�9JL7�-pCdĤ=�CB!&n�dH��U;� a��:�D7�����UvC�0�L8a0��-0��X����86����G�U�	?�/v�������㚪L���#hxl�k�1<�����w�� {���$:�쎥�>?n���SZγu�,�f���Qm��I�0��?�I��6|�'�j�x�v��X���z�Z�Ƀ��ڵ"���I[py𿞔��<�`O�f'�itptc;Q+�2|P���*sAb���%�U�*�cS<��E܂s�׾b3m��_�u�4"!�����Xh���u����'�����~��;��?�%��+�د�J���w�n�v �_�u��Dd���.]4�?g�򸦃�Mq(J+��r*m<�W�(�F����(�c����b����<�����{b�*x�OЎ� 0��
h0��G0��N�����+�ǔ��J�4yE�!+\ `<�6l���F����$M��x�O��08���4�؂��O�3;�����0��IZ�R��ٛ��ҧ�$��/��2�(��/�\��H߈
sOȑ���?I[���Eԟ��M�]���[�K�Zp������?Ac��2���>����
n���U�T��5;P�}��*���P�C\�'h�hH ���N�.�%�u����+�G��y�}�tëb^̏{��ȱ�ŀ�ɘ�3��Z�\�X�)������F�D�/&$obif��XI��w���9����m����0����W2���!�� ��)�$�1+K҂�a,Q�S�g
������B>�Zpُ�Hee�e�8/������_�THכ�2}���0-�/�|�?�����Eʏ�)��{X�4�HB�����OBNi*s1��݇� �#��bmB��u��\�:����g��v4�����Y��\u��M���Nlm�PP�y�����R�����},����Wj�+���PG}e����Z��H�F���\���EU��l�/E�[Y[�K�/�d��G����9f�!;�k�%f;WVrQ���ܥǺ�,�D�Xs!��O�e!��)n||���h�/+~��?z|M}�����S�(8Z�bd�v��q�$����*r�{�S�U�tb�Q�u� ׃Bb⤚�;��z�z��ϥ��=�����zH˼=��ؙ�|\?
��RD�+>}�ύ1-�� 敂8�������F�{���w�P�]xL7�)U�P;�ɗf��L�=�"ʘ���#�>����~��7���:�z�������Y2��E�w0�����qj�g���?�AY��N,T^J���{���w��bW*��ѫ	��bq`.�Ԥ��l�F E��Ϥzd>�B%=z���
Wr̼����!/3"�5����O����Bb\a4�k\�1�1,��.h��_R}Q�Ar�W�Q�-��X)wz�zO����'#��TS�C+>�T���ѯb@��\>l4#�[����H�t�k�?�ە�C�i�jm��������'�$>de&�����X����"OL3iӬ��j@��j��)�JUv
���-�<"c k�*�eD͚Ȥk��O��f�����A,=�fb��ҫ�6
(�Wv̓Hz�uBȭ�:/S��'�p������I>��o�b
�G~��S�A�D��g6e��kJ��USͅC~���o*�dɃ\��gwLL�ä7[BC-�usG����7���s�F���+�^���܅Ƕ�H��2_HAF��6X:H�l�>
K�����M��O U��H�����؇L����Ҥ���&�|ª&��A~�蓙*�PŃ�-�>D�W��R6@%7>�opJ���ƍ��_+���9�C���C�QVa���T��S)XV�'�%b�D��V Z�0�u��Ǉ�����Rڹ��,�9���x���6ߞ�r/����T'�����)e�2	ʜW���S��^E�zd���ӂ,V#jE�4;��jx(l�u�I¨�d ���b�b��눤#O�l��F� ��a@b�/.�|+l�g^Ah?Œ,�d'�ZA��zU�'`���wYb���wE~ 	�-Xf�M��"Xf6�7$��ؑ�~$����Uu:���"���f����b�Ճ����^p����˛l��������̷{1��&
1��JX���1Qb��)�L��\�q+�!"lZ�F
���C�����|"Z�	1��;Zڻ>(+(�4��t��t-d@���F�f��F�P� tX!�ư�+�W5��\
�����w
D�|�D���U�F������5�����z�n���,³�;�f/�/����s!���bt�j:"�j�|މ����?�Ud��r�lF��h�M�ى���� @WN{/Mot#�j_���ũW�bUB��|d���s��A��i�48� 9J�.;j��1���t* tj���c"O���2O�ŘոҔ��SVZ��S�lK��s�P�x$Cb�a5�_OA�P�<�/{Z�	�1a�_el�����B�yBqX������k�bSR�����5��l�E�(թt�s�q�M�N+a�fǲ� 6�H�S>CqLA2��FQme��b�K^�x�+���VۂI&ֻ��:!��HW�-�O��%����Q�4��Qf4�b���]<ӛ�=v�V���	t=1�Gv1�G�0I[��i�����ٻzVz���q*�T2:X��&��j@g|i5�T�KӺ�y�B�_\�E��-��ě�~���2��    �X��,WNLCtv��`TQ�߶
���⩰����8���vY��O��ޅ8Tl��#�_�=��& #����9��J��������j��g�̮�o"���N�}��t���IW���Тг��WtTqa�D]pG��i��3ׅͯ�T¼���B�+M4���g#IC���ʥbݹ��滍U�\;)Y�e�\��s�_
�-��G��ۓH�<��!�a�D�?Ra&�d�'��z��Ec������V<���5�,�æ���LX��[���؏*	=�%�f��f�t�\72>P���gΰ�Gۧ�k�L���}{#�Ѭ��Ͻ{��mJk��\e��Ɠj���r-v���'�Y�a���1S� '��֞坏̽�\s���g���:
p(|2

q����.���X"�ȅV�5��9�����]��1u�L�Y=�o��R@V���^��cA�bS��K5��B��ОNu���)��㊭��|���.�cJ��1��w�	Q筼,؋�"||��*6�-3n��'�N��G=���jD_��'��$eų����Vo�p��{j��Ͼ�r���pP���tsZ�M�Z)��Z=���&�`��m�*iG!]����_Q�q�@�B�W�Y�E���6?��1^#֊V�JLW(��ê�
>NC���Jr�[�=���(���(�y8��G8�F�-�Mi�Ԣ�$�_�����iN*�j�D�eG�Y0D&EG�GB�\�@g{Qg���R��K>W%�q�+�a����%��?U�b�o�&����Z:�д��NS��0�Ju��[p���H��+N�yH|8��螏O�>�j�B��8=����ƣ`�ͤ�q�%�Ft�����} ~*x����f+l_��_ށv�ř�Wa���a�mJ:<c�F@���H��t��wBG)*F�
��>�?��ؖ�"�C^�Vz��8W��.t��A�˖�h��hJ��O�ֲT�P�>�h%�j�F:��铳 ���;�!�Y�c����&�4 ӸrUU��hF��\�?w���hx�ՠ-k\.�]ΚƤ�����i�vا�q�>���D�V-j1R�V3�2)��ƨj���s�� �'�qRO���/kt���(?��v\ڳ��(�I���O��u��{Q��N�R���Ol���j���=����Z� �|��L�v^
5''kP��]��(E�Rl2$����Z�|ľbgЍ��"����& %�-2
����l�􉯗t����K�~�)\9��w.�TLe�ELg^�v,�Y�8o���@������?8'U���#�?-Ӛ{���r��ԡVV�������g��Y�U��S�U�x���m���66�R$�M���aSwIO[�-*ܐu|��%�ڲOK
��V����<��D];i�n�T�R��!ڷ1��G��1A���\�q�Ś��.2D���%�i]<����w�?I�rv�*WuM��!F2���PX��|w����<�,A�c�S*p�uZt��Ȇ8�)���<��[���2����P��f�U4�ZԂ.��t��>��1���󿸬{R�8x'lzN��|��w��<C�f��rF�_�O��b��W\�?��}p6'���R-����n�[���x�Ç3�*�M�H�s�s��AwV;���>��P:k�ȴ��(g�m�ǆ�)ծIzf���0�&69GI��(����8Գ��~PY%��ՏD,���ȵ���|�JsF:;��@8����,CY�p:Ng�p:Ng�p:N�*��ޱνeޘJr�Jw}��rgo��l'@��9�� �O�N���u�N���u�N��pOʞ�\���\��Z'�����c�ǅ8�#�Ʌ8uR(Nz��ٻ��Gl��lz/bYs� I��߶���G6�R�s\��o���F�(��b���H�_��J���9n�A���k#'�A��;0}M�7����i����Q#�!�̈́LI_�5*�B;��[�i�)
�YX}���R��iE�>ؕx�p9c�	ۂv�G�ˏt`Ɩ��-��\ r�d
��37�8�U�&�9v��i���&�п5FJ���?w��M�96�f�V���hS����Ĕ�&c%�NѼD�j�7�ݰai˻LU�Dn��'����	]t�3�*��s	�t��O�؎n�рaDӘ6v��5��8���fNkE�+m���m߂� s��].+�#�b���lM����`�PMcY&�<��@�`��t�Q��uZ��:J��G�* ʂ�7���Ny���z��g����N�}�R���ʅ�)�-涄4�W"����MQ�c�n}/�b���I,���I0%�[���s$��_�
�suٳ�{z�qI�`�-C3Z�j�NؗY��-񼄧HȞ�y�Oz�O̚��R�ￒQr���ٝ��]���S=F:��/�Cz��������uJ�)ΌN���6���;�ο�8n����J04���5��x��}V;��7;}�[������9]��s��ݻku�kr�I�w1_V�J�#'����/<��\�Q(l۬~4xzp|rniYu��n���j�@M'�<��:����%�ԁ�N��Xu��Ss6��:P���	4TO��ͳ��꾹쥳.t��mM��.��&8���ⅦzMw����u���=߱�=��m���8W��Q�v,d|�V��ˣ=�pOi�?�uQ�I^Q�&�=������n��%ٗ)��� �� 1/��dH�in��Q��������(A��y ���8�-^Vħ2U< ���8���ݝQ�ʛI�i�S2.:ś�hF����@�k76�����`y��%^�7c��>� �� �dxMa� Ս��%�|{���*-L�������T�Z]����ZN�����ea��a�=�Þ2�Km�<��l9@�C���9�և����|������Xd�/��$X+n@�&@�H�&�ݛ*ģZ��{:3����fw�M&�_Ұ��W�
�T��E�(��L0%Z[5��P6hB"�ѕ�0�D �W�t�D ��ub,�D ���8	�D �W��	�Cs��
��eh�����0�f���W�s�^���kua�V���kq8�Nǋ�jŕ5:Q�'ݼ��I���:�@�'�9��&���l��&�����	4s:�&����3<^�b�)�ŗ���H!o�9��Ͽ��)=��y���K����w��`6K�dIn�1\�^����;�G�-�=J�c8
�X�FBC���x
���V���3�h=��_5���'��u-|5��L��J}�oėmy2���-�?I����]�(�v|q�'AxCގLM�0Z��*KWGcg�7])�c�I^��ɐ����8��o�U�1�yU.'�~x0��\L��^�^��m�F�hC�+AT�A �ì)��N�:��!��BU!��l5�w�4V�Y[�4��z�/���=����@r�N%��懂������V��)�����j,���ѡ,0�bS�;A�r'r��?��/�}'�E���n����m+��z���4u�jA��'bM��ABea��HN`�*JJ����ٯ��C!B*��sѨGla���7�����<���T�	���/?փq,�av�/D��>�ݟ�R�Ɩ��\���:�@-�����[�"�b+tO��5�X�1�Ħ����fg���&'ċ9��n[H)0Q�{��?Xf��&����Y"�P����9�Tc��4�?��S���i��6���9�)I㜞[�-WL�5~�[䴪f#T�B+9Q0R���|�Q�6��VO�$,�7]e��;�'J�&�aeg�͗�_uN�-���C�q��j�-�����OZfN'�'.�v��g�jǍڭ��zb$~�J��|��S�K
��.�ߤ��_��xSH��Y�y	l��&C'����,*cJ2��Bn���c{��� �Y�)^��\�u�:�gyZ�l��X^��2T\ 4��t�N��>� ɉަJ�Z��O	d(i����q�in7='3+)6�!K�UL����s.�9��(���K�4���S����c    }DgQQz�s�~*�J����7Oν���;��{��KdQU��(�߿	�%�������Y��(߿I�%������i��ʊN9-�Qg��߸���c�t���=�Q���7*&������j�(c�\��xRM�'��'�X&��hB�>:Ȅ�O�g��uFq'��p�V�5�
��s��lժn�d8P**�SAEOq0�&/�ǭ��Q�s��BHf
!���Ѕ��bû�/+o�vZ����)i<�&E]-Q���iG֨�+T6�Tl�2��&�ha�{�)h@yT��_���^��ݫ�9y�C0�L9�7.ٷ|Ϩ) '�$�hԀ]6I֙��h�U �乀�*@p_P|iEW��Ԓ�V.�Q��z!Ҭ�?KzYV����pJ�G&൛��B�����i	"��CV���T��ݞ�m:���;Ix��������6Ab�ٞtHx�)�����5�6t�y_�Jr����s��\?���=�WOe*�iL���9�ъь~��Z�Ϸ�"z�V�:�iPT�©Y�ȁ9�2!v|���!IS��z��8�U&����M��GiZ���o�� ;�]��������미R�J�p�a�	���mئ�F�BX�����D4\;l5Y�=��9~ɨ���:}(tz}*wM*&����:I��*{�Ƣ�z��,�������}-��рX�u��r�� ���me�����ٛl#��DΟ��W��k�yn��I��愨��S6�+�9��N=_D�h��D�JX�R��MU��xZ�����h�y+Ւ�<�;r��R�aٙ�D�D$_�;��҆&��B�B��!���.y^!\�쇇CeWhWR����qU�!c�����Eњ�B�I���d�?/>zF<��^�����Y����N��
�	��Rj���Q4G/X)Hb����xݧ��&�JN�J���T����C�Y��1��#����64�rs���M�������Ÿ<0�M^�t\;�S[��􌴳y0��!�����)�ª|o�]����9�V%(L"�CB֥u��'�5�=¾Y���ST���gٸ���b� C��_*�<v\ϱ5���Gf�c6���,-b�ꝭ*�5�d�޺z�]��Q /���L#��0��Z��Kz�#���C��N��N,��)�aq��	��Y�C���o+E9H�5͢�#������~��$��b��`���{����MRѠ^R�ۘ%����v]�5٤�
ư�QzWj���:I[���4PyT�[��k�q2�&:�y:��k"�'$�UW4T�:ҏ2/.W�UVר����yz�L8&Z�D�(�'d%6N����5��c����q����@,ѻbw\+/���>Z���v���Φ��y_�́U�X�rf����+�E���F���e�+׋�ד{��qҝ?٢���<��e�m�)�g@7���Ȁ�:%W��a�~���x1��z3�4���zD�����l��K8D�@J�����������ӑeg
�Zx��tQ���暮FȈ�(4F���|��L6�|ԓ-D%�������-��c�����Ǘ�?#�I_��&��xE�I�`A9Z�܋ԫZc���,��ݴ*���S�T�K����;�D�w��������w)�M��!���!����#%UbR�e���Bl���R*٧�I҈/�Q����tf(W-���� �zƼ��\���GX�8��,�����V�o���cFO.��[�O�m�u~��*�ġL����!#3a����N'SpP�s�=r�~�>�&d;�qpHӋ�a���e��o�7,r�a�^�3��z�C���^��>G���;�=���+mb�W犔﹠-5Y�?ݾ�w͹�x@{''Hi��;8R:O����%�`,z�L���;�Tv�}�|�hɟ3�KW��}�wv�4��ѹ��r��}��0hȬv�U���°,ֲ|У�ǌ�_8�}��
�W+z�s��&8�G�9|7�2��9d����x�p���Ŗ��#�-��'�D4؎�%L6y ��Ȉz[�u�!g�D�=|Z��ُ��t�Z�VBK%!�Ͳ�=8,߹̸�c,g�Q�
�.:��OVJ^�>m4zl��.ĽI�R4~�E]���8:�$z�.���:5R��/o�����Y��#&����s��;�\)�7�&qԣ����_�w���*���#ݢk�դ!���XJx�I~U�v��nȫ����������ۿ���������$0`�Hg�9W���v�%}�˱����&z)������i])= � 
K��^�� Ġ�ڣI��n�f	#�����?a�mN��5R��>��!)��	8��ΐڂ��1]#4���f|?R (���C��%އT��&5E�/�������7���>�t���l��x T	I !��:���q� �a�>��L>�;Ad3`��%t��m?�Oe��$�x��z2��t�?�2�X� HN����0fr�#pCts;�N֙K��﵈j��,���yZ�}Ճص]^sm�0�6�5��t��W������~��Y����BAL��Z7����7r)�ý���o�E���O'm�c�h�s�t�֗nE"�M���o	��F�ț
 #(AB�Y��H%�	�)�<���F��Ύ"#���79��Jo@7� �������E=�����4������<�g��#7�NЈrYP���j<5v>W���ō1Ug**FL�k
I{�Uc�Ɓ�e�y���0��컽Iu��&��&=�+\�E1ٸ�64�+�X;�ߢ���\�^ހ�u,��Ϸ[:G�ڎEϓA��mRt�<s�����()��Zj}'��%�I4O����B�I��>�_1d�����������I��(��j2�<y�#�˼�ZjUXS#v����=ytJ�~� �n���.��F�?��N�<=���}�-���<���~9>2�C*_s��|�����6D�����)ި�y�ҁw��:�?e��v�e��ɷ��#!~�r����{��iJ�3+y��H�!WB�`����s;9�K�k�:���Nʚ���ho�>�K�ݥ*8�7:�*�m(�aZ�����bbP\=������ߎ|��g*��vgV���5&�Jz��ǜ���sZ�QBϖW��!o��엛����[��YS�
T�������M��J�C�T#���I 2u[�K�U�/S((%߳��UgЏ�8V�+O�n�Y�0�)���A�����Ñ�:.p.1�dү�l�2/���牵XҒ��6=ա7����A���CW�cK�}\ra�V#�5=$A���	Gd���I��ن�D��_�D
ux��s�)��@t�Ԕ��f{�T%��m��J��~8��~��٢J�V����!­Z� �!4E*f��Yq���7�G��|�H� �։�5�$s釒n��#�h�\'�;A�"��]ަ�(#� ��l�d�?K�,T�]>	a��v�%W�zkA�~���ڽp����q��\�C�H4�)����'HD� @b��b ��S?�e�L������~����3�6x��4�o�wY�5U{�6�(���g�<P,;��&������g%t��M��g��e��!�������u�� �oAh� sM<J�Ҝz�$�\,���,u�.1��A��ǲ�=e�\�����h�%d�
d5�}#CS�ٝ,'��8a���� p������Z-?�S�t��֟�x��4�_i��	�~�:��Y1hU<�x߃�T��f;�Y��zܳ��i!Mfok6O&���ﱚ&0sٜ���:S�@��f����L�}��.��\�v?;������O|E3�����G�<�.��P�/�"�m[u�cā/�˒��<-��H�l���j8�}�
H��H����2��4�cE�A��9Q� �Mt3��2}������A�c�� �H�$�b���v�8ȗ�iIKf ��pe~8r}
�Zu4+�*_��CA�Qp�>.7x<��4xhԻH�L�V�P�\5+��g:����&3u~0x��@�u]��n�	'sBu0ݽkqV!
���6_A��B.�����܁�΂    c������*v���9p�^z��t%tN�K��u�E1���������x�Λ�U�ФZ|F�j}F6��A���7Z,�A�G�~
�v�=G��|�V�5���J��9E����2J��]a�9��NY�SL'0�E� �����U-]Wʌt���D�9}���!��Apz�ɵc-U�ք������5���V%���-��Qg&u!-V*�6����VD��Ck����r��"���D��F;͑�ត������o2d�L�&^�@0{[�C=��Y~r{�2}�ʘq[�������e���N��yf����~�����Jg̝k�k&�]�w�������F�0仭(�Nr9G����>��i�ה	=(��>�]J�Z����i��T�b~1~j�����#懊�%#k�-���R��L��m:-X[yw�X����%s�uJV݋W�%�Cz�����T:?�b��V`�B1�1a���4��ʜj�A�����j�ѥ��� �yb�@��;��#SCq����}������06�*��Э��� T�8�g�?n�HG���RU���U��=����	S�I\�IU��]#���͎Nr,��'(I��mDq*��V�A�o�_��Oef�,�2.ʨ��" � P퉟&�p��ܹ�Z)�E�EE��'���\�Ay�@G�U&��^s�&��)�C)z�eN�U�`���>��X�>p>�:�:ڢDRۧ#%��r!��R��JM�%p����rf���ϛ�:���5w�s|�֩Ti��m�Ϥ���E��A- �	��T��D���W�w���T�1���:n���Y�Kx(�GOl�����r�53�=qb,�;��c��Z�ʚD	m�x�l���$���ݠ4H�̾c�H~7'���|ʶj���T��;nM�j{Ӆہgw�-�c�V��it"Fb�?(Z6v�w�Z~l7Í���f��Qp,�j*C��0�Q��7�-0|��UUC����I �U[�]���3���T��*pfK4M�o��ʫAO��b�(���g�:�\ @T�j�@��/�H%�{�SO� G3=I�|%kǻ�"Xye��d8��\+�T�Wf��{s�� �%�v�
���~|���d��"�(����}�K:��-t�Q��tvq�a.�����Y3>T�\5��Z��V;�Hz�c�VxF?�s��~1U�8��?���:���I䉇��v��R��l��R�X:2_��'����;��r杁LTM�g�t��\��)����RrE�O���B�0�5��_+7���v�*4�hN�ȕ��� _�����$<��VZ��˨MSsz�y	�PQm�Nc*�f�ߔH@��h`�CZ�uY�����p��q���uR.
��dj������
��6:蕳�
[�l��Wf��&*�������z}�T��"-�Ū���&'�G��ۡ\�k�����S�\	��\4{���z�K�0������4T�9�᳒���]|W�g�;r�"�swe��a��:��0��M@좸�ܾ�0�+'4�
�#HC"ڄ�s�Ց��at� 1ݤb
3�x��3U���>�%F;�;vF9H��O�`�x�Al��?SqTbך��^�k�������F67b�^Gq
uj.�)J��kɄo,Z����,�/1��4�b�F<{+x�T�)-|M�� ^T�z~�1�nr21���5R��4��n5|{�C}%�?���_�ki�`�ٟҵN�+>��dA��,f?����r{Ziz&������|��|���fe�+�L�
����=+Ǳ�<�A9�uJм*�<���f)�s�A�����������~�>G��3'����y�@#�2�6o���_�&��N#�4��-Z�\�M�������z�}��P	Kxor�U}�JS5��j�W)R���2_�k/o��Z���]���=IO{��w<�CQ�o���|�|k�
��h��N.<��ZtB
��'y����,�!��z;�ׂ#J���k��%��o�숕�O��ݬ\f�;'��S��B���&'C�Q�T��:��̞�Ӑ��pa�:��g:�e��Z��*p�1S8�*?�{�bN;�vA����Ȕj����Ga��s�e��@���%�-ʜ�6�dC�L��I]��)�~�K��Tf}���%��x�rPeO�M�R���d����QG�d0e�Usک��Xؿ1�&U�՞�	��4ܟȩI�p�C�e����� Ǩ�_<P3�R��T"�&��f��ʩ�4Ihys�m*��B#ܖ�~m+�<���_�	�I�q� �߇2���Wl��,mIjk%��P�/t��^�i���d�N�3u����Xq��\���Pw�o��:R��B����`�ok���&k:�^��u�Q��_N����N�W%�z[C�2��j��h�#��I�Ӿ��A-�^KOю�_��m��V;��� �����Z��+E}�)'����h=i,���u[�45��-�
ԩ��ͯ�'��$*�g-��ӧ��g�
"�F�T�Dx���#��մ�KV����ǃo*ve�mJ	Q�>��Q�lb�Wtԅ`F��))I*m"��Tlv���2���V��e.��!bs�V}c����^�J�=�K���Dm�HI�28��1L���V/c*]�\
����3��[����
�����=h�7�0��ԓ�[E�.��S���s�}e;��z+MB�*�6����%�!�V��Ї��׃�[H�̪k��{�:R�k�]�������Y~�K�T�K�����)_ʇ�B
ԯ�zFV��<��E���V��ܗ�Pt�*���z oD̓�ř� �MA�F=�W�B���;?Z�GZ�9?X��k&��8�ջ�t� �ԗ!�����z�\c��CVb�e�\ͳV3w�l=�C�����,�d�J�d+����i�J���f�P���;�nk�$��I"���qvҒ>`�b�����|��C=:ɛ_�?&��]C�{`�O-�	ޔsIÝ�}�ב�c���.���9C�9�sq�iZ�UmE����+� �t����ryȴ)���t/,�T�an�v�uM�T�)9e����`��nV������O'+����Mg�}X�	:�Z�g����S��ī%r ��ރ�-ír@$���v�~�.�v��L���?�ʛ������?St��0����f�a�G��ɷ�L���,e2�G%&ȳ�L�Ε�^�dW���������e\=�.g���x�ȡ��j�!$u�Z8r�N�r4=K#
q���eH�'�=s�JL��1r!�����ܩC��!�!T�j��.��7q�����OB�9F�G.���=��0��������d��T��U\�sWD.��}�n%h�Z�3�.�z���>[t�H&'s��?!�Gϳ�����g����8G�֛��?p�<̬��Q#�L��V=�[�m�fܫ���vő=�W�`���U����@ '~9�y�	��^�S���na�'��� +٦�k�[���������)���� �Wa�ҍ,;�������%{7'�P)� \}NZs[��69��!1!�� ��j��x����ʶ̌Ѿ>�ҟ}_�9m���e�|��Ij�zf �Pu�q2n#�j��V�~ڭl9c=t��X?��G���K?+t�%�Xs��f��fk��"��(��B�hy��NNf����e�i}�{z����-3��ɺ�t�0�&���J.������u�x'
 [���h (I)Zɯԭ+�c>d���r�9�	F�@��ޡ��H�#o�����E��Z��Ն�<-��_�9��B I�>0о�z��ѫ���T)������q%#��(#T�3R�7RSI,n3��mj^ҞlX��SKNf��D6���EM���p�N���u�e��X,�����
.*4�{�2 ��
�AL������o�O�!J!���3RE-ջ����O��D!D�r#��bˇi�UcD�6���)�J'ۜ��Cz���������zAd���]���Z�!$�>8v'���P�p���X�����+㓶1�i�T�=@`=7N7���*@�Ce���1�� �  �zC�i�p�������| ���T�{}Y� �}.7�~S.��/⩀M9P���:;.�31�M��*16���kFA�Z���F�1�������ˍƣg�rBW�1�#y��k�u�4̏���͉����Ϊ�U�\�L�'G�u8WE)�D�\<֪ߝ�C�T��;���t�rl�lx��6�z�V�%Q�%�y������^O�9�0���� �+7��Ōv4���u������=��I:�t�4���ggᚋ���N��ř��%]beu7�� v!	]æ��G��K�=�c���鶴_[؋A�pN�B�g�MC��m^����!v�]l�7�)�Ƨ��<�l&�!]J~�2�bם��!{'�η2p0v��5Rw����=��P��&�=BN�yO�:b-U^oծ�Q}hY%Y��T�=虅���^�=蝕žo��3�g����g�AG���N�dA�.�٭V���Z	���?�x4S�|N����G(Q��Fd��5�4P�*�:T�3�9���YV�hx���(�Ì��lvPj�#��)9����x7� CK�j�!g�h7D͏�ӎ*��<���d��e)��k���-J���Y�k�`��oP��ކ�O�Ҁ6�6% (��.%X�65r�MJ �7S��Qh���u���βA�{�Q9�������ڙMJ�MJߑ3�Q���F-�(�`�PsœA�:��N�3�V؉L�`�P{��׼z�1�z�S�t��-�$����pa���}Gsp�9���v�l�ͮ	D6!�ޒ�-��\��)A^���D�L},�5=����b�N"���\{�� �f$i�|���/�L�̋]V�uS��4a�W�|qZ�J�O�`:	5�&!{�g�e}�T���M�R	+um:-���.��W��{m�",V9�{t��c�2��*���O�UG��\�heh�9�;�O�W`�*�末&�2�h`~�I4/�{��s�%�s�M7��L����F&����ߓ���.�.�j�ZV��6-T�j:�Y{_��M�_��}%J�3�E��q"k�l���-%����6�T��J�*	a�*��Vŗ��dn�b�����q^���\�&G>>�J����(��r�	D����u�d�ݢV�;S��@�C��z�����6��sڐL�?CmǫY�9�{�@��UR�Y��Ͱ-���+za([�~�����Ռ�@� �5w:o�~~�����C[�1�qfiNR�'��Dɬ�i��l����	��:i������	��:��;�{?��k+�^7�AJ��'�R;�%���%�I��ύ�in���0�\�u)dF�7fC�l�7i����&���\�jܣq����4ǈ��d}\�\Yu� �4M��Ip��At+3�������	�s�R�&���&�声/��vZs%�ZI��?�z��{�/��^�zz/�MWGe�/{i!J�8�8�Ɏ�>��>�j��4����ll�ɭWm��'O�4�:zȎ��k���b*q��Q'm>�બ������N1e��b�eJO�|UQK��r����<��ᑳ��a���f^VYSܡu�;�L?(c%�&+Mpk�A��&���4�ERG�J�ڰCj���+b_10-�z���7\�2�4�Hp�#�����D�k��u�N��7�7&ܠ$p��~X�����n��HPQ��*���yl�k��������ɰ�߂Ht�}Q��XTQ�R�'���7�����o�-�ie~d��P�;!#��i�m��ß8��@1���z����8����:O�,5Ј+��a�&�	���N��<�>����D���2~�N��@����diQ1?��*�U\5�^��u��*�
����ƪ�	�NZ$������3e���^'�iբ�U���l[�K���5�yǖ�m �b2�8�(ɱ�����t���m�f��NF]��+�˓�Q#a -��O�����X�*~,��)��B�<�%!o��꩎����A�`l�W��'W��-���>e�'_��wvC_(ځ�x���/���׫o�r�?`�p�����&�� ׍�M�Jfofٮx�!4#�'׸B�v#S���X�U^�C�v���;	��[%վ����Z�]�W��?L�5�����L��<3���������zX���<����P����k&��$�0G
I���ݿ`Rq�j�'�&��5���7x��KbZ�ٷ��g<n!M!><ڦd��lް�p�,�-E;+~�8�irw�S�� ���y,J�ۓ��>k���z�ؓ��5�p�5M�HQ�z��qhy�FʷY+�N"O��[/]��*����z<�8s<-*xeOC�^�1l�����j��I�pK}<�ʹ�ծW>��=��&~�����ޮ�b�	��%���ۂb}e����A$]�����_>�������e�����#0�/����p��~;�ߎ��4]e�v�����o���7���to�U~�@���r7_����p&~�}��E����r������K7I_|�H	���g>�;�Ng��o��<B����q��6�����̹�f������m?���O���a���Ͽ�o�<�qj[�o�D��I�_]rPto&~������'֫�Ӳ��/��]n�~&~���n�b�x �H��&�;1�����8��Gaˎ��o��u.쟌ʊ�
%\��8k����	�uҋ*��:	��u�2���g$�SG�?n����љ��f��V����hZ�%����+�X��[����G>�q"��3{'@W�t�KɨF	qߐ�k��]�0_�,S��G3����^�������R㈑��L�_��~Oˈ7���f{������=��Be!���v]|�1�i�7'�%��ћ`�;�o>�Xd<��q���# ��謲:ݦN�ʭ��RN�0�P�>�' �D���*�ND��X|���ĝo      -   n  x�M��r�6���Sp���I$Eri)N�DVK�L=�\��T�PS�� }'��3��M�x��Kʮw�����|�PL,5���tve6R���_���4-��jE���(�#qT��GE�T�4q,������N��q��.�W�Z���Q���� ��k�eStCr�4C�0[�G�Vn��h�HaP�ʒ^Ɇ�����w�4��%�	���\c��X�jq�a"N�55�)�fM5w�ŉ�_���L���N=��)�d�]"��\n�ϢF��]e��v�"�&d$0�&�mFC4�U�~��H���4;nGb.�|�Q,�p!��m$o_�����������W�ĳ�L�n�98�`q�F�����qO$��)�57�$���6�!�1�[�����iΔ�<$�e�u�h[K�L^0����YU��T\X�_#��%�q����Jm
[8�@S�yv�x ���VaiÞ�PZG5�J�b�x�o�}j�s\��.���Di�u�`�J骦R6k�c1��5Z����+K{#+��S��8WW��_/Gd?*�5VL�JCk�}N��d2�j���u2⬓��J$A��xn�w.��~P|K����&����H��FYVX�?[*d^h�	.�������U�a���Dj��N�Pb�u�G0�܆���vG��骻�8���pF��l�p,��BƩxcl����O�{M��H�%UԬ�H����VKGp!Ө3��_)�'�ũZ٧]�Ḏ%�%!����$/����wݱ�L�a��J>�6�Ż�;'���l w�̋l����A7��H�ۺN�t	�S��|�q[�s�S�A���j�H�����%}�6�C�n�Wj��dp	����rȈ�2qQ���rqI�Isq������#9s��L���[�;��X�9�t��Z� 4���N~s\���K��V��y&�jc��L6]o��o �P��v3%W�Vj��Fx+!`�h���1r���NqW"�]w?�����VX�鿁P�EF.\/L@Gt�b��do�� �g�[���(A,�j�vs3,Sv��9���@H�`+t��7�|�N���1W*���M�n��(~�9��7s��p����R�P{���}�NH}�}� i!��
a��+[���}d{g�^�}��+ۛ+'�;� X�T��P4��ۈ�cP���#��_$��WWl֘�m?�{�;��A����[��@�s�'+�w�6��H��(�8_,^��+YJK�����������	&^��2H��\CdM �4�d�{oh���NQ]��=v���D�	�T;8�sl�Y��@��kU8�X���� �(q(�t;L
 �ú�s	������~Y�,
�CZ���1Po�Ʊ�q�� �#��]� �.�� ;6���� �x�5�Ii���	d�T�s
̂JT \��9�|�j�?�.s���,����o�5W0x��)[=J�z� +B
T�n���h�?L�y	�_^�'�w��7}N����~��%NDA���gA�5K��J*!��)� ���7�7����lsPa�< t&J���k��� �����)s�>9~o��� �L�ĝ9�k���[�� �E      /      x������ � �      0      x������ � �      1   �  x���M��0�׏S� �b;Nb���3�NmB%�U�
iԩPg�=J���7(�sBG�eE�� C����!uY*�6:d��-�n��  ����5z���d�h!��#��C�;���58�iC�� ����q��q��� �,�xy%4�(����������N?������������0�DU�">0���u�hg)�\�%�2#i���}�[�]�l���.����H�pkZ�x�+��Kv��t�~�0VCB��۵t�bIҫV#�4��q��O�E��&O��!b�<��9$BF��a�c�����:}D�Į��R5�:##�е2ʜ-mB�v,aע�A�4�Z7���z1��.m��Z�nm���������j��1<�M��~��%�5=���ml5 �� �<���рm)�oC��r*C-&8UU�PRIzϋl��[�y�b���.W�>xh0���/bWq���]��Q�B�s����Q�9���c k�km��������ܐT��&x���7�r�*A�hhJ8�嚭06'�x��&���܈2׶�u�S��v��a��ܼ��#́1(�A��6O��U��Vf,^�R����-)�*v�lkA�R�0���� ��1O��{�\����<��sAG�FN�.�����͐��?�S� �YG	�A@A>����I!�d�4.ȸ��*"�6n�����qy�׳���p�o      3   �  x��V�n�8>�O�� �}����f�������=��fD�:�����>/�e��	8�R�e��\U_9!7��;�v��۲UR����$M�$�iJnJ0�#�d�)]�V�7��(hZh�{�iayB3ܿL{�ZH�Vy#��r�ڱ�INsr����_Ĵp�b8u:����xT�?4�7���4b�]L�]�G蟭�54B����7�?z���/A>rrǛ�hP-ϑ"�I�VͶ�$q����5��`=��YF�����G�`�9��P%s�V��IXd�|��^�/��Y	&
��F���p��ұM/w�Ou��H5�M-?N���Xg(�0Q����a�,�Ncrf�x�/@���#MȝT ��ۣ5�����G6yLӔ|��r~��A��-^ו�r��/]9Zޣe���}�1e䣮�vz8��|Rg�3;ۉM�u_��:����+���̫��YA#��?Aȍ�B?��C胇�|#�'���Z�����\k����BVX������ ��,e���M�a������*X`[��R�6.s8Չ��`Ȥ,'_�|;�y�����wb���A������q�G��C�Q��Po���Vù/����o�ϳ�ܟ[^V�����'q��{%��ye#g1�R��5�w�oV���G^����e=�D�b�п�9Vv��աk�G�+��r򠠫f��g�w0�w4+�C#�������f;��co�?ξlO����c�.hv �+$�������{�aq��!��7�`&�	���yJ�o��̙J<g�	F{����.az�$r'QxĢžĬ4z�sP������vsN��#�+���h�c*'�_~L���e�Y�iê�x��P�#���D��dQ��>=�ԣ�T��`��}a�7=�l~O�^�ENn�?O��di$�
��yb*��@)��\��      4   �   x�=�1
�0 �99EN�`��E(���哄�c�S�_o�9���o};q�Ds".*?CQS�Ta�� f���s!�R�&��y��VASb��+��0�q?�!�W�����K�����Ⱦ]W�򡥔?��.�      6      x������ � �      9     x��бN�0��y
�@#��vbo���S': �d�&�� �1�y1��T�H��O�w@�6���'{t�%�qܰ���B��3�I�qr�?��e���6��ӯ�K�m�}���X��w{vݺ`}���%��X��|����߮T���o�n�qI�����|ׯ�	�<�WK�W�#�<�_Z�d�T�y܌I��0�
�Tb1�u��p�Р�%(.19��9e8��RȢ�ɉ�ᵋ�^&�.���;�ge�O^\79�8���<˲o����      ;   �  x��Z�n��}�|���g��CI�̈́]J2ڠ@��<�Ne1���4o���E��_P�X�E�9'r���@DY�����koɐ����wUpU����eIF����*��P�1z�)	���1J�$�[�%����R���`R��*,��uA����{��1a�:'�u=��+�W�2��*E�dxε�ZH�B��)2-We0���]ypuQ�ϗ"���HH�	�4�H"1�Q�^ �C��|p�~�\����=tK����r	��x���SAF��U�M���VPC��B5�H�?����oU-���W�o�O��Gz��~Sַ�SF+��j#����\��y��wK��˝"�-j�����>jn(��=����\���F"�Ż������b���/�ɚ/?��	�1J�Mj�P!"��gT�QP�c������Mio��E�����-��)�ŧj�tWV,4��3�0�)fQ�̸���&�rQ������	�����_�D���.9y���*-#(^���<U��m/׈�]�E�㏇��8jΨ8c� �!3Ȧ�>�F�0�[�F���f�&o���n]��v���$��H[S/�?b^���<��w�A^�Gpc�=�6��k���;4X�p�8�1�S�\S�� �4e��m ��>JI&������4X�q[�j�w��|�J7[i�%?�\��Ԅ�/)I�jʸZ?T5Jc�����v=�
�p���������=8:
2����(�K�ReA�P_E9�8P��:I���2�Y�6��u4K�`���F�U�O����^s �4<C�Sh�Fi��mVPJ.Z
�<�Y߂�y��\��������0*q��%��w<��BĿvJ�T(I�X��#8H#�[��&��ZR�x*'�2�R����j���ݞAl��*��U�u�*6{���(�U��V!�q୥?�X!��!wN��4o����j������.H��|1/�� e�,�M�p�kW���W�c$ա%w��;�?|�vm�8�����=�6���5%!��$�����ĳ:��5��cjI�l�����>^ڊi)44��6�w�?l�����KFK8�>*�h��j���H(�&y�(ށ.��j�ՙ#�Q�B��	��d��k:�N�p�WkqO��-Y%���l�DA�&�8��J��D�(Ǔxҽ��<0�$+Bh;�)�� �}A����Z�1�!�������n��+��ݕ�p{=c���?��=L�_*�m�hg��U}��	J�A�ʅ�&;�C.�Y;a��/�I�7���F�5��M3�B;T; h�J_��s�����]Y����9�Dۆ��.+�Ƞ�3ka�P`T����������sK�s����X�^�ο���6Hl���?��� `���$����ˣ
n� [�?��!�5ZC7���N~S��F<�\ɀ��=��׀y�I�����
*�T�$;M��}v'�Rr���T��>��b��\��J�q��Q��]��WO�$+���Ap��ي"�{���i�Y�Q��6ǻ^�ww�U�՘����{���� �g�PM�z��tۤ���E�3�P��C�Ȏ��0%&ڭžk�N�v�Ȕc���9�.�*3���`X,���-��Ģ����B�^��4��0S^�0%��+��Z���`�鴛��⠆[i��kf}��Q�\Щv�$/�!lO��ꑇ�[�}�|<�J��TΞ��O�עmF{J���~S~�:���>�)�P�Ѿ��0��A�0ϭ�UOl������/v=�������[��v�����y��\���}쒒Q��`�/0�bcz���$گ!��wKsi�҈�@��t[C�	��]��	Tc��>�M�f��4.4ߖO�R��������r�0@�����O�65��C��a�����-���̘�Tc���l#�9��\��`\�
��)��h��=~�����<�Z�u����"g��O�S��҉t�rq�.`8�>�̭~�[���(@���S
ٜ w����C�V�n���u�>z��f�g�aH5r���dO�F�i�{Q�?`N9.=V��n��z?Ч��$��D�LO:O�(���5��j�J}����!�����kN�]S�
�e��3<Q4��i2ʦq��h�����U>���j!���	�%�gQ4��M�ʺW�(Hn��:�#�QH��7�8ɣ�>C�`1�
ڣ��X���fM�Qr9��`�M��L�I���RF{��Q�n��QY鶄�����<G��8E��i�� ���Ã�x��F�<X��x�g��lp���AS~���fd:�����)�:h���y�����E̜S�*h;���0'y0���m2���4���r[!W����@C�B�[h0��˳4͈��I`��q��<4�'i��vo����U4�:��b�@j�St�Vܟw�{�EYp�L�q�wRF�9G�j
����Q��:tںY�s�uug����f(t��(������<��M����q�r�й�M�q�إ�4�y�i6��Q�F�~��[�m�*d&��Hr��[���I��$B0-�:OF�G~b��Av���GH�)`�"��K�,Mn\��Uo�
�A)��fe��V%J;ʧ���4@�g�uI���d�7;1�0����&Y��-�7�1�}�f[�ͧT>�cor/���:q�C�L�O���M`��Ip�����Ɛ,O��0
.��(����r!�B0����D'mn�7����HT���&�?�)�,*��,GS�)�7�J3d;�L���@���0R���4��+��v���<��_fy��I�����ʹ p>{J�.��I��E�l�$����;H�t�[�N���݂{фQT��cf����m\��<g�M�;)b��?S��9UZ�&H�Y⣑G�cQ����#��!$܉�O=����eZ�!�9@��[��1H�~[<�@-4����R��4�.�t�1���t�4^B�C��F�)��k�_@èd�тiރx<�O� ZܽmC��~��%��L]F;�|�q�Xԣ����	���;4\�R���u!g`�:y0�&�	��3����+!�m�����'�ĭ����ɡ��� )�ٶY*��&�a܏&ӤmG��	�t���g��l�BMN)O��Z����3����K��n�A�2	�ܴs��|�0�_Oܟ�⡣�����}��S�A�uGߌ�#*�.*
�~��M�:%��FðA<�a80Դ ���Ma�ɝBt� o�����<EijO��E4n�����ܓA�uG��r�	'J�X�����Fl��#�"�ywE�|�V�q^�k�^C�$/��k�5�|�$7�m�n�V�?�qR�>֐F2�;�� 3�;����9�9�:1��Z��3k���U<����h��y��1C��2���6nFSP	�I�0\�;2��h<˳k'�+'B1x�{��:j��om��]�ÑM�8����7�I�bZ�&h�*&�Ϻ8��N.%�a"�c�$�yg�`��a�?��L�օ���ϫ�QK�` ��ԍU��*���0�
!�F~�ͦ�F�Ϯ�Qw���5&��̠mA���y5��*�F�7c+�7nC���?�=$���x��*���jˏE�����^�����V(���(|*$�Xo��73�������O��\|�����j��/d�jnD4�y��S��L�ȍ߱``�[^� w�Lb��a.�4­�Ż������O/�=�&�u����b�c������8T���|i�/�����^��/?�kx      <      x��[s�H�短O�`�n�DR�/��ݦ$Zf�n%��u銉���M�RtW������b{��c�ig_�q���$ � Z�ڲ%;U.�D&�̓'O���0�L>{�$�;�'�،�o��l��!��͝��`\lv����r����t����N	ف4;���C2�\n��$�.��x2���N�f�v핅|��g6�{L���N��	K�@�P�ON'���\ꯞ�q/�~n��U�H9_�_�¶W77�ӝ��˙���ym�n ��m��7����xhf�5�\nO����&�=�B�$&5N�$�NSƩ����K8Ҿ�1{P`�$""r���;� �z?���4;8����{3x�h��Û�h|do�ɸ;���3&��/��P¢K��Ĕ;�G���d-��fF��ǟ�v�x�R����N�I�'����^'i���[S�55�5ӛo���e|e�4݊ǣ��ѷS�tbiRӐE:
��)�G*�[P��.�~	��K���W����;gዣ�^x��K���y��1t��Mx���Ư^���{��i��Ó��<��&�k`�_u���~��w�������������<w-�8"�<���/8���O3;�)
�n�_����
I�(�z?_���R�!Tl;\f�b��X�A��XE\a0�#�`I�D,K�&8ќI,�P+e0�P\)�&/�I�d�ի1���p�|u`oN�?��&��m.�|m�������f0�چ������a�q����/�nO8=�𦶵0��ݽ95� ����t�C;��ioz3�9LLaF�%���5�b��`��Ff0,r����l<v%��d�g~�\���$��f`��t��Z�!Ea�A��(
������&����ь�0Yd ��p.�!;���Y��f�_���{5�"8�S;0	��ymv��4��
k�B�B�.����,0�\�	��q���+;�T}X��������jj^�A�(����s��f����u��t|����#+!�t~�\q�?X E�������2�`#�#s53���c3\�2�Ї��Ǔ�l8��S;A�O��k0��s^��v�<�ٻz=XJ�8��q��*O�k&Ћ6�C��������Li���\���ץ�	����8&2�qH��!S��:E(�*�$��*.<�	�9s+:�?��A�Ń0xq�|�k�I�l��Y�3�Y�CUos��kJ�x��;�����6��zi��t�l�[���r+8ǯ�M�H)�l�9,8�a��=��jj����G����� i4���_�m9{A8�5�	;|�����Y��ʦ줫.F2��P
���L�� Y��g��:/��w�.����ٹ�BIY3�g�H&;��8e��U�0A �9������c�p���N��4�|���L���5��#7t̤��G�t���ɰ���a����|4�џ�6�rj���,$��&yRf��XD���ML�cmkd_��f�X7����6��0ݘq%?��8�}h�q��Wɂ�2f+���Z��^��&�~_͠�uQ"�'�#�+�W���[7�����?�ukie�4����E���!��I��������I����{�?�&Ů�kp:$0^�}�������nptr|;v/���]�F<N����u����rHW�T�k�ddrӸ�Z����ECές/xe��0�_����;�T�J��af�����@���|/B�N�]�����b�=�T]��c�5^��{�ǈ�u�4�S��'�x�p����6�7���d>�n����c�y9�{��u�2�g����~�-��O��޲��bˉ 00 �q �5O����G�6�J�f���j��:Y�|�RN�]�a4�'�h`���7�/Z��w�g�����wt���ry�ޘ�Ћ*�`t�:���
�CgѤ��v�Z&�X;��go�,���к��qy���O��	�#`�E�C����M�.�N9:(*�}p�?:�*�O�ҳ]��v���Zl_��̱t�w�q�we^�����!��Tj1�zCV|�5_����9����h�}��f#uNκE�2��!d �s#����s�?����b	����(�Ԏ`��w��|Ӆ�,�H96M�d�����l�O\~��T���UŞ�&[[Z��|0[���*��Q�)�Y%ey���E8��l��10zr�c�S�|�:��¤�&�>+�ҳ�o0�?{������,M�rc�в�
�<�[��-��d1:�x��N�$̆Ln0�`G";��P��9�Lmp�C�j#n�lIu�,�����:G����~���~�Yd���zZ�:XQ)�Ȱ_�
�ίQ�9�&Wd@��>We���wiĭ�Wfb�G�W�%w���ݍ(�o�s^႒��ͥ��Ջ�F=A�R���0��Qt���{���W��B���B�0)
��錱�(��B(�	jB+�ha��Hr��1�wwƮ�%����S8CKN"p�\�"%��%���(�p��e� �VR�#+9[�/ue��M���}	���\���δ@���.���Kˬ9ŅKl��U�m1�l�<N���rݲL��8��HӶ<��g3�tEI�`�;�Lo7Se_�liǪ7(
�C�n�� ��b	v�p��%�]����W�^���x<�J�Ί�-pV�	́T�*�aҴ�bt�M�Ԛ�_�Y�5fDH��XafA}��48�EVv�����i�zZ9몙�q�a8'��X����ʊaZ�
�H��V`q5wajGcd���uE-ǩ��+�@��-��u�y�|yɎr�TYs%�B��R�WILXH��.�����P��|W�Օ����-�uec���Wm�_�-Y�<�����+sy�n��۔�HFT�2-�PK-B7�m�B�Z�3��5�<��%��Y�9�(�Ki�+o�ԗ�[;|��m�o�#����5���y���_-ޣ�����cx1�^C�;�nj�/�<Dwh�����������fbg�+�M������,���u�!���z86�t� ���ھ�x�'t��\�9t�>�e�Hj6Q��0�y:�������i4�#�`vY��*,��@��WҪt?s�+g5Ą����>�-1������7�^����aMfn�-�W��y��ɸ`(��`6�t2��A��]>}7�j��r�u�! ڸ��3���R÷��UDM��$�V%���8Q��v�byոR�XZj���(��I�>�"�Y.������VU}�>�fə�Q�)�#@�Ԋ�L�T���~�$�����Y�u�PC�Y�^kަ��<�Z��{��9˘�#AG�P�v����75�����oQ�[��H(-��TTZ2U�֪H����I�q[�TsH�2BL*���5�c�H<��X�XR|�E���`���⨪N��u�P#S(�$W�"�[�u��+Z��,IK�#)�3�F�&�,��=�h��_�Z�宒˩5���ȥHt.�WU�V��,B�c������&y-F֮�A�ӫ�_�#�i����j�v�b;]�]�o'lE}H�v}��uU)��ٝ�*�+r۔�T4��8ٰ�ۄ���ܦo6Gf&w���B�\�p�U��qȺ�z�k���!m��W�Jgk�M᳽��e���-t��UE�3X=�tD�Ͱ&fA�m����ex���U��x�+�������Z�
���VF�^x�2@;�;��N��'�~7\��M1���J�hj��eW��[ϰJ��ZBo%U��ֵo�ͅ�g�.�l��ķ�T���n�uӲ"^7�bfٕ^7����M�n���uS��z���^7����M�n�u�J^7]yN^7��i-��^7�K��nڞ���uS��uS/x��!tS�C�;[��x���eE�n��:̲+�n�uS��z�t���^7����M�n�uS��z��릕�n��n�u�Z��M�nz��{ݴ=��M������^���M��M	��lKQ�H����M�nZV��_��,���^7����M9�n�uS��z���^    7����M�nZ)��+���^7��z���w���M��{ݴ᯼n�~�n�e ��>�n�v�!xKa1�g^7��iY��~���J��z���^7]���M�n�uS��z���^7��i� ���<'��zݴ��uS��ޥ�^7m��uӆ���񺩗�n�@�)�at+�8����^7-+�u�/�a�]�uS��z��릋^7����M�n�uS��z���^7��uӕ��uS���R�n�uӻT�����n��W^7u?^7�2��M�9��0��	bDop�uS������0ˮ����M�n�u�E��z���^7����M�n�uS��V
���s��Mk�^7���]��u���^7m�+�����z����r����Zp����M�nZV��_��,���^7����M9�n�uS��z���^7����M�nZ)��+���^7��z���w���M��{ݴ᯼n�~�n�e ��>�sz9��t�q*4���F�޴*�dsI*�x�ٱ�lj����_~{�ig�6q4o�%�Tll�C;�1����_�A;�z.4ƽ|{U ����g9�/a�l�g�ٺ���n�Lo���xr�����G��f�!���m1�q�$�t�B+j�BL���j�B,%��P����i�LZ4�*}��G[��b�j����K�`(5��7�z���.�Yl�i�F���n)�QhcBS̄�(��.����A�)�^��q�"d��X#��Pdb�1a�s�lBcƉ[�pJ�����&�\��յͦ��,f.dʪzYٺ�+3;zֲެ#�M-��[n�W��p��;�l�Υ;�,�;����0��o^�o�FgT(i��ߔ�v�
%�e��Pw:�B�s�4�����D�;�R&��*����r����.9�����_C�7���,��m���R����|��Iw�o7;�g#��X~�N��|?4q�{���SHa���d!����D8D<JE�*�ʝ�.��q�"�s��D&v�Gsq���27f��%��ui.oUխ���c�a�����~�
V�*����kT��W4+w��X�c��K*�۸��ܷ]*�WRմ���V%(�<+����'�hL$�!00)Mh�!���
�#����>�ӛy�6�����ԥ%M�r�v�)#�)��N�:L���w�h����\~�;(g�屴�N.���q��l)���i��1�F$��r��9�0��,4���ˑT9��I(Vo7k*͛�4�+35=&?�CT�+��9w�K�ˏ�n<��]e����nY��: ���PB�#ΏT�? V�z�=~�	�ަsd!BM�p[V+E�Q�4\�۵�2�[)b���z�~�)[�͆^Q��,���.% �CW%�Y���D�y���9���g�F�ZZS$��ts�����Ϻ��l&wĿ�aF�
��r����^���	�UH�Y�z�p싓`����P�I����{T�S��kV�����F��{�5?�-��i�*d��P�֊���TR��bR�ټ�
�/zu����ո�"� �c�U����^���F�]'��Q�k�г߅ӭ��J^㸳��1����w���������S\ �����y����p�y;�K8��Wg�Ư�s!%�$�+�
$M7W2謱�����?�լr�]�A���P��|0�Z{�+��j��к��;̜C��W��%�iYzH�A(�����Q^#�yW6PeiZ�l2߫	#߷�o6RA��"ƛu��9�_t�}�A1�W�`jG�����u��֞���w���pTD����1Cs�ؾJ�l�N�3T6f��d~��7��+�%Tޯ�X["-�>K��d��a���Uq�.�1��4?�ZP��^����oz�Y<�*�q0�<�UF���P[���Qy�E	�
��xq��~ �$���v�'�a�s��Ē�Ԇ��ܛJBC	S��"V%OнA�)�soA�K#D8ԤI�KM�*"i��M��[Ɠ�GD%,��H&	OM�?g��a��\��J�`\��3?FU~�7[D�N`����z�Lp�@Lpl�hFP��|�^��a�!#91�0$+��B!v�Z�a�(�7W��Ry_X���3܀��"���]��d���!K��G���R�L��4v.��B=,���0w����������~��f�"�}�p��E�p��䨗/�{�{'�'�u�����0��޽�K��L̈~hjǕ�S�.����N�0ZչK�Q�r��Π���է�u���aԆ�f���Ν��
dW��	�U����wa�U���&����-c�7����r�#n�H�q�5� �xл�rU���-�5zĖ���<^�x�{�'��<^�x��5��<^�x��5��<^�x��5��<^�P��>^#|����XD9�lC�g����0W��V��m�����5!`i.�ӽ?�Ќ���a-_#	M0�8Ԝ��3MPh�>K�h���ˏ���_�1�po��ݽ��S��� ����RV C���ф������b���ZIh)&�$�BI�4���s�k�C�EU�Z����4���d�Γ��m������k�暟"�Y�>����)�!{�w�%��b!�&��{t��q�ZzRl�C:�m�Ǟ����x��FqW��^w�q�gG4p�r���qN��"���I2j�P���)���b����y�q�c�q�������g�Mn�����q�y��B�$�Z����d�`܊]��4R"X�b�c�]�7� ����c8���p�I�J���[���εk�sm�|�{.��.z[9�<t[�.���������[���՞G�Y����-`ͮu�;�miB�&�<�d}'4Q��b�����<����]���n�e��f�5��T*C5dtKOh�Pa,B-���X؏�54���{c�Vy��z��2��j���D���'�Xa��4�ICC���tKlBB���PZ�>���oDI�}��M���X]�����j��=�[�������uq�ݐ�-��+�4�Z脆~�,�X�i�L[���*�O����#�G��>�p{'gg=�<�V�VMm�murv/BF!ĠZ3�T��Ї#d\�Ш���غ`���b�.��P�`w��5~#��49:�-s/]Ǧ`Nl���3���=:P�`d���:(l�R���}4��ò�|��h���{�?�gY|���q^U�Wzo��A�Y9wZ�,�=��p��4�oz��.`����d|�}~N d1�9�O��2�@;D� ��D���IȬHCX�E!�'1�E��'to��:N!A�|�@�GV����a8���\�,fba����T�D��b��JP��R�5��o]X�օr�U����-�I���'ķp�m�(�h��44��01�X��|��[�jw�Ҭ�o-������_�s�r{T�%����z%ݢ�*��֧�[�U?��.�{�˩��7�+߹zPdF`٧h������e�b]�5Mz�a�G�t�焱wP�_Vv9�1�e��{\��g/��̵��?{�m��N��
����38@p��������Aln����{��z��O��	n�b�Y���b�y��Ò��骳'�����x�X����r���t�a:$ ��I�7{�����_0Q�b:�w��	 L������P�41��p��;�|Θ.&T�	�!��R,��nC�J�c*dj?�����M�ýA�I�)[��,Lb"�D(b�(�T̹���q�a�$Ssb�)���\n�MG2ME�Yc:����<�`:����rbl�������҃װhes��O^;�-8��>h���iMX���ƥg�(��p4'1O�&LM�Ch(j��P1�°g�`�ќGs�}~h�w��_��{��Aj�H|tNbFD>��s�wɋ�1�g���E8K�zOz��+J[̆݋�j���'�)��������.���~��4yTd �ey�G��j�N�<��V&���E��׭w��C k��H��188[���C��C�ͧ���/O�N���OJ?��P2$2�G]��7ygkǇ���y��ˋ����y&��V� �  �o��t��hv=�6sP�6��u[����]ᢟ����������N�?��f�z�ݣ�'�����T�E�{;BBwO"Qy�x�{���=��T.:���t=GI�u�m�&4��E�A��7i~h'I���$+L�0�~b�9ﲀG��������<�a�%k���{����xb�w����Q�K«�����r��;>x��?3a8�q°��J�����IքJ��T`������aI8�*{I�L��(�"v����a	�)�a�c2�x�Q*B.�)���ēso��z�-Nu�D&%1�1%y�B>�H�bBH�$2XD��1F#j�J���,��°��0������3Z!hȄM��8�(Mc���2��/N��$y���GlDh8��|����t�*�X�q�xm���t+��`UX#�X���P�4m��w��4��ܡA���v��σ�8���Z��M�s��v<�A0�}�eT�o�a��}�;6n�ac��h�o���[8�������t��b�V
�X;�+;;�-�n�e�KL�:"����=-�����Gs~���֮�94���*�#�1"B�����Bx4�ќwoO̽y4�ќGs�y4�ќGs�y4�ќGs�y4�׮�}���\;�s�H�0�����uCH��<���퉹7��<��hΣ9��<��hΣ9��<��hΣ9�������]=�[��(�ax�h"5��h�Q��Z�\���I��М��=�ء9���;�~�hi�FX�b��DFE!8�'	5�'�ި�kޯ�TP�vo�VXB̫���`�HD`�s!�F	A���!�9!q�dd�y4���SFs6Q��B+
�6�$�C3F�P
�ܿ�̣9�������;9;�v/��\5��ՙ۽@e��	øR􁟂�a&Gu�v;Q[��5qc�r.G����6a�'& � LÉ�r��r�%����� i���:4l�R���}4��Ò�|������{�?�g����/��bг��u94�t���.rK",����k�.�`"崕u��?�`]�b&a��tY���|����Y�M��V��/��\���-��4����W���A��噑����
���-�Y?�b�|�a`���`�=�y��3��Q��(�	Ua*�(d�b�Ҕ�:��!5�?>�/���`%�I$��T(�S� �U��$��#Jb��E��B���K��,�!l��?�W�m~ ��m���� 	���V	*C3�J��e����o*�%<&Ҹ+�`����$Ⴀ��B!�yJ�h�L�@3��h�460ي4��E�����d���]���(��U����G��$�({�2a��3	�O!&ޅ.���e̪[1+e�1��01��y����߃�f���8+wJ1bM��5��5���!����!)�r�`E��8O����^,�`�+��˅�9k�}C�8`�������-�g�Y��}m�+�7p��5{��Լ��s5���ݿ��� 3X��,���F|������4�Cd3m30�q���
���A��3�}���W;�j<�h,Q��ʍ����p�zb�k�������,8`�Ϣ�Z��N)�������D}���N��G�+N�e�p�����co��@��~�J��)!T��JCf��ơQGD&q�(�Dy%�1(Q��"����{��!f-W��9�}��� �-�wg��L8F��X��j��c�w�k] ������"
��Uޝ�a��ԫ��ɭ�s�;�x�;��⅙U_UT|"-�*�|�w�{8෾�2������/�5-}'�bJ����x_ש���^}�0���wD�.�'!I�u�{�zQ�P�?��-{�5�Z���&mo1V��O�q��-�t�v���Vsw��I������ޙ��V�E��K��Z�W?����������H�ܿZ{\)�������'�B��k�L���=E��U�mY���㺘��O ���sL߼��+|OP�{�׾��,�}��;H�a(������(Q��/'����"�|�FH�?s׾��ӽ���$>�/W���l!h.�d��G�D�bdi��X��JYqJC��0~����Q#�����Kc�҄r���`�OHX})L�[!��0cDs�+�(R1��1̬|L�e����$"��N����2��%HF�b��(��)N`�'��V	!q['ܒ8q���1&)�8�Q&�2Lp�W�<AQ��C��D�_��.QyS���7��t�(��e��
8���_�&\�՟̀Oy���5�#ȗ�����fL��l�$e0u7��l���t~:+.4x>�3'��8�:��6�Ftb�ǳ�8x5����I�WZ�U�2�\%��3�O�G+t�^.�O�Q0��i��������r�܃iC����[�_�7�^!��ŷL�/��+�I��?O]���,`�k��-�?ZC�h݋R�Iz���&��_�"�[��4T���X�Z�$�,�,�#���P�e(�2��pʇVR�O�mQ���	��e�ݗ��ݳ����I��z�{'�'�ݣ~e?�t(X�V+���/��״ �4qwdw6�	a䁕U%e����PV	G������viC�=�}�G3h:wG���aper�_�Ң��Y=B��d��Z�Mt�Z/�lqo�3�����U���wA���A���
%DQ�c��*a�[Ƶ�2����A��ŏO��$���*ef�㒔���[�).��w�2	��R�ދSv�� R&g\`̜�)���)v���{de�lG1�)�I�#���qqSQR�&��Lʱyz>I#��O*�"")��Y+L^Y�$ER�Ԡ��\���Db	-D&6NI9'Қ�T�z�{.�{�=�_,kT��O�Tu��T��̇c9W>��KXOPº��,��Y��,�Z�S[(��.�&�Ab`�;�]��5�N6ʗ���^�
�͚	V2��෇gA������?�H�<�����i?���y�\@��A���5�O��ݕ�x8������v��2�XD�؃������2�����&����`�����up=�20"����`�{������T�Ρ 0J��X�|�r�������Z��ݟ�|��5̸�)��O%�t�g^�>�'K��3��O��{y�����Y���ӅБ=@�V�۷O��S���fQay2�T1�C!�V
��x�ﹿ�����>WpU�����y�~,�)?��X�.-n)�q�@��������+�      =   &  x����j�@���w�ݞ��g!>؆��\��,�g�.��i?��"}US�R]�,n�����p���q����o0�/㺿��Ua��a�����M�^�����gmCBVF��
��STɌDB�K��^./禟o=|������t�|�\�n��i�Ro�A(4�:�q�:iNm	�qb+��TZu|�`��Q��y���(z@6+t5i�.��i�5|Z$m�ϔ��0w�"Pf���t�BcO��F|(}�{�^�(2� 3Y6��,�5</�[���cj��go.�f(`80��f����Ed���%ג�"w_, �`b\Ze��[���;e�g��x,L�ͫf_�:;f]�d�^̛/~)�2�`�5y�k�����QNJ-@ݺ�z�P@�F�h�s����K'/Xf�,��AI�Bj���Z�j_��ϧ_���O����<Lc�@�&T�	Xlf,�e����G��̎����:rG�����OK޺���rG{�}��g���S�QF�Zg��z�;>�?�8>���v�����?/�^      @   b   x��A
� ���k�>4����P`	B-������<�+�=�5A�k1b�z���4����#����ŉ�d��3��:�����%���4:��tD�;k�      E      x�U\A��(;O?f+0���;V��5�i�b$�q�_�����g�g)>~��nm�����Z�������������=�������l���mߟ�_�(�WJ�.�W��U��0س�5G������&��u���V\#��۵�f��V(8����=}�>�����l�۷y�n��8���w�n�����U��_�����������|���~���<`�_������o��~�N������[߿O���q�5���y ��5����;`����K�m��q��f��y����}��o����< v�Y��.��vy9`�������_x����� ��s��Ѿ������헾�����(�����e�������y.���hs��}�����6�����ۜ���v��npڜ��/������v�s\�۝���h����vӫ\��^v�i|տ��i�N���d�����!��$��hl����؇���}��؇�A���~�	���`�o\������=ʷ.ܴYx�z�������{���%(����o,�� ���ykKV����'�7�!�^��ʅd�b�P�X�� O{�S@�&�) P�d1(�>Y�O�F�� R�dq-�A�&'*���ŵ=D�k��`U{W@�&��ZB[�F}B}�%p�ɗ@�&�*�W�|�`(ւ�`H��Y4kC� �5�Vi���\dkC� �5�0�֒�qm�
�������6�,@��|�kSV�m&+ց�
p�ɇA|4lKV��m�
P�%[�a�%%ے eK>Z��K�rM~	f��� 7�OV��k�K�sM~	���/A������D]�k`�*z+���`��� _x��}����>� ����7�S2�v���yPX�.�jZ��5ͳ@�5fZ8�]5�* ��V}Wͷ
���� �W�����A�&�x�����Us�W�~<^۳�@�U3 ���z���5fA<�*ޘ6yu!T0�`�[�K�	�Aw	o��[�f��t/���k�-|�'��|�������5�h�l�ך�O�@qM} �i���&~1�Y0��.��lp����8���_~т_xr��<3Ή�_: lR�sZ,~1N�/�t��.<Vpr���9=�'�K��)�fL�ځ�s8Q�3�LY}ϩ���se�='��{Ζ���.��9_v�g�~�� �x��x��<w�>��	����������77�w������@�]3q}w���݇l}w����C�x��𼫁���������q�(�n�=�@�]>
���G��=4��/<}�����'yw���ݓ�����q�>p����XPwO��RDu�䱠�<v�O���R��{�XpwO������X�1����� nO��v����]�:u����n�UP�K<+���bPA�.B��n��
��7�*��%����
���R6�.܎XA�.)��BRZA�Rʓ끧+8��VQ���^Q�KX+��V��]�ZQ����ZT�&���i�'з��r!�x�	��VA��覂�]�f��&P�W=;P���P�W�(ܫ�(ܫ�	�5H���]K pO�`p�G���=�� ׅ�&0�K�+�C�q2ܵ�Q��.��`p��7 �ǽ�Z���p��V</�N^A��0,�Z��q�H�{WG�ǽ��q�㮄�QO*x�%4�./�xH �Y�E!w==x���Q�a\P���S�&�7�`�?	�8�C���>upa�#�
����74�A�CS���3�/X|�q*X|h���ǧ��q��#1X|h�^����}�k�� ��it�Ň�&��H�,>L6�Ň��,>���M�+X|�l���TYA�C�$>4�@�C�Ь�/ă��q�u>�[���8����yd�yd���H�[/�ä��Gx$O�ޅJ��,U��Gx$���JP�x>���CӐ�C/��8�� ��!+p��4�ᤡiH�I#�!<yx�E�I�MCZY�}:f��鍋��4��
b��C|h�@�C�>4Wn��w�
��4P���D0�xñ����!>���@�Co�>4i��yH��C(|�ͼ��!>�̣���#�����Z~l �w���j40��
d��O6���~�O��o�7�|����SS���E6��g�M��Yd|j��@�SS���j4��T����j4��|d�@�Sd�@�S����&���S����ښj4�l�l�ڶȨqu[dԸ��Ȩq���Q�
���k�U6q���&��T�a�OM5��T���g�M𞩩FÃ��ل.�����j4�7�l�響F�OM58|��
8|6��M6�ç�>۳	>a��c��˶h>Ŷ���>]�ç^H|J�X|�m;h|�m;x|�m;x|�������2a�"1��b1��)����)����)����)����)���q�|;x|����爎�=�Sa�cێ��]{���*zG[S�[m��9,��h|j���Ƨ޷:h|��:h|=f�`�U��A'�_�c�o�Q���K���FU��U���tp����4�:8|):���+F����Xm��`�������u`�	|)�_㠃��L�#�{/=A�����ϧ��2̧��2̧��:�g�.���\��Ի\��^ �s-�{�-�� �b�K��7����%��|uXp�|m|m��a�_�>�*�T>�D�K����9?��휓�N��g���9����y��%����O�%�s���	���<�	b��9_���9s��u:�E_
��O�s2���S�����~r�Ϸt��Cy9�\G��W��q$;$�;s	����%�����t9�p���ڔ��������K���Cl�t���=�w���)�s���;�@�IA��O���X4-p>ݢ���,�8`���g<N��@sv{Diao����0 O���.g�SA]g�H՝����sr�>K{���,vg��Hٝ��"i�ݪb��`��;#�屡[4���Ӻ7���q팜�.��*ZjpF��Ƶ3�S��g��t�K�r�3�Q����(�_]�֑�Ӻ7��1��	�3�P�"�?� :#Eo��DѤ��(.��(Z�pF"��%����x����m���E���P��� ��S�[�u
C@Ja(����P�{�S��)� � 7�|�p}�B@��BK�̂��'�x��Cc�,�ʸ'�
�˓m���%�H�n{��~,@Uؐ������KT��`��/�'���dXv����y!�jׅ��(
�-T���k����NU���NUȓiV}S6��'��v8EA� ��`�{�	����`�U:5��{�����S,������f����={��(hS�SL�<(
ڥ0�	��;�	���AM0E�5�F��"�&�?c5�4\5�<����K?(	n��{�sP��aPl�(-�F)R�-u�8qtom�ߪI �*f?�hR0�H���J
�>��|/p���)r?x�/t���ŷix����`����*�>����aPj���Ze<ՠVO9�z����W�A=�z�ԃ���A=�1��Ӎ��4(U+�r�p���7�����&g�TiѠ���T����rP�sS��hP��ިU+���P��<%A�%�j9pP�`P�E���i][
EB��A���A�P�P2�T�f�)�U^���g�ݶ�����qڢgHEh�%hP��`PZO����	-f;�v�B�lgP��be��-fP����B�������[̠0hwà0��BT�1v���%�6��BԆ�\���R�\�ڠ���д�2(M��Aih�'�A�/�!m����bP�T�4��̤0�m���vF8�]�۞�v�ԅ�6�R�����wۓ������K�z>WSzymS��bR��yR����ś�'�A�/&���t�|��߫i���Ii� �  ���X�Im��Im���Ii�=]������8�A�A&�!�����cRb���0h�Ƥ0�����6gL�p���4m�j�0��������I��0�6i��$���ld��}��0M�&�%m?�Ξ����l1�'09�F�I�N{&�4�8L�SDґRH�5<9�B�ݯ��d���d��/�������=�@����|��F4����<�"����P��
xr|��K�'Y?E���5w�8U���q>U�5p�
�cO�B
dOʂ̓���(x�U��'_�(D��i�|����W)	�|����UJ�bԓ���W)	�|����U*�bړ���ؓ��"ד��B��U*]�|J�^��xO�'%ᅯ'p��>�B����<j�H���a��[�5!E���/o:��i>5a��EIPhzQ�{mYT��!"Θ�,*�b΋�0\��
/*�x:�(��.�A
�.
;,*B�Ha7A1�E=HA�EAr�EE�`&��/��� �3� �3a�!E4!�4!�4%�5y����;,JB�5�iQQ[5�B\��P]��]Ԅ��1Ԅ�\Ԅ�\��\T����T��\T��XOYx؀i�����IB�g�:y+e!+e��#q���"�����B��b���0���E!�>�!u�Ey|>�2�\\��]d*�x�EmP�qQR�q���B��0:XԆ�nXOf��t/r�Ԇ�E��Zb\�é%�E��&sux�F3)$5I��-���w��}\$�~\�/������R��.��Ll@����2���#U$q��S(q�&_���/�W3Gl�zWb��4�Y����C�E�a��GiPqQC\����°�ڿ(�͒�A1�E]HA��Q��
�-�w
L봝��8��khQ�o�D.̬)J������W㊂�vE��@�ƴ�U�έ�T�N��tW;�ʣO��0m�)Vo��6���d���Sx�Y�d��3��εz+��U��g;��K5��_�Q���v�U�<ob�]U��J�rg^�K�b�^��QP��d�|;+��Os�`��F�����o�����Kf��Y�0�`:�¾��Ⱋ9Y
�׋�	-
�13��&x�cv֧�*(�Qpo�Z_M7��OR���ƺ	�&j}i,1S��c��Z_�9���k7󵾖�f��ג����Z��Y[_Kv3q�k�0u�K#֫0�`�֗F,���<b��!l�}��z1l����'�}E��{|Qp�%
���nA�=j�Gf�v&�~q�=F\���Q9he��]5���i��2ɬ¬q����_�j�(�]7Gܮ�3
n�������V��uˢ�tݪ�lc��Dx�_f.��k�Qp�\3
��kE�1�;?n�1�{?N�5��;�{�[�g�a���KM�
w.XJr.ܫ`/�y'�(�ٴ�kK�ͅ�,�8n,���L3K�a&�b��N���l��A�v��@�����M{h&���v �*f\3i�ۃ���(�fRi�.���$�F��O%f� m<(;�7�<(;��m5��Ԡ��`W1���Iz�h&U(m7(;���7��T�b2�"�mP����,�����'�ߩ�%���.��wBpIl�s�Kb��\j2�*��e�k�C���wo�31��񎊕��6;�� �v3��"���w�p�aPv�p�BPv�����J���e�
�8���)�_v�����Kh�HU��_3
��Ǘ��N;Ez;u8g����i�ӇK/;8��S���AO	zY���q�03%�s��rJ;�W̾tT KØdiS,c
��\C�Q�LI�\�8��0��v�E�y�����7烣
*�eg�YrLJP�~��YvDJ�m�3�-xF���T ˞I����� v�K��<{�t�eϤ��*�-xU��䙔����	�Y�LJ��w����ì��PK���wZD���
Pʁ�4�r<��2ݝ~�|s���ש��3ةo�r������b��ԟ���h9��<d/���v��lv���|v~�T����2�9-�spYM�n���:�����ǖ��V��Z�dV-WA3k��/~U�(+�-��MJ��G��4�j�]`U�a�f
O3���~5����8�>��5
�+�8ߎ`B�� �.(q��+�O�\P�#jLl�����qf7[
�&8�3���gi���8=,}�t>�c���G���l/D�*�A�`�0�<[��1���_*��4)A/���\Q�*�����T%%��aHz�s�@:�(JP�$�I��s�@
��A[��&B���un���G���v����C�I-�m#�]Rz>ԟ�����C�i�Pz>�����'�J3�O�%�OOÇ������4a��E�s�!�k������3�R}<$��ӳ��xzV�ϊⓢ�����D����Q{<?jO�(�O�k�jSL�0��RP�0��^n*?�C�I٩�yԖ�SS��e��K<
��u(?/K�_ԡ�(vY�Rm
��T[��fU[
��U߂#6̬��%̭>�(�'�m��S}n+L��o+L���Z��K�ʺ_��P~Rha��� [��h�0���
vaʵͷ��0��བྷ�0��Қua޵�"�n��<q!3�>C��ז����m��0ӯm�TC�8j��<
�~N�K5̋��uq�@�y�׻ V.���5PyҢtaB�-�5��?5��G��WÌ���V�u�����:ya��ٶ��3?����]5�_Q��Tü8jXG��I����hRr��դ��g��C�'�\�L����<j<){��|R�(��JE�Yɣ(;+{uge���QJ��?���aI)����R"ú���(^a6wMk�L�yM�	�����z�[U�J_�~X�K�/+��V�v�/I���<��W����Ky�	��ˌ̏,}�C���/y?��� ��]�$s��<��Z����cKy	�	�5/A2�~�C�ͥO¼��]�
#���/1����ů�Q���Sø8j��V��!�"c*����bG�FA�@+k��_5��w�ǜ�[p�|mϊ[�a]|k��⨁ӮSpk0Z)�b~��QC���У j���jG��WÊ�[?\Z�QL?���ϗ���O�����V�TC�8j���YT~�L�+�׼R���WJ�;~���o��sf���+��!���B`yM�+L#�yu���5��0�����ƴ����QC�����K\��E���S�V~
��!˫%�bjy͟#�~�kuDA�:� Z]Qp{˿[�z�����k��׋�QoQp��Q�(�F�-��<�׷�CL35�b�y͋>L<�)Q�0����6J�y�	��v�Q��['b�R}�G)>���#�'�1���3�U���>#/���/4�U��[Jb�����Ĝ��?�Ȭ�j�v)?�k������������~��CX�      F   �  x��U=��6�����\��V�U.�1r@|6` U��ݛ@$eRZ�o.)��N�V�o(Q�ܹ@Λ��{3�t�di�J����S���|���[c���
����E�c�_ �>;F+��W�Iq�|㨐���2�G�Eᬶ�w_4 >b��j��V��)��)L+6�s
���BVM|r͆c��AB�+-Zo�S�2��T?���6ȶ��a�k��G���Q����Q�G�]�w���LZa��>"���?T��/�m%�@f���J�(�sR�"�.aT��%�뾘������E �gs"ϲ�m���.Zs��m�(G�Q���}�H��u�~,IV�cÙ�V�Ւ��
oE��7B���=�e�Ȑ�2�a��A�}*�"�Ɓ�Pؓ��q�o�E���{�W����V��zt���J�������pT7s�IUv�mt�{�C��D4��K�����6�֢�Z}h`eJ�E�,�:�a�S�]�ӵu�d�+�]ӷ�(�缏���ǋ��s��ݣ�'�S.P�X-��2w-�R���,�V)[�m�ӫ��oZ�����0+���ԣmz=O�-�6<��#k3���MrD@����0����8��j��p�l�L<3A�OG�ʏ����ur�um�`@��K��!��i-��XU���;gϼ��һ��3��s�y��|����$�3���\и%r��'��}����ye]��Xo�K
m�/z���i���)������Hl��&�6��A�1�����|#��E���Eϋ���"��6���X/��(�Q�$��AV��[jZYEd�ȷ�D��[2Z���n�M+6��:�Q�ua�֍��ͼ%<�ƅ���uo*���"�d�\zr�Ĝ�۰�̟ʝ�����m$iؼ��$�}��?2�r���k�����d�o8f8��lV��P�C}˹Ϛ�s'�����p��y@��<�3@>�)��~��g������+)J�      I   t  x��T�N�@<{����p�ȆH�< �pʥ�4�#y�����q@����Xz�^�D�<��+���{��k-˳	9M>{�`���p�݁Z�`v<M���s�}
�;����Z�����֢q{l���q��Ic!'T?�Qy.�%K�l3��.�s^�kO	��� ���i9�&��>;���R����]z����������P�e�-�!��p
=�}	�w����Pc�:}K/\b�n��թ|U�%��o���.���IE	��U��VA*(���@���%�U�}���;~3�l���(l5Z4�X�ʄti��'��6.�-�?��0.F�smn9��6+��¨f��&z�g��@s��5��4'�,M�2���ƿ�T�c)��C�a/��kd�$
�J�V�\���-~�Y�O��xJn����Q#�/�#[3���AV�4�5eq�p�?��e�Q���r�=p�MK`������n��5�R��s%�C�1�\�QFS9-��N߬��S���x���*�M��X��Zҳ�{sR��Z< ӳ�;B��FLڔ��й@���{&��.�XA�A�= �q�[ �:�i��@|�B�h�=&�h�I��w_��{�۸[�z����
A��4      K      x�3�tO�K-J��,.I����� ;�\      L   7  x�u�K�$���U��L@|IT�|o�pÛ��0�����̠�U@/5��?��n,�5�������1�)�j�������'ߜ� ~4P;�ٌ3'���G�c����_���ߧ�ڃ��:���Y���z�N9��z�p����k`�����>G��a�0ռ�W�:��%lVl>���| ���	L쇻�>2G����C��T� g=���n��@�5TnsPu���=:k������6;%�:@	��ڥ�T��ڃ�h���Z�:�T�I��v������v���1DrL����߃Bt(��X�-˼Q�h��l��d��8���s��#n�	H�ZV~����h��T/k	E�";��M���a	�IS����ߟ���!∆��M�Ja�t��a�U��pe⛢Jxp��kr�p��6�"lg���󟟒l?~��XQ��T��r۞���}��Ƙ"����v�G����B��DM�Ή��E��W
����5+���(��Ɲl�6
AHAuy��Y�靓�w��W�J�
i'��U�R��v��tJ�J!��3&�;��*�[E���^�E�м<�5
��@�AE�z'�z��/6n���b��Q����Ѭ��a�p�Lj�Б-k��ѓ F&��ތ+5W�A�����W��9�]wLߡhp�%�ߒ��
2$e7%�]i��#j0�@�cD�gY����F��~E*���^^8�a�a�c1{qs�"��G$8�(��S����'hp�,������p�� �f����-��|:���.�㨍m��V�CL��M<9+*2�w2I{��+�Q�\�'r�c�f%��*���^���AA$j�S���I�I#��VE��E�>`~�l��������c���_�Ɇ��m�Iړ"ԍ��I��J��*�!4Ț�]�F�T��p�):b�c�Wt����yr^9	��;�~t~�	+��y�S�r	�/1�{S�%��Z��˗�c�@ͺ1�Cx�Ƭb+��W���O'�o�#�W?;	�����(ꖅ�<F���Uu���]�
�R1����~�m�l���PSI��N�����z��J!A!~��oJ
��7�!�y䙺q�]CN�vZ�,zPoMR��^(9JK�x��{�����R��<�9�24�;�2�K�uj�`0,~�Iz��Ԩb!c0��IƸbM�I�	��aH���9�$�: �B��yM�V=`��7�A�:����p��۽0�)0���7�y��p1�9D���f�B�B��l`���<W������L��Q��2>^��hs��:�1&q�;���*W{%�9oO7̣>Kd)��׾�ew�_�\��N	!���q3�C�[W�i8&/X�ղ{Ni�Y@��g�)F�V���(J'F[᎚4$w7b~c�V�ѩ�o���S;������P��8�v}�VA�X9ϸW*�| ܥ��%o����5�2����bZ��-�쬘�6�rl�8#i�<W8%/ŨP�B�����p��p�1s���;/��5E���
���#=�zV��qia=���A�=�U��J5��26�?hI�>��%C|��j*׽WJ!��Az�☌�sN4�o(	�qc��b=U۷����oW�Y��h�]-F�C�1{�L"'Ķ0�^@[rHѾ�o���?�`3�oԙ<C��}��ZMX��b�b��:-��L#�1�tK���7윐=
�J~0ٰ�� !b�m��6?�n�.����F�l�Ct��a�ޛ'�L�W�'��o�S4�!�W,{0�f�΂��-$E����t�6bV�k��&:}��|�ܹb�֦�ȘLW��T5���[�'�w��wٻx)�xMp��$�`1I3�wgK1ҽb�s�1�N�g	�FQ�`;�#��׀�K�����$�

����Sg\����F�됂����ؚ0�X�6�b�a����=���+:�;Yn���R����z�B�h�� s�4���*����`Г�g��:ǩ�#ja����@�`H�x����ҟ?,���x���� ����)rxr+`��Plַ76��Z<2�����Q0(T����r���[Ɉ�6������q4�N�ih���#TӪ��q܄Q�,T't��!5�`���@�6J!5�b����pj�z��#}{*L6�5��(�ؑ���C������766�G-n��)�ӌ}b�gE��wܥ!��bz�-���!Xl(�P~�9�7NC�������	��1�z���f�s�蹞T̗�T�˶�V0&�ӫn�0JYDq;�:�ΕӘ�z�A�B�� ��[���b�(=)��<�!�x��,`<|Nf�/M�h�*d�3��z��nr�����i�:qSR���g,�.���B�2���Ȏ��.{�����}�xg����	�˔�f�i�����E���5��Yx@CRzB�4\�X|�Fgr���p}a���EI	s�/,^]c��	��h}b!�7��KGH���Qx����i��5
��]�z~�ɺ5A�#���F������Tm���|Я[.H!H|ݮ88���׏R\�뽆j[��=�:���b��Op��>a8p��B�5T?155�2%��������Z�s���0�&j[wk}��2knq�����nW�-����I���f�_����b)>Q�)U_�=Ud��A�4<1mCM���Ǎ��Q��}Q��ے�+�f4Aμ�A���jq��ϟ��d����$@��v$�*w>��������&�/�1���ɍʍ%�!1��ݞ����#�_g�8��p=������E�)�bT��b�#4�(��q����@eMS�lX<u.я��Cs[n�.��e,^�ƺڀ�O�.l�`1X��8���3Bl(n��~�og�+5�՜#z�5�;��<��j�,�RT���_Xr�]r��z�!C�'�acU߈�>%$�\�חU=��=�����F\	�t�z�6LVE�׳4�^�~J�ӝ�Q���ɞ=����x�БW����JC�4�h�(�������b1b7jCʫ�[#�h�%��T�$�&��k�~����������X�^���a���o��1
gqK~��7���ʭyU�j�f�,�R^�wW�	U� ��2G��?�t���N�+y0�\}}w�Y� ƌ��ŵpk=���Y�$.rbp�����(_Y1G�6*������g�zr�\��ʊ<�19Nz-8�9�:���J��f����!�G_pqw�Z#��w.>沁�K�|���xoM�~�Yt���5��p�z�r��g`=ݎ1��`.۬�捅I<�o�}��z�j�ژ8ioްU~0�d�I�ވ�2�Q=*r�7�	c	���,��m%>x�=%�����&�b��Uw��u;:�a������Ÿ�����δCl\���Ѱ����(> �`HU�1��v��x�m�(知��I���'qo���#$oܛ;g�hOܛ;֗��\|s��ci��&����#�}�H��,o�����n�Uw�Җ��;���3�#��+��2�;c]:C̆A+3s�N5�}^���`�}7������7��:g��׬pRV�5��6��ڽ@�Y��A�9�Q���#��Ω�P���S���Ϳ����-\`�      O   M   x�3�)�LLO��2�t�H,�2�;�6%5�˄�7?/�$�(1%�X� 5'Q�'��(�˔�#�������|�=... �o      Q   }   x��A�0ϻ�A�NZ8��T B��G��|Y�F�"���B1x�$�A��NY����lTAu������S��R�ܨz����0��؜����'�0޴�ٙ}0)fa
?����џ̊�1O�.$��-R      R   �   x�e�=�0���="�33�ud�\,�6J�cq
.FPP	e���g=��(x��V"S
���ڝn��y�sD��il�=Uv���cHXU��Þ5~]���Φ�,�d��/g�P��{��s��wY �#�Z�      T   }   x�3�4�t�UH-.H-J�,�2��KR�R2sS�J��@Aǔ�Ĕ�b τӔ�1�$Q!5W� 3��&����Ji3
�^��P4>?/%�(h�i�b���j�%P�-3/1'�
bT� �72      V     x���Kn�0 �5y
�v93$%q�:.P � �n�qX�A�A��E�^�+�H�+�MpǇ�p>��}X~o�ʱ��D�I�a.��$��s��rő-6]#BՖ��%��0��~�
4�sp�>8�wM۽��f_�n�7吱O�z|��j{�C�־>�x@ XMV^�η���fV�|-p��h
���x2��P9�>T��U����E�Jq0=ȧ@[� �A1�j�!�A*�ˢ`7�b\*�T*�(ٵ���9�%�XҖ��ᴖB2���ω���7O5�<婍E�q�f�ܿ"�[*8�D�����aW��p彯D��]#v.�z����?4���gRu��ҝ�B����w����<
��	��-���X~�^,�+�m3�DO�*�2�H�Js:.�	'?M&ہz*��0��D�L�I��j�5�k�:T;W�#���]$ŶMW��b�s����T�8��E��[../�ruu��>"=C� �&c��l��:��~���s���S
      X   �   x�m�;NAD��S�	l��C"�吤�i��f���}ً1^dU�R�`G��(6
�q/�$(^úp
2r*���i��3}+����Qs!�����/u�]1��x�4;RfѫG�����	���v�k�5�G�$O��O��>d���t/9�&�8\���+3���#�5��x3��d��-{��8�`m�*M�&t��x��@�_A"k�      [      x��}KsG���5��nG�|?8nu�%��",K-�3��( �d �. j���%�����U{u��?6��*�	� H�,�H Oe�<�<~����7I7KG�4��^��"���<{�k/͟�t2N�䫧�g�	�f��e��!W���Z
)uK�|~�LW��P��Ya�j��O�Ceb%�ấJ���x4-�Y4J�i:H��h2L���#�^>�$����a���n��
e�v-�������� h�N�de�q
ܴ\��	l�rkͥ�-��9$~�NTx�Z�����"KN��-�Cmb礴�����+�)�L��Yd���g��G�5����Du.�1�[\H���h��z���(e�,���V*G�*��o'��Ju�U�xF�f��8�������K��pT�d���53/re�{`����Q�$���u��IuN��}/)~z����o���WO�k�ʧ��<K8�I:�??� t�J&�� �����߁���ϻg�%c��D�o<L&�dv�N���|����ٯ�^���-p�I�o�"��~��E�{"�<��I�$꧝����`}RD�S|?��³�� ��g�C>�'�r�tjW�
���J2s˹-���ZS�1�H�Uc%d�>�Z�qf[�V<��'���)` ���(�����V)/ j[�d#y����Q�󖨕M�İb��9ɱ5ȧ5�%'�� �wL�D#�]��D�1m��Z���&my(RJ U�7i%��4����v�0	��\��j�~��P����&bm-�b���	ť�Z]�z���6��"M�f� B@�FW�Zْ�\�*eӼ���D�t�D�$�ep%h:�%kyg���"���R��
�[�����Ҟ����9D�ck4,"Y�+k ��P��(G�b-��QC	��3�G�����!S��4Σ���Hh�o�c+�Q �FR����tW��L\�T$$wZ��j�XJx�l_n54hK5W,%P{�d, ���)�@�p�Ke���֜Q ��� k٥�u� �9<U�E얠$�ԡV1�O�v�_îr��g�}�aܖ+��w��K&i���	����l:�G���q
s6���ܺ��"���gSةi6�����"�t�Âg��DHrs�+�|K�j/��g������T_z+9�d���'p���]X̕ۓǃ4`��»?F��^,9��1+��q:~S�t����c�'ogI�	�'z�fE}���I����c�E�������=��ZA%�4�r���t��)�N�b�s��Z��`�i�[2xQ�ћd6�x�6P�G��Vv�K8)��iQ�D3��B�y���--	�:Еo7��4���� /�;�����G��$�9=l��g�^����}_|?�~z�Ϝ�g�)�ls?o�w����@^� ���d��^^0oɨ��/_�Z�ܚXD��Ӄ\X	��`9��̋��������#��A�3ܧݳ�n2Y��:�x�F�0�!Ҵ*	f���^C��a�jM��Q��3�ԯ�;7Փ�P#+���-��}�y�N~��:K��t8��C}��ϰ6&��|�a5Vz�wH�atz��y2�-2�|��[�W��hNx��P����
���γY�Iq��4��yB�zzѫ�S�3�XJƕmiw���a�����b3�����۳���.D����`{*F!�ɰyh#F�k <
~)yl�8N�+Ɖ�Զ���9�� u�9
���1�A��e3�O�1��k��=��I�q���q���\r��c��-վ�����lt��q:7@_�=���g/_�3�����J�\�����#�-R�ѫ� Y�t����I4�
�'�y��l�=Ŏ���"&��B=�7*/��d%��Pʗ��DL�1B��[ �v"#é��dtCN���|���Ns��(��]6�/�s��L/��<��~6z��+ۉ�E�36h;�9 {	�F�g�|L����� �!�9zm�
q�@M�п�m���?����4���^Tp�O� ���i:!����>�>���3�tx��^�o�j��"���=)1�O���RqaY^�\�x����$�YF{3b1��[�Z*+|��h��D�1v?��e�~	�1�a�B���I�W_��%%l5.b�4��eĞ�?��CO�{���8��YD�1W���2�������o_�=wo�ݯq��Ǵ$�g�=s�sKN�5��r�e��ݹ��)����&���hy����a�h�2z����F�����tC���NZ(`s��O峯&P.��g8����o��ܛ��(a�@�
t�
T�C�b͹T�el�ˊ����M�xO���ܾ��=��n�␱X��M˻�*xӄ��fV�m%c���,��fY�&���.�۪n�í+s�k���-��8QU!7��!�NnpDj�9W0%�	LI����� �[fuꋜ�cg��#~��ϧ�i1�D�qј��ߋ��|}(a�y�oYF9ҫ�ǚ	4%hK	4LJ��/���m�~��{�������j�\��{�ܳ�5�kjA'l�ʅ��"WA�'��h���G�F���Neϲ{�ݳ읱,g�*ȹ�^����.�c.!)y�\̼�^��nn ��-����5�J�/a+
g0k����o[S�g�i��(�@
�V@�ݤC�������t��.���� ���'X%�%7x�A��]��\?QG m�� mO'ڌ�5�Tf-���X-��� ���V���)�r��E �`)*M�	X��u�Uf壹 ��y�G�?:�.4S����N����]�}����<�&�b��?�i�����h#AmZN]��.
��9�>pz�{�U�#d]Gs�Vld[N�	�d��Ǵx=��������/�R3͡c��U��mh*.��H�Z�V���B�o��i�Y��ܫ����*
��U�{Sd9�D��Pp��?Χ9�'Nʏ�#�$����,5:��K���ZͱF7�
����ZT�F�W�ߓJ�#��
��.LP�0�d�(����ۨ�]���0�����I�����_�?���D@��1)Yk�u˳�vW"i�ug�����ʴ<�6PS�~u��غ��vE,�`�ŒXa-/�lk'��(I��n46����kE2D�������O��;8)�1(��`�Ӭ,���$�s�����������w�d�3�8�u���Zݏ��'|�_M&g�I�]=~Er�QbB,�5�*������㗡�(�ǿ8�w�.û�d�Ί�������.{�K�I	�=�2h*�c���;j��W���'������~�7�;	@�H[n�����y{*xh�`M@Q5ug-^������9{O���;.��g��O�a��M�?�0��B*߱8�lOw/g��\Pl�Ǌ9��I2ӕ���6J�NR�I�;�p�9i�хC�{���LD�����%�L���H�F�X���	��� ����=�|�$�x��Ќi���!�=��i��H�ܔjt��$�܂j�����:Oo�#ߧ�l�
��:|���%���U�����4^{�������W�f,�ⓋŎݧ��ߘ�����Q7-�f�J�3��u����c�];C��t(�+�%����]zW}��G�=��t���z����hɄ� (��k�P��\Y�˽����|D�M�9n�&�,|O�f�BR^Զ&���Rs ��^��Θ�n��k�[�J��.���N��54��.���(a�	����^ذ��',|�"����6����F��_p�����Z�/B��q��Y �W��Z�[o�\��m&*���0��.�Œ��J����U��N�()��(9�ìN
��/��v�}!�;��i��]����P���~{�/4�I|�sz1��͔���\�K�7+@1{����ė�r�\kjo ��J��_	���//ô3RR��O�~f9�0�8Vg�jC��d�9HCc��K�j�9,O�����|�6�Dd��uK�I����h*�u�q��� �W����3��^?j��~�u�h,$M    G��;�x�ˋ�R�3ͨ�i��q� ��[^o�8XF��SBRt�~�r�Ny`K��p��/��g�A`Ts�Q��Q�OI�홶�F��v*���2��t���� 5�c��@����SM� ~����W�5�5^(��
�FY΀_�v��a(p�y-��Ppic阢h�J�p��z�m�,���py��:�0M!?-��X-�>�B*��$K`�H���a`,�jțK\}AOKu�t�c*B�☤�,`m��V���8��[���%ȍ����s�Z�$�#Xk)�r�*�
� :�o�,-Hd
X'�7�Ej"�a)����(mg��rfݖ�Q��9�Ⱥ1��n}�U��B�i�!��XG	e_A��IsUB܂�t&� C� k�AՎDƌA*ӱ��'��h)�fl�s#�.V�3!Zf�R��+?nHXl��Fٶ�Ӗ�����:k��ׁ�-m�pWC��p�����z!�~�ˠ�����TGMobý4D$�$����{w�2��Ar�'��M�Xi�+lqK-2�Dj�AQ8�,o@��621�ʠ�9Z(Jϴb��)�;�{c��$����|��«'6�U%ȍ�-��ĤP�z��4�Z���j�a`�Yډi�Is�b��Rr�-a}J�:ʳy�Lz���t|�gya��y�P�~���чq����+�>�����Co�t�� ;���x������X���(�Ug�������8��g�����m��^�C��X�j�b|��)�8gIZ�}��?M�>�)���<�^���٘C0�C�O��g�3��H)�vhԼ�WK�@����Q�$��e:�(A���0~��J^��T���T��By��m�eBT���n��m=�Zm�i�劑 pb�զ�Ӝ�J��sr��4�;�O���T�� )#J������j*���$)rH ��'e�F�1�<Hg7���K`KQ+�\cl�Nf��x�����U�qyv xC���êP�����)$���q�RԽ�z 9|^r/����[XU�yU��vT'5�4L*H/�	��T'À;+]q�F�P�Llf%mĖ���t�
b%�v��|��.�����7[-be!��2֘I;��K��@�Hx�I��ɹ�Pi�n�m(�i�%�D'p-�Z�w��v���K9e�;�����$�=��2��k>�4T-M���G��5��1�\&�۷�-!��O��o�y@4Mz��4a@�6R�ح��΁�Oec�\W ���r��No��ʤ׫�1�ƕKY�#��0a`�f<oo�lu�*C�jey�HpL{��Ü�`���,��Ն�� JG�WC�>������/�G�J���/%�y��k�B���*�4��RHg�]�4ސ�䲤��n�������^~�
[�-��֓$ {�W#�缛/X�bf�"���ĺ7$�=MOJQ��7Ge��|�i2�)qv�������X��n���c:����lt�C�@F�m,*�r�w1�J[�����:���NR�#`����{�]P&��g��
��,m���/��Z����[k5ͧ�ϒ���n�d�
Lq�-���+a�\��ϙ����D����e��vsw�g������!�C�_���F1ӥ sx�&|���a�Zk�Q��f�J�zB��8O*u�Mg-�p�	�5�!����)�,�%��!Sm5؍�aB����dˢ:Am�����b�u�g::+Rso Y�x���(�Bc!����n�ʒ�0p�$$���9k얲0M��14OW�᮹ېG�('S������lH�4�9DX���im�Ε�B��JG�2Ma���:�H�s��H$n�++h��̴>`"l�	���L݆���K6�l씧��������m-�h	ݼQ���W�V�Q"���ʂϷ��<p��*��nezy���;��3hz��FT�e�p
P��$�u���]�j�)�׽��Zo���J+鹦Z���w��NKh��n�$m �4�����f��p��eG6���M|L���w�y���d-p�b�
�w�����o����~w��fJw�e(�Gz�ƈ��x�'g�9�f���	 S��d��f秌��9z������I��f�޽�<f��Hm�,������Hʼ�I����hp�!��B���i�d��Oi�����Vm�]z+����g�B�UXM.�6��+�1+a^_���R��kl�vk:���iW�V�Cɩ�����I_��Fu9��T.�[ze˚��7lb�p˛�$>�9�VԢnO����S��2��M=��&�j[˔�Oe�.�I!tiaUsӔ�d
�
i�w���g�-EλQ��B�.B�������F��!;	��;@�⥩�I/-���w�I�XC�$��
"��c�n�4U��V+C�hvq��[|��*!��'�k�4(Z>^�[a��u��0�����4D-R`Cy��8)���������y@���E����p2\e��9+a�derD+�m'˥��*� 9F U�s��]T��dkI�����t	rc`K�7������]/æ�m���W���l	�6���Zm�����~��9�k���|G^źB�rYf|�q.�a5�rZ�x��)�Q����ף
Q٠tM��c�>�_j��N�����
՗	�k�vK�{"�	� Bh�}�>��1Nր�U��m����7��P�F�P&5��ͅ�]��G
 �8�MB�)An�=�A'�kʪ��P�ꍢ��»F�\��`�%��ߡckB}�!�ZẌ́jIv��>����p녰����>����%���x�����W������_߲��S��Ӳ]�z	��2=�#u�O�D8���ߦ������K�7o��8�L�~
)���P����^�'��g�7"�۵r���)P���iQ*�rټ������&ʗ�1g�(^�/w[�CRz'����w��_=��7U�KK�������tY�&��x��M2 9�(��)8=POD�����F�}c�r�=�m���x�Q9V�A
C�6����h<�QR���qKYy,�7�$@�K�=��;nٵ�p��r�#`6�G����%8��t�9Hj��c!=u��l�醗`Q���	�$_s����6��T1_��jULݯ`[9J������A	O��W�gAX���?8��Q��@<�f9�tic%��LfD����7�K~�f�|���T=�e9�d�� �:�m//��TE��iܕK�Ai!�O"��!U�.A-�i�,�v2���-JIDR �T�F|xu�q��-7��vdUT�{@5�	Q�k_ւ
.�1��k:^�2T�D���>/����܄�ӄ�D��a�0B9���3jyL��uLyFF�؉$��z�q˹�V�R��r��y�t.�W��=�f��a�м���ݠyE~$���k� v�vs��KEީ0s����E����t��p;a�*�k� 7��N�-/�R�h��՚�1�m ҆J[ν�-v��7Tn�b��冗�d`�%��`%�@�x|]��z��%
F��%Sv�l70�����]�fqt��&�n���5ů�^:����|�~���ۜ�&��L.N]����tл�*��ZA^a��9GP�eP8��S��T��{�w�������Q��cé'v�X���,ѕv��$���<����
������YP�j�X�b��}q�jG��$͑r�EK�N���2�w�����B�.��Z��NB�t^�Xd�mD��.�'k��/�)�+�n��YPI��$:-����N����ӧe;�lLJ����$��x���d2m�8&?�#��$�Ɵr��wd7i�NϷa�v�vx�/;����L�x��?��Iq�N���t��G�6*��0��W��̥"�/�'����6������ٳ�SdE�ʦe�_=Mxi�6�y:����G���D��D��T=m��cZ��_����It4�d)��,����~g�����eTS�J@5��x�j���KT7����T����9�F���1���t�bI���g,���+���vҰ�
�{ʶ�He[��kw�봵��O� M  �����4|\J��W�����	=^"_H�����|�ui�x#i��n�\�iN�,'��I�N>�U��@��i�=�ap�D
�� �D-���,*�(�ϑ��<K�p����d�q�w�y���E:��v�f{�w�H>��#�c:H×'%Ew�ɥ `�K1qJ�w��CjV=�AL�X�p,�t1j�.��(�]��͆���-�	'��������|F��?�w�r4��^�ĭ^�.�Y����8N�oew���a�~1$8t�����˻�a��O"��H=%��q��Bfw`���:�a�%����p�����Ekv�}N3_�������[�Ē���%�,����s�tKXO�(�Gߑ��c��!w,��x����[r�_��Yb�_KP�B������d	�Yb�_K��bc4Ӫ%��)D�B�LJA��!���Y�|���2��5"�����O�%�λ��uzme�nw�̴�B1�QI?} W?>d�X�#1t?�n�ΐ�z�ۗV�]b`��i;)}[vS��w�N���B��Q9�Q;C�N;Im'F��*����$�6s��e.���
��4>�������d�EG+�f�o�#�k' ׶�1�c��N���#�t�S!�Sv3Sfl�4-�ˠC�w'�e{݄��^���M���PV6�t�4��bOc�T��σ��f���o7�t�����I>����h�G �M[�^]ƫ�X%��9jFg������;;�R��_��Q�����7���T�c�����^�r��jo����ڭ�����{�b�!���m���"K`�������AG�UY���(m���W���%�U*�m�o;�xO��Ǽ���`��J@8ׂʤʖ�l!���t�z�X���D��@����β^[��2%z�D��'7Z�� �9�Y�a�"p#��s�'0n�}k`>'\��6S���	黗q�>�1v:�Yz=�;��;G�_g4C~c�Ж"��B��[��ğ�"�����t=��IP��$���`mδ�uM�\I-�=���g��7/��G��)#�Zהvd��T{ޖ}��U���t����s��a���WNr��>n�Z�����      \   �  x��S;�[1��S�V�W�x��i�`�ER$��FJ�ype�P�!}�_>>?��������oCH���㍥|�G�����B���}IZƹ��F��b7f�:�^�".�u$̧��p�7ޥ��cI1�`}�EK�(�o�83['�|����^�i[f�a8=�{q.1|{���o5\m�����\h����b	�H��R+��7�R-���<d©�������Y�x�E<�ȓ�N�N���c���t�S�M?ӣ]�oi�A]�G���o��Xc�+�}{���`b9�lE9RnP�`�w��$ݛ'�e�k��B�L'ʉ�Y�-4�IR�1��㯚��[ƒFP��S�,p�KŘ|""�Wd1�ΰF�զX�o�w2*� ��ډ�Ȼ��-�5Wyp_ל�/�L;      ^   !   x�34�4��24��4�24���b���� 4��      `   >   x�3�(�O�,.���K�QHIU�MM�L��K�2Ɛr�KK-�MLO��2�tL�������� B2v      b   �  x��[[o�F~V~�@d[@f�~���N��u�i#i,3I����b-Ч��Ul�P�mIL-u�FBND���}��I��Ŕ�a�F8���|�4ֺ��vvݻ�ey�}ݥi�֛���2�u�f���?G{G�mj#�������.�3Y�Z��4�gA�Q��������h���y��p��t�8�ר��Զ�A؁�^l�Dk/�O�
w����l<|�9�_\ܡ5*��/X��@2-5�=�.'�T)��\.�m^d���泍�g��
l�Iz������^�/���אM�I���563���T`��5 5}�$2�J��6�Ӱ���5��릶��ZI�6 {�;�����S�8\�1B:�]�����/l����q�>�q�������?Z��+��~����<��4�o/\�സF0.A�I���8�$%�7�_:.A.B.��6K�����8�0�-l�q��h�S'l'(���@�t�#���:@�̡�=����c8[�ٞE7�
�X8���I����/^����`���������zl��69ȩ�!�!ޅ�,�D#P�K
,3Xh� ��L=*ib�$4 ��̠��+Q=c��mgNk�JkRH�k*���4�4�Ԩ�6�>�4��<��~m����sp��mc�m�]�t��H��8C�1����$�I�/�ðm���S����dv��ٹ 4��aL2���8��1<!Ӂ"��Us.nCB��eL���C
a��1����12kL�����-!ާ����dM��� �|&&�\h�?�]�1��>mb�$:����y2�����"Ȼ"D�� ��&����$@�0��0�2_�wP�[<K  @ �l��FY�/p�a2�\� K�0�CW�v��2�Y��5��ea�!���>0��Y���p�Ԃ]����sv0��￯?�˪�~}1��^�P��s�n�hO�>���/�\#b�0+��h)���(��@$|L�r�+:Ӽ�Ή mu�H(P
����0� ��*�4�1��9��%�G �zz���"�*¾wq�*	�n��%X�u��!�'Qj�?�c~�x�[�R��?#�+AI�k�(��f�`M/)�ߋ4��1MT2�*$�S��^$�R#r�g�#������8�L��0�  �q���=���*){�Ҩ���0['��a;�1�ansY�Ή �@�ƅ�J-�9�5�9���f\�/38�(�w8��+���b�|YX^օ�zp�Qmx��[]���Lj>,�"2���)� J���x�HN���C��������z�"�l4V�C�AI���է��8��y�{N$^#3(��B�eO��Ao��r�rʥ ϠFA�3��f!8��0)W��?��P��@�������6��f�
R)T��\P&��Ӡ^�-�hu٪��Pi�%��/����5)���7O��O���д�v7D����+��T��K�Q��j
�dx���c[�P��箳̌��ò�sp}�ր#������m��i�W<��� 0���)���=/P��uq�pe�GG>����u|}�:��:����\{�O�(C��)����^P>/ji
�E90��O�򴛟���AV��Ǹd�ϓ��s����N����_=��_��I���d��J�f�u!h���}cQ�Ekǡ��v�+�<[ �¼�/í����V�>�V����9>Z�9�f/��]+��7k%}L��J�pl(]��3.�K��3Y�]�
,e䜄�َ��&w/�d���n��x�o��Ln}[>��5&*	#���a��E������W{/>�ĉW!hN����}�sj����7QH�&y��}���^�U҇L��Ģ�y@��lUQ���fXh2#�ba+&�DͲ��xs}os�CbqJ�,E+^��㈁�f�R�ߦ0���~}����T:4�	�i���UniQb�Q�*�d��F���42�R���_�s�{�	�!v+���Z\�FlB���J��z��
�~��}[;s�[q��z�k;��Ŕ��q�@B��n��<��̍�K d���?. ���w�C�yI�q=XO�>q~�u��g��$i^t~�>{��y�w�UG���6Rv: [N��\d�;�R�|���+��Iϐ��0F��	(��¸�E'>B�����v�FR
Ű�h��ƙ+ϭYOT�y���,~{n_mD�J�"g���>�Z����dzk>0O���>���z��;�zjٽ���ש����Ԭ���V�{,�,�nn���l!|b��b����z�xMٗom�}��t;ٛ���zVfzֳ�	��^1���yk>0�>�'�X>�x{kw�Q?^;q�������/��L��i�M����r�_X�S�sE��D`��b�����z9�p��
T$D&(񖹍�#���)m0.C6��Śk�1]��	�F�
53|�����$Ԑ��k&P�5f�Q��
��}+����7��nT�^ �ŭ��(Y�@i#��l�F�	�X��{��&����&c1�=�����cU2���|�I����(y��~��"�{{ϟ���ZE���a��_�o�?9���پ���,O
���צ���wɸrxtm��n�����~�z���>,���ZhΉ���Z'��k�\Q�!�5�
L%�}��1lV,�-�^��ۻb�s��^�lw��~��aV&ȫ�+8�bXK������ٶlx��������5�{��k��M����0�H{0�Ҩ��/�����8��J����{��Co@J�R�r��`�w�E��	��ʌY��xK�6\�U}o\Tv䍺�f<����t��|qc^�^
�(��+b��}��e��
M���d���e��1��[c��|l�[�">z(�|�៙g��C��ܰ�t�㒱��	+��#�	5X+�b���;w�<��b      d   �  x��Xˎ�D]{����թ�e6QB�1�
)�)�]?Z���A,P�X��1�-�=����%!H�dƏ�8��soY$��E�݂�~-��vɞ����0�>4]m��3M��V�e{W��)�Ʋ���m�}���u�:�~��_�?��6;_ml�<]mZ�������Oq�~���6Œ=�Mc�E;�p�����+M�(Ӻ=~�����<3mm���F������~�荪��3��;���Yۦ��#.{W¨g[ֶ���/��>2�3oE�-w�{�/[�D�H�2I�Xpɵ�:z���'�޻��x~�w%T�u�u@���[W[WQnf�dG�<�w�Ƴ�"x�I6]њGw!f^ޙx���D�y�x�u&�<�->	�*��_���X��J���֡��:.8��MK��5�ۺ15~+�DB�D�f�-n}�k��%{�[[3��a�V�ܩ	UC9/�;oϔ& y�K�	���,��_�G�?b�A�3���kI��̗~�TC$�`��K��]�Q*c�:Ot��<k���"&�ʭ(���i��S�>�DK���E�d|֧�+��U I��BͥN�3�f�L�ky^4��8SZB?�-�h��{7��G�r����X�zC���T[�7�"��3��fp�M�u�u������Q�5&��9q�����d���T�8�:IgS��uw*z���ܼ&�ts���3�#��!b��?m,�Q"1���|�p�WL⎹�L�������[C���ѝ�,H�3��5G�
֬2 ��;xa�Ӥϳ̨�3�D�d�!"�Y�gY"f��ִ!]�q����P'�'\�L�\&|V>e�@w���s�4L��D���S�֜��O�0=��C
��Yg2�����|<�rl��Q@Pvu��׎��6���n:(U32�}Y]H 2�*cD�q*R���!��y�B`*I��)]uk.�3c��5��D`��u���$�_��tY���E�B�*�	%jF�M证���$HR��HU���4�M"�g0N�&�@^���~3��܂I�.8WJ�Ts��I>���o��%{�d����|�/�vsSQk�u���I&e�fǢ��x��o��j�����D�ǳ���(��(*p%xG�}7�{���u�4a�&��1+[ӝ��~ڙb��0�������K��/���9����{ylܑ�v>�nO0�H�=K�Zw�D�X�M��i�~�R͑�m����ř�A�h�uǚ8��c���E����E�ţB��9.X��5�\rA�b�d�R��żҦ'"u���uuIَ�w���B�C�+T��2^��+�]V�#�x2s�[�3�z�`6#g�UH��8�Z��l���ɡ�����?$t���5�2�ڮ��{����P��d�:*�l�<�o�bn&�]��@(3���`��X��ƳOG�l�:���W]�c��*�h�qdk׮1��+p�vKᒦN�(�9fV�}}�����2�((��1�*G�ѳbh���hw��mw�;�ӈ4����rb �{�v�/�W_�<������kvt����nQ���U��I�QT������5�Pi�С�+[>�\����,�:�1vΏt�zWF�1h�g��ub(�4�ѦỄ?�(s�Y�(G��F���"�(�vk��O�ߟnO��Ls]H!dk!�R�.�4�RF�䧡\?�<���7�8�@0$	��s�>����������B      f   (  x����n�HE�ҏx5�zvu/� ��l�HI�D�z~�r�-�r�� ��U}���������c"@U� �'?����ۗ��'hPc��9M��!�����? ��(� h��crRF�_�Ok�� M��Y��F���W7S���5u;o��cS�L�.��s�HRp����braQB�|,�:����R��&i�(���a����L�/�Ӫ���f_�e�>ϬXL^)D���!���o�"�-�ֱcY��%��Q)z�w�cK�?���C�X���9C�X*�ޤ���,7�˃VZ�.���T2c��,�,e�K*y"d���/Eʽ�E����F�����M�c��`���!��j�Cن�?�<j�;�Ȯsy�b�7������uyĢ9J6���|w���f�Λߍ��S�C���j{j���Ì�%/�u��!�8���``4l�-��I=Lt�z���=�M�UWLH5y�f<i�YN�5Z�j�Ej���"����S���J�o@F�#��医�3�a@����chv8o��\5��xH=N���[�E�f6o���>n.�F��,�v���<�у��\���A��DY��S����h���q�����
B��$z��M�C^�CWL	2��t36�E�"�~�}�n���t>��j�oSt��Xh�މ�Ln��$�o�9^QtPK ��e��2��_ �U���?ğ�^��Db��/B�w���G�̑�Y����r�4�CYo4O%�^[��(�>4�I~�G۬/z�,ϺZ��ԞOi��M�@�HQ���t:���\A      g      x��]�$Gv�y��1W�L%���v���"٢@vH�B���gfd1ԑ����&�c}1�Et�K�[3��p���3��x���š4bD�����3;v���`B>c�p+Οs�\��>k޾}}�cs�f�����/?��b�y{w�ܮ?�Ο	s&�����b}{��/� �t�7�������������i�,Q�u���͛��T� �t����ܼ� ��ϙ�1 �9�O�pt�Sv(ߡ�v�������T�/Y���s6�r��
ϸ�IY�0�ᑥk�%�Ivn��ػ�y�2�f�fs3�};"�g��u�u��m�- l�/����nu�[�nn�����bw�������/z�=���-,:|@��ZX��>�<��|���s%gݰ(����[4Tt� R%��щB�9��rE��<���^)В�Z�$�j޽Z�Q�Kud�:�,X�y-D-�����e��y�_b��`��zNU�^�E }z\;��T.������{v�D�7�سӈW��~��W��f}s7��I�o�<�E��M�$�����n�ٳg���w�nW�ϳg�����J=<��6��e�������m/��U��n���C�����퇯��x��J��6��m�ݯw���������ү��o��i�z�P�?�٫�fu�<�TNZ�ϸZ�0�
]�8�_m�w������z��Yg���3n�w�K�L~N�<!U����U��/���7��M��D� �
��o���o̝)�BT	��&gbJ���=�g�������Q��(�Q�MV��w.q�gOn�*����U�����>gB��n����d�k96��<u]<�0�K��c˒�V��%���>#252]AhLL��w�KH0����~�f�Y�h�b��yU��W
+�q%�W�q>���4��=���H��6-Ю��ySO����M�M>�Tϙ�&bNG��ޒ�VF�|9U��-�%1������<g6��Y��@�l��D2H���d�"I��+����X�	��z�1L�H*#uː���YG�/���n�9���y�%D�* ��f%^A���k�Bf�%2525�i��D�`N�cLW25��=2m>�T0Cf�Df!#�(4&�*zf��:�LCd������DE���QG�I�u$e���a����=�5Lԑ4��.#L�:���N�:R*�DiLԑ��cp�f���t�elkp����?��>�1�dJ��6%SQ�i���O�ǘ��ۨ��n���{��<��j}���ފ�K~e��{f��{ߜ�����x�~wt�����m�M��������[���gS?��v�ur���#����6ow�0�������f�����UJk��a.<!k���MOz����z�}���f�!�� ��C�`�}�[o���ޗ��:�r����Ϻ��[��J�l9 �ܰ��5��3���[	Ck���V�Ќvs�J�O��O����^�$$��0���K����"��5�ڍ3�t��v��s�q��3t,JF��~E璎��}2:ns?�L�)�)_���5RD>�I=�U���+�7=��mq�$Σ��1�/�N�����l�7�o6���S��y?4o���t�r�:��� ��4L#���A�e}b2; i^�^7r�Z��=���1��N.��J6C�}1�7,�ۧ�F����v�������q��]��#�Է�~�IQ�CD��׸D!�&�Y�!�OU!Y����S(���D�
���� TA iW��/U����/�X�Y ������d�y��]�� ���jl��^.��Oa�V��iHc�V*��<�h��q�^s��w�z�5 ��18��Ia�V����@�f��ؿ#��a� U�"��Tբ����������Sf��k�GvNaג�,3��#��j������]ۺ����a��hsf�w�}|�z���1�z/�!z��,q7o��}qq�y��kY�a��/��������[�����|6<�����~@�I�^5L�'?RԫN�B�A�j�dNm���*b��$�#��xY��w�yG�Ӫ'��en�{�ҽ~$�����͛����o��w�l��\����7�뛻�P~��I��Kf��*�e(ȣN����D��5!x䅱	)��O3I��=��E�CdϢfޗ��t >c�����*?�C�ڧ�/�Ef�g�|WXUÔ�$W�S���ɠ�Y�G޶����z��=��]1
,�,�g�NϢ���9���_�|����갅͗�����f3��^b�/UP�����?á�����M��|�V���݀����V|:Oj+�D�=��뵕G�u<Q?���%%Q�1I���$���Tm��t����@3|>��*=E[�#h��t�֖�g��:S���%���ӂ�9j�}��S���ǣ~��������l���8t�N�`ň�g��ycf��p�bħ�����8+��6=�Ã�r1
V��'(Xa[%G�¸�*��`�2��b��vJw��;ǧ�tw.l�b��My�s��yf���b�vSZJ���h{��x�*[p4A�� syh�4{��=���)�<_mO���n��]<)/H>M�
�(�W5��7���P��?�>��������es��/�g�?Y}}����]sw������ii���ɹ�����&�Ǜ��6�&����� ��|�]?�g���<������n���$���?;|ڴ3��vw�fsw��i�����"����_-�:�.�oW���+x�߄6����$�8Ƀ�������»��;O6m2����̿zzbD�ì�z���8���0[m���3ȿ�%��8�j[c�GM��N�ߠ�����4q���X�_��)����y�D�tJCt�L\>�R1(�Z'W��T�S����bW~��	B�;�2+�'�z~�Vc��x�\1��Ϛ���2P�Ad��6�4��T�TB�5p�@�qڄ�DMKIr�Iu<�X6IHT��<�sy�j	���<���Ş�����38Y4���i����ўɃs�Mx@�p�@� ������v��~z���><�=����==oM;s��Gbt[Ȁ��U�ј<���)�iq5'��q����8�,��L�I�7�C�,T�o��ܶPh�cj^bb�U1���y�����y}LK|�:H�6��f"Z"Z��c"Z#:I�BD[@�Ł��}����-�^�-���3�NH#K`��dN�#i4�d~�l�؍sBf�.��too�?o�=?<>~"�J�W��YY�fs����&K+۹R��W�6��~�(����&q����_��n�g��ӗO�ڿ
��������#"�����e� -�����>����]g��6�?��Op�WMھ�?���UCι�ܫ �p�����n����6�h��E�������-�>�&֏#��%�l�	�9k��=��x&�,�S��I�������d�'�a񀫈�L3�@6�l������8�����f��ɬ�\����X���ob����2"�;�x�x�L,���ߟ�z��r�r�0�%�jxx��	kkn؈��N�m`>�am�MU>JQ%e��RUׁ�˺N͍�<Aѱ14\:6T�cC�;6D�c��U��ik9��|ܫalٳ5��8 �$	iE&�/ѧ�~�2D�~6ADsD�ު�бj_��>��z�h�e��"�����7�t>�C�L&<D4j0�HCD�e�m��F5�ğCC;T�b�΄C5*�'3'�s5� �"�3�$�yr���V�N4�Ѷ�&��}?�#�m��]���a�p�;�X�̓�pԍ��S���VٛR������.��/����?�����&77���	����y������ۿ����E�}��g����=$�w;E�in/6���¿\0o�9_�d܎߾���,�I+'��0Ἴ܇����w����\
��շ�~Ӭ>o��a�z��x�Ŧ�M~��oO�����<L���OY|�NK��z��鋠���"Y|�����>.;ү��~�l��/w�o�����P�����O��?����cX�i�hz���nj�v��Ne�v    y�2���?}y�����yҤ�\�����dH�τ>��j�t�u�&;|�=,8�_+&��޲������Vgݺ��!�{պ�%�Ю�B���f+�;�:�^�������������qLK�!����G�x/sYܣ⽧����Þ\�^�6�%x�ZlM" ���<?�E��㢟��Oc�1��|L��Q�}Iwڂ��Uإ�:���9�<.Yz��_x\�ƚl�x�<.Ye�ND�5��.#<.Y��CX�h\��2��p�GO��2Tc��.�C$C5*��X%�Q��.䬓ը�B�s�P�1�"�O�\����e��YD��|S��jl,�@<��B~@��5[�՜#Z/
����D�D��Cu��\�:2$�u���� :��HD[D���F�����B=�#�/56
��$�'�-��GD�(��F!���=D4�1��[fD�FnC�c��2�Z��r��(��Tc�y����Fe�2�ը�R�Z��R�R����M�hTc��.cT%��`|��@��;�e#��H�m�J�t���IzD/6{R�n)��<P��,�@n���2�Z�Q#�� �p?(��ED����5�hT��ŏH�j��\˨Q�c p��k�P�q�����(�V���Q��MP<^B�}ޮ�<�<C���8���Z����y��Y<aSEק��wi����{�S����mF�I���@!('C�E}���2�͢TD���wr@ZH�_�"'�E��#�ˌ��#�H�����Q������b��+$�dY%�u%�&��Bh~1t����$���b3N�B��e,�C��efA(�B��ң*e�֐�F5J��d֣eA��-�Ji��z]�)m�E��%P���M�GA���`ϵHl�aڸ����B�.�6T�B�.���5T1����+���̈�X�g���N$��׻�5�%2PB�b
���rR.�S�!�jI�*�#��-H݋F_�U��~�b�����^��bL���vC�}�N���ϻ��pQ�K�(������\-v�'.�t�E���p��cA���(S�`mRU��2=���|��cH��<�2�����
�t����P����{L�7��{����EF���o��X�{�-Z��lT��ڢ�\(`E�{�2�/Wz��J�V;�[踝J�V[tGX�Y�{�Z,��ҽ�-Z�*!��9-m�Ϥ�B��KəfC�J�R �t�)��PO������/�gy���^Lڒ��җ)�wS�()m���D�,�˸��������֥J��B�� :f^Ľ��E�_ȷ�Sǧi�D�C�z�n�?��5�AS�q�!=��\�[�\�]!�en��;/WHDD�N�+%m��UJz�$JiD��/3'P�j�������(���)�<��RB��j1#�Q�J-��4�Q������ը�@��Z����TZ#:��IDD��z�E�_�Y��ТV{@��oA�hѧr'�9��B�_�D����A5�ДA5���Q��3��A5.��ET�X*�2����!�&՜��LYԠV�Է
�����* �-�"�*Ӗt�_YԖNJ�TQQ1�8!�����%�����xrZT �	��{�f�1�~�\��}�*� `��LQ��4���
����NP�@EQ�C����$ *E
"�"E���Rd����Q)aE�H@T�J@U@TJܩ!��w�)ۣR���U@T���g�JI�I����tg�
�+�=��(C��%P^�f��4�j�K ��h&(�U|P�@M�4S�����.���B���xX��'G#����䨪�R8m��9*���Q)([sTJR�2G�D�-sTJz��
�J�߄��Rm��9*%�+��/�J�@R?D�IJ1�*E$N��������J�@��K����.��P�tBQ%E>]��L���i���*�`�X�=l�)azr�;�Y��<mR�H��**R"֗X���4��&J�T<�| h���Ӑ&���Z�O��B^!�fM ��B7�:�7��ؙN��3WA,tcg�u����r�щnLU���ϋ>�iDÑ"Z�id���!,�g0mգ6���;���D��=�
oo4\O��D�[m�'��KP�:�f0��A�9�a8)�`�����dk�]���f ����5�����B?n"�:q�;!2�ĹU��Q��gZ�q��8K!���ш�1����]BH@ ���Q�:�*; =5q���A|	ɍ��(J��j+g^NF���1���>i��K�؁�����1��bG�͗m�ȗ��o����_�f��o����/�\�z��o^����o����}����7siO��k��^�o�	��w��ϸ�O�͌�ژ�uzb�mɽwƨ�Ϭے)��d3l�������^n����r�[}���`�ֳsjK��rjy��m���������W�Sj���V��w7m��鉵�?�F1+DUbm-�V*��68��6>�Ҕ�p*�-�6�����*}��:o7��1V%�����&n�P+���`�{X��8?�]_�N�
�e�3�ӭ��K���V���{��'�����)�$����K��{W�3�Kv�kx(�K��a�I�B�a<��s؟��Qkx؟�"=?���.�1�~�x�X����'��WcP�����g��Q�� ��x�qR���Qʺk�����D����(����4E�)�L{T�J�6�4E���b5�B#��]���~s����F��V�$)1���q�����H4�݋U@��@�P%Hy��H� &��7� P��҆�H�4� �M�ay�r��p�<M��0� �ӆ��')��r X?�2\�(2�J4�.�B%��ax�C:ax�C�4����o��%�B&�t���B&�2�1e��m�j �$���Ll{,��F ��T� �ثc�L�}׌u �",��s�4��Ē�F�D�7� U�mJ��d�KN)φI�%��lX��Ϫ�^B��d��ݺD�P�1��F�i�[�c�*�T�D���Ҥq2GJ�*�ä5��-�٤5�%�;c҈�#�t�cngJkZX�����7i��k3ә~�[u���Z����t0K�� �ZW������ �Ni���h6 ����`��� -(h�?-�շ���)�H�CUD��m�"�O��t�3���2� k�	��(+7�J ��q ־Y#J�eg� �bU�B ��1��<X� )�"S(D�r�
����T�EB64��D��<��4
/)�μD�McEy��nc� �v�
a���H9�k� ��.kfHG��u@]�:_�H/�1�\+�r1����u�2���
ex�����Jn���2�d:�֡2x�ğ�:TF[���:TF[z��u���@�<*�-�F�2���byT��)�Ge�$3}��<)��xTG֎j�����U�Cu`��ң24'�*�� �S-Cu֩��2� �=�P1�}��e�8T{�$�E�q��2���C%L�0Q3%L�y����Mx��A^tH�w��6�Yq�P�9>���z(>�4?�?�7�1�} 2����>B����x&l��pθwΙ�8~*��2;�.I�hYn]�"�u�� ɽiyngL��I����m0;�����n9�Α����5t�xXx8���.K�H���Bz�}@��>R���n�N�pi� .�0�5�9h�/�|�^-P���}�
a�/��B�IB:E(|�ރFG�1`���|�K���!_&%�ӥ{�G � �K��O<��ȥ[��T/8]������@�(���o{��)+�c=>������~�������������Uv���Q��6ow�����n{�����������Z_�m�%�0S��ү�����a��o��5�������9��Żf�	��M�����~�O�~�m��u&�������_����5g��i2����8��ū�����0���`���X?��6~Ҿ���if_���
_5-�8�����YQ_�������e�']}(]-���N�D���7��s��CG��m6n���4�     ]�s@�FIc�@ -ۡ������`���4�V�`��'�;�H/�!0�Q,�a�����U�2,iҪBI��٭+��iK,U(��q³ZW(Ó2�ZU(�8�P�2<)�*T��<�V�:��Õf�T���RV�:b�o���QB��I���aR�:����kT���`�QB�^�Y�CeĜ���ʐ�����qw���ٴ���S���u@Q�B�v�,�aa��� ]��'U��9߇�V��7뫫99�^l77�I�)��q�L�ڬS^&9g̨�Y�flj�I���	6'�����~�����}3;��룚dS���as=?����3���y�^��7w��fV�)�ϔw�i]�aʟ	㔑,Ôͣk;�!S4�0�̓k/�L;\�,�*,����} ���Ӵt��T����`y�_����)on~l�q���·�#�����y�o�p���̛�l}{���o6����A����<�����&���y����?�v��i5�����������*<��5ut�/�a���}�߄f���/�8�M~Ʀ����;�F�����<}�<�������ڧ��_�	�	Pf�y8�HY������]���EŁ`p��+)A���<B�s�6b���[R&�-;�:�ma�E��]Ա.&:��'���ʱ~�t���X5ݱ��w���RD���-�!��h;,�F�0�"�i�������2��0¢�kV#,��\��3W�cE:1e]a���*3ʘ ���I���UG�V����<3rJXWȄv�٦|<47rG��R\I��K ���.����&�{��Jг62�O�q�%i%i��Ѯo*-K4iB�O耞�Ӧ�N������
G��<]`��UwOW�(�c�G�pZ�1�P@<	���P=�"ӎ嚉P��1J�������c��倳c�`�6IO� 0�]]~�l����+�˅s2_�ue*"��l�i2�D8�`׀���������|�+�~@�e#�t��M	�s��!�"��G�gw�0��5ꎖ{bG�ֹw��^wT�w������`�=k����2ʇE����Y;Z��mi	˘�bƖ֫��*Q�&<���Y}�l�77���.�l�Ŧ��x�\�7��z��{û]�Z�U�n���[��v��hRT?�W�;��U5��]z�n��ػ]��#�?�O�]��.�Aw�B���m*;�G�ň�$m;ˉ�4'�KrB�@B�~'4�)��j������� Rމ�w"�j�J�Қ��$�!��d3�����&��]t�M~:����w�ٻo_0�б'�hG�Y�$\���N�;��X]~0]��L�t������+u��xt�O��'emF	Y��S`R����0�0��_61M�9�z9����n�֓S~�����|K�hȃ���I'�N��f����ح����Xϸ��z�i��q�1���������3-N���8陾�#�����R���x�"tz������#!�4�	>�\��	����MeB�;(S)a�NY 
G[5(7 �,�� RV��!Г�O;�()2�i�@A:@�D�"޲B ��R��u�JQ�T��iT���Q)�8%E���$騘3��X����hP)H�T�Ҥ\p��JiË(yX�Q����hH%*�1 ��-�$�7 �(�x*R.`g� ��R,/��x+J %�YT
W$�E���єnhQ(\�gSI~[�F�%:����h?+?�7���z��������vu��~��iuy}���n�����j����a�CyW�����Ch�jssy� ?�e�����z}����'�G�߅�7���
�����ſ暱�������������w7���tx���nլ�4�����u�1m�n/����v}��܅?[]7�_t�߾]���y����뻶����w�i\�nv�Fo_Ňsz��~��8��[5��]۲��yn&��������E�,��*<�fsK�j��	��)�B^}�^����owo�zqs�=$��]�~s�c���p����~��ۇ��nu��z}w�������>��m����:| �VBZ����ww����������������7�/���^l�{Z�
�oãۇ�]l���UxC����mۜ��g��O��S��t���>���Q���-�O�S��t����t�X��Kz�g����36��d�'1�-V��T���bũ����I.B����b���S>I@�Q����3�r�b)��y_|ad>��Wm@��P*Ƙ�e%b��m%���Q��
_���HՈ��Z�^�З"h��CgJ.U]�9��Č}��9������� -v��� l��A�*}$»���<��勵ݣ�d;��G�IV]��y����CR%���=J,�Q���t��M�UCG��Z��(>%hl=�- )%=C� %��3TU��#0�PYJV�������ij�PfJ�R~z��R��<�g(� �K�j�PHj��q�y�"Ҥ~��KYgz���K\�����tQ������o\���
}r�7.m�?�3���Q��t�K�������9�����%�����
��^��!���S�' e��'��z�b��H7�Ȍ���>���@�1Ԟ�Lz�����H��Pa�m�#
sl�nFD���u� )�c���sLlp
=����HHxp�dc��kU�D8^d<'��Z_���Am҄�q�7_�T8���+i$vV��P��"p����#�g�O����/���x�L������p�#<y_���HN
�m�O�����e&�����+2�sXL!���Ō��i!�����=���bO�`}^?/9��G�i}/��גzd� ����L��x&�Ѐ�<:��J�v�3����@�A��v�UU��"�=�V�r�R1������x]CV�Q[��.�e<����%E/��Ur�
����*�F��7�%"Z#ڑ
'ye�I���5�4�x�9�Cy������W8�ʠ�u�K���)-�b���8E�>�uh����=���"X����K5x�A��F�kԆH�0�s={�
�X�`����u�¿��bb[Q0"���ԈPyY�9�e���"Xڅ� ����V�g�Oι�feLI֮�f�l�t�Oy ����������#ì��M�Q8Z�$��Έ�H��R&��S"@b"@�az�38I;Y�N�#V��n�:��op�����78q�#�g87j���M�J�{��5E+��-N������
ޢ�V��C�[�֊v��[�r}XmMhQ.�������bs���1�d��]�Y7@IW��:-�z��#�!{�H+��`�k���	JZWr����*:�ҝ���0-gh�@�* 
F[�V�˵c�����Ip5�m��6�g��� ���@[F�I$����L>���m�	
P�@J2�DT���� �($���O�@C|)��$�>���q��b�<
FR�5g�#�
muDԊ���0Q,�H��"�E:Rb�@D��њ�����H�1֑G"��Q1*ɥYGD�(C:����8� �	�8jFy��DԌ����Q3Z��"jF+R�l �f4-yV �f�%M�1�g��¹�yƖ�S��%v��%\y	��/3��ʻ���1ҫ$Rf���)�+rZ�]m�w����c��D�@dR�)izK%R!��N%R���D�i��,��H�H�[�J�@z�2���n\�)i7.Q=-��D��ʒ�D��|~�V�zbF?�z$�G�~vU����	���	�M�oܕHEDz@ʤ*zR1D�~:]�䀌3t�UW���ƕD� #"e�Z��%��z"uW�����V�zR�̆B���	�kT�&wu���pIH�HEn�D$y� yRq��̆$>K�HA�q["%ͪk�H�/�+����/�5�H��Ѣ_�-��4� �����D�}3���	M�oF#R���J�A�%D[�-��k
��/�2@�٨+���j��@���|�D����+�(���CD�x8���x�b����4N%� ��/Q=�GOC:TO����QIʃJ$�G+��ġzb.	    �١x"�6)r(M�`:��������:�8�H���U"= c��mK�Ԫp�Q��q�u�Ws'�i�@���6�"����TJ ��Hs��!'"�}�����iX��i�4��EJA�����@9c�T�yg���p%R 2ٓ�D���q
L�*�L�D9�<@� �2i�hJ"�?������˙ ����<��s6@��h�K %J* � ��9ʅ�J�"ʅ'����rI���5�,)D �^��w1�n�,��^����"�%f�N>6�z�S4�M�L/�*�~[��(K�4��V%�k��aO���� 1ɢ]G�H��Ĭ��J"%�c ��HI��-+�4S&9�_z8��D *�l&$*&�	RQ1�Ic�D�D"�|K��D�H��c)p'Q/�ӧ����H�<E�r	@R.W�\T�<�jb!C*���\�Xł��B.�8�B.�4����g�<{��y��<�ʪB|~,��D`.>}z�U��%�de5+��4�j>@��O��aT�DY9�!�"q(������� я��{�_����S��9NzFL�L2J��拐QJ�U1b?�j*�;�/=���jñ)} ��=J>��(�S:2 ɯ�D6����u�l6�.��lT`��}B��٨A����A�I�A�@D�I���ߢ����'��D2�.f�XĺYT_�%���,�/�-b�-j/�5�mQp����(7��K{�"S��߶�1�Igv5�)�����>�����I�ʡ�tR���8P�V����X��@N����#�'b��H�T�+�4O��D�8��4��yZ�p ���8tD�H�����I]<*[!;ٿ��sE�vG�ty�C$��"Q��f�Գ�(y�C{�+ �ii��KypCD�~^0��Χ��XͫyXC$rڰ(򨆎�l�+��^��i(�d�OCYE�+����"�ChR��@D�D")RIp�I@r�}�B+�^�XhE��G�H��*��ɉZ��ld����ډ�_H���tⲜ2��ӿTֲ4TM�-V��

�^JX���l�β������t�!m�Fh󽓦��Z"%Gh �"��B��v�됰կ���-q		�L<= Ƣ��?���w�l
�w�'��!� ��#d�`��2�T6�����3�����=R<�6#�LH�`��̹��;��� ��g�5���v�'�����o0�T�t��ks4�7+~�� ������~�f�c���������>����67o^߮/�6���u�W���+O�,{�w��E#�͕�k�u�^*yy!����y�Ϗ�{�"��5n�r�u�]�ݱ�7Pa�(����f[��/�Ӌy��v��~ߜ��oN���� n���?�=A���h�y��إy������>����]W!$kc��S/���w}դ�k�3�h~�t	���-�[O?�*�������?�c
�C)�p�iSV�t��$c��[�]�.��ʿ�B��I���+�f�-�fFYmL,�0�����;cT�����X0��)`��*�̃�N�9L�fBBb,�\и�8� ��0��3ش�U��P�\il*>�|�P�k���/�(os{׼ۭ^�?�ͩn��Y9��gP�F0ƞ1����7�m��=]}5�q#E�Ӫ��j�H)��k��.w�������?�V߬wow��a��	�4�sK��*>5�m���l7M�ɫ��f}WS߆��]��W����vn����Ԣ��MX��0��Pn�y)F�6��h�|	��h��5Tuz� �JY�C��a����b�l�E�ވg�Y\���h��~
w���)E��㭨$���*A�+���餪P��+,$���أ��B/Ǚa<䬰�W,�-.�c�(����=v� ����q&*�z�q6S�/�b�d�z]�c�lK$xlw`�p��ڀ���y3	X��X�,T���
X�K��9�BUzd�4X��́J *�q�� ,ԣc"C�PM��u.px��d��B %K���.N���O�������6K?KǦͻ���}�OOh]���`&<c?�uE���к���ff��P�_�x���W�f�ً����z���3����::��}���u�[�`�`a|��s�<�"��m旘
d���%�1�PKMv�6s��=V&����&k�&@�jG8J.�(����W��2��:R���q*G���멢�*N�J���}UU�><���K�)����J��YI���D�?XOEY�$�y=�����j*Gm�$~=��Z��+Gm�B9�LEm�b9�okԛ��ځ���AaO�{ՍQW͕��q�ǳ��NJ~����;W����������M�����M��,�����蛭b��V.���l�F�:y��*�q�u���l9��Ԧ��8Nj��ޮ�;8Nj�����q�M�����𲧲,��(�:�+Yjt�v�K�Nz�K)^�=Uuۂ�,u�v�z�B ue�$�lbU�R,C�Q= ���+D�V�&4�P��뜺��pѽ�6���0.��q�	&"Q%����"��7��H3�'Q1�%�P"��!�P�P�'�P����8����zj#�kQڇ����������~Q"�'(VTi���T�@�)����H(<���P �M�Q�C��Q�U/X�B$�*TH�*�?}Q(�x�}8o�T����� *+^�/;AӨ���:�ּa]HNŃ's߰.���%�P��k�W�!Aӟ4��2�%��e�F�:�W�1:�	vGzk���X�ɝ�GU5���g�54�lhC�A�t�J�y��I#�A�(}��u/%���ٹ�����ع���os]��j��n.�#��$�]W���D�<Ϊ��"&�Q�ՙAk̑����l�FtE�jv���CL�Z�@K K����#���g�UG#�U%-V��k�������oT�25����a}Os<��f=ۼC�t��)�����	3'��Y\3N�����V%�t�z�G�83 �������Z_0������_��񞙵��7���r}�i����\�^6�m����`D�iн�_ono㑑�;Y���w�ax�ޮ/v7��ۻ&>L4�ìz�h �t ���>������Ӟ!��į�������`L�0U�25 ���\������.D�X8*H��7�
�T>|AL;~����b8�_��--"����2������Bޚxk�������z��ͮ[cRC��}���h�SwNI�b�s���)>������Ω�����_�[�IJWt�ʤ(��)k���Ev���#��y�1�o��?z�q��H1��}zA?��s��CU�dP��+g���C��@L]�p�a����Gw��ʆ�>a��L��u.��۝J�Kcհ�&N��МxBss�_5P�b�����V^}1�j��YK^̫��b`[W�m+�+�����'F�s>�1!�3�T/&�������µ�.u�bn�bV�:�(���.רE3��R�_�p0q��7�!�<5��L�ӫ�[y�8P�:�B	�	D����L �j��J�\ V�6�8�t�*a8�DX��Z�袺�XU0��K��Z/]��J��^��Bm��Q4?��8mM�7V�Q�f�xk��װ�j2*? r ��T�W"i2�DJDj2?(r@R*���HGԔ*}*?,r *�mKD�����|\_y������ �R�r\����帾�De#Q9��/�Yxy_ţ�Q9��O���4
'�|#d�Qu#u_X�
�����FE#���U@�LRJ(*����/^�DL Rʢ*]���S���X�sM�eSH����ꭘB+���T��B+v���Db!K+�L��cn�P�-�<�X���L�)�b��U�B-��e�����S,�������ܔDʾ*����Q�y��g^�Gy�Oe����>V���O����6�~��2��������m�}��:ba}��n�h�:F�m�l�>��Ĕ)�E���
zs3D*�S	��2�Mshj-+\>�6��-���)�՜��w�_���ձ�ȩ�H�m�C���=�uW��    �U�Q�3I�t(�H$͢�S�{*��T�VDQ�B�Pxvi�g�(M,����?���<-�E�B��O�P�D_��_�/������X���.�v��	ی-{>uJo�P�_����}oJ�A렓���Ӡu�@Z�:D"ee��:h��1�	���6�k��qЖfb5C������C$R�g�P��H�=k�z�D��լ�K��B��&�%v�1n �����Oi��m�A{���	�'ѳ]NəS�&�fO��f��k1b�d�b�|�vH��j��ks���`}�q�)IJT�P+�t��u9!�9����7�͛�&�Q@�ж�4G��@����im��M$�+P1�H�����DD����ǈR�����J&z+sy-P9J��V�kԫe�(P8a�wr��Ն�IT�N�$̧�d4���h��	DN�=%���-Q2ZQ���hK�Gψ��^�:R�!3F.�XP�14�k�n�#Q�r]͸�<l�Y6�I�4�54�/��4&
�H��7/KLV�c��W� ��4��#j��H�iND�4?�9i��4��D$m9�4��C�~̭̃��h��Z�JI�!5�-����S$ݑZK Ơ7[�Z���n����aj�6�����x�V��T��$o��z��b�g3�jX�Y�ԓ�yd�,��A-E׾�G�r�|d?�T��0���C{u�u��}���OW�~x�|������~��C��j�os�+� �z_�a�:߾���u������*�p��3�;�!�[��Ms{�*Sc��&�3���ř�W��߾��eLZq�8��/_=<���܇>���oV�*<�}s���y�=��4����hZ}�in�_�����翾�>_ﳲA�wi��\���)}z�~s�D�|�����>�4�_�������O_��n��i�?~��6��E�]�N��?���������i$��?�v�P���V�ex`1����Y�����9~�4�*�M���}Z���g��0����d3��Y��P
<���g"�h�e���Ϗ��ta3OTR��S�L���(V����6�L�8b���O��F}l��v	#e�3�Ek\i���N	���ZZ5F�[�c3����(��K�]s}�oj쑩3H���as=���!:��F�8ebY�f�p�̆���Ι��	�5E~JPhT�Ǎ
�Q��C��
���B��
�WX��W���u���$�w�(�O]�u�|��c�gRl�6~�Hr YVOA5u9��x�w�����D� ���V�D�hw�J�H_[��X�uj�5�E�U��q&��ñ���AF~}��o^�ʴs���W�w�������O]>�ZC-�`_��W����u�0��7���m�U��ߜ~��]�ݴ����_%��~zh��mS���0�/l���I������k~�m�a��I���E��/�9�Oӿ�b{��4�ڒ�Ip�-Ls�Q?{s�fY�B޵+̲��l��+,�̣E)F=�� �ҳY�<�����]3űp*�4����	�i�C|P�H#�П�Y�4����뻮idYS��s��"{�R�]6@��u�B��w�յ������]a���UM��yD��&��O=k_��v�Y�B,���Z�����B+��XΨ5-C	����g>W�Ҋ����Ǔ>��~�U��K��I�G[&����,I9xCc��1?A��=�E���������Y����*��e����@M��ah�UK�FA�XS��T�R�.ꨣ�2�bW��d�7W��u�(���z+0Xp����jeW��:!���s��d�R4���Zk�v|��3?WSV�x�/��N/��n6���&~tv��>}�����j`9���GO�?;"����]��2��f����7�:m��_�?��Op�WMھ�?��{�t��~z����c���u�����%�[8�|���6�`�o���?�-"/w�����v�F�(�Z|�|+U��L�Y[��R/�g��hq��c1ںJ��C��c٘��8w�z���0�^��s<0|��
�C�Ąy���O�R<M���-1��82��0Q%2�^,�����Dz@�D�U�R�"��/���k�1�$y���%RR�fF�"���D�!��OFd"��o�����ɶ��<:og�������E=פ�Nא�<��8���/9�#�A�3!��RG��Kۑgi���g\����!��h>" �ou��sy&D�>�v� d4[�Ė1ݞA&vP��+���X�V�<^���0�p��h��2�R�,dL�-�9j�C^�Ő�e�i��C^'��g�Mrȫ���Iy��秎h��	`rȫ'R��&9�u"��U��WO�MR�^�"e�2����u!G�V6U�x���#�f�D�L$R|�F�f"���ֹf������]	U)��M�}I�N�Π�(N�y)��'s����l��3��$5��@��2�GZ�����7�a�Py�u���'޾�����{wu�-g3��KuήعdJ_�&_��'��O���@cHim4-���DC;jlZQ�v�1hBc�J��1h>��-}Ѣ����i�X4qߒ��-��X��-�&�p��5�,-����e��u����I+
���]HsB��њ�걨�4�bѡft�ЍBD�hGKOej&I����4�9�Iш�)$
�s�H����$�~\��s�D��O� �J_����":a<6�c�&y	$/�� h�&�_�+(Y�_��*`���T�vZ���I�ŉv�H��ޕD���{$KEXƀF"�M��)oƲ\G��ɔ�hY�#wt�m�գ[�4�3��%&��uܭ��4�O��1l���D�8e�i�-�rvuK�\�	�����q�<^F��cnk9+1a��tk9//#g�Գ\`�͵�F��j6��^l�ܿ����]~�_ݮc�`�o�ۇp=?_�5�6^Q�WT�����2G��k��5��2Gv�}I�Bp:������t��#!���\���
u�%����(�׮x�V�I�om�>_c E!)"��)T�fD!��L��WAmɤ��B�@��Kd�&\�/ᖽ�R�&�5.!���@��K�&�]�.��)�F���e��/����rwaeJ���[�*��E֛ke�q�jY����E��~��\(^�gj���
��1ثB����ї�
e�����qҧ�TM�T!ٶ>Z(�d+�:h!�%��<M�&BA�X>�-D�V��Au!�%�����H�PT�Q���]Q�PT�BE9z?Յ��/�PT�(#BE��)V5��\�d&BEŜ�=�bkBP>��`�I�<��~�Tp�2sP��?լ�K'OgMa�}\t�S��+O�9�8�Ъ�Mk�"�6x��T���.`��"G(�M�EVmACԢEV6[.�A�"ǂ�ԱâIV.�SuP��f���EIi�uP�T�R��EEiI�EEE(u:bQQJQ�(-�S�<̈Go~H$B� �*�<ب�*E�J��l!Z3����)��P:2�&�'����G�=�F�PI~�����E�X�Ғ�F�bx�bٰEţ�T.7*��D6>�͘g=�.-��@E�Gũ|IYco<
.2��G���6���"vU��㧔�:�Ҋ98�÷c((�ȯ�1�QW�E)i�����t��TE9iCkC=��4�z�1�S���)
J[���(�%N�/eɎT�E�x��-e�>O�E�+������/��sW�A�!�3w�/$���ˋl�9^*��]u�P��C�눅�|�c[ӑD!#O�r�D��x f��${8��V����*�.G-���!ĨcR��P�C�AQ�v8dۤ����P!{�A�&�������7g��9�2$0t����P%c4�+ELTN�s�O:�8�\S�&�E���Y�-vf^�a�+��V�D?L��.���zZ.�/q���v
�>C	�)'��h#6 +����1W�L�+��H��
�+[^`<:y��n�1�Y�F_�O��4+�1ܓ�����s����@��Oi=��9��e�o�45<U�$�}y���V�2��qy�    ���n���/v7w��n
֖X��X�ؘ8�3
�Q�>�G=ְKk��HԘ��
+J��t,*H��L"�B�l�!6(��Pr����R�<椓�#��%Npq�τ@x3�~���e%X/1���1����N nJ��D��GǙ�\0:v9/S�X��I���\̦7%��Ζ8M7?�!V����V���Iw�J���q���xI;�T�OH�q��xxN"��f|~�P'�0����|Z���C�>���ơ6�ܻ�;�D깘�8�D�T�8�R�aC��q��e?��hjA'u��7��ʹzo#�B�On?�q� L?M��0�.�a�������FK�c,�a�M���+����g.ͳB��-6�����\Sգ�g��U�T�$��\]#8U�t���L#M������|��|>�-樭o�Ca��M$��f�x.�[��s>���x.p��2�� n�.�0C#��9��!��=�׀ӳ�di�)�b���s[2���Enޕ�P��#��%��(��D��2�h�ډĉ��#D�O��}֣����L7��[�j�kd!�'�Z�eڙ�n����ܴD�#�B1I:��#�(�����l�,d⧥������
�$޻��ZH%���O+t᧥2���3�CEޯ���x���IIGp(	!����&���o�PW-1���n�j��W��.�\m�P]ִ�ơ(��i��N�*��V�c���Y��E ՛ ���Im�j��W(�������(����VjT�ԋDrx�z��7��^N�!�Wy��7F�������A��Q�w�gZ�)R	�BW�ߏ�
=�~㳾�u�E(���+%0��
���&�ʠ���M_U���T��֡zN�l6y������ �B	8�$ϠP�����gQ(zb��
D1�U�D�h�oע@N��؇wm�z��6�[�Y	���>ӀM���Ml�w8����.�X�T�g��.� ��V�.�k+��G؎wm	�{�n�VBE$��ԡ�bVu��t�������c	�f���y3�S��"j�ׄ�f�qá�Vӱ����
���PQ����V&���d��9�U�3�L�u&b/�����h��q�B��w}��.���n�t�_�U�X�xj�f���<Od�Xm�q�E��l�MuЩ�ǩ��*Mj�`i�	�hMT�T3�^�8T@-��r��MU%��O�oj!+�ǅV7����ϥ�5����3�W5���_���y�����BV�w�V7���R?huSQV�:�b�8e�䦢�� ����T�h�(�x��j9�*B�ƚ����9YG�\o׃E�M�B���~*��C1G���'j ��/ǂ�G�X�+�.�s��^�XA�Y����Jk�X����i��E3�� �?
�0A�l������y���'`�_Zsq�y�4���� tvD4w��M��^����WS����W�߼{�������㧞��O���I���g��o��.	�?�m�ʞ�B�q��6ow�˾@���
J�p�:M���;�gI�����H��]�_��C��&��w��Q���+ �|{�C$�N��0~�&I�����z�}���&���SI�8s<�>��z{�m�J�ϫ�������7��:X�ׯ�ך}�3�q���S�8:�ge���(Fg�oW7��m_Ұ��8:+��uV7G�%��Gg��K	�����(`��C��c��٨ܝ�?�V= yr�y���[2d�.�:���v��%����%Ke��,7�(Y�g����5��r�� ;	��Ҝ�%q���r��Q2�0�Mڮ#*Ԟ0�U��"y��\����O�S(��& %��b
�iI F�(/-�T|���K�n��B�iA��(*L��}UO�K'g�gR��^6�KYU,e�e������{wu�-g3��Kuήع��R]�)(?.C�E%�,Kýj�=�k�k�(��I�<��(�89�� ��PE�[iT��}�_[*̑�wԫ_Ka�L?ͬ-�2�f�_�k)L��cE�_KaM^@�굘��|��W�ZLa}K���,��7�i�yAު������M�m�h����1%TЛjKj�N�Ͼ��'���(yS̲���B��d_�T�<�����UH��3���zvlS��k�3���]�#����uXq�/�����������Z-/��\:Q�+���jO(��_���R6���%6�z˱�БK����ԦPR���)t��n	-�#t����#t�0n-�0Ş���fG�tEP�4���ױ���<%l�Q,f �?�U��b��y R]S��V��%6�G��q�B��GƇ��I;I{�K��O��aSq�}�ѧ��#d��^fG�f�]1��yP^�Mt��[Fo�P3c�F���=��èu����.��*�����&n�қjJ(��,R-=$ϹJ��p~ Jv�xVR�_�������.J���~��Cj���#��⛤�����y�����i��o�w?~����SIs��3�;����b�7��Ŧ5��-�D��HP��6?<�Q5�J�GId���*Mώ�P�s�W5%4�թ���١��J�8d�����'�y<=/����8�Ǒ���Q��Cִ���|H41�|1���4'�k���7W���]Yɝ�p��R\�~n�y�/xUht�P�#L�������}aѩ��̇p�QB���Qb��v�[�|�
H�k�i�⧫���'L��gj�lV�u��<S��}8�e�*�6
�I ״A'��28N�p�zNx�����q��vZV�8� �t�Q�B���ơ,�� �<��ЧrlU<�EDY�Ce(F�_TFL��E��P�2��y�	�ڠ�ż
�|6�*̝��y
�~:3����Y}�پkʙ�w����vݎjmA���.��V��9�)�T��ht�(���6V?�A%�!L�ݽJ�X0��L2�u#�c)�FY����]�#�b f*&���*ܕ�%�b��Z%L�0Q{�Y��tT�,�\[춊��T�|�Ҽ���$k+�W�8��j{XK ˴+�*�,Y���;~���a���J�0]{�YmRǙ�o\��E ��k��kLJ�6�j_'��j�@?��(� )��@���%N*r-K��6�@���p����I���&�|�*7uMD%�G>ID����ꪛF���r�}ܠnb�c�n�ˉ�F��nd�^�D���Z9v��zIq�:"�E$��(�XԙFD�H��u��ynP/Hk"
&%I���p�#�2uMD�ȩe�F����U7��Q�8��(�YUMD�(F}���d�j"�E%�z뚈z	�tȄ_{t�;TNL\���i�PB���QUgȹC)�ʟ^Js��R���f��j*rw�>�BU.W�`��QZ!)71U�(1���'<�j�{i�	���,��Jڎא|��/�`;a��MM��kuM�>0�jDm�C^x��G�Yguu$ۨ�$k��[�v�'9�Mҽ�t+&^��9�w �|b��Qb��X�}j���H������&�=Ӂ�̙�  "ț �.?l��:�L�H�NW�"�����4�|�9�k�qpUr����=��%n���ބ���#��~4�3r�E��%;#G̈́�M��X�Q>jb�1�E�i���xS�ac8�J�:!/4b'9\�p���d75�C���jE�P#1I!��	�K�:�@qDބ�6c8ԆN
�4�ym�\���N�%��4��^夵�Д�I���xyFV�t�!�SF:�Kܤ\r#<�x��^$/�z�N��PJ�I�'窺_J��U�~%�$��"�-�2�<M�_�IL�U?hJ����`�>t���~U.���+�� �`�� ^�� ��J�d��U
p�4�Wq���88��L�5�"�N������i��1�G�$��!O�~�G�����,IZ"ob4�O/f >Z�G�"�pz G�������!��˖,5�5�� �G���C0S���[AUN�Z?�hP��7'"e�kP�]�!��*�����ZciBB�5�V�IkS�Ց����#��L!W�O�jx(�X�����&�kx�)��G��,�E�>7Su"5i4��    M�;�S]Fo��ЪwX��PڑFo����no����+�'��q�ׁ�<m�Fo�҈{�X3F�_g�Y~՜��w�_�����ï�S-�x�����Yb�Q�ړV\����չϵ���%�a�k��gjƟi!u?-�n�9R����˥�i�D�Y��i�<�xxa��S�K^8�Oz6�"�!�x��/J�$�^"O�m�qyUO��*`��nE��M����o�I�1�g&�Џ�� �^gbZ��IS�x�oWBĂ϶pg?>	�	���*!<�g;�ꐬP���W�o!��1Vc�Dnźarf�L����2u�_��	�+����S�#mO�\�����j2U8q�\�q}[~��Ґ��~�!Ӑ�#O֍�2�Wp���SF/�ܳL��؜>���g���.��7��߭�w?�������n�#Xr�Q៧�|2�p�Z�o��v�G��I�J��[�HzsJ��O]��$EA�-~u�һ��e`���;�d�W?�)+�%!G^Rf��)�1�l��1�1��6�1�)�,)Д�kx���<�K[�7z��g�R8�)5����#O�6��'�I.��<��VJ�<K�!�ROK���j�GXH�0u�-�~s}�S����o��\̟D����9%BG���\8�U��\�\�(yj�Y��e����u�2I�H��7M^�JR�� !�\*S��c���U�E�r%�/0*�\M�N���P��%W,��(�K��4�)n��FaE��Ԩ'�`�QO�G�5�(���㢞�b�5�Di����iPO�:.a�fPGZͫ�<�Ei�/�'��bJ��R��Jg��(\�\1/��� W��(\;�%�ָ��5��ːk��F�q�E�V�\�J���F��r�A�zr��$�1����lQ����%��$��Ȅv:�S�X`R�r]��#D�WN��%&�N"WN;�=���d�q,y�.�ļJg��E����".��-M�+!:M�A]�:?p�:=��#O.2*y�\O	ˑ^�<�D;QEB�\�#�	۔U�FJS���������0Ą��Ѯ)'�F��p9��u���iĝ�oww?���/_�Ȉ�+H�}٬���i=^!������R�`|n��U��Qa�����V���ۤ$��	�'�嫇�����-���&<��~^����}��Q���g��}}��'�D�,�K^����^���"�k������6����>o6����m���LӔ����>mxs��)��óO��-��?�><�)J�|�e�o�~�����~s�9o��'M�\6���~vw��z&���N1�ӯ��?��n�௕?�)#U�}��㇡Q�u������n�ϓ���^��B(�cc����pl<>!}�.]���ʒ�KD)��nh�i`j��m�(l��g�6`�?N{m�=�c�_�e�3����͏�����}s�Ջ(!��췇�Q� 򷻛��|��u��7�DO2�?J{���'����������"V��D�Y����W�*<��Yw�������^}}�Ymv�d�F�������w�}ߙ�hk�o��>L@�Y�8�ӎr
J1��E^�F1���G)jx8w�G�#f+�l�R�X1e��"�S�b��p#+^�u��Λ[*^��$�+1���[Ψ�=���ⅹ��/o�����B7���FF�ļ�c<=��N���p��D
�/�TV��rR��^����C
cr@҉�G�u<�!a�G�x�Y�Txq�rxF	TOV��C�p��%P%��TX�(��Cx�.P&]�Y~<%P�F��xJ�Xm�"Q,�?{��[Yr]���-س�A]Ď��h4^Y��U��FÓ­$���$$��Ԥ?��<z=�i~��}�M޳��a��,�
��\����s�^�o툈gq/c@��Wm��C�ı>&�jb;GiM(�8Tg�B=���:'�(��$p{�ey���<v����m#��M��)ӪAA^��\�!�x�*��tۑ����&��xm���wMOX�#"�޵W�p�ƛ	����K]�8��� qv1�YVn�w�O�t�-�y��'�S�r�0�w�OH������ׂ���#�h���}��#"��11%�ͼ,2ļD�<�D�馋gh_�_=<�ݿ��NVJu����x�h�Z��KdWp�=���kP�h������gp�~����<]�=�L��|��ژB��s�c�KH�[!!��q_�ğ�x[!��2"�R0�V�F�M��,q�S<B�t%�6HXB���c�KH��플�<�E9��o`_*��ӥ�ȶ��xƙvu�|���.2��4+&�6)[�b�ڥ3�ELh���qyE�R��i��_y����3�+T�����.ʨs��춯4�[h(������7T�O���ﱡ��T���P?�=G���΍gX�k=�������߱-d4��86�Op���͏�ʧ����P>a�
��P=��l�gT���e䐸�"��Hzr	ya��2�<�.lI�,q~�q��E���7��-�^�#;��Ȓ�飰��%n�h�$(��MPʣ��'Am�4r�L�F���|��Ef����P[#��;=�/T�G.�J~��|�T���Z�_�'�T�'��O~��k<�O��A]ɣv������^m��R��W}�w��~}���~��9�6��ۦBu�N�e�B�R���w������Ǐ������������\�=W�����1�׫{���Z�������J�z*���֭��r	�[�z��S�x�ok�����s30���;*o��+j�@��WL�~w{�$'+r�5O�j�{�w�~{�����ϯ�s�)4�ͅ�R,���Q�q�џM#�'��(�ꥫ��������5w�=����)�1�Lg�l
n���[Z�����J��Bk��sM1���Z��Z�Y����[;R(ȋ�AڴU3����.��ˍB�m���)O��HyH j/���쥔�y/e
�X�����,ʒ�����8[Nݮ����Φ����s
O�
����¿7���L�L(�b�>;ώR$��2t�c����t��g��dm�滮��+4>}���,��8�[&(�_�A,�;	���Q��i2?NQ�L�(vK�6!u�y��s:O�a�<v/���D��n�Q�l<�?؝8S�p�j���G��^��Z�o��^�I��a�"8��7�|�n�dw�x��V�[n���1�����ó�n�M�C�v�́7R`����0r*L�;o�����l��8��4�}7ޓ��#�ZÌ�e�60�<:o�r�Q�+C6cj#命����3hed7�x�燾[���xF�H|h|�8��&�#ܔW�j��!嵑S%��1$��v���;��'#gv'�yHy~���{���1UE}H����>��U���Γ��0���3�*&t\d���av/Ĕ�+(ULi��`Ô֒�7�aN+�� 1����q}ì�k���}�h��n(�}'(�8v�yj(=EaDwm!�<4
l���9�D��-t2;x�.tRFN��n!�rj�� 2)'ˇ.dRN-ö�jv�ԍwݮ/���Xp}��o�}͒�/?�K�Ż� ?����˵W�X|��*���`�j�8+�����-z�v:g�����Z2L;��aOy8'��aG�dd�9���㧘Y��La�!Y�o�s"��J� >e{����X�@{U�@��8����j���l��Bu�:r�g�]�/����aWh�\���42�
�����B��ݖv�N܁yU�]�南��Z3�=��w�f�z8�pd6�BG���B=|��b��}�+�R�;DF=3l�xq����ƪl4�JycKm��M�3�ɓa�t����&2�?�[�3l(���bC� �F��V6�������l���Qkӟ�=�����`9�r:�W��
��Dl��Gq�ә#�&�1�G�M�m\�����ڠ}�u�e���t$O)�(��/�Ӥ�x�e��ׁ�S[��c�lI����abUf�|��K�y�y�33�k�q�:��s��:g[N�Np3no�I���    A��x�ͯ>�bV6y���w~{�����������}���in�OWo���-�����.���z{������f?}��_�����Ӣ�����꟮��_���@�?=�گ�~��o�7������������0���0_��ͯ�{6����������j_������1���Of��d�������ş]h�.z�2b��ː}��<�	���/��u�-��:r�L������ި�]����S��y;�>*�E��F�L�	;�(���6�q����P$z@iT%HLg�����"���o���|}�ť�ǫ۫��}o������������˟�C:T"I����_6�qO���[�gW7W�H���_�A�������݇��R?���د�wɶT+��+�l��Ĺ���R	{�8t�rN�;v^ں�x���1f{#��g�jz�g��|=����ѳ��<������_r�Q��ΰ��q���F�M9/F[e����?���͑�q		g�@/�����r�Kވ�5�V��;��5�^p��sۙg���'h��V�'^��1���1qz��T#q��:7�>���Ek��~�7~p|.�#��b��S�5�E=u�RPG!�l?�u�Pio�(������������pB�ӑ��^r5��-ׄ�2�Pּ䍸2� �U.Ժ��)ʵϻ�b���3���	�R*�kyed�Nny�d�1<�G�#���HC׊�f�Ѧ=�#���:�2���6��7�����*�O����-μ?�/`l��E �l��w��.~��_�G]v�^�?!~ ��.I�-���Z��B
.�X���y����UlQ�ș�ŵgx��@���p���줕��E�����dy�¬������������0[K����"X��y�>��� E������˞(���m��\>�%����ߍ>�?�9?�4��-pE���}��E����u��c��r�V�'u�~�󴑵�ⱝH�TP:���^t���u��r��_�(��i'=
(͎o�l4��Ind%�x+��kq��T�N�.ם�9$8�4�ʶ2� KȓYq�+�K��	1��ka�%��7!!�3_��	?!�
�WW���p����Ҵ���	�*�J(+����V�T=��E����d���%�%$��ﵷ�����O>�y��㿾�x�Y������r߻��q��)k��d�q)�3���O�x�"�?�Ā�3��*1.�#�mL�*p(1/yO�{� ��b�LGnT�J���<G��PrzV��������N�&��&82�M����?	�"�������בSK2r�NO�snc����s�I? ��%�%o��+�!/i#��-fYB��f#�/!Oӷs|�����>ʣؚ*�u�7>tZB�Y��y!���*�Y�(���f�e������(��_�*���O�:�/�/:?�����g'ל�%T���hAEy?�ݖ���q���S����i7��,(��:G37/�������˧&V�ٹ�����%����鼶���{�?<�1�+���J�g�������v�[U۸��ⶋ<��/h�͟��</��Ժx~@6/�<��i,5켆Wm��V���y}z��/�y߷�:/����q�ta^�{�ų84�"�O�8^�_�ź��g�jdu���+f�,��>�Ԋ�<4��ye�&�9��ٸ_� o�ل�y��Lf�L��%$�s����������O+���g�fnO��y���P#z/���|C�h],}&Cu(��FZ��P":�XM�5қ��:+���07��ȋ������������{��%��$��S�ͼ׺����r�骏�8���8WE�����x�NT�v"NQgl&��"��>yXT�����R�Y;���R�,n�
�DY���:.��4s�~!�<ri\�Q��&&O�B�k��w3V�D9¾�������;�41��t��	���فk�wz��p��8�J^��������]'K��X��L/ÿ�e�?���h����(�/����-	�h��ix��7��F���-1a���7M�j�&'�����P�š�:k�6(��gk0��4�`������u65$��C��������j( Lө"�.!)�5~B<�������6ʒ'#C�h��ǜ>mo b@H>e�Y����02�	xq{)K�y	y:��������"o��T��%p��H�Z�����!r���I(��E|1	4�:�z�(��g�Е�P8i��њ��t˓.�o����6C*B����$M[~�@�i�n�X��Y����Y�@��	2���Ò7pBL�x�-l�(���\´h2����ő�z.K`i�sE��:��m	�#}Vq��Pi����������oS�b�>w�?��.8͹?!?=��y=[��Z����:/�����8���y�]�m@��?�l���R����R�Ф��%O蚠Z����@�j-�V�T�a�`K�S��%��u�'�}�y�6:ճ�~.W(�(���;-��{)���������`~ş͇B�?���������~֊�4t�[�8bK��B�l�i6�8eK����Ȗ�)/�+�#��y�+�J�͸s¬k���6��i��.6j0%�p�6���P���WmY��ˈ[���B��!�Bf�(d�������GH���������@-o�E�ʫ�[�6]m��5P�ad�3�(Ym��;�i5촴�/zl�g�:�@�հϚ΍ظ�۰���\���[X��9w���kCu�C5T�����P!�����͡B:o��j�����K͡2|�h7��n�tk����_ps(����$͡`BY�n�FvX4��y���9����8����=�MPэ�h��a��&(��x�=Ê��5AuġS���<b���G�4ς�Pk;�r�G����Gy���ϣ<RW5[��'�����2���Dt�-=H����ٲ�#d���[O2�8�k��� I��:��bL�J��s��v�v)����y�m	9��-͖i>ad\e�2��<���m%�B�t;� _���j

p;/u'ΐPz-S\	�K�w>֝7�J��~�>��;����z��������-;������5�둜5�$����x'
f������\ט�a���-�"fu(�::�y�n"�y(�%g�1ѕ�a��sc��o�~�^�aއiR��r������9�)~��^�`����ڥELt=;�V!��q*���4�g>A�%�@�D�&�s���	3>2����<*nM��ٝ��0�p*�>����0�5(|�xC_iE^>����Be$&C��Qo\3�y�T�ID�;-���.[��G�1�l��B��ab�w�c	��{�~Ȉ�%b�䈨�m���(��W�o��T����h�F?;%�ye_�E���c�|������]P�ԇ�~�H�e/�\�2?�![ҭ}P�P�2pER�(�O�u����**#����JB�ĪU��T��(��Gnle��|�.TRF��ְ��fc�A��jc>b���W�Z��뫷w���{PJ�U�2=��L�����3���\��U;�:$�>�s
�}@�:Q��1ӊ�N}�GBԨ��H��6	i���Z��|��]��.U!�Y�Sm���)�����>	����W��S^:���l�b��)	)T,(���S
R�=����G���e m��,*�oL�:N���b��~}T���j�"*��&ƕ��	�>�.z�]���2�`:+d��Kq�Ko��q0�u�m��d�q0�����L�Hłɜ�X0��M�i��v�����b��N*�*� O��RtO͊�]��	~��Y�� Y��W!�����*� �z�(�z���T�0q�f!`�R�B�ĥ����K5���k���*��Y�V�R�X*P�f�ZyJab�^^�P:�~�R�X<P(Y�N)T,����"�.��'s.~��b:戡�P�T�P:z��(L,O�'
��'�B���z'�N	H�b�@�t�d�=Q�X0w)%�]JG��p:J)L,���Q�P�x�P:�)T    ,(���!�:%!��%��Q.H�b�ܥt�1w)���t�R�-C�Sj���A%；/y��P(5��*��BL����w1_�(���P�S�Bu��!���b�R������+&.%芉K	���%'j5!��%��b-H�b�@�tTR�X�
��&H�b�@�t�R�X0w)5�]JG��n�t�
R�X*P�]��))D,�P��P�x�0�R�X"P�KH�b��MD�����S�VKG}���촸���e�(Φn��(���"�S�H�b	@��-)T,	(!��<�N�H�b)@��()T,��L�&s�ґ���9y�*� JG>"��%���|FJ}�־�]�0����,'�/H����Y{ߐ��P(5�]J�s�Rc�ܥ�l�N�!!��%�Rc(H�b�@��R�X�[R�K�A�LV��j��@�X5z�P��aC���m�VA�N�Hi�uE��鸄͔�*����Z��%(�@��B���X"R�X0w�n�b��;ݒHP*R�XP(���8���8���8���8��6��^-��iד�:,��#���F���ƌ�K�1c�Rj̘����&�S����qj���8N��Vǩ��j�85Z[M�F묉��h�5q����&�ӑu��q:�����*�.�#��T�W���RR�X"P(YgM�ӑu��®��4�\";�:��POT�B=Q
�F묉pj�Κ�Ɔ�K��a�Rjl�����v���d�P���2XgM):�_[�Ӂ�kZ�����-1�'��a����Sm��ޚxJ��zk��% �Q��ޚxJ��a�2����Q�w�������UUoՀ��J�ޚk2U�l^���\;\,D���|G�\���Țk8YsM�#k�)��p-��ѝZ�甂�*P(5
�.�F��K��c�2}�����v
��B��B�њk���	J
�Fk����bZs�p�3K��Ӷ�Ŵ���|���Xs�xj�v
�.����K�Țk�8YsM�#k�I�td�5�=����[B���9�"�z�J��\�����Y�ĩ�:kJIv��y�N�i�c���Xo�5I\�1w)MG�]J�s��t�ܥ4m�5ɜ���&S�J�Z}뭳&�Ӵu�$sj�ΚdN��Y�̩�:k�95ZgM2�#�I�td�5ɜ��.����K��:kR8YgM
�7ZgM
�#�I�td�����)	)T,(����&�ӑu�u��&���K�`�R:g�r:g��]��q�+�5�vŃ��ծxpָ��W���Y;Ԯl�����ծxpָ�_1w)U�]JG�q�+�5�vŃ��ծxpָ��W���Y�jW<8k\�g��:��qU'�5�聶+�ٙ���І�K��a�Rbl�������o�5ϕ�x�y�t%X[�s�+��j�+]	�V�\�J����JW���<W�����+[�T���<W��.���0wk�y�t����+[�qk�y�t%X[�s�+��j�+:	�V�\�I����N���<Wt��湢�`m5���ܥt�1w)Y[�sE'��j�)7����R���$�P:�����<���<W����2�`m5ϕyk�y��#�]JGs�ґ��<W���v8���$�P����<W����2�`m5ϕyk�y��#X[MOMt�Em�A
�G
�^"�.����K�hn���	�%#��� ����V��	J
�����'8n�M�m5<����#�y/s[�Op$()T,�����.��ds���
aںԐ�ĒR���(���G
K 
���BŒ�B�(g�P�`�R:ʘ�����]r~TR�X� ��Q�H�b	@�tT"R�XP(����q3� ��Q�Ha�邹K�b�R:�6w��Q�H�b	@�tT#R�XP(Ռ*�JG�"�Y�(���C
�^�.����K����
�C�H�bI@�t�2R�X
P(��*�FG�9��D'@at�G
�.���0wEgs�+`�.#��� ��Qt)T,(j���3x���X�ER�'A
1
��B�QR��+(�s�R�`�Rj�]J�bs�+=�Ґ���P(5zA
�
�#�B��B��'�0۲��H�b)H���.�#��K�(���J�c�P�x�P:
)T,(��BB
KJ�d��k�����_�CA
�D)�5�Pj����#�.�ƈ�K�1���
�c�H!6TE�ո��Z��n���a頴�i)�^n
%i�ո*��W�V�Np�`���7��.%Ƅ�K�1aꦲ~��Z�%�\J��q��\��)\5��>��ƕ�GpոR��WJ�U�J�#�j\)}W�+���5��s�c���b\=������]J��U#����U#����U#����U#����U#����U#����U#����U#����U#����U#���s�Rc�ܥtd]5�jE�u��c �u��c �u��c �u���uՔҧYk+��_�t������"�z�J��U#����U#���s�Rc�ܥ��0w)5ZW�<2ZWM���h]5�*N�u�ȃ�u�ȃ�u�ȃ�u�ȃ�u�ȃ�u�ȃ�u�ȃ���n���J-��:(�p7�7�!�����+���ݻ�˟����=@n��蟴������x�~x�z��x{����~���OX��'��'�����珏W�������x1(֪��bx�y��	N�:/}�樂����5}}��z���������U\��%�$8'�z��x~���FP��ba��$��3�E��Z����_k�����
��Z_�Bpt���ǰ�@��G�����'\�Y򋉡����@�y�F��$z�3���~~w��������㫢ř�vm�X׷�A��g��⟯��p�?������ͅ�~�?���������u�o������o>�V盻����_��w�~{�ӛ�WW7ӟ��]����_�\=�}��/�uo��\�^]��������o�����������ۿ����v��qB�r���C��-��	������������߼���z�y�Hk�3>�`�����������x�������׿;\�&����ON���/~�vus����ng��ccn-T��߼��p���?���{�e�Bv����_����_^��D9��_�_�����������������o�o���g���������WW�����f_�����꾿��u�_�}<��������_��/��|�ݿ�_���tJ}��_�?�=��O�_�p�x��_\ξS����}���o�~��G�_���G����=�/�~����_��������~>��r���w]�.g�ϼ���Xj����W?������;���v��V.�����?��u������ps3��,��g�?j���9f�"�cO���C����28o�N�W�������V[�P��)�'�����3��P�������V�����컿����8������U�)��O?:��?<|�����t9}w����\�<�>ϼ��Ȧ.�_u5�3pH�����_}v������&!�_��ό<��p�־�Ⱦ���>�7N�ӟ^�����K�o�K��*�?�7��ߟ~�??�ڤ|xx�-<�|����$�v�I�x\�T^�-�\�M,�Ӓ��i������dp�ϿM�x���y��{��t��* .��qq2\���M�4�}�����_�W��p}拶���� E���-P�ZD��Fx��ZD���G���G/����6VւC>*�B�=�%P�j�Ǥ���Z����Ԋd��7�"�p�M�H�r��d�a�Rޤ�I����h(��Ԃ�-�!��H����"�z�
�d�a�+,���!��H�F�@��ÐWX$[#��d�a�+,���!��Hs�Rc�ܥtd�a�+,���!��H����"A=�(A=�w'A=w�D�zn�N�zn�N�zn�N�zn�N*��ɯW�i����w��)����.�F���v %���.�HP�� JP�� JP�� JP�� JP�� JP�]>���hk}C�znPj�����.�#���v %���v %���v %���v %���v %���v %���    ��$��)�9�a��;�a��;�a�&��z��g��ˈ1;L]F�ٖÐ7Xd[C�`�m�y�E��.��ַ�7Xd[�B�`�my�E�+��֩�7Xd�N���d�ܥt$�����<��v��>���"C�
��&C��a���-*T�m7*T�m7JT�m7�P�m7
P�m7����c�R:򘻔���L^>���G^>���G^>���G^>���G^>���G^>��yG^>��cG^>��M�3ٺs��9`�R:������G^>���v�|b���n~:�u��Im��.䝏B=PB
�r3P(1ZW���"[W���"[W���"[WM�jr�̎�td���o�gL]J�	S��t�ԥ$�0w)I[W��#[W�x����l]5�����U#����U#����U#����U#����U#����U#����U#���s��Q�ܥtd]5��l]5��l]5��l]5��l]5��l]5��l]5���/�t<;�/�9%"�z��Ի�c딌��Pf��[#�X*R�XP��e�(L,sWm�x*�*� �@��BŒ��X2R�X0w{O����WL]J�S�c��+�� ����cH�b�@���R�X2P(1��*�
J��!���8�]FG�a�2:*�殧tT\@
K
���R�X2PW�B�R��訸�&q@atTD�Bł��:�z=k�]��nn��Sv����)�����n��()T,(��"����R�wHab�J��#�XN��<g�-��H"P(E{�\J�3��=f.�Eo37rZ�)L,���b�P�x�x��)T,(�CB
K
��P�Bł�K�(`�R:�6w��(H�b�@�tR�X"P�>-&�P�d�P:�)T,(��bC
K�ܥt�0w)%����Q
H�/�7��݉#"�z�J�)#��� ��b�H�bi@���R�X� ��b�̥��1s)-f�]J���nᴘ3R�X
P(�*��-�\k]V.�(��Rc�0OT<P(5��*�J�s�Rc�ܥ�X0w)5��V'5n����V95��V95��V95��V9��V9��V9��V9��V9��V9U�]JGs��xj����Sk���Sk���S�����h�B�I�>�c"b�GJ@���Z���Z���Z���Z��X&/#��0y9V���ȱZSM�z�jM5��M�5Մ�7��T�ޤZSM�z�jM5��M�5Մ�7��T�ޤZSM�z�jM5��M�`�R:�]JG�T�T�ZSM�R�jM5�JE�5Մ+��T�T�ZSM�R�jM5�JE�5��P*���Z[M�R�jm5�JE��ܥt�1w)Y[M�R�jm5�JE��Մ+��V�T�Z[M�R�jm5�JE��Մ+��V�T�Z[M�R�jm5�JEj�ܥt0w)Y[M�"�jm5�<��Մ+��V�ȣZ[M�"�jm5�<��Մ+�ǻ!�	k��+@ֈ�]-���wr �g�׈#a� �`�c�����	3�j�f:����8�%��a�S�[�Z��9O�n֐�l�ZCN���j9��f�5�+��֐�ȵn֐�l�ZCN���j9��fz����B��r�Ԍ�K�(c�R:���pe3�r�Tk�	W6S�!'����6M���pe3�r�Tk�	W6S�!'\�L���pe3�r�Ԃ�K�`�R:���pe3�r�Tk�	W�R�!'\�K���p%/�r�Tk�	W�R�!'\�K���p%/�r�Ԇ�K�a�R:���p%/�r�T��)Ek!��UYϷ�/�N��c`(9ZCN�ʙj9�j^�5䄫y�֐��YCN���f9�j^���e��&/#��0y960�*%��W�����j^r\�KC��yi`�q5/9�楁!�ռ40�ڛ��͔����m�70��|CP2R�X
PKEJY�3Y�4�D�{��n������he?n�l ��:�y���M�=L�D�bRW�%�bIH�b�@*��*�
J�֏S
����XB&��)����ґ��Bł�K�(`�R:�~�KH�R�B�R�B���qJab�~��:�X���Bt����t�ǳ�D;n��z�K�Xu�	���fJ�8&�m��1�3h���T{1ש�(b�S�Q�\�ڣ��N�G֑�3�XR�X"P�Av������R7��X!�|�qK8pV�=Q7·��g5��yn���q#��j�_~������������p}���O�Bx��}6��^/%�brz���s�1���B�/�����%�M�����k���7Ŷ�Sl�e�e2-�d[g��:���n������[�E$����_,'i{�qˋu��C>���>�w[�$Z�.R'~��Eyx�hj���5���P\��ZAut����W�׏��/��^�Z(��|la���?��~�C�]������_��PG;�}��WG�O���D��=����ONm��������_<��W�q�Uw���w~{���?�����������V���������:�_]|R�Ň��} v����{�u�3��w�w�/ΆI����N���@�?=�گ�~��o�7׽��������w0��� _��ͯ�{�a���M���w�O?:�]���Z���3)��b��_|���3O?������~��g�v�	�h~{���e��������`�����i�SM<Ai@�L,���O5�E���Xp���X��{��'()T,	(BŒ�B�R��X*R�XP(ٚ�N�}��������tH��9D������e�����u�s�x�]���@���3L�D�2K�8.OŒ�B�R�"T,)T,(~{,��+Z���t� %P�x�P��D*��*�]BG���K�Sl�
��N�@��"k�TP?�rg���	�6@��]����*�!� �ʷ��#���#����v��*��DŒ�B�b3׿q�wT�B�R�"�{iHab�(���˒�j�ήG��B=P J�("��%���ԥ��1u)1zL]J�ަn�ĸ�R�X� �c�H�b	@��"R�XP(��*�JG�"��s��Q�ܥtm�FNG�#��% ��Q�H�bI@�t3R�X
P(Ŋ*�JG�%�7n�P*��Mo���GJe((B��BŒ��X2R�X
PBX_MZ�T�P�4�D�d�&�����X0w������Z?�O�LasD
�D	)�e�Pj�)T,(�sC
Kq@	L,E�B���^X�;�z�9�+q�ԥ$]0u)IL]J�S��t��[81��*�J��!���
P(1V�*� J�5"��%��Q�@I}��v��:s7�鷛)6w���͔�&��"L,M�B���XR�X"PKBJ�ec�V�d���P
R�X0w�n"b��ڛ�
��b����:)��"!H�Rk��SPd*��4�pԦ�x"���2P<KA
KJ�biHab�\U��=�����(ZS�Q��.�h���T,	)i}+�i%#�z�J��SS
K
�F�)���zj��-�S<R�XP�k}�a�����Xi�ҝ���*C��+o�5�͔�*1�I��2���r�3�ݔ϶���b�N���6�u���T*zJ��X��� /�W�dG��H��J�q����L|O=&~�z�Y���/�ˇ��_~�	��w���{Vg���7��nqx=Ӛuz�=��"f~��[�6� ����መ������C�e�\�����O}	�������Ȭ��*����#�LI���&��LJ���^�u�L�n�>kսm[�5 E{�픈*�OŒ��_@��6҇�Q
R�'�@	�aV&����L,��S
�n�b��MT,6w��fl�$�P�d�Pj�n�R�X*P(5Z�O)L,���s��X�ۧ*JG��S
�.����K���}z�>KA
K
�#k�)����}z�>����B��B���}J�b���u��VFY�����3���b���iz\1��֣�h9�vj����$��&��n���ݟ��5�-j=�;}��yx@��3�DY�i��CF��V�ՠ7Eo���áDҴ�6�Ħ^�����1�\{[�żQ+D�BP	z<X8��C%�g䑯�;T�n@�r�
����a
��X�(����[�R��X���BŒ�"T,)T    ,(���!%�����g�����[]��Z����l��Z�2���*� �Hł��RײN��e\/�����̜g�Z�q��N.r��Z�qީ���	�=�@��o��{������V��Si�P_ ��T�����_��L��̢KcH��tQ��g�H��X�gb�^�R^tW�@���v�4�b�G�^�L��s\/��\�	E����o��^��D�j؍&���jg��6W�3*=
���L��dH��?F��{$C"� 96��q� �Lo?Ȫ3�?�[���'�[HH�b�R����*�
�{ ��p݃5;�p݃u;�p�:X��k��by2��<G�n���5A���{:L~sQ�O��T��Y�\-.^��bƻk������7?���݇�����Q�*�p�pu��p?}!w>|����ݛ�M��Ⴝ^�|��`�Q,T��q-_�y׶���ڼX��]�����;�',V4�={tC�&k��0Yןd�՟��Z��L���'�p�BЍ	k�:%�X��FY��ܗ�11�{��r}������d�\�Vp	'L׭�Q���=
.M���.�`��i�{Rk��+�;u��*.]�r
�.1��`s��YN'�3�ʦ��a$�����U@�4U�������*H����c�o(�'t ΆZ�z؆�<z
Z<�������a��J�q#�i7 g6��6"�S��X�toBވ���e���9>�ř�?��_�]W��}ws��<��O�w��~<������Ӆ3o?�"w��?!���vjk����秿��ǟ��%�׏�?��?�����ka�훫}�ß�)��,���R���\p�v�эJp��~8���|���ZB���"8l���ןon6�����7�����q�Gga��̍�[4�q�Mn�:w^��N�-Z�xjY�^o�qM�ӎ&�ye�	��6�Pn��ަ�_+�L��L�z�7�t8jAk<;,�+�zj̦K�f��o��P
z�G����~�;������No���{��;��u����_]�o��'p���:x�_�ŏz��6��׼�� �����������ރ_|����~���[�D�,d���/x�ӏ���e������B�ERco���P����i��s������7'�� ����x����7foK����vZ��5�د�v)�kp�� ���y��^��˞Z�w�����O%��|���9�G���%�y�@yQ��)�:�X�c�?#U��p`F1�§�պ�dcv.���f��!@IT�V�7?+�D�i�w;Ǡ��Ǡ��% �����i=l;%!��%E�X
Rtx���2�T�P�Ԁ�k[O���I)��P�G
K J�b��T,�����7Q����!()T,(��bK��t�A�P:�%K^8ْ%/��l]�NG���#[���Q�ܥt�0w)��"?�-�,l��N�p�S�]�`(��� !B�@�R�X"P<KB
KJ�b)H�b�@�T,�����`�&&�����Xl�N��>h:@��D�P:��A�;�#�� 8� 8� 8��8�r8����2�]JGs��Ѽ�'M��R�$�P�d�P:�W�(T,(����:
˼:g�P:���(T,(���8
�.����K���NG� �����QkH!b����Qt�*���+���@��!!�E�P����Ԣ��MN��l�`��a[׶���;]LKPR�X�!���Z7�K*�)�CA��X<Rd=��v��J��@"H��'!��%%P��P�`�F*L����1q���MT,6q��m	J@
K
%E��BŒ�B���P�T�P:�)L,���Q�P�`��}����ps���qsO0uU��)6u�r	JF
K�P�T�P�4�x&����(���#��% %R�D�P�`�R:����������(V�P�4�P:J)L,I�B�(y�P��P:J)T,	(��RF
�.����K�(��͜��C
K�P:�)T,(��rD
K
����B�R�B�(W�P�`�R:*���������x�P��P:*)T,	(��JF
K
��R�B�ҀB�:�0�T�]JGs��Q��[9��V9��V9��V9��V9��V9��V9��V9��V9��V95�]JGs��Xj��Xj��Xj��Xj��Xj��QK�Q:J`�5JG	,�F�(���(%�����0w%����(YOM���"�����Q���R�X���W�R�x�P��P:���R�XP(Y[m:v��`�R:�]JG�VӋi�X���&k��5�T,)T,(�������^ѼNI@Qm�d�P��D*�ju��f�&��wE�
��p�p	��n����;	S������pz��+��Kz�Ik@��C@��8¿���.�7��)`�'&��}��D��%�:�PIB#@ېO�A۟3� Z��^u&�JX��Z�����x8�v���T�8����2��E0	g==9�Fm��X{}�n��G+Tx�,�����No��a3���������[�O�[�)�*�Ƿ>�x��O8wz��m%�lja?��^u+��b��'��b��'�k���'�k}��'�k}2�"u0��3�VRǚ8�[�O'tk�I��n�?	�Э�'��5�$p�̘�Ԡ�`S�,�Ɣ0��'��5�$r�,8����<�mm+�n87f����R���j��i(�kQ
.�Lg5�]��%r-��%r-T��Z���O�P�>�C��ڲ�:%!%1��DłY��Xl��S��A>e�P��ph�e�[κZ�
>7����x�!���P�D���זN�)	)��d�*��*��H�ҐBĒ��(�2����D�bs�P&���B��"T,	)T,(��2����Q�1S:�`2fJGL�L�(����Fg�)�`>S
�'�|�xn�e�����,8w��`��0�&������elz��8�A���ʠZR�0גzsO�#��)���<���.f���gP�Ǳ�����V!8T��1����G����f0JקZ�T
קZ�T
ק��Jzݍ=+o��R�>�ڡR�>�z�R�>������{��߳p=i�,�Z�YL���pF=�$�shպ�R���Z�R9�[�S*������ɯ>�����p(�C���o��|}�r��ڋ��^�����i���S��S_ N�G̜=X�W����3~N��;���1	��z?���6[4?�?�7�}r;�f{'�%�i`����٪�ؿW���=��No|�6�|�����^|_�dwPow�u5T�v���&�So��ztJ ��(	)jۯP�ە����R �PP�vJq_n�(���7���loS�� �������hD�ԉT�����(�҉��";� �JF��K%��o7p��P�V�SP����Pߑo@���`��t��Ӹ��T�7�5|�T�l����O�����f϶z��x׼[\�u��g~gR������̯M:��÷a����W��G�_����x}wq�������?~su���F���2���w���W�y�#�y�nn������gW�����n�%�>�3���O�p���Ⱦ���>�7N�ӟ^����g���p�Շ�g����g�`���* ��QG���#�r� ��	(T�PӶ���P�b��p���;_x
:Kx�z����)�µ�8I��V}ǵ[k�)(�0+P�aV@�R('�P)���R]e�o7O��fJ�P�Q��_o�Ic�� ,�K/8�ҳ�_�$�|X8��Z��u`q�U�������L����NE�*��B����>�V
�}m�F�ζ�)��T�a��ό�~X(S/���ɬ���}�c��|�O����[������L�����*���^�K�|,yI��4�Ya�XO��&�ujn7�-�}�/��� _�
{[�j���ٞ'bϫB�f�u��o�g�Zc�՛�PS��[�����v�t-�Yȋ������(����ڜн��l�u��+����,	�D����,�+�ҏo��m0?�w�b��r��B��T    7�]�1b�y��1/��%��_��s���_hUwD�!���u�r���uF7]Kj�SR�X
xD&���X�b��D��B�bp8�l;%!��%E�X
R�X�0U' ��.X���xp�*��%��\Yr�Q_\��[��QdRq���n~�����<��7>�e�ȼ.�@�Y��+*��**L'*��_y�`�N��5���j���b��;�0|���+9.�
�},t�6�a�Cu�E�YZ��;��{���l�N��N�AIq�fPR��8�AI�;㼣%�����u�Z���RV�k��߼8���kΰ�Q֏/�aYr�o��~P�����/L�yfkD8���b��{�Q�,�K(�%k�Q"~쀵"���NK�0C��5���R�2-�,�׸������ڌ���z}�:�?�>٭Od7�i�
C�F?R�`���X��OT,&����Q�$�P�d�KA
K��biHab�[��ty��U�·*y�d���>6/��>6�A��ћ�L]J�S�c�ԥ�h��M�C�H�bi@��h��)����Y��ݳ�='F�g�S(�-i�s:�;�:����V0�9E�]JGs�ґ���#���NG�TV���#��% �ґ5�}�td��N�td�`8Y��NG�����Q�ܥt�1w)��|�T,)T,(���^�BŒ�B�hn�(T,(���6�B�ҀB�hn�(L,s��Q�ܥtTl��BŒ�B�d�P��P:*)T,(���C�t�V� �눠x�P�`�&*��D�bsw���*��b�HI/\1ڮ�];?_ ���4�<O�P�x�*��*�J�3��b�̥��0s)-6����bkH!b����bu�*FG��P�D�0:�.!��%��Qu)T,�������etT��n�tTE�B��B�HR�X"Ptl��󬒐BŒ�B�H
R�X*P(IC�nt]w���!u��Ϯ��S���ԥ��1u)1z�����H�bI@���3R�X
P�N�W�P�4�Pb)L,A�B�1x�=�s�����t��	��K�1`�Rb����M�̉1�P�T�Pb)L,��c�P�x�Pb�)T,(�cB
�nbF/s��Q��[���()�B���yWے�=�䐒���)共K��e;�̇9��Rt
H��(�름&[R
��T�Bł��'��}ӱ�~��D�N��(��T��1w�v!c�R�k�ܥ�p�*�ip�*׿��V95��V���:�KZͺ��Y1��������UN��UN��UN��UN�37��j/� ��n.���K)�`�R�.�����Ok���Ok���Ok���Ok���Ok��Ok��Ok��Ok��Ok��Ok��*�.����K��:j�8YGm����P(YGM�#먉�td5q����&�ӑu��q:���8NG�Q��a�2:js��Qs��n{��~~GKs��n;�zs"ѷ�4뵉Pjon1N��b��]j�����4�u7os8nV���0��X���Y.���}>��'�|"T7���nv��^�����&8�j�@T("=��߂�d1�̧+ ^ƷF}��	f9���f�A�{n��t�������7����<J�p� �I}:��g�c�s�GI�|:+�yZ��/x
��{�Y|=��z���z�"���y�
3�k֋�P��!��_(��Oۻ�D	�����c$�š�q��'��#ma�f��q�P���p���:��է6�X
W�ڬc)\mi���p���:��Ֆ6�X
W[ڬc)\mi���p���:��Ֆ���K�3b�R����p���z��Ֆ6�Y
W[ڬg)\mi���p���z��Ֆ6�Y
W[��b'�r��ɤ�r��M�}`��N7��a^S�F���N���AeLp�ʸL�)i (�t�M˸^��`y"(\��c����W��d7c���U'�[,j���9Lx���v���-T���3��
�|�v��x�Fó��8qE?���)�4<ݒ�E�g��ę�e��)�o�v�Y�U���f�V�j���[���o�o�v�Y�U�C'�5k�J�>u� �V+�	+��fMX�64k�*E��f���)���\q�|��'�P��Ҋ��ΰN��-�tl�@K�0�c�k�9..�Ǆ��c]�]n7Gk�	�ysW�67~�tk�~��s���J�p�y�D��)|w׷�jӏM%�PkI��3pQk)�a;sQk:.��s(.b��)Ϭ~�;�ɹ�����܅���-N�-�6�xi��[ś6��!9��W=��7��\�G�p�j���w��v�����йgP��
�_4l�&'�f�__�,�*�����5�����)(Č$ͯ1?R�X�	-����,��N�@!���B��B�Փ���P{;sW��u3s7�6S�Rl��n�4�0��=|�{��"H�b�@�T,b��lK]`�����ş����~{}�?Ci`�\l�����36/td�7H}(��~D�q���tDͷ0�/����F�"+FK�"tA/*;˫����|�5�)}�w� V^�<��t4.�*��+��۾�Ľ]=c/d7�`�#����|�	��ȴf	u��;>�]�F!�B��K�Z�SPRə��Kʿ�?�W��� �D� �z��Q®G!V��sډ�)�j(V�`�^�8��`�^�߅`��]�A���Vp��V�NIH�b�@����Dd�ݨ�R�m?��]J�s7E�����v�cZ������T�PpV��庡_�)��ccHp�+��]�f<��5;�AW���r�xЕkv�����<�i�������5;`<O��WO�����K�]S�ju*�.�d���81��<mW'��J�`-7N�`$O�շ?�ƍ#��M7u����Z_�p�$�p�F�7N�s�Rc�ܥ��0w5���Me�P��)t��)&w��4-ֆ���`Ś��Q�k�zGiZ������5T��4-�>=�HP*R�XP5��A���]F�"8�KAwwnZ��	�B>�c�ae[��j3�v��pk��>+N��ታg����r�aqڧ��jq�Z�6߅k٬�y�)q;�ڙ��	� ����j٬�y�)��D�P-��3���e�v��C���K�ls�j3��y�䐠R�X<P(Y;�p�!A�@�td��%�%�ґ5)��
JG֏<\r��1w)E�]JG�V<\rHPR�X"P(Y��p�!A�@�td��%���ґ5��n�X��p�!A�P�`��^��1�lU��!����.%ƹAW�7%��*�J�s��oJ$((��]9ޔHP(��]9ޔHPP"��'s��oJ$b�ܥt�1w)e���$+�%%�p�B�/��/7�0OTP(5A�_�1�7�:���Ϯ�9�#�z� J�%"%�V�W�+�WKB��5n�%E��L�@ł��X0u#K��ML,S7Q���=��SR�X"P��%!��%�S��P�T�P:�)=���n��PTG�)�*�]�*�N��MT,6w��프*��b)H�b�@�T,)D,�9�"�)T,(���H�b��et��.�#�l�FJG��P�T�0:�!��EPy�P�x�P:��*�JG��Bł���X0wu/���i��N�Pz>'�{ؑ����Ki���M��� ����ҴH��pka�k�r�r搈�P���g�P��4�罒t��Rz���ş��j^|CJ��^����3F�ĥ����K5Q�j�&.�D�\�Y6s3�,��*�a�@�"%��+�S�WHsHC�@��j� ����tH�b�@aց|�ԥ�1u)1FL]J�Ѧn��R�X�
�G'A
�
���B��B�,���,��uj`�NG	s��Q�ܥt�Z�t�Z�t�Z�t�Z�t�Z�t�Z�t�Z�t�Z�t�Z�t�Z�tT0w)�]JG�5NG�5NG�5NG�5NG�5=4�ܵ��.y��R B�,�Ɖ,�Ɖ,�Ɖ,��[��o��9��];ȗ9S��t�ԥ$]1u)IWL]J��R;����R�B�R�BI�Zj��7S��v��q;E�B��B��Zj���S"P(YK�x�    �v
�.����K��Zj�{�SR�X��Ԏ��m�R�X<Pk�o�N�@at��v�Lk;%��Q����2���]FG�a�2:
�R;�*��"H��W��Ԏ�Jm�% �z/(����v�Uj;%�ґ�Ԅ+}	�R��%XKM)AOI_�%��=՝��S��D񘻔=�.�F��K��Zj���	W@��&\M���p4�zj���	W@��&\M���p4��j���	W@�.����K�Ⱥj���	W@��&\M���p4��j��k�	W@��&\M���p4��j��k�	W@"�.����K���j��k�	W�������%4a*��)�������o�Z_M���`}5��V��Մ+[	�W��$X_M�b�`}5�EB���0y)9&L^J��W�X$X_M�b�`}�����))T,(����&\�G���pu��j��y����NiHab)����
�.�#�	W���&\�G���pu��j��y�χ��))����I{�I��0Xc�x���XP�D�X;�2��"@�T,����s7Q�`�&*���x�VJF
K�P�T�$�Bj�B�)��E�0�4�0�Z�$�Z���Z���Z���Z���0u)16L]J�S�#�j�#�j�c_�Qb��5JG|�F�(���(E�����Z�t�Wk��"�j��Qt�������et��v<�t;E�B��B���jǣJ�S"P(Y_M)�c0�o��);=yiF�H��� �R��Վ�n�4�Pj����=�.�F��K���j��5�S"R�XP(5Z_�x��vJAJ}AG+{բ�Վ�tn��!�y"���N�P�x�Pj����.�ƀ�K���j�C:�S
R�X*P(5Z_�xH�f��Վ�tn�R�X<R�1��i���+iN	@��h}��Q��)	(�#�.�ƈ�K�1b�Rj������k����N�Pj���R����^�t����j !�E�P�������J��U;���R��\�.%ƌ�K�1c�Rb��j��Q��))��\-�;�$���S"R�'J@�$=w��C�S
P�����U���K
�ƹ�V?��"@��Ƃ�K��`�Rj,�����]r�X2R�L�͔��vJE
K�gb�)L,U�R��K�7Q��@=O@��K}G�e�B�L�H=&n�b��MT,��*�g�j�0��Li)L,M�"T,)T,(��%"��%%P�d���	�V��X*R������X���et����@�(9�*� FG�E�P�$�0:J.#��� ��Qr)T,(���8�0��nr/��VtfTw��J�C0u)1
�n��wu��4v�&�\J�b37r���*����zi�1���LC�a*`��AR�G�(T��)T,(T��R�X"P���c�R���4�1y)9z�����oHab	(��� �����QH�b�@�tR�X2P��ZR(Hi�]�:s7�p��:s71�D����cb��*�b	H�b�@�T,	)�'�fJ�K�ԮS
R��R��XR�X�.����K�(��-��R@
K
����BŒ��:ZU@�y��v�R*�0�GR�B=O
����Ē(�3f.�Ō�Ki1c�RZG�rZG�rZG�rZG�rZG�r:G�r:G�r:G�r:G�r:G�r:*����
�.�#p��#p��#p��#p��#p��#���#���#0��#0��#0�����K�b�R:���F��bM5�0�XSM��b�H�b	@�tdM5�P�$�P:���R�X
P(YSM)T,�������et�����QR�x�P��0:��TS
K
��lM5�P��0:��TS
K
��lM5�0��.�#�ܥtd]5���b�H�bI@�tdm5�P��P:���xNG�U��(�X���&��1�T,)T,��]G�WT��ܥtd]5=F�z/)T,(�����*��|G�US
�u��I�XWM)T,(�����*��͏��E����|a6�v��������ts�����O���� 7�g�O�_�]��]<\?<^��_��{��A?��?�'�P8iQ���������ǫ���m��WE�	Nu��j>����g2�X�M)T,(T�a�7�������s�S"R�'Z�úỖ.q1&V�����������Ƨx��n��� �ܚtz�(�m6�0�C�,a��)'�.�]�s�8Ո'�q�O��T#�0ǩF�Ztz�)KF
�M�ĵf֤;�aJPP��̚tJab�&��sE��B��B�ȚtJ�b��_���Zi�ZC�q����G1g�d��'��'����Wo���?�U�s��Z��D-�C��-�2��e1u�3ǐ�y���6��Ieԣ�f���ݿ��wȏ�8��-��~�i�afLF�B)l�����0���:��U�e�
Wі�S(\E[�N�pm�:��U�e�J�:"�
Wі�S(\E[��r�)�������U�劙L��$w�B���pU��}�&w��*��y'W�\�3��䪡�����a���X`���t�9�Dm(r��{�|����}|n����؅m�__��~��g��⟯��p�?������M��|����w�W7��������xws��.��W���}����۫�>����7���n������Xk<I��fq%j��;��,`�rū���X�76
���X!���X�����y����%ئ\�o۔+�-`�r��lS�h��m����f�lS�h��b�G�j9f��o���|�~us}{���L�>�n��9��K�hf�RW2S�������fz��qQ�p����4kO( .v��#� f?��x\;ғg��J��N�u�{.F�A��5�.�!��W/_.���Αv(�ʩ�+i).��f���.�E���Te�q�PZ�V�djx�PS��� 6�:�[�OH�k��Pà�0�yX&2�|�},_nG˗��Q��R]�7S�SJ�R�����ۻ��W�G\�Z�v���L�ٓ��>+|���������Uh�LG�;�����ou����n����y%���č]���y�(���,�=��+����]���]����o��|}w��-�ꓰK
껜�!�s���Ƴ<�B�^���<D�6��h��0����U��bLo|�q���P'�p�C1����j�w�P[1+mD�;<��p$ȅ5��z���Λ�6�q�d��zz��s/Xյ!.t���u�I"�����ġڦ�Q~�lCA.�x1ADT_��u�N,(�NLu����e�!9J'Ʊ����UP�J�����v;�1����m�-`�ss�������vncn��ۘ[�n�6��ۧ���*`�ss�����v;�1�T�]JGs�ґ5�=�1�X��Os�+�Z�ۘ[���ź�ۘ[�Q����q:�޸�6�k�{ncn�.�wT�Ui�������etT�����պОۘ[�������Оۘ[������zۘ͞[����{�I���w�o����k�� j6I��j����
ѕ���2��%��Z<h �f7��bϮ{T����Y�ǣ9���ꈌ_\������53�-̭�a����jf?,̕��'�D��/{nqo�\�V3�Ң`�RZ�����Vk*{nqo�N���V�${nqo�N���Vk{nqo�����V�{nqo�F���V�{nqo�����<�.�#�{nqo����V��znqo�6���Vk�����z��[�[����7�������j]\�-�������0w)�]JGS3v���tp*����~(�����H�b�@�t4�_G
K
�<���#%-:��rޕ6�d�PT��I�1u)1&L:JF�&9�J)T,(��RD
K
%���B�R�B�(U�P�4�P����Ē1w��Q��M�2)==ld�)3��b��K�rB
K
��\�B�R�Bi17�0�J�E�R��{�R���c��]�>ҊGuA(���.%肩K	�`�&b����8�T�P���cuHab�J��#��% �c�H�bI@�tT3R�X0w)U�]�Vm�r������(���G
K 
��    �BŒ�B�e�P��P:j)T,�������etԜ�]n��<R�XP5�BŒ攸x�����SH#��
R��@a��\C
�8�0bl��ˈ�	�.%F�ԥ�(6u��@�$�P�d�Pb��*�
JGҐ���P(yA
�
�#�Bł�K��c�R:�6w��/H�b�@�t�R�X�
�� H�b�@�tR�X"P(��*�]JGs���a�J�f�촁ƭ�l`�q+�a܊�f����ƭaj`�q+2�a\|7�+�os��Q�ܥt�W ��S�
�xj��T<5� �����7�Ը��Z�t��X �T*�L�@Q��4�0�d���Ē1w�����T�))M׍��D����SR�X2P<KA
KJ�biHab����d��A
�n�b��MT,6w�����*�JG�V;�L��R�B���jǓ�VS��v<�j=E�B��B���jǓ��S0w)U�]JG�V;�L��R�B�R�B���jǓ�VS��v<�j=E�B���>��Վ'S��%�ґ�Վ�j��`�R:j����4K6I؉�]
;?]8��.�Fk���[ť=(�Y[�x���X:E�B��S<R�XP5vJD
K
�T딌*�B��R�Bł�K�1;��%t�)6w#3����F���jǃ��_QD
u_P<ӾX_�xL��X
P(Y_�x��zJ
�#��ZO�ܥt�1w)Y_�x��zJD
K
�#��ZO)@��G�W;1��ҀB������ձX_�x��z�G
�.����K���j�R�S2R�X
P(Y_�xB�zJ
�#�OHYO�P�#�OHYO	@�td}��i&�)����"�.�#��MX��Y_�����XP(Y_����z� �ґ�Վ[����P:���q����JG�W;n�����K�(a�R:���q����7�^O����x\�;In'�_���R�+�@���Z���Z�z��UN��UN�sWO#\t�]҉�]�ݔQ0s)E�\J�3�R4�j�S4�j�S4�j��"�j��"�j��"�j��"�j��"�j��"�j��"�j��Q�ܥtT1w)YW��A�zJF
K
�#�y�>�SP(YWM)U�h]x�Ǽ+nذ�C�0Wd]�q���j�����<:%�Rc�ܥ��0w)56�]J��U�T�G�4���u�<U��)�*F�b]5OUytJ
3��y�ʣS2P�u�<U��)�����a�2:�y�ʣS)T,(�����*�N�@�td]5OUytJJ �9�����<:��ґu�<U��c�R:򘻔���vܢp=% ��%�ґu�<W�!�U�\}�XW�s�b]�q����:�����3ĺj����y�>C�.����K�h⪉��E�zJB
K
����v�P�T�P:��jG
��U)��&�ڑB��B�h�)T,����"�.��hs�I,H�b�@�tR�X�
��$H�b�@�t�R�X"P(��*�]JG	s��Q��K��RC
Kv@�t�)T,(��r@
K
5ϐR��N�(��rA
u_0w3n̘�����]r|T)T,(��J@
K
����BŒ�B�*�
JG�!���b�Rϣ��K��܍��j@
K
����BŒ�B��P�T�P:�)uy�Qn���؉��a���2��iJ�3��b�̥��0s)-6��\���=���U+b !�U�P�n)D,�9�0��N�B���ڻ�*�F��a�2b�S��w��������{א��"(���R�X<P(I@
K
3P�BŒ�B�H
R�X0w)	�.�#os�p:�*JG> ��%�ґOH�b�@a&�/H�b�@�t�R�X�.����K�(���
�}H�b�@�t�W��T�J�=�j\	�S��^�SR�X�T�J�=�j\�������"�.�#0ո�u�W���T���=�j\��S�+_�`�q��L�����T���=�jC���Io�W���.����K�Țj�Vxk�q�vJ
�#k�q�foM5n{�N�P�x�P:����`�D�P�#k�q�v
�.����K�(c�A�E*Լ�#��O��dW���N�z��/�u���o߾=\���w3���=�����7��W��w��7��.��+n�K���]
-�H���ۻ�˯7������E]�{1���?\]?��޿~�zw���9�is�+T�֌�k�Y?9����7,A\TKg�9n�N)@�Z:k�q@vJ
qZt�֘�6��
��U�c�����TKg�9n�N��˕���}f�d�y��=j��Ņ�b���We�`�Z{��g��Wo�n���}z���j��^U=A�&�a�\�$n3��ڻ�N�.�����_�޽�v�pu�yx!{���i��4��e�����[�Ǩ�)���Q_
M�=8�Ӱe�f�@��<����'�
ysl3��W}ػ�:ӏ�|n�⣈� �����esl�]r6��׽�޿�M���������ۛ�����Y���U+ɓ�^Ȝ��-,٤� ��nh7��HW����������쫯����?�_��W_]\]^����ჾ�����r|���������9\�����_^����a����_����|Wż���p=�E��z�����C�o6JW���@A����[CE�2��`�Zn��NA��f`�b���₠&u<T6�f�\n_�N�g3<
������ ⼖N�H�b���U4k�*��JK��k�|��P�@]M
�S�6�qO�տ��q�=���q�{z���el3��D�+]�������JHDal��YK�	'd���n} �d�d�NAs!f�[�	�3�l�[{"^f=�_��_]�z!�|{���w|8��ܾ�����������w������?��7��}��͟��&���"�zU[�85G��5�L���6Hzf7�g.	}��	睨E���G!�,�"��u�8c�ĺe�?D�>��Mi��[�����˫��H�;ie�p2�#O`��z��Jj���ϔ⑒��:˗��yv-S"R�XP�{�.S2R�X
P"KE
�Mޤ���)`b'._��N\�����|;q�&v�em�W ;q�&vVǗ����c�v����T�pIא���֤�-ڙX�1�**����\#e�hݢ��%!��S7Q�`�&*������E]����\8��\8��\8��\8��\8��\8Y�Y�h�b)H�b�����a-;:H'zG|B�ܥ��0w)5Z�X�E�((T�ZCX)T,(T�Z�W)T,(T�Z[W)T,)Uͳ�i�jHSH���z�J!.(�7ۨI�ެR�XP�I�ޫ4J���F�1Z�U)T,(��5Q�B�Ҁ1Z�T)L,��K�H0w;%ʗ%-SMG�ܥ�(��M}<�Ll���o��u~����ۻ�����뫛��W��ME��p�X8��̺��r��[f��V���-��2�!���g�~�L,~����	ݳ�7�wj���C�~�6��cw|�.��W��u/?A>z���x��g&���O�S��]{��Dl�5C=�j����K���XPԳ/�&�g�uS�B�br^eEŒ����zm'��?SLAuI(T#k=S�0�X�R�!`b���R���U�{���IK}�EH@uWp��{ks�NL�Ԧ����Mu�#f6��D�l�����T�0���ǚ�z��G
K 
�nX�Q)T,	(T�a�F�P��P:�f�R�XP(Y�Q)L,s��Q�ܥtd�F-��b�Ha�Z�lJ��X2R��R�B�Ⱥ�J�bi@�td�ơl��P(Y�q�,V�L�_��`�Rb,����.%Ƃ���r��P=S�PASڔ2I]N����"�������8�|Ezv�	3u�2L�Ƒ�\��m(T�0uG
K
�2L�Ƒ�W���?5?CVVǊ�K�QS�j�*�n�]~_"�	�a�RmT�ĥڨ��K�Q�&.9�o)T,	(T��2R�X
P�f�U�P�4�0�Br)D,�	P1&�Bł���(9�]FG������e�P��0:J�"�����Q�&�P:�bp�$ �ґD�P�s�ґ`�R:��� 6IE
K
�#����(���G
K Jב{ɸ�N!q!BIH�.(����    ���1u)1zL]J���n��)iy�L�@��R���B�1$�P�d�P:
)T,(��BC
K�ܥt1w)E����QH�b�@�tR�X2P(ł*�
JG�!��&JGI��ܗ��K�(a�R:J6w��G)%�P�d�P:J)T,(��RC
Kv@�t�)T,(��r@
�.����K�(���V�\����r
��ܐ�ܗ�B�R�X<P(��yfE��0�M!!�%�Pb,���I���K��`�RbO�rbK�r5��*'F�Ը�T	,5n)UK�[J��R�R%�Ը�T	L5n)US�[J�*�.����K�\5nTW�[��U�VA%pոUP	\5nTW�[��U�VA%pոUP	\5nTW�[��.���0we�	Wo���&\�I���p�"ٺj2���3d�	W(���&\�H���p�"ٺjgd�	W����&\eE�]JG��K�H�������4�y݂�۾w���:���i��\���_س+[�M��l-7�J@��܄+��r�$[�M��l-7�J@��܄+��s�f'��܄+�;�QN;��]�����M�*S�jU<�6ժXKN�:�l-9��Lr�����B��	W̒�c'\1K���p�,�:v��d��	W̒�c'�j�l;�Yr�Ԧ�1�)�Z�N�b�l;�Y�u�+f���:��._�5􄫘��Г���㬧���:Y�O�����#��\ʙCM�O�Z���u݋@����e�.�o�F��������Éj���ƪ��R꡴���Q��	OKT�l[�P����PT�mmC�ʞr�O�y&�3�8���puT�:���u�����AT
�=v��n�����R��JJ`b)8���%KIiF��`k0ꮿ���t<��W\�1�6'����ț�Vu��-�'�e�S;�/�fԲ��\p�������5��v��,�2�z~Dm�Ī8Yդ�p#+��(pÍ����h+�#�a��Bu�~���܋��R�Y^ԉ>�ˆ��gFb��ĔNz�VIKa5ԉ+ٶ4�D҂�-ѡ$���CymK�3u�����}��h����t�>*��ѥ���pH��m�g��5R4��ٔ���t�4)�m�4���g-�mUJ֦�Dy����))�]���w9L11D��[�p��zJB
K
ӫ/`�&�W_�nMT���ݚ�w�5Q�"��L?�&/��+��˴������ڭJ�b�@�t�j�t�j�t�j�t�j�t�j�t�j��g�U�u�;�O�>�Q͜=�.�F��:��a�Z<N2j�ܛi���7ړ<ܿ~w��߿���eh�z���_rB�"g#�p���8A��tp��Y�i�����������W?�����|�_�=���O���Ic�D�������ٴf�S���`�]��nQ��{P�q[���{P�q[���r��d�t�#Npz�4�_"�uꎥ[R���=���-ܳ���=�#&7�l�8�E�p�q�&�ӎ�����l &�~n��(	���lz�i��N��:	S�z�$Ly��Vl��s�b+מ�[����ʵ���VmܖO�X�R�X<P����5n`��AGK�˔���l�J;��K�_-N)������`�&�0w���6�q5�6�q=E�"T,)T,(��%"��%%P�d�P��Pj��q:*����*�.�#��	5T,)�2{�����{�c�ڔ�A]O
�Ekt*��%�Ң53��h-L=���!������qZl���fn"Q/{�Z��eL�f��*ȖI��)M5֝�l!()eyeIK�)��+N�4ֈTuA(2؅�ɖ~�=]���R��R�Ө⊪uuꂊ% ��%�iu�5�Bł�˴:�a�2�Nu��L�:�]F���z
�5�B��B���J�b�@�td�F�P�d�P:�F�R�X*Pt)��x_���NO������\���U9.�ӾL��U9��`�&*��a��zJD
K�P�d�P��x*��*����bA�0�X�OB�b�H�b�ܥt0w)M�<?>BŒ���/.�So����S*R�XP<���)L,S�n�*�*� �H��Bł���X0w���qķ�R�B�ҀB�(9�0�$
���B��B�(E��g��JG)#��/�����.��ds�s:�)L,Y�B�({�P����O�[�D�4����X2R�Վ5�D*����leֲ󡃆ӹҔ����[0wsEs7Q���GY�))�/]"P��%!��/(�KA
K
��Ґ��RP(5VA
�.����K��܍��jB
K
��Z�B�R�B�6�0�4JGM�B��B��P�`�R:j����������P�T�P:j)D,�9�0:jN�B���訹�*�FG�%�P�`�2:js��Qs6w3���R�X���QA�3��Ĵ�a��NB�2<2��	@��()T,	(�%#��� �Ң`�RZ�ܤ{)/�s�:h]�.L7��K	�c�R��6u'h�B��B	�'�P�d�Pb�)T,(�}C
Kp@��)T,��LmY���������L���L���L���L��J�E+WS���2{��a�()���V95��V95��6��vDS�S�<���]]D���ms7e�bs�۟���P�T�KC
�j�gbS�S�X<PK@
KJ�bIH�b�ܥt�0w)YSM7�biH���-R���'~<���2E�B���XR�X"PKB
KJ�b)H�b��}n�e
�nbb)��ME�-X�=�8���*��qK�f7=���g��E���Y_X�}?�))��:���=	� ��3+�n���Y�M��<����{Xr�m���D��u�ȷ�W����g���Y�����2�Ǌ�7����u���F��L=��#�W?E�
�?q:[��~SO��2 �/�9��ē�S���L[�)���.,��DΆ>��tsJv���7��ٙw=�e���Sp���*�a��)(T���f=���ؙb=l��x�MR�D�MR�d�P����SJ�qI��~
��QG����N�!B����;����o]�l���7N'a��hg�t�0淵�kz$E�@�r>��7<��k��հG^�N�:o8��%챤|�0�ɦ��^G�[�&V3%RL�$�	
�����b"�S2P�,�xw�A{qvЮ��R�7*O<67l�ށ��0n��T͕-V��TZV��TO�C�BŒ��ɽ���
��P`�Y���z�G
>�&[�'��O�R���r���=��[r�����:��~�q���`z+b���B(Fl�n`I��B<��aD�pw3�y؉��:4��/�DHD!v|�[)R��������Eli��y���_Q�ʉ�Ql��n���?���}�)�[z�<�}��[z�4�q�������ê�����@Z�՗�s�i^`�~�-��8�|�M��������������;(�s�El�T��&07R�v3`��t��U5"�pJ5�8OU-3����Z*bɩ�~2J`֧qM���Ҩ|��iq���-������~�7�V�xy�t*�C-�([����m#qI�q���_i�d��Z}�	G�>oٲ�Q
�"�������"Lx�I��l|JB%x�j?KW"�l��*j�W�����/��6¤!f~��l\O,��!Ȗ2�|bRiS�&�4¦:p6a�OC�a���6:0�O�hJ��C��d��}{IT��`�S�>[*�7�s��q#؂�8Zu�%��h��������)u���ݕ�;��mg��dvW���N�{�)�bFSJ��є���~����iu5��=褰�SH�\TL]���΄����2x��o���m�z�NiHab�.�N�vS�P�x�Pb��2C��B�Ѻ4J�b�ܥt�0w)Y7�{NGvS��x���9"o}�)y[+��+S��P�D�0:�vS�P�d�0:��GR
�.�#�0wyk=�@���M�B��B��XJ�b�H����:��9u
I ��h\�P@"K��p�U�]v�X����T�P��F�R��~������=f    .�h��K)�c�R���~aآ��%!Ew�|A�[&�;&#����a���#������Բ)L,Swr�Pr�z�#��% ��c���0y)9�]J���.7��"�����QtHab�2���N���5z`PZ�)��D�PZ�	)T,(�#f.�ň�Ki1b�RZL6s�A�O�*J�) ��%��QJH�b�@�t�
R�X*P(��&���K�(c�R:�6w�AcH�b�@�t�R�X2P(�*�
JG�!���8�P:*�*�]JGs��Q��9��*�JG� �����QiHab�(�0I|�P�x�P:�)T,����*�nb��������P����QmHabi(��� ����z��*�JG-!��s��Q�ܥ�G��n�t�R�X�s@at� �����Qp)T,(���KH�b�@at\A
�.���0w���-�"H�b�@�t$)T,(��$!��%�ґ�P�T�P:��&��K��c�R:�6w����P�D�P:[�r:W�r:W�[c�U��p�*�#pոUt\5nmZ�����.�#p��#p��#pո%_\5n�Q W�[��U�ֲpո\5��?������ոZ�1w)E�]JG�W��"X_M���`}5�j"��Մ���W�&"X_M���`}5�j"��Մ���W�&"X_M����0w)%�]JG�W�&"$�3��eiEJ��gPJ�lO1���)B���NClX��[���n���`9�LBƞ�R6,
֜�l%XsNƲ��S���s������<�4��NI[�&:��g� �n�q��pE2�`�S�����+�	����v<�t�q����s�q��3l~
�'u�׳��E���:u�slE����h;m&�	�=��Y���U�P�,`|�$��R���S����c��gU|�P�,�E
W��)\�[h8��v�,�4kP
WJz�Jm����)4k��'�8�����{phݿǗ��{fG^G8��̦�6����|�xڈ��߃�S�YP<��D7x�롚��f�&ڟh=\�j\��p��q�����5ZW��h=\�j\��p��q��W̳3:|^1��h=\�j\��p��q�����5ZW��h=\�j\��p��q�����5ZW��h=\�j\��p��q�s�ґ�ܥtd=\�j\��p��q��jJ��?
��+\-m��	+��n�����Fk�
W���+\�n���)�iW/f#�hM`�\�0���%`�SM�5��+��S�jZ�	,�kZ�	,\�o�&�pe�њ����t�5��+�����7ZX���hM`��~�5��+�����7�	̕�ƈ�K�(b�R:�+��`se�L`��7�	̕�F0���ߘf�ɉ��c?��#�	�κ7�W2&�F�M�ńj�/u�}þuo��l3f<նe�f�m�Ō�Šϴ-@8����0�c28��7�[�A��s��1�bН�6�5Y�Mǁƌ�=�+�A�ۦςM?�H,��ɿ�[n��Oi[CY0���v���ۘ��*&ϩ�ǖ��~���a�.�t�������nYE��p�*b�Q��T8����+܊�h�[�VlDk�
�b#VL���خe�C��O3���*P�N�)����_�aBS���&��;���Wo�n��z�yO�a��a��߲-��l�EK�V���tK=v�����	��p��
b������#�ʡ���
)`��Yfrj��?�Y����$��Sʆ�Dr(�T6��?�Vt%�O�
ӵg�%��A���,�I�t��O�6�в頗,��-�˭rK2�-��}gH���3�=\;s�gԉj��RP'̡�	��Jɛ%J��娂�Ż?IP��q(�K����&0s���ɣ'�&����8Ū[�n\'��k����Y���Iw{w�R�U��2y�br�HJ������+��"ؿJVq$?s©�rK�af<��j�M`��r��֩v�`n	m
(�V�����䦀��p�8}8l
�����6�_<.^ݪ�_�-N��Ӧ��RD�ʹvԚ"�|�|��9F�)�5���aM]�̥SKv!^[U>�#>9�ٯQ>o{rD|r��A��l��7f�/�-ͭ�O`Ks+��̖���o�E�PsK�S׉�-��̡�Q[Z�4s��)B"W�~�x�T����y������Nm`F$fD�Q�("��$=����	�ڶ�BF�b8�bC��\GXl	��<t2e��ս���hg�a����2�t�F5y�d��4y�dw��B[γM֝&�L֒&�L�|zx��̚��-%T�`�k�gCs]0����Ϻ��Ѭ���g����"!jl[Q Tw��@�|�s��̜�����`|Xt�����S\S�G�c���qr���}�P����*�D]J"��!]�����Ͼ��/�p����_}�����ū���;����ח�{�ݿ;\����_������{{���]�g��p���������������݇����on~���*|�r���>|��խ���쯿;���ÿ�߿y캼���	�������������������?L��V�W��3o� ����������U���7�8j.���\��wN���_��������f�QZ��\4�O>y�~�����'��s���˓?��>|}y�?���������cr���?�������N��D�����>���p7�I>�ޛ�^����]����wWoN�����puwu������g���ӏ~3d���i~L_�\��W�>�<���ח�hͫ��}����>|�`���}~������_*��Ꮷ?��߽�����^��tu������]v���W>�Bi�I��}������7o�ӱ�|�Z5�O>����ݡ_�ד;�D�5��I��k_?|���w����p|ars��ͫe&���b�԰���?�p>Fc=MƼ���Nfݰp�N[�iB~jQ'oM�r�c�fw���Ә~4ؗ'��jJۥ7��{=Wu>r�Qz���������ۋ.���7����������S��ﻒޚ�y����L����:�?|��۫�A���2y�H������m�E���_��_�H�w/Ʒ/~}��~w��M���Ӧ�?��ӟa|l�9y��.|~}r��4[�o��E�FS�>�ϰt25����m�6�Q��EU[H4ɟ���a�m^�E�6y^CN�%7!;�0�]��Pyn��</�J�d�/�m���[;!�m���˶\�s'Jf[幭�������|�V@yn��l+�<��]��N���.�13x˶��s�ce�ܥ�i�<�;V�uM��+�&�ma�mْ�v�ɶl�s;�d[��ǝr�.�ζl�s;�d[�九r��U��N9�(yn���1w����\Kn�tH����NL]J�S��-7��v;��yn��l�<��N��C��n'ۊ!�m��mŐ��ɶL�s��d[&��v�-��v;�Vyn��0w)�]JG�2����S:���*JG����B��B�hZ�3R�X2P(M�wF
K
��i��HabI�����.��ds����*�JG)!��%Em��ņ���n|��PWT��t1S
������,@�Ԙ1w)5f�]J�s�Rc��K�rF
K
��\�B�ҀB�8�0�
���B��B�D�P�`�R:*������]r�U*R�XP(U�&�*@�tT=R�XP(Ո*�JG5#��s��Q�ܥtTm�r�������(���G
K 
���BŒ�B�e�P��P:j)T,�������etT��]n��<R�q@q(����H��K�'v-.#��� ��Qq)T,(���8�0��.�#�ܥt$6w�<�D�P�$�P:��*��yT�"����ٌ�x�&/@�t�=R�X0w)y�]JG��.�^�)T,(��|E
K
������(��(x�P��P:
)Y7�_�Sm'���'v>�)���c���0y�â?�k���N� ������]n˩�Z�4���R_��^���V9M��V9M��68�P�N�����* ���5`�U]��|��r01ԝ��Z����R�쥚���    K��5n;���Kg��>����8U����NR�Y㶬(�q8pָ
8k���q���}���K�(c�R:�Κ8]�ԋ}k�	WvR��&\�I�֚pe'�Zk�k�	WvR��&\�I�֚pe'�Zk�k�	WvR
&/��-���=^�J���/e��u�e�'�sR)��T�Q0��f��P.�M+v�u����)ց�ަXN�z�b8��m�u����)ցnQC��p�2�:p�U���	W)S�'\�Li���0۬_�N��lZrU�R:m�s��KÔ��kܑ��k�O-_��n��y�xi؝��=�O�}l=�6l�ǣZg�<n�:�oKݴ\u����37l�X���a+��C���m�)f�vڠ�
q6�lK��U��T7v��c_V�g#Qw�Ҟ���]���@�*8@����
d��UP0��M:�o{h��o^?�>�#C�(3N�?�޽{}��zXE�K�6��Qf�(�GW�ō����U�P��W�P��W���gV=j��U�P��W?��	K�{��G�����6QK�ǴOq���c/���U�I��Y]�U�d
W�Z��)\�j�N�p���:��ծV�d
W�Z��)\�j�N�p�����y������iO!!��P�Y�ԥ���K5fS�R�52�+��q6]�O}����Ո�6n��m�.�/�	���n,ty����Ww�?��p��7��e:}�]�6��Q\�U{����������?���?��o���c��O����ۦ��N����w�'��غ�NẴ��{|�/�e�DF�חϩl*��P/&c�O=>p&������U�5�L�R�i�Ԅ��:3��(����Kum!�p�5�-�PJ�㮿\-S����P��gB�D���2��%�-!�	���ڒ�/��Hɘ�I6�NP3&4յ͘�T��Vg�&����pI���B�3�8�[�R�8#q�gpkR*gpkR*g$U�r�m;��Ka�M�Bq���Bq����]J�s�Rc�ܥ�h�3�[�Rmq�p+[*`p+[*`p+[�-�neK��neK���̩�.��-�.:��Ib�հ��'ISFz��ԯ<2��)Ӗ�s��>����vRg�P�t��������_��������Jw\�O73"�5=<i`�|f�?s��uS#U�8�܊)��Ww����������7O����z��?�4��[�.%zo�>q��ɱQ9��I�y���l9\�6����������׆�KL����o��"�����d�rS��/��o��n�_�z��[�!Z|��\熮_LK0�0�Y��
6t ��s��m�-���v���K�9"}�2����p���ÆX)*��C�$�a��zQ;�o��k�)���A�֫77�����Mwg>��ܶܵ��K�5�uˡ�뵕�#x�9�Mf6{;�/#8U��մM��Sg8q�	Z��iS��f��Z@��UhP�����U���4����UhP����Р���W�A��!B���m��lɟp{4[�'�^�����G?@����~��ͣ50�p��A���B��?nׅ�-�-��J��tt3~wF�t���H@PM]@C��V���Dp�S�6��6덳��cE�ܖ-�6�V?�6�V�
+��C5!��E�3'-l�D��1E<���x��3����)h�kضܢa�C׆5;�n�)O��B���Xp��i=֖�(�O�܆"��0�u�0�#u�*R�s���	9O)�ّ������+����,im�dEۡ�9V+���H��M��Fٟ�FI�qS��f��|�j
�T��S�(��r����[�k�^���	�"-8��}���"+��#R�v"[�f
��ŝ���V�����t)�*��QPUӍ��P>� ��4�N�����v�s����?���:����a��UT�/�v&h���=[���T_Җ7)����zEe
��n9�9�ͳ�
�q4[�p<|=:��-5�KZպ�w�-+NLh��d����)	)T,(T�m-����))� ,P�j1�Rۉ����h���������
�.t�G
K 
!�N��%$�)����;S�c�����;�"����cu�v={��"@�td�����)(���uz<�z=%�ґ�K��^��`�R:�]JG�/=�X��b�����)JG�/=�X���B�������SP(Y��xb�zJ
�#k�O�^O�ܥt0w)��Tu�oa��NwZo����I�O�^��$ ���J�S�3}:�z=%�����L�N�^O�@��8�+ӧS�WS�~e�t��z� ��s��b�ܥ�m�R�NIH�b�@�tR�X*P(ņ&��B�(	R�s�^^�*-N)~N!b	@�Ԙ0w)5&�]J�	s�Rc��K��RE
K
����Ē(��G
K 
���BŒ�B�(g�P�`�R:ʘ�i�w�)6wɑZqHa�K�����x�P��P:*)�͗g�Z'JB
uE(�KA
KJ�~i�]J�s�Rc�ܥ�Xm�FN�5 ��/(�S�&�P�d�Pj�)T,(��jC
Ks@��jM�Bł�K�a�R��fs7q:j	)T,(��ZA
K
��֐B�"��ё8A
�
�#q)T,�����a��6�K[��NGs��i3�Ѣ8��ԖG�I+�?.�ILq6q3%hq)��
#hA
�
#h��*�JВ�BŒ�B	Z
R�X0w)A�.%Fosw\��,,S)��x�K@�n��@����:��]�SHDuA	(����*��@�R�B�Ҁ�X�ndb	��iX��0"�[�?�z'yB��M�a�&�l�VN���^�bI�"%E��]O)H�b�@�T,)L,�+		� ���%R��P�`�&*��D�bswX�GP
R�X*P(���8���8���8���8���8���8���8%�]JG	s�ґ����	JC
�����	� ����ґ����	J
�#멍�]�JG�S��&(����2�.�#멍�>A
�
�#멍�>�JG�SO}&((����6��LP*P(YOm<�y=�b�R:�������6�LPR�X"P(YOm<���d�P:���xF'A�@�td=����멍gtA
�.����K��zj��%!��%�ґ���3&	J
�#멍gL��x멍gLA
�
�#o=��xH������;�]FG޺j��� ����ё���x��z����#�� ����ґ���íJ
�#k���[�]JG��K���j�YT�!����j�YTE�B��B���j�YT%�ґ���S�J
�#뫍�H�]JGs�ґ���S�� ����ґ���S�J
�#뫍�H�JG�WO�"((����6c��1w)E�]JG�W��'()T,(����v�0i=%�ґ���}���~8˔
��zJCʰ7�BA��w��N�!'��������b}�q7p����X0w�n�b��;TE�����(�)D,)�U�KC
�jcm�z� �����4�j�S#�j�Sc�ܥԘ1w)5f�]J��5NG�5NG�q�|���|���|���|���|���|���|���`�R:*������6�zKP)T,(����j��%�ґ���*	J
�#뫍[7�
JG�W�n\Oi�����.�#뫍�.��*�JG�W7]$((����6�HP*P(Y_m�/q5%X_m�/��R�X0w����(X_m�/��$�P�d�0:
�W�K$((��������S��6�HP)T,(����6�HP0w)	�.�#뫍�%��EL˔�*�
JG�W�K\O��ڸ_"A�P�x�P:��ڸ_"A�@�td}�q�D���K��c�R:��j���!AiH��Ew\L��N�e�}���,�2E��ܗ�����.��*����o��̬�7&��4�럚b`��aj������ �j&/�4L^�i���T�1y��!b�RMC����B�H�bI@��3R�X
P(Ŋ*�JG�!��%	P(%�*�]JG	s��Q��K�RF
K
��T�B�ҀB�(;�0�d
��쑒����� ]���    �B��ݮ#���k���L!���3�.%�lS7pb�)L,��c�P�x�Pb,)T,(�KB
K
�P+)T,����
�.��js7r:����*-֜Դ��H�'�)�#��� J�5"��%�Rc�H�b)s���_v5�s'yʨ��]R��i����f.�膙K)�a�R�n6s�薐BŒ�Bi��P�T�PZl)D,�9��孻�g�<�P5F�B]Q 
���0w5F��˨1:�]F����͔��H�bi@a��!��E(��x��((��$"��/	(��$#��s�ґ`�R:���ӑwHab�JG�#��]�B��G�P�%�ґ�H�b)@�t��: z�]JGs���j\]W����qu�\5��?�����G0ո���W��T���#�j\]S���s��Q��M�q^�{�Aum�]K�<5nq@O�[�Sk��S�D�Ը�<5nq@O�[�S�D�Ը�<5nq@L����nJ�'R�s�ղ�&�]J��S��&ZOM���h=5y�le��w�T�Dk�}���Ԅ�}��R�h%ZKM���h-5�V��Ԅ+Z��S����d=S7�Wnme����^���iG�)�,�3/R���;&z�"H�b�@�T,)T,(��%!��%%R��P�`�&*����b=5�1���zjJ�b�@э��jJ@
K
�#�)��%Eu��ݵ��R
C�@�T,)L,s71�4��D�bs7:ZO	H�b�@*��*�O�R���Ⱥj�c"KC
q_���n�㬴4�(e,<o��3&��vL4�R�t������_�������Ǐ�����p�p�xq��o��.�ܾ���x�������W��wW7�����7���G�/�/�nu��>J�b��Ny{�|�����_�^��^�_�?���ԛz�_�;f�n���o�.�~�Q_�o�'^�;a<�J�M�Yg��0ʑxݯk��_���������ۛ������A��-V��H��<4��u{P&k	*��Ŋ(R�d-A�P�D�0�d-A�P�d�0�d-A�P�T�0�d-A�0�XKP�eb���R�X0w)y�]JG���A�XR�X2P(YKP)T,(���%�&k	���L,�T
�
�#k	*��s��Q�ܥtd-A���� ����ґ����b-A����Z�J�b�@�td=A�P�D�P:���R�X0w)E�]JG���A�XR�X�'(�ӑ��B��B��z�J�b�@�td=A�P�d�P:O�p:J�����.�#0+�#0+�#0+�#0+�#0+�#0+�#0+�#0+�#0+�#0;�w��lI;ݗVR����'J���ʅ�	�E
�Z��k!)��T�P0w���`�R-���k�l\� �`�Z0�2�)ظ�L�Ƶ`
6�e S�q-���k�l��*�w� bqq��j}��+i2��i�/σ�Yo�E�2\qT����D�^'�z�y��*�ڻ���6��7TՂZ��;��V�R�XP��Z�J�b)@�ZPk5*����iA���BĒ�Ө��R�x�P�`�2��s��Q�Ξn/KŒ�B�R���([����l�:/���u�P:�֭���Ⱥu^8Y���#��y�t$����s�ґu��td�:�9Y�N��eb�n�����[����fqK�E�'��a;�u��.) ���J�֮�\=[�v���ٲ����1y)9zL^J�֮�\=[�v���ٲ��<Wϖ�]�z�l�:�ճek������u��g�֮�\=[�v��J|���<W�#�.����K�hjו����+�Ԯ)T,(Z`�vw��u#��%���Ԯ)���
JGS�n���}R)S�n�t��i�qŧ��OqS��)D,����"��Dł��j̫)6w���zJF
K�P�T�P�4�x&���Ē(���#��% %R�D�P�`�&*��T��.Sl�zNG�"��/(���C
K�P:*)T,(��JD
K
����Bł�K�`�Rϣbs7p:�)L,U�B�z�0�K@�tT#R����Ҟ�/���Hݥ����J�� ���
J�s�Rc��U5.�w�)��������r����*��bIH�b�@�T,)T,(���!%>Cqi�����R�CqA�	P"qA�a�F*L]F��a�2b,Φn��X\F
K
#��*R�XP1qHab
#�")T,(��$"��s�ґ`�R:����$Ω��d(6w3�FiHa��;�Pj�*J�> ��%�R�OH�b�@���R�X0w)5z�]J���n�t)T,(�b�Ք ���b5%"��%%P�d��偍Dٵ��#SFAu=(����&�����X"fn�b��;n���B��"T,	)T,(��T���T���T����T����T����.����K�L���L���L���L���L���L���L���L���L���L���(c�R:ʘ�����v܍u=� %�?^�XS�����XR��bM��F��)�*JG�T;n����B�Țj�8�]JGs�ґ5�D8YSM�{YSM��Q�>�n��X����T�4(��uӳR�K1칱a�R�����s��Y�zr"\�T���{,��ć]h�1A6�K�ՔV�Ք6��6�k����d< z�㮡2zS�?m��������뇫w�뫛��n�5�D���x"\��p\�[gi[ɚy"\{o�<���f�x���f�x�����O��պy⩆�Z7O<%�j�<�ثu��S��j�<�T��:#ꦩ�X�[�u;�-vu8����8�+�+����*��L�Wǘ1�z��Xf��N�������Up�iV..�	�:W���Z�*�����Gk�6�����F��5��F��5��F��5��F��5��F��5��F��l�/��Rڍʔ�����#Vk#�����;��.���i�YQ���T�1u�v'`�R�D�ԥZ	�"J�$m]D�����(��t�.���S��޲��?�y�؇�/l�v�������ݻׇ˫�UT�kϪn���r����������7W�����G�Cc��1g�3��sC���� [��	ඇg�q�n��H͜����ۗ�B�*�ӏ򫞌���B�L/Z88!�~�3ʘi����3���1������ژJ�ťӪ)��)���.S�	�RyC���'�u�a`���Ż�	��R��l��:m��w��OI%�8�@�a
�v��B|hZ�[��9�̽y�� La�s���0���#�)���vyk�k��=��Y�k�nyNp9Ԍ)�1qqѵ�7-�߯��N�3c�wʳE�OS0Ƀ�>�RIv�_��nz�k͘�a^��7��Yn�1�/˧�=���n�1���/��9[dz���Rl���Z,�Z\�cN�Y[t��������[&�+X�I�m���m:7��W�Pӳc.�������"� *���ж�?��t��)�"�>��>�K���L���f��L�x�Y��?������4����.���f���;$"¤��\�5<6���Īs��n��n���w{�bL}=@j�y>��/7Su�����?>�"ۻ��g����\V��ښ%F�/��?�����gpPGT}	J�H�2u@���<��G d���<��:,ip�=�Z�����|`�D	&�m��r�f�)Lm����ĸ�P!@���vs(
}j��*�9�C��XPi�Iz͡ ��>çVs��Z`�-D��4���B������l͡�#��)�ʇ����DMPj�mh���.�鷐�F��C�B�IDתl�$´2������E~k���GlK������a���r�`�v �V0j��O���O��mѾe:GaCwX��Y��LN��;P>��o�/?A�ro�3��S�-VT��b�`3		�^�l���-WP7J��8	�!�g��5$���e�n=K|��az2jH�[j�Z@�h!�y~%Ԑvҷ��L;L;P;�ɞ�z��_i�H�E����H�ET�g�PDe��AK���n]���.jnE��ŃkB�u��0sA��8��6c�+�E���6cj����.�fL�>�\��o���}𹞒0�    K�LNT,6�u�^��B��"T,	)T,(��� e��d�\k�xD�	j�py��h̉p0�?��[&�x<b<W�(��8�D�M�G�x&�3�G���/U�Xt�2�J1mQ��s˨��>�ڜ}��a�>�-�:5�r���F�+��@�cED���������Oqj�ٷ��cx���Q- y"���������P�:]V�~u�z��W_�������������xu���W��������.����/y����o.w��7�����>��_�?\�����=��ׇ��~s���Ý��fw����`.��>���Ç�_��{�����'������^|������۷��w��E��>.�����ʉy������<\����\�ӟ�Ço��0!�\�>K=�s��7����v������7�o�z��μ?�����z�ﾟ|��ޝ?����/�������~7�O�����������\�������������?>A��~����?�M�9��{�_���~w��w�]�wWoN������������~���ӏ}3����;}ur��_>�x�p��__N~���s��?�GO�����������O{̽ꜫ�?�����ۋ���?������I`W�{���W��r�%_I��Ǟ+�O�>}��k��ۛ�����AR4�O>����ݡ_�ד��D#7��I��k_?|���w�Q���&�H_Ж�����\��_2-�����4���%��O���W-gp,,8�c�xfz_���0��#��V|�R�Ԋ��Ձ���V�F'z�!�+��ICIMF�kϪiPRӆ��zJ�<��k2��!��"��i�x|=E��X<R�XPKD�3'$MJô�%2�S7R���X0u�nZKs��E�P^?p�AJe((B��B��Bh;%!��%%P��P�T�D*��&��ML,����Xl�
�#[��*�JG��D)T,(��l��R�X*P(��0�غ=C���֕(��s�ґ�ܥtdkC�e*��*�JG��C)T,(��l��R�Xlm�~��b�9�B��B���n(EO�Y��;�p/�X�L]
��K):`�R�����m��GP�4�0��*?l��|���]� �w2Y~�)��lm�\�`�"�x�(	(��mE�R�X
P(EG�:JG���Q¬�t4-���1�T,)T,(���#��%�z2N�!��0g�R�B�hZ1R�XP(MkF
K�ܥt�1w)e���H-G�P�$�P:�)T,(��rE
K
1��\qHab)JG�#��s��Q�ܥtTl�#�����ك��Ni;i~�ôKV
b�K�@��XR�X�
%�*H�b�@�k5 %�];�`6�]�;��MAA�Ea�R������+�/���K���%�k�!���	P(A6�*� J�-"��%!�=_�R���Lp������
R�k�@��Z�O\�OZ�8�F�s0]���et-�ѵ8�_F��l�FJ��"R�XP]��H�b)@at-�"����ѣ�C
�P(�G
�.�#�ܥt$6w����s��}*<Ɇ��B]QA
uE(��!���;�Pj�*J�> ��%�R��܍�m�Ud#f.�h��K)�c�R��6s3������Wb렦�n��6S� �����B):�P�D�P�	)T,(��CA
K
�耹K�1b�Rj�������©1�P�D�P:�	)T,(��bA
K
��ؐ�ĒP(��V8%�]JG	s���k���kUw�Y,_Z�����g*�1e��\��뭫"�wT���7��Q�K�F._0�o�%���97�I��g��F0�*�l�QWuC�a��NDI�jo"�<���pDT��s�*���tZ��ŊR��ϻ���m�I��&m�m�I�	(�B�3��2�M޴a^'�d�u�<;�LA�o>��ϔ�7m.ى3%1�nA�P���J�:I�Au�
J"��o�$EEE���ɪ�%n
�@u+f?�1���Tǰbv'�l6�t�t��Y1�S>m#�ŅY���i!�j��8�`�3���NA0�)�3�t� ��d��噃� ��-˛t�Kz$���)d���8�,e�=���������ty05�`>���7~s��:ù�@�:#R^�Xz1��qK7ԃU9���<ؖqÖ�X��l]܁��a;�@AY0]D/(]ڶa��e��� �B�l8��Q"L��ʂ�{A)Lw����t��`�3�N/��L��{����K>]����o��20ϙ�����L7�{�h�9��*�
o=P�V@x�v�n?�x�����pO3�Qy��xV�"�"��/)�}�.�p�1�uA�[��*�j�M�oё(瘜�s;�Mgt"�9SC��yP�jñg�Iߑ� $@������9{Q���o6[O��Կ����;��sǍj������F�(���q�������XvJ+���~��bxf��Ql�ڛ�lq�t�<S�L�����LlY?�է�,�s//�=y�g�,�{�?�Ll�'��3YVέ�{&�
��ɲ>ӗ\�{&��Ө�W�I�yl�"l����3�5=Of5u��ry�3T�����ʨ�4+��8����66��3J�sf�C����ō�cBY�t��q5�`�|��^H[ޅ�}a��������h�-���o�,�?z��Kѥ�/�v9Jk��vUVm��b���Ww���������~�6��������ջ�[7Y��w/�d��ǻ�������W�i[�.%j{���L�a��ʧ�l�+�6�Ԝ[��bj��崥:��/l���Q��@)����_����ؘN�P�����,g����;�����|̾<���n~?4:o5�zn�#u�Qz���:v�.�h�����ӏ�����_L�����yk.����ھ3i|���?>����� :�Q��f�x���w���"{�ǯ}�/N�ӻ�����?R�;]��[9}y���G��3������������=^�?���~/��L�n�/�+�|��|���?[)5?|�͟ٲ�#��bޖR)Y6��ڲ*�oY���5�-"�&GxtJ�Sַ���j(�=y��Oa���OU�L�k��F`��?��&<��?!�z��a���^יB�d�u��A�/�^O;÷חOt�?5"��Lt�O����oz������5��iO��O�����6�_���0kS�F��Y[RN��y7kL�����y7kT�.W�Fe�ÖװM��m�)6*�q�������K����vDO���%�)l�4�T�*Qz��?W��g��0����n�"λ/�+���:н���������~�@�4b�D��_4=�=�N�z�ㄸi�?>6Y���&��a��	��͖�'o�py���{��/�)8l�:mSTp�d)q���Y>n*|���[�j�a����"��0=�rC�ap؜�j�>~!f&]��w=��\���3��L,����[�_If�ѳ�N�q��޿�}��>�y)~&&]�5晞:���v��}y��Ûۻ˗~�L^��2�LSZں=��(���ğNC�T�}�������w����f2��K������[��8�x{������o��T�?�<\�8y����o�Y�>��g�A���?;}�����ѯ�__�����ӷ&�;�z�����s㋓����O̳ŧ��w�}|~f��_�Y���_;��_���^�|���ݥ_�b��ߔ��_���/.4]g�MWN��&�i��=d�n7�le�����MK����ٮ�F;{S��~)�O����<6�!�ߛ�0,O��6>0m��6>Rw��XPk�����X���=z�SR�X�2�S� ���@��:�z�7�:�G~��~�	��.)"�����r_��*|='ǀ�K�1`�Rr�����P7pr�:����o'G�����6p:�z����d�#������5h%�tXh��w5����'/�Î�}��N)?a�w�{��0�H���O5+	?�3��zP����ҟ呼^��\����a��ު���P,T�P,)��ǅ�Qz sX{z�Z�����:    C�Q��G��˟�#Ǘ���ɸ�VCF饬}��y��b��"�)
/e3?���s.�=O�S3���O�<�K��9��Mge�~�i�x��0��7dֆd-\&���`�5(捯�s=ؐ
*�%��<��9������e�ܕA�n�]�|ca���\1�N���fO� Uzî�a��&�0����P��r&���]�j������$�!:��su��r�:������8�n�\������]A�j?��gr �(�Ks@6%�v��I��5����N~ec��b3�Эお5>��"��«憊M�p��9Ä�"�F���m���)P�~(,<ψ��ީ�wEuPc�����@�d�?5�l��� �a��
��_�S7L�	�݃74@����������yq�Q�a�+qK�^h��L>:L��N��z�c{}x����>/-:ԂV��	���x�5>��Vi(:߲m�z����&5���O@W?|"��~�Ϸwo�y�D(�N�Y��	}���W���I�!D[�'Qc��6i8�{uaP���jp$��bE(��cK{��t��$���Z0
�A����,
jC�i�2$J��wF���ae������PW�NKEΕ��:�O-깾5�߱zc��Q�����9��ѣ$�����HQ�#r�HQ��+<)*�a��.�O2��}8m,y�$�(��;V_0j�mE?S�Р�f&�h;I��$�D��-Ub�	C�nk�fJ�5mgJ�0�PbR*�4��=�b��(����u�3M��?�w�VN+M��3��s��L�L ����FcD�1�1�����Q51����}DI�w�Y���߱�e�(���y�񈢊��T�7�����Q'�LSL�j*jI27�Z��XF��fCIV�N��=�ӂ����iJ �1��0ՠ�$s�p(�sn��}�ڔ��A����sD?S��4�k�/{��#Irdy��[ı��5QU�?�Fc���tHv�����W�gҧ##�8��~��>�������V��3�䙛��3/N� ���#�gb���T퉩M���I�r ��n��$�^��|����#�/�;�7��ʴ����*Jm����Uڦ9�Ye����Y��/�Y��W���*!��ޗ����a���pT���E�[�@\�����2�����0��37�F��Gm�nj)qԦ��	ff��p8���	����'��G�~�N{�v�8��L>a��W�V3�b�W����ք�_��OO�w�9�7ԸT���v�/�2j'�C��tM2*����sX�����&j��S93Q�QL���[w]�K����{C���w==�����S��$V��m�?�.���º`�]�C�V���.� �`��z��6O�͏����4s����:}}|�����7���q[��7���~X�y�����C��qS�����7(8�ba�z����A=/)xѲ��l��S�,F�8%�l7;��ɦxY�i�� ��X
�'���+�$j�Pa�Zy���	*Lz�\��Q��$��i̓4�r���/��
E(�ZSh��Ϭ)T0��@s�YS�`�3k
�}f������U0��T�h$s�zdn|�R�̍OP����	j52�#(�Ȝ��#S%�
���[��Ғ=�j/2�L�yL)�aS�t�ǔ2���pʄ��)�'
�L(�(�2��pʄ���)J
�L(j(�2�l�p:����c�R:
����l��8���q:����td�\��Ȗ��ӑ�p�#[�:NG��u��l9��8�r �q:R�]JG��K����N8Y��	�#k�;n�d���6&V��;n'Y�6���}T��;n'5�&���'Sk�;n2��g�������u5�S�Wڍ)���#�.�ƈ�K��ڙ���L���]�������L���]�����۞L���������۞L������ژ�۞L�Q���4a�R:J��������Ժ��۞L������:��۞L�w���Ժ��۞L�i���Ԛ��۞L�-�;Ժ��ۏK3�.����K�h�'���\e�ÁB��B�hl*� JGc[o�P�D�P:w��%���آ(D,���et;�]FG���˭�b�B����(v�*�FG�KH�b�@at���x����U.���u��H��D�1
�nhv�����R�t+'qL�ԥ$-����S������jQR�X2P(IKA
��BI�	R�XP(I;�*� J�N�Bł�K��a�R:r6w��Zt)L,�
�#/H�bq@i뉹B��������=z?���Pg�@���#R�XP(5z�]J�s�Rc�ܥ�l�r;����B���v&��J���^+e%��1�)��E�B�Q
�Ɛ�BŒ�B�1�0�hJ���K�Q1w)5*�.�F����`U�B��B�HR�X2P(iA
K�B�(
R�XP(E�*�]JGs��Q��˽cB
KJ���[a󔂔LPR�Ē)�ȶ�3�<�CuB(�S@
�%��ϥ`�j�#�̋����^?;7�\��fn����n��;�d�"@96Ü�8�P�x�8*��*�R��7r�a�T�����_�@��%�Pg���X0wK��U&�����m�9���iǂɫ��oƂ�ݎq�[��`n׹��S��(X��zY�cy,(��J!sC'xt��Fh��>��i�.SrϮW��M�ђ��N#�L)D,)�y�0�z�.S�zϮ�dvW�yJDJf(�ˡ�Y&��aj�p��+u���^�gRSY�XSY#�\����I�й|�O�ɮѶ_a�T��oЅ-B������u-u���*�*wc
A�<�B(o;*O2R��b�֫R!�9�
R�3��u�O��#Og�h� {�?H��~�#�4��2��B#@�c�7��93e��a���ύs�Ӈ��%�Z�����GmT��g�Q>���*̣6Ƽ��-8�\�vLJ;f����:�m�|��G�(�v�����G�yF!u�fWs�2OA����ٔ��R&��:R*�#��;����t|�|��X�Z�Ucb�SR��~��O;��9`.�uY�n���%k�P�u�����a���ç�qrCۮhY��=�U��OW��OG�q�x���:���RK���`_���`�+j����BQI���#�k;`�N�_�lq3Q#sE�8�+E�8*��gb����1թ;]�T��ts���ELf�Ng��~Kj��BŒ�"v~3�X%tCK�2^;X7vG�ݰj�R��\��ʗ�z������O���/�x�u��lk[ֵ5�G�ؾ�^@^�*��a��=�I���59� ,Lwj�N���P�0ݽ���駕1�a�u�=SFaP�����j��8�*�&jrA/x�ˀ����ڟ����fL�z�eC�y��z�Y�>��(=��/���X�Y�}"WF���s�ԓ�BA�U�r����M��@�+*p�YPY�N��_�ɂ*
���`QE:؝�B���E$
�RQ�L7�f6��I�����r7���):������3P��'���MR��*��v����W���@a����c�++��a�3��,���`���W\0��(�����`nTɂ�ά����[Ø��ekG7��J�3Pi�R2��(GN�u���q�N�-z��K�uC1)`����:-�*� ��%�Q�^8��ŹU#0���jv���B5;�cf���03�����x�^�&�1q����ĥF@k�z?*��*
%Ek�6J����0ָ��Ub����{�C��&9k�َW���?�3�ǛzHk
���պ�!Yܿ/{H7=��IPv%�gV@��#.I
�m=�-����M�C�
��k�\6�
]�ͱ.�x ބO�XQT��\Q'.=ͳb�S���we���#�`�������y/ċY1߽#Z�d�\�GD�y���^�1�ǭ(��7Gr�nUx��t��"�v����<$�65Y���>0I'���1Ή�In�R�4���v���4�$�[U���In�#��c&�͌e	S;t�9a!zU�9`�"��=�>��J��Ԓ+a�������0� L��ڵ~�g�)��k3�30sX=�5s�Z�f    LajU�n�V���nU�k�V�`�n�^j�f�`�n�h�n���nK4pC���
�.����K�|N�t�r:w����ޱ��3���<� ��2\M�T]���~U{��j�^���)�[���③m�7t�?3�p �9�q]�֫F�0�]���N�`2�x���a
�k�P��b���}T�Km����8�r�r�JƵV��C��?x�2PjϽ�����on�O�@'z�M.t�.�[������c�h�����~��\�}��n��Y��;�h�'F��h�5?�yFa�~��:�+���A�Ͽ���zq�Pa��$��~��B?���}QE��կ��7o���7~���7o��7Wo�B���>�������v�is�7w�?��U��߼�ݷ�t��w���/�ݷ�|y~|��as���o���o��������7�O�<X�/�˻�_���w�쏁q����ӿl^^�a{߲�z}���E�~�~����O~c��y�C��O�����͇�?�b�4�FJo��F���R�{}u�����~j��˷�?�	]�IZ�W�v?������~�������w��)�Q�O!����rs�|�~h?�����uҹ��}<��_~�����桦�������O�?����o7�G�����[_?���6�@u������i�P���J|�^?����z��O����C�ٷ}��K��;�����~���s�������h>�����������̗���~���_���ѷO�����i����磐�7뛚���z{z���8]�Oe����~������#�u(+�Gg~>��/֠6�4ލ����g�k���Ϯ�=�����z{�G����D����v���^����_]��A��n�݁�3��-�3�j����{�6��^�;��[A��6N��]��2��Pd��{f��&�ooÁ���=W�X<�c����R�������Dm��Ik��&&����T*P�����)ڌ��w������"b>@,����Fq�P���-g�Zu�a�1I��r�����Rj4���h0��4`R���#j4�ҋč$Py���3Py����s����+�oS%iL	H��H�B�Q
�F��H���"����W7:x��ҋ�I*/'�)LI;b
m6��B�t�fqx�R��o������]]0ݟH�����)NCS����"s��^dn�ҋ� Pz��*/27�@�E���Ȝ��"s�����i�.2�����r�r����yثΕ1���c���5��#�\N�PrQ89B�E��%��#�\N�PrQ89B�E��%��#�\N�s��Q�ܥtdK.\��Ȗ\��ӑ-�p�#[r�:NG���u��l�E��}!���:�d�P'T�B�Q��\��Qc�`96f/�ǆ��%�0���"�&�0�l��.�B���ES C�R���*[���Ԕ-tpBj��68!5e�����bNS�Y�iʖ.8Gjʖ%8Gj�V8Gj��8Gj�8Gj��Α��v�s������)k�9Gj�:yΑ�r�Ŝ�f1�)k�9Oj�:w�z��a0���w�<�)k�9Oj�uΓ��f�󤦬�<�)k�9Oj��nΓ��Ŝ�f1���Q纫�Z�5�C����W��p�(`8M�ܺ��&���ȯ�a�h
`8M����F1�9M)fq�����]\��ƭR4LbN�j��]��"��&�S�&�p�d�p�Ԃ*���*s��@�5��[yY�l(2�0�8�p��Ӷ<�iY�`��.�\�q���$���X���$V.������PѤ0BE�1\40���#�ؽO���@a1e���#��(LBf�r�`+M�Y�/� ���F�h<b�h`��?�Q����&�s�$�p�d�.��*��Y�T4�X�hl���3�.� �~���9����1EwR1�I%�p�,1\40�4���D#� ���t�Ŕ4��,Vlz�Wޭ��,�LbJ��aS��&�r�.!��&�R�t1T4��*�H����FD�&��<`8�K@���`s�b��~��,�.�Ŝ��H*�	b�h`8�;��|d���o��p'����"b�h`8���.�N���S��,��1�9iz�ŉ����Q�p��1\4	0��|FM���!����Dj
�����ksZ���}��t�Y�I3`kw~���4�$0�9��s�I��s�I��s7�r�\��]�i��\��w;��a�	���{���Mx�z���Rj@*�E������a{�Pm��1��62�b=��@�ȗ���1��]ĳ��崥����*��[)ÜƲ�?���U[�9�U�Q��-'��[ND)r��������b��xp(9ƃCY�1�B��Pr ����8p(�Mp(�)p(�)p(�)p(K��ݹ7�1�̈́i�i3asڴ�t�6�E�0�v�����t�\~���3dc	�
l��(R7��Ӻ�&\�r�s#�5;F���q"r�&+G��d���R�\
�f�MS�NE�8�N���J�߅d�䲠��^"nEӈ� ]P5mg�/�ĉ;(�D8QLj��.�GS;�DN�ɀ�Q�!'�J�-%^��c�9Rj;�]�"Od���X�X��#�(�R��>����u���"�`&�a��������d9�;KC�p�ko��N]��i��;uʤ��/+����!�f�w�]�J�^����8���)�~P�T�>�p����NNPP���	��Z;9A�Pk''(j��5Ѻ�/ү��U���Ir��X%�:�/�U�
hT��B:���v�-�8TBC.y��B�m��Q������(w���\t�(�g�KOw������������'
J�?;?QPj���ԉ��sD�t�������B':J��󗹼~���p(�M�}�n(�AQü5�E�>�_��6�o����K��8g��1t�2�Ys}@�;�<7���C�E�Z�]�{����0��6|!YO~���{���n�K�)��T)�jޅ��(������&�����y�eШ�V.�~S���7_�M)ʊzh�e�=�P���R�
��R��R�O����^.�J/�?l����?�c]��:��f�����'Z���W���K�t���=]r��F���t^O��ԥ;���tzfO��77�W��N���"�ut�����W�y���w�եdq1�]]|��G����hNznW�~T9��K��6ۺ��Yn�o����6j��x�YE�q�no�Q�E�g�n�(p뚈���^�_:g�x;}7�!��KЙ0��ڀˮ%�c+Q�:#�n��Òٙ�uR�.-�EӚ��""�&��D�+O���}A��&���f��z²<O�}[�E9�&

�������e���r��oi"j*�&z	m�����E��}�y��~�K�'���E�����&�jqQngTK#^ĕͨ���DFը�{Z�j2�F�&��DUbX6u�(!mN�>�(�>�9�K#.����t�ѬL�~�e��P�E��ꟹF(�P#W��ٰ�O����àFȵ�\��;��j��h�p��~p��~_CD��G`��˟b��7t1�OAj��$��T��s��`����H�I�eki/�$\X��e��q�����$�W��L�0/[y�d$3�z��zVZ���a�Y�}�V	�dy��"�
�s�[/(�F[$�"��숛���������4H�`���O$�0�!љ�.���g������3E-�o����-���8�[*j���ua__�q���^�|�y���z�|l���W��o����o}��_o��뗗�*[�����w�O�7��������~�~�I��B��$��n(��]�t����o�>l>�?n>�ۺt�a�/{
��d���eoV\�a���g��O�����%�$3I��a�x���s������~qվ����k�G��'䇟��[���~2�S3Y?�G�г��O�p���r�9˵�p�$���=�d4������3�����s���ϟoj���K�H������u��<��ۛ/���ӯ    	j?y�ۻ?����s�?��i�9>��v&�t���(�ia�ۯ��?l��O��ڏG���㱃�?~�ܶS~>������7s��C2��I����������}���{2V�����9&7۴pQ&7ݶ�΢Em�ܑr�s��Y��;S�O#�ӟܤrێy	qr���eyA'w����� '��J\t7��V�O��Ӟ�}ԃ�����Q
U���A��yE%P%,^1�)��+�<ez�<����ܔ�xɓt�|ɓ�Ϡfɓ�r�Y򤦠P��~�Cq����j$r�y5H�Ņ��
��]�=T������+|Ĵ�$1��5�9�u��o�햫_���߼����ӿ~�zju��W������C��������O�s��}~;bB	��u��j�q~��Q.��v��1�]}؇y���l�$h<������)>�|��PB�r7��r�nBP�D�k�P�v_��e�\��)��iTQ��¦�FA��/s8A\iO��36�]/<T3���ج&���H�룖#�L�(�a��#["�n%ɭ�vc*�-��ߝ�gԁ��ٜ���M�
&}kk��{+��}��ED����Ȣl-�����^B��o��,�h�����uK\v�P	.��.j�����Cy�~�-����L�R�ENt�o��_��Mt�	�Cq��Nbѹ�:|�9ȒsEuPK�С:��V�P�)t���vv������v�i}xϼ���ĩoTG��t�x���1*��%�G�מ�`Q%�$=J���AiP�� Rdϥ Rdϥ �f�&Z����K�� eP=Ǎ���6j��Q����M[Hi����fv��M�x}�������ɇ��C��Ŀ�!��Y/?��;��&��?��rzy�?�[|��껛V���z�����|4���~�o�߾:�����?��x�����^5o�����S�����G��������������w�?�ht�������]O�n�p�:t����M~������I�{���{գ���wߏ������݇����4��_��]W������U��8,C��Z�Q��^�e��#x=��-{����1+�UΫ�W�^�pw�K��g�z�J\��8��5\X���Zv?���s�O��|���'�t<�Y��ԉ�l����ȩ�m����'�f��y�<���{����QI�՞_�i{�+n�PW�_5�V�,eĭ��fxg~�>V��\��W��t��F-#�z�x���<,�&	�\9&��[a/x ����>�{�b�9�jE�e{�V����C�bk_�G�,&qE��#U��ZASE=����_�:zw�^����S��PR2�\%0	1u�9�8����IʎwPR��m���d@.���������(�@�I��x	���$����Fv��@�L�_L�Wګ�4N�8����}��bmR�{��w�{׿���.�)��d4��ƈ�Q���o���g��}'��-�/�}O�L���_���/�	�w�T��X��S��I8�8.m�2��G�E���&�	�IUo���Ti�˳W��m;��s%�1����+�zh��,�W3j�"�ˍ��7(�Ш��^6�˨n�Q;�s{2��!�2$jJ���'�}���"d�H-�k�H�DKq�'�夶��V١L�oj~�DAԨ
F�ߕuQe��y�]��%r�F=&�>��t�[�M2����/r[t�
uF��+�%n��PS����B!Q�Z
�D��ji��_1���P ^���q����;u-�f=5+����j�iO�
U0ũY�
�x���X����T0���i�*wRuvOQ��v�%�O��t���;��"�	�
f�x;������P�O�/f����J������1�^>_o0�J�cꃺ����c��}᠒(�[�?V�5��SL��01��1�$�U�};��W��K: ���K�kI�,ݛ����C��_����C끅��Cw��(�r܄�����W9匇��(����WW�Br�J�� ~�����?���'������o���w���0��{�A&jOm�u����=*W��f�]�Xi9���4������g֦�����V�ӊ��D67ᘏ*�D��Awn�u���84���n��W߮�Z��u����n�����(o:��y;\��:�w��Z�fA�����,�m{���,�~YO�wW����ԟ��n�"�0���}~x���,�ή��fAu(vZ�,h7М�,�HS x[��ƞ�Z�#��D�{���M��U,�bnno�ܳ���H�n�{v�5�ݴ�`7X���:�>��M��-��\�����WU�����ˏ�����īI����?�3�{���?1�o6�O?��������S}fD����7�}�F�z�=��D~��ڏ̝�Y��\�����A�٫��}�
^ߔL�d>�7�\2k
8�s}��y�v�s<�w'��z���O^��q�n�{���r��h��|h���{r���E|4�]ڿ,|�%����`���^V�A���+�'�f�d<0}��l88743D�˯���A����"�Љ��}�hB'
��Ԋj��5�]dGzJ	����:��/�d�Z�_�{$uې˾؈*��=U_�D���_�S_rD�T��K��#��U���>|�b?Ų�#��F�^#'��T���t�ۺP��~��X����_��nw�^���8��.K8~Y���ma�o�z�ɈE��i2J���PNZi2J��ס�ؑW5g���^ܰ���3{���OܰG �	�	L4�p�~�d/���v:~˻_���yw��^����&^�>���I/v�t��ݧ��=�B�&����?Ϣ����-��΃��Ԝ#�=�{p-:q��W�_8��]��O�x3	�yʋ���w��%�݄+��8�����eg��hâ�3�6*2��a�6��
(�-�ż�44������%����B��P��c�_�P�[���P�[��p:�b��gBMn�ˌ[�����$�TbDb�^�� Qy���RA�6\�k�<��ԏ�?m����9���k�eB=	�ʄzn;��
�J����%A��b�2�ny��ܧ��hr�)�E��ES C����6�-�m;�q�8�p�x�p������RF�i�V�6f1�)�,�4e�f�]�Ӕ-�m*[6[1��l�l�p�x�p��e���F����aL3�:߿@�b()�9%�p��)�as���Ĝ2=&1�L[��L[���L[���L[���L[���L[���L[���)[���)[���)[�����Y�i*`s�
���Ӕ�yq�Ԕ�sqCW���ۚ7tu"00��� �33:�x9R��+洛��L1:���<����~���E��+����nXN��*�q�C���0�u0\40��5��& ������&���Pa�p�`s���Ŝ���b!5�1\40���GM ����ᢉ��4�b�h2`�9{�:�jLe
�)��Yp%��S�v�ɘÜ�3�0��9��;cs��6��﬈ᢉ����b�h2`8}�*����w�p�8�p�*1\4�Ŝ�
f1��b�ؓ�*	1\40��JAM�:�P�J� �����T�<b�h`(M�N�E�YLi*u�Ŕ�Rg�8p�J]A�t��4�D�E� �iJ<b�h`8M�"��&�Ӕ$�p�`s��bNS�f���r�.NS�#��& �ӔS�p�D�p�r	1\40��\A��,�4�1�9My�őԔ���	��4�1\40��|BM�wG������?m�� �:��!�:� ��0�9mLcN�Ә�f�i�Hm��.�N�!#��� �Ӧv���Q�)u����4�1\4�Ŝ���Ӕ�,Τ���ˤ���ˤ���ˤ���ˤ���ˤ���ˤ������[�t�VQV�0�E�p���.#����v��|�"����b1��3W�1�I���(�0��Q|�B��ە]Ǜ�10m� 0�.��E��E��h
b�h��^ 0��4?fI�+�+�����8p'�Y��Ia+    ��b�fLDM'M��IGJ�:wґҴΝt�4�s')M��IGJ�:wґҴΝt��
f1���Y�i�:w"���s'Bj�:w"���u�D8Me�܉p��ֹk������3;�g���P.�_��^;F�6j�~��:|2Tu�������A�/sX��c�kZ1j��r���,�j�˂�������ҿs�ZaSȆ�"��,(j�̂yN���ڶ�҇�ٺ~�8[�O7 g���#`���#`���#`��5L�^	'�ۺ~�_�aJ���8rd���8r(r��>��ξp��mw�q{����a�;�-�q9T7;TB�E��Q���Q܀�Q܀�1��&��L��St�L󨉶���ݗ�GMhl;g_4R�w����ֱ�_M9�9��Y�Q<y��ޣx�vi�GiMa�/�i'��]4�/�;�_2Y�R�b�.�:q�l�2�S �)&td��0�%�W]�Y����������r�#��I)ꀛ�(��wG|��]��b�W�v���:+�;��[f����W�eEi�C�%���<|�W/Eyp3׈��u"�h�Q)>�G���f|�	�P���8g��}�?��'�J���@��'y�6QN�w6��h�"ꃛZG7��(nj�P
�4�ګȉ��W%�/k�J �
�^m�|�?�������|ѡ�Z����wn�@kM��\�nbM؆������D�;pԏn��M07��Jh��Q���b.jE��);eͨ��v�8�D��]F�ԩ���oFAp��2��e��92ʀ�sTw�(��ܝ\\%���*y� W�;��J���*9|����H��URS��j{+z�������n���~�-`��į�72HLtj,)&z�˒sŜ�F��a�S�S�0�ѩt����T�����T�����T�����T�����T�����T�����T�����T����J������������Ӕ`s��6���6���6��k6�^���61�vx)`�&R�`�&R�`�&R�`�&R��&R�๒/��Y�I�cs���Ŝ4�h�_����9��Q�5��+5��+5���tx�f��;�ɀi�$01T4`�o�A�L��\4���E�Y�\46���NLBML+�}0�o1��b
b�ȍ;Վ��:��`�?'�:)p�:)p�:)p�:)p03)p�$���Ĝ����bs��䮃��p�8�p��V㮃�	��4e��]�iʺ��&�Ӕuw4��$�bNS	��Ӕuw4�GM �)�&�:h�NS�':h̖��NW��?Rά{�Q���1�B�Q8���UTC)(矔�	w����S�%9� Ʒ��5L�Β2fq�H:�gLcn�ʘ�ܸ�1��q+cs�V�4�ƭ�Y̍[����9c}�]#���-�����nܲ>߮��Q�p��>߮��I�	��z�m U�T��fPf��F߮O	�1�M�:LcF��i�h�bl{J���E �h�b1\40�6+&!��&��f��P�X��)i3�3����P'%�š�s>?�bN�Y�)\0�9���;�wM���1�N���5��b6���2b��*����u��p!0n�[w�K��c��}��B`0��f1'M�Y�I�as�t6���Q�ͭ��cc|�ꤼ �:)� �޶�}K��?�Pڭ���GwR1��ͯ6[#K/v
Y1���D�p�O��ɀ�
�Y���(f17P�bn����@ls+�Q�p�D�p�	1\40��BȂ����P\I��\f����ܚu�qΌ7*����:�p
W�.����;�3w��+��U�Ζ&�c0���F1���F1���F1���&�,f�
DA�7�D�.� n���.�N�1M1��"wu
�6�)q�L4�����11ԵI�Ŝ�f1���Y�)<as
O6��𤈉oun��\��^%"�;�n�H1\40�8�;�P�d7Nd�.N���Sf�$攙1�9ef��J*3g�p��p�*b�h� ��Tq����4Ub�h0��JDf1���Yܶ����k�u��u�/�P0�)eJg�8rʔN�E� C)S:�.� J��)b�h"`(eJ��E�C)S��*�,��)�Y�iJl'RS��E �iJ1\40����K����K����K����K����K��f1�)�Y�i
��Lj
��Lj
��Lj
�;�ɀ�4���R�:�p��{a�b`8M�sǽ�T1�Ŝ�<f1�)p��*&!��&��8w�;B"��q�U� �����8w�;B �i
�;����,�40�9MY�NȒ"�Ν�%Eb�;!K��:wB��u�,)��	YR$ֹ��H�s'dI�X箵��m��y���Jn�npcLBwR�Ŝ4���f�,�i�;!K��:wB��u��	Y�#ֹ��G�s'd�X�N�"�Ν�E<b�;!�x�:wB�H�,�4�0�9MY�N�"�Ν�E<b�;!�x�ZwB��,�k�	Y6#ֺ�lF�u'dٌX�N�B�֝��*�1�9Me�bNSֺ�PE�u'd��X�N�B�֝��*b�;!U�ZwB����,Tk�	Y"ֺ�4D�u'di��bNS��Ӕ��,k�	Y�!ֻ���Y�NȢg�;!�:���,�pֻ���Y�NȢg����o���`���3���0�)a�s���0�)a:�ܵ=�����l};!�K���,/qַ���Y߮a��Գ���5*κvB֨8��	Y��k'd������5*�as�v�Ü��0�n�9̩ۺvBV�8��	Y]�k'du���݀ѹZ��r[�Wu�2;0VJF
wN0�2�i'd������5*ΚvB֨8k�	Y��<&1�L�I�)�csʴ���5*ΚvB֨8k�	Y��i'd������5*ΚvB֨8k�	Y��i'd������5*Κv��Ӿ�+��Lof1'̀Y�I3`s�Ӯ�~��7�*�-�V���"�N	,;�^ƁeG��8���z�]~�v��H*�E�U4�8��<�LzL����W��C$<w�2b��V �Dӛ�"&x[���z$�|�Ӝ�"�97EL�:u��a��d0��ܨ1�5���g�%b*W�|�\F,��}��+o���v���c��v�||�is���X��I� ��ު��zf�o�}}��~�?,S�5��asw�]?�a��q�8�J�7Hօ9�ɺ0� Y��$��x�d]�o��s	s��3�77�f�fn͘���1��a�z������ᢉ��4e�Ar��ɀ�4e�Ar�hq�$���A��)��{GWf1���Y�i�z������E��i�z����u���Ҕ��`�����K�7���-��`<b�k C)�[o��e�b0�)����R��0�)����R��� ��r�b�h`(�{���,WL �p���,WL�)���,WL�)���#{�Y�i�as��!�;��!�;��!�;��a�4v�ӵ�����U{[r̉���*�Ӧ��]����]���(��{e�@���z��f��z��f����<����(<f�o��K>��3��<fxsLd�Ǉ���������Iz��l���37OOۻ�y�I��t�k��̀���뻏����tsZ�(�
Tјʦ"/�9��Bn��/3��".K��R�L?N����on�O�@'⢆������s�(.�+˼���~��E�0��'�ލ+��'�ލ+��'�ލ�)��R7�����7o���7~���7o��7Wo�D^^ڧ��ۛ��^_Ws{�W�7>����w6�������Ƿ�6��/���*�}�����y��������=��?\��J�*mե���&���uta#z�X�/��A�/�cܭ?m���M��ˇ{�o���!�s���u����I�����������v���^����_�������i��(��c��+��׾ �O������7#ց����~�:�?�_�|����vͿ�j�}���������a����?����Q8���/���|UG�����������    �)�o���a��ÿ0�������n?m���~]��;�K{������a��!')*E��O�������mno�������AJQ�>�`~>����������lo6�߮oo�W���O��<|�>>��/�W���͇��������w�ϷO�K���}�������6���'{p�����O������7���s)���oě�!���W5��֏��/�����t�񇣫�v��M?T��J�F�8�Q��м����?�jZq���Ȋq6��T��E�b�SM�������T'�����dƓE:��P3�q������q���������йd5���E��2_�'�����'�&� ���[6$��a<��Ə�a<��Ə�a<���GLn���+�/�v�\�8�'L�v]��	ӾC�,Cj�Ƿ]�p��P�z&�"��H	E��;�z�P��;��;zB-p��d�@��>w����nx�1\40��b�h0��#b�h`8��.�bNS���T�Y����!�����T	��Q�p�*1\4	0��JFM���u���pv�Ŕ�B�YLi*t6�I7t1\4
JS����I��4��.��ɸt����)q���,�4%�Ŝ��f1�MH��.������@�11\40����~. �3������Υ��_8��Ep1\40ܐ�;�P�x�~�!�����}@��Ӕ����,�4�1�9My���!t���	NS�!�����T��Q�p�
1\4	0��BFf1�)�,�4�6���#�:�p�x�p�Ҁ.�)���I��4�yD ��<"��F��"f1���Y�i
�3rÆ ��aC ��ܰ!�YFn��,#�A`��� p��}Xb�>�0r� ��uAH�Ŝ�f1�)p����\��l.�E� 6�"{ ��|�=��E����"_d`s�/������\��!cs�ʘŜ����68	��b�ks�N����'��\l��`m.��I�6��$X��mp���v&	��b;���Y�
��\�L׭\\9��c��9�	�`S�Tkr��MԚ\l{�&��D��Ŷ7Qkr��MԚ\l{�&W�K��v=3��r�/�G�I��N*#�;�J�*�Ŕ�U0�)i�`sҴ&�%E���vIQkr�]RԚ\l��&�%E���0Gʹ{1Y�n���11�I�W��f+j_�b���s���0�9i:�bN��Xu����ݻ�R���`0�ŭ����#�Y�ֹc[��u���/j�;���Z�m��ֹc[��u���/j�;���Z�m��ֹc[��u���/�1�9�{�bNSֹc[��u���/j�;���Z�m��ֹc[��u���/j�;���Z�m��ֹc���u�خ-��Ŝ���Ӕu�؆+j�;��Z�m��ֹc{��u��^)j���W��È_�Ftv����pE�o�6\Q�۱W��vl���Ü0#�0'̈9�	��vl����pE�o�6\Q�۱�R��vl����*E�oǶJQ�۱�R��vl����*Ef1���Y�i��vl����*E�oǶJQ�۱�R��vl����*E�oǶJQ�۱�R��vl�����D3f1���Y�i
|;��E��#�]|;��E��#�]|;��E��#�]|;��E��#�]|;��E��#�]�`S��f1���Y���#�]"8wd�K玬v��ܑ�.�;��%�sGV�Dp��j��Y���#�]�`s��bNSֹc�6D�ܱm�u�ض�:wlۆh�;�mC��۶!Z�m��sǶm�ֹc�6D�ܱm��,�4�0�9MY�m��sǶm�ֹc�6D�ܱm�u�ض�:w�ۆ>sn���X0A
uNָc�-Dkܱ��5��v�cs���Ĝ2=&1�Lkܱ��5��v�wl��h�;��B���n!Z�m��qǶ[�ָc�-Dkܱ��5��v1`s�
�Ŝ��qǶ[�ָc�-Dkܱ��5��6	�wl��h�;�MB���� Z��L�uǶ�ֺc7H����T�,�45����g[w���3���@����݀Im+�÷�?�u�*�LDwR	0�4��]�wˌc�.лeƱu��غ�^�1as�L�Ŝ4fq��|���!c�$־j��!Ǆ	΍!�&8�
M1\40��;�P�d'����&�g�T�H���.�9m���Ң�dc�)si�����|/���h�1�+�����^�wOO����]���NE��E��E��E��U��zŦ:��/�.�n�+	1\40ܨW
b�hR��i�1\40��R��E�YLi*u�Ŕ�Rg��\�.!��&��T�
b�h���$�.NS��E �iJ1\4�Ŝ���Ӕ�,&_�HRCE�:�p�r�.NS�#��& �ӔS�p�D�p�r	1\4�Ŝ�f1�)o��|i#yA��)��E �i�+b�h"`8M���4�iW�J��DN+���1&#�;�N����f�,�0��4e�V�[����@0�9}���)(`�&+s�`"b�W��$��"��ES �h�C�
`�C��r�`+���:�q�D�p�$�MFM���!��&
`8M�'�HM�'�HM�'�HME�bNS���x���x���x���x���x��m��לב㪟�J
㦘���O�3�9��H`fR�`��zcۇz�5�?E(�mD�pcJ�Ɣ�	ύ)	>H�V�~�o���s��2"ʀ�2� �6����6��QaƇz��<3��3�:7*g���xָ�?)�um��1fv̹��z{�ͻۏ�?�맫�֋���qsU�~臟}[��E���h����Q�g���h4��,J/`2�
&c!o�`2�
&c!o�`2�>&c!o)`2��~�a���IX��Z�?�`;0��0�+��J�0�,�0���|��XgP�ۓ���Ԭ#w�����/�U�]�;���P]|QԤ+w�
jҕ�@Mh�����=���6��/�|��l��w�Snz�/��8B���G�'(��+�+�W����ߴ�׷��\�?ܜz�M�`�<�(���3G8���&�YP5�j4�~g�!j���}��z�N�ڧ�E� CMr��O��& ��fk$g�)k��z�/<0Xwuw�0ɬ��v�羏���(��Kő�o�Y��W����i������i�tکzB���в��Q�-���O�?n�^_o���AɣFZ�n\(*��yT��m��06�7��(�\����@���G�p3���W���Z��ۺp�8�ȼ�9�MY#w�����Edk���Y����1����!�k�ܳ�lm����&nm��)��na�n���`G0��6�Ԅ�AM.����ʇT�;p�	���aB+&��γbb��EWݚƭ�u��i�0n�D�Y�Y�x �����M�N�����$��Ԃ�)p�����܈T
[����2$#��� �Q�$L{nhO���О0ٹ�=a�sC{����	��	����u�Zpp�d�p��p��~q�ԀfW��$0fJ���![y�]V'd�#7(�mX��a�V��r�$@_����T�uu� D�C.�#f�F���"�D%mG�']&z)��6bA�p����h��|Q����2�N#��E��1JåyL	+��*J������nAx�,�W%���.K���:1�:�'��CP3��a����ʕ����t��J\v�P >������K�Y�����@�	e�PA��kJ��m���LuA�y��.�9oTC{f��Pgы*���yyA{�f٩Z�6�w����D��ⒹR���@��#�ā[1p�{��E�9$���
���yz�)u���ubq(���_��%!���hk�/����8��J,� ����=J�5�H政�����=�?��s"E���~���Q,Ԓ�xT��(B-�G�p�b��hS��23���Q	u�5�Tg�I�M�&=7/
��ܼ(`R�y��e�%`s�|��M�����=��R�-Ҫ��̷nnOѹ}��)	)�u��O)#��6.`�0��    c���R�FƬ��U��n[��{P!yd�~�?������I�x["Y���M]1���blZa·�`�<?����*yѭ;b�s��)�ݺ#�|�(��D���_�,�^����"b�7��J����Ľ�DQ��'� �IG���&	���t$�vn� o$�	��Fra	o$�Z��Fr�7��x����㍤��㍤��㍤��㍤�2f�����	fZ9_I���^�a0�f��s�q]1�bN���S8x��T88��T8ر�T8x��T88��T8ح�T8ح�T8���T88��T88��Tx�,�4U0�9M���IM�����������:�=�G���>�9����@8����rL�.��������
�ux\���t\��%��b`�1�b1p����a�
i��JW&"�;�f(�T3�V*�J]'(,f(��	3�V�=3�Vf13�VfqJ�}W16���!<�E� #\41\41������|ߢ�Օ���C��рeZ1����j�y�ܬ�'v� ����I�h�p�\fqS8��,\4���E�Y�\4&���^��kt��n#�.�.�E�E���\41\4	0���o�:RS���T�,�4e�K'���s��,���b<`��L@��q�D�p�$�x.��.��@Ec�J7�I`0��Mh�3
��QLb��	�X�s�I<��H`1\40�2���L�D:G*Ӛ�Αʴ��s�2����Lk;:G*����)���[�;�f1'��Y�I3bsҴv��4���<)Mk':OJ�ډΓҴv��4���<)Mk'��u?�M��;B���G} �)�ډΓ
�v���f1'̈́Y�I3as�ۉ��X��ۉ�������N0\40�4�v�ᢉ��45�M����8`�h
f1���Y�i��,RS�#��& ��TQ�p�D�p�*	1\40��JA�t`(MI'���,�4%f1�)�0�5�u������NJ*F�cӘ\%JÝU�M�2b�h
`(m�t����M�.N���:Φ�����ͭ�Z�1�q�4�4.�Ɯ�Ŧ1�L)���q`8m:A�CL�.���_�N�. �;)'q�E� �I�as�t�Ŝ4=f1'Mo�8���1\40�4}@��Ӕ���I��4�3b�h
`8M�1T4���T�,�4l+���E���4"bܑ	Nn�R�Y%5���2`8i��*� �IS1\40�4����bs�T�bN�j�8��Ԅ.�N�ZCE;�p���.NS�#��& ��TT�p�`s���Ŝ����Dj*�PѤ0��� �����T��	�I�V���p"w� ᄙ"b�SJ�ᄙ0�9a&�aN�s�&xw�&xw�&xw�&xw�&xw�&xw�&xw��xw��xw��xw��T�,�4U0�9M�wWHM�wWHM�wWHM�wWHM�wWHM�wWHM�w7���s֔Vŭ�3�<�0�9���������������x�lC����Wvͮ���a����N�q; R#��0ݩ�u��Ԉ�:LwjDq�;5��ӽu��K�3L|m'�@� 5�9��	YJ��'d)������D��~B�9��5L�y�0�ʨ_�nU���S�1G�C����~B�$9��	Y��'d�����E@�asjp���q��W�_����M��	YK���0~�����37�Я�3����(`8mZ�OȒ$g}?!K�����,Ir���$�Y�OȒ$g}?!K���,��1�9�{�bN������Y�O�R"g}?!K�����,%r�����Y�O�R"g}?!K�����,%r�����Y�O� 0�9M�bNS����Y�O� g}?!K�����,r��z���"�i�����c��ͷw��SW�����Y[p��-{:rΊ�6�8e��yd<����=�F�74ݲhQn�����������������ns*���Йm7�r��ێm+15i.�<\h[�.9�8�J؟�l��y�D1wR{�y�Dm���dO�h��M�,ډ|Z	β��P�b�h%���d>��VҾ?�=�4�gQ�i"��6>�D���t�R5&�7�J(��Nl�0#��½���y��{��^3������s9�	�T��up��Pa^���I�&�[e���:�
��vB����ʱ��g�(>���I�a�(:?�%�9�\��q"��t
�Qt�J(��B��sF�yF�7�1�q�7�67����z�[4��(�z�:�z��A�~��j{n��}����������C��-( n[P5�*ֺ�BV�;��6L{6y�C[��
Yt��+dѽ�E�κ�B�;��
Yt��+dѽ����E�ޚ�B�������0�)i���������E�ޚ�B�{k�
Ytסּ+d���,s�`��e�\�>݃�K֧{0p��t�-Y����%��=��d}����O��ߒ���[�>݃K֧{�o��t�ml��e�9�xX5���0�4f1'M�Y�I�as���,s��ߒe��[��݃K��{�o�2w�-Y����0s��ۜ���d����,t��ߒ���cs��Ŝ4f1'M�o�Bw��P�>�z�L L�&�Q�p�D�8.��.��ESCE��P�N`1\4���E�Y�\46��Bw��ᢉ��4�k!5�k!56k!56k!5�jŸ��l�|t�UV��CwR0�4#fq�����7�0���GLbN���x�$�n��]SCEc��]#��q��n��] �	����&&�S��wMf1���Y�i�:��&F�E� �i����&& �Ӕ�wML�)���NS�����>�`s�*��MS���cl���#��& F�h1\40��&!��&�s��0�k����'0�.�⪩��׏`0��������(b�|w_Q��n%�[��Dǘ��`�;��.�GEc�;ח��6����V)�ݪ�P8�b����ݰ�?����,\4�Ł���S�`s
[wq��?�)���[wq��?�Ą�2/��f�����'�swM��S�ع��&&�S��$��0�9ezLbN��&����1\40�2}@��Ӕ���I��4�3b�h
`8M�1T4���T�,�4l;RS! ��F�i*D�p�$�p�
1\40���C�
`8M�Cf1�)�,�4�6��5�F�p�$�p�Ҍ.�NS�CM�p��1\40��b@f1���Y�i*�,��bFM���!��&	`8M%�.NS) ��F�i*E�p�`s�J�Ŝ���b%5�;�P�d����E��i*�p�(`8M�.�NS9#�����T�,�4UlGRS�!�����T	��Q�p�*1\4	0��JFM�)�:�0�h�YLiJ;�bJS��,N�����Q�P��."��&�Ҕv1\40��T:�H{��0&�*�UL����"i.����EV�!��0�)��[0�9y�0'o���-6�3)o��2)o��2)o��2)o��2)o0�2)o0�2)o0�2�)0�2�)0�2�)�Y�i�as�㮐�㮐�㮐��b|��hfD��`C���9_7�i����)�z� �׫��߄���D��+�_��k��O�'#g�1����@9,��MJ�R��vA�#��#�x�w-�9~r+�C�]���n`��?֋}��=Cۙ^�q}�q����nN���n���F��qs����̩��y�(��CƜ�L����*���<�@��b
`�{=݅?k2�����(����C��7OOۻ�'�0�C���.�����z�~���t *��#�;b2@L���s�ۻ�E>}����_���ϏW���U����+�//��������
����͟�����iS��+�^^��o�?ln���|y�����������e�������//�>l�O�wO�ߟ�����	�g�_T~(�S��ڑȂԲ��;�7|��u��b;�ɗ��)f�u�<�:��ۦ��1�"J��y��j(��Iw<��R��T��-��a��t��7��Xs��<%�����y��Ěޙ�q�8c��a��    ��v+��a�7\͐���i���	��y�}�Ԭ8���,,a����7���(��s�.��ԉ6�ԇ����v5��j�O������ݏ�����4�D/c��w����r٢s5O:�]�숞&�m.|�IS�)���� �&��O�4ڣ��䛺�â���ο���8��W6��ڋZ���f�V����+�QR��EQ5j^,
�����r��uG<�ɨ��G{�懇����zS��B2���Ls���qk�(.���Cp��2�`l��'�kF�%����j���Up�x"���i O�ڋ=����6�@-�����Z,�E���
)(B߿Ti��/(��ɾNFf��j��G�L�j����k;T^��>O��y�ء�k9�8X]hE�L�ء�By�g�1�����a�^��5֞��N��1�����d1'�0���c�?���V
�0�g1r s����F���-�׿Ug�G`f7H���q�m��/E0�&!���0�ESCEc���^F�:,��J4�|[3GCqH����s��E��	\4�ā��X�h0�����
���z*0�L[+0�T`00�2m1��S��(`8M�����I��4e������,�40�9M��������_������11�ȼp�A��	�i�$�Q�輓tӤI`b�h2`<MA����8p�`+f���!ϝ�*f��#=c�1��ڗ���,V�ckz+s˩��K���jg�o�����f!6��`�����`���!���#&�9�����&o�����WX��
��?��#9����������?�ײ�UT���e�0�!Gr����(�0��Q4a*s�h�T�0~)s�z)s�y+������1ؼ���R`����0�����0����߀Q�c��y����>[c�?�W�6h<1�I��6�}��l��y_�Kn%0��N��9�D9p7όr��'���< *��x]E������F�vD�w����Z��)Mg牨����""
��w�&�Ql	q"ݏD�3��6�~I����Q�LC�o�D&q_�D�����$.Sr�&2���i��M�D%q_%̅8QIl��K����ݲ'*��-�%ĉLR��-�Q�n���z��'2IK�z���. �D2y?�4~�~j�|"m"��Z��&z��7\B���o��B-���H�EtT��N�j�V�IP��7	&~pG���ߔ�lo��Wx�a�7������nc�Ϯ_�~���~�����O�����?_=n����R��������<l��~i+��r��Bǔjm��`ʇ���/�r%^_�%������Q(�;�G�7�X����C�Pyx��{:�����ә^l�֑	����]x�������^l&�|�b39���1��~K���1�����`+���~K��E #\4�.���W��**[����~r?�ߝ��(#�;�OE~l�ڑ�`f2'O�L�䩘ɜ<�;4ed01�HӢ}�b 	!�)e�p����ّ�XGv���`1\41GjdsZ9_I��#�`���o�q�|�֌�L2'�9�s�&"f17LD�bn�����0a�ء�$��p�8�p
�f��g���p
�f��g��D�p��f��g��d�p��f��g��d�bNS��Ӕ�[�>��#��& �Ӕ�S�>�&�Ӕ�P���N�CZ����_I��L��Y���9�S:t�$N�ڣC�K#���L�T^0�9��dN�3�S��7�Η&!��&�S�52����c��/���F�E� Ci*[{r�5�`b���}�AS9t�d��$���;LbJ���$�����b�u�$0cC1�:V2��<�Ӯ�$���96
Ӯ�$�Q�p��i�k��$�p��i�k��`s�r�Ŝ���br���C��)�E���4�"b�h`8M����8�u������~�� �:'��S��$��1�9ezLbN��&1���^�E�)�'�p�d�p��1T4��� ��q��4<b�h0�9M�b=�J��yuV�THg(�����4p�WޭĹU��`s�6��uf1T4��ӷ
b�h`8}�GM �oU�p�D�p�ք.�bNߊY�i*�,��� �����T��	��41\40��bBM��XCE�0�9M%�bNS�f���J1\40���"��&��TJ��ɀ�4�
b�hrNSY�E�Y�i*cs��6�#����ᢉ��4�b�h2`8M�*����T�p�8�p�*1\4�Ŝ�
f1��b�8��*	1\40��JAM�:�P�*� �����T�<b�h`(M�N�E�YLi�t�Ŕ�Jg�8s�*`�eNS���i��q�IM�q�IM�q�IM�q�IM�q�IM�q�IM�qG�_Q��Ӕ`s��|���qG�_Q��#߯(`ܑ�W0��+�o�P��+��|�[{��n�����^�;}�R�_L�@��+p��N�Gp�Gp�Gp�Gp�Gp�Gp�u����)����X�OȪ�b�?!�n�?��fYn$���[d?@����9��J4�ӨJ*�2f�D2o?��z��b��<��ȈH�,�]+�w6k9X�ۛM�\u�l��છf�?W�4��9������U7�&��iQU�<U��S6�sp�M�ٟs����nnJ��]��l��`��S���pQ6�spP�ٟ�k����ܲ��2%L���dŰ�*�aER��"���@�U�l�Ȫb6PdU1(l���"�f�?5��9������E@�f.j6�spP�ٟ������\�l���"�f�?��*f�*�b�)��9�������7�f.�i6�sp�M�ٟ�o���\x�l���f�?�4��9�������7��������y�f.�i6�sp�M�ٟ�o���\x�l���f�?�4��9�������7�f.�i6�sp�Mk�b橦*f�j��T�y=���IeL9��47ؾ��j�;*�4w�>���S���2�����m�$Ŕ���k�Oq>�,N�3f9}�ʞJ��*�ݪ&2|�Ɇ�G;֟�ꨓ��m�9�J�go��[�1*w2�w�ʝ��r'�|Ǩ��0�1�o2�w���c��ւ��Ɗ���'�}+:��c�`��m���Z��I�a����ck�:��y�Ƃ���U1�TP3O�Xб�`��g��3��yr�LP��(fM.'pr���\�-M�"fq��Ҵ�i�a�\�̇�aZ����ew+��f�DT�v�l��Q�Q_�-&[�j�ZQ5���f�VT	�AKBA�خc�bP5
��v�ê�a����l�]�D��QBB�y���ъ��11L�cH5E0̚IU̬�T�̚YU̬)� [��1^1�� fM	ۻ���3����.*�9\BA�<�c�`��%d���$� [��1�bf͢*f�,�bfM
�~��êɂaִ� le�1U0�S6����dCA�<�c�bX5^0�S6�̓;FU�<UU��S6�̓;�(�US�<eCA�<8L6�̓;�)�U��<eCA�<�c�b�;w�|�m���p�p�7�ʘy����7�ʘyӦ��	qp6�M���� lB�1^1�� �Mg3>��c�`�7���`�ߎ)�A�r6ԃ-;FU�<圪y��$����VM��`�ߎI�a���l��1E0�S6�[[���� �3<�:�Fwk�^�Q'V��xx��p�����f� êI�q���VM�g�TŰj�`�f���z�	&�j�bX5����y�3�)ιG�7������(U1�f�*vК�(�USì�bP5q�ft�a�x�0kƠVM�fL�aը��|�_e�u2�03fT3cF�a��&Šj�3f�a��0c��VM3fʊa��0c��V���y*�����Uq���^1�� �êI�a��Y1��"�\êi�a�*�bP5EU�<UT��SEU��p����֧ѷ��'t��p��,I1슲`�/KQ�{�!Z��-��j�`�b�E5�0{�I1�����]�b���� ��`_���8�jTŉU�*N���e�    �TŰj�`��M�A�4'�ᩣu�0^1	a�`�&*�U�Y5Y1�Uqbը��ƪx���2�O�bH5~r�q��VM򔟢bX5I0�S~ʊa�� O��*�U�*F��NU�<�Uq��r^1�� �)êI�a�rY1��"�)Wêi�a��bP5^U�<�U��S�U�)��*���vzJb�
=%�]���خBOIlW��$���S�U�)��*�TP����2���t��[�FU�1�<�x`H���_�������M��{=�]5߇�����C�:��UA��*���$�kp��ȯ��J"��*���$�kp��ȯ��J"��*	��$�kp���b橤*f������`�bX5A0�S6�[��L���n� S�<eC��i��焍 �ߴ
��>������~�������Dp�n����������~{�̬b���7��ÈN_�:�}Y�����N�����5����?~}����t��B�N�ڂ�Ym�\�����j�������F`��M�~����^����R�W�� 6��qm�0I0lh�1�ڟ`�`��ncĵ?3�4��1�������x���Z��Z�W�0#�J���f�k�g�I�a�d�d���}�����؟_|��}�����?<7��pq�!ʬ�I�b��̶�2m�80��Ԯ+�ƑklP�W�ڠ���������f j6�5���ځ~MU����gWSq��+�0rm�0N1�A��e˻�k����xŰ�
�A�S�a�ڏ`�`���#�~� S��l����&d��T�Ț����5�S�1�_��N�� r!_uφ��O#ο�Lk��.�kL��Y��������?��?������W�\�?������ u������:�8Ť1Ǻ�Z��3������&�k��ץh�s�.�X^Rn�GRñǪWñǪW_�ǪW��8j�ZyA}ҟ��'W���$�����g�v[ޫJj_޹��n���K�t�����������GU��?sX8�gԗlfԗ}f���jշl՗a�T�W���E5b�Bϗ߅�F��
����ږMӣ�2����W��doQm�|o�?5K��vs5����j��{�/^��l�=s��X�%(���K�d�	N�%�Nc��q���H��`���R�m�=�[Jڝ�T�@N_vy�=s�U�y�N��pO�+���=����f5ϖ{�^u{��&7�_�8�j.����K�}#���=�u�Dz:������ĻrK�`�)lΗ�l2V�l�QT���_T��AXT��AXT��kZ7�׏�?|���ӗ��>|��c[�<���ᶦ �y~7w������8�Ƚ�\������mO7U����_P�d�p�X�~�
퓗K
J�r	9�����j�10?l��<2�#�BU+�5��Z�=��f>���7��K��J�(���J~y	����bs��V����
T+����X���FO�k���g��K��.?^.!���U#BS�u��r�'5���i�>�\��8��U�/ �����d5���I�5w_��8��:���0N�.��'�R�����V�|���D�V��t����+�kf�ѩ���%q4��[�?Zˆ�N���܅R������kЋet���a۞����-F-��O�S?�����)\��G�n�r����颉A��gŞ�^�0���;��X��	��f��e`�7T�垹�;G-�/.��;��+B��w&+W�@1�L�p�߉�3Y��9{'��d�;�3Y���_p'v&�/��a��̝عn�^p'v�+A���q]�`�w\/x��wu��w�Nĝ�6�w"�\W��>��w���qܹn�=s'v��=�el�eB��y'��39]20�Z����t��	Y�0��C��W����?�܉�'y���nn%wI�iO��V����|6��kg����vF[�܉���E߃��h�_/�VFg�+�;�������l흿d6�w�k��8��s߆{B�y�vկ��C�f�j����J�6ֽ\�,j��/�5ۼ���m��������6���l(F�E�����LɊ�k�/��Qv��{�d5܈Q/���m�=1�U5��='��ž���Ƒ}���b�^U�El���ھ~��������/ϵ��U���^�Vwu�X�p	[�5��O��aa���]�V��Q����Ù����X���?��9����T,�l���k�fJ����l.�MĂ��fa�TS_�D��X� k&`�($`�$�!`�$�!`�$K`�$�`�$�`�$�`�$+:�>8/��[J�ѯ�OS�`��bT�s����*FEr���D%�Mw�-�tm=�����U3��T��=����8�<�Sɣ1.9�<㒬H��s��H��s��H��s��H��s�,@��s��7��s�,.��s��%��s�,��s����s�W3OyU1�]�a��d#��&��{�>7�@����ɦ�~n�{��}�y�Q�.pO6���o�ټ�]x��=�l��a{�dcvۻ��*f��bf͠*fִ��O�M�=l�l��a��d�n۟&l{��4�����Ɇ��?M6����i�	���O���=l����y*����l��a��dcd[�&#{�Z4����֟����L6��5g��]5��z&��|z2���5g<<	t��v�7粡�=\QV	3{g�0�wV	3{g�0���Y=l�l��ag�dCU;s&��zؙ3ٸ��Μ�f���l��/�����Ɇ���L6����g�	���=SQ3g1sfQ3gns���D�3�1�A�l3�Ü���&�9s0.VM��66\0��"�m�`X5�b橦*f�jV���yŰj�`��ZT�&	�y�eŤ�}}>�|rs�[���=�SÜٚbH5y����'1rf�T�șyR#g�Ɋ�f�))�U������VMrf��bP5n�TvN1�/�)êQ3O9U1�*��v�Űj�`��\S��O�a��N1�/�)ê��a��I1�U1�W3Oy�bx�@�M1��0	�y*8Űj�`��BP�&
�y*�0n�i��|��n1����!�(��U1sxP3�GU1sxT3�G�b�R8ǠVMsxL�a�d�0�ǢVMsxl�AդI0�S�)�U�*f�J�b�dU{��êɂa�JE1��*����ɓ`���S���y*ŰjT��SYU�<�������bX5U0�S�)US&�0O�V��T	�a�D�0O���4��{�*�Uqb�X/{B �)U#�ݲ'`�bX5^0�Uê��	���VMLd�ŰjT��SUU�<%�]����AOItנ�$�k�S�5�)����DwzJ��=%�]����1O�IU�<U&U1�T�ٝ��������<Ulv�&�b�;71O�ݹ�y����M�S�fwnY2��i�Ic�;7�}^�8�$�Q'V��8�j���!�êɂq���VM�g�4Šjlv��U�ê�a��ٝs�S^U�<�U��S6�sz�fw�CO���y�)��9=e�;硧lv�<�����ٝ��S6�sz�fw�COU1�TP3O����)�ݹ =e�;��lv�����\�������a�`��lv�����ܼ�#�� S�FU�X5�K�ٝ�Wu�S��Ʊj�bX5Q0�U�êɂ	���VM���փ�_�dUq���u�1o�R41sfV3gf��}tM)�j���"���ms��8b�ɂa�rl-�T�0w��n9�`ln��7K0N1�/�n��-����������/mn��
K0E1��*�)��-�_����	�)�U���7��N�ܭ��_�P�P�3ml��F0I0̙UE̜YU�̙UE̜ic��<�������`�`�3ml�tT&� �L�-�m	&	�y��vK�Q�)�a�����+�`T��SuR#OU�-�B	�+�U�<U%���SUb��<U%���SUb��<U%���1�G�\�G9�l0M1�$��̚թ��5�S3k:U1���vZSb��)�]�֔خAkJlנ5%�kК�5hM��    ���vzJb�=�U��S^U�ܻ0��Q��J��Yږ�"���M���`T���6�[�mLS�ƦvK�M�q�a�x�0���ni�I0Q0��6�[eL3�M�F��*f��n��v߾��mp&3+��afL��-�6	�+�UÌi3���&�$�0c��n�I0E0̘6�[�mL3���n��*f�L�b�)��-�6	&*�U��<e3���&��0O��n�I0M0�S6�[e�SL�h���/�3fV3cf�03fV3c��n�I0E1��*fL��-}2Ʀv���g�OJJ����d^lh�t�$�xŰk
�a�����'�`�`�3���9����3���9sڅi�	0��nŠj6�݂a�܄v+�U�<�I�V�&	�yj�ڭVMQL~��F�Pnn|�p�ə�Cs��-�n��s�j#���Qn��*fo�b��*fo�b��fUL_4[T�&	�9�eŰj�`��[U��	9�M�bH5mr�A�j�W�FU�<�&U1�T����f��bX5E0�Sm��a�4� O57)U�`���W�&�y�EŰjT��SNU�<嬊�;bsU1��&�)?)U�`���W�&�y�GŰj�`��|V�FU�<�U��Sު��haR�&8�0O�VM�T��a�$�0O��VM�T��aը������y*Z��-zŰj�`��bT�&	�y*fŰj�`��bU��	�y*M�A�$U1�TR3O%�b����VM�Tʊa��0O��VM�T����N0�S�+�U�*f�ʪb橬*N�]<������[��:��0��rQ��*f����)�`�1�S����Űj�`�1KR�FǓYT�̘Ūn�h����M�;��Ir�C4I��v�&���$���!�$wpC���ch���}��������yJ�;���Ir�14I��>�&�]ǌ�[���ͅA�7�6	��n�&���$���!�wp7D��cb�g�y�����E�2�Hȷl�qS��8M�b���Q�w���8�cT���cd��B��I�a�d��wLQ��
�x�c�bP56�sl�J�8Űj�b���j��:uT��q���t���Gu�<�T���Nu�<�T���6�sl�J�4Šjlv��R��q�a�x�0���α�*�<n�;ǖ�tL���[��1�b�)�*f��ٝcKU:�)�Ws�u��fx
`�bX5Q0�U�êɂ	���VMLd�4Šj��8�j��8�j����* ê��a�����D`�`��lv�6�*�)�ݭMD_���nm"
0N1�Uq��Gm6�{WFUL�7�h�Q3�'13����(;�}��í�7'��ǐj�b�E5��w�h��X�?�[l2m)6�[۫�^�M���� ��F�ܭ�U&
��66�[۫����6YE�F��"f�*�4^�0-�\wev�����f��M��Ψ �ê	�aƴ���`�`�1mr�vF�"fL�ܭ�Q�	��&wkgT�Q3cVU1�M��Ψ êI�a�����`�`��lr�vF�&�)�ܭ=M�	�y�&wkOS�Q3O5U1��֞� �ê)�a������`�`���M�֞� ��<�lr��4� �)'�]a�r��y�M�b�)'�]e�r��U�)'�]e�r��U�)'�]����BOIpW��$���S��U�)��*��S�r����m�9�03�S3cJjנ1%�kИ��5hLI�4��vSR��)�]�ƔԮAcJjנ1%�kИAU�<T��S6�[��LP�&
�yʦvkQ�ɂa�����D`�`��lj70��;l��i���р���ڋ��jlj��"U1�fT3kFU1��M��6� �ê)�aִ���F`�`�5mj70�3|0��w��lh�6#�x�0���nmF
0Q0̙IE̜�T�̙IE̜iS��)�4Šjll���gc;�8�y������Å7��v.�q6��p፳���o���<\x㲪�y*����lp���g�;�8�y������Å7�w.�q6��p፳���o��<\x�lp���g�;޸�*f���b機�]��'��(�Űj�`��~w?1��,機��O��
�y�gp�������0O��~bX5�b橦*f�j����hi�hi�g�7�ڭ��m1V���eŰ�*�a�lU1��&dM?M���#�[�w��)�\���`���ê��A����O*bdp?�����dE_�����q�`�3�s�a�x�0g��VM�K�a�d�0O��V���yʩ����U1|���)�U��<�b�ɏ�>	hӭ�en�{͖�P���S�R؝ɂa��E1��*�o���	�a����.���$Z�*�A���f�D��[*|Ȋa���A"TŰj�`�1�TMt�aƌ^1�� f�êQ3OEU1�T�*��|��a�4�0O�I1����<��bX5A0�S)*�U��<��bX5�b橤*f�JV��>�p�Oi~�w��n#�`�ǀj�S���ì��bX5Q0̚9)�U�ì��bX5U0̚YU̬YT�̚EU��q+��ժռ�0�w��{*|��a�$�0c��VM3f��a�4�0c�I1���Ì)��S᫪������$��{*��vpO�������=^B;���Kh�Tx	���
/��S�%��{*��vpO�o�b橦*f���n�����^B;�"Hh�CI��v� ��$���!��vp;D��n�����aR#O�IU�<lj����`S;W���9�b&����3��v��	6�sp�L����+f�M�\1lj����`S;W��*f��b�)��9��%�����.��v.u	6�sp�K����K]���\�ln��"�`s��gg8�4`�b���n��I0��Ī�*�W�LP�&
Ʊj�bX5Y0�USê��	���T�M��êQ3OEU1�M��êɂa����ҳ�`�`��lr�����-=;	�)�U��<e���g'��������y�&wk�L�)�a�T�0O��n�L	06�[:S�S���y�&wKgJ���a����ҙ�`T��SYU����?�񯯟�|���_?������~���߿|��ǧ������ܜ�3��Z���x&RT���6�[�^���0N1	a�`�&(�U�Y5I1��,���)�a�T�DVMS���������ƪ8CO�8o�zI0Q0�S6�[�^L�󖮗SS���]�6�Ҽ�p�p�7m��t�$'�ͦ2f�l*c�ͦ2f޴y��=�`�bX5E0̛6�[�gL�f�y��=�`�`�������<m��t�$U1�T�T�i|q=�6�������3��������8�2gF��*sf�8�BgJ�W�3%ΫЙ�U�L��*t��y:ө��3���yJ�y�H8��<�8�$��q���VM�g�$Űj�`��(�USY5M1���*N���*N���}&�Űj�`��l����$�,�)�-�3	�
�y��yK�K��q����`�bX5�b橨*f�����_ŏ>f��n-w�����*�Aw�(o��I0U0��6����-�p��R��]L�_�bl��b_>Ƹ;��:��1ǟя1�ƽ��w0�_��1�&�����~��?≯�_~������}�����_��ï_~���/�>}���������|�s��/���gT�s�z��r�٩�c�OpG��m�1�����?��Q���1����r� �tg��3���_���x}���[O־��z�M*�j�M*�j�M*�j�M*�j�M*�j�M*�j�M*�j�M*l
���%���%	�ˏd�P�R�5e��	��ƿSÜiC���/��pi�K0N1�/�̪"fά*��_�W�5�3��af�f����=�`�bX5M0̘6\��3�M ���Ìi����9:�9�~Y�ֺ���$��Kʂa�n�a��f�l�ad̴���ڂ�`�bX5^0Și����1�D� c�m����������_[L�T��~mA0NU�<����y�Y��R�Űj�`��\RL��ͬ�pKy>�.FC�Ja�TÜ�bX5M0̙~R��;�0gz1s�W3gz1    s��"�o��gŰj�`�3}U��	�y*L�A�'��ê	�a�
Q1�U1�TP3O�b�j�BU��	�y*N�A�D'��ê	�a��Q1��$橘êQ3OEU1�T�*��SiR�&9�0O%�VM�T��a�$�0O��VMQL{�1o_�=U�0c&�03fV3cf�pr�z���͍�}6�0�w�N��9*�U�����bX5E0�߹*�U���]&��W��E��+N1袊sxQ3�U1sxQ3k���Y�bX5U1�]�.�y�����E�r�K'܂51��I1貪����"����0A0�UêI����qdը��Fu�X5V�ˆ��1mR��9�8V�W�&�y�EŰj�`��ZV���y�UŰjT��SyR#Oe��*�T��2Oe��*�T��2Oe��:��k&�7�����t�R�R��L�%�똥����ޯ�������o~������|}������=���VҾ�د?���/�}���)�9�Z�}٩�ؗ�Z�}٩֝{hة=B��կjةBwB��@���S{D?�(rV�j�-��Ϋ=V�i{x��
����j�޹�u��C��J���3�������8�w�Q�������a�.[,��W������=��5���Qhl�� 6�
�>�'E��a��e��2
�{�������A��A�ʼ2��
�E�?��5h�Q���A��:z|�9�ܝ�6X�ܸ�ق=�ܸs���ǝ�:����q�����l����;�-�+�u���`zy)�Lq�[�)uO��3����ķ���MGk��)N)�	o���>�Y�ۥ7��x����$�m�����X��y���N;}/��v�/׼0��ʼ����;_l���Q��ېw�)�&�~��3�x	?+v�`O�p;�-��wx�|����]��$���h��eu��5Q�u�/���n_p��:�}M.겵_����˶�?��lŞ���e+��J]ƾח���}����T���eٽo�������>|�������?�������q�����_����뼏��/~��?�w�c�>����?�߫;g�I�?����?��r�Yl�x�_8��󘲹���x�i=ם�6�D]Ո,��j;�JT�K%�Z��U=�챓blj�{Z+M�����yV��k��}45IL��V@K�rS+�U����
����7����bOhD��b�j�Lj�|^|eR��Oɧ��eR����BͲ��teR��%S�2��:�_2r�i�%1>���\�`��x;�m�=���|wUp^��y�cŮW�Md8,v�����0A0�U�/HI�]� X.�x�{Z�v���
�UE�߻)��s/��.aXї$fūgFW��O���7?5�"�x��Gb���~
��	��̼8I+^-�5�%�&5@�,�)^ſ��q��V��q �V�Vj���1z{���A����;�*�\�ꯄ�y�U�XPGE䨠���QA�ޞJPuL:���-��&�V�i�Du�
�@6Q����1�:h�=q��?+��V�$?g�W�auT
s@�������;ǅy���;��������И�v.��t������F.{4e:j�[��S#||��P�=�*f��`��1f玎y��sI;7��E�0;���&tqW�v^�/�3y�6�ۜj�\��7w�,�*v�� �)�]�00K����E�K���Ta���e&�X�|E}E��c�]�00~�|����4ox?���0E3��{5�(E�1�IǹA��R�:n����G��a�j�q\���[��������U?�T���!E�¾����Q�������F�-:sla9ì�����#�p&sX�:�S{WST�cc٫+_KU��v|c�)���d�ꥫAJU��W/\R��m̩ωpg�����!E����4uD�z���1̋
_��!b�g �|�Z'Ʊ���GRS_�?�駩�:s|qǏ��6����-��4C�a�Q�������[!��s�C��蘒�?��#Z�v��c\(�:��3z��H�vN�<�ǯ�&��x;���f�vn��uuڹB���R�vٰ�N�봳�|��Uk��sS++�xQ����������v�۰O�j��V�E�v�۰/��΃�k��Θ�>q_v�ܰ��/;sn&����L��Hz�Ψ1���K���֫K��~S�>E�[�jɁi��c���W;n٧��Ր[�?�r�}颻����O���7��w}g����v��=��Ύa�ʽ䮇�G7��w=�\��_q�wN�2
���;��G��s�V~�7ݹt~�����l��w��s$�ĝ�e�0�wf��S�37����&�|��~n�.���[�nyq�Ժ�fyv@|��w���K�w�T6�O�Ys�>m��3�~�9e�g9h��3&�kn�,����U�]���RK��Ǔ5�e�U�h̘����(!�4�h`:�<O�wH�t䤝W0ig�2w�z��w����0i'{L�	�̍� i��2��{g�{g�{G��|G�������Ѹ9��y��C��C��{4f�;��;��;�h�,w4Iw4���T�h���=������8#��8��=�����8#��xA�{g�{g�{��tO���i���i���i=����Dhw4Iw4�8��h<�Q���xD�J��qH��qDj��C��G2ҵ��!��!��!��#3�tO�tO�?��-D�y�b�-���(m�g 2��ҫq��ݱ�O���X��wl�^Ï�w��H~Ŀc��+����1Yz������ҫ_���w��^_$pD��Q�LڛS�q��o���yu'��8I}䤅��$u'�78I��I�{�4O��Q��)��=e2�e�pG�i<�Q&$�Q&$�Q&$�Qf@wF_H��qH��qF�w4���=�3�=�#��{g�{g�;x��1��y�n��!��!��i��:9�y��C��C��C��'����bՅt���.s��3���"�w>��@-���z>�������>~{����W���Y���h�(v`ꉋ�%�c�ُu������_�K����������]:;�a8M�ن,Eh��֕gz�����17,F����]@����]:����]4��ö].��"�](�6�]"�֎�]�V�5�b[�$�l]N�6�qI"� �)�k����5@OI���$v�S���)	\�TU3OUU1��zJB�=%	k���x5BOI���$X�����ba	Ug�ۇ'v�6I[�?��%K9��w�x	j�Dva_���5uȖ~~�hkj6�6����H]�㩟v�?��d��/M��{�я��ǯ>?�ߙrn�q�6:_��w����������ܲ�����A�l�}�#�� u*�u���L�:F�G&Girj429�5�u���L�:�Z$��Q�DŤm���uL��y��c��;�W{>vLQL�����;�Þ9ǘv��-�xv��~o$��1/�����-�;���av�N��Aw�c�N���Obv*�v����;*�wT|� 縚;*����ᎊ��?x��b�������1掊�rz����P.n������p�����Ouu�P�y	��y	���8�ŷ�4E��{�/����p��R��BǨ!�{cǨ!��c���:P�߁�PEށqz�.=V��S9�P%���KW���`R��[��NU�sG}7Mw������]�Y��/u�W�wjc-ȉ[�sЦ���Vl��tuPS>��R�6A�=GQ��ÈL>�������f�{W�ꒁ9]�:%8Y[�����9�Z#8���<I�����z�}�Ȫ�q�'���;h�����=�1�0}v�����za���-��u���a��Q����/�g�����T���cz���NQ��$G~?Eى<���Sv
����*e'o�\�wx�S;��!��$��2ܧ�����`�E�>V�x�v��sŨ�;%��p�*��z��)*��{��I%�>W�xjϴT��b՛�e	�3��%�r���� �w�P���$Y�L��z�����eۻ��}    �y,��μiJh� ��?���������IX��ȏ_S���Q_�sB^��������+VK�?��L����Ug�|T�Ԟ�fݴs׆}6�u��K��l�M;'�}7��з97��з97���ۧ��R�]�9�zpN}�������95�8��h�9����9�|��G�֢�F3?�T�����y�a-�^4Mr�65q�65q�Θp8'��6��t�c��8�l&o�'$�-�Q�$�-p�ȷ�aL"��1�|�$�-p����}�c�����f#PPm����� L����)���fc���^�
}/�o���@�BGI`[��$���
�Vh�h+T�d��OB�
�^��6�bIi�����O�َI>�l6p5C�Ja�T��vL��,�5�1��[�d M!�xRz�p�AWJ�ڠ+�
��2���+�
���F�~b_͜D�US�Q6�VM#l�90�yvs�9�U�<e�́aը������y�F����1U1��&�)\zv^s�8���B����U`�`�;~�=�D�d�I�����V��8�jTŉUcU<�- 06��s��q�q��VM�g�DŰj�`��l@�=��M(�<X0��i}v�oc���T�0oV�1�fS3o6�1�)}�޴)�Л6|�sw��&)&#L�g�Űj�`�7m���6�W�m���6�êQ'V��8�j6*�L�{�$Űj�`���6�[0��*�)�M��f��͘��٦x�U��<�M��FU�<�T��SΪ�AO��VM�k�A��I0�S�)�U��<�bX5Q0�S>)�U�*f��b�)oU졧|S�&L�a�
N1�/�ê��a�
I1�6m�bR������W�w GY�!�(��U0swP3wGU0swT3wG�� ��bX5Q0��1)�U����bX5U0�ݱ)U�&�4{����X�Ӧ�X��8�0o&�1�fR3o&�1�f�2�Л)+�USü��bX5M0̛yR�&;�0of�VM�T��aը������y*['�\êi�a�*�bP5�	�y�xŰj�`��JTL�MP�#t����n# ےҞ5�?&e%�;�Zf>/�e��Zf>��e��j���ϫW�&���FŰj�`��kV��%�V���=�c)����m|&�b��a5S�v��-l��6�1�p��Z��%s3U�����yQ���y�T�s4Y�`ƞ�-FU�1�.jn�d8<h�������5�Ũ�� �T�S�?x�U�K���X�T�l,n�b4�IU���0Y6��+�U��� �]acq�����8H|W�X$�+l�$����~�{�i��z#�ݼc�`TŉU�*N���:{
`�b��݋[�J��Tn���f�I��Z�b��zr�$؛I�>&U!9v��b��lo�jC0N1��i5H�7o�!E���VU�Xl/�VU~�� ���j�.t�W�����5�x6\wg�O���Oc	�eFj�07����6cO͠6���!�Hu_���\EW��'~P�u̅E���|"���|"�qҘ�`�v��g�$���X��?�/	<��H��1�����Ƞt�kH���BrЎ�o�K�_kVzxk2{�^�>����uO�s ;�7�#$���7�*2������Im6o����6��[���tu�M'u�X�|�ϧ�c��6[0W�6��©dR��Fʗ���c�Ym��E����@ܟD�j36���'6#��'6��j6��j��!�����;�I�q�P�[������s-d5Irϵ�>*��/:�簦��>GT��)�͝�4����*G�	N?m�`�{������{��Y�᭵�yzQ:SAL���w�'{������=��6���=����W�z��{���FU�����c��.c�êvb3���Y��8^i�n~�/�%�چ�v�:��������>����s�� ��{�"��9I��I*hNRMw�À嘤��$�6'��))N;���܈tG�tG㐴�8�G3�8���XgyѴ%N��t�t��hjm ��c��U�K�9�sljmN�� F��;��
���α�B�9�sl�mN?0�����:�L~!�0=�X�96�6�w��<�S����e.w*q4��^%�J�����|4k�^��u�n�WC���tUj���=y���=y�:���6�w��6yw��6bw��6b�4����r�c=jɷ�cl�qw0G�ᶘh(^)�����y8��p�y8���y8���y8�1����<����_z���Vҭ�Wg��:F���/�>���c{�n� ��e�UT���ʦ�.��ʦ�.�������ڱ�{�ps�`�`ذg�g�Hcf�Hcf�Hc�d�Hc3c�Hc��s�.�x��٘����WIE�ƫ�"fO*���1�M��j�6�u6�u6�]1W6��.�Q��.�Q��.�Q��.�Q��3�#\v�˞/�$bsݕ~�j�!az�z��R� a��\�=Ǣ�����W���8��E��e���bQ�:8�됯�{�����ڒ=���=�-n�l����l���j���	��j�-��U5�3��%V�q>�����v�?�:o˾ⶫ���p�Ւ}�;]6;�;��{?��w^E�R���JM�Ǧ�Mm6&�G�`����'�;�1Q1a�`�&+f���߾|���ucu�>�	��*��*�.�)�T�$c^� �S��&�jTˑU�ZNc���%�dșY"IX�����ř�8I*���%�PŒ
g�bI�3T����XR�<7x�������Dg0V��X��U,yp�*�<�@K�[��%�-PŒ�(?Ix��D�KG���a�XW6�I��Vh�l+4�d��A2�
� �m�f�̶B3Hh[�.�m���жBOU1�TP3OIh۠�$�m�S�6�)�m���zJ��=%�m����AOIt۠�$�m�SQU�<U��S6�]���.�q��n��8	&�y�f��y���<e���<N�)���B��9g�Ȏ-�*�]�ʘy3���7�ʘy�Ʊ˹�ê��a޴q�r�'�d�0o��u9ד`�`�7m�����:�F�빞 �êQ3OU1�;�s=&)�U��<e���\O���a��A�z����I��z�S���y�f��y� �*f���b�)��qLQ��
�y�Fx�y��cl����	0N1�/�)��qL����8FU�<�T��S��.�8�`�bH5y���q�S��y*oû��<N���A����.�8�`�`���6��?��Uq��W�����:�f��IE�����8����>������+�S#gg5����a�D�0��VM�+�a�T����%��T�����bX5�b�L�*f��V���.��VM�/�a�T�0O��TM�Þ��)�U��<�bX5�b橠*N]:���;6����tk�����3���c����>pS�tZ1+b���CS��8	�<:Űj�`��cP�&
�<&Űj�`��cQ�FU�U�̚ɪ8BO%�V��T
�a�D�0O��VM�T*�a�T�0O��TMV3OeU1�T�*�K�s�a�D�0O�VM�T.�a�T�������)�`���S�FU�<UT��SŪ8CO��VM�T)�a�T�0O��TM�ÞS�)�U��<U��0�#��?�go0�bfͪ*f֬�bf�jU\�5kU��	�Y�M�A�4'f��ê	�a�lQ1��$f͖�{߿T͇��f�l�af̦F�,��MEb��X���I���"i��P$ͫc#g���kJ{���ǔ�vg�`�T$˃�-��yp�Eq*m4��FCPq�a4z�F�Gq�a6zH��[I��v�"i�nQ$̓�-��yp�E�4n�(����E�<�ݢH��[I��v��U��S^U<�9:�=�[��9��D5̌i�<���9�6��,���A�fy�*6�spmP�Y��k����\Tl���ڠb�<��9�6�U13fP�pl�éVT��v���w+Q�ͼoc>��9�n�ؘ��uC��|�*6�sp�P�1��놊��\7Tl���    ��bc>��9�n�$U1�~R��v*48M�$�� �3@U� �3@�x�S@U{���������?V�����JR'�����/�����}�����A%�%��(0�9:�z��&i��s�3Lz;�w�I���E����=#�9��̃F���L~;d�ŝU껩n������R�N!��U����U�R�b#��S~���b�J�V:���ش��şŦ��IG5`�b2�T�VMS�Ʀ�&.M�ď9A(�PT�]SU=GvM*�ĪQ'V��j`���"�ll��� ꪂq��b�tH���B��j�\�M-�^/Ʀ�� �ê	�a_Qlj�� �Q93�7�s���F�a_;��vs�bT�l�h*b6b411��-�3 �)&���Yun��j����PL&��'׳ &	�ڄr=[`�`Ќ�ڄr���M�������������������S���:�@�Z�Υo��=�g�ϗ�FAcuj�x��թ���ͫS[�Ѹ:���S[���F�k�n�i�	cC��"E��.+���o9�[�.��umD0A1�����ǹ��&�[�Ydځ	�O�����j7?H�C��%����E������=����c�����W~>����[j>�Q���O;��DtF�A�Ǟ�A]Ş�A]5�=���WP�E��MV��/Σ����|1��Os�ߊ�P6�j>6�꫔FZ��!���Mc$�����)�M�Bҿ�n_V����=�%��p#�������%�p�$�xg��W�YHb��$I��I�Ğ�Im6	��W���aҤ�aҤ�`sRc��9��٘*�w�����s�n8�H�]�x �u���̺@�Jf]�'6I����zJb�=UT��SEU�<%	t��������0_��|�ܠ�LR��,fMI�+��$�ZS�
�)	t�֔�BkJ]�5���Y����5���YS"��)�s����AOI�ܠ�$yn�S�<7�)I���$�zJ��=%�s��j�b橦*f����z 	�4Őj�M��H �)�U�S�1Nԫ�m���&Y���y=�`�`лc���z�	��Y�M��aͣ/�0��a��1NU�P56<^��VM�c�DŰj�`<�&+�USX5U1��&����!�z���������y����# êI�a����z���0O�\u=`�`��ld��?0N0�S6�\�U1�TP3O٨s=���LVLF�"Ǫ��a�4�xT��&�*O�D��8Š����z�	�Űj�`"�FUY5��ĪQ'V�F���1& ����&}��1& �ê�a��Fz��1& �<���ҏcL &�yj�ݥǘ ���y*�����U����N1�/�ê��a��I1���������򭤛o7����=尿�Jq���b(U(�߹)ݙ�f�.�a��N�Gw8�ۂj�j1�a6L�0&�հ��DɊa���a�TŰj�`�0Q'Šj��f��a��0k֨V���y������U1}ӬU1��&�6)UӜ`���W�&&LǏ��޿0JT
���vMY1�]|�\h�"fo*bf�"&�Ӥ"&�+�8	���w�ΐh!^!쒂b�%E��Q�c�bX5Y0d�蘢VM�w�4Šj�$b̎Qcv���ө�Gg��/��Q>�Z��h(*bfogE��3]V���9�UŰj�`�3���1�<��K�����vۮ���tM���«C�Ō�]�c�`�0*�ȪQ'V��8�j����9���	�`�&8Űj�`<�&(�UX5I1��,�PêQ3OU1�T�*.�S�)�U��<�b���ѷ:�u��`�b�E%�0kƬVM���vZSB���T�̚IU�ݼ�K�d&&IU��T����U�p	�*t��vS�;l�딲��Ã�)U)u�~���������HOA�h:	�8��q��l�c��S�O(iނy���N	JAzʪn��g��Ũ�Ǧ�;����~��+�����
�	���Xi���S7��۸ur��c��������*j�y��	��a^�{�w-j�<�uȼh�O�2V���IQc��D�O}��[�_���Teg���T�Uw�(om�	O}1����`�̪n9)K��[�u�S7�pjԬ���O�������Y�l�_�!�2iS7���Ġ�vnhoO돿~������~{nDo;+���Hq�	����
q:���{k!Cxj��~��Z!�SO��V�xb(i�	��&�BLo�u�^���
��u�"<uCܴ%��ڙ�Mj���&uCrg�]nR7$�nR7��M��6u�Z�$&m�k������Nb��ޘ�Ĥ���:�I{�r��66�u��66�s��66�p��6�Lt��68;U���4�y���0y���*���u�J��?T� ?@�U��9��;Ϋ�;��L�+Ӊj���9�f��z�=ɼzbY�|�Pw�G�`�٤��l ���:�i��I�����Ҟ�]6�@v��`س�f�êɂa�2����
�=�l&;0����fϲ��fϲ�zf���d�i�ӈl��l8����ƴ����יS���y�)�q��{9��.��O���vx�}�F�s�r�l�;0�8){����x?����7�Q����g$@~��ZMȏ�0�>���Bg�l(*��n�J=�6�/Fx.��;���_o(�๤����8�3�Η��.�3�By���Nu@�����t$겺��	�]�'v�A���D�^��]V��I�]�/�������Ͽ�����_��.�����/���u��/��������_?}y7߿�况���}��U�m�!_�'�v����{_�v�UE���j�j1�8�*E����Zd|��8�[���4�/��h������9�<��4�ٞI}�H�G�o��Oӫ�f��̸�ӥc�6���m�ͻ������ˮU����2�痯�}<���"�lݙy֦��b�L6L�����ǯ���_���9��ߧ(�]]�8q����ݻ�5%�'�,ĿzY��y���n���K����Rm���鉋��� ����Ň=��K.>��ޝ�xu� ��I�c�)㈙��돽w+S����aE~�����>���j����?����I��?uL/��ŝ�2�D?�4�S>C���_�O�O�'�HǄpF0~Rsxv��0��Ϋ9�ұ3z�z#�A��S�����Z�w*�8O����Ewi*��n�S�Gt��
?�jT�i��yu�蝊�cR���v�ݯN�S��?q�i����Os8{��F��N������������}��ɫҼv�U��4ۍ�ȯ�H�6�^(��4�CJPJD�Sޖ_���m����k �ͯp^� Uf��Acڨ{��i�kbmB����#]"�`f�/߱�6pHzA}�Ѝj����I9�TP��/[;��G����>����'�T�x"��A�07�?T?l7����Zct���,�G?&]��w������9��diT�E��?|���_�C$_�4}T#�W���W�7�����?�����_�v������ޞP9ߞ'����!�m�~���"�΀w�Dguv�΍�M��^���Ψ�](W5팊IMЯ��s�U�֊��PǄW���,c���9�O��'҉�>�{0��a��zP��)%�������e�>�R|�i�p6��	�}��ꒄ\��%�}���~��1il$8ET������Z�:��K�{���c����k�.��>A鏈�MR�1�:�;H ��V��)���m=��C~�ɝ�1%���}u患۸`���=�Dr��4%`��E�S����`>��Q1���~?x#>��	WޒTbUO�)�U5�����h���P�lj_�>=X�0:�ƛ�?e2u��Vu�o�-{�b��ooҿ�y_���=�_x'�W~S[���1&���r�a�M�����!� ��߻��&��_��p��}�����0p����_��q��n��j��t�.������W��xu zi	��M�ä�BS� �{b�� �{����
*H�>S~�+��e;H��    �)H��35H֞�35H֞�	4z�<H�>c~N	/y�I�{l���`��tBq������O<��&@Ϲ���9�*�|z����7�*>ַ-���6ر�����[�����g��?�3��a��I�-�;�:x�{�y��h"���W���V��%B�~�^���^=����>��>uR�CSp��J�8��b�d0�I�}�
��-�݉~
A��<��|�����-	��	�ҧ����|O"��3ѝ��$��pB(����g�%I���Ӊ��AR�xJ�j�<�l ����b�@�j����_CT��� ���Q���m2Q�¦�Q¦�Q⧣����05{��j6E�j���Z���qDu{H�6cO*~6cO��X����t�S�����9�2&�9��%�9�
IH^��C���n�8�H^�P"1x�Ɨ컬KU^�GI�]Fs�)]:���{���<Jb�=ɾ����KY�>�����:d�:ܲj��JE��ll>�l�X��Zg�[Q���M���n{|������U��UE尫J��ǯ��{<6�l1Y1�����V��
�Z��+k%��p���y��}�K�-��|!�̹�q���ٸUU�lĩ*c6�T�1*�ʘ�47hqI���ͣ���i�hD4�[1�ܸA�K>ܠ�%n��7�pI�t��:S���)n��l*b�̦"FΌ��93�@�O̙��ê	�A��6�VM�T�����j�`���M]�U��<m�:0��*f�r�b�)���MS���VM�MR������w�S6�z���AOٸ�;�)wz=esM���yʫ���l6�=���&����٤��S6��z�f��CO�D�{�)�Hz=eSGl��=������
�b橠*f��Q����=�vml��^�h�B��G�z�%4�8�í�ц�nu�6�p�c�!��[�M�<�N���y*�����_�e��Sۈo��j�ߌa��F|�U�<����&	�yj�-VM��6�[0�U1�TV3Oe�b�>��bX5A0�S9*�U��<��bX5E0�S�*�U��<U&Šj���y������U1}�*Q1ytK��ЭJR
��,��Rê��a�,M1����4����n���NJA�T�`���W�F5��]U���UE��]U���Պ���ժVMsf���iN0̙�+�U�<բbX5I0�S-+�U�*f�j�b�fUf�iR�&MN0�Si�a�� O�)*���MS�T��bؽ)�A�JSU�FU�<���y*9��=�bX5A0�S.�1�s67uD𷠓����a[�cLV�7E0��*�U���'Šj���9ܫ��ý��9ܫ�S=>�-�[L�\n�<�-D5< ��� ��9Z�}Q�"��AT��AG�#HP�"��v@���BT�����`�E�ž��Xw���rG��C�(���z����!w�hG�xG��C�(��m��;�}rO����b_��S�ː�bѳ'Z����)VŰj�`�|N�8�y2I�:&I��V�$i܌�$�����qp3b�4�"LIU�fPIU�<%i�E�$�����qpa�4�"L���]�I�8��.Iw�%I��N�$i��$��{�RV3OU1�qp�Y�4�K����bI�8�[,Iw�%��*��'q��$������qp�W�<��JUU�<UU��S���]^I�8�?+I�g%�����$yܟ�$������qpV�<��J����YI�8�?+5U1�TS3O�<������q�'L6�sp=a�y���	���\O�m70ut�;����-���n9�S��l�8%f��9�(1�4��E�yR#c�I5���'�02f�i����M�\��m���lӸ�)�-6=��l�P�E�P\H�nM%l��
�l�8WHf�9�B2;13�S3�{13�W3��0���نq�m�6�spmc�q��k��\ۘm$���lC9W%f�9�*1�`��U��Fs�J�AU�<T�i,�8�#�[M�0�������1m@G���6����f��#T������u�$�l�:zB_�a=�/۸��Зm`GO��6�����*fƌ�b�)�ѳ�����aQ��v���lc;z�P��=B(�؎���ml����lc;z�M���z�����cLVLCUq��kb\I7��K��FU��E���(۹e�$�8Űj�`�&(�U�Y5I1��,���)�a�T�0k��n=��uLQ3OU1���C &(�U�<ec���7�d�0O��nm�0U0�S6�[[f������2`�bX5�b橪*f������`�bX5Y0���~���hM����֖٠��vQM0����
�����e�����y��jll�v�/�pۭݧFU��T���MU��T����U�p��*sx�خ2k	�*�f��2O	�`��"�]e�*�U�"�]e�*�U�2����ʤ*F�*�5�"�]����AOIrנ�$�k�S���53E��=%�]����AOIrנ����yʫ���lr��4��VM�M�֞� ��<e����1�T�0O��n�i�:�&wkOc�q�aը������y�fwkOc�I�a�d�0O��n�i0U0�S6�[{�������`�bX5^0�S6�[{���y*������T>����	�G�7�(�'�b���32(�*�]S�C���n�0N0�U�ê	�	���VM�p��a*ǘ���0��ĪQ'V�U���u������ ��X5^1�� Ϫ��A*����T���{�[��o�DQ��U0̖Y�lYT�̖E�l���ʏ�� ê��a���v�Gse�ɂa���v�Gse���a���v�Gs��1�خ�h�0N1�U1�TU3OU�b=U�bX5Y0�S�(�US�<U�bУ�M�a�jN1��4/�êQ3O5U1�T�*��S�(�US3�����Ӛqbb'HS��:M�!�T''d�:yŰj�`BP�x���.))�]�*��N�`��:�����F��j�V�ê�a�tA1��(fL�êɂa�rE1��*�)����b�)�*f��V�z�Űj�`��|R�&�y�Űj�`��|S�&L�a�
N1�U1�TPO�]|��*^6 LRL9neYܭs�Xzhf7!+�]R�c�Têi��8)U�`��+�U��p�����q�E%�5��#�&q|��m�q���8��R�Q"Zg8J�I1������bX5A0��)*=]R3xʊ)�����V��SQ��U0��I5���U�̘Y5̌���4f�a�D�0c�VM3f.�a�T�0c�TM��<U�bX5�b橢*N���&�|
T�,�@T�̘�UhL	�*4�vS�
�)�]�Ɣ��BcJ`W�1%��И�UhL	�*4fU3cVU1�vzJ�=%�]�����AOI`נ�$�k�S�5�)	���vzJ�=�T��?�$y���T�̙ME���lb�6 �V�rf���ڀ`�`�3����ޡ ����lf���*��f3��w���*F�jNU�<e3��w(�Űj�`��lf����,�)�٭�:�
�y�fvk���16�[�u�S�FU�<�U��S6�[�uLR�&�y�fvk�N���a����ڮ�u����v� �ê�a����ڮ`T��SAU�<eS���&�Űj�`��lj�v�|cS��Ӧ;�1� ���&�j�bX5Q0�U�êQ�>8<F���Ke�ح��8�kR'vMV��z����ү�`�`��+�UÜiS��_'�$�0g��n��I0E0̙6�[�u���y*����ln�4�$�VM���F���<es���&��0O��ni�I0M0�S6�[m���y�����ln�4�$��VM�M�F�S�<e����&�4�0O��ni�I0N0�S6�[m���y�����lr�4�$��VM�M����<e����%�8�0O��nimI0A0�S6�[Z[���y�����lr���$��VM�T�$���S�C<�1^1������6=�$gv��"��p�6+�m��/��9��
ѕ��IfU���P�    ?C�b�Ŭ����?&���J��Gg>Q�a�Cvd��{�c��53�OuLT�&	�x�c�bX5�b⩎QOu�Uq{uX�`�{�)m�;l���4�Htא5;�)�DwZS�����-��M��0�2�%�0{Knנ�%�k�ޒ�5ho�f��*afo�f��*afo��W�$��VM��펫lL����agڸ�p��~s@�>��h8M9�lpw\��`�b�������w�P�R�1���Ã��9<���{5�^���II?�"f�DP�q��vǕC	�)Ucc��ʡ�ê�aㄍ�+�L��+�Ls���+����y*����lnw\�`�bX5^0�S6�;��I0Q0�S6�;��I0Y0�S6�;��I0U0�S6���*=g"�y~�*b�̬"f��*b�L�W%��VMs���+�Ls���<k��&�L�y�2�1N0̙6��e�cT��SEU�<5���ò��ê)�a���v�a�O�i�a���v�a�O�q�a���v�a�O�	�a���v�a�O�Q3OUU1�T�*�Oe�*�U��<�&Šj��T�a��0O��VM�Tˊaը������y�Yç27M�!ո�	y�M^1�� �)7EŰj�`��ܔê)�A�rSU�FU�<圪y�9�b�<�W�&�y�EŰj�`��\V���y�UŰj�`����T�W3OyU1�*f�:&*�U�3����\�l|褒7��yN�OP�OSl)E!��TŰ���&Šj��w��aը����J��;�����j��;X�ySêi�a���bP5�	�y*zŀ9��<�bعI�a��Y1�Uq�^ŵ��)U�̗Q%�|����\��q�a�x�0_��VM�eJ�a�d�0_��VM�ej�A�dU1�TV3Oe�b6�c�bF��j��6cզ<m�ei���a�ì��bX5E0̚�*�U�ìY&Šj��fQ3kU1�fQ3kJjW_�o�֖�t�m|�D���@�B�!ŰC��9,�����N���۷�˟��������M�[m/����W�w�wۋ7�w�������m�����}su��������}���?��������ͻ�wW��w�b9e�������r��o��O�����?~�����ū�>~��p���<����w���~�����_o���?�����v�|���/\o��]~�o������p�������ݏ�K�ͧ��������]��~��ݛ���w�8Cmo��__��/~���u�}����|�͛������Z��q���GH�������}ëw��v�/>�0#�|�\��~��ǿ��W�����w?����5�֚�n���|����������ǿ�~̿)���ٯ��w?~{yyӵ��뿻�^|w��a��f������������o/~���G�˫���/��o���������y|x�������������7w������������������۫��8�h���?��Ύ�˫�?�w��__Ϊ5�>��w�O�ҏ��wF����K���W�T]��ݟ��7WwW�o?�>+��r{���7ݐw��3�7>mB))�4���~~��t����ulci���d~>���/��nv�0����'F�����?�v���Ǐ�n{u=�^�����a|�O�Ou6>=�������+�E���y���Ϲv�	��<ϛ��8�ۛ��\�����ۗgϐ�N���tI�K�������o�?���j��a����_���~�'<��O~¿�����9������'�a���o���/o����?u�׌����S���"{��o��o<�zq��ů/����Nw��T�_��P������??�u����������98��?���4^��G0��٧z|��A��	��3�<��o�Жx�}�ݾ�w@�{	������#�?��w�c�5wF�zk����ְ?�Ts�<{��_,n�D�?���-a�K�?\]���o_��{�~;򬁭-�	�d����v7_J}nq[���b�n���U-F�+\&M�1f�Mg��쩺��SuS�p�$�aD�g�,� z���
=��I�����?b�'�×���8U�[���ow7��g�2?������N��7���`�,�Z�9����?��a�I�q\�sV���zׯ���cT}I�ꖘ^�ćR?�ob��< ov���O�����z{k�~\]���'M_�B읺)M�ץ���;��X<_ �S{��SC�/׼S�tL��§��\�őwj�t��s~���F>�N5I:5�x��H}r���z�/�R&�a��Y��7���pK�:��?n�pM}|H����:����.z����!	�}�!	�}�!鸻N���m?Q�owo^�w�<�<Is������a�������L'L�D�S	.��S	.��S	.��S	.��S����1*ov'T��F)���>����m����޼�Trpқ��JNz�S��Io�v*98���N%'�y۩��7o�����m����޼mVrpқO�b橤*f���JNz�Y��Io�6+98���f��9����5Ӷ*=@��:|$�`��t|��]�W�lKHR����7W�_�V�6898���''z����$B�U���u�3nq��` �yHuI�:���Y=�FҬ�g#iV�������Hj����m㓃S�m|rp����ONu�����Ʌ޶>98����''z�����Bo���\�m[�����hrpr���N.�����Ʌ��N.�6���uLV���yʦ�p��i�a��A,�ߨcT��SMU�<e�W�3Q�DŰj�`�������j�ccޑ��1�	�ڂW'0�	�ڜ����>��K�iڸ7���{-��>@���zl�z�����V(�D��Y_�t�C�&U���ȯ?e���̧�(p�B��&c������t���/�Cl&��X'k�~�� L���ϨaR_���!@��b���l����1,85���Us�&똰���:FM60�ģ�%=�#u��6�Ͻ뵫)|z��ЅE�+�υ.,�F��z"V_g.\R���0��­��)F�,����$Ov~�S~���G�0V��s���N��ۤ΅��%�/LԆ4_v�����׽T�0Q{���<��j�vz���O��,���Zk��z�;<�$������O<gHXE�Ղ#װ�΂5�����7��&}�+jP˅�,��F���t��Y��JϺP5V�e�YqT/��3ٙЅ�hgB
C�gB~
�#w+qa���g��Z_�2Ɗ�+�8���fa�8�q_�Y�=��1=��\�����Շ˴0J�U�3JZ%����z�H�mܠ:��K����K��%i�g)a�4��mm!-ܓF/�YU.���}�9�r!/lU�|�#�[�����ya�B����qEy1fa�2��?�~��+��@u����6h������3�.L���%�F��=��9%�S:s��O��[��̀�?�,uxl{��e���Iљ�����huWt��OE��ڼ3��u�]Ԁ�ϟm����-�@�լ��a~�=��-j;�<����a��:�͗��Ӫ��PA���Υ.���V쳯�����Z]X,[���X��Ŕ��V�K�WW�Y'.|����ֹ�Y�28�[ج|�s�6Ku�)ݶpY�_�h����?���|��й�/1��Z��_X݁-Z☢r�آ�!�	g2�Kck��X�@t�;�Y2."��������pֳd\4J�Y�q�41������n����3�j��L�C�U�$o�h]�V�j�N���{�p�7�1�0�7���C�x�.�������w�7���gU�h~@�mq�����#+s}u��X��n+��|��Օ��C����o���,t���ǿ��������O���O�����e���{�Bg+y��X��Ȭ���xh����=���=��o����^_�{���ş�4;�ëEw�]�����*X�ߟX�*>�����pO�Z�Y�?�j�/~��w������g�_+�����_���x�˫�����A���٪8�o���0�    �ۛ�w۷��-�����g�������ӯ�r�J�U�b@.����(���ԇ�~C��Vq�@�m����e��4�tL���9O�s@�o/^~��ޘN�ϝk���D��tä��޳*KO �<جH���vΪ`P_d�j Ԉ� E�1����1���|1����a���p���G��Fݯ�/�bP'�&��8��}1FU���ݯ
Š*�o����$F����ej��v���)�$p��($p��(=$p��(]"p��(]"p��(]"p��(]"p��(]"p��(�!p��(�p���T��SIU�<%�p��(-�0�h���_S\��Mٌ��f��vf�`����o��o��o��o��o�ΙbVȪaf退[SD退[SDiz��Gio���F�]���F�S���F�M���FiB���F�:���Fi/���Ƣ*f�*�b�)�h�[�ݚ���!u̦�9E:�yQZ�yQz�aӘϻ���0���P�1/��\��ю���g�$���97�������I�ẃ�����lnj675�����MM���&`CpS��!����lsv��6[�p��d��q�ĨׯS܌Mj�d(N)䘒��=\�0٨������=\�0�(����Ϳ=\�0�����Ӥ"F�L��9391rf����&.z�za�����&$z��^�ᡇ��%z��^�A����%z��]�A����%z��]�b�)�*f��)����%�z��]�ɟ���%��y��]�i_�0Oٴo`X5M0�S6��pU�d�>\Uomz�	�WLCUqbը��ƪ����d���c����ܴ	n36�c�b�AU�8vPM1�����| �ê�95W�&(�UìU�̚QU̬U�̚�]L��<�;bP5��_ì�S��q���np�l7O�tH��a�Ì9O�VM3�<�;bX5E0̘I5̌�T�̘Y5̌���4f��a��0O�VM�TΊAw~��y*WŰs��<U&Šj���y������U���*Q1��$橒ê)�a�*U1���Ą�v���:	��:ŠC�^0̘U5̌YU�̘U5̌Y���b-�a�T�0c֦TM�ÌٜbX5^0�S-(&������3LT;�$fͦ*f�l�bfͦ*f�lVőY3O�bH5yr�A�̓W�&Y3OQ1��$d�<eŴ���N`�`�a��c�`Ʀ� �*N�gU�^M��ê�q���VM���+��$�4�ɂ	���VMLd�4Šj��8�j��8�j���2&(�Us��l������SG��g8iɉ�����d尳S��N�o�AՄI0���)�U�:f�c��:f*c��`U\��CQ��
�y*4Šj�$��ê�a��A1��(橘êQ3OEU1�$wzJ��
=%�]����BOIvW��$���S��U�)��*��dwzJ��
=�T��SIU�<%��a�Ix��eY��#��+�g����%�;`���33��{��9wI�,Y߁����Y�Hv�0~m�L��6΍����K���,�_�cpQ�1��	�\�l.j6�8������EU�X��iL-:��Mk��"��G��TCQ��AQ��AU����T���6.��X>Q��������	6���v�k���ǇI��p�r�QeŰ�*�a��M��2�	�66�sll�w�؈0*cf�2fo*�S+��R6.�~Я��*N�� ���y�{��`�{_�T�#{��'�^V�V��z����5�sS���(0���:�=57��x��WM.��!�Va>��N}���b�D����]�Z-A!��F����
Vz���y�Jb��_���t��(1��d�a�b�Ƈ��g����X�$>���	�S2R�S��xqjt/N-�.�ũ:Ư��z�U���m���s���,ũM�<�+�MQ�j��94�S�W�۬��џw�/^݀n܊W7����q��}Q=2��,�Zbl��"�%��q8���@��%�%�-u	�v?dsP�����A�"L���/�mz���U�p����<Sٸ�X�"V%��"�9Ķ$���\��u`�Y*��<��>��s�:^�]�^��*T���ąAfz���Ѕ��٥�Af
�ݛ t�pb��ވǅ�а~����؁����	1�����ScW��_x�l<O��[�-�\��[i���.���ޔ�v�Ze.���V����l��X~���Ѕ��s7�8]�<w��uh^��/׼0X=a��B�B�gya��ܝNԶ�R3��1�Zi��4�t�����T5�X���FM4�8[Ej��pƹ�^V�8Z�D�K����g�v�4u�O�+����a.ՙP��ϣ漣_X�E=G:_;��6.[���}U��ʄ�}�ŀ���V�E��}m�꒐F��S{4� �E��?�J�H��so��Z$��E��Ƶ�W:<|���pPۦ|%��W�;3��.\VϿ��������e��'϶pY�o����
O���vdl�rф=�U���p�ڇ���F�J0�����5+��<�+��CK���~4�;I�g�$Yÿ�F���W�_mo/x{��/>��..>l����/y����?\�����������C۲�&�������?\\_�x���^|�q����o�������^\�������?���������.�>������n�������?���Wy��o�w���|h7�ݟ�>��?�Ss��_��od�8j�x#���b��S���.���sx��KC�+e���@ȝj�$Kޚ^
Y���◂yj�
��^	Q�T'�����3��4�� Ui��:��_-Ti�9`�W�﫴����V��9�	��t����$�*�<�|U�y�ϩ�	}_�e'�;!�^@_fT�^@��թ�3su�wv��T�h��N��F��T�lu�g��W鶉p�n�M*-6zJZl"����D�)髉���V7Ω�0à�ag*�(�LV;7E0��^�w���'�eC��b�LP��&���hTã�h�q=��L���3�p�����'��ޚy���ON�;Q�j~P��T� ȃZ ���C�q̉;�$�Q�sI�XF��.+QM������)�jvu����N����I�Z�:I#K�W'i]��(UiV��(UiK��(UiK��(UiD��(Ui9��(դ*f�L�b�)i ��(Ui9`V�B���z��j������9S@��GUZ>F�t�N-������f�.��R����R�N��R�N��Rͪb��*f�*c��2f���R����R�6��R�F�cF�f��~+��v���}���_V�?i	un�a��u�ۼ{5+�qQ;���ۢj`����۪�!�m��0M'����{�޻j~��z5�͇��㧅���RU�l���U%䇫FU���QU�|�jT���U%���FUI��QU�i�jT���U%���Fզ*f�j�b�)���bBUB8�
P���$��� 5	�ڸgN�K<����Ű���a����$R��	5	��bBmR#k�IU��ٜ�Y���ll:}����|l��*(�Ts���<\z����åw���<\z����åw���<\z����åw�W3kzU1��W3k����uJ���<\]�����u0���<\�����u0�M�<\�� �Õ��<\g�� ��U��<�{߂��y*����l����f0��7��y8����éf�&`Nj6�pK�	���O�M�<l�n6�߱���~�U��SQU�<e0��M�<lwk6�;�����f0�ӚM�<�Nk6�;�����f#��]�a��O>z��P�R�1���3���93���3g����&�VMs�, {��j�`�3g��USÜ9�0��&�Y ��A�U1�TQ3O�b�TV�bX5I0�S%+�US�<U�bX5M0�SuR��:�0OU�V���y������U1}*�Y1��"�Zêi�a�j�bP5�	�y�yŰj�`��ZT�FU�<�T��Sͪ�>���VM�T��I1���q�!���VM    �T�DŰj�`��:&+�U�*&��U1�T�X�9Cur�bP5�	�y�yŰj�`��\T�&	�y�eŰj�`��\U�FU�<�U��Sު��t��VM󔏊a�$�0O��VM󔯊9�_���J�a�4Š�
�`�5���Y3���5���Y3X�	�êɂa�E1��*f������`�5�S�a��k�:v�a,��+�T�fT3kFU1�fT3kF�b6ӡc�bX5M0̚iR�&9�0k&�VM�f��a�$�0O��V���y*��SZ�vӦ�M��&Q3cf�a6}�c�bX5^0̘�ܱ�Ì)��>�1Y0!���]��q�o����c��a����]T���EE��]T�̙ܱIêI�aΔ��MB�"�L	��쁎i�a������'�)	��쁎Q3OUU1���ν�ê)�a����q�c�`��lpw��'�)��w;&�y�wp�ݎQ3O5U1���n�Ӊm<W�bwL]bF���[ڷ�G{�=�3��]��ـ�":%��٬���1A0h�r6냻�vL�����n��M*|4D�I���(7����
QΩ��圪Q�f}pÎ��a�$�0O٬n��1E0�S6�[�tL�������٬��1^1�U1�W3O٬���1Y1��"�)���5~;�	�y�f}p�ߎq�a��Y���S���ol�wĘ�|��3n��ޢ�sST�c��rQu�F���g#TPݳ*���U�l��� \1�c�bX5A0l��� \1�c�`�e�A�Fq���ʦ���KWF�\6����(g0M1y��g���p��QAG7��:�0�v�;�ET��Ir�U�l�K����7����g�fR�wL<�0��i,J}NaY}�{˝CTK�KEVt�;�0�t�b�Oզ�p���l	�X�,���ȋ�m90�m޿�ݠ�*��϶=A��m�	�����uVa^��\����u��)ꆎ�g���1�-QQc����Y���56�9��>�LqT����v�UU���;>��Kg}U}����y5�%��VU�q#}Vaj�8�y�&��d�F'��Z�1�y��c���Gb[�u��$�3G��~a7�MM�n_�:��J�
�ʝ�����I�:f"�-�����x�C����Yn��q��9j/)k>���K�z ��O/���;��	�Y%�7�7��}.jt#짅M�����kj����X5o:�#pj�<�!�;�� �3 x��8��w�A�5���U�Zc��W�)Q�1�;�N�1����$���~���ĸ��|>#�~�Z<�&���o�y��y���k�9��o��3��9��^��	�c.:�o�yi�����vqa���s�߄�n�}X]���%�����!�������9��>�!З>��X;����c��s�e��` ���� N�N%%Fu� ���F5���G5z��Q���}T�z��� =�{	��<T/�5���%���P��p����C��R�y�^����^������?
m�{�LP;��vPI0��IU��_���*�g0���ů�W�?���������{�nq���?��"���������\�_}���*����F�_'��I�ߥ��_�AY�1�����ͻG�o��������o.��j6�g�ĳZ���[��^r��7��ƌ���Ї����3��vPE0l�lNT�HÉ�^Rh8Q�K
�{���c/y3�b싪�Y����5���YSBf8��K��{���c/2�b�%C�S��d�p����N1���)�^"b8��KD���*f���b�)��Ū�q/�Y�c�`��l�w� �)���:&	�y�&�pg��)�a��q.�Y�cT��SaR#O���:�+�U�<lw�$�`�W��X�� O��:�	y*،�,�1�b�)�*f�����H�V�C�S.��k~��DŰ�J�a�ìi�Q�AY�T�0k�nPV�M>�e�ê��\�_i��6c��g3Ǩ��ý�x`�˫Q����U���/_4��z��E=�[��U�cJ���ϩ��֫W�j9��&��~�����W�A��F���H��y���G2;��5�u"�5�u��p���I�a�d���F�p�����a�M)�ny5�l��1N1�/62�@�a���u�����z���J�s�U���Qu<0�W��ZT���QU�>O!�u�c�bP5���]�:�)�U��>O!�u�c�`���)����uLs�<�tt׽�Q3O%U1�T�*��Xd�V��T�a�D�0O�VM�T.�a�T�0O�TMQ3OU1�T�*�_5��VM�TI�a�d�0O��VM�Ti�A��I0�S�)�U�*f���b�jUL��jR�&�y�Űj�`��jS��M�a�jN1�/�êQ3O5U1�T�*��N�VS�w�hq�&�ɣ��@�B�!5� c�iRL3�_tHqr
!�'/��8Űj�`���êQ#w�I��'�0rw�T����Y�ex�s�a�x�0c��VM�K�a�d�0O��VM�k�A�xU1�W3Oy�b��B�A1��(�)�êɂa��E1��*�)���	�`���S�FU�<T�)���DcF-�Ü��Ge̼��ጩ�bX5E0̛�*�U��O41�c⤘�0N0�U�ê	�9��qêQ'V��8�j���Sb �*�U��P5�� ��wzJ��
=%�]����BOIpW����8���.��!��eメ���3���9Sr��)�]�ΔܮAgJnנ3%��3b��vm����$��ɂ��z��1E1��*���_똦T�����t���L�1<���؝T��
03��V�3f��1a�!�عI�a�d�xVMQ��
&�j�bP5UU�^U���UU�^U���6�{�w`�bX5Y0�S6�VM���Ucs������vê�a������jT��SMU�<es�����(�US�<e���!�$�܍��H5�fwê�A�J6�VM�T�����jT��SiR#O%��6w@��T�����n������y�fw3����֞I6�;b�����:cU�ds���8gU�d#�#񬭚�M�k8�Eu�F(��g#�W���f4/ƨ���U�q���&؜6.ō�(�����@�U�l��i����U�ê)�)'vB[��l����/Ǵ%��/�ش�����d����9wc���ظoZ_�-tD/��%�!@6�� ��D51���Y�@~��� �_Ġ:��m�W�Z��RD����� ?zpVo)ꈞ;f36˘cT��ZU��ZU��ZU���Jk_��t�B���8g0*����u>�	�r���>ϔ����'���ERճ;�<>l�0^1젂`�g�����j�`��b�ǁa�Ŵq��R��q��i�J��-h���ۀ�����ڹN�*�0�*Ψ?\]���o_�]��]_��=�&8b_�	e5����	e5�x��ɬ�a���acmVϰ�6�g�X���w`�ɢ��~ϴ{��0E=���#��7owO<�s�Q�!��=��ɛ�ժ�쑳�9�"�顰��wۻ���3�����'�衕ןw���8�/�JYb���<����6F�Gř'&�&oq��9���f��(I��Ep'vSX��+p$�giX�Y��C��@<uq<�T�R���1Z%�WF��:|��m�YDu�#����υ��-L2���9Ҧ~�R����׷�7���p��/��z�݉75�?q���JUq�¦5Qo����~�u��y���n*�p�������a��s�Tm�n2��G7�yRţ��<���Mf�T��>+O��~��Vo@|�L���!��;���@`nS��yÐ'U{:�����ZU���ݞ���;,~�����I�j}�������)�D����f����'K\�Z�(��Kk�(��KL�����C�����<K�[�@)�n����^U�J�*f��zJ��
=%�n���`�BOI�[��$ح�S�V�)	v+���zJr�
=T    ��SAU�<%Qm�����AOIT۠�$�m�S�6�)�^��d�zJ�W8=&K�
��d�^���U��SQU�<e�W��d�z8!%�,��	)�f�NH�6K�pBJ�Y��R��R�qB�ڷ�F?Jx����aǔÜ�T�̙IE̜�T�̙6*�pZK�Q���Z��F=�֒m�ᴖl�P��d�uz8�%�p��i-ن�Nk�6��pZK�ᦇ�ZrV3OU1��/=�֒mh�ᴖlCK��d�Vz8�%۴��i-�F�Nk�6��pZK����Z��!�����72��g>z8=&W�1�fU3oV�1�=��m�����l�Ç=:�-g��B,�Z7-�ۮh@E@��6)�p�M�I���l��=��m(��̐lc@g�dz83$7�13gS3s6�13�<��-X5U1��&�2��RM�}�T�}G�&y�̃�#�U�3��[��v*7��y�w���f�T�șeR#g�IE��Y�1|L,�=�Y����79nZ4�vHA0��.*�U�����bX5E0�ޮ*�U�Ì�U�1�耝ͱI��f��*bfo�"f��V������VMs�/�a�T�0g��TM�Ü�bX5^0̙!(�U�*f�
�b�`U�4K(�a�T�0O��TM��<�bX5^0�S1(�U�<�bX5�b橨*f��V�p��M1��4	�y*9Űj�`��RP�&*&��p�W2,�n+�'0kq�S'�ɂaOE1�ܨ��Ó��9<���ó��9<[�)�%Űj�`��sR�&+��/��]��:�7�R�P�8��b�15�0g�I1���ÜYT�1��Z.�����j�������9����Ë��9�X�i��Űj�`��KS��N�aެN1�/��ê��a*�I1��b8��ԢVMSqm�AմI0L��)�U��T܂bX5Q0�
ӒbX5�b橦*f����f(��u��Zt��[��o{��*��Q%���"��vpRD��N�����IUr;8)�Jp'ET	�[��ջ��&�M.��EE�^'12xu*bd��T���U�;8��Jr�VTI��Ԋ*�]��Ë�l���0/_گJrwĬ-zxS��į��c�h��>�̵��$}jrgS�R�켚��^M��`�&`C�W�!ث	����l��j6xz�8<m�G���6����T���M]�M��.�&tS�j�?��K���ԥ��n�Rm�G7u�6����Ԩ*f���b�)���M]�M��.�&tS�j�?��K���ԥ��n�Rm�G7u�6����T���M]�M��.5�������y�&tS�j�?��K���æ./n��6����T���M]�M��.�&tS�j�?��K���ԥ��n�R���y*����l�G7u�6����T��M]����.�FtS�j�?�I���q���Pm���y�
��&��`�?��J-�b6PUq(�;���zb)�ZT�l�)*�N���O���M��֫U������#wy�G]U��r�T��������]��+|UU��}������U�q�FgSU��z�v��%����%���&�to�jD��O�	"�����8Rm�Hw�6A�[�T� ҭB�M�V!�&�t��jD�KF�T��SmR#O�IU�ʉ���f��!ݮ���n��lx�`o^��!ݮ���n��lzH��h6=�`4����M��}4^x3�lz80u}��	��x`^|�Ӝ�x`�~B֜�|�Ϲ	Ys��>P�΅[�p�9U}<����TjNm�����G�y��4�.�������L�z�C��{�T�Р&)��M,N�M�hv�y�����n��o��O�����?~�����ū�P>~��p���<�����͛���w�x���ח����Ǐ���8��7��7��W���߸�~��>�N���������{���pdj�qdϼ{?q������/�[��7sY�����W{�;��Q���3�IP
;����3�IP�1����X��R�S�w�$?�}�M�S�w�$?�}�M�S�P*nf���f��*n�ب���;���n2�m�K�$>���M�ӱ����t����9�P�P��!�)��n���&�)��n���&�)��n���T���IE���T��ߒ��&�)l�n���V�&�)l�n���V�&�iǌx�t��Ô1��aì)�)��n���^�U�̚YU̬�U�̚���^�&�)�n���^�&�鱗z5�||�I�nV�Sب�$<���M�Sب�$<���M�ӎ���4no�Mw8��FT��ۊ���������������m�J��o6B�k�7���5�D���f�t��fCO�f~��']���Г�v�l�IW�o6���ݷ�*f�j�b�)z���=�j�͆�t��fCO��}��'\��M6��w��T�xŰj�`��:&*�U�*&��U1�T�X�~ߎ��a�4�O��&�p���q�a���'\��c�`��l�90���Emo���)�9ө��3���9ө��3��8����q)n�Z�b��Y�q�xŰ�
�a��\�c�`��m�W��"fp����;�	�Y��yp���Q3kU1��<�t�����a�$Ōo������z��^'�ys��b~�T�0o΃�@W�o�<�t���q�a�x�o�}�'0*��M�Q'V��8�j���� Sê��q���TM��Q5�)�U�X5A1��(橔êQ3O%U1�T�*��S�)U�'�0Oe�V��T�a�D�0O�VM�T.�aը������y�X��ê�a�*A1��(橒êɂa�*E1��*������b橪*f��V�z�Űj�`��jR�&�y�Űj�`��jS��M�a�jN1�U1�TS3O5��=ՒbX5Y0�S�(�US�<՚bH5n��<�&�V�򔛂bX5�b�)7�����dU����Tê��A�rSS��M�A�r�)�U��<�bX5Q0�S.)�U�*f�r�b�)gU\��\S��O�������Ոs�8�Q�=$:�=�Y�|{���<�b�ى�a�I1��,�q_�'�&7&�m���XEe�F
�2f#EP��"���HT�l����Bһ
G
I�*t��w:S»
�)�]�Δ�BgJxW��$���S�U詨*f���b�)	����wzJ»=%�]����=mlA�7�N�쐦tH�5hL��4�DwS���)�]��L�af̤f�L�afL�=�;0M1��=�;0N1�/�)�=�;0Q0�S6�{Xw`�`��lt�`��˪b橬*f��ѝ�-&�Fw��8�9�b�lt�`���ѝ�-&�Fw��8�1i}մ��|�D)aƴ���}*�w����fƬ�af̪fƴ���}*�w��8�9ا�lp�`������}*�w��8�/_]��eI݄�q�ݺ������.��vv�8��9��⚊�9����3��8��F���ySҦ�U1�p:��֑�&'ߍ5�0%lj�`獳����7ަvv�x��9�y�mj�`獷����7ަvv�x��9�y�mj�`獷����7~R#�IU�<�mj�`獷����7ަvv�x��9�y�mj�`獷����7ަvv�x��9�y�mj�|T�W3OyU1�����6�s��������o3;;o�����6�s��������oC;;o����6�s���U1�TP3O�����oC;;o����6�s��������oC;;o����6�s��������oC;;o|T3OEU1����6�s�������Noc;;]������k�;��|1'�L��9�/�mj�`�������.ަvv���"f�L*b�̤"fΔ�v�xI�`����v�xI�`����v�xI�`����v�xI�`����v�xI�`��Ϫb橢*f���v�xI�`����v�xI�`����6�xI�`����6�x��`���ܮ��`����~sD�M3����^_U�̚UU̬YU�̚6��������^os;{]���<�u�6��������^o�;{]��<�u�6��������^�T��SMU�≙�=fB3U1����<l��6��e����Ö�`�;[f���<l�	6��    e&����n�`�;�]���<�v	6���%L�bd�0�������<�v	6���%����n�`�;�]���<�v	6���%����>�`�;�T���<�S	6��O%8U1�W3O����ސ`�;{C���<�	6��7$����ސ`�;{C���<�	6��7$����ސ`�;{CBP��*�=kη�H��"f�*���w�-FE�>O���;&+�US�>O���%7�	�|����Kn�3�<������ f�yr�!���5���y*ZÇ��bX5M0�SiR�&9�0O%�����A��u'LeS����c��a�LI1��,�̤"f�L*b�̤"f��V��1;Űj�`�3sP�&
�93'Űj�`��rQ��
�y*7Šj���y������U1}D,A1��vu���2�7�1eN�JaǔÜY�bX5E0̙�*�U�ÜY'Šj�sfUGwbZ��3`h/�M�FE�^U���UU�^���\�P�bX5U0̚�)U�&�0k6�V��f�a�D�0k��V���y������U1��ZS�&N�`�N'qr�a�x� O�)(�U�<��VM�T��bX5�b�8������*�s�s�a�x���TtA1��(�)�êɂa�rE1��*��׿�?�)9���ʦ?x�1�	�Z5.ԍk�&M7��E�2��4�|0�*��Fe�X5V���Ī��a�$���PV�=\�dŰj�`<;7U1��&���	�bP5�	&�j�bX5�b橠*f���BOItW��$��OLU��	�yJ��
=%�]����BOItW��$���SQU�<U��S�5�)����DwzJ��=%�]����AOIvנ�$�k�S��5�)���TRwL��܊�����?-���Y3���5mv7��D���n`X5^0̚6�VM�����U�ìi���WRSìi���A�Uq�C�ڣG-������XTă�6�aF1iE,�a��f����X��U�êɊi�k]��7�?4�J
%lr70옚`�(a���!�%lr70�� 6JT1%���9����3mr7��d�TŰj�`��lr70��܍�?Y5^1�� �)���&	�y�&wêQ3O5U1�M��j���d���!�$�܍�2Y5^1�� �d���a�$� O%����y*��n`X5�b��T��S�&wc�LV�W�&(��/p0�O�0�ÛY'�&wc�MvPI1�մ�����-��vG������vêi�a������j�j��۫����j��۫���ml7V�d�dŰj�`�1ml70��&�)����v�e�U�ê	�a������jT��SAU�<ec�qQ`�TŰj�`��ll70����+�U�<ec��a�$Ŝ��5��K��ۦHȩծW!�`��
f`��
f��m7�Fv��$ٹ�m#;�n���l�I6�s��&������d#;�n���l�I�����U��SYU�<%�l�I����$�l�I����$�l�I����$�l�I����$�l�I����TT��SEU�<%�l�I����$�l�I�����$�l�I��u�?��_�����eq
A�$���I���ޝ$���IU5̌YU�̘U5̌i3;�n���<l�I6���&���æ�d3;�n���<l�I6���&���_]���Mh}���%+�SsfS��ʯM�Hn�Sܤ�q.�j�;O�a��<�����N}�X_G��bT!��0l��6��u'���æ�l;�n��<l��6���&���æ�l;�n��<l��6���&;U1s�S3g���æ�l#��j��c���>HQ;�*fL�yع�m`�a�N�����;�vv�d�yع�m`�a�N��afL�f���bfL�yع�m`�a�N�����;�vv�d�yع�m`�a�N�����;�v3���{�N3��vPE0̚AU̬T�̚QU��J*��8l\)��6�RT����.�2e�ê��i'NM�/�мS���q݁�y`wİc*�a��<�;bX5M0l��GvG�f�0��IE���T���IE̜����sfʊa��0O��VM�T����N0�S�+�U�<��bX5�b橬*f��V��93WŰj�`��ʤTMq�a�*^1cU�ջ��s�!��Wi��)
�9�$Űj�`�3���9����3���9�Z���ê�aάA1��(�̚êɂa��E1��*����i�b橦*f�jV�p�HnA1��(橖êɂa�jE1��*��C�)�$�29ŰjT��SeR#O�ɪN�(SR�&y�LE1��*�25Šj�$��bX5^0qz5�ES�E,�d(�	�������������j��۩����j���Y�)"�5Šj�$�o�ê�a��A1��(�o�êɂa��E1�U1�W3O�b81��V��T�a�D�0O��VM�T(�a�T�0O��TMT3OEU1��vpbF��N�(����E�;81�Hp'f	��Č"���Q$��3�wpbF��N�(IU�<�T��S���E�;81�Hp'f	��Č"���Q$��s*�w�^����Kۤ�q��,�=�Y���?�Y�m��	�	��g�v�Wo��o��w��vw������(���V��������۫ۻݻ�ś������6�wx�y8<D>��_�\]~{w�{�}���ի��0�U�!��O���&c'�������~�>\o�v������m��Ϥ�7�М�lh.�64���z��6������p���z���t=�b�@�n�y ]��<���[l80#�\S۱��u���Ql80a���|�	���b�;�ڰ��=��{��֫V��Ap:����zQ=Љ�3�9��:Ym�+�ϪU2��,��%������/��l��?���U�}�L���!�u:�_�W���\�4u��?�3y�V5L��@aꕱPK{�g�$T��.�M��.�M����CTO�;��@wՆ�t��jCL��v�!���_�g����HH�+���Xm��@/�@Ն�6����,�1$>���$�,a��Ɲ��Χ3MTm�IQ�N�?V˥��S������ՌhMjt�[����V���c��զ��1n3&_F��1�0�ׂ����-xu�ot'R�*]��WE�+_���S�"�����wۻ������W5wP��JN������Ǎs�`T���n��%�U��"^�*9��mrvT�)��ev�{��׷�7���������<s���zwyu�\�ʛݮ�w;|����/��8��=��
\Ⱦ�Y�� ���N
\8���9.<Q^�xF��p2C�)+ݩ�ڔu`�����[���ƭsb9�/�k����+�$��4��[��ƭt�j�V��F�*gv�U��>!���u0�����ƭt�j�V��F�q+�@�ڸ�a��|���paC�X���`Yb�?���P�e����#ә_uU���>dgU>1�*��@�U�v�YS7�� �{V7���e���@'����Y���_n�_|�j	���y1la	���&�1^�	U~��W��:"��H�I+�v'Q���I=�=i<ӥEmѡ�ʦ���	؍SQ�����g7NU��n�����8I6��U	d;&�W��o�]K�v�o�o���IH*{�f��9]u������՟�}��|y��~��|�H�$��S��p*`�6����|���="�,K({�}�����뻛^�]/����O�&-�	Y�Z��a5��n6���4U=Z���M�Ά֦zgCkSI���I�
gB�y���j�UX_�q�6�V?�j��Ko��<x͇�7�/)0.	a���9�m������B:�y�Z�I���a��)��H^��*�÷S/�4Šj�i��Q5�)�U�X5A1��(�ȪQGV��8�jT�i�ěa^��?G���]1$� 5DR-'t���r{5�3�bX5^0��>(�U�|�bX5Y0��(�US���|��M����d M l��a6X�0,�j�3�m#X5Q1��$f̐ê)�a�U1��&f�8)U�`���W�FU�<U��SѪ�AO�    �VM�T��a�4�0O�I1����<��bX5A0�S)*&�$l噪��%����̝_R3k&U1�fR3k&Uq:��s��d,g��EJcU���tP�	�9<{Űj�`��sT�&	�9<gŰj�`��sU�FU̬YT�̚Ū8@O�VM�T��a�$�0O��VM�T��a�4�0O�I1���*f���b橪*Nu��
�'���5��k^5����a�vTI1쨲`�7�y�ê��aޜG~G�f�0̛��a�x�0o�S�#�U�*f�l�b��fUL�[Q��
��K���?}������%���i�&ż���	Xs`�bX5A0��êI��U1������5FU�90V���cܤT�s�a�r^1�� ����C�E3��vHI1쐲`�1]Q��
�ө��1Wg�b�j�ӫ��1��0zF��VM3�O�a�d�0O��VM�o�AՄI0�S�)�U�*NcI�L̛��wV�����1�j�3XGh̐ê)�a�U1��&f�8)U�`�1�W�&�3FŰjT��SQU�<���T��a�4�0O�I1����<��bX5A0�S)*�U��<��bX5�b橤*f�JV�z*O�A�d'��ê	�a��Q1��$橜ê)�a��U1�U1�TQ3O��=U�bX5A0�S%*�U��<U�bX5E0�S�*�U��<U'Šj���y������Uq�����0/¯����\2Ϛ���W�=��0�J~����\b;4Ic`�`�Rk_�.��t�$v�i��U���[��aJ��&��ʚ@Me����fPS]����� �T�l j��T��|J�nR]�qf��~ ]�9r���Ѥ���!g�I��&�LT�&	��I��&�L�xM*�&�{'��20�b�{�T�����{u�LT�&	�y�|u�L��������>�����7qc�윍���/T�2�v`���r�;o��-��1k������������y�[\���e���H�U�l��*|6�y>�
��t^��F:�	:�50N1��T^�K�!��6�B����(�	��mVx|�^�W���1��;�n���]�M����β_�^M�ke�|Pu	��v�<��-�$�>��Ȭ�����n�q��ʥ��&��1��>Ƹ�����+�-.�6��|x��-�5vl}���{I���gr�Cr\xk�z��.l6�<��p��v����N㻬�X�y{��n��y��k�Xi��+������8c�G�<c��U��+c/�3ΝZ�=$u�a���I�?~���yRs�V�5�'�G*����m���Y]�9�S��2�-�y0�Y�ai�/����i���o���M�fVw�'̬�`�2Y���e�:�=�dU={�ɪt�,ST��Y�F�6�;�:ذ�l�`ú�����F���;�:�k�l�`��������F���;�:4y`T��SUU�<e#X{͝�`�5w6�u������^sg3؁�7�=��1�T�m��`�����qIo��_�c%Ͻ���qa�i��'��F�v�;���vk��97�lJ،��9EU�Ɵ��f�OSU�񧩪c^_%�ɯ��
:�6����VS��1������/��g��;�ߌ��׿۽��\��|����Ͼ��?]�q��ۋ���7W��.\��q���������#�ח������E��?~�?��~��>�����__~�����������=���7w�aq����i}��?���������ݛ��?������/�nv��m/.�7�o�tڧ��?||�ëca�;�����������o��O�����j{w������fg����!}w�]����ǿ��w�n~���K��;^9��_�����w��/������=2���������~7��Wf��_9������]r_^���//����Cj:l���"��%����f��o&ay�8�3���k���g�c?��D���)��Z�W��S���j���������������+���.Qz���D��7��I�Oz�=V�q�:�j�4T���z�������������p�}�������lǭx?���^Oګ? �E{�>�S���O8[���Dg{ۜ��lao��-�ms��ԑ?�iq�&�ɮ��b[�r�mk�aӱ���WS��?ڌN�9�+�iM�3���&�ީ��Wީ���ީ��˩��KZ��e/͉p沗�D8s�K"����\��gg.{�3<�\��G�<������RMQ;�*��U�=�UqB�Uqb�X'@LP�&
Ʊj�bX5Y0�USê��a�1H`��1H�_����=U��SQU�<%}zzJ��
��t��)��+�S҄W�����@OI�]���n�=%�vzJz�
�TR3O%U1�4�U�)i�;=s��
�yJ��*����U�)�;`������]�t�mƓ���*�YSZ�*����Uhͬ*f�̪bfͬ*fַ֔�)�oZSZ�����5hMi}kК��֠��~RL~U?)&�����m�zر`�bX5Q0L~���a�2�ɂa��];�L�m��Îe/��N��� �)�U�*f�j�b�)����c�$Űj�`��lO�Îe S�<e�v,{1&�晇� �)�U��<lN��������¤*F�
6�z�#`�bX5U0�S��S{��c�=� �)�U��<e󩁉�+��it�N���JT
;������ŌY�s���ܩ������ܩ���m<��a�8Űj�b�}J�RN�1}q�	��f&�y�7�C�ů�W�?����������n��nq���?���3������rs�u�������n��?�s�wf#�M�&�ڄ��a�t/w�q��{ć�81���i/J<�g�:�*&��\Ǵ'0ye9v
���]H��g|ǲ��pP��QP��QP'��QP'�+IP��K@P��K@P��K@P��K�<�����V�A�X��/�D�0O�S��y_<�ɂa���b��x S�<5O���}�^�I�b橤*f�J��TO��Laܲ��G[�ce��)*�U�fʊa��0o��VM�f����N0̛�+�U�*f�̪�TNl�X�R+TLs��U���ي�~3��bX5U0̙�)US&�0g�V�sf	�a�D�0g��V���9������U1�2�4Šj�$��ê�a��A1��(橚êɂa��E1�U1�TU3O5��=՜bX5^0�S-(�U�<ՒbX5Y0�S�(�US�<՚bH5qR#O�IU�<'���<��VM�T��bX5Y0�Sq*�a�T� Oũ)U�&� OE�êQ3O9U1�*�s:�K�a�d�0O��VM�k�A��I0�S�)�U��<�bX5�b�)�*f��V�pNG�E1��*�)���	�`���S���y*Űj�`��BR�FU�<T��S���鈡)U#���%��s:�dwpNG��Nƈ����Q���w�3�������G�Sk뽨��s7I�������y 1�򙝣*��9��%��@��}pH����ƥ��A���Q��#am>�ӄ$���U�Z��D	��T�(���%��S]��s�e��͡����O�KDI������bVI���1R�s?Ƭ��y��p|����v켱�-dW��xw����f{��3�N�|��ѝv��`����`���>`c{V��=��؞�ll/j6�5�h�X��{j,,������AXˬWVB�63t�C+�����h3C;����Њ63����]Ǟ��ڒ_�_W�Iᑐ^��l�!�qWF��/T�&��@զ����%�SL|5=n_��m@UI��T����~����=}�V���q����n�͖��n{��������Ǐ�=.�����Q����������~��ؿ����j���� ���ŻO������W�q^�l����9������XO~c��������~���Ǉ߼���cq�ǵ[����7.�?B��oǺ���/�?������j���;���'����Umw}�ݏ���w���s̊�糿�]�_oo�O?��n�-�    0=�<�������o//o�Hfk\�o/������v��O����_�n�_��7��GH��/������w7�wN��g�����|���g�]�7Wof���a�������۫��g�8hf���'3E����~y�����n�<_|ЙWg+)n?�K����~��_^z��^vwa�\����W������x����X����YaW��qr�f;�6\����6]&S�~���?��Z����[���_������?�xr����w?���_��Oݏ����������e�����f��߼�򫳓7^������y%���fF;����0�����pV�޲Ϊ��`v���]痣���m��5{y.�エ�3������Y��ۗg��z��ah{s?d���ne���w-},����/�]���Bx5�������݋o�E3��Y�����ݧ����ll���^3�~�����~���>��S���J��_�����>4��0y>v�K?�s8��8�����������98��?��[�ۓ���f�������;C��U���=a5�GdOXMo�V�E��e�plO�������m���Ѷ�8��m���Ѷ������O���$��5o���q�?���������yꔥI%=�k}��&�:���I��ƶ4���dG}�b0�;"ӤzGCd�T�h�LN����d�u�'�l�����m�qp�@��:�H�Y��y�6�88O �f�	$۬��<�d�u�'�l�����W3OyU1�m�qp�@��:�H�Y��y�6�88O �f�	$۬s�2Я��?��tH���tH�U���ɶ�V;8���S��KgN�|OT��PW%x��EPA��'����T�}��kQ�	�
�=��N�+��t
��};�]?�	Ʊj��� �S��-;�u?��_D�KZ�m��(���ݙ�����vy�v���v�m�9��B>�*�4������������~dը��H��l�K�6��F���'Sê��i�L-��K�4�j�t(kQ�R��%ۥ36Qqc�ڕ�j�7��qq�l0N1��N��.Æ	�ds�҅`�`�0�U�l�Ȫa6Ld�0&��xk�K���:�m�I,�0k�j��5E5����o)��E��J8�K�m2���&C{K�M���n�������Hr#���_Qg� /n���L��úF���R�*���0 TK՚�U�RU�3����>k`��mW�ؑ�� ����d�Gӣ�1�;3�G&3"����� �F�fjY�X�mB�x�m
�eC�Hi]�f+Я̏&g�饍�ߞ�������d~6��M/&O����� ��1ݫͷ� R� t��
2A79� 0+<1�����5� �q��� �'/8G@C��j�v(@���w�8 �n{����m�Nϼ�n<�y��
x>��jOP��OU_��CeCLZ���W�>�A��x�-F`b��g,�4�^�p/��Q{�gl<ސ�q� ��C��%{��|ߗ�u���H�TuyR�����AcN1�H{��f��u� ��� \�ʚY��)[��u��P	�jh��Zm�bh+z~���k
���3��d� �*C-�U��N[m�̂bщ�1<���ym֠��o��J��u �2���+}��vaZu�K_���&�AM�[�R�(�k����% 9�Z�x�ʴ����}{ri�DԤ�V���Al&����_�Uu���雒�B.�^�6�)�y�����=�!�ڵ<��AHT�g����d�
�`��#���?;�\Y�zqv�z{5;?�=�fza3a.o^	��ƞ��Cl���:\>
�_ΖW^����jz>��]]-'ww뛻H�]M�/϶�ywuq��������Me6����˵@ޓ��M���E�m�]$ޯ��=�E]���*[�X5Yx��}�`��U���Z��ck<0C����ރh��-���bj��x�'�\�{Ѐ�L��W���TR<d ��+^��Y��� �����lr3��ls��x������zyv9�_��_r�!D���z��|���_.�7���/~I~����k�O�/6���[N�;�C ��������v>��{�h�\���[OO�'�G�)'>�w��O��1���4��]{�����$���f�fHRYCl���1�2}H*�j�<Ͳ������Y6?�lC�?U�,�e�ǖ��d��}�I�f�A����fNJ�S4f���4E�_���6����S���H���ߠ�I�h��;C$m|��,�7@	�����,Q�@h��4$�f6x��nպK�F'�Ϡ��9Q�T�[ړrlxnD��;�����$�Nߪ�K9<|*�b���)DD��Z������f}0��!�k}=!���dh�},���0;�a:U6�g����T
�{�*���a��2U�I�[���̅8�,���$#֗���If3�c��6��;��b�-j�<���������&��{{�����+�c/���#������L����$v	��M�<"�bs-6��\Z.|L����է!;�!�HO����l�M��]麨��;�E�\�I�-��2�g�\�=+�~�O�o�q���y�&�|煀N ["�Q�0�f:-��:�S9x�i:��Q@{���Q>�S��� ����L}~M�0� �=�n[��}7_��9Q����g�k#]�}��ˡ��v���I��e�&o��J=ʶ�`�A}��P�ۅ�B�n�l)`�vϖ���Rx��ng$`�vO�H��e��ŴV	����|�y6�̈́�i&T
�-9Il�����)R�[�
+D��0�� �J~_O"���B�X�Znk�#aC_�5����/�s��\)�Yw�q��e�E`�%aC�C�%�Kȗ�=�j�Rm�r�S�*���STi�4�g���B��	Uak�<Fo,暟aG>|�����8����J����ɡ�9�Aۻs�?줽�ǆ����H�S$.�fP/6k&R�G��y��
p�9]�'����"(ZY��.��Hiyh�H�b�3��O��:
+K�U;
9��u�m~���1���G��e��qC�)q2s\pI�'B�qAӽBG�M!�!J�7x�4�4���!��ֳ�wy�1ޗ6��I�f�!3P��~��lY���d���9�|�F��9�<�����ۜ�O¼���0O�!�@�VY��eA��:�]5씍�Ǧ[eՓ��ֶ��Q�􉻹�Od��Os�{N�}���ǋ����?Ł�4֍@r�)�YZ�[B��pP;��2�����6�ԣ8-�Ѻ,�6��mſ����mVOǁI[ճ��b��6�m������j�����������'z�#�����c�����.�P�'�����a�a��<:��9Rp���e��Ɲv�q�ֵ��@�ƈ�	i#@3��`�F�Z������P�Q�w��pԤB!�p���U���@��_� ��6Ɵ������L�g����o����� ��w��n�.�y�6_��Y[�7[@o������
z��&�qt���_��:�i�Dڣ�pm����fr1��w�gK�y����tYE3/�	�f�������+>��9�y�g����y�8���H�3G�/2L#9�d<)s1t��y��J�
��s�P�MP���:����,R�~e\r|�PZ���Ձ�	q��y���]�|�a�i:� ��
�uF�Y�G`��~	�Ey����9ė�ܩ �
��!|� p{i�`��1�C��zHM�(��J�ŽH�qp8��{'�����ѫ����^�F���^�Ư"`dx�'�Pp����Pp0��?�)<C~�N��R#@�a���ߡ�f��!��M�����0��w�F��g��K�b��\��;]Mo���k��O������mzq������V���N�Y-�!��̮�^.f���%��j�O��|zw�{�����dh���gsi����}��i{^�_A���~<YN��ԛ]��p>3 ��
�� ��]�G�j��L�]�Z����_�    ��  � lo����e���������_���Ň���y��Ww?�\���麘�淽ɥ݌ߛ�L�����w�t��Lc� ������ ���u��.�o�ҡ�t�ZJ��''vG�]�����oUrtG��AuWTB1�c����	����BX[����X<���5q���-B�!�!���K�q�O��!(��k��U
����ؼdDy"T�E[%��.�`�!�>�չ-	��!��B�<6û��p��Բ�0��Oc�¼o��vƅ|i6ɺ��Ƹ���uƅLhp9.�<�Qps�oB+�#n��ý������G?`<�;�N��m8>���ƃ7���pp:�:��#c��;��d����{����=SF��Gs��wc]�ά��w4ﰹ��ls�����g��)/n�^���~{���ؖ�����Z��`�}=�P�����o�Õ7���o���L�z"�2J���g����WfJǿ��;�f~�ME
&	�j��[��v5}g��	���2,�v��/��p��e�����߼ۛ_x�dw�3^���>�1�1���'������7�t��~���k���eo]��ww����Y���'o�߿y}`�dtxp�j4�t�78<���=\M6׏V�������[���������vv�\�Η���x�_�����l���p5�fO�vW���^�F�{�;�~s��vz�;���e�r���v�}f��.�ݽ6"a��?�D���ݯ6�����%����L��=率���\�����\[�r�d�T D����P9ʆ��
�3��s�.���l�y� pW��0}��>Ѳo~������
	��v
�s8Ln�em#<sa�oi�K`Xk���ԭ]�6+��qJ�%��D�!���y�Ha��τ���Q�~�Vt�ש�-�%D�q�Cw��=m�-ϒ,��$����Ճg�m7���4+?*]����{F���_���aj���p�(�	τ/ܡ�Ĩǆ�g���?��|ww�?=A����x���Qח�SrwŌ^0�_��]vt�b:��ג
u	zV�I���m�VT���z�jD���-�pW5��~VO}��R�7�Fԧ3@�� ��i�E�qcKt
��8�;:���"Z��}ӆ2��-��Iu��wG���=����p�dY�����=D��5���Y�I�*��j�ZY�J�VdJ�ZW�>#��@6+`Bu��K��U��K�]Ve!�ICR��d{���d<Di%�nn��_�
�.��J��cV����4��@�xD��"$�/����|Q"�RBFz�l�ڎ.*��^�<�H�����#�8hFr#�)m*��.�q�)>]�H��H�a���A_0DIC���6����>�U�׉����:N�.��t�y���. �_~�y"���4�\HD�!zxڔ��bt����� � ݏ@۠S4�d�W��Y":�U�oID��j�.x+yU� !(=��P�KDy�5�x�9@/NERQU�JѤ��q�i�<��"8QHD' �� �-�BtTMDg]�!��<F�S��-:{�I .��J��*�C\�z�)�\�C��C��S�%�hbKd ݺ,шEL�n���$�FP0�-J�&d�����M�U�MD�]�F	v`(���;]�pV�*��<�K�F6�(47yO�"��UO>���>y&��J<f�qu��n§��ý������A�x|��7�ӓr�g���d1�_�B�ꅐY�B 
H()vl��P@��\#MH( ��$�q���P@M�.�+%ڂƽ�ʊ�N��S�ioQ��V��~�P���[�ٶ�����TӋ��S<� ��o\:p�;�{;�$7���&�1���A�d":� ���C��i\2Ek��їr��i�(�ux�U�cz�r�o�4�4f�h�<�D���]�t�6y:k�<�=��
ݓ�yz������GO�^o��i�F<���Ďߡg���{�AO̡&g��+%�r�����+�
s6��6��x�%y�㹪r�)����7D�}��>Pt�"x[�Aڡ��R��u��R��}t�b��â�K�c/�<Wa��4�IA^�m~��C��g��9���B;�W�Ox��m�!_�Zg":d7w�&�4�B[rͱ�!s��22��'Z�VyRȚ�R�Y�>!�<������c#=���C�����>��mf���OC���Ǣ�e1:ډ��H	:�����o�����;�^��/�Vg����c-�c�-' ��Su&!��]����fIN'�UP5��2vL.�����׽�����Ę���gIO.�Qt;8_�>Y�k�Qc.L6�kUgpn�����5�Vʕ0��CA��n��dA�S
&P|�!�z�v�`���y]^J;DYK��� ���x�5�B���55�
��Z��ǇR���hsM ���l6?:���B�D\�0�.h�0"��#}�]c�\�A�ϧ�����dz>_\TJ�6n�vp�e��[�6��^�ݎG����ks)��2�0�Z��=��ۿL��t<�;�;Yo15�9����s���j.��� ���:����6�|�\�&������x��|5�~6�6=W�����l��n>���:k�`s�`p����=n�����#j(u{�z���6�XmNq���F;�섡i�3�T!M��A`�
im2H3IƏ6�j��E�Ub6#�,����fȀ��#@mנY����qW���ePD1���9"���+��AD�H?Rx7�Eڑ�o�;��a�- A��u�]x�NPh�Z��q`X�������ޗ�[�ܟ�L�W��rx箚��7;�/��.B�����4����&����1���r6�gu�\�ӿ� _�6k3�=������ܽ��{r��&t����¶@�n������lR�w��s�je��1�����Ğ�6����8�fܜ	����{��^�Yػ7��)�aFZ_~�f�j��+M������立�������|~}1�}�r]T�Nf$�רv���K4���G*a�7_]/0�˻�G��.��|��d{ɫqw�t�
{�����W��br���!wǛ�:���$*�GE�iI3!:��#}�*�'���x�*�#��a���^Mf�o/
��ݥ��7l_]p��	���Ոv7��+���x,�I�3x�g����_t���FG۶@N�p��X�E4�Iq�u͗Z�� ��צN�BmT���(ԍYۻY�s�f1=�ݺ}o�������&��uM��#�b3�8��kJ��zw���b:=��w��.�p�Ş��Y����b��4�[�Doso�lylTt/��tܡJ���R����
����6�D�+���u�lw�:VF�MXX{'���pà/�P�at<_��F��Zm��KUm�ĩ>���,�<���J��u2O^-�,�<�De_d�":%DSf�����F	3�����?���q���6F������ۻ��~uav���wfC��6F����1Z�٣��["$��9|���rz5��³�慾�� !��%�}*�$��_3"x�Ab������"RR�^�.B���A[�rje߃��bj��?E�����]������D�K����7/�z�Wo�_oP|+�N����h���_Ί��K`^����wl�(\�bز'J�{�m�:6�� �>/����~�;��,t�U�^���7.A�N�.>����U�����'sL[��
�d��R��ZBm�!V��*���6Ci�uS��ZBe��A�pg\��\��2�d bI��}<����1>j3l��&�J���XHf�PץIT�1����SF�$c���uk�`�yK��>�������|.g�	#7o'��u������ӡ1OR#���e<�2³֍x�Q��>�N<;�\�-��gTX
�P ��j��;�6'n�qz�Kߓ��n'Fa��w��ߥ�N�1�ӎ��`����ڹ�R����qZ��P�q�����t�7��1�_�N���j�C�ʌ3�@�㊪��a�pg�?yIվY�    �yk�6��Z��F�_?R���K�
7���$c�h�T�Y�aB�5�<kpK4�L���#�z|i	M/���O�p+;?����3m�>?�EU����j�u+�J��9T�3�}�a�>�K�J�֍ڎ�K� �����)I/y}ҋ1<�z!�ŭ������{���9vJ�@^��mv+[�1c���Or����>���$(���㎙��1vqoI�Y]|R��vV��nM���u��+��s�!1�W�R+�U�����j���î��ܱ��1�
��b�����c�E�h��1�*�;D�&��G|+C�Tķ*��Յ���\�W�U��}�5d^!0+i9W�"lZC�5ECε�"��2�M�@L�АyA3�d|ȹ1�FG�U8눇��i�����8��;;�"��k��4ƍX6�+?�9���ks�c�q�Ḇ3��*Ďh?bY�j���*�G���4u��w¯<A"<>v8�V��#���.zl��;��oW��˳�,�]]�m���hu��߆����g��[���.�>m�9�O�^n�<&����4U�W�D�#�ƫ��KV7Pޮ�v6|����%��(�W��9�C�'���hʜ��!>��x�W�D�i_��]��h_���q3�nH뒥����5�Gg_��~"P`¼_�D�S�;lI�dۮx?�w���p��/t���� nQ���`�,��lr���>r9� �|Nf�P���_�y!��f3(3����hg_C|����J�"���҆�O>x�fW'>�Z:�  5D��u�+kpY��Z������v�b�E��1��!�hbb�9�E#�=�](�,.��cP$�0�2ui8I��4�H�P$��3�K�!��d�+�<�_��%*�������yЦ1]tJ��)��� E"]At��-Ƞk�.�Z�$Bt�֒ؠ���A�=�&�C��x�:�U�+�7wȫF�c�#1�WC�&yՠc�N:�U�ƣHȫL�5&����rLtȫ6!m�%�22����y{�~��I~��b�[e�]����1LuхjQS�Y�F���Fأ�Nˬ �+H�zF��2Q�&�-r�H���v�ح��Qi�F�u����HM�q5���W�?U�@�a��|kH7̝ആ�tc`Z'�LEtCk�TÐ��K�(C�U0oQ1��Pk����M�mQ1��r�����waQ��`"*松TDŢ˗�;'Gk�����DT\_Q���Xk���eu@GT,�p����LDŮZmk���m$\{���skƵ�!YD�yM�j���s��5LD�yf YD��N����Xu��$��Xuz���uM��j���L����Xw��IQ��B�$�b݅��b�uPL�TlO^�/1�T�I�N �Z���[{�=�bNjj�T�@*�]4QB s���!R1�k�Y	C!���FT�:��FT�:��FT�:фFT�l��0��v��0wQ���X�J��a"*�Q��a"*�m�l[Q�;kQq�EP���UMQ�j���ux��&�b�i6���0w��YDź�^LXDźk2H�"�"(8�bA�0�Tl�[u��b�^����E'y�4�k?O:�úpx襴0�������YFB���ɻl�����uu��0�'����.�5L���0�y*tZmC?[�@*��4Q������T�N���@*v�P{HŔv�p��}��0R���=�b*�h�R1ͻ�
HHŴ�Q���Xua	��e6��5��"9�5�b&�P��Tl`:.HH�ց�~69�b{&�~mrH������!���&�C*�Ǉ^
R1��SyD�y�&��Xup��<�b�E��#*�t
�GT�����mXX{���������w�ƣb�˔U����Y����oc &�����U�xR��6#���i�J|?��%$��D���ה7i��C\k= �W`�WC\������嵝���.P�1.���6�1.�<[ӫ�Pc\�oFR	\�o�bT�&�ŭ	(m������;��e8��u���7����4��f������7�[���ŭ)�7�7�!h�B��ip#~���"~��f��l�|!����oS\����%�@~����@~3�"�	�n����v�`��B~+����B~�
9I �YW�w�M����U1.I�+�DC\��4+�E�cJb\��n��7��6�MnϦ�7S[-�U����Ck����_G��X��%�Io3r�A�b��K��JpӍCJy	.���⪸ML��L�#�aO����.'g�/zv3_�����cC�a��/f�l��Nآ�v�M���͜Ho����EZ%�ݸ6*��X_�A��'���\p�Vr.��W�3S(���XFA�
E\\���B����+qp���B<��2l�␧m\���{9�n V* q,�`(�Nk�^/.3 7���P������N�~{I*	����Neg����B�̡��c���2n�T��4hp8���|�f�\��!_�̵�����>����Z���<�oӋ�����O���,�v�oV��Ŀ��`vm�Ҷ��\
�9�gǓ�j��]������k�:^E˳��5���]_}N˰K�.��q�����綥����"�n�w�̮�#|5_y=��',{�e��ݯ�r��C �?r �[����v�pm
�������ײFf���O6����r1��o{�K[�ĵ;��M��������L(�0p �6����F�1,�����p��BD[|���[�h���
w��~*��Pm�������U��>��G�
6a,M�������&�IC�$���P�3�ҧ�8XۨD�@B^Y\�<m���E"b�p1�lM�wG`�7'mF�V��
`)E�1�ᰊ�[���%��<�5���T1�ڳC�:EP� ]�I���F<�M��	6�<�i<�q�Cd*��t^y�w��(�W����;�
���+�e��!l�yķ:�`��_�gq7*L�4.B�l�>����ή�j��g��
n�����
n��0Up봹��)�v���jS��ڊ��m�S�I��X��.�E���
����g�Z����B5��>�e�h�7;~CU���ҵ�6�K�VP��a�sԾ��O���+ӝ�6�"�?�Ʈǋ����Iu���u���v��/��m���xMn�o��W�R�u��x��Xx��Z;g��R��F|�u�S�	�)G�oJ�9�#�Ej��D &�x�Y�#��U�Y�e�	�Y_�U͜��tE]i�:��T�*�� JGf�
|��.M;[����И����؍57�}sB6�D��l6C@MQĖ��Bמ�vy�pk%�`	��7�;�IZ��
�d�.�,��#��&�|������l�������b~fv�w��[3����1CV���y�%����1D�I��1D�BC�1$�����%��H�dG� ���dT���0����Y�G-m��|B;�Q� �~��K�J��=�\�O���Չpq�ڀ�3�vȰ�jx�;��^/<����8016�<��fnO���W��n>^����|9��9O��[k ��<��^5�oG�o��o��槆��f��PY�Կ彯������$�]q�S5̿��Ek=,�uSe����<�]3��>�c�x��+�ƾ��	1ĳ��?��sdJ���Ba��ѷ�0��%���}f��*�[���m/�}Z�n��LQXA�cd�2̔&E�D�T�1h�ɠ�j6	#������ zn�c��nm��������j'���9%'��<{-P�`��������t���h���L����;�����k={���d��,�_[��p������O�^�����CuL,J�����tED��f��D��cs��.�"&Y�}��T�e�Ry]��vA\/Պx�a�cpˠ%��Igs��� 3��;gQQ����GC�=� WҰL�Q>QqL@ó|^w���J �&�� *��6|���@IC �  ��0�7Q��M�<�o�x�Dv~���	�T����|+�X��C�Ne����"������!q����7���hQ�Z���wˣ�C�u�ga��]i���
E&�nP�����.�LX���ֳ��v�\F�S5]�hM��
�0OzӒ_;L�6�P�Qȓ�	�k��ȨS�;ӣ���b�Y�)]���K��0S����,̐�q�V>/�����V��њj��Q��=�I�[B.��Sz�U&#ƕeØ�Wb�c2b�2l,��5H;�|ĸ(
EuZ`�w=��i��"-�$%�T�����|�vɀ�3�� ��<��I��� Ȳ�y V�y0ŏ�hs�u���h���1>~�%��:�)N:��m��1�LF[�B�������:���<ߍW�񱚆ue��s%�5��r�f.�4�6]pGOy���@�C����e>9��C�ɭ��O��������jʜ�;�ɡA�lsk4th0�P�CC��&��C�����ɡ�b[�&"��.,t�%�T]��Lga9��yV�¡�*�Q�Л��dc;"�R��+��Ȥ�>�Y���O1��p|:8:~�;>98<p���w��f���������M�	�MFc>d�/��������pt����`8������`0���z�fotr2<��<�z���Ó���mFysr���h4�W'o���W���a�o�|��l�N>7���N��̸����μwzb&�7:�y}:���O��78�v��{oN������?�����d_�G���z_̴��aop<��o���0�㽓�ӑ���7�r|:<=1ϙi�zs�?2�{=8}^ �[G���f �F���ˌxzb��o���?�F斝1�r8�����3�A;����,�`o��g���ȡN�G�ꗃ��A������X�U�'�?/�|�rtཏ]�ý�#3�C7O���ͫ_������~�xtғ����f���G��������裓bi�o�W���A�W��ݾ6�1t����td'~h����350c�����/^a�[O���7G���������?�3O�����{�?��D̋^��x2���rxjn_b��|<��=3�ѡY��o5�z/��of���������G�'×�KȆ~ߌ�������'��Ƭ�W��̇0D6��1pf�64�7:8ݑՆ�~��NF�G�
:74x����_e�{�~-����OV�Ŗ��h�7��#]�X�i��CpD�F����3��B�8a�ݒ�R�IU�J�Qu�*D����R�<��G ���M�=V O>�M�X��
l,���n.]=_^����p����ܥQ�@�Zd�O,/�Q~�8�ar0����५�b�V��i��Nb������~��f@�Y�5{�@M��e�B���Hߌg�l�N�%aE��%�<W��m;W�s��Ī�O�4ѐ߸;)�b�J�C���h|
�n[���Q=YXT1,ȉTT�dpR-a*�JH�b���(���$apm�{�p?#�~�d�ʉ #���zB��(}=!S	����)~i��v�1k�^�"��Cmi�6�GQ� <i�R/�S	�Yu�d�j�%(�Z����mʤh��5D��1�D�,��H���r����������4��u�O'�!l�Z�,�!URyC���8��2�G���u<����D�z뤕U��Ob��T~�jð��P�K`�L���Ϯ(ơ6�j����t��9����6la��[O2 p�콜̮>\]����}oi+��z�Ӟ�9Y���{��/����ݠ�l�@ۥ�s�0�9��0��=�
L�����#��������5r��6D)14��L&�`��5�U8��x	�)\d%��g��(\8J�rg;�\qAK�VV��<qey&�ʊ�Qt��J�����ye�r�������D[ویr��+���ˈ��9yzr���hf��4����(q�i"*d:J]+3���G�=����re/��򒂢�9ϝ�T��y	j�"�DU%�	RG��̫�Ϗ�U=w@��4����6������BT���:WQ��N1~�C��	W�|D%N�#?ToMK&ܘ��<�����x1&֖�G�mFa%jnӕP��(���
򚅖�\An��@cG�����\珕�A����
��4�c���s�c&��F�yM�?Zb^M���ļ�'��'��OL̓_�)1��&�鏔��œI��*ڐ��@��ц\$[%��hcv��P�smв�GSy��X'�#�@�h���b%h�h~<��e�ITsJ�T�H�Wy��g�~�������(�����D�)N��H!�_�����V
P�gnO&���!@F�:z]����b׆0M1��}6Д�@+ �r�T�Y\����~h]S}�]#�����,��4��0�=Ϯ�ZIeVL���I!�z�UQ��� }N�D� ��(�E�*f�!�~@�x8��rw�<ȃ@�1�TK��Հ�b�Me|D�T�Ezِ_l2vM|\�DI0l��J��� ���p^��b����#[��a1����N>vA8���D��`�"�(�zc,����� ��
�bx3i4xᕭ���[Ѭ�@���JD�'K!��F���0�.�@5~kƁ|`�b³���⊆lUD^4�k3mY2NӘ�6��%�4�$_S�0��0���%0�I�e%00\a�X�QF۶�f�t�]@t�H����(38�R��20��(�z�<F�QDq��ڢ�E@�O:�[�!6;�v�h��1����ڃ��Fȵ_L�A��cy�/&'p�<oܾ'�M;��>��8-|n�鵱��y�|����v׷�Sc�q^�|�n?1��>��&k�u��� ԰1��~խ3І��n�h����D���́���[�2y��cD�� �c9E���s ������r�4O	G��������J�P�)��A�����D!�f���B���A~BP�g(�W�X��`%(��(���R�U�A
a�el�3H/e�@���9)*��.k����1���|b.��W�x!����P�p*_��5��m���U�j�ۂs��^�^c8���Z@h��T�����Y��7'T�/��*�j�
yQ���5�N[3�:g���$C3�r
�k������0y��9CȺ�ʩ
��.�T����/~�����      i   �   x�m�A
1E��a��=\��Ў�̴����mu��˟�xD��ja<�$pgd��w���)�M�u�RG�<��;x	�[�[�6^��DQV�U���Z�ǹ���̐�~G	q��b���O�=�G�      k   g  x����nIE�+_�<��:���^L� ��2 �Q����&�v�����1N��8dM�d��ڭ����]��f�NK���������SP��P,�k	�TNҐ��y�(N7��x+�6��f�/��j��ª����ObXJ�4����B�1ė��f��`^r��E�T +yS�E`2��5D�3%���c����i�\����x2�l���@�FR�T��xw*,���� �^b)^���,���ä�E�:~Zgl���2�P�mqX��ڑ����#у)R�H~)�@vC"	����:�J��}H����V�s��J֔0�NX���ʡ��̮����{�ű+$�J��5���>�=kB�7�U�1SI`I{+c�ڄ����C�!ƨJ���z�Z4^n1�WO���|��m�-�q{�d���|{�۷�燼�m��9�h�e���vf���G�f��1x��M�H!��|mb�![�Rg?gIu2HnĿγ_s�!ʖ���p4o=���E�P|��+!%o�b2��8_����e�x9l�����a�l�Z��0�m/�����Wg��ë?D����z\>~8��� ; 0-�椣eִZ+͙�?�X����?�g����/�U�J/"�C�wa�"�qzu2}�8���ф���[<]#n�
�Z-=h���^?\���S(ըH� (���PL����UJ*J��W���'��2��
n��c�s�rs(o�axq� ����9;��c�jF_C�y�@�tY� uҊ8_ )d���T�V��6��wk�����ͦ<�1��G@꧰���-̮��HY�Nqk;.u�S�2�h�)Y:k�뭤�7�)�xY�e�k	ܖ網����� �7ė�������      x      x�t�͒�F�-��|�����~��⏊�EU����١��"8��2�����Y|���^��ʹ��F�z��s<܁,�Z��J�@D ���g�,��u�^�]�������e8��������w߷���^M^�]~�����
%d��!��/����㿆U(��g7��m��*��Z�g7����~l�w�����ح*R.��k<�}�?�2�C�7�8Vus���^ס�A���}�j�Fh�2�v?۝_�C۳&fgWh�c/���{R�׉�X������n����P~h����_����,CȲ&_���a�M����#�V�����z��P˵QKy�Qo�ͧn3���Z�N�g������O��^�z5�����q��9�g���uw�ث�^1ν^N�;��Rr��dy.����Ƕ�Q6F
������n{����
L ����W<{L�ʌ1���an�r]	a�����g�O�F䷝�K�4u�ԉ"�0;{�[L��bw�=�����0bS	��Ady�A�j�|_�6�m7�u0R!�{�9�</��QE?�uaݢ���m8��|Ni*�}������w�7҇O�)5�\:}��������L�V�<@��Y��g������'��:���f�X�e�����=��\�7��P��>�Ϛ�ZK���^������o��T�FW�;� �\��F��$�Vx��a�������Ÿ���;�mY&�꡽�G�뵵�k������z2!�7�kYK9�2�~���L��� mڝ�G/�2�H#�B�l�y�c���L���l0�|�(�e6���)����o�!�q8.�:�f#�F�MƼ��VyU�aÔ=�֞�j����7F�Ht���Wy]���b-C|�N������h�ф���6r^�Go�����p(�22'i&3|Ս��N9M��ܳ[i��v�2�-���9�����kܡ��k��Yk+[�~h�'�> ���Ed�º62�r�/q8<��pS���(ly��c�ij�=�_��d-��w�����F%��i���G���'���O8���2or��0=ad����l��J)G:X�vT{������C)e�g'�d����A��/x�i'e4���O�y~�ӫA�}�E/��!��'�^�����3���NXS
"0��l��nj�(F�F�X����!�k�]&��p��zR2�ȝ��������凛o�i�����n�����
�+W���ڱ=/ۇn��Bc6��I.�`��=N�|��}{G�=V$��Џ2C�����2������ƞ?�7V`��D��5�7�Q��"��? 4F�2{!<�����R*�o��+�m�U#[͸�݆[�������M����[陎@�G���b����W�(�u �FW�4�N�D(�g5�+��vC២n�4���$�ٳD���݌v��V�xW-�Mi��7���=>��f�*M�.w���%A.�Kvĝ$���X�Y�C��jCv�\*��DSk�\B�=��O�0��]�aX���~�A�L�#刱a@�06��:4�\���~joew�Pע^�l�������';�j
�����D��� �^n���O>3��NC6R�{�U��,��]��� R 7`VTgP7d��ox!��E�IHT?�G�M�`"�ɛ��Bvv�o??�*/(sk���K��$��56/�qU�З��Wre׺͏4l�������AXy&�x������/E� ��<�x��g�""�08�3�3�ZR���%=�͡���k,D'��$��A��5ΨpAQF2{VQȷ�����U���
�RE��0���v��I���e˫Z��� ��bFy����ϾwUN�3����B6��ӈ���[En�i�U���
m���e��?���H�ȾP,e�7]�s��g�4ٛj�\�7�ݨ���q��㱓,������D�{S��:�0�~gK�A碂�y�®���Pɮ�x�2;aek�˛�H��)\T���7�p����PT̻���HK��_�6�� �,��)��QΗ4��5�?{�R���̚��K�	�B	F)��m�b���_���p��k�;I�{�T2��Àu(����/Ƚu����@m�*��T\��Z���Y�em�dm?aQ
�L���+���L�O��W2���D����e"ʖ #䱓���vga��C��{��~ӳ�-����>o���Q.*�W���t�E�2�� �;��6m_!��d���/�x�� T�;\ �5_i��7���V���Z��(J"�Isf͸޷��B��㪹۷���YGm=�~+�җ�0P@�y7���_S:	�x�����V7�71ּ�z�vǊ�.��bU@���%3n�tQ�*��RtRL�����(D2Q�ܮr����5�V�ٮv�=D���(�j��/-��d��J�� �%ⅽ�XW������t��X��FX��P8AQ??$J̭֒��[�t�'���R���ٍ�w81�&Ϝ(_�̖���5wjS��Qs��/�>>�X��j��������(�ƒ?�������n�r� ��[�Tv3�U��~�׉�ӫ���G1_ת��.~�D�%ōO/Lt�t{'�*�ۉ+D�U!�~��q~9N_A�U��l��v8+'
���PAj�Ifp��k������rh�[Z���fE�n�d��L��$s�'�.����fS*d��C����æ�6ؐ�𠆞�����z�7���.�Ӄ�?s�4��R��z-G\�:wb�.G��y��{�?�(L��ȇ*�U��k(`[*��Q�}L�~��\�;��D-:ϙ,������;e?AAK�<�e2N['+�tC��|˧%���2YIk���X�{h��͕W���`�r+��W�TS5ev��ǖ�^(�S��J��Z�H���g���b�3���.c���a��k�i�ʙ���dM_�(��v������a��a7�7����[�Ykz���m�Ok�3���o��Ȫb���jM5�b��]��ڈ��>��7��j����]k����=�ª�W�����O�E>1F+���J\n�͡�*�,��4v	���4	9������}V�ٝ'iI��+L�Ϧ�����8m�K>k46��D+a�����>º��b�-4c�x��p�C.B�Zl�4QHphd��	��%��uy�Y�֋hC���ä�?�;Y����K��/��g�tO��6��襜-�t��7ho�����	4�~�\�d��_Uk}򆪴N�_��>�PY�Z��k���V�5C̠YZ��q:pXu�l�7���Sg�1����鮄5*Q R��e�`o�6���-u Xm#��,7������Ų ��Zzp'�Bc�P��
.��s56��1�+\o��[����BG�k��(���D�=&b/�|���t�*�G���9s�7��c��&����*LN��iH�_Fj3�:�
�6�~���\x��]�'�?7���Y�dQO����^"�aϏ篇�;� ���V{p�!vޤ/�8��y����涿5��W\���B'��`���'2�}����@�em!>��l����
������_���m���%{�'�n�3�JF篮`�s�Y=-�)ʅ� &��:�~
���������z%'b'�=>at's��i~7��Ʋ�g����!��(������(�cR�^��`F���ٟM�9��+첇�g����R3=�".Ru��/����Qeÿx�i�ΖKws�����"2��o���e�݁����ZE���s���L�܃|��v?����x+�J�=��5�K�>�Ӯ=N�t�U �ي���$�k�O<4&���"��>���r�ȇk�q�����.4��X�a���z��Y�+q[/,@0%&
��� �ࣰF(�OS�o!ª��
�g�&?M���vcur%�if..Ǚ��jLl!(��n���~�׸k՛6���En�Q��#T�?_ܘ+hl�G�N=D*}6`rfMe}����I�����⅕�J�x�|@�ة�NMcQ��ɵR[�V	�&B�]ϋ�i�8k��#D    ��}����K����2*B��̷'���??�WZ��|{�����'=+�̩uԱ�[[_���W8�zb�"3b-������	>3(����m_��\���L�D1�$X��B� <��<�O���χM��39s���d�v��/{ᑷ�U��S>{�:�0�q�F����OnI��Ă�o���V�F��1�0�K9�~3{i������ԝ?k7�QN��/)-P�8�Vd�&R�K\Ʋ��_�ۍ�mu
h�K��C��J��8��Kw��^�N��WS/��x���+����y7i�I����|j7r�U�}q����~U��R�)֪2o�f�<�8�#+�].��m<��f��D$Re!Kr�ri1jUy�T&���<εGI�I|!�ժ8���������W�Vm�HcX��j3�4#�Zj��b�������߃�A;�j�1��Ϻ�S�t����8S�=_�����lHj(������l�Kp��\3tɏ#�il2T��WE�Qb9#���F�H���N�K���QB/�q�w"*56<*/�_�C��AQv(��ڪi�]N��[��	���C��wrY�G��d��\�2��fca��kl4���Ф�z'��XD	MH>�l��S+���_oEF��^�G�A"\ ("uf_=i+�~CI1�l	��"ڿ�գ�`����7�3���?��I�Wcf#���N��{4�l�fd���?���嶂R��9���6� mC�
�W��&�-6�\�?������R�$w��t�v�e�Q@�Ax6,���|���Di����D���	���ɳ R{N��>�P.��=�[w876X
sXh-oekD�G����-" ����O�m4�����R�B�����(��3�����I>�{�ɾ�e�4�t���4��Ү����	m�{x2���
~�!�����5�ćC{��T��+�����Y�����{m�h�5����+3�VSѕ����[$�f��T�=>YPp7�'���t��R�X���T�5���e�wm����=?|�}���viP���@�S�Y���:E�d�"��^��*�2�[�����{<Ά��~�=�;�4�ח�v�(��{^�YX{���f��EDn��[@c��>�|�;t�\Y�9l؛�>N���8��`3+
u1!r��#1P��3��>��R��uaP^e��)	��"(w�����@�b�Cn��rxfF�dH��h��[<���:O!�ώ֌k�z��0��҃)��w�ZM
�\B��t%F�h{�ݳv�E4������Kv�+��펝.eN�oy�}��`�m��E
����0E_|�7w�0�*I�_��T
�[�R�n�o��s\�&��#��P:�}�Y�׈8��}ǽ\��qt1�O�֗�8>�dlSg_(Hd!�3/R�Ei#BĴ42J>+ko�0-���$�6�"�[r-ᶯ,bA�9�&��g��)���zԳ��R�9WC�r��U�,�\�-x�+f�ᐿr��L��ܡ�A=�F�XDN� (�P��m萳Od�]8U��ʀ ����} 9vW
 _�â�>�M?�5O����f�
��;��Q�� yA9���v���@^}kޞ��U��n���6�"��ܻ�2i��i�M�1��v��6>o�ޅ8"En̬����O�]㓅S��d܍O>������<��O�x@R#������!���6���0��l��^{�p���A��c{�8�-�$8M>����KYYD�j��"hm�2F#��(5c((����/Ļ��	��x��%��`�{�+�Fޑ���Hl�������Y��0���꽑g�B�?N�Y�g>k�1 J�bo��T� ��(��l��j�����L����E� <�Z��t���Z@¿����R�����̃�0=�,����/W�bp{�Fn�,J�+�U�	�>P�Ѯ��2���VŜm����El�t�֌m�Tkqʹ��!z[cm�Γ[��a<���p�&P3��Le�����-[�Iux�=���!�M�<���^�,�Jp1�T+]��/�@R�[3[/tW��6�5����Ev�@���$L����� B�C��w_zi�|��%�ڕd�2�T��HF�6y�~�`)c��9�r�ݏ���Zn�D��Ƚ������'R'�]�����n���R�ԁ۽H�=���#'����\���{'/��"���.Ɓ�R�k��~܊�c��y� ��t@�V��7�yq8L{��6dh	ڇ��/��5o����˸U5D����llH"���`�=��Q��>�	�4:"��O��U�v[�|�� ��7[�����G�d	7"�n�S�i�~���K�m�_9���<��>�u�����:�y�C�������I��	��ǆJ� �˜�ȽE_�$��s������M;ޟL.��!��×^�v�#���p2���P2��g�CDS�r��y��N��a�%�N��"���3�Z��>�do����<�O'����(؇	�H�*����1��3��<�q#�)_����&@N�l��p�����Ƚ�,z\�����A
��_l��-M���c�Dc��8�'�,l���Ē�#Pf�h>�5�&��
f:�X}�P@�~9)�tU��2�}�n�GT�H^��̜*��19.��MK6���p���m�e���E`�"�g��b��ܹ�W�����n��^�${�������r��$DU&�_O�{"���������[x�����k'��(�����6�?4��n�`W{���������i���I����5��3þ�ZW���~��FK�|7B�t#�0'�ɟ>Dd��l[&R������Y���8&D1i�W�a��<��}���[�N����Y�떸�!,��O
'�pD���B�tu����n�$J[֒�ppp�ꗻ�Zn�/zV�r�zK���˳�_��v���{&E�!Hd��f1�N�����ӝ��*��#�TS�y;��|u��Q�=��2�荜��?����o�ج���b���xR�#lh�g���mJ� @D�V����Eߐ#�=%���)k���>tr� �Z/��e�o�:Քف��S�Boۯ�jW���%����p@,��{�a�d�_�2�F�������XDMJH\�n�7v�0i�:5���������Ο�M�-��m]�t�ߍݹ.��l��n�ϝF^�om��(p��&S�j�ߋz)�������!rb�]>!�Y���=��}�<��O�4�Ƅ=����o�:c�����`�W�D�'Q����p�o�dC�>0���rd���\�ْ7��B��v�ՅͤA��l{Q�}�W�O;�t�7Ksqw��?�xY���_������5���=�QN>D���x����|�<�v�$J	À�?�%����`�/z?��X�7��]}	��Ԁ
!�vDV��R��;���.���ˏ��I��	$��	�S��u�s~�-M�H�1Z5�rO��d�l���st�$X�s*F)��"��|��;�{1wxӉ�V���ѷ���1w���F��d�O��!�X�]����?���A�������y�O���, �L�})�Y��0��5����ATʄ�MQ������ls�Tٛ���F��A����LaA<N"A9�o�'b� �D�%"giا��$W���d��"�����!PBJ�Gj��#�_l�4m3��cf##Q-�c���A�m���V���Lq� �P�" ?��#�̂k��)�D^�ӫal���5�	���S«�!��_�
�VY榲qF\�W���T6�2���I&���ʞT�
	����,�H�>t6W�юɕ�	��c��-�d`�!��y=s���pkp�����6JS��į�m�B��L7�Ɗ�w\����M%���a�&KW�S�7��aޫKC���q����,Y 䴟a�Bd˱��c���v��Țu��=?Wش�T��	�BI���4����,��XM>_Z�=�]5e���M!�d]�ӕy���@Gc�    �ʹ�e+s٫_��B�.w�M��e�{-�^�y@n���a��
�;|*����O��J[����������Ua7��c10�9�����Z��KU�t��R1s�S�@�x�D��U9<�I��Cw�R��oZzˉT����� &�X8�	��'fWzM̶l��4�;�!�ߨ^�N��,��=�[���ôQ(O�q��<*����E��a���q�Q���B0��2��]����P�QTC3����D5�����G:ic������V�B<�'�������F28�n8ά�B����_k�O0z�h���=s#�I9A��( $'Y{�\�t��̇Pi4����j�H�|(5Wa��%���5�}4?{�Bf)2DJ���zan�-BV8���S��YeH48y�W4�ތ��@�D$�������m!���t�$l4�Ə0�D!Z����4~G����i�N:Z��w�L�q4�h��:=ڳ����q��gd�<Y
�,	Y�c�u�H`8�3��-��cl�"(r��Yx�!�iDX}�����B���;��`����g'9���P]�<���z#Ҷ-���`B�#mh�>h�����ϙU"����ߵ���Ũ�f
_fPٗ���r���j������Bۜ�m�J�Z���цX!w���3�h{�r��D{::����t��!�$yٶ�p��O�J[x �a�BiۨB��!C;5���G|ܥ-F��D�{�;�+?2�޾S�3
s��ӛ(�� 5x���Ci��hJP�N�ʎC�6L��Nͥ������r)��d��M�=E΢�a[k�AV�	�s�F�,g�n�^�87���lr�ʩ�S�P�]<wx'tme�M�{y�}�(�6��`0������)F#�Rc�^�����f<���O1�m�a�dJ��t�4�h
��=򨱾�=G��N�z����+�D�-:T֡a��9[4�pk�
�@^�7T�2t�vD���i�l�v�K�-e_��4^�F�S�q��.}eS��ψ""d�M�KgI�y��y����^i�	6T�#,�D��?��}�p�5�Xpw��p������a���aR ��֮����F���??lK5fy';��	6�ȰeD�>���Od�r����z~�o��ȾD+y���az��`v� ����,�RA�8sD��\2��%r�xi�uG�F���7�F�)�J��,�`�)�:�+��;�n?�ҫI���F�?�uHd�F�~�DW�P�����ۦ�F�i�:�[x��`���m���hӽ�m���!*-u+i�	�!,-��D��U|���V�tlU^������-�ι\S��.X�Lr�U���M9W��P�uӄ��0�P��B�!��D��ri�𥝊d_K���I��KLUa�&�tZ`,8.��\{l��bX]�����h�q�l�>Œ���PH�O;YJ�ߙ:�Uc�ZD�U�Ü�k�h��]�!��X\���ب���B��3��p��0"������Qs���-���ZYۻʌ9��$wj�S��42��(5Ǵa��=p����y�;�h���+��@�C֓�>�<��L�Uaz���4��A��g�P G�y�m�O䃉M����݋�U��0��l�}Wd���@Л�~��L��[ ��b�I,!��	��a�v�n�9��qe��9�����`��3�%%�wWe��:����N�/D��4��b��V $��f���5����(�����5l?���L=���M���tKq%s٢��X�*�]a��}J98�[5�wțe���ilz�|b`B�Jf��,<s:$Q=~G��zy��	�&>Ѳxbjy��N���&� d�^��d��f�y�~l!�&�d
*j�q����<O���S�E�#y�9#䲬�,Ԇr�7�x�)�h7j*Y��0"�^A��==2�>�����O�)�P%���Hf�,�}��z��&�� �N���|-#�Ng���g�`����.�ۄHEFq�τ��8�A��c?�?"V���l�6����7��pe�S$R�<o)7�%+`��Q�f�x��i;��蠀� �U���}�5�?$C|D"�
N���.��",/�W%B����$�5Th�*�fpkv���-�\F�%_�.�si�!@�� �3pb4#��8u�Z�>�	�Kw>�5���"�}��t��B�I��k��
|��e�ņ�4Z�2i���z���6�Da�%��(_"����G�!��1v'CNR�0��}r��z����D�!0�q�8�o(���c�%,���g��v���c�i��4�����4�t/m��a��؂��~�]��$
��pY���`*�7*�H|�á��*z2h��EΙ�b��D��$w���V�{Q�ú3ɇ ����s���c�H29���ٴ*�҅��o���pc� ��l��^SzPN����=�����1�g\�7�?��<6��:��'�:���Z;P04�X�g�	5�a6L|lE"�!�{�����@/>�G~q8"c�lG�/tusC�i�ɔu�S�F(�<���le$t���[	���������	�i: Ѐ�D���e��\�R�X��WP�_�ݿ��$۳� R�]n��7&��W)���;*����qV	8>�S��*�F�:��ܷfH}�,8�m`�E|N��dp&�D�s��7Ɩ1l)�g�8ZF�i&΃�J�?R�B+�Y�(jY0n'��
��ٕ�\Q/�8����h�Q-�M��Pa`���Wy�T�w���yؘ����4Ƞ{�vl��k2�@�J�ZqD�KY�`�oC�K�3�,à�2(T�6��0�`l	�P2���~�ì[J$��cR��w6�Xx�*/'�6hi+�m�.����K�'�ѵ�u޷wz���oߌ�W����~tD�&o�bm�I����-���@04��n˄�¸
ΐ!^���DDc)��KT��ʅ�q�q��Ϝ}���.���>���O������"���V��p�~��W���% ��ӻ��p��0n����^�L�EA��'a?��!�w\�ԩ�O+<
������`JD|d?�tH �H�:ŵ�.��<I�� �b��l�lq��CH|�j���QaP��C+����a��-�8���	�e x9+��u8_�v�"��쿠�>�0,�쟨2 54,	q/�=����I ��D�_Nز����S xmabw�jQ��n|��֜9�J}',�����@t(>�RwԌ�����g��1�0sC�͠yh{���C��h�YaRxV"�^t�^��á�f���*
(6�J�OMV�qGh��m���f�K��6���~5�&�!�Dd�vIh%���e(��(,IR}g�>��$����$�9#�;�ڔ���p��P:J���2,�'Vl�prٱ�P�g;�
�'�=2k7ln���G�5����Cv7f���^�|Ǳ�����qg\~Bvm����;�jQi!�G��ܬ=�c��@�2|(|kn���R��E���r��E����
�82Q�֊�5�� �,�X,�q�WD,lU�_X�m���owd6x�%�fq��.�})�� ��7�n�E.�~�[��-��3����ӆ��bi3�a My��9���|ɨ<a��� ��zA�Yj����t��0!�K@5�#yP���*lb��$�X,����5�MU�)�O0uO��ޏF�'���d�p6� ���O�T:υ�x�zLǧ�s�
���":��j�1�E&[�.���C��v�J,F��KaQ��(���À�r$�5"�}׭P�N�g����,��i��X��ik�����T�5#�͊�]�d�A@�P��Z�:��T6W�)B��h�̢r�dԑ�j5`&S�2��~�]����U��pM�pԖ�"����WY���Y�&I.)�����O�i]���F����;��/�=z�v�pd�G�h*��
���f괨�S�I�9A�;Q́}YzY�y3�    )b�\0��k�$�̬(�l�����P�&��;��M�vQ��h } m3��U8�M� ���E��TKx���(x�}nz���jDZN���8��j(���p|�xj�Z����<ǭ	��3쭼����P��+\�֚+���iK�g<'�E[�k�n�/�O�8ᆴ�B���G2fS'�C�<����[����D5�D*(��~�%ؑ�4RL���3����՜s&�"�>0�$+M��V�"E���n�,��8�e�Y&R�Q)�Z "eD>R��'�$YiRC�@1S���)�tJ������j��b�[���� 8���� �Ñ^�8�H�r�I����1bJ-�4�v�g��g���ox�B9��b�����t�ԏ&Ք�_�;��З��Ԇ�@|*q�I'�$u�;�%J�k|���oH�G%ι� }�F}B�W|2���`R=���*F��lG�)%XAE��0n�����̱�.`���˃�ȎP�4��ˏ]�(��4p�E�
�c�*{��iţ	�K1p+ʪ����,��􊎙��Q��*0c(�j;����G�?Ԥ�vQӞ�sdۊ�K��ڀLgu����3��9Lm�e�d��AT�y��M���ZO�!��,Ync- ;� 1��R�5���$7UK���(��L�/�A��)v+����P��q#[:����ĢË��0�Q�H6}n�Ŷ�7�?��d)���|�)_�2���a��aphk$�@u��u��ʱ���a=a�x�Zi-B��ǂ/\�&�P_�f�'<SQ4�2�p�`��Nt�.��&$�l�"Ѽ7�?18Z�S�$�rD�A�Ҡ��LO7f4L�5���q��L�hA�u�xm2�kz��	Ԗ�k^Tu9G�
�œ3Zޅ:��*��ތ�n�D�?Tѱy
_/\�jyJi}Ԧ�S�k|g�m_�*��U���.w��$�H�� ��h\݁�}���	K��8F��#
������%���
���i��2S�6y3��M�����i(�����6]��\��P{Vp��JK	����*i| N�k%eA��w ج�ȴ���WWIh��fڮ�+$%R�R�])q9 b1�ѵuH��ٌ����F#�w]!)�Y�΄��mA� �z�2D�J��5�g�FB�[��->�k&��Z��nWJ*x(h �*�FR!��	��S�V�*X�`H�	��U�hT��d�ޕ��E��v~=��QՖ�L����C�V��H��=�T:)"�i".�[ªEWj��RQ-�����Wr��IvݡFM;����[K�DW��Ȑ>�.���s@4�% �?��l5\�p,���I7��p'����-� 	�B���LL2cՓ|��[�j§�zPI��Dd�jEh�����.��+���,`` 1S��H�kiO�ԃ�'5���ƺ����bj���S��_���/K��
N�@�:X��U���u�O��d�O�픠�3�(hF���@��~YTD�}�D�f��;���!EZ�鄻F�c����`���ӱ��/�UZ����S�ԓ5c¿�l��q�FR�-�zv�_l;T�Θɯ��&|�����$Y�f�����R����BZRan�6C���bn����ޤ�Fw�Q�^	`-/v �� �}��2�F_�8|#�������DI��ބ W�kh�fK��Q����N���
{]1�s8����*��^㳲�#�C����5���7kG5��}���u�2����åB(��ϧ#��ֶ�o����a��g�T���f�D�,z�G��/��m	MX�E���#�*TCdiYg�H�@+	����N�쯗H��w��5���J�ʁK׀�ʓ�M�~�L��B��#�tM�u��~�Ҕ!-��8�B�N
�1����#-�����ؑ(�be}g 
���E��tJ鿶� ZS�/0#D[�Y�⯌��'=s�O�+W�U�֎&a�B!��9��I�׎H��2����e���|=��2y�F[l���9t�I*/.#}����G�t\�ؐ��E�xf���47|����/����*`}��~?� ��l|�i`�@
,MG�
��}��= d��l2Oi�T
A��:�ijY��(�5=���@WK����$ر4-��9"֠�E8D������3��v�c�JSò����o��0Y���ʱ��-����0!����u�3��D{��
_,H!��D�������n֧���a��"~���=�V�ʝ�2X}��E==��nZL�k��ڙ������~U�{
����_QW�OdI��t9��"����K���[i�v��t9�9Q_%!Y�n�j�'���?Z�$�;O�}U�:���F��ãW}d��H"�𥵽�l<�!+Lb`��K�"�o	����q�0i�ЀJ@q��h�Ȉi��H4�@�ц���@�`�A�6��z1�	�,̹KT,�V� p,j��.4{�>���d��^/*'&����5Jgd���V���a"����zF��h��W���:���N��D�Q}���Rk]�4���Z~%�~��EE~"��١�-i��_z���t��Eb'#y�\�ʦP(d,�k��͠��{�X���F	���Yc���F���������L+L
Qj�κ��-��uc3��AK@�}�X�Y�Shn��L���vmk/YZ2' xj��慈RD�D�U�:�ɸ�A�7Z��'F�ڲ�3��!q�X�&�W
����� �''�"�==kr{|��%J�paQW9 �%��m7UD�S�0�?@�խ�������M�YNd"x��#������w��n3�s�e,l�"Aj�B�ZJM���N����{-X����j��q��4P�*Q�E�������Y5�#Z,E��}�&�U-Ҋg����]!=ӝ&뀍�b�����9����ȣ{x�1,����Ћ�o`�ܴ1��-;{1m��Wf����d�GU��TwH
��ʵQ�%_��y0i+�6.�plt�' ��M��W�-���
�
1��k���d	���T��fB&f�3��Cԃ~F�7~�� ^�
�V��}8La�8��X���k�6 ȁt���4{'bV㙖"���҂3�5Q�A��vfY)K���ˑ5�;3"���6��ƘgF�~! ��bif�h�2���Smx�զ�u!t>)�ckj[��%�i��f��'��
������o�n��f
!O4ۻ�fTw�V�4�[3�_=ȍ��nl���jL�aj/5	�VXኲAjoԙ@$� b�#P��h3���U����x-��BJ��M��A>)X�4D�uX��ь��hܲݶr������eF�'&��$Xu"At!�g6"��/�2���� l�����8`wx}��<��Y�W '!}^w"r�;Pl�j���꬝�ՑQ^hǓ�ͼƶ#wj�!�O�����ՕG|���`#i���` ��������4�0�P9����پw����������F�oR;,���ހ۾� �iLa��!��ȴ\Z�M�
�$��f��'T�Z�����2Z0�ă�Ɯ�ړ����3m��n���(���?�i����3�
Tꀲ*�������*�(�ra�%O��i��l!��j�Le���:_ə�v=�V������
DK��GԿhl��®E�^�!����@�1\xόXk�VZ��	sB�)d�v\����s�wx`vѹ��]��t��)�e����U�#�s�nM��J��C�Zu� 
}��n��o�p�^:�6��OsKG�V���� ���!G��薕A�*�Ԗ���{����q=��*՘@_\:+E������H@V�^��o���Ҡ+�nHQ�(]����|k_::2㇞�=���ҽ6Wn!3~�t�q�/�;��'ڿ�C��[��E}@�.L�h�{P��	�2aN��)0��5&eϣ�If{1��*U�2J�`(ҭ��x���%�٥�-7Y��<31�!��M��(�vf���Efz��N��DHNf6UN`%$�zO5L6i�K�y*]���-<j`�����H̊Z�    Á3��cj�F~
3D�L�����i���F��>ӯ�b�z���Rf��A�%z�ѐ}����ɶy=��P�A��V�[��Z��t��ק��Wc�=�g�2,t��0�xR�D�8�Ǣ-�{�4 f���81��Ԥ3g=��m.)W�i���=���Vq[������Ba��)�~>0��o(�T�$�rS�Ý�7���d�$"C�? ����y�9�X���M��~�A���L0�九��#,9 �8�&;�)l?��U:κ�c0�	m��R���g@��*z'���E��$UY�ɽO�N�oZ��!؉��(z�j^�K�m��|[���|������cU9~:9�V(�#�_��V����i7�d�QH>��.e�n��*��,T�����T9|z^0�:�xՍ_�:M'<�_W�RY�<lWȞ�����Y��#����C�mO>C�T�M��Fo�2+���a�e�Ċ�h��2��\���_�h
v��w�u�`�-l` d7�6h*-���k�5a��˪P:!�5�G�+�
�	��OHIU�σ�LK�9[���F�^�@�v�e�5���U^h����[?�*�-��!�Z�N��Np�.~� ,��NA�`'�IO�}W =�U��eE_ ˤv�0�j���[7N�k+�[�`�����Pv���/�\W)#z9��V2���(^Yҹ/�T�w��O��%j�p��O��EPr�"��Ql���#_j��\��TS`3��W������65b/^��"���O0B���+��;,ƅ�Xk쫛g�ܙ
]���W���Z:p4x8��D����	��c�A+/F�Jw�@6?�כ���_�����Bv�Y |B��!]r�'�?�!���B+�Hj��!�8�s8�Q��R2��E+�r�=��V!J%rc '�.�H��)���D����O���J��E/,t��$����m�օ��j�9IR����r�7,ŗ����+�^2��Pm�$c}��,�E� ���p�Y+� :���laO����%:�np,�F���Z�|��\��J'+Z�ҩ�9���9 J��6F�S��ߦr͵��60�!߶��>d)��քɔ�ɔ~c�J��U��$*u�=��ut�1Y�r@�$��Q<��Y7�����g.Gc�e��K��2I���a���f�h�ɼ�0`<Mp={����{sQ/jղ"ǎt[�a�C���Ã���)d�eq�T|�[�WKE�����z}����h�Ü�n����"���h+�4�g�R�m�KU3ǣ�g>$�X1�׃����!�Ʋy=k?����g4%�TW$Q ���{�9�A�h��	Nr��[�,�pjn��ԥZ�S�℔��L�0Yt�������w�w"�r��u8"ق?���De�SR���(s�D6L�X�5,P<i�/�ˍz���/��|���E��\+��ʹ�OP�\�	ή"�p�1MIӱ�A�Egk��i�LxK�����}+X��T	���� N�t֡�^c��`���m��\ڐXY2�7L�gb��]z�V���,���L�BH�ǖ�ظ6e�+O��w��B}���<ִ��>	�|��t�e��\0���Za��`|5K:l��r%Ux���n�j)&E�Mˑ��TI�/���q���l3�O���c��������^�oO��fA��q���ƾK
a�jĠ��Ʒ�%��`����.z&��5�뱪�*�8���Gi�����6 ��B��[�¸�f�%�@�F�������4��B��W��\h,Q	[.��+ ���?�R�H�$��G�#��ъ�	�H��8u�|z�ݘzzd�c`c�f�k\Z�K�E�s�4��ϋ�'����O��nh��j��S�$�!e�?Su�k��:��vx�d0�5�� �(�TB
xsK^��f�`�I_�xyF���S�/��gDQ?퍕���~6X²?�g���~F���n��U���z,u����aL�0d�c�t2� ���\��B�/E���>�.I�;��$?BA΁���w�X�=��RjX���y���P[(캂Î38���vQ�;��*��k�\o�}����x�_٧ &��\4.�bj2MK�YZ�0i/�����[&��l<*��n���fa�*�(H���1��PÈ������d�_����
Zc�*�>b��f��ac�rż�D��eIK�n(�P�QS�D��k�^�K�R������/�\pdB�_7��C�Ҩ������'�~����ac��=��W46%]DF�P����{ј�73�fYM.L"�]mh�/����������9���j�+*&�*I���gQ���W rxх�y�m���/��n�y������/Yz	�����K��~��'�9�>SHހ�������	r����z���<"G� n�j��%�����m�u���q���γe�Y{��t��z�'u�O��C[�v.�0��q89��� h�� l���y�G�hU�A��F�'h�f��5�A��R��z��Y�ьy�D�i?�*�ƥໍ����:�&DE�m�Gc`BN�j�N��#�Vk���M�4�%���JZ��>]�I��F��Ks��/�P����;� �<��,�:f3�&G�cjN��6=u�hr��8�H�ͥ��.~������N��1�5�I^k�T7�.G���5�/B���$��h#QD��s7�D��$�hR�4� "�������1j�� dFj�n��K;��U��2�./��n�I�dy��h0̲��∕&J��aR�(�v<K�n7T@a���W��?H ,�1Q�.��G���{'�N��w, A���[�l���k�P�핷�e��<%;>!B�|<�c��m�qC���Rk�oŨ����k�ε�F�8���d�\d�/�oz��$�'z�k�k� fN�4mzfҥ��PBpz=�P�Qp�
%��-*ܘj5v���}p��$%D[,|���L#,UhU�@�����D9���l5Ho:�$sM@�`��q���а�@^�6'j]��"���=PcQCϖ�f&����c����8h�DQ��d�:�d��l>6./M��l�'�q��fqsSC�H��g��Y���&RC�UP�L
McE��V� �2;$��VDm�v�=��&�]��#�^��z�b���L_-�Ä�ڷUe�y,���Ǜ�S�»&�'Q���T2��8c"�U�ê&��q_�W&1,%	2����#D�3��5��X_���kj�\o3��\�y���t[Wb�\�b��7i�10�V��6��lk-��x��zeJS����a�y��25� , Ƴ�3{E�J�W�lߋ@3?��3p,E��x��&���B��P�li����K~hRs�Ɛ���W�Kpy�~��M(6fpm��w�5���Qٰ"�W�S����&Z����ǫ��JkQb��7�qآ�-@h�\l�b���c��G�=^b<�(���V3X����;V�a&y䕱>Q�*->�_�f�)�x�����ye>i�c�����S�:��.Ȣ�ˍ�{`f�J�X����u7EW�@�I�{�+�2�e��)�:P���/{��y�aL�N��1S��*�LK� ��0[�V_eEh�D� y��	�&G�X����I��L�-ʒASTs*��EYi�Yn���/5+�:j�{0��r��@�QUA�څ�[.��@�1���7��L�&�e^kg���n���bA0m�s�����S��k����¢v@k��Z�A(��"x}�U�vZW	�!� 䵙���0Z-'����@�#j���1����~��&YM���6���Ȣ!��i�7�3U�,Y4���Y;nJ觉�is� �U��r���B>}�j��uQ$���tzj��6�Qt�owj��/�qc9�H�F�Ź��:��*&�[h|]��jf�+̺�g�ޤ�w9�Z�xk���$��������i�ym*^d���m�������L�m�i��ioPϑ �� ��T��0��G��a�b��b�B�:�V�N5)4    =WZ�ÐB'k�1װAu�צ�EV�����W�4&���[���v���xn�*#?�M3�,����?���x����^������1�|���A�A��?�n;}�9c��%��ur�աZ�4���BHP���}n��T�|J+b��X@pӨ\&�j c߇%��[A��d�'5$> 3��m#�ؽc!Fԩ�k㶑���Y�m^%�ՏPfǭf�3F�8s�{^��Y��]���&��^h$Zv'���X������	U^��P�t�;���MR�v$�&XH�I�_�e��@�z7��9�`�X*h��5��d_��.�ږ��hE�d{o�P��hS4�1.-*�#�/{������1�X���$N��1�.}��I����z���R��5������Kc<?V�
�����^�=y�}�j.��2�H]���:[��Rw2��x}d���������&]GV���@��C_�5D��;��04��BS;8�Q��5Q��p*�n�)�>�b����gvI5&�G�/\ M<�Lʗ.6bV2\ty���[����Ⱥ��N�-���k�1�.�X���-'��@e�YCJ�|[��N�_i�B�i?�����u��;O{��<ՍyFJ�J�EǞ7���XJ"�h���mɐ��Jj[T2C�N�)%�q��N�]��@.�L��c�MhL	zj�Q��݇�Vp�(��ֶ�]���iK����.z��+U��kʀ�ָt�0IH�!�f�L�k�xQ��)6�{��q��)��N'+hL�dy�إG�'gy�!������Oa�� w�&=��3����2=�+��>�ھ��K �����d��Mg����1������7n�7ݑ%@�vy���k|�^�*v���.�2zƀAw,���2*��ô�*�0!��ȱD ���Z�C(�S��r�� ۼ�Yo�KU+�l�1�LP�Z�&�s�&A�R�k��5�y�c������� o��4��%�s����0�>��[��,���eYHpL*�r1s�ti����NZ�tm�EY6V�!����0�<2� b@���v	����Sq��y6B�����6��ZYZ"��QTۧHN6Lb  3���-�k�AI���֕![��g�h��
A16R#c����n���9e���O��|�sg"| ��qk��5˭0�?��`QvmʉP"��$���s���z+�[>��+� >0�̶F鯂vF��׭]�����[�`��;S*�h�	���A�(�?�S��k3U��ƾ|����K�+)�amZ�P���;�"�2o�+l��s���1��P��Lx���C��o+'�w0�C����d����U�mR������h��T������Ռ��+DD�������=_��F�,/�r!<m���Z�4�B�]/��w�o��kU��2����Yu�(��"���͢��A�X�;Cs��ꅍ"NLH˻�`��V &G�l�]!b)DU���nK��]ew  8w��Q.���JF����W*Rx;m�x�֪��d�A��������a]Ig(9�ɡ��/�B������בT؏hY��� Yf��jϡ*�*�4�x�¸�SOx�R����kփ;A�<� `IӮ��^w.�e��؇m'�5r�v�ڳ�*�Z���?���I���S{.���J�"l\��$�d�ۃR8�f�/��0I��<0�H%��+i�7ׄ<��M�Hm$H����?W��2���x����[BJ(jʭjOkb��޾�'+�%M)�IP��J5ܠ�穖����4gn�k�����u�I�U�'��I՞7R�ѫɽ��\{�H]WE�����%h�o���,|�Ԧ=�a�4e�M��U�7��U�YNM4u,m�[�ej{o��9w��[u�`'z��q�����v�	�ŨuwjKn�bx���g�N�o�O2M�s�>��<�"[<��>�V����~���é�h�9}U[�<����%/֕O�q�\��V>�o���{�|ז.�E���N�gn�ݠCm�@������Ĉ���=�Hr�gU[�= �(��T[�"��3�˩�f�e�Yp��j�[z��Ҭ�-Ӄ
�$Q��B�Ԍd��>Ț��f������4Gk��v��SJk�}��\j�=Ѵ�ˬ��U!/vZ�s��'�C��x�k}D��I	,���q�
2gjεP�f`!�!2G6؝�[bz)!h�Έ�byis�	:,BD/m�̃����+�xi;B�. ����
������4I��Z�$�^��^6�Dh��2�� 66k�kGFX��DGav^2"LI�"% �C���;{�݊�s+�my�!	�HaJМ�άcJ�0�0)�P�4���������o+b�is���4"�)MC�S�,�s�]�z����%6���֙�+�6wJ~,a�S(S8��4��v�P�V���u:�(���N��8�&�a%h��+B���Xkm��Zjfއ���O�a�Y0�coA�NkD�q���5���T��&J��Q���U��P_�N�j�=�8�� ��ߢ�����ǋ>@���'+HX2�!\IK^� �V(����"@��⸾�9�ZV �x�5G�͡�/�.��e��a/S��w�݌6��
F+��բ�8���������y�궢��v �������yA,D�$�V�!n�W��a�غM��
�6� � �Q�x��d��K���}�A��pT!�gǧ�uR,���}�8|������c�+�Y�ÅA]�Wf2�������n�<O!�T��n�~����ls�U`��ң��<h⟜��fyj�ܹ�|g�S�N,�wO�E�kZ�,��VT [fx*�5�R�+Б�ʁY�ڃ����Gi��f-� j��L4d8n����43�al�g��ߩ="�H�=t�e`<� R�D`ʧ���l��]edz�q���Pc�NtOt�Y�n�w���Aم�m�v~Ec�`��hz�*�6vf�\0]����2V��A��A�s@��D��`��i�]`Ψ���j�H<��j3M�(d���)��Id��M+��Zs�����c���팔׿?���H"�p�1��A�]�ԥ��̖���.�^K	�_��|qx �	�nVU�����
�U
��/:��^�zJ�*ϗK�����������XՇ�x�֊�����[� T�O����Z�vBncf�"�+0��,B�`āI�ڞ+�.�Ā��98x���B�Q�L�j�d��jJ5�>�f{k�<3 ��۱��:�u�p�aB^�i��[�Ⱥ�#��e#�����j�S�x�rS%�y(l����&T�$�#�Azٚ�ͳ�c�}�U6W
���oDI[+�sE��P��VU
lHB�����(��Z�z��Z#D���Xz{4��X3MId��,���ߢ /_�'J{�8�)�f�@�6,Ѐ,�[|��^ƚ
�<q����T�a�cmҐ��I�fdv����2MPA�4}������h�P(�#�`lI��S!��)��e7j&���h+��u�'U�j�h�`
Bx#R���>���D�ģ���8]�r&
ʁW�xa�NQ�/�ݮS� &)))g�V�$�@jΙ�� ?�.�摡�o�	3e3��0V���m���Y�J(5������+d㕊�*�I��#�32�F��p�t.�O����}VGʹx�H�ɧQ̈����!�~��7�����36�)�$�t�)��sb[���Yh��������6�+3�,<������%����A�Z�"
�qь��_�wS���K�@!+L�P�հ�B�`�7b�c"�}��d�
cAI_*�K[�i�;��^gDb��[���-l�"e`Y�T�O�%��R}or�16�Ȟ� ˇ"�,��������)B&���D�/�$^�+w2�h&�~)�aG��y		(A�)C��0�� ��F�V�0��A�܅����9�2w���|�� A>ھϙzul?���D�d���`��f� x&�����c�-ԨH���� �T�v��tx�}d�h�������d�$D(BD��s&�    _!���[�ve�ģR
P5C��3O��S�ݘL��8�\�>�U���л��pJ��ڰц�|xD%�U`�i
�ԍ��R���N�8r0
'.5��^��r&��~�sK���Cx�큜��hF`�ۙH�z�+������!CT,�u��]e�6��M��{�~Q N�5�d�ΗTg;D�szh��]�F:�2��|���9�1��ȴ6%�w� �S�r�c��doє7d�W�Б!���3���}�FS�r�f�L���|��'�L���6��Y�Bo��PF/x�N(��ioy���rcbh��}�Zс�q�D��r�]�[�#�v�]*��}�u�����un7���iq9) <��c��Q ᱷ��M6�� a����&�8��8�4	�[k�����OB�q�#�����A��؄VM$��cV���?����?蒖?���$��t=	1ˌȊ�p��k����ZZ^S���H��\��׼4�p6O�! �P��.����li�U`�����v�o���� ���g�XmiG��?��A����ߋ4�bR��Kc5�y�s6H6��J��z���fh����;xYi+��n��@i<|C�p��J����Z�<�=�*�I����KS�+1�aT��P�H>Ap��=�m9��̭X|4�H��̊�J;��Y�)UB�Q�a�>H�Mo�9TYʱ �<y��f['�Uw�9��Yh3�o�{�i,���A''=	6ފ90����@�k� �|�Y�5���&����'B��>�I�ՙ��I	|�}�&K�)|�A�����i��%�Icp*?�Y4=)M�2�!0�i%���!|�v�c8fc)��X�_eV��.��ʡ���ؤf`*��q��J!�0�C��
��n��Iu��xAA7Y*J�m���E��Sv3�4*��Akm���P�>�70��2g��xZDG�=X�N��Ѽ
�֕�u]l���dX��s{'��������fx3Be�\���cR�Z�
���O���-_�gX2��뗱V�(T&�tg1P����Ϗ�lI����Qe\���*�Be����9��=��c�������k�ae����]����`2`Aw��~���R�bP�C�n9Rt���hk���i�t ꋻ$"U&�LDO�-1�׶~��{�N�m�̻2����td���g,���-f�hkSZ��wc4 u�[���1��橌�LJO��R(�L���\���;�,@E��P�����7��`v�2����,>EUz
û����c7�����w�W���W�G�k�U�\ƾ'�̩6KLQ[x���{@�(>��V��#���jc�E=�|��+X�l���̑�/�E�����6�wQ/jX&C�E"��m��cQ�⹡v��,BL-�9E�v��s�fQ����-R���+7^o�}i'��T�j�ꐓ�'�����f�x���/�k����x�Lr���9�+|.㻴6k�3+��k`RRS�jm�>�=(_4a��F���2��S3���u�� �'�f"G��c̻��̱6���a�oe�bt�q#���(g���L1�#����i��zxm�6{������:�3qt>�u�k�6n�����G�6�72��C����`�8.�$G�f��ԋ8�~L*���e9�$�\_�]�J$��X"�$�d%��[��A�D���\�~>��W�DrU3�������Q=�dJQ*EL�f��jj�8G��y�w��}{ݷ3�pO����6�Ƀm��.�}W�1�Y@����3��o�J�w"c7���p�?�~���Q	���-�:J2�/ �\yg ��ob�.z$EPn�9���:4l������K��U�d�2�d/S730]�~��R�X���d|��,�̪�π��FOK/�Y�n���Y=H�f����'��AZ4���Pb�l^��Ҡ�Sy��#�Y9� C4wȋ��(�b�	>�;BY�X���|\�tġo���)��"߇}QI��/MH��_h�>,�44Z���^������
Ϭq��r,����H�1?��b��6o�KP�6���ȗpykIWw;���x;,XP�3f��6փ���ž�E���?C�}�>�W7&^�/l���5b:+���N��8�?��z6�gZYU9��8�1�g�=��5�v�7�Ǒ�����`��v�������xU��o�|#��f�	:�N����m��qi~Y��B��ډ����mG�H��}7���Nr�����|:�[�|�6%��	0l�0�*kx�E�ku)�`@���zm	�E�8��%P \����a1�A�h؛���L����1x�
�H^����:I�w��z�H7�mB�U�}���嚰MfH�Ԑ�u0�_YlkdOnI(S���=^�E
 ��>"@������ͯ�(JM����7]��/�@��ҧ�HN�)���~X|+��ƽ���E�ȧB�n�֩�,fϿ��Z����}3�B�ڄo���x���_МkslP�^��IUM��z�m���ݛ�ۧNہRJ����������s�����4M����[�r�.�58OH�i��ŝ���0�w��ב�qt�?	6M ���]�����!�Z���"�&�[�0�䮴�hq����+;�0e�;d���+I�72
�o0�M#��gi�x[����z}R_��&R4���DsѺ��;�	POuM���hq���Z���	� Hy���ӣ�PMC�_��d�Ӫet�;G��S��|=2t&,*H(�s9��oY� �=K9.�>z�-���Xd�P���x����o��|��-�����X	 �$�J�,�U�p/)�H�7>ףIB��#�ϻ-"�7�Q\�T�3��f�Oʊ|ϧ��'d�/��.�:]xL�o�lH�T�JCo�yu����K����|Cmn�g�H�}p��#���F�0i�؛WL�12q�2�����A����$����^��<��Dq�8�ۅb�4�i�V:�#5��lo�_���`g��i��!��;�k9�^�N�^g���G�B��'s����Z�q��X.����H4%O�����u�����c2�F�֊��sep]�<������ OHZ����`$�%pۼ�]"E�]��Խ?�	��L��Am�?ށx�>����ʎ�!g�% �&"�~�C[�e��,�i��Jl ����[��3*�.�L��O�5&(w�ҮG"�e���y��,"�?�kQ�HD�_}(��'	��D�#�{jb���Co�eJ��dW�,�F�ej�$���+�3�j�y���o�i��~Ҕ	�K0�S������t�!b�u����|����~u<���󼿺�t�h�����4�Js!<�?�~Fgsj�j�`~�������P�-���o�+�0��n4�i�8[/�M��j�z���C���wǢ��AWk��L"߇�%qr���C-�W��t�{�өv����#7�Pk���p󖚽��lO�)��-Lۦ�q��Z��j:�z��D��9�N�U����c�]���X頊T�o���w��$�)$G�yF�M�J��v"l:�Vnz���z�m�@{M��O�Y���x 6����w�T�h����A*���-�X�Ye��ǘ�u����7*�<�QE�)⮊�;
��+RQ�D
v�a#��9G��$�۞HLVz>N�CX��!6�(�%g2G�%�����7�/S�M�*�?�B��b;)���2�-��������>bv5C6ݲ���>��W���'�%1ǂȾP�����[,��ݢ�����vc�Y\��tx �({q]�,�^X��	�G\r6������7LTM!��cԭL�Z	�-����,ζ0�S�Rtu?	��^K_<�����t�!.�S��Z��&p��>~�YĈ�c� ų@�C�����1��m���+nD�`��e_6U��ۅ/>ٹ�OOC
�4��@��f�|s�hq���Q���c��z��cR�!Wl���U�$Ȧ��>�����S�N2v�L���aY�~~�I^�.`�IUogb-ߝ�õ��r��N������%�8���    ���ܱt�
^=p� �+�����88P%5�Y\A�no��r�YAF����Ɲ��.c^�Έ�N�@u�_�WX�kZ���n��@��`F�hT��]d�1[F���Q+L�PG�1�7�
�R��d4ͪ�2�����`�ֆ���F@� WN���p}lV*����$����N�ƨ]�q!jiq���-���֘1��bG|;rzZ_"_�+�.�*�%얭����_�nz�(W^�����l`��V��|��跸����ow���^����,3� ��Ӕ��;�P_q��jǥ����B�	�;.G6�)��	�,�#"WT��ꦟ�!y_��/��ǿA�/2��,�� ����G~�1��(�ڽ&:��sj�5�øٮ���d�O1���[�����f?����E�ua���Ue�����X?!X�KCDٌ!\���Y�7�]�����q���v�d^�<]NhM��$ś�3�ܩ9Y����T+�y�aE�[�˯�A�Y�`�e�BV���ܪ������GB	�����]_e�X@EC�P�!e��B�d�B����g灅��뵸<K=˟��U�aА�$�H4���-nP�ӑ����QWE��c�OX?� �1O/=U�+����b�������b�ZH��qwcD	�P��F�B�eD���rL�B%Ģ$l-�o�B#zR8jΡ��v�&j$�kv��~y؜{�(�D��0m0���3��a�_8J���!�v�e�BϤ9S��<�?	��P�`
���p'��� ��eJ��� ������x�C%�yyV�
�y�����Q�|dڶS�0'x/�jF�ݵ��FRu	5�
˅����n��L�!Z�L�R�|*pc�g/v�R-}C ��@�:lH;b��L,!��yM��N+�'�2Ջ7̉ �۸9a�53'�$��1 ��7��Ho�e
�0u�	8�&����ᴃ�W4����7,׽�����:"��\v̾S,�a5��Dl����0��á���@+ǥS��an��KK ��a�}n�	���
P7� ��f���ˣ;�A�*�r�e�vu���emw`�f̰������,j�zI�B�D��^�I����biE�r�O��W#�N��K����<�(��#�_Q��Ɵ5�P�H� D~����^h���k�
���*;o�����]S�,:���_P��E�����|Kմ�P�p�,�2
[� �ͻ���R��9-���g�5�5��R����o�0�PB��[�� ������٬���Z3'P�1�=(��n��� �ț�à$u���k'�9M,��tf�N��6D��^�O*�B��NI��iZsD�c»�5< ���?#A$���1�E�{�i�M<#�Y��9a���. �xG^����##�eD#���>��q�[[��	�\00��5��H`�3���i�LO�A{xu��F���9����Tϣ0\�rO������Z���pp� 	m�!��Nf�;'�)¨�����;t C%��d�����%%wvB(]]�n�>�<��|�í��+u��`��4�T�[P:���/�N�A�x�����E��iH���lo<� G�ڛ� L�ia�Rc��p%!�V|�?�^�^z�q��^�t�&��Z�P%]b�B�j��¼�1I��9�AMW�˃���rP�/�s)˳yM�B�[օ�H~Y�{I��L  ��������c��N�՛�6�H4�LF�&��H�6y���{�r������i�@��i����^��~>�v<w�8&n�pA���p*����qEIX{,D��% �l]�F�kf��p��ս�0H]D�wp�l�M���%�"�l���%)o�t�.Z_������ni24Q�@f�����Io�z�#���V��Fyv�o��n���H3
�"�-��3��ȍ:�̒[�rs;!\�"Fl(2�/��&P�y6��4��!M��7^s4YS鬜�j���cgͽ�l�4�Wt� �6`U��9����_�����<j����Z�n�]Qm��'A��1��H��>��ȵv�\h���՜�7���>���3��n�GZ	b�����x�����dEH5�K0��A�>z"���s�n�%��Ѯ�6�0E��EH���r���a�Yә7�ʰFqӒ��t�"��H�@��rpdRy� ����ŝ�Y�b��,'P���2	u����O/D�� �����{������Ї�^�\M1��>G��U�Y�tHv��)CQ�nB9���3��n��`���s�{9�Lz�/=<"����#��_d]*���//�@I$��/K����^:�Ґ���XS�*{]�o�C$YNP;;�3���]-sP���\�/�8w1�g��C�Ű@X-[����E�0t��ϔ�]<(�70�L�2U���T����w��HW�l/����7�*C�m�P�I�UϡI"pu�ޮ����g����zZ,�� ���t�#��h�L�c������Үu�]�ӊ1]s�QrGr�2ʃ��{2��'�;ui[έ'NS��$�zx�{�˫�aM"V0��.�.��b?�_�;�V���s��Ƿ,F�,����sp|�¦\{�f=�h1�M��Wo9�3� &	�z����/���=�	���n0�����=�N���l{�{���<�0i�?���tH'Z��`���?��*��h��n�9��#_����6a���-�?� .-S�Sčx[���
��_1�|���]��.�T]��}��F%�w�i�]�f���^g��+<}0�,��$��.gQ3�t�K����3��3�=��n�R���v�����>WQV},���'q�Ⱥ�Vy��h)�5�o0q���ad4wj�e�q�2�	�k9��P�nH���)�x�]l�V���#j��,�z�.�+�I4h��54S$�ހc�yV�5W�gP��	3�i|�dY�W�Q��&8a�����!5��7������i�E_U�p�g��;@�a5�F�U� Y�a����K/?�
���"���Z��&���f�;����_�q|��ê��J�?�fQ){�0#aߋ��n�<�Ñb��Ǯ�$;Hm��i��x���P\��8~冨�@9C�Wy���i�e�v�	�K(��KwV�G�=��Aj��_�$�hP������$D�BGP)c�7촄�* ���5�w��*+�Z�������ggb
�E��'b�_�AqѮ �ܫ�SY�Á�:�T�W_�@TZ��y	|Ut�o#�3(�w��v�俦@/8wD�21���/�(�8�0�%��o/h9EٺjHd��h��?\G�hD9�'+���KZ���l3/Q5Z܁�O�́��E���-sY��!��H]^�񒷺�U;�XË��f��%����������"���fg{P��?;��jq�v�=��Ji'��q
��t��O®��2�'Hq�NWV��H1�uQ>���-<���_{��T�M�c1���<W���	������pkO*c��5��\=�.�D$�[�zQ2TI~RKS�ըxy.=��6㶩�O���Pi.	�\��f�/	�Œ�C��#I�F�t�t�K�^�o�,K�y$�N�kԼ�{��%��{�ǻj��y��v�����;Ua�RW���߀Uv��B���.�w�B&ӻV�.w`���a�����j}_��{;�t��������p���k��V�Ļ6�o��V�Wy/�U�^���b}����j�π����77��S�m���[h�����5��O����&��c�^���u�/���U��	�Џ՜`/Q��,J����^��V!i��4/VH��K�"H�9Ā�P��ЅU0\�H��J�O�%4��{
�(.�ͫxzi[�^����[J�*���=/����\q�_�o]��-�jS/m
�y����R�p5���#/�}����5P���mBɽ:�I�va����z�Vd�Gȿ������
��b�[ܤOu��9��ޕ�����!�1    �Y���x�Cu<0��y&I��HQF��-�A�S�Ɩ�u�L4� �Wh��K��U��g/�R�0K���ƶ6��*,B��VO������NFC�f̳��d�~0ݮQ�,�ڍA9�A�����5{i��3�z����f��ں�T|J$u/�}�~�Ğ��m]��f�'����ɦD��/��
w�����z��ꜘ����-�����p,�F{g
����U�p� ���Ax݋2�����"dN��Kw���Ġa�q/�ݐ ���027�O�!����
�G�j����E��C���1z� 9v)x$2.��.~w���1C���K2F%��в�[�f���-��7�Ď���:ށlS��~$d%�8��-e������,>���PUI���ڻ�q��@覇��	rd��l�O�����rϟ�6�ф`*����2��K 	o'0*_�U��.B���еN<UOd��>�6Vr;���'���Jc�� �$D��0T�F�L����*��@���&�.s��g�� �1���K/��O�=�n���ǋ^u(tf/A�ԥ~�-j�+��YT�4�Q�e�=�Z%���9���qc\�P.����Py~#4�~N��|Ƨ�N���r�=O�:�m��;m��e�"�{�?�x���~m~���4�ϱ/f��N��"�A�[�3�J^�[ސ��Ax�H�G2�C%���� �����tU6�B��!�@>�ȵO���w�6y��s��=/��XN��ϫjБ/��D^A��U���3Ua@�˫j���?��kb�$����E�$XLȲ�i�����=�����pOJ^��P{e�Ɩuw(k{zLꐌ�u��b,d�>��*�i��!3B3(X���s�����+ݑ�:�|�R�ѼJubp�~��@�A{��{�=NC����(�1_��j`Z��x��,�LH�#	ڵ$M��C�B�Ĺ���(����<\�Wt݂�u^K�N�A8�b?>���T����-Kn�EC0&�NEZL��N7p�j(���5cL-}��C��>��`~� )��`�o�<�$����:��p�Bd{]����!�/�����LQ��v\��F�:���be�2{�|����uAa��#�nx�P�8$9ey9��򪭯��Z���(�t'�ދ��Ց*��*����e~��������	����P�&g��+t�3� ��?ӥi��QX�>�Gr`�L(�4�мҡPd�inPo�_xk�PR�M��	�AB�;��=sQnVuh�Y������Hr#�����?�^�O�@5"�&�ߊ��Ԃ����(OC X�V`U��eG~��-$Q������2��-�\��������$4xc��6��?b��ܵy��@r��z&ژ��j���\�-���%\�w`?��j�W=Z]AF��Kz��7�;�5]vX&�Ugq^GA�0��Q�S��ZF��E�$�3:nY�V�S"��"]& ]�dȤ��2�Re\��E�i|�H�0S3~��$�m|�~��G��R4����� ����Қ�E�Zq�<�W�����������jP@ 0
��W�ṫ��9�Ѐ=�; �f��$�j9�����ܖ�N�㧲|��=��^.˄�RԵ�V����4^i"�&�?2^�ӑ#}�<
���&a�k��X��d��y��tI�3U���#o�}�+�vi��=)��d<S�V��4�>Sb\�ő�3.a�c�J�0�1����5����lţ�T�I娴��"���IW�x;�3����C:߭з�4���^� $j��5�0zLE�G��"�굉�3�Lp;�&�%��ݎW�C�1� �}���1c}�` E`<ŦߔI��S� M.j��b�/���LC�"��*B@8����������ÀX�됸����)���g����E	�u�qUx���Mycä���Ъo���^gzߚC����}�~z؏����.�Y�~w����m�Z����r�s{ ��=~[�:�����O',�Wc6��ﵲX.1!L1?.�s��<0���
X���`�U����{��Q���J��*_Y��D=$���X��#oF����f�5�u�0�+�K���CQvQ���pO��r՛(����H���}���d�r�+��:WpX�·yM�V��wگ��/�v��k7�ހ��$�/�״�qθz�()u��������%��O����C�s[����s��}�S��z�P��Y�{�N�A�3<!��
�`ql�Dg$-� x�G#��L�^�o~c�(�&\�"j�3P`��`�!堷�� a����9�hsjP�nKt����LN��[���̞���,�-v�)=r�Í��أE��w�3.Sҳ�9�R��ꄵ���FW$�!k���ç���cdbx�γ{�PF��Q� ��%(%zt���`=�ȇBͧ��I^@"������v���a(�;w��S,�&p�pp��������m��>�N�������g��Z���M�~O1+N��S�w���=�Ӑ	g,Ͼ�^��E��Ҫ�}�v(���S �o�����.2��a�>C�3, ��'UmyZ̸%�#5`	��{���h���rx�:���	�."~���G!����U����s g`-D$�~i��i���t7����..��{�n_��h��0�X��͠���8��;K��I�1V-qyHK�b?�#��
,���gz�SF�wh���_[1M��ސ��������:	��1"�٠>�[F(X�Aֈ	�����.�F<�euM��%�
�;��S�q} e�W�JN��ݕ�h7��H�,��}��DY�b�߂j	A5��˴^�ݗS�r͞��$��D�I�q}���M�B9	Rg������S�tB��ѹ;�{�,��c�C�X �u�afe`6a�yߐ��qw��a�$Y�|$y�L�I��&�<��\�D'5��Ó\�"
����|�߀���fz
�o���xG{>��oR��j@b����Y��߰��iǹ�'�&P���j�kAC��g������.M�]EI��W�|%>Kf�)��А<�w����Z��qǛT���5/�����%x��D�=�e��ǬR�.&�t�'������w1٫խ�!��n�N��N���o��uΠN0ͬ����2V}�b�$�nd�����W{���pzGpHPY��%�2���S��ޒ�ovN�z+�T-��x7~�D��P'늅������aR�B]�y3}ǣ��y�0ĳwQR�b�D���ֿ����Om5�d�b�}�}�C�W}泩լ�};͈ �l��ow���5���\&2k'v�y�kI�\����rT^-˔!��S�f�����m��߄� Œy 2q"�00�@�0�c�5�RP��RD����P&MC��c`vq�LR��"M1�A��F�iNK��5��`��ݭQ,���%�E����M.+ɠ~^����3Ȅ�ד�ꂶ��{��d���󈡔����|�{X��t:|%?^��s�i�<��k޻�{�����cAcU;�{̛�~��zT��-�u�|��&��$�����*	aVPx͋ �\�X-h��(���@��0b�]1ir��ր 4h����������F�\�
u�E��X����3`���#�\���/.��初���=�ߏ�	�^�d0�H6�� 	�E�.�$�ܰ��G�[�Z�RmX��u^l�BmXp�n<ށa5'�̆��vR�I*�W����,�6�e-�H��t�#R�N$��p˨(L���"Bѧ�C.�!�d�Dо�i��k2��&��8��\�t�2�5�J>d���#�"7U S�\���#<�C�����Z]��<o���t��`$ӿ�0!1�����а��Î	��@K�*��h��ﴪd��`�w�5=U]S�e��,J�z®�Bua!Zꂮ�c kfY���%��\��2���j�o%AWA��(i_�~�LUU�y��Co>�T��c�9����"g��4*(0��{�i�d�5Ye+͔����e1v{�kX���B    q����`z�vmn������\�Y��a���z�t�4t��jWg l��`2�	�h}���N@��fdH�x.w)��f��i31(o�r|�ԳTjìh���l���?��츤v�����^���Q!j�3i� H���.p>�/,;�U��E�ֲ��&���OR�F*�o.p
��(�It_��d���Hm��B�n8K�;q���e����2\�q�0�3��
A1Ef�dR2�	i���=!��]4Z ���?0=����ೱ4CޅT��l�{�<�8�P<���AZ��-������e�-�pl���s��Lf���h�h�l$e�=��#�v	�6��q��6G���/��P�,֫}�FvY�o���M��iQ�Vy'C���f~t�{KD��I3����Ϣ��:��
�-
B)���2(߸��^?�I�����ʵ�r����'i��,�y��7Cؗ�n�m&��]�g�	&E����e��s�#��+^}_��q̲:p���z�"���L�vy�����GR�4)׃w�Uí�v$�b{��-)��tP~��vͣ���?�������IV���C�ϊ���@6p�{/l��/{�N� ��Du���%0nxQ�'�(<X	�$��	�&��76y PV.�-e�bZ8ǽ�I1�����z;���^�NS!\���|Ě�͋�
�O���t��P�/�L�G�i�9�m��xE��FwN�%����8tZ�����S�
��5� ��|�?�SH��4&(70	�o���y��p��#��v_�AKpPA�3��k��^��|c»!��r��r:��5����7P�50�Ʌ�(��h��~����2~<X��e��p�
;���X<9�)u��K��o����8���t`~y;Cu �A\�ڙ?q�!a`}� ��+��Ѫ�����ǿ��z��p�^��Ǘ��ńFm���T�r�wa�
\�P2��}]�И��O��Џ���ơ��xk��t&���_9��l(O@X��\$�J�˱۳����`�~E�+l0o����_�T������r <�4k�W�9T���W���F
]���q� �Q#m�WT��*� /{��3ş�{hq(��a��zw-6ޙ�=EM�%����P:0�\@�)rK2d��$]C���w���޳�P�VZ��.[:���'t��(��Y���%��U�ad�1Y�b��t�鸠�����b4� id"����9}^�I���a�&ڷP
fsD`A����RP`�(�����I�j��X�;䔍SK��w%f�VÊ�"W㝑��-Q�4�@=���,3Ů�b��f���^S�ܯ}�I\���r�
�0@�4��7D	�xF3Տ��|����z��u@4��4�U\��J����G�Z:"ݟ��=��:#�͙�����1���:���=n/�d����H�\0�p���*�iY��p�x�~I�~B?�I+Ɖ�V'I,��a�� K	Ļ���@"�S��D]�$n<�t_p��XA8/?�0#���Ax[�'�#��hfzV�R:����H܍K�ꠟ^�I�A3B�Y��)��-{��ш����,Z�Չ��� *M|Sc���lu�4�yT����mZ<&>��xCs��A��-�S����{d��:v2���bd�=�Z�e~"�۵�p!Ä�p(�u	*�>1�nda�#�!����}\���Ђ3�(G�D�Ej��lY���2��x����V+��u@bp��$���{_󾞪�Χ���s��ꐂ�r ��dؒ�)x� !6^댓&�I�G"�r��~Z/)m�Vμ� ��sE�.�u��-�d"R��K�f�* ����
J�kuZ�?�Y�p����Ϡ�N]`F��XK�.[�sT�Dk�&��;7�l�m���c-���.<6).j�]��Ŗ.Rx3���'KJD��K��DL܀���y�?x\����<���Ӛ��n�=fg��\��Ԗ�ki̍%�!��` S�,2��M�MU�>H�$�Cz�[	��v�i5��2��#���5[�5�kЬ�hz��o=��,�2����8m;��%x=�e���zW�+ eyf]����$ �$�maO��ԬȀ�zd:X��&����VU1��s���*,ۤƳ�5���.�*�ͦ���k��� �+������z��`ܳ�_���u)p�z[Z��T���C��O�ų��F�3�F�}<�A�j�P�VZ�岪�^kq�:+��/���c&�+rx�؃N��w�]Q]�E4~�Qz"��d�\dRr'�;n���;h�$lt�e�;���	�K0`�k4�d`���>�����>�f\��~�f����.h��h|��Q�pI�З�z�k�Mrk�|&t��ü+`o�̸{8{�2_q��N$n���%Fm��3�%9��R�0s1.G`�b��� �+T�'
�4]�!.��h�R�5?�@�����e���Fф�����-�����X�;���D��sϠ9-6�_!UhN�`�����M.�$����nQ��%� ���kˌ�^u�o�L�*۞T�Ȋ�$�k�iR,�9M��s"-s��C���]�l��hY���������@y3vp5�����-1���]��w�e����%Qx7�if���{�;���̍�3�:Uʻ42��� C��A�*w���pS.�ϬґhR'p��Kzf�2����Ik���k���h\��/�i���p4 ��n��9/�,$���ǩ_����8�Qiq���Tk24բ�PU��dw�����ӆg*n���Q�b�aV�g����ZA�]e�j����)'Оܘc*�iQ���%
�uI"���y �Û3O�x�8
\�S�^��Xe͍ꮬܜ�qE�14VGe����5R�;���H��]��1a�pǖ7'${�4��3W���8U�3�H�=!,�XSA�́rK����1a����v�H$O�a� v�fB~�r6��-`�"�d�s�':��D���
���C�k �¢T��5;2�Hb�&б\��u�����v�fM�$�诱����$��Z������=�ʥ��#m����I�b��Ҋ��I�r��F��$N��C����5�waP��"���(	�۠���E���9��;h�,z�y_�Jr���aQ
�.�W�����NtԻe��)�_�;�N�~]��w$e3���i�;�m�'�྇�ۣ�SLŭ��S=�*	�X.�J��]`��������&(P�,�������nu�Q��)�J��͛h�8־��[������vA�
�t�&�5Sf���F�)��LBZt���?�w><�`/�9�M4D��}�ng�>hl��pA�R՛q^[%�м���r� @��g.ƙ��z�{�@� ���Q$�u�3I�{}tӬ��`(�9��$Q����l��`"f�n�vΧ	�4�0���0���4>��7we�0F�'��кŬ��o�i�L� �3��i ����Ѐ��d���
1w@�y;�}����6�:N��S˟"��53���"�3(_s��w��4o��lT(g�v��^2��̅-����� e.��h���ܛ�)���@�^T�#�wMP1Ib^f17}�GE�nÙa�6E�=����`��ቝf���7+ :{���B���k3��+]���X��xkw�%����H�H��2s˛17X�}�uO��ljH���J��'�&7̑^�q�Q�	2v)�j�~Ћ`�V1������A� �.��P�0Tj>� C�Rl8�_��.�;ܝ��ӥ�x3>�������RdP���n� ��݃��2#��"?��7�9}���hwh�0+Vԛ�fh��r=�XU0�x�)���-lט�	:�j`h�Ż�A���14Z�.sQe����=1�w$��^K����b�Ux�X���D֓n�v����{�˟���,CU�}K_w�Puu�x����PUuϼ��~�_][�]4���<,42T�<D��(    +tl��x��|D�}UUCս�rB�*���,o��]Ɯ��-_M�B௒9L/^���>�A������%���i	�a��e����&��m�����m���o
�t4"}��/�6 '�uě�u_�Z_���M2R�P���>�.��ߢ��*Qw|0��·��y�´jow��[F��`zMD�b�_��J�7��=���"�9M���x�R��1 ���^?��/���R�����M�o2�~D`���,eh)�HAg�D��8"��?e)X�4sC�ryz�g)f$6g�9��omH���9�������Z1�{TZ�hHo�����Ɩv^�O&u���b�73��$��f�|±{��%G�L�Gp	|��[{�7����k�9؍�f�䓥�։����Fp����*g{�7�Ka%=�(a5��u�D˕y)��j���JZ�:�K������A�J�Q"���ղn�4O�(�.7Ig������mi���Fr��d`�Ĵ�S/����+�ԁ�������F�4fn�CXIS�i�a��2KYA��gǉ�5�.3���ߢ�s��^HY�B5\���7�^q�˜���=�:��|i����_���+f��{,�z�]�m?+j�^+�s\0ʨ���;��49.JS����l���R(h� � ��V3i�}����=HN�*����n��F= 6����r|��C�Q� ���>��R4��X��ߋ�VU���1=(�����WD醠>��'�Tٝ�3�\���:%���B2pq��H�"U�b��"h%h�g����1Һ-�Q�WXI݆Ơ���di�Q}X[��˿��A	����X��A
�D�&A��J�5�{1Ȑ@�G���p�_�2Tx���	������`+t,��:�t�^;aGXI]#���h�C`CyVc�ǿ��aA������A^"^��J�?��R�R��HWB�`����3m 2 JïH:�P�,�o/�Y���,L�0�����1%�r9K��,rѠ
�O@�?aP�DD���w�K�0�缲��.�++ˠ5By�|��ΐ@�"x�!e�ޣ[}6ه�lN�̓���"6NK
VZ	I���f`,4:B"���9�)f�3!��|��24��q��f����5Y�;@ t�/M�7:����]{�m�i��#He�|Y���e<V.D-�Ș'P%�=!��b�|Z���T~`Y�9-(���c���sSύ���a.�o�14R�!�x��|-HE,j>��H�����%�ه��l/"`��һb�Y����:�������$��X��s�����'q��cʚ�ɖ��z�
���@�2e���|hty(_)p���bD�w#g���ڶ��=��R� ]=r7��17�4`��u#���s��E	���f�Y�D�4!Q� D(��
���_�B��o^c ڧ�˝X��q�k��@�0��L<�E���Q,��4T߫!΅���J�b��w�z���,_O9@觥�+|_Z=G{K:D������&��5t�,y9o���5�^9���L��W���r1�).�4���^e����`ʪӫ�+
�k|e�0���n�O�͡�g�P�����d����v��L}^�CS���&!"Q����b��kO�_��ba������YN�Pd������j	x���{���^/��>����G�`y� �G�����DBU���Wt�3�N꠳82�2-5	Uw�1μޛ��UD. X���������q�.Āη�:����j��,�0$�b������-A��(	�ª�
A>3�%@����`�\e 7��)��[�o+��F^ģ�BStb�x��feG���\�$~&$�z�� ytQ�T�����*褏D2�8^!�	Ey�Ll��D�FM�6��K����V%�'V��� ����AG~#����C�Y��d]X�j������8!~>[~e�J��爎��S?�`������0������ ������J��v j�w���+d�?�#�#�%�1���u9��]�B��I�%2�����a��X������������Y���k �l��˷�	�q�T��������Y���,LJ�]�����u�(�W�4�M����Y�V���	[��ڭ�l�������ZR���g:ݔ�Y���sIfq.���>��/��Yo�1����0��^�b^D ��Sq'p!=E��C����W�OƑ�zw���4V��n��Y�[���]�	~ i�K�
�9 R���*�_��Z	�m+y}y��\�j�P2J�fC$������P�Kq�E�-!Ex�2K�~���(���C����GcV��j��5�
T,L���6uP� 3ұ�Sk�6���}�V>1fcP���"%�����h���rD��Q,����P� ڵv#�2a��[�z+��J<=��%zN�q�bH����P�f	��ͷ,`	��.�}\�펜]��f�����5��1����)�K�+��֣Lj�������%�rڔE�:��Ҩ᠂ ���V(�
W �k2����M,% �uq�R�şj��� �خ�<���v�zŪ��� ��j�1bUm�cbɡe\y�E��ϘPZ�3��40Z�f�t����Ydm#Yg)�GB�C��
��<� x*�Sޱ�3�n�2����a=Q��4ɘ�� ��(�հ�ԁ��Ab�ڴ�m޿|���G-�f�L� �ʛ{�k*��ce�`8SP \����K����ȹu=� s����K�"K�6������b`Վ�(j%>]� �K��������o-k q�#J�"�ш�����4�d�_�j�;g�PR��:O��F�z�F�#����t�T��<A�2�̀v�bۻ��-ƒ�/�e^�&4k�Y�j��9L��N@2`�d�~O%Y��O�� ��$�i%)�8Kiׂ� �`��l.b9���o�k��$�8��[^L��'���e�&Iu"$�b\34g���H֡k�����g!I�"���G������!I�"��w=��Џ�S��(�͎y?E�����K�$�@��2� �&����~�2Nk���88����l�U���p�#�-�� ������)7�ɪ'B�=�}�\1m���@��g�g�y�QM�҆�><ƮP�r�I�/�O��
,"�}�B缦�ԫw�_{'�򓤨MG��9�ڽ��s ]���-XR�z�����Y`�O���:�q j����_O���o����c�t�6��!�n�%������23B�1�K����;:��P`�$�¦L�cI�(�  ��,�q96��w/� [Fܒ��UD9��#̀@��E���H�aM��hJh�3Cp�Y�^`�ˏ����F3eE��yt�|�P���,���_I1�P�ŏ��r��/�����
T�{�����C�v�$�J�Н�~Z�b�WY�#hI�>�'��յ#��f����TV�,�"���J�̪�=L7�%`ň��B��
,�Gq�.���u�nF`�ė)E�r�"����W��^Y��@1E����b�r��3v�JQ~�*t�f��*��~�aW�oȴ8,�@��GsU+��0&�rK��l
,`��z��RY6ܐL����Xy���Z�k7�j�L�eF�a�,�(���������?� Yip6�Ѩ�4�+�(j�u0��C��<1Us�C�$�ˑd9!K��E�B�Z5q�l��BxZ���b;MAl����xRg�K`�o_�!#a9�8ࢗ�ݢ]�h������'i�AEL L�������*B�n���Jk-�~�V7�H�������f�%�� oWuP�e^�vdV�H�%����M��R
�V�,&��2��Ͳ$���"���W�Ł�Ү�Ǖ�JZ�xh���ű��5�x+eS.o������K�(_�h�����/��ML�@:�m�&��4��^�TP��Y��A���<%��`�Qh�����V���yERj�t[�#H>�Za�ס�}1����FNZYM13Mb��m�=Z�    ��W$c����bf�4tP���&�;�W�6ױ�����_=*�M�&Te>���g�?@W�]z���,��B�|�m7���J�JS�'��Ld������{�;Z�������t�wǇr�6ۦ�IQb��}Q�v�jeM��`y�In��ҏ���^�F����q.+e����Te�VTÕT��ul⃑>�]���K:�ZX�g����l����{�z�CW|t���Ҙ��Ѻ�y�L�ط��2�|]N ~zUW�-�_v[z�ڪ'{TL�/Ʒ;�Z�jERI=�۪*{X���k�k�ZB��]{f`��j�^۪-�K 
ȕ�.�q�F9�UiW��}�c�[�D';9y�~������|3!���cB����|�igv'+,�zN��'�tL,QS�QذE�����> �EJ��BL�.7~q���-_���3$�\��Y	��!0J��I�%ơ>�_��]�v����[�v��=����A%�/O����I��@u�ճx���ZbI��XH�LV��O��2t�f��(������f�)����H#�NZ-YMر�t�����KQ�w/?��^���ƸN�]��B'�,Y���nw�"��O�N0�c�+2�G�	9?�c�����r��]W���B�li;h��Fx� a�7��^K�R�00�m&�XbM���5�P�£�i?����:<`��s�UG�T)�?|�}}.�<~��0]_�	�dY:�{��[��m���X�u>�#7t��h�k��7�ެ���b9%Yn�EV��"�r��
����v�{eb5�@U�4]�1	5CQ}UF�����c�ڴ��P�O��7�qy։��A�O����ˢK=�j.Y_�Xo@Sז�R����4�T�ꉀ�6	�W9SL�l�2�^��D4��������ل2��;4k_5�0��~M&�"���ɦ���Z&���D�l��׋@/m��p^;-<½ܐ��<�iW�;0�lk�B�u��DAG"��d/e���[k,�r`�iMF��,�有��	�ᆟ��_�<��#��-� ��g.��k�����2��N�浻Szi��L4����ja�^&0�����^N��\�7������!L$(�rK�a�̰^�2G��9����1�3���~*?n(�!H�f�3 �f0o7��f��H����v�=d��"`��U�KB�B�$\4��n���+�K��$f�W�=t}/c,s��
.Q&��S�y/�+���˓��3-��3��=�)c���n�'�00�W��ԏ��b~���L��\��)��4�uml���L����'�0J��3��х�t�k+�q�-�<4�a]eFzwܘ�7(N����p-2׆�E�W�q��h�ꡪ�>��c"���p�z��p-�\X��l��)�e'K�Sk�U9�&�մ3��)ͼ@<W'-��g^�;i/�|�F� >W�O���� 3]EƳ�h1|�A7�l��#_S&� M	���:�{^�v��2�~o��k� �ٲF��=i+2 [C8G��r_��R=���O��fv�0H�S~�>(�вH�� �<��oP��z΢e��CR�m�*���ڐ��tC��~�*ϗ��K���:�^|Uˎ��k����m�E�P�PI���d)@֞����\?���޶���Jom�P�9fP|��r���/��7�<.���ׇv����O>8�-��E�F"RS��\[j�E���`��/�R��Ɗ�àC����pk~.�Ɏ�AV*r��'�e'��<������?`
;�MW�$�����~�c-"qWDT�zZN�	�X\�@hY]��b��D��Q�-^@\�DhsMP����9i�A2��T�ei׶d�pv`x �T.�z���H:rL��ĕm˺e0�\M\*�Ķ�*@�5�=+�t��۾��s�LH��X`@@���.�W����JF7�^�M˂�O�3��/4�v��WU�����8�.�;��eͲ�z��Us ��9�@�c��Ÿw�K\�mY���P<C�g�b��㿾����n;A�aU��t������yٲ��t8l�Xql�������[���B���!�$<�<���ʔ�$2h����e���qk$'qU5&�?_r#�Eٱ�Y�h�Պ��g/�,��q@�\ke��d�
|��/�^Z��!�yI�5d��:گ�q!������]�u�|�Ή�����	���.q�����c��<y(Ak��wV��Tۣ��.�(WaY&�j0%k�k!R�Կ���θ��KdTc\s`-���.�����ܱ�b�W����'�(VE�n\�|�Xc�3�-/�/t�q%�D�R�w��/�6q�`�V�����D��Iފ8)�s��@Շ��J�{�ly�Gn���MI��9��
�-t)�Y�W_'�O���2;Q1�4%og���/�ƫ���u�d\�_�d�:S�]HtC#Y?��C���9$�4GdlI,.�����jB��	��(I�"Un�����]��f�D��VƠPw+�Dʌ�%�,�q�@ڊ:u�O�Y<D��Ț�+L$��c�+ۻګ��F���_(�a��#aB]��~��9�D��U�����l�m�c7襥b2�[^z�Ě�%	 ? ��w�
̼`�?�I
WA�fqSIp>3dG�;ks�T��u��Z�����Qo���'/<ֹ��/�2o78U*���YUװ���9�#z���r��lD�]ʴdL���*k���Q<��u`<�$��ғ��H���g-֤P��ʀ1�n�,�t}�u�X�%���UF�W��/᜕4������Z�,�u�WxA�� ���?|��.A�Bڿ�'��{����2� d�/�2�����Y�9'��d�'|E�I��g�I��6C2.4F��Q3b��Xo���_OX]�]�
M�΋�5;��:o�����v��s�Ļ���pS���ȸ�ߨ�n�.���JK�u�����p����Ϸ�ֵXܓ���ո):v��[�'�#�4���,�����;�.�@�N�t/+��9�8,�*��l���VU�4|{�<�p�N7V��sY���H�u>>��'VY��(�U�K`R��'��Ư岉�!���D����Ɩ(�QuQS���jN��E6`��O��e�(/��a��=����U>v�v�T&˞��<DET'Ax��I�ǻ�i��� ��'3����4�n�1�@\WЯC= ����[_ru ��,�Y߯~-�����Z�\y������_�A���c��ך�A�%	1Ή�	���P6�r�;���v6z?�
@�@补1����m+p�^Z&�!u�p��A���}�S0�\�c�����T�!�Z��2�'���o�2��r�4q�0i��T^-�8�u���tvW�� v���)vr�X�/If~�aBY@�,e����}-Q����X֬�Q���K�dU��O�Pϛ�W���KDA����2�Bt��]��	���"Ճ"�,�<�jgT���g̮��W4�9#�x��н��y�� ���]k;���dO�;Q������R���$➄eD�6�Ou�9����~���Q�f�[Q�
>o�,`߽t�=d}I�VF�i���{.A:)���f���`�5i�$_P�k�,b�Πs'����ǿ]ٱΩ��0]j�����"n�Qm+�4Y҃?u��vN�-�<��/�j�RA��g��C��Ϡ%��A����ƲEP:�NZ�lE�wVdaW��Hj �c�<�2 O<���YmhB��o'K����3D�	M�y3�un�e\��o�v���r�ِ�Ù7ݏ�H4l�4���H���J��K�s��,��̰�K^�$���f�GV*�> �k��Im��2u�B2�Ѧ�q���5F�yp����[� m����)��E8l�̚b+��q��3I0���x�@sc*
AG@��6���4�����D�A�:��r��o}��as8k�\����P�7�|`9�����bϪ��q_L�#��,F�8aG�����9	���|bo=(�s{�`ע�#xu��ʢ�B�R��к �Z>(�y���Ӥ�    .�{83Xkhb�N%.��'ea�Ehd��aD=Si�� M��˵Z1i��7�Ä�9�] (�.9��_�̏1�l���܁q��&BD�y�<,+]/�}m�>��̾Ñ�0E�qu��Z,$|��*݈,�.���w���aR�>}`Y%!�#���:C	cil��f<9���A��j{1�X�YKhn/#�M���f��7�kнqL~�݊��P�t�0��X�������z��h�~�-���C��Fs��NOZ��E�1�N+7t*�������p�&�R��*�����N�d����e�{	�1h�Lsw�1�$�h^|i��7$[��iB�?�*��V*����M�/��	��"��h���W��"�_��
D)�q���3I�Z%3�S����Ց���H�k��J~OA��$Ձ�b[� ;�D��aW�����D�	�7����f<�(LUX�V�O�1HQ�"���P�cB��k�D w��!_�����`��ݰ��\k��y5��	/��BL��RX��j��t�6,����YW;�~i�#tL�N}���|x8d��/������t\"�h%mRAB|�f-j���ؚw'�T7<���)�?٤�gn~���fdedL�C zo���_i�,�>+��,S��K.�M3����ףЕ��0�����B���1U��x����OŌ��1�,�fB��Y'n ���]�]�E�����Y:}V�[��B�F�
gT��+����Y�R}�Y_[`5�����*��� B�w4�;����=�0oD�$�\d��I�Ub0�͖2�V�d�I�u�6��[{���N�����`��j3���J[T���j��*vmd��g+��W����N랴��jT�>fҁ���F��"sj�̲�w@w\sݲ�Jb@������z�x"�#��[��8�Y�=�4xA6U��@ ��;�Wc2Y�&{�;`:F�Y#�@yg�����oW�^Ygp �߻#�$N��S����H֮ҮS3��t��;�g��{��M��u/�����YGfi.� y��2Hcg���lp�o���C$$FVdQ2�,�ߪBb�9M�&Dy��:Ɛ�ҿ0ܩ��,�2����f6�N@Ad�Ψd6H�i<����4H(�Q?E�Uv��@$`y��jw��I�x{v7�˷�helGF�(�`a�VGkd��rt�|l�
"�dErc���.`�3F������9� (��.J����=����
�W�%���"��5}(�V�̴��Ď�%͞������>"��B���
�9��I���GF2(����{��<�]�V�|d�⧫�h/G_vdd���o�a�=��A����6������$�4��:�#��?�?0׋iֱ����řf`��eVͫ���[m �Re���[}�5���Z.�L��j`��P[��r��vg:Z� ��̢n�_�5I0�>a�c+Ch+J�@k�U����1�O�����Gc�ã�Yle"c}+��Yoe���>VB��VvLt���5I*qhe�`����H˯����"*�Vރhtmk�W����@��a+���o��%�X"����ۡ������4h,#)�1�:Tol嘈�g#X��Ai�HV6�S�L��!.cN7^>�N�Qd��"�8�.<1���]կ�#���������Ԛ���z�]�b�+��"-�'��Ͷ@'�&���|'���IEV��*p줧k|�]Y}�,�2!9��(�)K�c��Eb��Ï �ø�K,�]tRN:�d�����,�4t��ɳ}���N��< ;�A��@W�_�Y�#��r��j[����X��q}S>�=���3��Z��bb��^��l's(�6x��3g:���E'��:�
J���]�+��da��}�`�s��9�����}Hɠb�F'�C�I 홻M�.%B��o�M�Nʖ��㲓��b��Zk���MJ,a;z�:5i�Ē��y��扗,�b�vU��οW�z@��	���~�T�m�ޘ�ʥ��3�J���|��-;���H������|�@e'�XU�4��I�a��k��r�{}G��b�~���噻���	�9��e��y�����F+W=ӫ���1nS�L�yXd�*�P9�c��J��g�Ż�u�JC�u<�g[��OuTO�g��KgeF��8�@��~�/Ime���@DY���� >D�D��y'y��eF0�*��^v[����Ƒ�o�̘�`�e�6��h;��&Ĉ�e버��4!�iU9{ه�������^�13L��\�p{)H�8��ܻ���"3������t�^�13��i������p̌�~:ޚ���՘B�@`�FR/��I		���^&`f��H28�'�'��v�?��u�yJ/i티�x��܊?�+��Eͤa�J������x��"S/3�y1������Q�;\�"��Ȣx1���,�}}������I�g,�½�ɚˌ^�8nr�u��uZذ�tdf$p������2�u����ت�b8��<�x���<������?e�e�m���Q7w5�~��-��<O�z?-�OO���j�Aw��J[e ���gs��a$K]�u����z:��]�2ݟw�J%�J�F�,�-�cul%-���FU�CL`�y������Pب�����8ZIRar!]n�0�i6U�������W��j�`�}"ꪼ�B}
\�H�����+�ڽK���p�k��J(ᗌ�3o�]�l"��N�
�#��Ϭ�H���!`vX��
�4��3��3�U�Xg�my;1A&e�j|![������k������{�K:��<HG�>�!��@=�?�͝L���)��I�K6kE��a�_�wF�C���Υy�Q��g_�� 7�Fo2Å�����;�g���e;���[^��vN���@���|+���A$zY�"i���#0����_��]WۉZS��N�vLE9��N{梃R"�xsȐ��=r'���5+��%��(�r����g���\�3u5�74��Xi�j�^��H��mep��k29�qWހ��`�r ����bI �+�%	߱�5zD_�6 B�	�q��$!)$F��o	��U��Ŀj�?:�`M�tt2�y?K&�~?��u��/�32���zɼ]-
���K����Yt=yf�-z�/�M�$n�rIH�4a�\p��[�����}�+���黝UiU�5]����,���� J��X%�E+��a��XVx�%��QŸ]��<U�.. 2�1b������oXwȅ�ژГov��y�xBҩ��8����zӪ����
��U��=�o�e�k�HL���{~�]1�Y���G~)�gZU�MLE�Ҫ*�건�:[NiCArW�52��[n�y'��p����X�D$U�>~-���Kh���������ܿC��j��yvcQH<�]IB���K˝(�F�my�i%��л~vW@��aI˙���!tF��yt������L+)����i%5ܰ2���iJQ6�[�4WZIQ6��`$��"_ㆵd*��:��'=�p���Ô>�&�M�i�z�>�w�K+�ʆU�$�A$�&��ʽ���{�ٟ֑�Y`i�Pk�^D3F�o�&Z*i�z�
+ϻ�kg�H��V :����H|����擀xF�f�>�`ݽ�5 ����i��U ��2�<�EɳY��H��W��q�8��-�Nȅ-q��ڢ����E�^;��� �fä|
��@|e���9��I��fC�}ܖ�B�9�.��cG�{&��x;�����@#U��rT�(����rG`�(x��X���\y=��P�-��^���*�Fڳ!>��M/�O��g����
�=�,)�:�Ȫ��8��
:-E�-jjC�X;`S�~.�'/��R#��L�/6�	\��Ь�a޿Y���!��H���PnOSS#\����&��EGp�'g^#�]zu>͋��`�E48�TѐW�x�Ů�uR.��Z%MU��:��ϭ�݂!#I�*Z���o���c$
T��$)��V�j�^(P[    ��FF~C�U�-��eB�ڎ��Y��G�������u��N���ѕ p�'y��� RiKµ��'��T�=�祝����|z�'~��-L�2����a ��즦���/��R#�!h+멍�Uύa@�����>��3E����V��1��Q�︘�B���s,������ >ܽ\\�%����~\_��R�yб �?�Hn+WQ
���!Цz;ٵ�a����ݱ�_Ivm`,�#8^�,K:�Э���?����9��� u��>a��t��G!�/<�tu� �G  ,+��7���]߲G�l�.~�v��AF�{<��Tҥ �Ԓ��1�M*�R`f��LBW�;���{gѨzU3������1;��� ܜ�n��8����&��i���8+�X�����	.`��uU-R��4qws먖Z��(�Y�K�j酚Q ;��wv�J�T ��C�l�8�ǤR���	��D�"bqQ�m�e��E�Ͳ!���B-4��NYwL��|�|j"�z�����`�bU�|ZK��K3�\p82�k^�B�!�j鬚��\,�N�G��EO�HZ^��$ESxЕ!1���9���x9������/�&���A��g"M1"J �ğk���=�#>�TK��9� �v5F �Ouirw��l��K�tR�#^2c�D�'պy�)���m��)�*
�1+�c�nc!"�"6��q��Zt�9E�Y��f�[X��n��j)�" �	�G�h��ș�ё����9���Xl�_q.�nT�s~�r���Z��,�S-_Tm�Id!��(W�W!���ڶ�� ���ؙ�b�����_iC�}Lu�4kzDv<�s�^�$��b.�}���`*��z1���;͛8�&y�P��%���E�7�4_�Q?��^��c5c����j��j��v��>CAV͏�Nw�����qw5}<CLTnoː�P�����^r�P�=�_?���.l䗪��,��'s��.a?��Yj��k����i}%�X
�Y��]pE�Ŝ1MX
}G���N ��9Nt��s���(�	�3.d��j��M��q~������7�
L���	Q'�ks*e�N�]��R>a��9 핐1����j? ֈ��r�G\�eQ7��1��5�_ W�n���ph��XNlB鎷{U�_���$rőΈ�8H�\�
)���EPK`�L�i�3�W	�>.�)�y�����,���z?���?@W>�Р��4�].���N}t�ݲS�<xf�bL��f���z{?qȩ�.}���@��f
��6�?�wm��b-C)e=�k|��5R��J��O�.r9��}���92L��Ka>�>���A��W��<�C������%7PBD�%H�=�@�w�c����3D1���Tw�{&�'�)�D�n�f��3����y	5K�N��eG4q�V�h��j~�&���I`7sa�Ҡ��h���v.�Bc]:���H�~Ҋu���J~2������H�͙����!.����D5}5����z�L�Z�*}��o�g?�k=y��<��v��z�4�v�	eʡ$�C�ç��(�g#}:����Zrڕ� .B��*4���|F��O�=|���2�|�ݐS<�P�43�Ũ\4�C3h�~\��2O)��\��r��v��"5�!��b��|9׆lp4O�wA���T���bnE|�.����g/���؅尞n�I��:\ �sЉ���7��l���Ҫ����i�ȴj�_���~�گu��0��P}�:󐃍+4�<������i㩼(�Y
�G�UF�O�<S(=&�����þܐ%�0�p�Y{g ?�	�7o&dBy�wl֤h�]SY-HT;�Xp���C� ԖRhJ�nV9�酦��0�3���ڼ�����L�+��|l7nN�P��K�V9�$m�}�c��wQ6��w
J�9hԚ�|�5r��
-80��@K������ޑ�&AsΫ��J�Q6����I[�bN#I`�sQ��I9��O��h�9���L�TIuaQ�`�������ܙ�Q{�A�V��V�t�X��}�j�8������k��е��*�ٖ;�7H5��!��O�С��(�6�П��x����W�.B���i�?y���G����\�z�@x�Dn�Э��
���"
�B�27�|=�Umy:����"J!j2�FP��V��fY�w!�[9��W�mm��F��3�(H���G��^���kl��J�����(B]]ғB=kfz�ɸ:*)՞UDC�d�d�j��o*IW�AP� ��5��I�����;x�pj~�U�܏W��SDZ�
�~}���(U\1/����*�&OAp�%���ig-�z���,���n�1�@-����1|���Q���\#�5*"�̑�4�0��"0 �ttż�wȊa�3�u�����Z���)ݞ1�F�n�����o���|7Rgc�ykK�bl�����V)�b�8�3_��tE���y�o���1��M��0��g�ݪ���N�[�U���+�Z�e]������:�$�)K�V��3�]�!�>gY6���oe@8s1�����`�MY��2T����9P��p���XG���Ԅ�5ӓ?�m�c=KWw�P�9�a
W]�z}��\��oE,�#5��&����s�R�R��K�z7S17M�����3��,팴A�d1?�(��q�~_^7WMj�"����M$�]�
1S�S�����f�@5��P(Oa����޻4w� 6K�<ı9�G���b�m��b^��b�(�z�.��B ��N����L1�~r�Ʒ'd�]�:�!����{�����<���E��}����sZ�L7犉���J?#�wIs����=H�b��`��1�nv�ȏ���O�v��<�F���%�bn��;^^��#�
�{ݓ}��M�GNl�~����8�5c�u]�H��a��0�@M�c�f��C�w�'^p���4W2�|('M�v����)�#�9T}�3C~��qEO���7���C�������q�'4t_�s[�0�����rt[�|���&���O���%�(���j��C�ȏ�x���ĵ��2"����SZc�#�\.t �,�1�z��N�=�Z���Ţ��C�A�s�S<r�r�Y3�?�h��9��"�~.Z櫺�!��{x����?o�������D��o���3�.l?���5���P��P�{�p��eP嗈	o�ze��J(���8�)�M���y=nx�B�����I��<��]@���M�ēQ�|��ŵ�b�c���ty2:?��[�bMDl'��[0�R[bd�,O�WH:�TD}
��rKG��B��.M�&zh�8�Q��2D����XFw�ɴMy9���>ln�L�������VÌ�	�7�]��������C�NAu��:A�6;���lk�/�!-�yQ&_�E#<gy��]��`��8	M�,X�F�pF�� l��p����N���5#S�V!�y4�u}w�ʆ��>8�KӉ�u��Vۛ\NO��w(S�$F�s���P��9����	��l^NyZ<H�6g��Mh��u:�����Mm Q������+4��\�-��(CĝPW�S���Q>��vz͑�(�H#o��	E�.�9�{/'f�'T�K�-[K4.H���c��7ga�p�����:X�%���*��wyQ�����K�6���>�A+�:�-֞���sI����A�$�|%��3���Ń�Ma����l��(�!�:fr��]�bD�6�8�ā��%�븼ù�B¼R���˻8�3���� +��gϳ/����>�f�袌�S��Jk�AN�l22��ő��N�X�uu�y�Aq�dX�̟���Q7�l�f���֤����P����[�C�P�p�	��F/��5��P���8�[�m�﷗Dk��ABކ�Kϋ�q{;����~,z���l�$��Y<uqR�R:��(���k����3�%C��&�xt,]nBX����-�4����[(�.k    $.3�}l�8@;8+M�a�K����m�G(k|����v�	_`��7��:�F�� ����{0�.�7`,�w�jN=��V��3��hE�)��݂�؊"0̮Y�ˌ) ���N��g/0�����碎o��*�t�u���/B�]�q=��/�=���ʼ����Q��?�ō�Y���{�=0���Z�.>��m��!��e�����k��c��Dz3��0ۡ����f�V>�-}ٽ����d�c��� G�EQ�F���&����<#֜�6ĭ���0�v�EU�7��L�����~q����Jͭ9թ&{�7��)�Ӧ�iS��⸸7_x��"癳@)�:-*Ҝ�R�{���7ܽh�ϓ���9�[g`���N�Τm�<L�(U5�q;Y!�M���jK�{��t�/+P��R���o
��Up��S��a]qY�=v�s�����x�sI�$���eU]�D�jx��Yk0��v�AR���g� ���Ri��T{[~�o�?~d�}�i+i���|�Hs)�O�ױP�	��T��.��+�8������|gFt��u/#�P.t$��뫮HJc2�%TT��V��$�tЈ�;���D������x&�G~D�h��~�#�@�_ eQ�ae"B���1 �?ݒ��,:<Pw2{�ٍ�*~����g�r0�\40�|�f���O�ĻĒ�x�3%�e�@2>��8�	��{�����5�:zj��AFM�,h��g�����k���B�J?�\bǚuC�@�3;^%ˮ�CKo7A'�2���s�~}$�gdb��Y~�0�Ю�k퇸��i�]N`6O><�}�?B����>�/X�X�8 r�|���#����<Ґc,��)7�ݰ�ԫOR����U�5����b�s�*("ա���(���'4�!Ws������j�Ջ�y�*2��U�s���F�W;�:+��{�e0C�#c�i
���K��S^��-�����;��q`�ޢ�e���k"�[������4�܁Q4����x�L�����Gޠ�!����/==.�u��?=�+1�8��~��7
�1�!�ph�S�%$M�����WVWȊ4���7���O{����?v��O�� 5b5���@9?��t�`�.0ga�1�"�0<rc_����q���[ca�����܅�}�̬��.�)k'�!���j�*�[��s�/!��9��~9�����y;��E<u��U��C��y��S���ֱ	0�{�O"a�i��9|�&:��M1� z/Q��CD�3�����*�O�{}|5��rx|�3�2~*�4�������.iA�y���3�y{6�MZf����8���WQ@Oj�t?��t�%:�F������ ���ߑ_�A�i2&B`�z�~����^��м�R/����aoPr����e�}�����Ӆ�.$Cy�t�n�H�<�=�H�7��2 ��y%5S�`1�;A_�Wm<�Z	E'�J�AD6j�x��yrRP�CCH
�����ҝ�F�i��I靺f�x�s�0"+�QW2�R��C掔)����w�^�E���W??$�����}#M����&喵�}�ǘ3�6�6���5�F��+i8���TRv#d1Y�j)C9$1�P�R�����?���c^�c�.����*�e�K: �I����x{���T���c*C������x��9h��E6ȱ,&���3�p���-Sx�!*��"Q�q'TR5�)͉.0B�J
���NL����j�"K�� !�����͜ �q�v!BI�;\5�h�ԎK�ێQ�VD�C�'2@Ҳ��Qks�� ������ؽ�rT1/|�i���Q��HJZ>������ܯ%"��(��݅��IzE`�g���&�E��a d���������Q����ܖ�L&�r�_̽�k��4��ohVuk(<����_��/;�b�N=0~p{�Y˖�Ҷ�jM�8��r4M��zIr�`�ɨ����wp7�7D����Z 0+HD�5�@��Vx���ӥ*2@� YG�+)(hCP���.������mw�o�Ѱ�'o�Y�������q��sYzJba�wb�,�,�>���0�b?m���p����쩣�������
�	D����ZrΟD@o�NxU��hԈrM?ҥ�������	����Q����+���=�[����1���/2�4\��������p�۷[�u�g䨲�v%���5p9./-륑L�:�QF9�ĥ�)���#m���pQ���*��G+�n4
�@�Q�l�kD�Ȩ�wArLe��v<lZ��.������VK�L�C*ڛ�Le������v=S��R�Q��]j��~z�Ɂ
 @J�<��q`���Pt��t��6�����T{�=�0�6�N��!�v���t�< �E�/ OZ1�)+]�ԇ��CX��C�I�u�9&o����7��j�Zٙv��Z���`c����zͽo����I�3 \H�AZ���A���rF�v�r�� �BS�(��@-�$���چ�Di+��`�ѕ�]HE�=W肰Db�`w}`M���Z���qf��p���lכ��ğ�;�	̯�p��Xh�	� ���7E%s����g�7��j��E� �td5<=^і���%6_L+���i}k8j<MB��g�@!�a���k���#태I�΋�ć��V	{�����˭Z\�$�� S�X���]u@I��,x��k]j��[�/�V\@ng�{E�����s����l���{M�d��I�r�2�$�ĕۗ�v͆�GϦ1N!�B�����L*_е��eYU��`<�������O�9�J  �2��=��R�T�aݐ,	F���eh��t,C�O޲
�-����m��;�Q��Y2��;+b�.z� �����.B2����(��E-�^��ɿѐ�rl�|No���Y߀��V�^�o��5����7I�G��W�ۍS��)&D��b<i�x[)���D��(��[���F8&^ch/_�OQ����t�ŏv�=�Md ��FBGqb��h�����$
�2NY�00���}�Y�oa{x�hyC@�����z���m�Ut������(� ؐS�8I��2QO��} i�pc! �	�0�&P �3pQ����{]��r0O����Lo�Eٻq�m2t�����hO��"gZ��94���=��?m&K{L�<4��=(A�\����XTo9�ac+A��u4���-��&�A��Y�þ`hx�'�K�"����i� ��F�1}C|U��P��e�ޏ�t^�&k�|��^�[G���~cC�s�ZR �����C<{���;��
��Ah��*@A�������&tU����.Z�u��	�3�at3�N8	 ��R��'�C�(R�r��r����8Q�E�������|�o��R��C��\YG�f@V�v&��p�֘- �?L�Ö�Z�C��h�f�0A�Mx���hB���-W�/h�ў�!�o�&T)�>�R���5Tu�B�kʰoW�o�mܾ]ү��{I@tCZ�^G;�&���c���,A����e�l.0���`�^Χ5 \�БPYg/�-�K�#x��V��M?o�I2����� t�g&8%���*φ�]򖏎���\^6�
��_?��r��}z��4�� �`RVǝ�&%HX]���|���l��X�v��r%vX�ԫ#���J�/ L���ި��vXD�K`	L�B���b��}�����aѹ&J�{��%�z�^�vad��J��.���%���4n,5
�G�j������\�� ��EY��0��N+�z��̨�quz�D�wk�e��3]��5��~~�:������:�E��?�KIӷъ��r|]11@�!��0��G\�����H��Of1h!H�����a���!���@,7���&cŐ�a����=E�͟�Q�3��+�y��wۅoϤ�nQ����R���*���n����C�(/ ` � �  �U-H7D�|GjG���'�ks�����)���
U�&*�>6>��ذ�O����Z����Y|2�8DX�2�S� �/�E0k��l���_�H*~\ܬw�B"���kB[�9逪Xr��wk��<xu; �sҹU��b��	���CʎV��!�#�4֍�t�U��eZ�
	��nd��x����CB�*��!�LX%���hֈY�P��j�d�����,�F�����tx�����/YI�W�̪��җI�d��8X-�#�6�-\.7�C�|�B�Z<V�9��$��Hd���go��j�H�D;Ӷ��Ӄ�8�>�-�xB]���ꠓ-��D\3}_����Oͩ?8��DrDw�Ň�k]X�����Ԭ�8i�0)I�f����|c8�
��O�#S�$���v�rmmo��?Ѫ`��$l'h������P��2%k}�G�ʝ�:���:��0���u���N��������P�.L�J�*� I�3?�ُF����J*��\3�*r�d�+O8(Q�5ƃ7ί6��F�#��F�	��K#!���NI�u4�[nDyww<�>�$�U�nOi�L:���#����a18�2J��Z��w��3j�O^Ar�.f��	L,��U�]o%������U�zj��Q�X`^+G���ܘQ^n>��q���4�	���ū�Q�����J����>��e�S�Ce���-��ԍ��s�q�~�����3��h��_�sҥ�~m�˿G��7���1� �g���^�gk���zk�נrR�JԯQ���a�e�;�=.�],�����twx�C�Yj&n>a�d3�׼�� ��H^߻���RH�Aʴ�u�RL5��Q#1�i5E��p��p�Н�Y�=����/W�
�L�dv:�R\x!̚X̬�hj(�ɖ�Ɩ�u[����5�5!�.�ܐA�2�k����:�bQށ�D�ڻ�E���]v��RW�����u`Ӯo��GB�wU#BKh����k܁Ks1��\��)�*���j�ּ�~�*�6�����E^�G��`�- `8���+�]��ҩ֩���UuY=P��8�&c�.W����x��v�7���Fpv�\U��C�7�7�v����_Jk�qtJ3��6@����L[��U��.�ӻ��ԥ�W������ҧ\3��-�N�y^��v>�
��q�����7�3WH�)�'�
"N��U��� 1��rp���?��t�ʑһ�u���a�AT3��_ú ��#��f��/��<��x>!-�
�HI!����z('ޅ��w�e����.��=K�Q|��_�A<��(=�~԰dE4̇_�hG�'���t��Z~�e5E��
4H>\�g�pt����ć���ڝ]ۛ�	�Cy��;���w��Ty��j�r���NP�P4��.?��X3)m�!n����5�@?��P2�@v�f"r@+�{]$ l��������1 =��!�*�4d�֭���~s2k��. z7��[^��M�2�	�ĺ�n�	��u�~��#��۶YF:�}w�˱v��YA|���eI8S�z~=��k��`2�Z�MN�T���"�A�-n�����,�BW�"�|��o,v��fB�d���g����<�; WG�F}�:.��CqA0Ik��V>�/��YiF�t���׹��|Jm����������w�"����AFA���(����1�T�ˀ��H�uh�(�!����= 
q�����%�:�<�<��""I���୵��Њ�������Vq35T������eX�Ru<?����t(�>c���Q��zȭ����E�8����6IM�C~Tz1�^!y�f���o����_�v�.3 y�j���f���^r���� Uo�3E��.��|���
]k�t�D�G���*a�	FVP5���.�~���`⽷��W��z'>��c4@��>�zd #��Wt�ԉ�>#��_/��(pL���n�1�"q�9a.Ks���1��p�iD;�3NЭ��6�e�2��<+�"}��o�l�-*~@���	��W4�%���|+j�	��i!��|@�P�Ǘ�f�hn+f�U$�u�}���&�öb�ج�ٷ�q�m�l0v����*�P$��̐����$�c9���M�;�f��$�S�E�\�����g�CwvVq�Ի�hįYl���l��E�,�p���
�Ė1�J��V�x-4F|`�+ŭ��=��7�Ֆo�d~e~�֬!�O�X������̦�H1^P�3�(*nAx�n[,U'
�d����w݉7Tɏnk&5�*P:t�L��m"8����F��I%�w.Ѿ��BL�D�MO���<
EF�^�Z�U<�Ȝѓ��d(?݄�-�L�r�zᒯ� ��r���#���n��p��_��"� �7?�_�,���G��0U1� �;��ƠI�CRT7��\ߺ����������S�A4Gxt�(�قQ�g��UD{xi�J�H��4��+���̘kf���=�c��̥"�_3�#h����h�qB��ը�g�Cj �1E>�u�+1TT��9R%�	�V�V��*��x������h"DN��T��ȅ�F�B�N��cM��2O����Љ�(1"Wk�jZ�06�r�qE
%'���(%M`Ғ���x����&0�'��[8�^N�� /A�9^�N��J�Fk�ݺ��/�)���e�h-~J;TC� |��0[1�5�D	��G,'���<����o���"_�ǫ�%$�?� V�eD
mɣ14u��:�U�!�~�N@�
|Z���(E@�e �?�B>�5+�� ���D��� 0��+��R�g,U ������5<�Щ2�rbxu*�)�H�dC	� �K��JsV���x�Q)�g���;�*3~�F=�G%i4�%I�֪������({����0�w`�Ɩ�B�i��_�����\(TfG�3N��ӵ1/*�������kz#�\�A��=W$��5[z�XB�u�;�*�^Vԋ���:��(Z$,���̅m)
ߘ���R9.������~T�(pZ�?�6)�G^���i�G%ܤ�B�o�]�J��\a�������WȆm�'H�'ny=�Qd9�y��anOψPhѮK��e��"�\�O���eRI��0���A��%-"�O��ׁS�� ,��kX���+�'2�����\�+�2.�_��1��Y�5�v��'˵A�g丂:��rK�.<�|�(��O e" KXB+�2`���������;�L      u   Q  x���=n�0���� ��'d�"HEp���K�(��J��V��X.֗��X�-�����	 ��κ�ٝ�Z��Y_�?iض,+  ń**D�
A�� hN�B	ph�t�bݩ.$l�ñk)}��������1l��p�Q.8�$^%�]��M���N�0󶤞Zf�f+罻��B)#!������;lw�
Pj+��#����RK���U��Ui�c�H�%��˙��K��r���-!�-@�&݅p�u�##mB�ƀ����6�l�|�v��Ԗ����d1w *I��@�+Z����$?�w.�'!��fW�\c)I"��G.�H
�
D�A��ܑ�      m      x����_�u������ 	Ƒ�~a0�R[! �=$e��A]3Jlɑ(ēG�ט�oU��(K�Q��s�T���ZU�v��=܃_=y���n�;c�C�������w��ߟ����^~��~� ����W��;^!=��xF¼�%t�w]���5�����F�w5΢k���G�Ϟ?z����7�x�����ן�<����g����}����>��}���~��~z������>�{���>����ͣg��>x���G�~z�����=}z����Ϟ>z������_�>�𖷹˧O���ݳG7�7=�������G|��ۛ��)�9��e���û�?����������6-���ӧj���4���'�>����g7|�Ooo�<z�������>��G�޻���_�\w7��<���O���?yt��G4�oo�����'������\��O?�Sc����gϞ�>��h�G�>����}����O��[O���)7�����ϟ�!���=���w�k>p�[j��S>yt��ݳۛOi���^����c����N{>���>9W}����^�٣g|�ƻ��}�G�}���W_����=���O�����ON;����?�S�_�i���o~q��&�|��~��<�ݫs�o���A�{zߵ�����|�?���q�%�yȃ��Oo�ߩ�h,���|��p-��ٳ�?{��E�����H~�铏�����������a�}�K������G���A}t���#5�g��y���G�/<:�F�}B���tw��G��Ø1��ޏ����w����K}����۟�>�!c��>��-V�鍆���_}J��������n����!\��ze��=~��Y�2���yv���㻏��9����Q���_>ʣo���76=�-�����~�;�	!$7�u�'�\�����4|ݦy��N.5~~�F�i��C*���?�T�������7n��*��_�e�Cv�j��R�o��f\�ք8m}-7bq+��]�Ŷ�Y�/���6�QMpy۝c\�%�{�<I�q9��%yڼcm�V���%��#e��{�ٷ�&�RbN-X7C��vk�}�e���ߵzH�N�f���M�����v{7zf��h�4���
o>��k���^���e�/��������x��؂��W�~h�V�%�4l�9Ǽ���:�\ͅ�Uf�{x��Ԝ\)�O���M>�N�Z��Fww��k�af ��Ֆ5�\�+�XRYy���iz�̑n�+���͆�;�N�ۚ�YŤ6R)����Z:R�������c�0�Σc�~X�k�vȓv�S�o��瑲�>��x��)�f7S^���5f/��a�E��b�<wr>c���2"�J��\�W:~KMƌW�r��uq�K7�pmW��ʻƌ�6c}���Hsn��k��O+��k\�~7ǓV���۶]k�\̭�MٽbqÐxPaWW�	~2��j�/��M'%F*o��N�w�y�IOcW��vπD��\�ӣ���Ca�J�8�s�����\p��M]<T��M ɤWھ���Ʀ��W����v��+����st��A��]j1�����Vc����P��Y��0�_��!��h+=[G[���A�ȸaUѕHϤ^�ya�@e��%���`Y��kf��Hb |���_e��2���p�d�x���615[@�\�\7��mj��c�����x��lS�6K)��Zv�x^�@W^;�3��s��kjV���󅾊â��vY���P��lK�-ƍ�Bdpx1\�f���!�-����r=��[��k�1"и���G�1`�ڮ�(�d�Υ�h�G����	y���'�Ӏ���\|��P:��#�T���x���h OJ[�ASA  ���0�<���{��ic�Ҋ��
�<��g��P��k�������)������̽�4;�?�d�}� �m:�����᭞C���z c�t�\_`)�0�P^����J����yvgCM+;�`���S�O	-�UK�6:�,��^�0���HmcO��Ml'G l����Ӣ�&?ʬ{ �	8fXԖ�K0@1]��T�'��Y��4��c�Ç4�U� 效��0�y�hu��uۈ����5�˩�4��x�A"�E6g�2���Ε(F|$܌�eSͩ�w���Cq3B6��j Q'`B�=ò9v�V��7��xO���T��P�·�f��,��r#�O�s���]��Ԫ�1 I�u� ��0@MQG���#A�~;W��3a�#�4��Uw*r1z�GP���'5�3�X8���x��.�hELm�����A�@ls��-�pfo��`)�8S#L�ц�Nl��k#����*�^��ቅ�\*�V�d��5p#�t��H�J���l��+�,��������K��y���i w�P�9�x����к]s���@�:<FM/W�=��O1���4��G| '�;��#�F�|�B׸"����"	��tVZ5zBt�k���(�C!źB���� �V��U�n����p!���&M���x��x^�&���<oʔa�g�f���/�鬶am�n�"��̊�[��v��O��@�l3��K�g$�
��E��Zup���7c���z<�
a�I�q"<R�Q� >D-$���I��Gp��;->�*>��<A�X�ј�������U�>	1 3``�\Ɛ秕0��ր׃�>�MĀF�S�"�FՖ��m��i����m
o�aﻕWD��*���ׂ	�;*�Ȩ� ~���CJ�3*2MƜ߁�	�qt䬠&�ϝ1����g�>�Ɩ�O\��Jp����^��CXvX� ��o�ǌ<��L�X����=���"Ï�;��P�-�Yq_��0$L�m/�������8q�FlE����4����C��B+`� �7=����Fr(,(,4 �m�����Y�u2��8��
��� ����aF�f��"ly<��ФZ�t�^b`5L'V���LD�[��I�㊞EUm�. �F�Ί��AbW���@���F��3��m�/��E�$��z�݀�V.1\0>G F<p��A%� מf�Q�W�3B�j�8W%��p��PS�mc��xxn�x�E�@	���`��k�~��P�Ȅ՜F{I��8��l�� �v�r<�O�n�k�*�ן���^���I��l�E�@&Qf�s��r��vxc���l��0����� e,��1~&0I�ts�/�&VA��D� ��w����e7��/v!��T�k���.��q���X�Lx2�R"k̈�L��1����\P)���.kP��!$���&�� L0^C��$��Z�� 4�	4؉�NG�<�?�%C�<���	�� �4GF?H�HĻQ/��F�%|��1�r@#��?ۚq��.���wkk���M)Mz�]����xԞ���ϩ'�!%\��8Td;C�{��:����|6-�����P���@*�Ģ�b�5�o���/�^���:ď`��-v`,DL�5$�xq����a*��
o��є��Bx�7z&D3:0M ��h5�GL�;,��Է�.�$ܜȚ�8�,9���h�a�s�������N8}��f]?���i�;0*5U�)s�6Ң�H	ۑ6�/���x�B�h� &A���NDQq���:�g�o�-P�4���  "�h��t�X��EB�s籸�a-|4*���e1$�v-q|6��4�����$k�ѫ)K��/�ߐp�c����#�H6��G�3X*Ȋ����A�*Z�#@�Bo��� �k�ƨ7��Ӗ2�-�L���}(.´�P' "�f/�����E�ŗn�C'�4?Z�y�Ā�w:�
��m�+���|���	JnX$,�OUA��L�@iwǢ�n	^ͷ����h�*�-��7�?� ]B��KFv�1� ��,q�N�h����8*X�    �P)B�tIps;��x`�Y���~��A�� �V������'1Uig@�V$A����HP�cm�(�"�]�:� �:5��t@�i������4.xU�	���8��Д����}d,![��]|G��O@,#b�3 �Z�Ӂxu��>�ƕ�஖8a��GC��*σu͇�\��p��7_urF����R�c�s�8b�1P5��FԖ%)S�us)_��Q�!v� �Z��9OQ�e����UzK�5���hїH:���\&�B����kDg����ziي �U�~��1�l5�f�:	��G��Q�u� ^��q8�BuC�X �
9�z�T�\7�M�F��H��'��j��J: � e�|�׈�=�89Mn�����*^Z��1-�
ӑUb�A�p�[�tSw�9��U�.F��n ��"�)f��;]=hګ���-�M!�S� �Pmp��"��+���G��YtJ�k�;<��F����Ү���-X�@� ���g�H�F<۴�A�&Q�Z5�	�e�)x&T�+ H5A�	�I�-X	� �1 
t�K���q'�h`O(l@#Z�A@?K�&�.��è	b�NMU!��F~p?BęP@�0O�R����
��5p��,��A��3����\�e��i
Y��@�q[t���]�Q(Y�X����"w�V֖p݅�����@���h��IR�Ua7�7��!�Iq���y8P;3�"f��~z/�#N�]:>��epǙ���TXJX�tq �K]�W�����v0̥������(��^��@���32� 	9���oB��3(@�"�&�"����}C=,��o
��C2*�\��6�������aH
4�b��f��;E�i%f��ҋ&��<�%�[<�F�N�Ib akgKs��L��H@��o0���`�K��赥�k���O;���iї�9*(o��	Q:\�ik���d81DZ
	�Z������4�VN�4c9w[ą�AX��Cd������wx.z��5������4)��_�(��V3!�<QG��( C�ju�4��V�h���ڙhL(��s�0!"� ��$����7䦢��p�
�]GE���W�!tm�7��C���	'�f��J�+��#�BK�/�,�<R���v=| #�H�~,["L',w��uY�&�4'5�a�;��)t�h�!�0�M�����Eɢ:��˪#���1�`WI3�S�<%���b������#H�M�l4�Ht0^�<��x1���J/�D���@�pՊ�!�55��=�EJ'�^b!��
dD�`g�a���P(�Td҄Z�*σ����t?:�P�gK��s*�Z����F$���i�P�L����j��Is4K���#+�Rn��|��u�f0!�E��,��)��P�l^���EQD�X�x�Ԕ Av[Y�5[ie��g��x�8+GIҫ�P��&ab�
G,zC�5���:��9(��%@�c�a��Ht�_��7����M�U�$�*]7�6��8hIp= �g@��1�Q�'lv�W��r�_�Hۥ��i9)�"��"^`͐z82���NPug¤�Q5�s��0L���HT��j�;jI�k1W�� �;��<�lg(��(��֒&Fl	�K���$�k{A7M�� ���՘22$�tl��h/� �ҢZ�E�TMQv-d���(![�24������z3~��/A�R��D��ac#u�R�����@X�@X�>G�
��Π*���@��'�w����qi��`�� Q��ϸ�&r>��a���ț-���Z�������u�� 1I9M]��D� �^h{�Q�\
D��+ \�$��A�]8��@�Fp���y�.�%�z�ԇ�=PH=#��!ptsx���%"��k�����W�p� i�( N͢ˀI�Ūi��؜�lT�/n��Aғ�ϐ��6�Ol��dB�h]o׌���kPr�z$�M`}pb�`�9�",�7��V������d��h��'.�l����e�����3�jp-��Y�@T$�����H-\��3b���B2K�݂�(X{?O_���ia6xNB�kY}hu�]V29��c#L�1�Љ����L���Z��0~�D�ǉ�y!�`��<
�L�VY,��x�"��6�h[�lk��Kl��)�"��NM7#� f�e2�!!i�fo-ÇE�Zo�����q���~�'�����k6'�aG�U��%�q<�(��͹w���.�W� ����s2x�>���� 7��iE2�^�����U����K����<EP�?�8'��Sx��Yժ"�����~����!�+[=����굗O��W!x#l�Q�;/���WfR�Q=^^~�U�OS�'-��o��O���Dy�,)�5O�N�j�|C�4�T� T�e�@@�R�03�yZs�I�܇�i�ZIR�4bf������x��� 8 �%2���G`�-�� �;�%�zH�@����D�@�<BB�L}]�i���KT�2�"4�i�������4t�/-�l4��Z�������.�EV2!�{B��)/��ih�7:�P)(� �@��V<*hM��i82xÔ���Z��Ԓ�NjN�b�\�*�x=-֙���~��I��Y$z� ���Jx�k^��0�Ob#�r��ȷ������l�:�~�ϸ,Y��g����7�y'�ީ�x\���ʶ�|�|��W5��OzdN�����t��^����8����C5�
�z������C��W��7[��=��N�b}������˾6���e;	�Iv�F�ꕓ)�'8��z�����h�̯~:�u߆�M�ft�/�䄢�����:�Iv`_���'��'��ӕ����UvùKQ:�S�\�k��s��H���Y=������{�Mg}!�n9�]��z�X@:cc�ġb�3�����N8�~����ܫ���oף<f��;6�{�����Y��g��U�\���{��i�k��!�����o�?x�輵��M_|ۢ����(Z-v�D���v�mM�6%=в�Ʒ��-fPK?�v�9W���}7�����=����`�tz:��qw�N'Y�������o�+����w�޽q����\?��\z��w�~�=����m^[���������S����[�B����;ה��þ��Rq���u����.H��
��Z���6���ݷY�&��|�s�p����|� ���鏽G���2Oˏ~N#m���\J����,o����ǿ�[<���y����[}�����|��~�s�����\�G�î�{�0>I��{�:����{�ro��������W� 7�A��X-�x
D� �<�����5ѤA:#ñ�������F_y�?<H���1��0���;Xo���)p�|��qmy���;8���(p� �-]��ZP�����tڨ8ݙ�A���{qP��s��B��c/�>*��K�L�%���;�Ug��!�����lh!X�S�f�ҪZ7D�jy\�zE{j4+���Z�uY���#���i�-�x�M���}_�BS��U��M �ӶX�?��(��vϑ��H�(�tJж1�C�,��@�%�j:8�����`u(�ЗՌ����w�`��j�{��(���{�g��V�r�kgFí��]S��!N���vc�ƾ��U��Fe�`��CY#y��J�(���M0�-)����ȣ�:}�Uל��E��V9�� ~��,�E� .C?���,��Pt���U��$.T�A6hܓ���d�Q�{�Y�km����o�F)��Z;ƙ|�A���,LF�N|О�ǈkk�o������]U�1��
�\J=)n���� Y=5�o��eV�~�d�P�଒�T�G���n�W2�j	w�1#Ƴ��ƝU�>v���������b�_�%%;O����r���59�Ii�{��6�iD-�i��n����i���C���.�JK�d�>���42����6�y���ڒ2Ѥ�\L#kOAL27[�'`�j�2V    �u�hmA�"�Q�+��+'��(k���0��QpPߴ�F�2�+}�U�l@K���ksPP;�@}ۢ<�pD��vR�s��'&�M�J'Gg{�j�A9zJb 4ȸ��%�k����v���0~bO�*�O3�*�,��y0qmeOmy�J�qX�VݰQ,�Tz��-ma�Z}t����$�hbbNe#B[����[�X�:n�5�Z�}�_S�'ɪۇW��:����{��} ��Z�t~@6��*!W���m�;-�)떡Y$x��k�� ��lu�-���5�6��h�Ы�DZ��>0B��Ƚ�搋�#j��L<�F���8��L����&ҧߠ ���&m�Z��xD�G�fh֤����i4��A��ƙ5�	V���Fo��N���g0Si�	�pS���]����H��$E��c^-5��"�=8-�k~1��Z0����V$iK�e��z��j��Bl�'ݗqȠ�S4\��Jj��k9��K+���G{�*[Ai�F�{g�f�[���aE�E���M<)��tpJ�D9%SZ�C:��lT�D��?�W��22���.�r��R|�_^�ظ���e��:�J3`w*g�?��΂�.%�X�NJ�SU+o cf�����86�Fh��~�41�ؕ��Z��Dծq�MP৛��P�$�l�[�J��d���x6c]���VzkAW���P���3�"k}\��ڎ�5۠��g�h�����<S�-���^�w;����C)��*�̵���2]U�C��V�ПSIIm��hc'`Nh�'�8������d��7%B���瑊vU�rkK˛pw�R�7#����j�H֝i���n�9��Ƃ+�<����N��Z�R�m'�30���w8���3�'�F;_ |�����x�E6������b{���ܵI8�6瀯����.�4�n��l�&3���f٪F�-�D'l��f��j�JX�����і״�T��Ud�@��^W*j�\qPZ��N���!�\���mE.e��<���m4�u�CĐ��t/"t�1 /�+�Fz[��P*Hm�JM[f)M �훈�:LR��#h�,�����|�b�[3E�,�q[��@')OC�"�Ly䐆��f{�p-q�,+(�!��}�h-�gcUN4_Y���|٣j��D�M'4ɞx��"�	�݁�#��Z)���ye����R��V"O�+8���V}ĳ����V�Ѣv�.����,�
�i�|��>;m��kk3v�v�EЭ^�cXd�'SUh27|�
э�������h�.���'/��Y�5�(Ky��x�\dH��0�H��^�ݚ"\оhc҆ ��ZJ��>0KFA��ڳI�&ز=�vC��l٠���4�W��35��iTR/<�����D����7]YhS���6Leh�2W���^�:��������6�b��]%�ح����G�a�{���É��zm6���pt�mKwɲ��+1�x뢻���{��߳+J�E��T�2P ����=7� �W^,���WЕ��Ap��H�y�X��hq���k��29�e��:|T͆ЇڈrR[�E�@��R\�6`�1���7,�h�AtD�`]�ǫ$��7ܱj_t�h�w�J.�@���S�X!�MT�n�ܕYڵ�-a��J�R`����E�d~ a� |�"��v�"���TU@�ɴ�4t�X����$@�Y\-���ޅ�A�#��îy/#�����)u� ګ�\E�Y[���J$��5 |
V�P(J�
w��T�C��S��T�@�v<We!D����:MҠ�PNQ�&ϟ9#��F<̙��x�,��&�����J3�&g��t�\\J4�uAv!�B_TY<��O1��`��,�L�W�HF��c�X��A$e�5��Y�Q�6�0��X�����zD�@A:�Y��q9ߵ�H��=�e:����B֚���I����<�*� �V;B�a�P�1 ^��oߤ���"�ơ�B���B�H|.r"#��k�U��:z��Ԫ�R��r��qe�#���y ��n�r�cd�O �`��d\-�]��sE�#1�v�EP4��'$�O�oJ-5�Ǟڨ�.IK�]��DL�H~xmY��f�l�$�Κ ��G%�).��(���O�\�8Ҍn�$��G�Si�g<���
CsD�v/@i�h�MJ����1���	+�]���T:փm"400h����"@O�����Ax[��ycj��ͪDuG�k��`���JQw"|p/ Qk��`����p�k#o�V�8j�fh�jTI��7����v:1��G������CV7ՙ�V� DY�<�v�	M�yJ�#�ѧ��'�D# ���4s�H��_���s�@ s�P^B����F���-Jm�)�	�z�Y��$5�"�M�N�&���V#�X.e�'y�6����o'>
�/<E	�(�d�R�6�*�Ӭ+�ȟ�Ͳ�y�tt��%���K�
��M3�����R�Rc�Uj�eD�2_�eC�H��Ɗҩb`���%Q1�"��~���E4L:9b�zvi'�B�k��{��%Ԃ�\��<ѲqOY<4��bT!BjvM��;zk npw�%^��#`DE�� `�+���Uv�C{�`�<� 		F�%�)���TT��$��`�ш�IUv���)��h`���5M�arAc*���Oڹ���-MB���CE���0PǸ�v�XmF����m���Hz�f�����@`���)5�	��`����8�f�XO	��j������Zo�L�^ʹ6IE"¡�j*Kd�JB3�'C�Bϒ�˅��4%�'+�E��	�v��H�՗
�8Q3̫��=�"�F,	�v��۽�u���#(�mRZE�1�6B����FMU�aYEC���P�C���`U��������@��.���9sm�?�ϜrozE����է��rH3�ڱ�l���rK�r��vqFu}�>���{́[8D���y��d��;҆l����F���h)9S�EV����k��+�\e��W�,pW�N�bHn7��2���%�`@j��>=%��̃��'UkY�h�F6�q����*6fr(����@��3D�NQ��U��!FC��F�6��7�n���\��hY�'9�`�9m6@�B���|�a�x�����FCq��p�U�m�\�iV�2��;�y6%�*���b����қ�[�N\�"�!ִAT�T?��‾ȝ��[E`b�:>5o��(ӈZS��P���s*�E���6�����y����d!��*.j�(����a	ґ��ִf#�xU���99S��K�����Zn1Q0U�S<y�D^�X&i��
���ڽ6��v�l�f�	��0`9F�xDm�Eb��v����|���7��|bZhO"�2n�0�P��3IM�� `�j�tU-�\hz2���.�kV�(a��	�':h+N@߫�I��5���%���
�-Tv�Z܃~k�T0��Ɯ���2<����i���Ú����
o�K+�ڶ"M�-��<��Țk�� �D^\#�v#F�@�5�
C��OBLJ=���RZZ�o*sB��{�H�j�<�~&Ղ����5NU�d ?"Q�ic��?}N�_P��qL_�����~+�T���zJ�u���h�l�4z���~��V���[8`��yyh�Tg���S�vp$�*�J5�č;�<V揿�ZU��0��CC応f��	Ϊd!gW��*�̻�T�Qq��\�D3扠Z������4����R��TqA��wMhg�j~8Q�Sbkj��v,:^et�����9>�o�S�N�Zn��F<`�[[�!��1�����7L������Im�V9ɀ� ��,��Am$3���]��KՂ�I[���'�c+1�is;k&ꨭ�V;�U� ���3Z�{�7�7�t}r�N����} �TmA���bۚJ�h�Z�
�M�i�=D�� kyD�������_��U5�G�gi�UU#C�a�    ��U�*:�K4�W%�1]�I8��l�
'����QR>&9����h��X�H)$��%T'kG`[�1%�I�0�C5�2vhb�@T�E 
�&�ɕ�253�h�j{D�M�4J3jֱ���)ц:W-#-��>�s@;��
�:��OV�; j7�ҏ1E�����
xi� �uZ|+�|�/m��Q�GM��[|5���+�f�V�rpC��,t��]+(�&�k��Ut���%ԉ�8r�����*�c<�n �j'j7���x���YמJq���^�J�$"�AЌ���pV���������>pl �F�7r=�'*+�[IԴG�J���=�GW,�O���(��=<������#�Y��/�FNE�;j�"߄�u��٪=�Z���&��6w*ζζ~xf����(*^k��FI[U�&�</�$���_R�u�F����;T��j���C�������nMfW��� �O]�fi��?{�!�Q��UV�ɪjo�Ár��Ɩ2֮:T �-%-OU�Q�@���;F���N�l�L�h[���A�Vr��۩D�Nz�M��X�N{���^Jimc6�p�`8�슆�h/ʁ����B��#nise�+X\1ZN�n�Y������ph�����Q�}��@��|��P��d�`�@�6�,-7(�s�UF���aC(m[kܲ��f��F� ����Մ�SL�DR9A�H������E�$�@j�}TŨٞ�=�b��DeS���(K���ޚj�¨�${��e08�\I��h)�<���ѶA"{qM�@3 ��_A�`�fUR�#?0�P����B�R@�Ec��*Šba�0��=9��U�E�K���l����i�*\ҁg~G�4BR�,:1�]� ��i��8y������y�v!WO9X��xpW�;�Y,��u�,/�[r��QH��,�,j��e�P��f텯 �V!zӺb���>%L/Z{"@��������
wjm_��&���I�-yiNC�]c�V��5� �����"��Z��gU�
�d4߭\�f�2��k��ьdg��+���6j���k+C�s��t)��U���Ţڱ|�����m�[3j�U��~��v�D���%��bӴ}��ϭ�����6��Vq�jΪJ$��ô�7�0�>#fm��R�� vc�%TKʯ\��iA�0�8�����]��g%�cpUsH)ɚKP*#�!�"l�BA{x�T�V´�N����zjׅR��ȯ#*(,a�*H,`�}Z�|��5NI�:�PhM��`�0��[I.���DG)^��r���T�N�խ.�iM�m�%�F��z3he�8��48�l���&�TtK;�+T"�,�Ҫž�\�?m�fq��Z��O���V�.3MP�.`�N�*d�U�ɋ�� ��s�$V,0i�`�/��t�=�îs����!�C����&�Ѩ�lo��]�2=�g�9�}:���A\*�2@8��WUU�T�@�nEG���_R��j	�P��8�R(eu�
�(��
@5k��h�$�V�״'�CŶ��r#Uz�haH�vps*k�Ѫ����nUr�I@�xkZ���D�
��Iqj���m_k�o��8+�C�V�+!�$y�g6��|�[U��H�R�<q���-m$ڡO�B���AរH�pOZCU��|D!�L����r��:�W���ɣ⽪�*����U,w����zIW�3��@F��S��(-j���PaŴ��w"p6��U:X���p؈L� ���(5y$X�EZK�Q��ZuT�r�Z�{�0��~����md����g�Y _��5Fȉ���	��pS�A+�KK�ED@N䚃ѪX�-�����h�F�^E�Z�E�[��c����X;�_�FUҏt�䛌���0k�sS��#Hi��*�'ƙ]��Դj��n������	��
�֔lT���CR��n����e�B|z_9 A3K�k�O�7g���jR�<���j�Ѷ��R���z�s�7<K'	x-�	2C��R�ˠ5�M3�Uɚ�&�|,���[�)E��U9�j�W+�8-cXL���|%{F�h'��F!�W��)e��qxv���X �Z�)sP�6I&�t�9^�RV\�L�64a�x'x�UJ3*%yԽ8��THF��|
�Q��
�Ԃ�kM>�jMz�X��]i�x�nj��49�%��t (ar��j��0��V�7��6"լz�q��@P��
��b���4���C�`�~U���P�0����2V�U�z��F��ǿUf�kX�������5������OId���Z��	QUj@]� �,���(�P_�Uu�tO8�jDv��h��^�����!��5ע����~��XU�Q����x�O�PI�ڥIP9��^���8$�2��UjL�O����d�rH�S6^W|:H��'�Q9`����+�֎�� =�eU���̺
v[	(���dt%@�^���
G�|�������6hI*u�,N�O��Ҥ�u�,�6M�ԡN�R9�T���my����4i++��U�����*X��щ�jo�4����uK-���ѤF�fwU�5�p�*�ʾ��2M���ݦ��WM5Ă�.!��� Ω��=hz%
BIT�N ��U�Z���	B@�h3T���!�DARe��Q1�3)��n%C���:B'J�D��׵'SZMoq��U[[ä�m15CKbرj�zM-)�@���{���UiN?E�t����W�@��PY'n#�R6�K0F��� ���B�.UD}` �4�S��/\W좭*-���t����M���d�����w �S	*A\Uz	�R�y-����N)ƻ�6U�q*�����e�ҥݬK9䧎�2�O�H�^���U[%,��HB�HC�Ӥr�Ut8,Y\�����Dk��0[t,2�m�J���������X@�,�YoC"�uʬ�G{����=���!bY�-}oe U�HV��/�vJ�@%�
��
 +W-�0pW�Vm\�/�����)(��∑Qi�'2"��&��8��S��K�jw��=cV�L]��}����>����bS���/(g�X�yZ�G[����M�{�CH�f-j*G2u��N"�^SDF%?�N��(KU�Lt�:[�\���4E�S)m��y��b�y�0t�UQ�^\ �JaWy�͐iu���9�����Γ͢y��ZUn��s��:;D�֨M,VI�]x�R��l�Ld������2X����%��*��45�-����C�kƕi�NC7Ve!��H�j�%V��f޾r�wk������ib���4�3�㾿8U�
�?���J��*��n�)� F�vPU+Z���+�X�/��hfUK*�|S'� #�~��ҜPFԙ�ԃ������1t|�Ѝ"O[�(�z���ǭ��ݩ��Q;�������:�hV{Κa���*PE�m��j���'A�D|Y�QI9@.�E�X9��Z��bU�^�.V��Z�к	B�т�V� د[l�p�r�KgA�pNc�ߪ5'�U��Wh�U�T���:mST�b��.r/��Z)Q�*���6�s�]����ш��Q�n���-h;W]�£�W�6ڰI;��P��zW�^G A�eoe&zi�U>�m��zU����i��k�"�-#��HI���$F�
x^s�ij�ؗ��CUU��:�I�>L�����?��D����W��R����^}�k���_]����/�wUo���\�[��-W����-z��/\��޶ߦ���Vo�s���$��[T[��Y?~=�Tz�*4�\y�j0�<~�}�u,����1��>WTp�-�OuE~������/T��h(UTQՓ_�=I�
?]���
�y���pV%5?��z�;_�ǫ�h&�� s����*��:,��*�.����GH��?k��zK9�}�z��>�}�s?��_���_�/?��}�ů?��h�}��~��__����/���v3�M{�>���f}��7k6�}�k��<><��]������݃���?����ŋ�~���������_��>���������n O  _���|�x����������������?�ko��<��{n�}��CS���/����ߖ��_�7�{_��ޱu������-��6����o��+���o~��]R7�sO�����6<���_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_����n��������][̮-f��+[̮¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯��c�4����׮�r~Uo���\�[��-��?W����������7�9���:N��������/Ov�Ω��c~u����j2����������������������������������������������������������������������������������������������������������������.��d��d��d��d�koе7��t���^�]';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';_';�Ǩir��|��|����]S�:����rUo���\�[����-������������o����o��Xf�0��ν:���g9��׾��pc�Co����x�ۯ�����������g���_������/�{�����W)n~�~����_��|��h[��u�����g����w7�m����u��/���v3���_���������~�n�W��^���g��_��71>t��|�G|a���������G4����z�'?����w��      o   �   x���9!�ھ�֜%5'��D Ϡ E��7��c*���>B���1:@�I�>`�"���`�"�b��L;�o�m�a[�N��u ��-柄~��oQ/�X�`1��PL��;�Ϸ0B�L0�v�Y��U�Q��Ͳ:�z ��3c      s   M   x�3��s����w�q�4�2�t�p�uUpqUrt�ˀč9C\}\����C}B�=C=C���F\1z\\\ �=!      z      x������ � �      w   u  x�]�=n�0��7��	����SҊ"$�bBt�fb	[4(��m����t���f���y�QAi�v�:��K��#D�@���_�!�Z��Y8O�T@�����g`Z@�ʎ�4�=�Bc�p��s�I����p�/�/�f.y��3�t����������Z�=��LW�27G��6Ĭ�ч.;��5�Q.PP
�m���^b�Y���H��IY������bZB����=�c�Z�0xx�C�Ƙ=v�.�V0�G5�����i�B�ޢ�a�HB9�F�[V�7��Qܣ�d���a�sv9��.ı��Gj�\��7B��lc�>ߎ�ß��B�$�s��P��+��%栜�<r�P$�M���k2Ǘc��;"��r�X      ~   N   x�]���0�7Taa8ȅH-�_�����B�K�#�s���4�3+�5$!�Z�h��Q�1)��7�A+��ot��ވ�      |      x�3�4�4�b i�i$M�lc�=... 4>p      q   �
  x�՝Mn7��ӧ�4�&��`���?@�(�p,#�O�#�b陦�� Y�H  p!�|iU�"Y%;�޼�������??��jw��ݗۛ?�|������������O�}����f��כ�n.�ﰣu�c��n�O�q��13���W�/���}�������t����g����1�tk�v�}|58��[v�rL�<>�� �+~�K�OvO7#��#�1#�[�tE�-���0:�ʼ��y7�P��[c�����Ȼ}L�w�����>&Ȼ���&&�&Y��j%!1Q��j%�1A�Y`%3��c:�D�d�Qcs�V��+Y`V�����3q��J�U@8~+��p����Xo�Y78\%�$4֛w�W��up�w� ���p���Е{w�̓�U2J��5��U���-P�X��s��}����n���˷���<��v7�㏲�y�[?f�g܍Ä�tZ�hL���I���B��:8I�$$&Z� 7'�Y�x�B�7'��;/�;����-�1ɳ���ѳ�b�g�Z®$��d�	�Y�R�I���-�=JQr��dQ���j��?ـR����$jP�Ĝ��yP�Ĝ��ypj��$����$y�ScJBb��é1%�1IޡV�9	�I�W+�=b�wF�w�Z��CL�w�Z�
#k�	�n��
WY[L�w3�P(�.?�
���=�P�2P�蠇�j�|�2P���s���F�w+,�6:��[eQ6�-@{�ʢl��ڻe��E_�X�j���� �1c�^jA_�X��Z�3�o���� }c�Ōz�}1#B/��/fD��Ō�Ԃ���q^�-�r�v㙪������@���ˁ7���{;D�e%����>����J���<;ƟF��1��3Bώ��f4��_�^^_<��x{����C� ��:71��P݆j�P=�$�N����f	꤆:3�����1'Aj��A�$��j� �P5�B&�D5�B&��Q�P�I� F�ZyF�L�R��x��j��20J%�3���VJ%�3���VJ% 0�U�VJ% 0�U�VJ% 0�U��VV���Ya�J% 0
d
`�J@` ���mX*\�Z�iCU۰T�u��J�
z�8�*U+�ㄪT�S�\o�J�j�u鄪�a�p��P�ކ�x��M焪T��w��R���+	Um����P����zB��[�U���P��V�+�	U�ZA-�jT� Uu������<�Q�8f�w�����W۰�Z�}�2��چ�Ԫ�K�ꤷa-��hioD�۰Z�}y4��mXq>І������맯_������św�������Jޓ������ˡ����z:t�b�ڟ�xҝ����>t����I�g�.�t��%��Ѕ�b�'�]>�>uޠ�x�B���'=�K^`t�{���Y3 �ګ���[v�`�i ����zs{�{�k-� ���O^��r���� mܯ����� mۯ0����ش_�ճ-�������`�-�R�l�q-Vgn�oN���o�Jl�j�oQ9���o�9m�h�oy]-������u�81��o�3�ŵ7���7Эj2��5y/�h�\�Z<,q����� w��L��۶��5��4�o01ޞ��)���3=��Ơ-;�4P�N8���S߽��V� ګ��c9t<M��М5l�������P�V�ԍ�'C��nA�C̀��ᐦةf���������2	=@Ox@;zh���V�L7��4�9n��V��8>{����|b�+�=� ����܃M;}(�e���Gh�W(�'ΝD�P��Uc�����Kx�shX�'.[T|o�ʆs���X_[J��N(�5�%<�bf�a��Z�V� �A���]�;�v9�,�E������	�-��,+j��X9
�I�l|R�Bc�76?)G�1ɛ���И���&(�(4&�j�K����ݽ�#�s�{�<g����`�Y����v�W:��T5�����{����g��uM��.�����)k�*�R��5H�J�CP�jG��!���P�fᜅ��7��2$T��G8�!�*�C݇���B�ΓP�Z���y��x&���P��3἞��7�	7�gC՚����R���XE�XiM苌XE�XiM苌XE�X�j��2��&��2��&��B�R�V��(+�jE{/hL$V:ՊbјD���	R,����0A�Ec�R&H�hL"VJ�)�I�Ji� Ţ1�X��ZeY�ϼ��C���	+�<�&��x�	�]<9 ������۾��Xxb���n�QHc}���u{Nr�<֟�N��$��E��N��$��(�i�ۙ����d��t[Qr@�H��(�ҘD�zE��ud	Z�"V�CL���10����^#yA(y��p�b��1�W��H^�Iޤ^##yQ&y�zE���u�l	Z�"��CL���12�e��<�!�1��)Oz�Ɩ����]) ��$O�"R@I�vE��4&�<�9`��i�9 �I$OyzIHc�S����"�B�L����4&�<�9�9 �I$Oy�nHc"�S���/?}�	rZ�":F�P��+�c$��$Oy��
�xyF�����xyF�����xyF�����xyF�����xyF�����xyF�����xyF�����xyF�����xyF�����xyF��������˛�+"����7�WD��3B/oV����gd^�ǟ�a��@"�     