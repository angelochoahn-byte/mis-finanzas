-- Mis finanzas: tabla aparte dentro del mismo proyecto de Supabase del gimnasio.
-- No toca nada del gimnasio. Pegar completo en Supabase → SQL Editor → New query → Run.
create table if not exists public.fin_docs (
  owner      uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  col        text        not null,
  id         text        not null,
  data       jsonb       not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (owner, col, id)
);

-- Solo tú puedes ver o cambiar tus datos.
alter table public.fin_docs enable row level security;
drop policy if exists "solo el dueño" on public.fin_docs;
create policy "solo el dueño" on public.fin_docs
  for all to authenticated
  using (owner = (select auth.uid()))
  with check (owner = (select auth.uid()));
revoke all on public.fin_docs from anon;
grant select, insert, update, delete on public.fin_docs to authenticated;

-- Cambios en vivo entre el teléfono y la computadora.
do $$ begin
  alter publication supabase_realtime add table public.fin_docs;
exception when duplicate_object then null; end $$;
