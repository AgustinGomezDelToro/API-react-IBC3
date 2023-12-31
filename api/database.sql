create table
    public.employees (
        id bigint generated by default as identity not null,
        created_at timestamp with time zone null default now(),
        role text null,
        availabilities array null,
        api_key text null,
        name text null,
        constraint employees_pkey primary key (id),
        constraint employees_api_key_key unique (api_key),
        constraint employees_name_key unique (name)
    ) tablespace pg_default;

create table
    public.animals (
        id bigint generated by default as identity not null,
        created_at timestamp with time zone null default now(),
        name text null,
        species text null,
        space bigint not null,
        treatments array null,
        constraint animals_pkey primary key (id),
        constraint animals_space_fkey foreign key (space) references spaces (id) on delete cascade
    ) tablespace pg_default;

create table
    public.spaces (
        id bigint generated by default as identity not null,
        name character varying null,
        description character varying null,
        images array null,
        type character varying null,
        created_at timestamp with time zone null default now(),
        capacity bigint not null,
        duration text not null,
        openingHours array not null,
        closingHours array not null,
        disabledAccess boolean not null,
        maintenance boolean not null,
        upcomingMaintenanceDate array not null,
        constraint spaces_pkey primary key (id),
        constraint spaces_id_key unique (id),
        constraint spaces_name_key unique (name)
    ) tablespace pg_default;

create table
    public.tickets (
        id bigint generated by default as identity not null,
        created_at timestamp with time zone null default now(),
        constraint tickets_pkey primary key (id)
    ) tablespace pg_default;

create table
    public.users (
        id bigint generated by default as identity not null,
        name character varying not null,
        created_at timestamp with time zone null default now(),
        constraint users_pkey primary key (id)
    ) tablespace pg_default;
