-- Auth super admin
create user auth_admin;
alter user auth_admin with superuser createdb createrole replication bypassrls;

-- Extension namespacing
create schema if not exists extensions;
create extension if not exists "uuid-ossp"      with schema extensions;
create extension if not exists pgcrypto         with schema extensions;
create extension if not exists pgjwt            with schema extensions;

grant usage                     on schema public to postgres;
alter default privileges in schema public grant all on tables to postgres;
alter default privileges in schema public grant all on functions to postgres;
alter default privileges in schema public grant all on sequences to postgres;

-- Allow Extensions to be used in the API
grant usage                     on schema extensions to postgres;

-- Set up namespacing
alter user auth_admin SET search_path TO public, extensions; -- don't include the "auth" schema

-- These are required so that the users receive grants whenever "auth_admin" creates tables/function
alter default privileges for user auth_admin in schema public grant all
    on sequences to postgres;
alter default privileges for user auth_admin in schema public grant all
    on tables to postgres;
alter default privileges for user auth_admin in schema public grant all
    on functions to postgres;

