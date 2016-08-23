--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dashboards (
    id integer NOT NULL,
    title character varying,
    organization_id integer,
    image character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dashboards_id_seq OWNED BY dashboards.id;


--
-- Name: integration_definitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE integration_definitions (
    id integer NOT NULL,
    identifier character varying,
    display_name character varying,
    oauth_url character varying,
    metrics json DEFAULT '{}'::json,
    actions json DEFAULT '{}'::json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subclass character varying
);


--
-- Name: integration_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE integration_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: integration_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE integration_definitions_id_seq OWNED BY integration_definitions.id;


--
-- Name: integrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE integrations (
    id integer NOT NULL,
    organization_id integer,
    integration_definition_id integer,
    name character varying DEFAULT ''::character varying,
    token character varying DEFAULT ''::character varying,
    dc character varying DEFAULT ''::character varying,
    api_key character varying DEFAULT ''::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE integrations_id_seq OWNED BY integrations.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    first_name character varying DEFAULT ''::character varying NOT NULL,
    last_name character varying DEFAULT ''::character varying NOT NULL,
    phone_number character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organization_id integer,
    user_role_id integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: widget_definitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE widget_definitions (
    id integer NOT NULL,
    name character varying,
    chart_settings hstore DEFAULT ''::hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    template character varying DEFAULT ''::character varying,
    data_settings hstore DEFAULT ''::hstore
);


--
-- Name: widget_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE widget_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: widget_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE widget_definitions_id_seq OWNED BY widget_definitions.id;


--
-- Name: widgets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE widgets (
    id integer NOT NULL,
    title character varying DEFAULT ''::character varying,
    dashboard_id integer,
    widget_definition_id integer,
    chart_settings hstore DEFAULT ''::hstore,
    data_settings hstore DEFAULT ''::hstore,
    dashboard_settings hstore DEFAULT ''::hstore,
    integration_id integer,
    integration_settings hstore DEFAULT ''::hstore,
    image character varying DEFAULT ''::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE widgets_id_seq OWNED BY widgets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboards ALTER COLUMN id SET DEFAULT nextval('dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY integration_definitions ALTER COLUMN id SET DEFAULT nextval('integration_definitions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY integrations ALTER COLUMN id SET DEFAULT nextval('integrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY widget_definitions ALTER COLUMN id SET DEFAULT nextval('widget_definitions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY widgets ALTER COLUMN id SET DEFAULT nextval('widgets_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: integration_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY integration_definitions
    ADD CONSTRAINT integration_definitions_pkey PRIMARY KEY (id);


--
-- Name: integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY integrations
    ADD CONSTRAINT integrations_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: widget_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY widget_definitions
    ADD CONSTRAINT widget_definitions_pkey PRIMARY KEY (id);


--
-- Name: widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- Name: index_dashboards_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dashboards_on_organization_id ON dashboards USING btree (organization_id);


--
-- Name: index_integrations_on_integration_definition_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_integrations_on_integration_definition_id ON integrations USING btree (integration_definition_id);


--
-- Name: index_integrations_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_integrations_on_organization_id ON integrations USING btree (organization_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_organization_id ON users USING btree (organization_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);


--
-- Name: index_users_on_user_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_user_role_id ON users USING btree (user_role_id);


--
-- Name: index_widgets_on_dashboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_widgets_on_dashboard_id ON widgets USING btree (dashboard_id);


--
-- Name: index_widgets_on_integration_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_widgets_on_integration_id ON widgets USING btree (integration_id);


--
-- Name: index_widgets_on_widget_definition_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_widgets_on_widget_definition_id ON widgets USING btree (widget_definition_id);


--
-- Name: fk_rails_1368d3db36; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT fk_rails_1368d3db36 FOREIGN KEY (dashboard_id) REFERENCES dashboards(id);


--
-- Name: fk_rails_3cc8835226; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT fk_rails_3cc8835226 FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_62ec986cec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY integrations
    ADD CONSTRAINT fk_rails_62ec986cec FOREIGN KEY (integration_definition_id) REFERENCES integration_definitions(id);


--
-- Name: fk_rails_65f59bbcf1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT fk_rails_65f59bbcf1 FOREIGN KEY (widget_definition_id) REFERENCES widget_definitions(id);


--
-- Name: fk_rails_755d734f25; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY integrations
    ADD CONSTRAINT fk_rails_755d734f25 FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_9b77ef7126; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT fk_rails_9b77ef7126 FOREIGN KEY (integration_id) REFERENCES integrations(id);


--
-- Name: fk_rails_d7b9ff90af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_d7b9ff90af FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_fa83e8f093; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_fa83e8f093 FOREIGN KEY (user_role_id) REFERENCES user_roles(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160805181912'), ('20160806155419'), ('20160806155825'), ('20160806160118'), ('20160810002509'), ('20160815224358'), ('20160816215134'), ('20160816220111'), ('20160816225021'), ('20160816225639'), ('20160816231817'), ('20160816231915'), ('20160817010059');


