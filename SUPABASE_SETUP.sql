-- SABINTA INVOICE - ONLINE SYNC
-- Jalankan seluruh SQL ini di Supabase > SQL Editor > New query

create table if not exists public.app_state (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

-- Untuk aplikasi single-user tanpa login.
-- Jika nanti ditambah login, policy ini sebaiknya diganti dengan policy berbasis auth.uid().
drop policy if exists "sabinta auth read" on public.app_state;
drop policy if exists "sabinta auth insert" on public.app_state;
drop policy if exists "sabinta auth update" on public.app_state;
drop policy if exists "sabinta auth delete" on public.app_state;

create policy "sabinta auth read"
on public.app_state for select
using (auth.uid() is not null);

create policy "sabinta auth insert"
on public.app_state for insert
with check (auth.uid() is not null);

create policy "sabinta auth update"
on public.app_state for update
using (auth.uid() is not null)
with check (auth.uid() is not null);

create policy "sabinta auth delete"
on public.app_state for delete
using (auth.uid() is not null);

-- Aktifkan Realtime untuk sinkronisasi antar perangkat.
alter table public.app_state replica identity full;

do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'app_state'
  ) then
    alter publication supabase_realtime add table public.app_state;
  end if;
end $$;
