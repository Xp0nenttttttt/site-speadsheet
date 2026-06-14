-- Supabase schema for the redesigned site

create table if not exists public.profiles (
  id bigserial primary key,
  slug text not null unique default 'main',
  display_name text not null,
  image_url text,
  bio text,
  hours_played integer default 0,
  country_rank integer,
  global_rank integer,
  aredl_rank integer,
  pointercrate_rank integer,
  extremes_finished integer default 0,
  hardest_title text,
  hardest_rank text,
  custom_categories text[] default '{}'::text[],
  updated_at timestamptz default now()
);

create table if not exists public.levels (
  id bigserial primary key,
  profile_slug text not null default 'main',
  name text not null,
  status text not null default 'paused',
  difficulty text,
  top_rank text,
  completion_date date,
  attempts integer default 0,
  enjoyment numeric(3,1),
  worst_death text,
  progress integer default 0,
  image_url text,
  categories text[] default '{}'::text[],
  notes text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.profiles enable row level security;
alter table public.levels enable row level security;

do $$ begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'profiles' and policyname = 'Public read profiles'
  ) then
    create policy "Public read profiles"
    on public.profiles for select
    using (true);
  end if;
end $$;

do $$ begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'levels' and policyname = 'Public read levels'
  ) then
    create policy "Public read levels"
    on public.levels for select
    using (true);
  end if;
end $$;

-- Example profile row:
-- insert into public.profiles
-- (slug, display_name, image_url, bio, hours_played, country_rank, global_rank, aredl_rank, pointercrate_rank, extremes_finished, hardest_title, hardest_rank, custom_categories)
-- values
-- ('main', 'Spleen', 'https://...', 'Extreme Demons farm', 2600, 42, 312, 128, 94, 16, 'Slaughterhouse', '#7', array['timings','wave','ship']);
